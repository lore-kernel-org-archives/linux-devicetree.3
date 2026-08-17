Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF640D58F
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967500; cv=none; b=EiBYj/PciPAlLG337L/H2BdYISOCNdo1GmnBOLLaUnn0CWTlDgnQd9nD+zOqt0oyA87mGoNDLxfpEucz/0IK7iKyt+P+EVsYGoc72PomgazgQH69t6WmIV5ugqeyfERXXnHo+/sBHTJktbcNNveIp+9sHXf3nKxLKy4hM3W8o0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967500; c=relaxed/simple;
	bh=VhlfizA1DNFCCRvOIyqH/7PhqIEs/WuRZgBfuQk7vFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iezXyIqfU5o4vh83k6k2Ad3UNilDaocod1iqKjgv2ZVVRPK+doFWfq/AMZZ9IAGQUAPCi1hZRboq4W9RBYgYw8MQzaWLdCvGuRXA6IvuKze+DClDuVXnAq3S7bRwEyUGT73mkhZ9lTXo2bxD4bDgRop3lRC920V0srT6+oPKB+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O//bsols; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O//bsols"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051941F000E9;
	Mon, 17 Aug 2026 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786967499;
	bh=e0bGdnm8gRxZo2ivvklFYmnYg+NzW38/eoWNM9UR4oE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O//bsols/qO85DM2I8khQWy61T+JVWrlnKDpcVdYaaNRKkGpxkS3JrSB7gV7grvg4
	 3fkENCtOvV0IDtGisq2juyRwyjlIeeXtvO2tx9rpxPYxdiwmavjIrsaDxkJISkltfc
	 B4w+eHuZn4rQyomi61ENbD9eHRHVzBdB0ChmJkeDreilhUcoFzvjdVf7HOxZyJD7FK
	 1uQ2DdtFjpUANtHTQLLIAF4re0xTu97qo8UGV8znJZYotJqbbt4Pxn6nudLQw3m3qn
	 hBbcY0luSTo1GpA2Tnac8Y3R/E2FnLoMWzM/AAxGFe2kvz3mk1BxQJW5Xw4WuYKtOA
	 JtX8k6LS72EJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] rust: drm: add panel consumer abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Albert Esteve" <aesteve@redhat.com>
Cc: devicetree@vger.kernel.org, ojeda@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-drm_panel_bindings-v1-3-1f974508a31c@redhat.com>
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com>
 <20260817-drm_panel_bindings-v1-3-1f974508a31c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:51:38 +0000
Message-Id: <20260817115139.051941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Refcount underflow and use-after-free vulnerability in `Panel::fro=
m_of_node`.
- [High] Soundness hole in `Registration::register` allowing memory corrupt=
ion from safe Rust.
- [Low] Missing conditional compilation guard for `panel` module causing bu=
ild failures.
- [Low] Improper `#[cfg]` guard on `of_backlight` breaks the build for modu=
le configurations.
- [Low] Missing `#[inline]` annotations on small forwarding functions.
- [Low] Imports violate the kernel vertical import style.
--

--- Patch [3]: [PATCH 3/5] rust: drm: add panel consumer abstractions ---
commit e330c1b98aba78a95f008b2fccb2105d337a8df8
Author: Albert Esteve <aesteve@redhat.com>
rust: drm: add panel consumer abstractions

This commit adds a Rust abstraction for the DRM panel subsystem, providing
wrappers for the consumer side of the panel API. It introduces the `Panel`,
`PanelOrientation`, and `Registration` types, handling refcounting and devi=
ce
tree lookups.

> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 672ea8728e1c3..d1de5d448a1a5 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -9,6 +9,7 @@
>  pub mod gem;
>  pub mod gpuvm;
>  pub mod ioctl;
> +pub mod panel;

[Severity: Low]
Does this module need a conditional compilation guard?

If `CONFIG_DRM=3Dy` but `CONFIG_DRM_PANEL` is disabled, `panel.rs` will sti=
ll
be compiled.

However, `panel.rs` relies on C functions like `drm_panel_prepare`
which become static inline dummies in C when the config is disabled,
meaning bindgen won't export them and the Rust build will fail.

[ ... ]

> diff --git a/rust/kernel/drm/panel.rs b/rust/kernel/drm/panel.rs
> new file mode 100644
> index 0000000000000..fd21cc2236685
> --- /dev/null
> +++ b/rust/kernel/drm/panel.rs
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! DRM panel abstractions.
> +//!
> +//! C header: [`include/drm/drm_panel.h`](srctree/include/drm/drm_panel.=
h)
> +
> +use crate::drm::connector::Connector;
> +use crate::{
> +    bindings, error, of,
> +    prelude::*,
> +    sync::aref::{ARef, AlwaysRefCounted},
> +    types::Opaque,
> +};

[Severity: Low]
Could these imports be reformatted to follow the kernel's vertical import
style guidelines?

[ ... ]

> +    /// Returns the raw pointer to the underlying `struct drm_panel`.
> +    pub fn as_raw(&self) -> *mut bindings::drm_panel {
> +        self.0.get()
> +    }

[Severity: Low]
Should small forwarding functions like this one and `prepare()` below
have `#[inline]` annotations, as recommended by the Rust subsystem
guidelines for abstractions?

[ ... ]

> +    /// A typical implementation for a panel driver supporting device tr=
ee
> +    /// will call this function at probe time. Backlight will then be ha=
ndled
> +    /// transparently without requiring any intervention from the driver.
> +    #[cfg(CONFIG_BACKLIGHT_CLASS_DEVICE)]
> +    pub fn of_backlight(&self) -> Result<()> {
> +        // SAFETY: The type invariant guarantees the pointer is valid.
> +        error::to_result(unsafe { bindings::drm_panel_of_backlight(self.=
as_raw()) })?;
> +        Ok(())
> +    }

[Severity: Low]
Does this `#[cfg]` attribute handle the module build correctly?

If `CONFIG_BACKLIGHT_CLASS_DEVICE=3Dm`, the `#[cfg(CONFIG_BACKLIGHT_CLASS_D=
EVICE)]`
attribute evaluates to false, which entirely strips the `of_backlight` meth=
od
from the Rust API.

This would cause build failures for any Rust driver trying to call it, even
though the C fallback `drm_panel_of_backlight` stub exists.

> +
> +    /// Look up the panel associated with the given device tree node.
> +    ///
> +    /// Searches the set of registered panels for one that matches the g=
iven device
> +    /// tree node. If a matching panel is found, return a pointer to it.
> +    pub fn from_of_node(node: &of::Node) -> Result<ARef<Self>> {
> +        // SAFETY: `node.as_raw()` is a valid device_node pointer.
> +        let panel =3D error::from_err_ptr(unsafe { bindings::of_drm_find=
_panel(node.as_raw()) })?;
> +
> +        // SAFETY: `from_err_ptr` guarantees a non-null pointer on succe=
ss.
> +        // `of_drm_find_panel` returns a kref-incremented reference.
> +        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(panel).cast())=
 })
> +    }

[Severity: High]
Does `of_drm_find_panel` actually increment the refcount as the comment sta=
tes?

Looking at the C implementation, `of_drm_find_panel()` returns a raw pointer
but does not increment the panel's `kref` internally.

By wrapping this pointer directly in `ARef::from_raw()`, the Rust code assu=
mes
ownership of a refcount increment that didn't happen. When the resulting
`ARef` is dropped, it will call `drm_panel_put()` and cause a refcount
underflow, leading to a use-after-free.

[ ... ]

> +/// A registration of a panel to the global panel registry.
> +pub struct Registration(ARef<Panel>);
> +
> +impl Registration {
> +    /// Registers a panel with the global panel registry.
> +    pub fn register(panel: ARef<Panel>) -> Self {
> +        // SAFETY: The type invariant guarantees the pointer is valid.
> +        unsafe { bindings::drm_panel_add(panel.as_raw()) };
> +        Self(panel)
> +    }

[Severity: High]
Is it safe to expose this as a safe function taking an `ARef<Panel>`?

If a safe caller passes an already registered panel (for instance, one
obtained via `from_of_node`, or by cloning the `ARef` and calling
`Registration::register()` twice), this will unconditionally call
`drm_panel_add()`.

In C, `drm_panel_add()` executes `list_add_tail(&panel->list, &panel_list)`.
If the panel is already on a list, this will corrupt the global linked list
pointers. This seems to allow memory corruption from entirely safe Rust cod=
e.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-drm_panel_=
bindings-v1-0-1f974508a31c@redhat.com?part=3D3
