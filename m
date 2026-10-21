Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583754;
	b=KBJ4vT3qj0WVpZlKm1OdzaNVknoc9ZnuPbgbubObHph5Kx6EuRBW0JxlYFzqXMbS/wNk
	 sGk4ix8y3cNqoENAbiuPMXqvQuoJRQrVJW+i4GWSr2E8GyLpXglVQSHHR0GNPbkN/89cl
	 QT5C/i0Q0TQuADcvxA5N/NI7VbRMHelY9JP4bA/s/RP6ukAluusZdmwaAfzDHUJacrx4W
	 3olMViU0v6BygVVsAoz+4n3UOkJ860R+TEqke0/03k8oulqF08w4rbnwfQ+pnMK9EdDNY
	 13Nv9mkCDn4im8/uq6dsBxzwmSGKd00IzgPjASZIDpfq7OBtbf/nRGx5TIaiXnMhJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583754;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9uODF+ytiuF/j/yb22xydDM1M0mp1Ycjp1D17FXC/m8=;
	b=nIWVbK4Q7RLtV7/Kuu2Cw0FkSp8Cf/fwgotvvmdE725/OcGK1xNbZMO9N4JXGmzLx6gd
	 QFDlxDttrtM6YaTrzSMHi42OLmm2fgnGnwaG1LMIJxyHuB3zb5KDjt97TMRDHUCqqTUGw
	 VByTCfQInAmbATy8FMccvQ0PTkD5YqqvcRAkjw6E1Q0IPsy4M27RgfinSvZNor3U4c9Zo
	 LRiH/SLBMx808uiZkywpmBbt0Px3X5H863MtxmOm02TIsVUvGWe0tKVtns4tEEr2M1nmz
	 xFPOR+ROvTN9r83ZtERDCyWez91xKJzNgebd6SmeNzinNEF7ktH1/MU//CUHpUP7bMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6L8oerH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD309606A32F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l6L8oerH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524FC1F000C5;
	Wed, 21 Oct 2026 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583753;
	bh=9uODF+ytiuF/j/yb22xydDM1M0mp1Ycjp1D17FXC/m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6L8oerHusp1hNBsZJ6i42qad+U0Dh1QT/ML0u743Eks6FXwjTGHNW6Bd6CJjm100
	 m+oz27Cftr6RSpg7uNy4YmNPNe1q8nMZjI2NDRLu7o8QvL9yWgvUKITn2O5SY62IEf
	 ZxYlMkWlBJtvrz8vTV33lizs/ezKY9nHdltqw667+V0lBVaIpCapcINkIeDHTbIh+l
	 ravDfxPBa9e8zkfsXCk1XOm0wewaLH+O51WblgZl/zMOIlUQk7ymcOS3Y7z5h5ywMU
	 TKwVcGOS/A8FTwLFQZ2GF6MhWDSmRUVkYpXdHBS81BosRKa6+3wlJFCrRpetALnCLr
	 nHmQM7Rt3sggQ==
Message-ID: <sashiko-outbox-180195@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] rust: kernel: Add greybus abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261021-gb-uart-transport-v4-3-c308ce821d45@beagleboard.org>
References: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
 <20261021-gb-uart-transport-v4-3-c308ce821d45@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 11:55:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] rust: greybus: AlwaysRefCounted implemented for all Device<Ctx> =
contexts
- [Medium] rust: greybus: Interface implements AlwaysRefCounted without Sen=
d and Sync
- [Low] rust: greybus: broken rustdoc links and outdated HdDriver example
--

commit 31981649b53fe9bea7a30ae6afc505468e2c2736
Author: Ayush Singh <ayush@beagleboard.org>

rust: kernel: Add greybus abstractions

This patch adds Rust abstractions for the Greybus core, host devices, and
wire protocol definitions to support implementing Greybus host drivers in
Rust.

> diff --git a/rust/kernel/greybus/hd.rs b/rust/kernel/greybus/hd.rs
> new file mode 100644
> index 0000000000000..45a2d53ee80f5
> --- /dev/null
> +++ b/rust/kernel/greybus/hd.rs
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Greybus host device abstractions.

[ ... ]

> +//! # Examples
> +//!
> +//! ```ignore
> +//! use kernel::{device, prelude::*};
> +//!
> +//! struct MyHd {
> +//!     // transport state
> +//! }
> +//!
> +//! #[vtable]
> +//! impl HdDriver for MyHd {
> +//!     fn message_send(data: &Self, hd: &Device, dest_cport_id: u16, ms=
g: Message) -> Result {
> +//!         // Copy what is needed out of `msg`, queue it, and return wi=
thout sleeping.
> +//!         // Call `HostDevice::message_sent()` once the core may relea=
se the message.
> +//!         Ok(())
> +//!     }
> +//!
> +//!     fn message_cancel(_msg: Message) {}\n> +//! }
> +//!
> +//! fn probe(parent: &device::Device) -> Result<Registration<MyHd>> {
> +//!     Registration::new(parent, BUFFER_SIZE_MAX, NUM_CPORTS, try_pin_i=
nit!(MyHd {}))
> +//! }
> +//! ```

[Severity: Low]
Are this HdDriver example and the intra-doc links in rust/kernel/greybus/hd=
.rs
and rust/kernel/greybus/mod.rs out of date with the current API?

In rust/kernel/greybus/hd.rs, the HdDriver example uses outdated signatures
for message_send() (missing gfp_mask: Flags and taking msg: Message by value
instead of &Message) and message_cancel() (taking _msg: Message by value
instead of &Message). It also instructs the driver to call a nonexistent
HostDevice::message_sent() method, whereas HdDriverVTable::message_send()
automatically calls msg.sent(hd, 0) when T::message_send() returns Ok(()).

In addition, the doc comment on Device in rust/kernel/greybus/hd.rs links to
ARef<HostDevice> instead of ARef<Device>, and the doc comments on the module
and on Message in rust/kernel/greybus/mod.rs contain unresolved intra-doc
links to HostDevice and HdDriver, neither of which is in scope in
rust/kernel/greybus/mod.rs (where HostDevice was renamed to hd::Device and
hd::Registration, and HdDriver is at hd::HdDriver).

[ ... ]

> +/// A Greybus host device.
> +///
> +/// # Invariants
> +///
> +/// The wrapped value is a valid `struct gb_host_device` created by `gb_=
hd_create()`, and every
> +/// [`ARef<HostDevice>`](crate::sync::aref::ARef) owns an increment on i=
ts reference count.
> +#[repr(transparent)]
> +pub struct Device<Ctx =3D device::Normal> {
> +    ptr: Opaque<bindings::gb_host_device>,
> +    _ctx: PhantomData<Ctx>,
> +}
> +
> +// SAFETY: `gb_host_device` is reference counted through its embedded `s=
truct device`, which may be
> +// used from any thread.
> +unsafe impl<Ctx> Send for Device<Ctx> {}
> +
> +// SAFETY: `gb_host_device` has its own internal locking, so it is safe =
to share references to it
> +// across threads.
> +unsafe impl<Ctx> Sync for Device<Ctx> {}
> +
> +// SAFETY: The embedded `struct device` carries the reference count, and=
 `gb_hd_put()` is just
> +// `put_device()` on it, so the object stays alive for as long as increm=
ents are outstanding.
> +unsafe impl<Ctx> AlwaysRefCounted for Device<Ctx> {
> +    #[inline]
> +    fn inc_ref(&self) {
> +        // SAFETY: By the type invariant there is a live reference to th=
e host device, and `dev` is
> +        // its embedded `struct device`.
> +        unsafe { bindings::get_device(&raw mut (*self.ptr.get()).dev) };
> +    }
> +
> +    #[inline]
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The caller guarantees it owns an increment on the ref=
erence count.
> +        unsafe { bindings::gb_hd_put(obj.as_ptr().cast()) }
> +    }
> +}

[ ... ]

> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<C=
tx> {
> +    #[inline]
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct gb_host_device`. `dev` points to a valid `struct devi=
ce`.
> +        unsafe { device::Device::from_raw(addr_of_mut!((*self.as_raw()).=
dev)) }
> +    }
> +}

[ ... ]

> +impl<T> Drop for Registration<T> {
> +    fn drop<'a>(&'a mut self) {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct gb_host_device`.
> +        unsafe { bindings::gb_hd_del(self.as_raw()) }
> +
> +        {
> +            // SAFETY: `hd` is a valid pointer to `gb_host_device`.
> +            let hd_dev =3D unsafe { Device::<device::CoreInternal<'_>>::=
from_raw(self.as_raw()) };
> +            // SAFETY: The driver data was set to a `T` in `Registration=
::new()` and has not been
> +            // taken since, and this is the only place that takes it.
> +            drop(unsafe { hd_dev.as_ref().drvdata_obtain::<T>() });
> +        }
> +
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct gb_host_device`.
> +        unsafe { bindings::gb_hd_put(self.as_raw()) };
> +    }
> +}

[Severity: Medium]
Does implementing AlwaysRefCounted, Send, and Sync generically for Device<C=
tx>
across all Ctx type parameters in rust/kernel/greybus/hd.rs violate the
device::DeviceContext soundness requirement?

In rust/kernel/device.rs, the DeviceContext guidelines state that
AlwaysRefCounted must only be implemented for Device<device::Normal> and ne=
ver
for any other DeviceContext, because non-Normal contexts (such as Bound,
BoundInternal, Core, and CoreInternal) are only valid within a specific
scope.

Here in rust/kernel/greybus/hd.rs, pub struct Device<Ctx =3D device::Normal>
does not constrain Ctx: device::DeviceContext and implements AlwaysRefCount=
ed
for all Ctx, while Device::as_ref() implements AsRef<device::Device<Ctx>> f=
or
all Ctx: device::DeviceContext.

If a scoped reference &Device<Ctx> (such as Device<device::CoreInternal<'_>>
in HdDriverVTable::message_send() or Device<device::Bound>) is converted via
ARef::from() into an ARef<Device<Ctx>>, it only increments the underlying
struct device reference count via get_device(). Once Registration<T>::drop()
runs gb_hd_del() and frees the driver private data via drvdata_obtain::<T>(=
),
any surviving ARef<Device<Ctx>> can still be converted via Device::as_ref()
into &device::Device<Ctx> with the scoped context preserved, allowing access
to driver private data after it has been freed.

Should Device instead bound Ctx: device::DeviceContext =3D device::Normal,
implement AlwaysRefCounted only for Device (that is, Device<device::Normal>=
),
and use kernel::impl_device_context_deref!(unsafe { Device }) and
kernel::impl_device_context_into_aref!(Device)?

> diff --git a/rust/kernel/greybus/mod.rs b/rust/kernel/greybus/mod.rs
> new file mode 100644
> index 0000000000000..ea9dc954d0634
> --- /dev/null
> +++ b/rust/kernel/greybus/mod.rs
> @@ -0,0 +1,220 @@

[ ... ]

> +/// A Greybus interface.
> +///
> +/// # Invariants
> +///
> +/// The wrapped value is a valid `struct gb_interface`.
> +#[repr(transparent)]
> +pub struct Interface(Opaque<bindings::gb_interface>);
> +
> +impl Interface {
> +    /// Returns the interface id, unique within its host device.
> +    #[inline]
> +    pub const fn id(&self) -> u8 {
> +        // SAFETY: By the type invariant the interface is valid.
> +        unsafe { (*self.0.get()).interface_id }
> +    }
> +}
> +
> +// SAFETY: The embedded `struct device` carries the reference count, whi=
ch `get_device()` and
> +// `put_device()` manipulate, so the object stays alive for as long as i=
ncrements are outstanding.
> +unsafe impl AlwaysRefCounted for Interface {
> +    #[inline]
> +    fn inc_ref(&self) {
> +        // SAFETY: By the type invariant there is a live reference to th=
e interface, and `dev` is
> +        // its embedded `struct device`.
> +        unsafe { bindings::get_device(&raw mut (*self.0.get()).dev) };
> +    }
> +
> +    #[inline]
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The caller guarantees it owns an increment on the ref=
erence count.
> +        unsafe {
> +            bindings::put_device(&raw mut (*obj.as_ptr().cast::<bindings=
::gb_interface>()).dev)
> +        }
> +    }
> +}

[Severity: Medium]
In rust/kernel/greybus/mod.rs, Interface implements AlwaysRefCounted, but is
it missing Send and Sync implementations?

Because Interface wraps Opaque<bindings::gb_interface>, which contains an
UnsafeCell and raw pointers, Interface is neither Send nor Sync by default.
In rust/kernel/sync/aref.rs, ARef<T> only implements Send and Sync when
T: AlwaysRefCounted + Sync + Send:

    unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
    unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}

As a result, if a Greybus host driver implementing HdDriver (which requires
Send + Sync + 'static) obtains an &Interface from Connection::interface() a=
nd
converts it into an ARef<Interface>, that ARef<Interface> cannot be stored =
in
the driver state (even inside a Mutex or SpinLock) or sent across threads.

Also, the commit message states that "some types such as Greybus Interface =
do
not implement AlwaysRefCounted at the moment", which contradicts this impl.
Should Interface implement Send and Sync here (and the commit message be
updated), or was AlwaysRefCounted not intended to be implemented on Interfa=
ce
yet?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-gb-uart-tr=
ansport-v4-0-c308ce821d45@beagleboard.org?part=3D3
