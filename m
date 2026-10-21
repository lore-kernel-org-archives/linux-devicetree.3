Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583871;
	b=IWoIemr4NqXr15gEyrBoynFB55DyUAKz3xRm7mjzuvAkZj1MzY0yChhecbJulqWRWj3n
	 tCgdYXiujxDhmkRM/5vLpFoL6DM8KJGR8ItuMHhHmfrowboThK4Mkm9LjBsU7/2JaW5ls
	 iVZBBhhy+GLg6Eje0dN+sKR5f1YR67NskB6r/Jq4J01YRK4qvus5hXNlqLX0w4s4eHJwt
	 PLsuPpAlFJcyRi6vy6pmFHRTk9/VgB/onqRhRLm9pncnsRflXgU1NAe8dgGl0LbdFqUuS
	 xu12Tlc//bsZpT9fN6GxkzvdIkfr8eYUc+WH/rB9htpkbUHISIREHf8uk1E3ZiKnW2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583871;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VkmOqEZ/v+YCEM73Cli4e/3W/7vqKladdwa2VKuAB1s=;
	b=RGnQm3Db83nHrQVzp2FGGifVVQeczA32oUJbyuovCD2wyRuyTTCmF6+X0D62uC2oVvk1
	 6zUE7pHQu7FeURE1dWlRy70NVTZAhk4v1B90or96iPHg4WAqp/ru/IpHi6vkrXm69uGLE
	 zzjlZNEEvvto8cqNJOoGm5DgUmnrxjUOmKs5I8haw428s2bxOuX3j23d+l32fFKKry9c4
	 P+Fa2jLCOFklO6722lWjsuT8jWTDG/oolR3gZ5yZ3ekD4dVIwa23TuQ4XmQtGzg858JBM
	 3cGAQ6KN25sB35bYmANweOOO/0eW41CAKsLNPmir9RkeGjpRnwkrTgwutQG7m+QHItQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNwcrcMV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E9606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNwcrcMV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7311F000C4;
	Wed, 21 Oct 2026 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583870;
	bh=VkmOqEZ/v+YCEM73Cli4e/3W/7vqKladdwa2VKuAB1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cNwcrcMVu9ywbXYXOgH9VpKFye78rflEQKTPsrgDS8OFvrpVMK0WJ20ihc7tuedZc
	 qGU8XVDrwIArmpl3zW3QwisEHE8cWkPhazA1J2+1kg3iZoo/mb+MsKYXFj42qO7CI7
	 XLdJLZovA+xSWSOLmlTJ2Nnbpk1tQA5N6QKy8zZl4zrYLppjEc5+8eDEBngIuFOFuZ
	 GXQplcqF6ES6tXj/MWl/3B0cxSRDcnPH/4SkaHEyS4hTJhlF22NK+FfvABisijuvxt
	 6wevR66mH5v+CohCC7KvxTPMDMnV+CyRdWXgCjyPW5cJumUQUi4U9D9sr7Gz1Qc6qy
	 BRFpcA6EQzqJQ==
Message-ID: <sashiko-outbox-180197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] drivers: greybus: Add software SVC
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261021-gb-uart-transport-v4-4-c308ce821d45@beagleboard.org>
References: <20261021-gb-uart-transport-v4-0-c308ce821d45@beagleboard.org>
 <20261021-gb-uart-transport-v4-4-c308ce821d45@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 11:57:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] greybus: gb_softsvc: synchronous data_rcvd() in message_send()=
 races timer
- [High] greybus: gb_softsvc: GLOBAL_STATE published before SVC handshake i=
n init()
- [High] greybus: gb_softsvc: premature intf_map removal and race in module=
_remove()
- [Medium] greybus: gb_softsvc: drop under spinlock and non-atomic loop in =
map_remove()
- [Medium] greybus: gb_softsvc: Svc::handler() leaks internal ENOTSUPP to u=
serspace
- [Low] greybus: gb_softsvc: stale API docs and wrong constant in refclk he=
lper
--

commit 911de474c435921e03dc8049b26a79b5e9a04e61
Author: Ayush Singh <ayush@beagleboard.org>

drivers: greybus: Add software SVC implementation

This commit adds gb-softsvc, an in-kernel Rust implementation of the Greybus
supervisory controller for transports that do not have a hardware controller
on the bus. It registers a Greybus host device and exposes an interface for
transport drivers to attach modules and exchange Greybus messages.

> diff --git a/drivers/greybus/gb_softsvc.rs b/drivers/greybus/gb_softsvc.rs
> new file mode 100644
> index 0000000000000..f88d9b3fd5655
> --- /dev/null
> +++ b/drivers/greybus/gb_softsvc.rs
> @@ -0,0 +1,520 @@

[ ... ]

> +impl Svc {

[ ... ]

> +    fn map_remove(&self, primary_id: u8, intf_count: u8, dev: &kernel::d=
evice::Device) {
> +        let id =3D match primary_id.checked_sub(INTF_ID_START) {
> +            Some(x) =3D> x,
> +            None =3D> {
> +                dev_warn!(dev, "Invalid interace id");
> +                return;
> +            }
> +        };
> +
> +        for i in 0..intf_count {
> +            let _ =3D self.intf_map.lock()[usize::from(id + i)].take();
> +        }
> +    }

[Severity: Medium]
In Svc::map_remove(), does the loop drop the removed Arc<dyn InterfaceOps>
while holding the intf_map spinlock, and clear multi-interface ranges
non-atomically?

Because let _ =3D self.intf_map.lock()[usize::from(id + i)].take(); uses a
wildcard pattern that does not bind the returned Option<Arc<dyn InterfaceOp=
s>>,
Rust drops the temporary Option<Arc<dyn InterfaceOps>> at the end of the
initializer expression before dropping the statement-scoped temporary spinl=
ock
Guard returned by self.intf_map.lock() at the semicolon. When intf_map holds
the last Arc reference, the transport driver's InterfaceOps destructor and
kfree run inside the SpinLock section.

In addition, acquiring and releasing self.intf_map on each iteration of the
0..intf_count loop rather than holding the lock across the entire range all=
ows
a concurrent Svc::map_insert() to observe a partially removed multi-interfa=
ce
window.

[ ... ]

> +    fn module_remove(&self, hd: &hd::Device, intf_id: u8, intf_count: u8=
) -> Result<()> {
> +        let payload =3D protocols::GbSvcModuleRemovedRequest::new(intf_i=
d);
> +        let res =3D self.send_request(hd, protocols::GB_SVC_TYPE_MODULE_=
REMOVED, payload);
> +
> +        if res.is_err() {
> +            dev_warn!(
> +                hd.as_ref(),
> +                "Failed to send module_removed svc request for {}",
> +                intf_id
> +            );
> +        }
> +
> +        self.map_remove(intf_id, intf_count, hd.as_ref());
> +
> +        Ok(())
> +    }

[Severity: High]
When Module::drop() calls Svc::module_remove(), can clearing self.intf_map
immediately after queuing GB_SVC_TYPE_MODULE_REMOVED race with asynchronous
Greybus core teardown and concurrent GbHdDriver::message_send() calls?

Svc::send_request() calls hd.data_rcvd(), which only queues operation->work
onto svc->connection->wq, and gb_svc_request_handler() then queues
gb_svc_process_module_removed() onto svc->wq. Until
gb_svc_process_module_removed() runs gb_module_del() on svc->wq, the old
module's struct gb_module, struct gb_interface, and struct gb_connection
objects remain active in hd->modules and hd->connections:

1. If Module::new() is called before gb_svc_process_module_removed() finish=
es
(or after send_request() in Svc::module_remove() fails), Svc::map_insert() =
can
reallocate the cleared intf_id to the new module while the old module is st=
ill
registered. Outbound messages on the old module's connections then look up
intf_by_id(intf_id) in GbHdDriver::message_send() and are misrouted to the =
new
module's InterfaceOps::write(), inbound messages from the new module via
Module::submit_message() match the old module's connections in
hd->connections, and gb_svc_process_module_inserted() rejects the new module
if the old gb_module is still present in hd->modules.

2. While gb_module_del() tears down the old module's connections on svc->wq,
clearing intf_map beforehand causes outgoing teardown messages to fail with
ENODEV.

3. In GbHdDriver::message_send(), data.0.intf_by_id() clones the
Arc<dyn InterfaceOps> and drops the intf_map spinlock before calling
intf.write(&buf, conn.intf_cport_id(), gfp_mask). Because Module::drop() do=
es
not synchronize with in-flight GbHdDriver::message_send() calls or wait for
connection teardown, InterfaceOps::write() can still execute after
Module::drop() returns, contrary to the doc comment on impl Drop for Module.

[ ... ]

> +    fn send_response<P: AsBytes>(
> +        &self,
> +        hd: &hd::Device,
> +        msg: &protocols::GbOperationMsgHdr,
> +        payload: P,
> +    ) {
> +        let msg =3D Msg::response(msg, 0, payload);
> +        hd.data_rcvd(protocols::GB_SVC_CPORT_ID, msg.as_bytes());
> +    }

[Severity: Critical]
When GbHdDriver::message_send() handles a request for GB_SVC_CPORT_ID by
synchronously calling Svc::handler() -> Svc::send_response() ->
hd.data_rcvd(), can the response completion race with timer setup in
gb_operation_request_send() and leave an active timer on a freed
struct gb_operation?

Every synchronous request sent by the Greybus core with a non-zero timeout
(such as gb_svc_pwrmon_rail_count_get(), gb_svc_intf_device_id(),
gb_svc_intf_set_power_mode(), gb_svc_intf_vsys_set(),
gb_svc_intf_refclk_set(), gb_svc_intf_unipro_set(), gb_svc_intf_activate(),
gb_svc_dme_peer_get(), gb_svc_dme_peer_set(), gb_svc_route_create(), and
gb_svc_connection_create()) calls gb_operation_sync_timeout() ->
gb_operation_request_send().

In drivers/greybus/operation.c:gb_operation_request_send(), gb_message_send=
()
is invoked before operation->timer is armed:

drivers/greybus/operation.c:gb_operation_request_send() {
    ...
	ret =3D gb_message_send(operation->request, gfp);
	if (ret)
		goto err_put_active;

	if (timeout) {
		operation->timer.expires =3D jiffies + msecs_to_jiffies(timeout);
		add_timer(&operation->timer);
	}
    ...
}

Because Svc::send_response() calls hd.data_rcvd() synchronously inside
GbHdDriver::message_send() before gb_message_send() returns,
gb_connection_recv_response() immediately queues operation->work
(gb_operation_work()) onto gb_operation_completion_wq (WQ_PERCPU):

drivers/greybus/operation.c:gb_operation_work() {
    ...
	} else {
		ret =3D timer_delete_sync(&operation->timer);
		if (!ret) {
			/* Cancel request message if scheduled by timeout. */
			if (gb_operation_result(operation) =3D=3D -ETIMEDOUT)
				gb_message_cancel(operation->request);
		}

		operation->callback(operation);
	}

	gb_operation_put_active(operation);
	gb_operation_put(operation);
}

If gb_operation_work() runs on another processor or preempts the sending
thread before gb_operation_request_send() reaches add_timer(&operation->tim=
er),
timer_delete_sync(&operation->timer) runs while the timer is still unarmed,
operation->callback() completes operation->completion, and the active
reference is dropped.

When the sending thread resumes in gb_operation_request_send(), it calls
add_timer(&operation->timer) on the already-completed operation;
wait_for_completion_interruptible() then returns immediately and
gb_operation_sync_timeout() calls gb_operation_put(operation), freeing
struct gb_operation to gb_operation_cache while operation->timer remains
queued in the timer wheel and causing a use-after-free in
gb_operation_timeout() when the timer expires.

[ ... ]

> +    fn intf_refclk_enable_disable(&self, hd: &hd::Device, hdr: &protocol=
s::GbOperationMsgHdr) {
> +        let payload =3D protocols::GbSvcIntfRefclkResponse::new(protocol=
s::GB_SVC_INTF_VSYS_OK);
> +        self.send_response(hd, hdr, payload);
> +    }

[Severity: Low]
This isn't a runtime bug since GB_SVC_INTF_VSYS_OK and GB_SVC_INTF_REFCLK_OK
both evaluate to 0x00, but should Svc::intf_refclk_enable_disable() pass
protocols::GB_SVC_INTF_REFCLK_OK to protocols::GbSvcIntfRefclkResponse::new=
()?

There are also a few minor comment and documentation mismatches in
drivers/greybus/gb_softsvc.rs and the commit description:

1. The commit description and the comments in Svc::conn_create() and
Svc::conn_destroy() refer to NodeOps, module_insert(), and module_remove(),
whereas the public trait and lifecycle interface are InterfaceOps,
Module::new(), and Drop for Module.

2. The doc comment on Module::new() refers to parameter node (now intfs) and
states that it returns the interface id rather than Result<Self>, while the
doc comment on Module::submit_message() states that it fails with EAGAIN if
the host device has not been brought up yet (which is checked in Module::ne=
w()
via GLOBAL_STATE, whereas Module::submit_message() calls
hd::Device::data_rcvd_by_intf() and only returns Ok(()) or EINVAL).

3. Svc::map_remove() logs "Invalid interace id" (missing 'f' in "interface"=
).

[ ... ]

> +            (true, protocols::GB_SVC_TYPE_PROTOCOL_VERSION) =3D> self.se=
nd_svc_hello(hd)?,
> +            (
> +                true,
> +                protocols::GB_SVC_TYPE_MODULE_INSERTED
> +                | protocols::GB_SVC_TYPE_SVC_HELLO
> +                | protocols::GB_SVC_TYPE_MODULE_REMOVED,
> +            ) =3D> {}
> +            _ =3D> return Err(code::ENOTSUPP),
> +        };
> +
> +        Ok(())
> +    }
> +}

[Severity: Medium]
Should the fallback arm in Svc::handler() return a standard user space error
code such as EOPNOTSUPP or EPROTONOSUPPORT instead of internal kernel errno
ENOTSUPP (524)?

When gb_softsvc sends GB_SVC_TYPE_SVC_HELLO and attaches a module via
Module::new() -> Svc::module_insert(), the Greybus core exposes the
intf_eject sysfs attribute on the greybus_svc device, the eject sysfs
attribute on the greybus_module device, and (because Svc::intf_activate()
reports GB_SVC_INTF_TYPE_GREYBUS and interface_power_is_visible() in
drivers/greybus/interface.c checks only intf->type) the voltage_now,
current_now, and power_now sysfs attributes on the interface device.

When user space reads voltage_now, current_now, or power_now or writes to
eject or intf_eject, the Greybus core sends
GB_SVC_TYPE_PWRMON_INTF_SAMPLE_GET or GB_SVC_TYPE_INTF_EJECT synchronously =
via
gb_operation_sync_timeout() -> gb_operation_request_send_sync_timeout() ->
gb_operation_request_send() -> gb_message_send() ->
HdDriverVTable::<GbHdDriver>::message_send() -> GbHdDriver::message_send() =
->
Svc::handler().

Unlike wire responses that pass through gb_operation_status_map(), the
Err(code::ENOTSUPP) returned from GbHdDriver::message_send() is propagated
directly by gb_operation_request_send() to the sysfs callbacks, leaking -524
(-ENOTSUPP) to user space.

> +
> +struct GbHdDriver(Arc<Svc>);
> +
> +#[vtable]
> +impl hd::HdDriver for GbHdDriver {
> +    fn message_send(
> +        data: &Self,
> +        hd: &hd::Device,
> +        dest_cport_id: u16,
> +        msg: &greybus::Message,
> +        gfp_mask: Flags,
> +    ) -> Result {
> +        if dest_cport_id =3D=3D protocols::GB_SVC_CPORT_ID {
> +            data.0.handler(hd, msg)
> +        } else {
> +            let conn =3D msg.operation().connection();
> +            let intf =3D data.0.intf_by_id(conn.interface().unwrap().id(=
))?;
> +
> +            let mut buf =3D KVec::with_capacity(msg.header().size().into=
(), gfp_mask)?;
> +
> +            buf.extend_from_slice(msg.header().as_bytes(), gfp_mask)?;
> +            buf.extend_from_slice(msg.payload_bytes(), gfp_mask)?;
> +
> +            intf.write(&buf, conn.intf_cport_id(), gfp_mask)
> +        }
> +    }
> +
> +    fn message_cancel(_msg: &greybus::Message) {}
> +}
> +
> +struct GreybusSoftSvc {
> +    _hd: hd::Registration<GbHdDriver>,
> +    _faux: faux::Registration,
> +}
> +
> +impl kernel::Module for GreybusSoftSvc {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        pr_info!("gb_softsvc (init)\n");
> +
> +        // SAFETY: This runs once at module init, before anything else c=
an reach `GLOBAL_STATE`.
> +        unsafe { GLOBAL_STATE.init() };
> +
> +        let faux =3D faux::Registration::new(c_str!("gb-softsvc"), None)=
?;
> +        let svc =3D Arc::pin_init(Svc::new(), GFP_KERNEL)?;
> +        let data =3D GbHdDriver(svc.clone());
> +
> +        let dev =3D faux.as_ref().as_ref();
> +        let hd =3D hd::Registration::new(dev, GB_OPERATION_SIZE_MAX, CPO=
RT_ID_MAX + 1, Ok(data))?;
> +
> +        svc.send_version(hd.as_ref())?;
> +
> +        let global_state =3D GlobalState::new(svc.clone(), hd.as_ref().i=
nto());
> +        let _ =3D GLOBAL_STATE.lock().replace(global_state);

[Severity: High]
In GreybusSoftSvc::init(), is GLOBAL_STATE published too early, before the
asynchronous GB_SVC_TYPE_PROTOCOL_VERSION and GB_SVC_TYPE_SVC_HELLO handsha=
ke
completes?

svc.send_version(hd.as_ref()) calls hd.data_rcvd(GB_SVC_CPORT_ID, ...), whi=
ch
invokes gb_connection_recv_request() and only queues operation->work onto t=
he
ordered workqueue svc->connection->wq without processing it synchronously.

In drivers/greybus/svc.c:gb_svc_request_handler(), the state machine remains
in GB_SVC_STATE_RESET until the work item for GB_SVC_TYPE_PROTOCOL_VERSION
runs, sends its response back to Svc::handler() to queue
Svc::send_svc_hello(), and the subsequent work item for GB_SVC_TYPE_SVC_HEL=
LO
transitions svc->state to GB_SVC_STATE_SVC_HELLO:

drivers/greybus/svc.c:gb_svc_request_handler() {
    ...
	switch (type) {
	case GB_SVC_TYPE_PROTOCOL_VERSION:
		if (svc->state !=3D GB_SVC_STATE_RESET)
			ret =3D -EINVAL;
		break;
	case GB_SVC_TYPE_SVC_HELLO:
		if (svc->state !=3D GB_SVC_STATE_PROTOCOL_VERSION)
			ret =3D -EINVAL;
		break;
	default:
		if (svc->state !=3D GB_SVC_STATE_SVC_HELLO)
			ret =3D -EINVAL;
		break;
	}
    ...
}

If a consumer driver calls Module::new() after GLOBAL_STATE is populated in
GreybusSoftSvc::init() but before the GB_SVC_TYPE_PROTOCOL_VERSION response
triggers Svc::send_svc_hello(), Module::new() sees GLOBAL_STATE is Some
(instead of returning EAGAIN) and calls state.svc.module_insert(), queuing
GB_SVC_TYPE_MODULE_INSERTED onto svc->connection->wq ahead of
GB_SVC_TYPE_SVC_HELLO.

When gb_svc_request_handler() processes GB_SVC_TYPE_MODULE_INSERTED while
svc->state !=3D GB_SVC_STATE_SVC_HELLO, it rejects the request with -EINVAL.
Because Svc::handler() ignores the response status for
GB_SVC_TYPE_MODULE_INSERTED, Module::new() returns Ok(Module) while no
gb_module or gb_interface is created in the Greybus core, and the allocated
interface ids and Arc<dyn InterfaceOps> entries remain occupied in
Svc::intf_map until Module is dropped.

[ ... ]

> +impl Module {
> +    /// Attaches `node` as a new module and returns the interface id ass=
igned to it.
> +    pub fn new(intfs: &[Arc<dyn InterfaceOps>]) -> Result<Self> {
> +        let Ok(intf_count) =3D u8::try_from(intfs.len()) else {
> +            return Err(code::E2BIG);
> +        };
> +
> +        if intf_count =3D=3D 0 {
> +            return Err(code::EINVAL);
> +        }
> +
> +        let guard =3D GLOBAL_STATE.lock();
> +        let state =3D guard.as_ref().ok_or(code::EAGAIN)?;
> +        let id =3D state.svc.module_insert(&state.gb_hd, intfs)?;
> +
> +        Ok(Self {
> +            id,
> +            intf_count,
> +            gb_hd: state.gb_hd.clone(),
> +            svc: state.svc.clone(),
> +        })
> +    }

[ ... ]

> +/// Dropping the module drops all the interfaces of the module. So none =
of the interface ops should
> +/// be called after this point.
> +impl Drop for Module {
> +    fn drop(&mut self) {
> +        let _ =3D self
> +            .svc
> +            .module_remove(&self.gb_hd, self.id, self.intf_count);
> +    }
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-gb-uart-tr=
ansport-v4-0-c308ce821d45@beagleboard.org?part=3D4
