# swift-property-ownership

Cross-domain integration for Property, Ownership, and Tagged.

This package owns the `Property.Borrow` and `Property.Inout` accessor families.
Each accessor stores an Ownership reference under the property's phantom tag,
with typed and value-generic refinements that let downstream domains attach
read-only or write-through behavior without duplicating storage.
