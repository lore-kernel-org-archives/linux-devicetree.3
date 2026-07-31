Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872C40DB5E
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495161; cv=none; b=N5rdk8t38Q3QMzOth9Vovw1+XtQnoeg/BIYKs/pc4i7OupUdbVwZI5ttbijECggVbVKwF+CdItjDLF/VwRhiafaNpMJqXhrdHQzEEojbNpD4mrxiQLTY8AKvZxpRuKiHCcINsY4tCuj2xmtoDcOcHhouLdSV+seCw9gDD1WAt3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495161; c=relaxed/simple;
	bh=ZPdThiDhH1A63iD9l9Qkom9Sl/tyG/cboObxZet6OF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CG3goVtsGNCdExtdxhVsUtF8jawmj8HBwN9s8LpCf/DfuIojQNiRDfXTCZ0ob2tj1M0ll8lHDHJRoQkgyqJ6mUlXmkG3ZaKUbquTyfZYHDvMv65oPypn9QRgI9OjN9BgKuooz8lnlr3lUOQPjxeBUO9xZjqV4wQdRsQKIQ+wXhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuWRnCp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuWRnCp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCCD1F000E9;
	Fri, 31 Jul 2026 10:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785495155;
	bh=XGLTtULwT4XNGu7drjbLhz541hAuZU7IU5heEpp/rOM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HuWRnCp+QHWU/6e6QGSj77+Q2r20+agzd4EBlBm/1u+7YHDBYF1auzuTipCHZgjzb
	 cjNT826nXJQyPvVdOBAd2i5AInD5A3Z8CLsNlQt1pIYPsMKC7nvIY7dsIQhK/V4q+v
	 A0TOI8pQqWrR9yrHZuVN4Vi2YyrojPLiEPZK5aC6KwRNm2nh77v50L6LWN15lujgQt
	 5TSOL+Kd/ODsjWS5Sa9YpQs86ehjdnbRG/HCeofITMMKRbXz+fzX+wDH+G4nuUSt4H
	 3LsOyDdBBjmlCGjA9nZGjE82clXO5lAFRq3i6xCsxcPXPaJgXQV7G+iZgzbQNuP3EL
	 pm7MMlckbecJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-b4-qmi-tmd-v7-5-3befd44403d5@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-5-3befd44403d5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 10:52:34 +0000
Message-Id: <20260731105235.7CCCD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Meaningful code and commit message mismatch regarding cooling ma=
p removals on modem boards.
--

--- Patch [5]: [PATCH v7 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem=
 cooling ---
commit 8e78187a5b8612e6bf1ed1720f537ae83abca9c8
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

arm64: dts: qcom: kodiak: Enable CDSP & Modem cooling

This commit sets up cooling maps for the CDSP and Modem on kodiak, throttli=
ng
them at 100 degrees C and 95 degrees C respectively. It also deletes the
inherited cooling maps on non-modem boards to prevent compilation errors
since they lack the remoteproc_mpss node.

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arc=
h/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> index ac89724ee0993..891941906a467 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi

[ ... ]

> @@ -28,8 +28,18 @@ &ipa {
>  	status =3D "okay";
>  };
> =20
> +/delete-node/ &mdmss0_pa_cooling_map;
> +/delete-node/ &mdmss0_modem_cooling_map;
> +/delete-node/ &mdmss1_pa_cooling_map;
> +/delete-node/ &mdmss1_modem_cooling_map;
> +/delete-node/ &mdmss2_pa_cooling_map;
> +/delete-node/ &mdmss2_modem_cooling_map;
> +/delete-node/ &mdmss3_pa_cooling_map;
> +/delete-node/ &mdmss3_modem_cooling_map;
> +
>  &remoteproc_mpss {
>  	compatible =3D "qcom,sc7280-mss-pil";
> +	/delete-property/ #cooling-cells;

[Severity: Medium]
The commit message states that inherited mdmss cooling-map nodes are removed
because the remoteproc_mpss node doesn't exist on non-modem boards. However,
this code deletes the cooling maps and the #cooling-cells property from
sc7280-herobrine-lte-sku.dtsi, which is an LTE board with a modem.

Is the description in the commit message accurate?

It appears the actual reason for the deletion in the LTE SKU is that it
overrides the compatible string to qcom,sc7280-mss-pil, which does not supp=
ort
the #cooling-cells property.=20

Could the commit message be updated to be more precise about why the nodes
are removed from this specific modem-enabled board?

>  	reg =3D <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
>  	reg-names =3D "qdsp6", "rmb";
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-b4-qmi-tmd=
-v7-0-3befd44403d5@oss.qualcomm.com?part=3D5
