Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A61433033
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173490; cv=none; b=dnRqZ6TTlGYf2lSZ3cB5hqbtrS5+U5aB7N1lPxeBLBeJHuriXv2F1PVEFfbGJDXqyAj+3DI9IfCJr5xcvdScA55Pbwf5tjEs4m540xtbOnp/eHzkKx8hvq+usyI32BmSY8lvAYxV6yqM8xJOw6c78NA7ckV46fEPb1JDvN0wkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173490; c=relaxed/simple;
	bh=wNtB+xmEWCtYzwkTlHorlHLBEe90kjTbz2sZqnCNPWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fU2Lmir+JaATwD3/ve5CdCbYC7QBWveV+ncA5fWjbN3625WfwkuDvJIuwXkQono4iiTk106m+JuZYnsNwpJYvhcvwEPBNMg3tHxYxYSE/yz0PGLlbA6+PtdUSOilcP8+ynZrn1eOG5HCX9nqH4gcPuaAwDtDJ7lZ1z/+ujCnrV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4XpD+4H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4XpD+4H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B4C1F000E9;
	Mon, 27 Jul 2026 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173483;
	bh=fHFmZmuU5wfyKx6AJFbv/eHaF8ufiY7n0V0Nx9gcsaY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H4XpD+4Hs4bQL8//1od9nlPWAGvKp1b0u+DVxxOVPVLktUm9zZPDVXR+2NIDtC4By
	 N6921a3X0Za+3jsvHCwyGwA71fgln6E13jJsYBEFi9hhZ8NynkxhOb5zUbHIYtNTz1
	 H/2qT0WAoqnYJgeV6DFmGK2SoTSeMdyZtzYyCSxV4kjehtc22D/PNgOrCn1wRFt9Ah
	 cWv3XMLePObjTJGJr+v3Ma2UumEav/LIOTc49jf5AqMPE7VNPo2txzrNFAZUyCFfDE
	 0RGziHdNNdMeZsNgey3/7ZLQQz0+yJzx2YCegfqRI9QPme3V8TPYCE7JltxDd+wv1E
	 t1bPkaZ4nhuBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
 <20260727-adc5_gen3_dt-v3-4-bc00223648f3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:31:23 +0000
Message-Id: <20260727173123.A1B4C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch adds the `pmc8380_6_die_temp` ADC channel to `hamoa-pm=
ics.dtsi`, but fails to delete it in several Purwa-based device trees that =
lack the PMC8380_6 PMIC.
--

--- Patch [4]: [PATCH v3 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC suppor=
t ---
commit 506a2efbee2639e175314a25d3b48970c6278e83
Author: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

arm64: dts: qcom: hamoa-pmics: Add ADC support

Add ADC node and define channels for:
- Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
- PM8550: Die temperature, VPH power, and system thermistors.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boo=
t/dts/qcom/purwa-iot-som.dtsi
> index 394e65518ac50..661dca4fbee34 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
> @@ -10,6 +10,7 @@
> =20
>  /delete-node/ &pmc8380_6;
>  /delete-node/ &pmc8380_6_thermal;
> +/delete-node/ &pmc8380_6_die_temp;

[Severity: Medium]
Should &pmc8380_6_die_temp also be deleted for the other device trees that
currently delete &pmc8380_6?

For example, these files also delete &pmc8380_6 and &pmc8380_6_thermal, but
are missing the deletion for the newly added &pmc8380_6_die_temp channel:

- arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
- arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
- arch/arm64/boot/dts/qcom/x1p42100-crd.dts
- arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
- arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts

Without deleting the die temp channel, the channel is registered with the A=
DC
driver on these boards despite the PMC8380_6 PMIC not being present. Could
this cause a timeout or bus error if userspace tries to read the dead IIO
channel via sysfs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adc5_gen3_=
dt-v3-0-bc00223648f3@oss.qualcomm.com?part=3D4
