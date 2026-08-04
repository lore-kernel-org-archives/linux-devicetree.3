Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49689282F25
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826364; cv=none; b=ix5xQQNqVpWlzbjnqhiIxtjnLupdjkcA3+bk0POpTUVvypNNPftU9jf0Wq23QgbVm2XUXnSTJL0hI53OeLgp4X9Y0rXd6Fon8lgeUWR6Hw1M2ymhhjxqmxaox25MknE0/Oy9pXuaowv1iPPysRkHHz172WTc0PgH2rz/V+1wjfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826364; c=relaxed/simple;
	bh=N6h4V7p+sOWAqo6vBCSMsVXgc57Dtpqu1mOuHQrNvQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sRecSpzPm3p7A76fFgZS238GThBuaiFbKx6h/WcvgWzbmDiYEcA0vbP7ZL01nmy/ytxjt/QmguJHhMcBB0b2YkW9rgeAhde260wviTP5e1KAM3lXKDoXujkg/Y0YMguaBnaxo3fr+TD9cD+N4v44bpaSUOY/yuK7YCS6z4sVsyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNxg2+Br; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNxg2+Br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0021F000E9;
	Tue,  4 Aug 2026 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826362;
	bh=dvcWlem49hB312zkr/MlUSgFkCJnW32Km1b1KiajP8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MNxg2+Brpc3kOQ05qaAVAea+nQiUHWmRDNTbQovZJ6WLD7W6S6xUAVrdqv5rMfrTo
	 h5Nr0CaNTy74kJjvT14ClhuK5EjyF+6NB33kbz0CCNILrRvz293ezSvkbQFQlhAG3I
	 5X9T853Ryew23x2H3JxZ4AjhfhOR154/JzVAU0bFM1K0I5gbHFy+c8zb9uNfqpCy52
	 4/LF5bkc6Jz5F9dUD2IjDVAVmbjCvPf8oxdiCSJ8Povw2acG0vKg0RLqzUvs7KG6Sp
	 v1KQ18zsb2Eyrwocu1Ih906Ge+CSRKuca/4e96V7dmklNh8Ak2wAtUGe+wUl5kM+0c
	 lxPhOWFL0eMQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] ARM: dts: qcom: apq8064: Fix USB controller
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE" <contact@alex-min.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260804-mainline-send-v1-sending-v5-3-149dd4372ac8@alex-min.fr>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-3-149dd4372ac8@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 06:52:41 +0000
Message-Id: <20260804065242.5E0021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mapping the transceiver clock to 'fs' causes it to be unconditiona=
lly disabled after probe, starving the USB controller.
- [Medium] The patch violates the generic ChipIdea USB2 device tree binding=
 by defining three clocks for the 'qcom,ci-hdrc' compatible.
--

--- Patch [3]: [PATCH v5 3/6] ARM: dts: qcom: apq8064: Fix USB controller c=
locks ---
commit 3215e94f01093ac3a7be7c7e9537c0ae784e33fa
Author: Alexandre MINETTE <contact@alex-min.fr>
ARM: dts: qcom: apq8064: Fix USB controller clocks

This patch modifies the clock assignments for the APQ8064 HS USB controller=
s.
It maps the RPM Daytona fabric clock to "core", the AHB clock to "iface", a=
nd
the transceiver clock to "fs" to ensure the fabric clock is properly enabled
during controller access.

Link: https://lore.kernel.org/all/20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec=
8d33d0aa@smankusors.com/

> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts=
/qcom/qcom-apq8064.dtsi
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -813,8 +813,10 @@ usb1: usb@12500000 {
>  			reg =3D <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names =3D "core", "iface";
> +			clocks =3D <&gcc USB_HS1_H_CLK>,
> +				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> +				 <&gcc USB_HS1_XCVR_CLK>;
> +			clock-names =3D "iface", "core", "fs";

[Severity: Medium]
Does this change violate the generic ChipIdea USB2 device tree binding?

Looking at the schema in Documentation/devicetree/bindings/usb/ci-hdrc-usb2=
.yaml,
it restricts the qcom,ci-hdrc compatible to a maximum of 2 clocks:

Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml:
  clocks:
    minItems: 1
    maxItems: 2

Adding a third clock ("fs") without first updating the binding schema might
cause an ABI validation failure during dtbs_check.

[Severity: High]
Will mapping the transceiver clock to "fs" cause it to be disabled during
probe, starving the USB controller?

In drivers/usb/chipidea/ci_hdrc_msm.c:ci_hdrc_msm_probe(), the driver appea=
rs
to treat the "fs" clock as a temporary reset clock, turning it off immediat=
ely
after the reset sequence:

drivers/usb/chipidea/ci_hdrc_msm.c:ci_hdrc_msm_probe() {
    ...
    reset_control_deassert(reset);

    clk_disable_unprepare(ci->fs_clk);

    ret =3D clk_prepare_enable(ci->core_clk);
    ...
}

Since there appear to be no PM runtime callbacks to re-enable it, mapping t=
he
USB_HS1_XCVR_CLK transceiver clock to "fs" seems to mean the 60MHz ULPI clo=
ck
will remain disabled unconditionally after probe.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mainline-s=
end-v1-sending-v5-0-149dd4372ac8@alex-min.fr?part=3D3
