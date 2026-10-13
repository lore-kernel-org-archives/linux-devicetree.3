Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A668A13D53C
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895687; cv=none; b=e4MoCwqhDq2564AaTFFFLSqh4fXdLzWYZQJS8Indev+VgIA4fVcpRC23ZphdZKD2vrAVX57hF4CsK6QM/Tx4uRoC4WHHhx+Hebvsp4n+H3k/Gqu6PmJQObiqM5onVT6GJCihD4qfHeaIdemW2UZPAXzRQwUsOs18qHCHlHQyPQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895687; c=relaxed/simple;
	bh=9heYegikZiO2vq9h6PXpNtM3i+xqEgmr3YoEnP/PXbc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=padZdvp8a5QfzdYIKClJnO7btrmluic4zdhzTbbPlK+86+uANuZxWZ1tSKShAAsA2KAkGKdBGmbPAFAngZejhus4PQs7ekikLuwqgql0M00zxk/o6l183BMiNddylSTu+IBLRr5Ktqve10dTUaFL88J1GjTpv3+I5z9MW9zNUuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyxlVt3I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyxlVt3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBB21F0089C;
	Tue, 13 Oct 2026 12:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791895685;
	bh=W5ZlcwT6aJ2TaPXbqJoYDIvDB7S6H0GHHn51JqUITbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RyxlVt3ICOYqptKo0Bo6zIkm2PmrMpAdu1sFBqeY8DxeqXZW23aOs9OTb/vuOJHSW
	 ZhUGC/gso7LcZLzDbrghMyWV8+lLRM6DqgUEOXJoV7EC0+vfGX7c2voB+f9KLYHVUG
	 JEYjprGd9r5pEtm/uF3sK8ckVoZWDKqbma1zIanxLcARnL9LmMvlDr7oPyAvUjp+bs
	 DEKpQJeFwnem9OQvJqk3XmKS6p29HTQyS9ySF59yvG0D9mMgdQd0dV6SwRnpOYL7Th
	 6I+bDkpY/yYGESB1AN1Kblh5SrCSk1b/WV6ol+Z5qpUaPmoU0CYbsNhaY58+Fv29Lk
	 OtIMHKqZdupIA==
Message-ID: <sashiko-outbox-169737@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] rust: kernel: Add greybus abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261013-gb-uart-transport-v3-4-81d0a8a1acf7@beagleboard.org>
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
 <20261013-gb-uart-transport-v3-4-81d0a8a1acf7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 12:48:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] greybus: safe Connection methods allow UAF of parent devices
- [High] greybus: rust: UAF of driver data due to eager drop in Registratio=
n::drop
- [Low] rust: missing #[inline] on trivial abstraction functions
- [Low] rust: missing // INVARIANT comment and size validation in GbOperati=
onMsgHdr
--

commit 75320c1f601296bad85db7371e32bc7e97df53b7
Author: Ayush Singh <ayush@beagleboard.org>

rust: kernel: Add greybus abstractions

This commit adds Rust abstractions for the Greybus core to support implemen=
ting
Greybus host drivers in Rust. The abstractions cover the APIs used by gb-so=
ftsvc
and gb-uart-node drivers, including host device registration, connection ma=
nagement,
and SVC protocol structures. It also introduces lifetime and ownership rule=
s for
Greybus messages and callbacks within the Rust bindings.

> diff --git a/rust/kernel/greybus/hd.rs b/rust/kernel/greybus/hd.rs
> --- /dev/null
> +++ b/rust/kernel/greybus/hd.rs

[ ... ]

> +    unsafe extern "C" fn message_send(
> +        hd: *mut bindings::gb_host_device,
> +        dest_cport_id: u16,
> +        msg: *mut bindings::gb_message,
> +        gfp_mask: bindings::gfp_t,
> +    ) -> c_int {
> +        // SAFETY: gb_host_device and HostDevice have the same layout.
> +        let hd =3D unsafe { Device::<device::CoreInternal<'_>>::from_raw=
(hd) };
> +        // SAFETY: message_send is only ever called after a successful c=
all to
> +        // gb_hd_add, hence it's guaranteed that Device::set_drvdata() h=
as been called
> +        // and stored a Pin<KBox<T>>.
> +        let data =3D unsafe { hd.as_ref().drvdata_borrow() };
> +        // SAFETY: The caller guarantees msg is valid for the duration o=
f this call.
> +        let msg =3D unsafe { Message::from_raw(msg) };
> +
> +        match T::message_send(&data, dest_cport_id, msg, Flags::new(gfp_=
mask)) {

[Severity: High]
Does this code allow a use-after-free of the driver data?

Thread A could initiate a request through gb_operation_request_send(), which
calls this message_send wrapper without taking locks that serialize against
deletion. This wrapper borrows the driver data T via drvdata_borrow() and
invokes T::message_send().

If the hardware receives the request and replies immediately, the response =
can
be processed by gb_operation_work() in a workqueue, dropping the operation's
active count to 0. Meanwhile, if Thread B executes Registration::drop and
calls gb_hd_del(), it cancels operations. Since the active count is 0,
wait_event(!gb_operation_is_active(operation)) returns immediately without
waiting for message_send to return.

When gb_hd_del() finishes, Registration::drop eagerly extracts and drops
the driver data. If Thread A was preempted inside T::message_send or before
returning to C, it could resume execution and access the freed driver data.

[ ... ]

> +    /// Looks up the connection bound to cport on interface id.
> +    pub fn find_connection_by_intf(&self, id: u8, cport: u16) -> Option<=
ARef<Connection>> {

[Severity: Low]
This isn't a bug, but should this trivial abstraction function have an
#[inline] attribute? The Rust subsystem guidelines recommend #[inline] for
functions forwarding to a C binding call.

> +        // SAFETY: By the type invariant of Self, self.as_raw() is a poi=
nter to a valid
> +        // struct gb_host_device.
> +        let ptr =3D NonNull::new(unsafe {
> +            bindings::gb_connection_hd_find_by_intf(self.as_raw(), id, c=
port)
> +        })?;
> +
> +        // SAFETY: ptr is a valid gb_connection
> +        Some(unsafe { ARef::from_raw(ptr.cast()) })
> +    }
> +}

[ ... ]

> +impl<T> Registration<T> {
> +    fn as_raw(&self) -> *mut bindings::gb_host_device {

[Severity: Low]
This isn't a bug, but this small wrapper function is missing the #[inline]
attribute, which the Rust subsystem guidelines recommend for trivial getters
in abstractions.

> +        self.ptr.as_ptr()
> +    }
> +}

[ ... ]

> +impl<T> Drop for Registration<T> {
> +    fn drop<'a>(&'a mut self) {
> +        // SAFETY: By the type invariant of Self, self.as_raw() is a poi=
nter to a valid
> +        // struct gb_host_device.
> +        unsafe { bindings::gb_hd_del(self.as_raw()) }
> +
> +        {
> +            // SAFETY: hd is a valid pointer to gb_host_device.
> +            let hd_dev =3D unsafe { Device::<device::CoreInternal<'_>>::=
from_raw(self.as_raw()) };
> +            // SAFETY: The driver data was set to a T in Registration::n=
ew() and has not been
> +            // taken since, and this is the only place that takes it.
> +            drop(unsafe { hd_dev.as_ref().drvdata_obtain::<T>() });

[Severity: High]
Can the eager drop of driver data here lead to a use-after-free if
message_send is still executing concurrently?

Since gb_hd_del() may return without waiting for message_send if the
operation's active count drops to 0 (e.g., from an immediate hardware respo=
nse),
we might drop the driver data while Thread A is still executing the wrapper
or driver code referencing it.

> +        }
> +
> +        // SAFETY: By the type invariant of Self, self.as_raw() is a poi=
nter to a valid
> +        // struct gb_host_device.
> +        unsafe { bindings::gb_hd_put(self.as_raw()) };
> +    }
> +}

> diff --git a/rust/kernel/greybus/mod.rs b/rust/kernel/greybus/mod.rs
> --- /dev/null
> +++ b/rust/kernel/greybus/mod.rs

[ ... ]

> +    /// Returns the payload, i.e. the message without its operation head=
er.
> +    pub const fn payload_bytes(&self) -> &[u8] {

[Severity: Low]
This isn't a bug, but should this small abstraction getter have an #[inline]
attribute? The Rust subsystem guidelines recommend it for trivial abstracti=
ons.

> +        // SAFETY: By the type invariant the message is valid.
> +        let payload =3D unsafe { (*self.0.get()).payload };

[ ... ]

> +    /// Returns the interface at the far end of the connection.  In case=
s like SVC connection,
> +    /// interface can be NULL.
> +    #[inline]
> +    pub const fn interface(&self) -> Option<&Interface> {
> +        // SAFETY: By the type invariant the connection is valid.
> +        let intf_ptr =3D unsafe { (*self.0.get()).intf };
> +
> +        if intf_ptr.is_null() {
> +            None
> +        } else {
> +            // SAFETY: By the previous check,  intf_ptr is valid.
> +            Some(unsafe { Interface::from_raw(intf_ptr) })

[Severity: High]
Does this code allow for a use-after-free of the parent interface?

Device::find_connection_by_intf returns an ARef<Connection>, which safely
increments the gb_connection kref. This allows the Rust driver to hold the
connection alive indefinitely.

In C, gb_connection_create() assigns raw pointers to its parent gb_interface
and gb_host_device but does not take a reference count on them.

During hardware removal, the Greybus core can destroy the interface and host
device when their own refcounts drop to zero. The gb_connection remains ali=
ve
due to the outstanding Rust ARef, but its intf and hd pointers become
dangling.

Calling interface() on the retained Connection unsafely derives a safe Rust
reference &Interface from a dangling pointer.

> +        }
> +    }
> +
> +    /// Returns the CPort id this connection uses on the interface.
> +    #[inline]
> +    pub const fn intf_cport_id(&self) -> u16 {
> +        // SAFETY: By the type invariant the connection is valid.
> +        unsafe { (*self.0.get()).intf_cport_id }
> +    }
> +
> +    /// Returns the CPort id this connection uses on the host device.
> +    #[inline]
> +    pub const fn hd_cport_id(&self) -> u16 {
> +        // SAFETY: By the type invariant the connection is valid.
> +        unsafe { (*self.0.get()).hd_cport_id }
> +    }
> +
> +    /// Returns the host device this connection belongs to.
> +    #[inline]
> +    pub const fn host_device(&self) -> &hd::Device {
> +        // SAFETY: By the type invariant the connection is valid, and it=
s hd is alive for as
> +        // long as the connection is.
> +        unsafe { hd::Device::from_raw((*self.0.get()).hd) }

[Severity: High]
Does this code allow for a use-after-free of the host device?

Similar to interface(), the hd pointer in gb_connection is not kept alive
by the connection's own reference count. If the parent device goes away, th=
is
can safely return a reference to a dangling pointer if the connection is st=
ill
held via ARef<Connection>.

> +    }
> +}

> diff --git a/rust/kernel/greybus/protocols.rs b/rust/kernel/greybus/proto=
cols.rs
> --- /dev/null
> +++ b/rust/kernel/greybus/protocols.rs

[ ... ]

> +/// The header every Greybus message starts with.
> +///
> +/// # Invariants
> +///
> +/// The size field covers the header and the payload that follows it.
> +#[repr(transparent)]
> +pub struct GbOperationMsgHdr(bindings::gb_operation_msg_hdr);
> +
> +// SAFETY: gb_operation_msg_hdr is a POD type with no padding and no int=
erior mutability.
> +unsafe impl kernel::transmute::AsBytes for GbOperationMsgHdr {}
> +
> +impl GbOperationMsgHdr {
> +    /// Builds a header. size is the whole message, this header included.
> +    #[inline]
> +    pub const fn new(size: u16, operation_id: u16, type_: u8, result: u8=
) -> Self {
> +        Self(bindings::gb_operation_msg_hdr {
> +            size: size.to_le(),

[Severity: Low]
Does this constructor violate the documented invariant for this struct?

The struct defines an # Invariants section documenting that the size field
covers the header and the payload that follows it. However, the constructor
accepts any size: u16 without validation (e.g., ensuring it is at least the
minimum header size), allowing safe code to construct a header that structu=
rally
violates its own invariant.

Also, the Rust subsystem guidelines mandate that constructing a struct with=
 an
# Invariants section must be accompanied by an // INVARIANT: comment
explaining how the invariant is upheld, which appears to be missing here.

> +            operation_id: operation_id.to_le(),
> +            type_,
> +            result,
> +            pad: [0u8; 2],
> +        })
> +    }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gb-uart-tr=
ansport-v3-0-81d0a8a1acf7@beagleboard.org?part=3D4
