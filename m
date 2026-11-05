Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894195;
	b=GbwI4alS1fpkk7qpaedDBnURPuh5CJsNMr3Puxt6HxbTF5i75ICx+lrJ8e032MjSaVPF
	 criV7ur1C+n9Fhp+E/d6gIBwKPtZC5kDey1D1+UtU8jxGnHBSTqav5z2Ub8VHjA4gAdqh
	 dH17ohgjTc3BpqhVRMfMS+pytAJ14L0FY7KZeJ3QrwQ0sY/r3BzR+gxDoSUC8rIfMlZtD
	 ATDVb3v+Qjvmo7VcWm16X0BINVVdY7KGM896dqDSvAm4u3NO2CINEHBLHbomgVYfde9DI
	 G4DsoA+Zv1Me3dgbmAa4GWIJieg9Yrg/Oj81YuWzdUHGwNQ7EofOTRUZGZo4HU02tqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894195;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/FSDddNgx/F3diAzFkUE55Cpr+aHSS3EpLdjTzu2OpM=;
	b=PH1+D70lmw6lUel+Z7T0szcM1beV3lqBKpYEds/b9s/cJf/iFC3xL3vTALxvwqdJVVYL
	 rVCSQcJE4JFF43xF0WL8ObAsIsI8u/hSxHnUHWGZxPfCikrxvpFaS1EFrPWngWSZX5j9m
	 jnVBhcfGdNuQZGaIIuoykXvuluZzG9DQ4dMyh9s83KaY8i2Iiw4OPtn9gcP9D8mBTgBor
	 DI+Nt+3Aa/AyB6RPCnhIFIGww48X+htV3oR3OHZNqnujsCFqXPcmOAvYZl4dMtVtGSKW/
	 oKWOp+UHxqNLWj2aehA4M8ZTI5RUOUM7UaotM8TYJKV5JB3aLRpSWypUYQaf8byCSlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWHSSshj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B326606E570
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWHSSshj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31DC1F00919;
	Thu,  5 Nov 2026 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793894195;
	bh=/FSDddNgx/F3diAzFkUE55Cpr+aHSS3EpLdjTzu2OpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gWHSSshjh1mu5I70lfAGstFAz9dGtSK0TAzGIiqpIHiowqqvvO0ZKA61vbToYH6Bf
	 KEB7Hhw9/pWR+ZMv3PDAAk/taPGadOMuAdOnP3DQhHd1aBIyeP68hGtrMMyBcAKtE3
	 zCdPm8oRYnSa/IBOv+YaqUPfB/UKvhk7BW1wSpa9lqSmp1qmrQKKaHccAdoBSGk9SJ
	 s2kAsynJYGcblsgUexD9V0F9AUPwPdb6D1EVIvAK3zkZDkAbJ6Oz19QvQilK7hL9bj
	 WTXK7f5I9ZcXyM8yBdt+IN3U2L11rNyqL3RONVToTKwjvvYfDK0Hr6l8obhpjUgl0C
	 BI5Q57q7s27ng==
Message-ID: <sashiko-outbox-199378@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 RESEND 2/6] firmware: smccc: Add support for Live
 Firmware Activation (LFA)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102165421.3651202-3-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
 <20261102165421.3651202-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:56:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 14 potential issue=
(s) to consider:
- [High] firmware: smccc: lfa: infinite loop in prime_fw_component() on ret=
ry
- [High] firmware: smccc: lfa: nested cpus_read_lock() in activate_fw_compo=
nent()
- [High] firmware: smccc: lfa: unlocked fw_seq_id race in remove_invalid_fw=
_components()
- [Medium] firmware: smccc: lfa: kobject leak in lfa_smccc_probe() error pa=
th
- [Medium] firmware: smccc: lfa: unvalidated fw_seq_id (-1) passed to SMCCC=
 calls
- [Medium] firmware: smccc: lfa: unserialized concurrent activation and rem=
ove teardown
- [Medium] firmware: smccc: lfa: ignored update_fw_components_tree() error =
on activate
- [Medium] firmware: smccc: lfa: missing smc_lock in lfa_smccc_probe()
- [Medium] firmware: smccc: unaddressed objection to force_cpu_rendezvous_s=
tore() ABI
- [Low] firmware: smccc: lfa: non-static smc_lock and unused comp_attrs mem=
ber
- [Low] firmware: smccc: lfa: broken UUID endianness in update_fw_component=
s_tree()
- [Low] firmware: smccc: lfa: hardcoded -EINVAL return on failure in lfa_ca=
ncel()
- [Low] firmware: smccc: lfa: missing newline in prime_fw_component() timeo=
ut log
- [Low] firmware: smccc: driver-private LFA function ID macros left in arm-=
smccc.h
--

commit 5cf9560b4beb0919c0dfd145e7357461f787a9cc
Author: Salman Nabi <salman.nabi@arm.com>

firmware: smccc: Add support for Live Firmware Activation (LFA)

This commit adds an SMCCC driver for Arm Live Firmware Activation (LFA),
exposing firmware components and activation controls under /sys/firmware/lf=
a.

> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c
> new file mode 100644
> index 0000000000000..db2a7fe344d5d
> --- /dev/null
> +++ b/drivers/firmware/smccc/lfa_fw.c

[ ... ]

> +struct fw_component {
> +	struct kobject kobj;
> +	int fw_seq_id;
> +	u64 current_version;
> +	u64 pending_version;
> +	bool activation_capable;
> +	bool activation_pending;
> +	bool may_reset_cpu;
> +	bool cpu_rendezvous;
> +	bool cpu_rendezvous_forced;
> +	bool use_cpu_rendezvous;
> +	struct kobj_attribute comp_attrs[LFA_ATTR_NR_IMAGES];
> +};
> +
> +static struct fw_component *kobj_to_fw_component(struct kobject *kobj)
> +{
> +	return container_of(kobj, struct fw_component, kobj);
> +}
> +
> +/* A UUID split over two 64-bit registers */
> +struct uuid_regs {
> +	u64 uuid_lo;
> +	u64 uuid_hi;
> +};
> +
> +static struct kset *lfa_kset;
> +static struct workqueue_struct *fw_comps_update_wq;
> +static struct work_struct fw_comps_update_work;
> +static struct attribute *component_default_attrs[LFA_ATTR_NR_IMAGES + 1];
> +
> +/*
> + * A successful component activation might change the number of available
> + * components, leading to a re-order and thus re-assignment of the seque=
nce IDs.
> + * The lock protects the connection between a firmware component (throug=
h its
> + * user visible UUID) and the sequence IDs. Anyone doing an SMC call with
> + * a sequence ID needs to take the readers lock. Doing an activation req=
uires
> + * the writer lock, as that process might change the assocications.
> + */
> +struct rw_semaphore smc_lock;

[Severity: Low]
This isn't a bug, but smc_lock is only used within drivers/firmware/smccc/l=
fa_fw.c
and is defined without the static keyword, which exports smc_lock into the
global symbol namespace and triggers a -Wmissing-declarations warning.

Also, struct fw_component embeds comp_attrs[LFA_ATTR_NR_IMAGES], which is
never referenced because the driver registers the static comp_attrs_group
array via component_default_attrs. Could smc_lock be made static and
comp_attrs removed from struct fw_component?

[ ... ]

> +static void remove_invalid_fw_components(struct work_struct *work)
> +{
> +	struct kobject *kobj, *tmp;
> +	struct list_head comps_to_delete =3D LIST_HEAD_INIT(comps_to_delete);
> +
> +	/*
> +	 * After an activation, firmware components might have been removed
> +	 * from the inventory. Move those components into a private temporary
> +	 * list, where they can be safely destroyed separately, as kobject_del()
> +	 * would be trying to take the same kset->list_lock.
> +	 */
> +	spin_lock(&lfa_kset->list_lock);
> +	list_for_each_entry_safe(kobj, tmp, &lfa_kset->list, entry) {
> +		struct fw_component *comp =3D kobj_to_fw_component(kobj);
> +
> +		if (comp->fw_seq_id =3D=3D -1)
> +			list_move_tail(&kobj->entry, &comps_to_delete);
> +	}
> +	spin_unlock(&lfa_kset->list_lock);
> +
> +	list_for_each_entry_safe(kobj, tmp, &comps_to_delete, entry) {
> +		struct fw_component *comp =3D kobj_to_fw_component(kobj);
> +
> +		delete_fw_component_node(comp);
> +	}
> +}

[Severity: High]
As reported by Sashiko on v2 [1], can remove_invalid_fw_components() race
with update_fw_components_tree() and delete valid firmware components or
cause -EEXIST failures in kobject_init_and_add()?

In update_fw_components_tree(), the driver resets all entries in
lfa_kset->list to fw_seq_id =3D -1 (and zeroes their flags, including setti=
ng
may_reset_cpu to false) under lfa_kset->list_lock, then drops list_lock whi=
le
looping over ARM_SMCCC_LFA_GET_INVENTORY to repopulate each component:

    spin_lock(&lfa_kset->list_lock);
    list_for_each_entry(kobj, &lfa_kset->list, entry) {
        struct fw_component *comp =3D kobj_to_fw_component(kobj);

        set_component_flags(comp, -1, 0b1000, 0, 0);
    }
    spin_unlock(&lfa_kset->list_lock);

Because remove_invalid_fw_components() runs asynchronously on
fw_comps_update_wq without holding smc_lock, if it executes while another
update_fw_components_tree() call is in the middle of its inventory loop, it
will observe fw_seq_id =3D=3D -1 on valid components, move them off
lfa_kset->list onto comps_to_delete, and delete their kobjects.

Furthermore, once an entry is moved to comps_to_delete,
update_fw_components_node() will no longer find it in lfa_kset->list, so if
a component with the same UUID is added before kobject_del() finishes
removing the old sysfs directory, kobject_init_and_add() will fail with
-EEXIST (returned as -ENOMEM). During the same window between invalidation
and repopulation, prime_fw_component() also reads comp->may_reset_cpu witho=
ut
synchronization and can observe the transient false value.

[ ... ]

> +static int update_fw_components_tree(void)
> +{
> +	struct arm_smccc_1_2_regs regs =3D { 0 }, res;
> +	struct uuid_regs comp_uuid;
> +	struct kobject *kobj;
> +	char comp_id_str[40];
> +	int ret, num_of_components;

[ ... ]

> +	regs.a0 =3D ARM_SMCCC_LFA_GET_INVENTORY;
> +	for (int i =3D 0; i < num_of_components; i++) {
> +		regs.a1 =3D i; /* fw_seq_id to be queried */
> +		arm_smccc_1_2_invoke(&regs, &res);
> +		if (res.a0 =3D=3D LFA_SUCCESS) {
> +			comp_uuid.uuid_lo =3D res.a1;
> +			comp_uuid.uuid_hi =3D res.a2;
> +
> +			snprintf(comp_id_str, sizeof(comp_id_str), "%pUb",
> +				 &comp_uuid);
> +			ret =3D update_fw_components_node(comp_id_str, i, res.a3,
> +							res.a4, res.a5);
> +			if (ret)
> +				return ret;
> +		}
> +	}

[Severity: Low]
As reported by Sashiko on v2 [2], does formatting comp_uuid with %pUb
produce byte-reversed UUID strings on big-endian kernels?

Per the Arm LFA specification (DEN0147), ARM_SMCCC_LFA_GET_INVENTORY returns
the component UUID across two 64-bit registers in little-endian byte order.
In update_fw_components_tree(), res.a1 and res.a2 are stored directly into
host-endian u64 fields in struct uuid_regs before passing &comp_uuid to %pU=
b,
which reads the 16-byte buffer in memory address order. On a big-endian
kernel, each 8-byte half of the UUID will have its byte order reversed.
Should uuid_lo and uuid_hi be __le64 populated with cpu_to_le64()?

> +
> +	/*
> +	 * Removing non-valid component directories at the end of an activation.
> +	 * We can't remove the sysfs attributes while in the respective
> +	 * _store() handler, so have to postpone the list removal to a
> +	 * workqueue.
> +	 */
> +	queue_work(fw_comps_update_wq, &fw_comps_update_work);
> +
> +	return 0;
> +}
> +
> +static int lfa_cancel(void *data)
> +{
> +	struct fw_component *comp =3D data;
> +	struct arm_smccc_1_2_regs regs =3D { 0 };
> +
> +	down_read(&smc_lock);
> +	regs.a0 =3D ARM_SMCCC_LFA_CANCEL;
> +	regs.a1 =3D comp->fw_seq_id;
> +	arm_smccc_1_2_invoke(&regs, &regs);
> +	up_read(&smc_lock);

[Severity: Medium]
As reported by Sashiko on v2 [3], can comp->fw_seq_id be -1 when passed to
the firmware in SMCCC calls?

When update_fw_components_tree() invalidates components by setting
comp->fw_seq_id =3D -1 (either because a component was removed from the
inventory after activation or because update_fw_components_tree() returned
early on error), the component's sysfs files remain accessible until
remove_invalid_fw_components() runs on fw_comps_update_wq and deletes the
kobject. Any thread waiting on smc_lock or sleeping between retry iterations
can also resume after comp->fw_seq_id has been set to -1.

None of lfa_cancel(), call_lfa_activate(), prime_fw_component(),
_update_fw_component_pending(), or pending_version_show() check whether
comp->fw_seq_id < 0 after acquiring smc_lock, allowing -1
(0xffffffffffffffff) to be passed in regs.a1 to ARM_SMCCC_LFA_CANCEL,
ARM_SMCCC_LFA_ACTIVATE, ARM_SMCCC_LFA_PRIME, and ARM_SMCCC_LFA_GET_INVENTOR=
Y.
Should these callers validate comp->fw_seq_id >=3D 0 while holding smc_lock?

> +
> +	/*
> +	 * When firmware activation is called with "skip_cpu_rendezvous=3D1",
> +	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
> +	 * cancelled.
> +	 */
> +	if (regs.a0 =3D=3D LFA_SUCCESS) {
> +		pr_info("Activation cancelled for component %s\n",
> +			kobject_name(&comp->kobj));
> +	} else {
> +		pr_err("Activation not cancelled for component %s: %s (%ld)\n",
> +		       kobject_name(&comp->kobj), lfa_error_string(regs.a0),
> +		       regs.a0);
> +		return -EINVAL;
> +	}
> +
> +	return regs.a0;
> +}

[Severity: Low]
In lfa_cancel(), when ARM_SMCCC_LFA_CANCEL fails, the error branch
unconditionally returns -EINVAL even though the comment notes that LFA_CANC=
EL
can fail with LFA_BUSY. Should this return lfa_to_linux_errno((s64)regs.a0)
instead of -EINVAL so userspace receives the mapped error code via
cancel_store()?

[ ... ]

> +static int activate_fw_component(struct fw_component *comp)
> +{
> +	ktime_t end =3D ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
> +	int ret;
> +
> +	do {
> +		down_write(&smc_lock);
> +		/*
> +		 * cpu_rendezvous_forced is set by the administrator, via sysfs,
> +		 * cpu_rendezvous is dictated by each firmware component.
> +		 * All cores call into the firmware with the same arguments.
> +		 */
> +		comp->use_cpu_rendezvous =3D comp->cpu_rendezvous_forced ||
> +					   comp->cpu_rendezvous;
> +		if (comp->use_cpu_rendezvous) {
> +			cpus_read_lock();
> +			ret =3D stop_machine(call_lfa_activate, comp,
> +					   cpu_online_mask);
> +			cpus_read_unlock();
> +		} else {
> +			ret =3D call_lfa_activate(comp);
> +		}

[Severity: High]
Doesn't calling stop_machine() while holding cpus_read_lock() in
activate_fw_component() acquire cpus_read_lock() recursively?

In kernel/stop_machine.c, stop_machine() already takes cpus_read_lock()
before calling stop_machine_cpuslocked():

    cpus_read_lock();
    ret =3D stop_machine_cpuslocked(fn, data, cpus);
    cpus_read_unlock();

Because cpus_read_lock() acquires cpu_hotplug_lock via percpu_down_read(),
taking it twice on the same task when comp->use_cpu_rendezvous is true
triggers a lockdep recursive read-lock warning under CONFIG_PROVE_LOCKING
and can deadlock if a CPU hotplug writer waits on cpu_hotplug_lock between
the outer and inner acquisitions. Should activate_fw_component() call
stop_machine_cpuslocked() or drop the outer cpus_read_lock() and
cpus_read_unlock()?

> +		if (!ret)
> +			update_fw_components_tree();
> +		up_write(&smc_lock);

[Severity: Medium]
As reported by Sashiko on v2 [4], what happens if update_fw_components_tree=
()
fails here in activate_fw_component()?

In update_fw_components_tree(), once get_nr_lfa_components() returns a
positive count, all existing components in lfa_kset->list are invalidated to
fw_seq_id =3D -1 with zeroed flags and versions before the loop queries
ARM_SMCCC_LFA_GET_INVENTORY and calls update_fw_components_node(). If
update_fw_components_node() fails with -ENOMEM partway through the loop,
update_fw_components_tree() returns early, leaving the remaining sysfs
components in a corrupted state with fw_seq_id =3D=3D -1 while
activate_fw_component() ignores the return value and reports success. If
ARM_SMCCC_LFA_GET_INVENTORY fails for an entry, that component also remains=
 at
fw_seq_id =3D=3D -1 and gets removed by remove_invalid_fw_components().

[ ... ]

> +static int prime_fw_component(struct fw_component *comp)
> +{
> +	ktime_t end =3D ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
> +	bool retry =3D false;
> +	int ret =3D 0;
> +
> +	if (comp->may_reset_cpu) {
> +		pr_err("CPU reset not supported by kernel driver\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * LFA_PRIME will return 1 in regs.a1 if the firmware priming
> +	 * is still in progress. In that case LFA_PRIME will need to
> +	 * be called again.
> +	 * regs.a1 will become 0 once the prime process completes.
> +	 */
> +	do {
> +		struct arm_smccc_1_2_regs regs =3D {
> +			.a0 =3D ARM_SMCCC_LFA_PRIME,
> +		};
> +
> +		touch_nmi_watchdog();
> +		down_read(&smc_lock);
> +		regs.a1 =3D comp->fw_seq_id;
> +		arm_smccc_1_2_invoke(&regs, &regs);
> +		up_read(&smc_lock);
> +
> +		if ((s64)regs.a0 < 0) {
> +			pr_err("LFA_PRIME for component %s failed: %s (%ld)\n",
> +			       kobject_name(&comp->kobj),
> +			       lfa_error_string((s64)regs.a0), regs.a0);
> +			return lfa_to_linux_errno((s64)regs.a0);
> +		}
> +
> +		if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) {
> +			if (ktime_before(ktime_get(), end)) {
> +				if (msleep_interruptible(LFA_PRIME_DELAY_MS)) {
> +					ret =3D -EINTR;
> +					break;
> +				}
> +			} else {
> +				pr_err("LFA_PRIME for component %s timed out",
> +				       kobject_name(&comp->kobj));
> +				ret =3D -ETIMEDOUT;
> +				break;
> +			}
> +			retry =3D true;
> +		}
> +	} while (retry);

[Severity: High]
In prime_fw_component(), retry is initialized to false once before the
do-while loop rather than being reset on each iteration.

If the first ARM_SMCCC_LFA_PRIME call returns LFA_SUCCESS with
LFA_PRIME_CALL_AGAIN set in regs.a1, retry is set to true. When a subsequent
iteration completes priming and returns LFA_SUCCESS with LFA_PRIME_CALL_AGA=
IN
cleared (regs.a1 =3D=3D 0), the if ((regs.a1 & LFA_PRIME_CALL_AGAIN)) block=
 is
skipped and retry remains true. Because both the msleep_interruptible() call
and the timeout check ktime_before(ktime_get(), end) are inside that if
block while touch_nmi_watchdog() is called on every iteration, won't
prime_fw_component() spin in an infinite loop calling ARM_SMCCC_LFA_PRIME
until the firmware returns an error?

[Severity: Low]
As reported by Sashiko on v2 [5], the pr_err("LFA_PRIME for component %s
timed out", ...) format string in prime_fw_component() is missing a trailing
newline character.

[ ... ]

> +static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
> +					  struct kobj_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct fw_component *comp =3D kobj_to_fw_component(kobj);
> +	int ret;
> +
> +	ret =3D kstrtobool(buf, &comp->cpu_rendezvous_forced);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}

[Severity: Medium]
As reported by Mark Rutland on v4 [6], should the driver expose
force_cpu_rendezvous_store() to allow the administrator to disable CPU
rendezvous via sysfs?

When a user writes 0 to force_cpu_rendezvous on a component where
comp->cpu_rendezvous is false, activate_fw_component() invokes
call_lfa_activate() directly without stop_machine(), which can break the
kernel if other CPUs invoke firmware services concurrently during activation
and the administrator has no way of knowing what firmware services the kern=
el
depends upon. In the same v4 discussion, it was also asked whether the LFA
specification guarantees that LFA_GET_INVENTORY cannot return multiple entr=
ies
with the same UUID, since update_fw_components_node() matches existing nodes
by UUID string and overwrites the existing entry if a duplicate UUID is
returned.

[ ... ]

> +static int lfa_smccc_probe(struct arm_smccc_device *sdev)
> +{

[ ... ]

> +	init_rwsem(&smc_lock);
> +
> +	err =3D update_fw_components_tree();
> +	if (err !=3D 0) {
> +		kset_unregister(lfa_kset);
> +		destroy_workqueue(fw_comps_update_wq);
> +	}
> +
> +	return err;
> +}

[Severity: Medium]
As reported by Sashiko on v2 [7], in lfa_smccc_probe(),
update_fw_components_tree() is called without holding smc_lock. Because each
iteration of update_fw_components_tree() calls update_fw_components_node() =
->
kobject_init_and_add(), component directories and their activate sysfs
attributes are immediately published to userspace before probe finishes
enumerating the remaining components. If userspace writes to activate on an
already-published component while lfa_smccc_probe() is still running, can
activate_store() run update_fw_components_tree() concurrently with the
unlocked update_fw_components_tree() in lfa_smccc_probe()?

[Severity: Medium]
As reported by Sashiko on v2 [8], if update_fw_components_node() fails
mid-loop in update_fw_components_tree() after earlier iterations have alrea=
dy
registered child comp->kobj entries under lfa_kset, the error path in
lfa_smccc_probe() calls kset_unregister(lfa_kset) without calling
clean_fw_components_tree(). Because kset_unregister() only drops the kset's
own reference and does not delete or put child kobjects in lfa_kset->list,
won't the previously added fw_component kobjects and lfa_kset be leaked?

> +
> +static void lfa_smccc_remove(struct arm_smccc_device *sdev)
> +{
> +	clean_fw_components_tree();
> +	flush_workqueue(fw_comps_update_wq);
> +	destroy_workqueue(fw_comps_update_wq);
> +	kset_unregister(lfa_kset);
> +}

[Severity: Medium]
In activate_store(), prime_fw_component() and activate_fw_component() only
hold smc_lock around individual SMCCC calls and drop it across
msleep_interruptible() polling delays and between priming and activation.

If two processes write to activate concurrently, their LFA_PRIME,
LFA_ACTIVATE, and LFA_CANCEL calls can interleave. In addition, if
lfa_smccc_remove() runs while an activate_store() write is in flight,
clean_fw_components_tree() moves all current entries off lfa_kset->list and
blocks in kobject_del() waiting for the active sysfs write to finish. While
activate_store() completes, activate_fw_component() can call
update_fw_components_tree(), which sees lfa_kset->list as empty and adds
fresh fw_component kobjects with fw_seq_id >=3D 0 to lfa_kset->list. When
kobject_del() returns, flush_workqueue() runs remove_invalid_fw_components()
(which ignores entries with fw_seq_id >=3D 0), and kset_unregister(lfa_kset=
) is
called with those newly created child kobjects still registered. Should
activations be serialized and prevented before clean_fw_components_tree() in
lfa_smccc_remove()?

[ ... ]

> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 4de81848fe2ee..381d527c16a4c 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -304,6 +304,21 @@
>  			   ARM_SMCCC_OWNER_STANDARD,		\
>  			   0x53)
> =20
> +/* Live Firmware Activation (LFA) calls (defined by ARM DEN0147) */
> +#define ARM_SMCCC_LFA_FN_BASE					\
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,			\
> +			   ARM_SMCCC_SMC_64,			\
> +			   ARM_SMCCC_OWNER_STANDARD,		\
> +			   0x2e0)
> +#define ARM_SMCCC_LFA_FN(n)		(ARM_SMCCC_LFA_FN_BASE + (n))
> +#define ARM_SMCCC_LFA_VERSION		ARM_SMCCC_LFA_FN(0)
> +#define ARM_SMCCC_LFA_FEATURES		ARM_SMCCC_LFA_FN(1)
> +#define ARM_SMCCC_LFA_GET_INFO		ARM_SMCCC_LFA_FN(2)
> +#define ARM_SMCCC_LFA_GET_INVENTORY	ARM_SMCCC_LFA_FN(3)
> +#define ARM_SMCCC_LFA_PRIME		ARM_SMCCC_LFA_FN(4)
> +#define ARM_SMCCC_LFA_ACTIVATE		ARM_SMCCC_LFA_FN(5)
> +#define ARM_SMCCC_LFA_CANCEL		ARM_SMCCC_LFA_FN(6)

[Severity: Low]
As reported by Sudeep Holla on v3 [9], only ARM_SMCCC_LFA_VERSION is used
outside drivers/firmware/smccc/lfa_fw.c (for device discovery in
drivers/firmware/smccc/smccc.c). Should ARM_SMCCC_LFA_FEATURES,
ARM_SMCCC_LFA_GET_INFO, ARM_SMCCC_LFA_GET_INVENTORY, ARM_SMCCC_LFA_PRIME,
ARM_SMCCC_LFA_ACTIVATE, and ARM_SMCCC_LFA_CANCEL be moved into
drivers/firmware/smccc/lfa_fw.c rather than exposed in
include/linux/arm-smccc.h?

[1] https://lore.kernel.org/r/20260317103336.1273582-3-andre.przywara@arm.c=
om
[2] https://lore.kernel.org/r/20260317103336.1273582-3-andre.przywara@arm.c=
om
[3] https://lore.kernel.org/r/20260317103336.1273582-9-andre.przywara@arm.c=
om
[4] https://lore.kernel.org/r/20260317103336.1273582-3-andre.przywara@arm.c=
om
[5] https://lore.kernel.org/r/20260317103336.1273582-5-andre.przywara@arm.c=
om
[6] https://lore.kernel.org/r/aq1XmaBemuGybxp2@J2N7QTR9R3
[7] https://lore.kernel.org/r/20260317103336.1273582-9-andre.przywara@arm.c=
om
[8] https://lore.kernel.org/r/20260317103336.1273582-3-andre.przywara@arm.c=
om
[9] https://lore.kernel.org/r/20260717-bipedal-courageous-alpaca-4fb54d@sud=
eepholla

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102165421.3651=
202-1-andre.przywara@arm.com?part=3D2
