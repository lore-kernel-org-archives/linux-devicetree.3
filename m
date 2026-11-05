Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895910;
	b=bqFLtEkFkQd26jlyY3Y17G6XEfXWbgVn01kN5ypUlXyFhHFosAgcyzxFM+REw2rfk9hf
	 LU2JjITX0/D3nX0drP79JFTQ2pOVPLTJVmios1LoiOnWkBc7Vx+I8XyfNG879GbfqV25Y
	 ABIyw0X8BJGYi0htiWWt2I6nRYZbTyXHO0l/8IAgz94ba8PkhWNtB4hmqbV4YuduvtKH3
	 JlgAbZQOLmCWLDrWGHv554fgV6KS4NfLl7wYaq1/1CKg9V56zJS2RZqYkk+q3k4Vtcv39
	 l7b3q8kdyUfKp+pZIGAwo/yb7KkG+U5qeJHjmTukCc9Xoiac/hW6dP/XAFU64aDEfGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895910;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oCWdR4dL23WniGGSm3TS3NPw+N1CT7+4r/yqchbW3m8=;
	b=O51EzkDjqYP82u0FEa9GC7gnmUJrfxx/sZ1zHdym05cj8Le008p+qampAtZWH0/VvjXg
	 /vV4Lfsasup33L4C0/03m7MD+urIEJiJmCcTAH2qHHxWRnHKll0tIwZSv+74krlJ2Jg/k
	 enfOUpuMC76In4cbZT5NKnfLFV9G9RgQ22bp6nBulPch5O+W+WrCXm/SpNy6V+CY0AD6W
	 gPinU+iSzZwNwP7UHjpbLopXyA5STgPBpNK75MXUDsvph3l+kSQVrk+wI6/AoTvL56aP3
	 9/S5gFoiW3kNqyfuxGe7qoKTBhH+JTE+iZOF2sOWhqbeww2EDGw7fg2v/TkTUQNO5EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjUwWOuQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33563606D804
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WjUwWOuQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DCD1F00919;
	Thu,  5 Nov 2026 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895910;
	bh=oCWdR4dL23WniGGSm3TS3NPw+N1CT7+4r/yqchbW3m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WjUwWOuQArBwVRvRRqgWKcKari+qyItPY/KauQGB93yx0nt5f1Pg70aF0kse1pJ3L
	 67/Q+yF8lm6btTzJBzubVXl3lp9WS0n4K6+BM60ybkWfgIE1UHKKil95/Wu4QwhWC/
	 nPoQia2b+oa2lpC1G6XjHLtNzjLWAge3tVVAivzdVFa0O7T4IHNKfCalEvxiA7R2Bh
	 EL/O5d7CD2VAA+69yXi8ZOJmXhML+S+zBDzLBpEyfCfH8FOgt2yaSIMqdvuKhfoH8u
	 QSFGksgKjpKT9HLxOf5KrpMtI+YB/AsQIWQH3uG11QvPCM6qW8nZHcG3CTT2Z3v237
	 P75NyJLpCa58g==
Message-ID: <sashiko-outbox-199486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 RESEND 4/6] firmware: smccc: lfa: Add auto_activate
 sysfs file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102165421.3651202-5-andre.przywara@arm.com>
References: <20261102165421.3651202-1-andre.przywara@arm.com>
 <20261102165421.3651202-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:25:08 +0000
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
- [High] firmware: smccc: lfa: teardown on success in lfa_smccc_probe()
- [High] firmware: smccc: lfa: infinite loop in prime_fw_component() on ret=
ry
- [Medium] firmware: smccc: lfa: kobject leak in update_fw_components_tree()
--

commit 9e007983d149d16e1c362d811e6caba071d543eb
Author: Andre Przywara <andre.przywara@arm.com>

firmware: smccc: lfa: Add auto_activate sysfs file

This commit adds a per-component auto_activate sysfs attribute to control
whether platform-initiated notifications automatically trigger firmware
activation in activate_pending_components().

> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c
> index 4b4daf79611bb..65f28ffc9d108 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c

[ ... ]

> @@ -306,6 +308,7 @@ static int update_fw_components_node(char *fw_uuid, i=
nt seq_id,
> =20
>  	comp->kobj.kset =3D lfa_kset;
>  	comp->cpu_rendezvous_forced =3D true;
> +	comp->auto_activate =3D false;
>  	set_component_flags(comp, seq_id, comp_flags, reg_current_ver,
>  			    reg_pending_ver);
>  	if (kobject_init_and_add(&comp->kobj, &component_ktype, NULL,

[Severity: Medium]
As reported by Sashiko on v2 [1], if update_fw_components_node() fails after
earlier iterations of the loop in update_fw_components_tree() have already
registered fw_component kobjects:

drivers/firmware/smccc/lfa_fw.c:update_fw_components_tree() {
	...
	for (int i =3D 0; i < num_of_components; i++) {
		...
		if (res.a0 =3D=3D LFA_SUCCESS) {
			...
			ret =3D update_fw_components_node(comp_id_str, i, res.a3,
							res.a4, res.a5);
			if (ret)
				return ret;
		}
	}
	...
}

and lfa_smccc_probe() then unwinds on that error:

drivers/firmware/smccc/lfa_fw.c:lfa_smccc_probe() {
	...
	err =3D update_fw_components_tree();
	if (err !=3D 0) {
		kset_unregister(lfa_kset);
		destroy_workqueue(fw_comps_update_wq);
		return err;
	}
	...
}

does this leak the fw_component kobjects (and their references on lfa_kset)
created in prior iterations because clean_fw_components_tree() is never
called before kset_unregister(lfa_kset)? Also, if this fails during runtime
activation, returning before queue_work() skips removing components whose
fw_seq_id was invalidated to -1 at the start of update_fw_components_tree().

[ ... ]

> @@ -791,7 +817,8 @@ static void activate_pending_components(void)
>  			continue; /* Invalid FW component */
> =20
>  		_update_fw_component_pending(comp);
> -		if (comp->activation_capable && comp->activation_pending) {
> +		if (comp->activation_capable && comp->activation_pending &&
> +		    comp->auto_activate) {
>  			kobject_get(&comp->kobj);
>  			all_comps[nr_comps++] =3D comp;
>  		}

[Severity: High]
When an ACPI notification triggers lfa_acpi_notify() ->
activate_pending_components(), can lfa_kset already be unregistered and
freed after a successful probe?

In lfa_smccc_probe(), after update_fw_components_tree() succeeds with
err =3D=3D 0, either acpi_disabled is true (leaving err =3D=3D 0) or
lfa_register_acpi(&sdev->dev) succeeds and returns err =3D=3D 0:

drivers/firmware/smccc/lfa_fw.c:lfa_smccc_probe() {
	...
	if (!acpi_disabled) {
		err =3D lfa_register_acpi(&sdev->dev);
		if (!err)
			pr_info("registered LFA ACPI notification\n");
	}

	/*
	 * An ACPI notification or an interrupt are optional, but we must
	 * handle errors that occurred during their setup.
	 */
	if (err !=3D -ENODEV) {
		kset_unregister(lfa_kset);
		destroy_workqueue(fw_comps_update_wq);
		return err;
	}

	return 0;
}

Because 0 !=3D -ENODEV is true, doesn't lfa_smccc_probe() tear down lfa_kset
and fw_comps_update_wq whenever probe succeeds, while returning 0 with the
driver still bound and the ACPI notify handler still installed (as well as
leaking the child fw_component kobjects without calling
clean_fw_components_tree())? Note that this remains present at the end of t=
he
series when IRQ setup is added in commit 93a930701ee9.

[Severity: High]
When activate_pending_components() (or activate_store()) calls
prime_fw_component(comp), what happens if ARM_SMCCC_LFA_PRIME returns
LFA_PRIME_CALL_AGAIN on the first call and then succeeds with regs.a1 =3D=
=3D 0 on
a subsequent iteration?

drivers/firmware/smccc/lfa_fw.c:prime_fw_component() {
	ktime_t end =3D ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
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

Since retry is initialized before the do-while loop and never reset to false
when LFA_PRIME_CALL_AGAIN is cleared, won't the loop spin indefinitely
calling ARM_SMCCC_LFA_PRIME without sleeping once priming finishes?

[1] https://lore.kernel.org/r/20260317103336.1273582-7-andre.przywara@arm.c=
om

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102165421.3651=
202-1-andre.przywara@arm.com?part=3D4
