Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2239368D53
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778645183; cv=none; b=Q9vBPt7h/mtL8aPOpGvQESpG40aqCXRupqUzzDAuzndXbS1/nrR8xDLMl1OAYUKEYRY1DddwEBW3jVgIri/azI1q4OBc2h5y+Mix+/JiSkZ1IZegbAXKUK/bfgcmqLxpIZEStJS+2UOdHGQ98XN5vl5qI5tdmWxByZRiG/x1cvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778645183; c=relaxed/simple;
	bh=jpjHejlEtkGaBBk6MQW7sF5O/PptqQW8kQL4hQs6NV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bX/abk+o/9D04qgJz+8zjlaVeCMA2E/mWCnTlAGPTfe4PySRjKWvjrZRq22IZDtqGZid5b3NWbgAbYAHoEAWlvlvMHwOalk1AqcsOldA0pzOjL7SijNPnwuCOcHBBatOREv6oTjbG5QR2ftaHigCpE0tGJsDfGLhiTIMymFkeJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/h0K9NH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/h0K9NH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F36C2BCC7;
	Wed, 13 May 2026 04:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778645183;
	bh=jpjHejlEtkGaBBk6MQW7sF5O/PptqQW8kQL4hQs6NV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Q/h0K9NHXyfsLN7uVdBYzGI3O9e3+P//r1i1TsNVyHEBRZ6eZInJa0MZ/0fBnGuZz
	 fgPzf26JICX+19PIaGPUqqegV037UDKZFdz8Xf6093dwgv+9b2AJaBK3g7QdRiG8bj
	 qHx7idQxBZk3JDq4mdVDfoxa4xhHqV2ZDUnhDlD8T6rb59bmULW42Xrdg5xuQlT5u/
	 9Vlopud+4GX8V5AZKwtoefjLmfEOXhGLn5fLcgGyH+R3ImfslVwOfIL0sMVLLhgE7v
	 I0Alrx7gN+KuHDyNBav+Svsm1TRSaKb00LCgscLW8XKtiXq7CuyPGG1HFM7myzA6Bc
	 blTh2iCj5VAnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Introduce Shikra SoC base dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org
In-Reply-To: <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:06:22 +0000
Message-Id: <20260513040623.03F36C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Invalid PPI interrupt numbers (1, 2, 3, 0) are specified for the A=
RMv8 generic timer instead of the architecturally required numbers (13, 14,=
 11, 10).
- [Medium] The `sdhc_1` node incorrectly uses RPMh interconnect tags (`QCOM=
_ICC_TAG_ALWAYS`, `QCOM_ICC_TAG_ACTIVE_ONLY`) on an RPM-based interconnect =
topology.
- [Medium] The USB SuperSpeed wakeup interrupt (`ss_phy_irq`) directly refe=
rences the GIC instead of routing through the MPM, breaking system wake-up =
from deep sleep.
- [Low] The `sdhc_1` node uses the undeclared macro `RPMHPD_CX` for its `po=
wer-domains` property, which will cause a Device Tree compiler syntax error.
--

commit e2ee94ef3a5741f2cb9aae14dbef52c5f4a760f1
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: arm64: dts: qcom: Introduce Shikra SoC base dtsi

This commit adds initial device tree support for the Qualcomm Shikra SoC, an
IoT-focused platform featuring a Cortex-A55 and Cortex-A78C cluster. It
configures RPM-based power and clock management alongside various periphera=
ls
like USB, eMMC, and the generic timer.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> new file mode 100644
> index 0000000000000..262c488add1ec
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi

[ ... ]

> +		sdhc_1: mmc@4744000 {
> +			compatible =3D "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
> +
> +			reg =3D <0x0 0x04744000 0x0 0x1000>,
> +			      <0x0 0x04745000 0x0 0x1000>;

[ ... ]

> +			interconnects =3D <&system_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> +					&mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +					<&mem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					&config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;

Since the Shikra SoC utilizes an RPM-based architecture, should this node u=
se
interconnect tags from qcom,rpm-icc.h (such as RPM_ALWAYS_TAG) instead?=20
Passing RPMh interconnect tags from qcom,icc.h to an RPM interconnect provi=
der
might result in unhandled parameters or silent bandwidth request failures.

> +			interconnect-names =3D "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			power-domains =3D <&rpmpd RPMHPD_CX>;

Does this power-domains assignment use an undeclared macro? RPMHPD_CX belon=
gs
to RPMh-based power domains, while this platform relies on RPMPD. This looks
like it will cause a dtc syntax error during the build.

[ ... ]

> +		usb_1: usb@4e00000 {
> +			compatible =3D "qcom,shikra-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0x0 0x04e00000 0x0 0xfc100>;

[ ... ]

> +			interrupts-extended =3D <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "hs_phy_irq",
> +					  "ss_phy_irq";

The mpm node correctly maps pin 12 to GIC SPI 422 for the DWC3 ss_phy_irq.
Could routing this directly to the GIC here instead of hierarchically throu=
gh
the mpm (e.g., <&mpm 12 IRQ_TYPE_LEVEL_HIGH>) prevent the hardware from
waking up from low-power states upon USB activity?

[ ... ]

> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +
> +		interrupts =3D <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> +	};

Are these PPI interrupt numbers correct for the ARMv8 generic timer? The
architecturally defined numbers are typically 13 for Secure, 14 for Non-sec=
ure,
11 for Virtual, and 10 for Hypervisor. Using invalid hardware IRQ lines here
could prevent the kernel from receiving scheduler ticks and stall the boot.

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-shikra-dt-=
v1-0-716438330dd0@oss.qualcomm.com?part=3D2
