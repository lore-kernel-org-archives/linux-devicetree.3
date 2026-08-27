Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A693C8717
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818375; cv=none; b=h6Z089SQtId4slIpJB/5n+bGyyZPQKJruourX6NV69Lf47uUF4nWgOWuOUW5hK0LMHPWR/48rHqQeddbSshgdOgU4yZmp0BH77YA5pM4ZK5Sr8IEWBxTVd9q1/roq87mXTcFSU8/Pps5rAmgzDDO9itBIwH0Cp/b3vZ4D7sTOME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818375; c=relaxed/simple;
	bh=5SRxA7q9wAEA8gFr3rKq0wMNp/cZNVI81YJeV2jL06A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s+1W8/jc3gJAln1EwD8KG7U4FEJd+EHQzXucQsUCiNaMG+JZoAYcgrrontIfaE936LNanlZBp7QClUK3YiCtBgoHcnD8UR1LknXG9gveNoXCnK5VA+SQBi+mgKnQtBd3+KCGmSdjtRWwPRAAGmd3t4Zqsxh0vSB70QzVwkEW3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcK8hg8O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcK8hg8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6121F000E9;
	Thu, 27 Aug 2026 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787818369;
	bh=Wn4/nxLPXqRI0f/lZ10sYvLz7jw+5cIQfCQrbadM0vM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OcK8hg8Oj6TcHlCb4C4cz4Ye9mP3N8bbq8B3K9LMKUGo6SYN7bDk7SBGMRpqBJOy4
	 Y+Ahlhu86DbeQq9ezUuUVF3Dg+RW6sfBQGHoUK3L0m8AXdtHV+LVqgySocUGKnu1vX
	 MtKue5GtOBQe/BRvU5p2aapIyC2nSfDXom9FNaExNEAVylbYtvxe4U1ipVIl0E+HeT
	 Kf5NUNMebJllkhxlwjNRWqxLBRmYXFD+p81qdBz1r227xLTF/EKF9yWQHYJCUw7QA3
	 IoaxZHujcmzn7XWRbAkk/GwqzTFv70jNMXrmrfAw7oeP9PeE0iBWJ1ICwv+vk0JH4I
	 znsgPjGhr9QrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] rust: kernel: Add greybus abstractions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: ojeda@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827-gb-uart-transport-v2-4-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
 <20260827-gb-uart-transport-v2-4-a03bb1f5fbd1@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 08:12:48 +0000
Message-Id: <20260827081248.CA6121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Memory leak of `gb_host_device` and driver data on error paths in =
`Registration::new`
- [High] Use-After-Free in safe `Connection::host_device()` and `Connection=
::interface()` methods
- [High] Race condition causing Use-After-Free of driver data during `messa=
ge_send`
- [Medium] Kconfig selects GREYBUS without inheriting SYSFS dependency
- [Medium] Incomplete abstraction: `HdDriver::message_cancel` lacks access =
to driver state
- [Low] API Documentation erroneously instructs users to call a non-existen=
t method
- [Low] Erroneous safety justification masks protocol struct misunderstandi=
ng
--

commit aca3dd0934984891ba1944b198bd9679ec786c2e
Author: Ayush Singh <ayush@beagleboard.org>

rust: kernel: Add greybus abstractions

This commit adds Rust abstractions for the Greybus core, providing the
basic structures, host device abstractions, and protocol types needed to
implement a Greybus host driver in Rust.

> diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> --- a/drivers/greybus/Kconfig
> +++ b/drivers/greybus/Kconfig
[ ... ]
> +config RUST_GREYBUS_ABSTRACTIONS
> +	bool "Rust greybus abstractions"
> +	depends on RUST
> +	select GREYBUS
> +	help
> +	  This enables the Rust abstraction for the Greybus API.

[Severity: Medium]
Does this Kconfig entry miss a dependency on SYSFS?

The menuconfig GREYBUS depends on SYSFS. By using select GREYBUS here
without inheriting the depends on SYSFS clause, could this violate Kconfig
dependency rules and cause unmet direct dependency warnings or build
failures on minimal configurations where SYSFS is disabled?

> diff --git a/rust/kernel/greybus/hd.rs b/rust/kernel/greybus/hd.rs
> --- /dev/null
> +++ b/rust/kernel/greybus/hd.rs
[ ... ]
> +    /// Transmits `msg` to `dest_cport_id`.
> +    ///
> +    /// This may be called in atomic context and therefore must not slee=
p; queue the message and
> +    /// return. Once the core is allowed to release the message, call
> +    /// [`HostDevice::message_sent`].
> +    fn message_send(data: &Self, dest_cport_id: u16, msg: &Message, gfp_=
mask: Flags) -> Result;

[Severity: Low]
Is the documentation instructing users to call a non-existent method?

The comment mentions calling HostDevice::message_sent, but this method
does not seem to exist. The framework handles calling sent(0) automatically
when Ok(()) is returned. Should the documentation be updated to reflect the
actual API contract?

[ ... ]
> +    /// Aborts the transmission of a message previously handed to [`HdDr=
iver::message_send`].
> +    ///
> +    /// Always called in process context.
> +    fn message_cancel(msg: &Message);

[Severity: Medium]
Is there a way for a driver to safely access its private state when
cancelling a message?

To cancel a message, a driver typically must remove it from internal
hardware queues, which requires access to its private state. Since
message_cancel omits the &Self parameter (unlike message_send), drivers
might be forced to write unsafe code to chase pointers through the message's
connection to extract their data. Could we add &Self to the trait method?

[ ... ]
> +    pub fn new(
> +        parent: &device::Device,
> +        buffer_size_max: usize,
> +        num_cports: usize,
> +        data: impl PinInit<T, Error>,
> +    ) -> Result<Self> {
> +        // SAFETY: `parent` is a valid device, and the driver table is `=
'static`. The core only
> +        // ever reads through the driver pointer, so casting away `const=
` is fine.
> +        let hd =3D from_err_ptr(unsafe {
> +            bindings::gb_hd_create(
[ ... ]
> +            )
> +        })?;
> +
> +        // SAFETY: `hd` is a valid pointer to `gb_host_device`.
> +        let hd_dev: &Device<device::CoreInternal<'_>> =3D unsafe { Devic=
e::from_raw(hd) };
> +        hd_dev.as_ref().set_drvdata(data)?;
> +
> +        // SAFETY: By the type invariant the host device is valid, and i=
t has not been added yet.
> +        to_result(unsafe { bindings::gb_hd_add(hd) })?;

[Severity: High]
Can this leak the gb_host_device and pinned driver data on error paths?

bindings::gb_hd_create() allocates the gb_host_device and sets its reference
count to 1. If either set_drvdata or bindings::gb_hd_add fails, the ? opera=
tor
will return early.

Since the Registration structure hasn't been instantiated yet, its Drop
implementation won't run, meaning there is no cleanup to call gb_hd_put(hd)
or free the pinned driver data, causing a permanent leak.

[ ... ]
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

[Severity: High]
Does this create a use-after-free race condition with preempted message
send threads?

gb_hd_del() is invoked when Registration drops, and it returns synchronously
without waiting for all in-flight gb_message_send operations to finish.
The driver data (T) is immediately extracted and dropped following
gb_hd_del().

If a thread executing gb_operation_request_send is preempted just before
calling gb_message_send, it could resume and invoke the Rust message_send
wrapper, which calls hd.as_ref().drvdata_borrow() and passes a reference
of the freed T to the driver's implementation.

> diff --git a/rust/kernel/greybus/mod.rs b/rust/kernel/greybus/mod.rs
> --- /dev/null
> +++ b/rust/kernel/greybus/mod.rs
[ ... ]
> +    pub const fn interface(&self) -> Option<&Interface> {
> +        // SAFETY: By the type invariant the connection is valid.
> +        let intf_ptr =3D unsafe { (*self.0.get()).intf };
> +
> +        if intf_ptr.is_null() {
> +            None
> +        } else {
> +            // SAFETY: By the previous check,  intf_ptr is valid.
> +            Some(unsafe { Interface::from_raw(intf_ptr) })
> +        }
> +    }
[ ... ]
> +    pub const fn host_device(&self) -> &hd::Device {
> +        // SAFETY: By the type invariant the connection is valid, and it=
s `hd` is alive for as
> +        // long as the connection is.
> +        unsafe { hd::Device::from_raw((*self.0.get()).hd) }
> +    }

[Severity: High]
Can these methods lead to a use-after-free by returning a dangling pointer?

Safe Rust code can hold an ARef<Connection>, which increments the refcount
of the gb_connection. However, the Greybus core doesn't appear to take a
reference count on the gb_host_device or gb_interface stored in the
gb_connection structure.

When the device is disconnected, if the core frees the host device and
interface, won't this leave dangling pointers inside the still-alive
gb_connection? Calling Connection::interface() or Connection::host_device()
would then safely wrap and return these dangling raw pointers.

> diff --git a/rust/kernel/greybus/protocols.rs b/rust/kernel/greybus/proto=
cols.rs
> --- /dev/null
> +++ b/rust/kernel/greybus/protocols.rs
[ ... ]
> +/// Request for [`GB_SVC_TYPE_INTF_SET_PWRM`].
> +#[repr(transparent)]
> +pub struct GbSvcIntfSetPwrmRequest(bindings::gb_svc_intf_set_pwrm_reques=
t);
> +
> +// SAFETY: `gb_svc_intf_set_pwrm_request` is a struct of `u8` fields, so=
 every bit pattern of its
> +// size is a valid instance.
> +unsafe impl kernel::transmute::FromBytes for GbSvcIntfSetPwrmRequest {}

[Severity: Low]
Is the safety comment here factually accurate?

The comment claims the struct contains only u8 fields. However, the
underlying C structure actually contains __le32 quirks and two nested
struct gb_svc_l2_timer_cfg containing __le16 fields. While the FromBytes
implementation might still be safe due to the struct being packed and
composed of integers, could this justification mask a misunderstanding
of the hardware protocol layout?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-gb-uart-tr=
ansport-v2-0-a03bb1f5fbd1@beagleboard.org?part=3D4
