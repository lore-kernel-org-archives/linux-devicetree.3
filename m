Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895275;
	b=1Q6EoagqhhrWyrKnNZsfVKlO9Q2g6cTKzjk+UAr+zgvExDVVvT7DtYmdDZLGNt6VKMMa
	 q27VVH1EhiiHPr3hYvZ6iRyWZxzkVNVEu9lbLrvsrA2+78fFZrFXbRzZezb6sKUyxjZN4
	 qUBxtcP2gBJsm1pX8szFBRhWxDjb1RBgcBQ37YNKV0oiWI5xiNac03xZAZNJlfY6+6Fzb
	 IL+c/vd/kLIosOk8NkfTU9XHfuB68PvHIHxNS8mFIUzNO57YcCeSkqvmYqa1RLH5Sbh0K
	 isqF6SHXhzWvVsFNqKu58wNV96CB5he3gMqTbxzZuiJ4Ho+KiKRMCnR26wDAFZeMiuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pdbw+qaSTeq0IVYMryGl3oIZ1SjctnIjI75Pl/OCwZ8=;
	b=weqdnMJBGPt7H/sxDh1QVdOgdjHt6niuxglk32zgTBcCyGrv9973RYmf1tbxbePQGzAZ
	 INQC4UI3L/Ev5H87NM8xhSTWGP1FXjZ6oHWsgXXihauEuISYzB9IBNPKP5vGgUNn1TymN
	 sjFu5b7tJ+OeoFu6oK2F868j0QQcKxdGlE2+aZYGqzvRjises8ZTO/dnEyas9noHxG9Ox
	 pMzXhOBDQ3chR6kBU7pefqQ60ORTBTe6M8JC/wOWnsfGOZ96Oj0sin3N2GMYag7zbuDld
	 U7qf9kCcAseDRksiMLZfyhAUfqA0ErhoX5H3MHsVLxL56g5uYp6cIjThOGEV2XjeGaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWKcYJ6W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BDC606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWKcYJ6W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C181F000C1;
	Thu,  5 Nov 2026 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895274;
	bh=Pdbw+qaSTeq0IVYMryGl3oIZ1SjctnIjI75Pl/OCwZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gWKcYJ6WukJFUNiYBiDDTH+43DAaHviV4hs7HZYEoWHFgrI9XnA3WfzbKYSiFjitz
	 HUWtB+YBs9vXsDUtkLqqdZ1DDx010MkE3ZhwcEM/OTfF8DTkHMN2gSUzwRJM0p+QXi
	 Kk24fJswyNoBushZ1nsDjSAURMCYUcxfxREqax3NoQaO9yWe73rkMfCRk8/5Xs3CMe
	 nHimzxR30uXv3cmS7Tn6JdPqTrp7pXSqVRniJ9cQ3VzkwrW/F3H3Dv2y/TT9ZjkriB
	 +dhzCAU7UUZ8nK0PXe7zjCFYxsqLOxEhpRTTMQ0GboR4RwVbhcZ+eBYerTmfErdvxS
	 qZleqhmF8YxxA==
Message-ID: <sashiko-outbox-199461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 RESEND 3/6] firmware: smccc: lfa: Register ACPI
 notification
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102165421.3651202-4-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
 <20261102165421.3651202-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:14:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] firmware: smccc: lfa: inverted error check in lfa_smccc_probe(=
) tears down on 0
- [High] firmware: smccc: lfa: missing component cleanup on error in lfa_sm=
ccc_probe()
- [High] firmware: smccc: lfa: stale fw_seq_id used in activate_pending_com=
ponents()
- [High] firmware: smccc: lfa: infinite loop in prime_fw_component() when r=
etry is set
- [High] firmware: smccc: lfa: race with remove_invalid_fw_components() on =
activation
- [Medium] firmware: smccc: lfa: dangling ACPI companion pointer in lfa_rem=
ove_acpi()
- [Low] firmware: smccc: lfa: unused DRIVER_NAME macro and stale commit des=
cription
--

commit 9b467f592a89b6ca0bddc96f9df536713b9c357c
Author: Vedashree Vidwans <vvidwans@nvidia.com>

firmware: smccc: lfa: Register ACPI notification

This commit adds ACPI notification support for Arm Live Firmware Activation
(LFA) so the platform can notify the kernel when pending firmware component
updates are ready to be primed and activated.

>     firmware: smccc: lfa: Register ACPI notification
>    =20
>     The Arm LFA spec describes an ACPI notification mechanism, where the
>     platform (firmware) can notify an LFA client about newly available
>     firmware imag updates ("pending images" in LFA terms).
>    =20
>     Add a faux device after discovering the existence of an LFA agent via
>     the SMCCC discovery mechnism, and use that device to check for the AC=
PI
>     notification description. Register this when one is provided.
>    =20
>     The notification just conveys the fact that at least one firmware ima=
ge
>     has now a pending update, it doesn't say which, also there could be m=
ore
>     than one pending. Loop through all images to find every which needs to
>     be activated, and trigger the activation. We need to do this is a loo=
p,
>     since an activation might change the number and the status of availab=
le
>     images.
>    =20
>     Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
>     [Andre: convert from platform driver to smccc bus]
>     Signed-off-by: Andre Przywara <andre.przywar@arm.com>
>=20
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c
> index db2a7fe344d5d..4b4daf79611bb 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
[ ... ]
> @@ -49,11 +51,13 @@
>  #include <linux/stop_machine.h>
>  #include <linux/string.h>
>  #include <linux/sysfs.h>
> +#include <linux/types.h>
>  #include <linux/uuid.h>
>  #include <linux/workqueue.h>
> =20
>  #include <uapi/linux/psci.h>
> =20
> +#define DRIVER_NAME	"ARM_LFA"

[Severity: Low]
This isn't a bug, but DRIVER_NAME does not appear to be used anywhere in
drivers/firmware/smccc/lfa_fw.c.

Also, the commit message still describes adding a faux device and
re-enumerating images in a loop on activation, whereas the patch uses the
existing arm_smccc_device on the SMCCC bus and snapshots the candidate array
once in activate_pending_components(). Could the unused macro be dropped and
the commit description updated to match the implementation?

>  #undef pr_fmt
>  #define pr_fmt(fmt) "Arm LFA: " fmt
> =20
> @@ -753,6 +757,135 @@ static void clean_fw_components_tree(void)
>  	}
>  }
> =20
> +/*
> + * Iterate over all FW components and trigger activation of all activati=
ble and
> + * pending components.
> + * Since we would need to re-enumerate the list of all components after a
> + * successful activation, and this could trigger infinite loops if a fir=
mware
> + * component still appears as pending, we create an array of update cand=
idates
> + * first, then activate each one of them.
> + */
> +static void activate_pending_components(void)
> +{
> +	struct fw_component **all_comps;
> +	struct fw_component *comp;
> +	struct kobject *kobj;
> +	int nr_comps =3D 0;
> +	int ret, i;
> +
> +	down_read(&smc_lock);
> +	spin_lock(&lfa_kset->list_lock);
> +	all_comps =3D kmalloc_array(list_count_nodes(&lfa_kset->list),
> +				  sizeof(*all_comps), GFP_NOWAIT);
> +	if (!all_comps) {
> +		spin_unlock(&lfa_kset->list_lock);
> +		up_read(&smc_lock);
> +		pr_warn("LFA: automatic activation failed: -ENOMEM\n");
> +		return;
> +	}
> +
> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {
> +		comp =3D kobj_to_fw_component(kobj);
> +
> +		if (comp->fw_seq_id =3D=3D -1)
> +			continue; /* Invalid FW component */
> +
> +		_update_fw_component_pending(comp);
> +		if (comp->activation_capable && comp->activation_pending) {
> +			kobject_get(&comp->kobj);
> +			all_comps[nr_comps++] =3D comp;
> +		}
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +	up_read(&smc_lock);
> +
> +	for (i =3D 0; i < nr_comps; i++) {
> +		comp =3D all_comps[i];
> +
> +		ret =3D prime_fw_component(comp);

[Severity: High]
As reported by Sashiko on v2 [1], can activate_pending_components() end up
calling prime_fw_component() and activate_fw_component() with an invalidated
comp->fw_seq_id of -1 when multiple components are in all_comps[] or when a
concurrent activation runs?

In activate_pending_components(), candidate pointers are collected into
all_comps[] under smc_lock and lfa_kset->list_lock, and then both locks are
released before the activation loop. When all_comps[0] is activated,
activate_fw_component() calls update_fw_components_tree() under
down_write(&smc_lock):

drivers/firmware/smccc/lfa_fw.c:update_fw_components_tree() {
	...
	spin_lock(&lfa_kset->list_lock);
	list_for_each_entry(kobj, &lfa_kset->list, entry) {
		struct fw_component *comp =3D kobj_to_fw_component(kobj);

		set_component_flags(comp, -1, 0b1000, 0, 0);
	}
	spin_unlock(&lfa_kset->list_lock);
	...
}

If a subsequent entry all_comps[i] is no longer present in the firmware
inventory after the earlier activation, had its activation_pending or
activation_capable bit cleared, or if update_fw_components_tree() failed
partway through, its comp->fw_seq_id remains -1.

Because prime_fw_component(), activate_fw_component(), and lfa_cancel() read
comp->fw_seq_id under smc_lock without checking whether comp->fw_seq_id =3D=
=3D -1
or whether the component is still pending and activation-capable:

drivers/firmware/smccc/lfa_fw.c:prime_fw_component() {
	...
		touch_nmi_watchdog();
		down_read(&smc_lock);
		regs.a1 =3D comp->fw_seq_id;
		arm_smccc_1_2_invoke(&regs, &regs);
		up_read(&smc_lock);
	...
}

won't the driver invoke ARM_SMCCC_LFA_PRIME, ARM_SMCCC_LFA_ACTIVATE, and
ARM_SMCCC_LFA_CANCEL with regs.a1 =3D -1? Also, during the initial scan,
_update_fw_component_pending() only refreshes activation_pending without
updating activation_capable, may_reset_cpu, or cpu_rendezvous.

[Severity: High]
What happens in prime_fw_component() when the first ARM_SMCCC_LFA_PRIME call
returns LFA_PRIME_CALL_AGAIN in regs.a1 and a subsequent call completes with
regs.a1 =3D=3D 0?

Looking at prime_fw_component() in drivers/firmware/smccc/lfa_fw.c:

drivers/firmware/smccc/lfa_fw.c:prime_fw_component() {
	...
	bool retry =3D false;
	...
	do {
		...
		if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) {
			if (ktime_before(ktime_get(), end)) {
				if (msleep_interruptible(LFA_PRIME_DELAY_MS)) {
					ret =3D -EINTR;
					break;
				}
			} else {
				pr_err("LFA_PRIME for component %s timed out",
				       kobject_name(&comp->kobj));
				ret =3D -ETIMEDOUT;
				break;
			}
			retry =3D true;
		}
	} while (retry);
	...
}

Once retry is set to true on an iteration where LFA_PRIME_CALL_AGAIN is set,
nothing resets retry to false when a later call succeeds with
LFA_PRIME_CALL_AGAIN cleared. Because the sleep and timeout checks are both
inside the if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) block and
touch_nmi_watchdog() is called on each pass, wouldn't this spin in an
unthrottled infinite loop issuing ARM_SMCCC_LFA_PRIME calls?

> +		if (ret) {
> +			pr_warn("LFA: LFA_PRIME failed for component %s\n",
> +				kobject_name(&comp->kobj));
> +			kobject_put(&comp->kobj);
> +			continue;
> +		}
> +
> +		ret =3D activate_fw_component(comp);

[Severity: High]
Could activating multiple components in activate_pending_components() race
with the asynchronous remove_invalid_fw_components() work item?

When the first component in all_comps[] is activated,
activate_fw_component() -> update_fw_components_tree() queues
fw_comps_update_work (remove_invalid_fw_components()) onto the unbound
workqueue fw_comps_update_wq and then drops smc_lock.

When the next component in all_comps[] is activated,
update_fw_components_tree() acquires lfa_kset->list_lock, resets
comp->fw_seq_id =3D -1 on every component in lfa_kset->list, and drops
lfa_kset->list_lock while querying ARM_SMCCC_LFA_GET_INVENTORY over SMC:

drivers/firmware/smccc/lfa_fw.c:update_fw_components_tree() {
	...
	spin_lock(&lfa_kset->list_lock);
	list_for_each_entry(kobj, &lfa_kset->list, entry) {
		struct fw_component *comp =3D kobj_to_fw_component(kobj);

		set_component_flags(comp, -1, 0b1000, 0, 0);
	}
	spin_unlock(&lfa_kset->list_lock);

	regs.a0 =3D ARM_SMCCC_LFA_GET_INVENTORY;
	for (int i =3D 0; i < num_of_components; i++) {
		...
}

Meanwhile, remove_invalid_fw_components() only takes lfa_kset->list_lock and
does not take smc_lock:

drivers/firmware/smccc/lfa_fw.c:remove_invalid_fw_components() {
	...
	spin_lock(&lfa_kset->list_lock);
	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
		struct fw_component *comp =3D kobj_to_fw_component(kobj);

		if (comp->fw_seq_id =3D=3D -1)
			list_move_tail(&kobj->entry, &comps_to_delete);
	}
	spin_unlock(&lfa_kset->list_lock);
	...
}

If remove_invalid_fw_components() runs during that window, won't it see
comp->fw_seq_id =3D=3D -1 on valid components that have not yet been refres=
hed by
the inventory loop, remove them from lfa_kset->list, and delete their sysfs
kobjects?

[ ... ]
> +static void lfa_remove_acpi(struct device *dev)
> +{
> +	struct acpi_device *acpi_dev =3D ACPI_COMPANION(dev);
> +	acpi_handle handle =3D acpi_device_handle(acpi_dev);
> +
> +	if (handle)
> +		acpi_remove_notify_handler(handle,
> +					   ACPI_DEVICE_NOTIFY,
> +					   lfa_acpi_notify_handler);
> +	acpi_dev_put(acpi_dev);
> +}

[Severity: Medium]
In lfa_register_acpi(), ACPI_COMPANION_SET(dev, acpi_dev) attaches acpi_dev
as the fwnode companion on sdev->dev. When lfa_remove_acpi() later drops the
reference with acpi_dev_put(acpi_dev) on driver unbind or module unload,
should it also clear the companion pointer via ACPI_COMPANION_SET(dev, NULL)
so the persistent arm_smccc_device is not left with a dangling unreferenced
fwnode pointer?

[ ... ]
> @@ -813,13 +946,32 @@ static int lfa_smccc_probe(struct arm_smccc_device =
*sdev)
>  	if (err !=3D 0) {
>  		kset_unregister(lfa_kset);
>  		destroy_workqueue(fw_comps_update_wq);
> +		return err;
> +	}
> +
> +	if (!acpi_disabled) {
> +		err =3D lfa_register_acpi(&sdev->dev);
> +		if (!err)
> +			pr_info("registered LFA ACPI notification\n");
> +	}
> +
> +	/*
> +	 * An ACPI notification or an interrupt are optional, but we must
> +	 * handle errors that occurred during their setup.
> +	 */
> +	if (err !=3D -ENODEV) {
> +		kset_unregister(lfa_kset);
> +		destroy_workqueue(fw_comps_update_wq);
> +		return err;
>  	}

[Severity: Critical]
As reported by Sudeep Holla on v4 [2], when lfa_register_acpi() succeeds (or
when acpi_disabled is true after update_fw_components_tree() succeeded), err
is 0.

Because 0 !=3D -ENODEV is true, won't lfa_smccc_probe() enter this error bl=
ock,
unregister lfa_kset, destroy fw_comps_update_wq, and then return 0 (success)
with the ACPI notify handler still registered? Any subsequent 0x80 ACPI
notification or driver removal in lfa_smccc_remove() will then access the
destroyed lfa_kset and fw_comps_update_wq. Should this check be:

	if (err && err !=3D -ENODEV)

instead?

[Severity: High]
On the same error path in lfa_smccc_probe(), if lfa_register_acpi() returns=
 a
real error (such as -EIO) after update_fw_components_tree() has already
populated lfa_kset->list and queued fw_comps_update_work onto
fw_comps_update_wq, doesn't this unwind path leak all child struct
fw_component kobjects and race with the queued work item?

In lfa_smccc_remove(), teardown cleans the component tree and flushes/destr=
oys
the workqueue before unregistering lfa_kset:

drivers/firmware/smccc/lfa_fw.c:lfa_smccc_remove() {
	if (!acpi_disabled)
		lfa_remove_acpi(&sdev->dev);
	clean_fw_components_tree();
	flush_workqueue(fw_comps_update_wq);
	destroy_workqueue(fw_comps_update_wq);
	kset_unregister(lfa_kset);
}

Should the probe failure path after update_fw_components_tree() follow the
same cleanup sequence?

[1] https://lore.kernel.org/r/20260317103336.1273582-9-andre.przywara@arm.c=
om
[2] https://lore.kernel.org/r/20260921-smiling-rare-salamander-6c442d@sudee=
pholla

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102165421.3651=
202-1-andre.przywara@arm.com?part=3D3
