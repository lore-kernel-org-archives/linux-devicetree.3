Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7D400E18
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218985; cv=none; b=oOdJGh4u94k5Z8Egsc2grqAwX82QRvt9mxa+bDzzNiUzbrlURrZCTb7Mh4D2jULzRgkzAgH73GOkQKbh+btRzdHttzDtuQifJsI1E2xUXa/ApSeV8I7Ulla2VSuig9UVtgLMKOcakqvG3eAMjhp17ZZSPa8S04G23XLgNRHxvGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218985; c=relaxed/simple;
	bh=0x3CsPGQoLWlT9+oS19quN4mVeRuNS5Omn5syIjUDWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TCRkdErQ6R0lnj/bl0U/E1XsegbpHyiJ/ivEAeR8k3du/ErI9Zb1OOfBISx/UUVjG9JVdCdlb2rXrmDSpkSxTQaaSVzSJPuFtkEuvgkVN59StCEINCuQncdHdmvCtzfEs/ar3DTO8w1DqfLYbD6d0ViFbxMxfB211N8yDiiQWI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4bCW62K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4bCW62K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44E31F000E9;
	Thu, 20 Aug 2026 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787218974;
	bh=8Uhd8dNOZhc0HcLF+79ADABPuGHZMbduJJiwCaGoUa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F4bCW62KGMgRh7XNYdz6lnsM2jZXl0UDDBYjmaKF4F7YqX9whf/x59l05TpxASIwp
	 BGL/a2cxCVygET1PQiEjm5Uwqqwj1VP4BYJGU1Ae+JDYXMrO98JQJ68cvRv1mzJydU
	 hT31WQePBLNtwgns0ARYqXRzOdklOHu6HyGn+QM46j4MGh5z+zT1gjmuWY/TbHBasK
	 +ARWxDNgYy4S0fk+CcxE6RJLq2jA8oFrip4Irnvdr5WC+/YBlXci6NqzG0IroRZGdi
	 ulOjurVJEG7F28rdSaUxO9kyvBpq7+XuaFp47okhlYbt3ah1xIWZyS5uXjPza3Xz0+
	 3+W/qZFminn0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] rust: kernel: Add greybus abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: conor+dt@kernel.org, ojeda@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-gb-uart-transport-v1-4-282da14ab7b7@beagleboard.org>
References: <20260820-gb-uart-transport-v1-0-282da14ab7b7@beagleboard.org>
 <20260820-gb-uart-transport-v1-4-282da14ab7b7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 09:42:53 +0000
Message-Id: <20260820094253.B44E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] `Registration::drop` frees driver private data before calling =
`gb_hd_del()`, allowing Use-After-Free in concurrent callbacks.
- [High] Missing and incorrect `Send`/`Sync` bounds on Greybus types break =
async usage and Rust thread safety.
- [High] `Message` does not implement `Drop`, allowing drivers to silently =
leak active operations.
- [High] `message_cancel` bypasses ownership guarantees, allowing an aliase=
d `Message` to be constructed by value.
- [High] The `Registration` API leaks the `gb_host_device` memory and crash=
es by calling `device_del` on an un-added device on error paths.
- [High] Safe Rust API allows double-free of gb_operation if a driver compl=
etes a message and then returns an error.
- [Medium] `HdDriver::message_send` ignores the provided `gfp_mask`, breaki=
ng context-aware memory allocation.
- [Low] Conditional compilation of `greybus` abstraction causes linker erro=
rs when `CONFIG_GREYBUS=3Dm`.
- [Low] Missing `// INVARIANT:` comments on struct constructions.
- [Low] Missing `#[inline]` annotations on abstraction wrappers.
--

--- Patch [4]: [PATCH 4/7] rust: kernel: Add greybus abstractions ---
commit a8c7543823c875208896bddcd8e1e440536e1645
Author: Ayush Singh <ayush@beagleboard.org>

rust: kernel: Add greybus abstractions
   =20
Add Rust abstractions for the Greybus core, enough to implement a
Greybus host driver in Rust.

> diff --git a/rust/kernel/greybus/hd.rs b/rust/kernel/greybus/hd.rs
> index 0000000000000..56435074f8dc8
> --- /dev/null
> +++ b/rust/kernel/greybus/hd.rs
[ ... ]
> +    unsafe extern "C" fn message_send(
> +        hd: *mut bindings::gb_host_device,
> +        dest_cport_id: u16,
> +        msg: *mut bindings::gb_message,
> +        _gfp_mask: bindings::gfp_t,
> +    ) -> c_int {

[Severity: Medium]
Does this ignore the provided _gfp_mask? If it is not passed to the driver
implementation, safe Rust drivers lack the context to determine whether they
can sleep (e.g., if they need to allocate memory to queue the message),
which could lead to might_sleep() panics.

> +        // SAFETY: `gb_host_device` and `HostDevice` have the same layou=
t.
> +        let hd =3D unsafe { Device::<device::CoreInternal<'_>>::from_raw=
(hd) };
> +        // SAFETY: `message_send` is only ever called after a successful=
 call to
> +        // `gb_hd_add`, hence it's guaranteed that `Device::set_drvdata(=
)` has been called
> +        // and stored a `Pin<KBox<T>>`.
> +        let data =3D unsafe { hd.as_ref().drvdata_borrow() };
> +        // SAFETY: The caller guarantees `msg` is valid for the duration=
 of this call.
> +        let msg =3D unsafe { Message::from_raw(msg) };
> +
> +        match T::message_send(&data, dest_cport_id, msg) {
> +            Ok(()) =3D> 0,
> +            Err(e) =3D> e.to_errno(),
> +        }
> +    }

[Severity: High]
Does this safe Rust API allow a double-free of gb_operation?

If a driver completes a message by calling msg.sent() (which drops the
operation refcount) and then returns Err(e), this wrapper propagates the
error back to the C core.

The C core will then unconditionally drop the operation refcount again in
gb_operation_request_send(), resulting in a use-after-free.

> +
> +    /// # Safety
> +    ///
> +    /// `msg` must point at a valid message of a registered host device =
of this driver.
> +    unsafe extern "C" fn message_cancel(msg: *mut bindings::gb_message) {
> +        // SAFETY: The caller guarantees `msg` is valid for the duration=
 of this call.
> +        let msg =3D unsafe { Message::from_raw(msg) };
> +
> +        T::message_cancel(msg);
> +    }

[Severity: High]
Does message_cancel bypass ownership guarantees by constructing an aliased
Message by value?

If the driver had previously received this same gb_message and stashed it
for asynchronous processing, there are now two owned Message instances
representing the same underlying C struct. A safe driver could call
msg.sent() on both, leading to a double-free.

[ ... ]
> +    pub fn new(
> +        parent: &device::Device,
> +        buffer_size_max: usize,
> +        num_cports: usize,
> +        data: impl PinInit<T, Error>,
> +    ) -> Result<Self> {
[ ... ]
> +        let res =3D Self {
> +            ptr: NonNull::new(hd).ok_or(code::ENOMEM)?,
> +            _data: PhantomData,
> +        };

[Severity: Low]
Are we missing an // INVARIANT: comment on this struct construction, as
required by subsystem/rust.md?

> +
> +        res.add()?;
> +
> +        Ok(res)
> +    }

[Severity: High]
If res.add() fails, res is dropped and Registration::drop() is invoked,
which calls gb_hd_del().

Since gb_hd_add() never succeeded, does calling device_del() via
gb_hd_del() on an un-added device trigger a kobject crash?

[ ... ]
> +impl<T> Registration<T> {
> +    fn add(&self) -> Result<()> {

[Severity: Low]
Should this small forwarding function have an #[inline] annotation, as per
the subsystem guidelines?

[ ... ]
> +impl<T> Drop for Registration<T> {
> +    fn drop<'a>(&'a mut self) {
> +        {
> +            let hd =3D self.as_raw();
> +            // SAFETY: By the type invariant `hd` points at a valid host=
 device, and
> +            // `gb_host_device` and `Device` have the same layout.
> +            let hd_dev =3D unsafe { &*hd.cast::<Device<device::CoreInter=
nal<'a>>>() };
> +            // SAFETY: The driver data was set to a `T` in `Registration=
::new()` and has not been
> +            // taken since, and this is the only place that takes it.
> +            let data =3D unsafe { hd_dev.as_ref().drvdata_obtain::<T>() =
};
> +            drop(data);
> +        }
> +
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a=
 pointer to a valid
> +        // `struct gb_host_device`.
> +        unsafe { bindings::gb_hd_del(self.as_raw()) }
> +    }
> +}

[Severity: Critical]
By destroying the private data T before calling gb_hd_del(), could this lead
to a use-after-free in concurrent callbacks?

gb_hd_del() is synchronous and flushes active connections. This flushing can
trigger the C core to send responses via message_send. The message_send
callback borrows the driver data, which was already freed here.

[Severity: High]
After removing the device, does Registration::drop() need to call
gb_hd_put() to release the refcount?

gb_hd_create() returns a device with a refcount of 1. By never calling
gb_hd_put(), it appears the host device memory is permanently leaked upon
unregistering.

> +
> +// SAFETY: The greybus host device API is thread-safe as guaranteed by t=
he device core, as long as
> +// gb_hd_del() is guaranteed to only be called once - which is guarantee=
d by our type not
> +// having Copy/Clone.
> +unsafe impl<T> Send for Registration<T> {}

[Severity: High]
Does this Send implementation require a T: Send bound?

Without it, a safe consumer could create a Registration<T> where T is !Send,
move it to another thread, and drop it, causing a !Send type to be dropped
concurrently.

> diff --git a/rust/kernel/greybus/mod.rs b/rust/kernel/greybus/mod.rs
> index 0000000000000..5dd1941574cf8
> --- /dev/null
> +++ b/rust/kernel/greybus/mod.rs
[ ... ]
> +/// A Greybus message handed to a host driver for transmission.
> +///
> +/// # Invariants
> +///
> +/// The shared reference is only ever handed out for the duration of a [=
`HdDriver`] callback, during
> +/// which the Greybus core guarantees the message and its buffer stay al=
ive.
> +#[repr(transparent)]
> +pub struct Message(NonNull<bindings::gb_message>);

[Severity: High]
Is there a reason this struct doesn't implement Send? Without it, safe
asynchronous drivers cannot queue operations to worker threads.

[Severity: High]
Does this struct need a Drop implementation to prevent silent resource leak=
s?

If a driver simply drops the Message struct without calling sent(), the
underlying C gb_operation is permanently leaked.

> +
> +impl Message {
> +    /// # Safety
> +    ///
> +    /// `ptr` must be non-null and point at a valid `struct gb_message` =
which outlives the
> +    /// returned `Self`.
> +    #[inline]
> +    pub(crate) const unsafe fn from_raw(ptr: *mut bindings::gb_message) =
-> Self {
> +        // SAFETY: The caller guarantees `ptr` is non-null.
> +        Self(unsafe { NonNull::new_unchecked(ptr) })
> +    }

[Severity: Low]
Is this struct construction missing an // INVARIANT: comment, as required
by the subsystem guidelines?

> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 17af6e7969751..6d6378ade24ea 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
[ ... ]
> @@ -77,6 +77,8 @@
>  pub mod fs;
>  #[cfg(CONFIG_GPU_BUDDY =3D "y")]
>  pub mod gpu;
> +#[cfg(CONFIG_GREYBUS)]
> +pub mod greybus;

[Severity: Low]
Does this cause linker errors when CONFIG_GREYBUS is built as a loadable
module?

When it is configured as =3Dm, the build system still passes
--cfg=3DCONFIG_GREYBUS to rustc. This statically compiles the module into
vmlinux, leading to undefined references to C symbols like gb_hd_create
which only exist in the dynamically loadable greybus.ko module.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-gb-uart-tr=
ansport-v1-0-282da14ab7b7@beagleboard.org?part=3D4
