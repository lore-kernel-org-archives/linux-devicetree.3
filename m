Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3605B3EE1E4
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877030; cv=none; b=O8JROl2PfQkJVdVi3im49E901j3XHhamOZlWKB0PmtGbW0uVkqVj0ee/FMvGvr2zENqKjxAp97Z544o0rmtK22+adM6W0ecpvuTrW+ww/oEh8Posd0/Ke5reMqY3KT4Hil/XamTe2jt0Veidr4VZUoKxvaNh8+gACHDu7eyiGTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877030; c=relaxed/simple;
	bh=chjDcrqscHLjCNayevdOux3K6aXSIA5YkYp5IoDJKAQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ArpEX4hVqcz9m0DGUCU6BNe4K8QnMNqjan/VIG62mDGLCDHXqUlj0CwydD6BY/iFpKsips7KV5092WtKTVERqowZSYclPjzqLstEVRVabRJcKXLmbwfar0jQi6il9ctl/npnNI3bQxpUq1OQT+ECfBKQRdI6t+PVPcz5whgIxvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bi6CGXjq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bi6CGXjq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35CC1F00A3A;
	Wed, 27 May 2026 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877027;
	bh=FnKAywV++uj0YhHvb8NsKsvDuQsUJr+2yipnQYJX1e8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bi6CGXjqH1UB5U9ql2/aKZaIA+NjHcN/g8bBlgz6GQIyMnC/d4YvOBKkARQ+dweHH
	 EbbLoTJ2gGqUotQhdj1qtY1HiipmkyN/m1GN5AlPxDAuNpHU8L1U0dY4U7kvA5MM1e
	 jAx9CADaye2uViRDTp5TvnwcyiKa9UXCvXTzxL36IaCOsoPZRENtJdWoMX1DJRNqUL
	 3IBe3NV1ZhGIqtC26oqLy6nYbi8mdERLaSm0CJSJlGR8SDMo7QjGqyFRh/fmygV1BZ
	 sQjXJb5OfwKMZuL9SvS7rUbFeVRbPzgkKnYJ7x/h5TYmCrT15DXtCjvgsVQJeLVkvU
	 5KQdwV14BZulw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/24] arm64: dts: qcom: sm8150: Reduce OS PDC DRV
 span to 0x10000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260527094333.2311731-8-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 10:17:06 +0000
Message-Id: <20260527101706.E35CC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Reducing the PDC `reg` size to 0x10000 in the Device Tree trigge=
rs a persistent boot warning and fails to actually reduce the mapped region.
--

commit 0bc4a6740625a7680dd3bd2099be3c1e864d5c1a
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

arm64: dts: qcom: sm8150: Reduce OS PDC DRV span to 0x10000

This commit reduces the OS PDC DRV register window size from 0x30000 to
0x10000 in the sm8150 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 0e101096209ab..661848ef5eee2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -4174,7 +4174,7 @@ dispcc: clock-controller@af00000 {
> =20
>  		pdc: interrupt-controller@b220000 {
>  			compatible =3D "qcom,sm8150-pdc", "qcom,pdc";
> -			reg =3D <0 0x0b220000 0 0x30000>;
> +			reg =3D <0 0x0b220000 0 0x10000>;

[Severity: Medium]
Will this trigger a persistent boot warning and fail to actually reduce the
mapped region?

Looking at the qcom-pdc driver in drivers/irqchip/qcom-pdc.c, it contains
fallback logic that enforces a minimum resource size of QCOM_PDC_SIZE
(0x30000):

	res_size =3D max_t(resource_size_t, resource_size(res), QCOM_PDC_SIZE);

If the size provided by the device tree is less than 0x30000, it prints
a warning on boot:

	if (res_size > resource_size(res))
		pr_warn("%pOF: invalid reg size, please fix DT\n", np);

Because 0x10000 is smaller than 0x30000, won't this cause the driver to
print the warning on every boot while still remapping the full 0x30000
bytes anyway?=20

Does the driver's fallback logic need to be updated before applying this
device tree change?

>  			qcom,pdc-ranges =3D <0 480 94>, <94 609 31>,
>  					  <125 63 1>;
>  			#interrupt-cells =3D <2>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527094333.2311=
731-1-mukesh.ojha@oss.qualcomm.com?part=3D7
