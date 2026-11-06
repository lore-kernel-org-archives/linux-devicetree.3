Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962450;
	b=Oq1MwEWBTvO4yW+A9fNFZEvnxCd6flgkDsZ+hNqoa3Ibfkux9oNkS+HVWBtxYx1G4ZCk
	 sLyhFezdB+aT+FOJRADg6NDOW07rLlv/gugACSFe0lwXNIaZ6j12waApsUC/2jC1nnlvx
	 FIhe06C2H4lA2aVRR3FcJ62sY3rbyBsf50yxoHdKOwryicQOMbyV/NHF7GtcdkGd1Y7e7
	 eZjSrK0SgcYSiPU1zh8FMKi4bxzDz7WBF7wJ8zUvhwNdoaEZmX1O9fUXSQlirz2GsPgrJ
	 yJe7yVzGe4E33XqXSbPH03NSKf8rUX9XkuqnLAFJTYOAyJcR5DgwGDWHZGjqc+B9vWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962450;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E5K0K7vFwuaiVldhUkB3W66piNAnwDOGWt+Bwbq9N14=;
	b=jDuoywzbc6TXWAFR9XpoJ4yE6klNeSV2y01qwwYmYRPuF9vARIDU73zgHvCx7DaiNdqR
	 9k/4ZpgM6N/W3vMObMXfh2cvN6CIqNGtdfk5X/xCgw/fYfA59u4oZl4OKE12cnNORpcBC
	 tzS4iHBpqV0DeoATrY99OZG5dFvxqcGrEWD1IoYgj4996WdKKNXaSuN3my3O6TY9YXJJT
	 XSGIP/7zapwyw1FWr2yJD9BNQ6P3mHFei93lTONa0hHH9n2S32oZNu5H5Db5quVs2QYH2
	 jEp4kHZJcNMHr8MRJFkohXOkfQahJbVxazxHOJYoG+BIRTymrwhMxnQ4FrsvEWHWblQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a1/9PKM9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D38606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a1/9PKM9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DA81F008A1;
	Fri,  6 Nov 2026 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962450;
	bh=E5K0K7vFwuaiVldhUkB3W66piNAnwDOGWt+Bwbq9N14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1/9PKM9y4Zjg7F7LmUB91b89kaW9modZxnE/+L1LhwqQVFmEU7xkKI4G1EOTx4uz
	 9bet7Oe+L72lawzxkgVQc8ZKH0TAbX9sWkMyFY6EmYdYXADLyFOM6HWe9xV6fo+EHd
	 w3G/qq4pQoRy9Ixza3xkT5spAKYkRYOSJSd2p/2BCwYNFYlY+S0Eul0xYd5yJNuvP+
	 ktmilag1W+Oxj7juNqISsfjYHe9CeMUoe2k8dU0/xL8aMHwVM9wom4BoxZ51lafiqE
	 BEVgYf6sdEg3IAvcmX3bBI9cuYIN0Ce14SDCVNwRnQ2wjLlvllGVCeEo5AyrN+AETb
	 gjIXXFPUiaGgQ==
Message-ID: <sashiko-outbox-201242@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/10] arm64: dts: amlogic: meson-s4: use the S4 secure
 monitor compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106104659.54656-5-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-5-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:54:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: amlogic: meson-s4: undocumented and unhandled
  amlogic,meson-s4-sm compatible
--

commit 7614308a3cef6b940646583a9f25a7b443724222
Author: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

arm64: dts: amlogic: meson-s4: use the S4 secure monitor compatible

This commit adds the "amlogic,meson-s4-sm" compatible string to the
secure-monitor node in the Meson S4 device tree include.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/=
dts/amlogic/meson-s4.dtsi
> index 57270fbfb4a73..793c7bb9512eb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -135,7 +135,7 @@ xtal: xtal-clk {
> =20
>  	firmware {
>  		sm: secure-monitor {
> -			compatible =3D "amlogic,meson-gxbb-sm";
> +			compatible =3D "amlogic,meson-s4-sm", "amlogic,meson-gxbb-sm";

[Severity: Medium]
Does adding "amlogic,meson-s4-sm" break dtbs_check on Meson S4 boards?

Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml only
permits "amlogic,meson-gxbb-sm" or "amlogic,meson-gx-sm" followed by
"amlogic,meson-gxbb-sm".  In addition, meson_sm_ids[] in
drivers/firmware/meson/meson_sm.c only matches "amlogic,meson-gxbb-sm" and =
no
driver in the tree handles "amlogic,meson-s4-sm" or implements an S4
power-off sequence.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106104659.5465=
6-1-christian.koever-draxl@student.uibk.ac.at?part=3D4
