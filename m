Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221785187F7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165836; cv=none; b=W0FFK1WlCNP0d03hyj8/fAL76EygxdEa8urISpVuwFN2/AR1W2WxeXSvpj7NFP2HX1gLOcAEJ5eU3GvuT9A22rDT5hfsifZxP4VP5gsxS48EWwsjZH9Q1Z9LNCN3HJU3+c8zpQyf4ri6FsP8JBLJc+tsVbB846TZG1k/1WlscyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165836; c=relaxed/simple;
	bh=Oj6mKcK+qOFh8A7qiiiRyg+kobpTQ2N6EXdZjZ40T40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qr9BblT7AdxZGafRJkGTKSSHxj3eTbT8G2YNjdWC9qNI3Uo/5CNSOjIh2lVbtXqpLiDMibWZnOzWxCMN5JfnJxLriOzIqTOpz7Q3qB2WX/28Q2d7AAi+KHsfawXi3swVhN4ElWQhABRdtN6ScVlAjWtufrreSQM1IO8/AOmzxAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKyXCJcq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKyXCJcq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F161F000FF;
	Wed, 23 Sep 2026 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165830;
	bh=6H1vJzmHNcFYQIaijosXkXdRHsgMfN+LX34csWJWH3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lKyXCJcqjsfb3HU0SHbYJOcNPhBDuFgec2n4u1GtbRcwFvyr4SPOtDaXZ4ZFj+Izn
	 Lw5gEEIDodJdfMwUAZbMNKxrFLQ2/ESKIupe7z0kct2WC+Ndr088jkuxpHGjG3Chqh
	 p6tnG1LcaH4MXiK58PpvS1hN4se7Bbe4EIRr5eqFg2mximEvy5RjP1CnTWSwaDhICZ
	 GsPM/Y8aoG8gYW3QahwH4CbYdz6nGeajaPtFYqzj6FiEY6nFLlXBrZSkFV5D4/L+e+
	 xOPGdmSNauCx6dQMFlHY7xam7w00cFO/8FoypBSfeQy6hTn95oIwQCONGY7Z6BQO6l
	 cR4r4J32QtUoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 10/16] dt-bindings: net: wireless: ath11k: Add
 bindings for QCN6122
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-10-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-10-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:17:09 +0000
Message-Id: <20260923121710.52F161F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: net: schema validation fails for QCN6122 example due t=
o global requirements
--

commit 102746dfa5ef909024eac57a4a48dad184a777a7
Author: George Moussalem <george.moussalem@outlook.com>

dt-bindings: net: wireless: ath11k: Add bindings for QCN6122

This commit adds device tree bindings for the QCN6122 5G/6G WiFi chip. It
describes the interrupts, memory regions, and smem-states required for the
multi-PD configuration with the IPQ5018 SoC. It also provides a new example
node for the hardware variant.

> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.y=
aml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index 621ad6d4ddadb..10102b5ea8c81 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml

[ ... ]

> @@ -861,3 +949,55 @@ examples:
> =20
>          qcom,rproc =3D <&q6v5_wcss>;
>      };
> +
> +    wifi1: wifi@b00a040 {
> +        reg =3D <0x0b00a040 0x0>;
> +        compatible =3D "qcom,qcn6122-wifi";
> +
> +        interrupts-extended =3D <&intc GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
> +                              <&intc GIC_SPI 417 IRQ_TYPE_EDGE_RISING>,

[Severity: Low]
Does this new example violate the global requirements of the schema?

The top-level schema unconditionally requires qcom,rproc and interrupts for
all nodes. This example intentionally omits qcom,rproc (as it has no dedica=
ted
Q6 firmware) and uses interrupts-extended instead of interrupts.

Because these omissions violate the global required list, will the example
fail dt_binding_check unconditionally?


I also noticed some pre-existing issues in drivers/net/wireless/ath/ath11k/=
ahb.c
that you might want to address:

drivers/net/wireless/ath/ath11k/ahb.c:ath11k_ahb_config_userpd_irq() {
	ab_ahb->spawn_state =3D devm_qcom_smem_state_get(&ab->pdev->dev, "spawn",
						       &ab_ahb->spawn_bit);
	if (IS_ERR(ab_ahb->spawn_state))
		return dev_err_probe(&ab->pdev->dev, PTR_ERR(ab_ahb->spawn_state),
}

[Severity: High]
This isn't a bug introduced by this patch, but does the unconditional call =
to
devm_qcom_smem_state_get() break the probe for legacy non-MPD hardware?

For legacy non-MPD hardware (e.g., IPQ8074, IPQ6018), these properties do n=
ot
exist, causing the function to return -ENOENT.=20

Because ath11k_ahb_configure_rproc() propagates this error, does it cause
ath11k_ahb_probe() to abort and completely break the driver for all previou=
sly
supported AHB devices?


drivers/net/wireless/ath/ath11k/ahb.c:ath11k_ahb_power_up() {
	if (ab_ahb->userpd_id > 0 &&
	    ab_ahb->userpd_id < ATH11K_AHB_USERPD_ID_MAX) {
		ret =3D ath11k_ahb_boot_user_pd(ab);
}

[Severity: High]
This is a pre-existing issue, but does the lack of an unconditional
rproc_boot() break crash recovery for legacy non-MPD devices?

Because ath11k_ahb_power_up() and power_down() only operate if userpd_id > =
0,
they do nothing for legacy devices where userpd_id =3D=3D 0.

During a firmware crash, ath11k_core_restart() relies on these callbacks to
reboot the remote processor. Since they do nothing, is the target rproc nev=
er
rebooted, leaving the device irrecoverable after a crash?


drivers/net/wireless/ath/ath11k/ahb.c:ath11k_ahb_config_userpd_irq() {
		ab_ahb->userpd_irq_num[i] =3D platform_get_irq_byname_optional(ab->pdev,
									     ath11k_userpd_irq[i]);
		if (ab_ahb->userpd_irq_num[i] < 0)
			return ab_ahb->userpd_irq_num[i];
}

[Severity: High]
This isn't a bug introduced by this patch, but does returning early here le=
ave
the completion structures uninitialized?

ath11k_ahb_config_userpd_irq() returns -ENXIO early if an optional IRQ is
missing, skipping init_completion() for the userPD completion structs.

Because ath11k_ahb_configure_rproc() ignores -ENXIO and treats the
configuration as successful, when ath11k_ahb_power_up() later executes
wait_for_completion_timeout() on these uninitialized completions, can it ca=
use
a spinlock bad magic panic?


drivers/net/wireless/ath/ath11k/ahb.c:ath11k_ahb_configure_rproc() {
	ret =3D ath11k_ahb_config_userpd_irq(ab);
	if (ret && ret !=3D -EINVAL && ret !=3D -ENXIO)
		return dev_err_probe(&ab->pdev->dev, ret,
				     "failed to configure userpd interrupts\n");

	return 0;

err_unreg_notifier:
}

[Severity: High]
This is a pre-existing issue, but does bypassing the cleanup block here cau=
se
a leak and use-after-free of the global g_rproc_info array?

If ath11k_ahb_config_userpd_irq() fails, returning the error immediately
circumvents the err_unreg_notifier and err_cleanup_userpd labels. This
bypasses ath11k_ahb_deconfigure_rproc() during probe teardown, leaking the
global structure and leaving the SSR notifier active.

Furthermore, if the failure occurs after ath11k_ahb_init_userpd(), does
g_rproc_info->userpd retain a dangling pointer to ab_ahb after it is freed,
leading to a use-after-free on subsequent SSR events or probe attempts?


drivers/net/wireless/ath/ath11k/ahb.c:ath11k_ahb_boot_user_pd() {
	time_left =3D wait_for_completion_timeout(&ab_ahb->userpd_spawned,
						ATH11K_USERPD_SPAWN_TIMEOUT);
	if (!time_left) {
		ath11k_err(ab, "UserPD spawn wait timed out\n");
		return -ETIMEDOUT;
	}
}

[Severity: Medium]
This isn't a bug introduced by this patch, but does returning -ETIMEDOUT
early permanently leak the asserted signal state?

ath11k_ahb_boot_user_pd() asserts spawn_bit to 1 to signal the remote proce=
ssor.
If wait_for_completion_timeout() times out, it returns early without cleari=
ng
spawn_bit back to 0.

Because SMP2P relies on edge-triggered toggling to generate interrupts, does
leaving the bit at 1 prevent subsequent attempts from toggling the bit,
permanently breaking userPD spawning until a full system reset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D10
