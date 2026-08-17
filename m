Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB13B2FFC
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967597; cv=none; b=jfDfpuUKWDhvJIqkR3UUf8olEXfg/t/J7aAo8jwoCc3pq0bXN/PxwpjEw84igpv3161H0IC7NWQPuej1HM6yKLcgvICfT/E+SR2kF5e2yLVw7+jqJZusE9FwVX55Y49pb9ofeOVc4eYElEVL5FRyEyFu3RXQidusZWnkCFkXdrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967597; c=relaxed/simple;
	bh=jJZKRiE8Wq/g0nWrc0kwz8nRuABDYtNk97o89QnoVgg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dVI003q8aUbFE9vTuoWdi4c1OvgTF2OOnxRJT8OrICfREVAYfEZe9CWeH69BdXcG0ODuPhbT+npeopWsKJOdt9nAeh1aYGohhjmoqo6jaPbhu0O1Q5UKRDoNS9gVe6P8cfVhmnxTheldZobZjm/DC/dK2w/oSBEO1h30vkywr6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJP/Jf+j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJP/Jf+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3951F000E9;
	Mon, 17 Aug 2026 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786967596;
	bh=oXwCi74vhX8XCR1asdMFQyXeo0u/PZQn7r1sg63fA8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJP/Jf+j/7yIoDjdSGrrFT2SDCkr1dyNoVfDKBvSZS3o3lHYAfYrgFm0NS5gGWQtH
	 qlY19xxqC3+9Smuj7Uct+mJQqZ3eQlAzQQ9OM0A4mcHR8PA8skP90aS8aKemSdMM6T
	 XYHFdD5wMJUt4p9i0iPtopdFeMO0RtihWFL4dKAe78qQcNBt16j2oIptLUrWnWUNBF
	 z7qPZ+i1jLGHRqFYFYDtrL7UM4fY+rlTaIiJ6dozWXWf+toKyvQlyHl6VUgvJ0YsQb
	 hjgTI6Cw9uA2RtI5EsfTB2SSCe3x2FFSDP/yiup680hilw5gcZadwZ03afinG71bIu
	 cWlXQS0DWkDeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] rust: drm: add panel producer abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Albert Esteve" <aesteve@redhat.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, ojeda@kernel.org
In-Reply-To: <20260817-drm_panel_bindings-v1-4-1f974508a31c@redhat.com>
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com>
 <20260817-drm_panel_bindings-v1-4-1f974508a31c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:53:15 +0000
Message-Id: <20260817115315.CD3951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] `Panel::new` steals the devres-owned reference count initializ=
ed by `__devm_drm_panel_alloc`, leading to a double-free on device unbind o=
r drop.
- [Critical] The destructor of the driver data `T` is tied to device unbind=
 via devres, rather than the panel's actual reference count, creating a spl=
it-lifetime Use-After-Free.
- [High] Missing `Send`, `Sync`, and `'static` bounds on the driver data ty=
pe `T` in `Panel::new` allows data races and Use-After-Free via non-thread-=
safe or short-lived types.

Pre-existing issues:
- [Critical] `Panel::from_of_node` improperly converts the result of `of_dr=
m_find_panel` into an `ARef<Panel>` without incrementing the refcount, caus=
ing a premature free.
--

--- Patch [4]: [PATCH 4/5] rust: drm: add panel producer abstractions ---
commit 0e243089bb12e5256a62894a39811280cadcb027
Author: Albert Esteve <aesteve@redhat.com>
Subject: rust: drm: add panel producer abstractions

This commit adds abstractions for DRM panel drivers, introducing the
PanelFuncs trait and PanelContainer struct. It provides devres-managed
allocation via __devm_drm_panel_alloc and ties the lifetime of the=20
data to the device.

> diff --git a/rust/kernel/drm/panel.rs b/rust/kernel/drm/panel.rs
> index fd21cc2236685..8f87774e06ed7 100644
> --- a/rust/kernel/drm/panel.rs
> +++ b/rust/kernel/drm/panel.rs

[ ... ]

> @@ -139,6 +143,66 @@ pub fn from_of_node(node: &of::Node) -> Result<ARef<=
Self>> {
>          // `of_drm_find_panel` returns a kref-incremented reference.
>          Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(panel).cast())=
 })
>      }

[Severity: Critical]
This is a pre-existing issue, but does of_drm_find_panel actually increment
the reference count?

Looking at the C implementation, of_drm_find_panel iterates over the global
panel_list and returns the pointer without calling kref_get or
drm_panel_get. If we consume the pointer directly with ARef::from_raw(),
dropping the ARef will decrement the refcount. Could this drop the refcount
to zero and prematurely free the panel while the provider driver's devres
still owns it?

> +
> +    /// Allocates and initialises a device-managed panel.
> +    ///
> +    /// `data` is embedded in the same allocation as the `drm_panel` and=
 its
> +    /// destructor is called automatically when `dev` is unbound.
> +    ///
> +    /// Use [`Registration::register`] to add the panel to the global re=
gistry
> +    /// once it is ready to be used by display drivers.
> +    pub fn new<T: PanelFuncs>(
> +        dev: &Device,
> +        data: T,
> +        connector_type: ConnectorType,
> +    ) -> Result<ARef<Self>> {

[Severity: High]
Does T need Send, Sync, and 'static bounds here?

Since Panel::new takes ownership of T and stores it in a heap allocation
accessed by the concurrent C DRM subsystem, safe Rust code could provide a
non-thread-safe type (like one containing Cell or Rc) or a short-lived
reference. Would this allow data races or use-after-free when the C DRM
core concurrently invokes vtable callbacks?

> +        // SAFETY: `dev` is valid by its type invariants; `PanelFuncsVTa=
ble::build()`
> +        // returns a valid, static `drm_panel_funcs` pointer.
> +        let container =3D error::from_err_ptr(unsafe {
> +            bindings::__devm_drm_panel_alloc(
> +                dev.as_raw(),
> +                core::mem::size_of::<PanelContainer<T>>(),
> +                core::mem::offset_of!(PanelContainer<T>, panel),
> +                PanelFuncsVTable::<T>::build(),
> +                connector_type as i32,
> +            )
> +        })? as *mut PanelContainer<T>;
> +
> +        // SAFETY: `container` is a valid pointer to uninitialized memor=
y.
> +        unsafe {
> +            core::ptr::write(
> +                core::ptr::addr_of_mut!((*container).data),
> +                ManuallyDrop::new(data),
> +            )
> +        };
> +
> +        // SAFETY:
> +        // - `dev.as_raw()` is a pointer to a valid and bound device.
> +        // - `container.cast()` is a valid pointer to the initialized `P=
anelContainer<T>`.
> +        error::to_result(unsafe {
> +            // `devm_add_action_or_reset` calls `drop_panel_data` on fai=
lure, so `data`
> +            // is dropped even if this registration fails.
> +            // Registering after `__devm_drm_panel_alloc` ensures devres=
 LIFO order:
> +            // `drop_panel_data` runs before `kfree(container)`.
> +            bindings::devm_add_action_or_reset(
> +                dev.as_raw(),
> +                Some(drop_panel_data::<T>),
> +                container.cast(),
> +            )

[Severity: Critical]
Is it safe to tie the destruction of T to device unbind rather than the
panel's reference count?

Since the panel is reference-counted and exposed as an ARef<Panel>, consumer
drivers could keep the panel alive after the provider device unbinds. When
unbind occurs, drop_panel_data will destroy T. If a consumer later calls
a panel method like get_modes, the C code will invoke the Rust vtable
callbacks which operate on the dropped T, potentially leading to a
use-after-free.

> +        })?;
> +
> +        // SAFETY: `__devm_drm_panel_alloc` was successful, hence `conta=
iner` is
> +        // valid and the `drm_panel` at this offset is initialised.
> +        let raw =3D unsafe {
> +            (container as *mut u8)
> +                .add(core::mem::offset_of!(PanelContainer<T>, panel))
> +                .cast::<bindings::drm_panel>()
> +        };
> +
> +        // SAFETY: `__devm_drm_panel_alloc` was successful, hence `raw` =
is valid
> +        // and the refcount is non-zero.
> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(raw).cast()) })

[Severity: Critical]
Does ARef::from_raw steal the devres-owned reference count here?

__devm_drm_panel_alloc initializes the panel's refcount to 1 and immediately
registers a devres action (drm_panel_put_void) that owns this reference.
Wrapping the raw pointer directly with ARef::from_raw without incrementing
the refcount means both ARef and devres think they own the same refcount.

When the ARef is dropped, won't it free the panel via __drm_panel_free,
causing a double-free later when device unbind triggers the devres action?

> +    }
>  }

[ ... ]

> +/// Operations implemented by a DRM panel driver.
> +///
> +/// Implement this trait to provide a DRM panel driver and its callbacks=
. Use
> +/// [`Panel::new`] to allocate the panel, passing the driver data as `T`.
> +///
> +/// C header: [`include/drm/drm_panel.h`](srctree/include/drm/drm_panel.=
h)
> +#[vtable]
> +pub trait PanelFuncs {

[Severity: High]
Should this trait require Send, Sync, and 'static supertraits?

Similar to the missing bounds in Panel::new(), without these supertraits,
types implementing PanelFuncs might contain thread-unsafe primitives
or short-lived references, which could cause data races or use-after-free
when accessed concurrently by the DRM subsystem.

> +    /// Turn on panel and perform set up.

[ ... ]

> +// Devres action: run T's destructor before `kfree(container)`.
> +//
> +// # Safety
> +//
> +// `ptr` must be the base of a live `PanelContainer<T>` whose `data` fie=
ld was
> +// initialised by `Panel::new` and has not yet been dropped.
> +unsafe extern "C" fn drop_panel_data<T>(ptr: *mut core::ffi::c_void) {
> +    // SAFETY: Caller guarantees `ptr` is the base of a live `PanelConta=
iner<T>`
> +    // with an initialised `data` field. `data` is at offset 0, so `ptr =
as *mut T`
> +    // is valid.
> +    unsafe { core::ptr::drop_in_place(ptr as *mut T) };

[Severity: Critical]
Does this execute the destructor while the container might still be alive?

If a consumer driver still holds an ARef<Panel>, the container's reference
count is non-zero. Since drop_panel_data is called unconditionally on
device unbind, won't drop_in_place destroy T while it could still be
accessed via the panel's vtable callbacks?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-drm_panel_=
bindings-v1-0-1f974508a31c@redhat.com?part=3D4
