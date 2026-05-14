Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC0035676F
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788721; cv=none; b=DlRKCNZJwAURvJ+BOohVsYsWhawDI3UyBueRDDyuhozbTFV0pmWPdcu3/YbyEFYYfl2zh0+RwHOaTEfBdoZ4sgawnh61AGXQqw6gPLsPH+w1j1clQsN8ZYCHmHgLJUShcMQgCQf65ykqtw5Gs/myTR3MK4kF78RBP+vDXsGHbSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788721; c=relaxed/simple;
	bh=rDxXD0Z4qnlgpI89GJfrGGHHWixjnMdkfE3luc3E+Ug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WT+n1X6lF+iCDqpHGlC68t2pQhvRWwIciG3o1VQVkl+YPz/682WeHgbuh/spyYaMINiX1/VpCf9x1ulhai+p1urStAoooFsZRvkHSQPRsia0PVDLKFyN0LJA7559sCHFxjYpRUHniN9zxBsDWS5YQOwu27xUtj7Q7iudsfBrOfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNhxgiKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNhxgiKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D65C2BCB3;
	Thu, 14 May 2026 19:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778788720;
	bh=rDxXD0Z4qnlgpI89GJfrGGHHWixjnMdkfE3luc3E+Ug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jNhxgiKDrufKULJQp717P7QKVde7+q9iwiZNHFGrTlPBHGu9rjrPd2JzoCiehDfuD
	 PyivzMQtfq/nAvOQ5FLWG9xOwl8MlB8znPTNIuBnqhhz5wlkcd2zzdHCz2au7B6AAX
	 2RrREY26O1zpb0uCLbiWFLXPAmgKF9cGe37TD5sWdSVCUcrXVpx/xvKD7AtVggPT2+
	 U3xPDfbLRkMupOCel6hCLp4CSrivApmM+ReDVbezQbDALnbMZ2FJVLkiTmrSg0EdFX
	 5qXj6UYCi0GlYOg2HZo/x2HNhUYmZN49c4LrQnJFoVEE4W0XDf6opCh+WoXBhctO+4
	 x4S9+OM+KpFxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add Eliza-specific PM7550BA
 dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514-eliza-adsp-usb-v5-2-a21056ffd892@oss.qualcomm.com>
References: <20260514-eliza-adsp-usb-v5-2-a21056ffd892@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:58:39 +0000
Message-Id: <20260514195840.88D65C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Duplication of the entire PM7550BA PMIC Device Tree Include file to=
 change the parent bus.
--

commit 5c503019cfe9b06711f49ae8a17f64175ea5c01d
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi

This commit introduces a new Eliza-specific dtsi file for the PM7550BA PMIC.
It addresses hardware differences in the SPMI bus layout on the Eliza platf=
orm
by duplicating the PMIC definitions and placing them under spmi_bus0.

> The existing PM7550BA dtsi does not provide a way to describe this,
> so introduce an Eliza-specific variant with the appropriate bus
> configuration.
>=20
> This duplication is required due to hardware differences in how the
> SPMI bus is exposed on this platform.

Is this duplication strictly required? While this isn't a bug, it seems
possible to avoid duplicating the file just to change the parent bus.

> diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/bo=
ot/dts/qcom/pm7550ba-eliza.dtsi
> new file mode 100644
> index 0000000000000..18692893ca418
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
> @@ -0,0 +1,70 @@
[ ... ]
> +&spmi_bus0 {
> +	pm7550ba: pmic@7 {
> +		compatible =3D "qcom,pm7550ba", "qcom,spmi-pmic";
> +		reg =3D <7 SPMI_USID>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		pm7550ba_temp_alarm: temp-alarm@a00 {

Could the common PMIC properties and sub-nodes be extracted into a shared
dtsi file using node appending?

If the shared file appended these thermal and GPIO definitions to an existi=
ng
pm7550ba label, the individual board files could define the empty base node
under their respective bus (such as spmi_bus0) and then include the shared
file.

Would this help prevent future maintenance issues when thermal trips or GPIO
definitions need to be synchronized across platforms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-eliza-adsp=
-usb-v5-0-a21056ffd892@oss.qualcomm.com?part=3D2
