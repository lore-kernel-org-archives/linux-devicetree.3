Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338DC3515FD
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870582; cv=none; b=GuGYN+2cYCDK7IONPxYQomflIOqq7GhSdr80qLV9G+XmpIReYSlL/WQ0nbMAni5hbsVJPP1m7k1KQEnnALcuYj8enkNDP6Xh7+IFDVEgfk65o8UwEOuRb+kNfFVFxKwBo+739wiJ7e4HNaj4s63J9U+RK9zUGM1FU7uRlUNdC4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870582; c=relaxed/simple;
	bh=zI6U4bXDw990K3rlZURvGGcqWofVrkNZIgAuA/+426Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YvwdDDzVXhgyYBToIlEasHucGz5bm8XqzIOtKhmYbubdQd0qvl4f2pNjmQOkltnzj4gM2r4bcBDqHa55m02ohsm3WTYffDb2HHWKOhsQJN3zUr/3RYoHrI6BfcSF29QMD3tX7QOqrA+GhPe17LuDVyvo+vC40EkrCos47HLLjXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XL/ODjWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XL/ODjWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A77A1F000E9;
	Fri, 24 Jul 2026 05:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784870580;
	bh=/nKS8KvplJVg/nQZYEaa34jmJhQsYzTiwnYyUJBIsV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XL/ODjWHBaCu970a8JCVHbto9uWexNP3zb7Rd/O2CKJm0TmyZEYRUd5LerQ3eTQZj
	 oeF+Dx6dnYUI0tESrHa8vWRO+DVi+XCKGl5vFhib5kaZElXHcPNpN45WnO1yxxRXh9
	 rX0V4R1KbNHLJJv/lxDQ2H6oTdBb4RfCR8rrvqbWIWW82OfrNMiL0nGY+YxynY/2ja
	 6Ert+wQPUBi5NSatGsvjl39QSOdBsfbBrl3yrx0S0Q2qC13N+9cBRzY+VSY31ndStY
	 7Oy87XqRdFEmAoXERDLFt5vmfLH/BI1zXuC+CN3PeKrOI6EVQnydx6KHo3pQZEZKW3
	 vB5ORThB0+8fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] arm64: dts: qcom: qcm6490-idp: Add IPA node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavan Kumar" <pavan.m@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724050846.3413161-1-pavan.m@oss.qualcomm.com>
References: <20260724050846.3413161-1-pavan.m@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 05:23:00 +0000
Message-Id: <20260724052300.9A77A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `memory-region` and `qcom,gsi-loader` properties in the `&=
ipa` node will cause the IPA driver probe to fail.
--

--- Patch [1]: [PATCH v6] arm64: dts: qcom: qcm6490-idp: Add IPA node ---
commit acbf8a7703458aa79f155d2680e69e464cb8f6f4
Author: Pavan Kumar <pavan.m@oss.qualcomm.com>

arm64: dts: qcom: qcm6490-idp: Add IPA node

This commit enables the IPA block and provides the firmware name required f=
or
firmware loading on the qcm6490-idp board.

Link: https://lore.kernel.org/all/20260722082314.1502072-1-pavan.m@oss.qual=
comm.com/

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/d=
ts/qcom/qcm6490-idp.dts
> index bdc02260f902b..7242695aed978 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
[ ... ]
> @@ -619,6 +619,12 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/qcm6490/a660_zap.mbn";
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/qcm6490/ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};

[Severity: High]
Will this configuration cause the IPA driver probe to fail?

During device initialization, the IPA driver in drivers/net/ipa/ipa_main.c
checks for the qcom,gsi-loader property. Without it, the driver falls back
to IPA_LOADER_SELF.

The ipa_probe() function then calls ipa_firmware_load(), which requires the
memory-region property to map the firmware memory via
of_reserved_mem_region_to_resource().

Since the memory-region property appears to be missing from both this &ipa
override and the base kodiak.dtsi, will this lookup return -ENODEV and abort
the driver probe?

Should the memory-region and qcom,gsi-loader properties be included in this
node to ensure successful initialization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724050846.3413=
161-1-pavan.m@oss.qualcomm.com?part=3D1
