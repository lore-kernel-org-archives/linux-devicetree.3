Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7FF305682
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561347; cv=none; b=G32dTVaM6azlyW4GvQ2HoUlbWC/wkUkTgAGZP3mI0Uhqq11GramD+/JFwKOQDtf7fgwlb2AW1syCd0IzMBgsvFwvpOnBpGOyJ2mezZsJ8ia16ojIuXSIjGtDZ/aILf9wn3ux8udYh2XYDnuoGVJVQqZAOXIOJX1iv2ZUgj520HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561347; c=relaxed/simple;
	bh=qIf0q6nPGKv9Kn7b5/DqMsF0DvqjDrnhgzFo5r92Dyk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=klk1hECoUvKJ4Qtv0BJ0aFvjqGwZR5MQ2xhboMGZgtx9OWpf0rjPVCfBVOiTL+oMoQm5doJ1ut3hr+5wQ+Yg1zEAmb2Pno4IwZx/xwJYSHfvaMLqpHehl7mAsE4flPsJOJ/f92CuSwJctX763ZBfdYDnr8Iwd9CGCx2lUGHxjLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQHjIXSc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQHjIXSc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787D21F00893;
	Thu,  4 Jun 2026 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780561346;
	bh=qLESv79Gs9i/g3fBG1Ar34reaAJiM2FZ8YIohVIqRUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SQHjIXScgJXDMfdK5itfyUkXp+9Cw8vo5GPX2aWf9CosmbKN9v8hZrfbSCVzBsRK9
	 LMt1VQn6YCO/Itla9b+u01m5hewVzPAAggChb6Ug1pC3PB83HURSnIjxgYmJXHqCpD
	 ARQSmjqmJlG5ZE231wrX0NqDa1Uuae6/xhRxo86cCyoXmaa/otBBd/2hfoiG+Q6iFS
	 3QZpRvbiPfTfvpbup1rInNJM4x2bWIMpX6M9SVymg1q98rQf5H2x/TT/NM8CeooCPR
	 6w3AkhqRSesYg/kpSlmZI1zJ9lwMu6pA6XRgmOel17q5rzQ/6KKI1zpBryNc1lzG8y
	 tYRsN8G8T+Lcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim
 7x Gen11
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260604-topic-yoga_submission-v1-3-57c70c23d0d6@oss.qualcomm.com>
References: <20260604-topic-yoga_submission-v1-3-57c70c23d0d6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 08:22:25 +0000
Message-Id: <20260604082226.787D21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `vdd-micb-supply` in `lpass_vamacro` node breaks DMIC capt=
ure.
- [Low] Missing `key-volume-up` subnode in `gpio-keys` despite claiming its=
 pinctrl.
- [Low] The `nvme_sec_reg_en` pinctrl node is defined but never referenced.
--

commit cf25549a8fd93e158d3d638230deeb2a24306da5
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim 7x Gen11

This commit introduces the device tree for the Lenovo Yoga Slim 7x Gen11
laptop. It defines nodes and configurations for several supported hardware
features such as audio, GPU, keyboard, and networking.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arc=
h/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
[ ... ]
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		pinctrl-0 =3D <&key_vol_up_default>, <&hall_int_n_default>;
> +		pinctrl-names =3D "default";
> +
> +		switch-lid {
> +			label =3D "lid";
> +			gpios =3D <&tlmm 92 GPIO_ACTIVE_LOW>;
> +			linux,input-type =3D <EV_SW>;
> +			linux,code =3D <SW_LID>;
> +			wakeup-source;
> +			wakeup-event-action =3D <EV_ACT_DEASSERTED>;
> +		};
> +	};

[Severity: Low]
Does this code miss a subnode for the volume up key?

The pinctrl state for key_vol_up_default is claimed by the gpio-keys node
here, but without a corresponding child node, the input subsystem will not
register the volume up button.

[ ... ]
> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names =3D "default";
> +	qcom,dmic-sample-rate =3D <4800000>;
> +};

[Severity: High]
Should this node include a vdd-micb-supply property pointing to vreg_l1b_e0?

The audio routing connects the digital microphones to the vdd-micb DAPM
widget. Without a vdd-micb-supply property here, the lpass-va-macro driver
falls back to a dummy regulator.

Since the physical supply (vreg_l1b_e0) has no consumers and lacks a boot-on
or always-on property, the kernel regulator core will disable it. Will this
leave the microphones without bias power and result in silent audio capture?

[ ... ]
> +&pmh0110_f_e1_gpios {
> +	nvme_sec_reg_en: nvme-reg-en-state {
> +		pins =3D "gpio14";
> +		function =3D "normal";
> +		bias-disable;
> +	};
> +};

[Severity: Low]
Is this pinctrl state needed?

It is defined here but does not appear to be referenced by any device node's
pinctrl properties. Could this be leftover dead code from a reference desig=
n?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-topic-yoga=
_submission-v1-0-57c70c23d0d6@oss.qualcomm.com?part=3D3
