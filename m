Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4305349BE
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867915; cv=none; b=U2fzvWvTVwXGsWcYokJMxSFEI07U8lf9A4CR2CA27dO2o5Nbxph+1PJQjvPqoAqxRv6cfsc2OfnFS8HThzA30spDz9uhCYcydwfGPLUbjxBBRs1IgRYZztp0EoF0QeQsH1SrFcA5zEi6DPO8/8eMZBkWCdFx0QWcpKwxHyNGIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867915; c=relaxed/simple;
	bh=6J+cZ3OLRHLKRH3WQYNcAInkS86VLIA16hon6klpzt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rYsbQ3AwBcr+0CuVUBFTkoEY4Eje4zqCz4TcTMJrRC6lLxyvaA0zmojC8AbpsA7xRCr8Cp0ET8PkgJmP7u9h0UxCKqO+2IXwX5m8l3ACJZEsty3se5CMufK0ZuA1ijP+rnUegYMz4Veq4g1s09Z4lEDlcetp8FeoyOmGSW+fToo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ay/+KsQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ay/+KsQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9C91F000FF;
	Thu,  1 Oct 2026 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867913;
	bh=JWXvr+g5O2nCLebx2EC7ffQDFIisngIob91Z1yQzhj8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ay/+KsQGQpyRRwvA4t4uzClTGlP6pkqTFvsLyY/zzOXAFQjubiUugNx7ipoY34CYx
	 c6OqPGFw335mwsYP2G+ceettuymw8X+qGkh6TD1x6ZST1uPHWYkgprbVwDFVpr5eQH
	 Vzd0zbd1k2XSXi7HKrBQCao1KcnX417N/Eg8KnBp4twgm8Z1gcCJ/aC/Jm27kSKn87
	 ssYxw+Kv4VmIa1p6iCkNz1jYI29qsG/UOsrUyKyprTEKQ0ywxGYo3oHW7UeFxC2ic8
	 1ZVFS5/lTq63LNFi4TxzIDYDPW4VJIGZZ4mRdSr/cH5zbsJ+Y2AB2/YpyBfPDlVkl1
	 ggEkFH4J7o3Kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: sram: Document IMEM found in
 Qualcomm's IPQ9574 and IPQ5332
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
 <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 15:18:32 +0000
Message-Id: <20261001151833.6C9C91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: sram: compatible strings not sorted alphabetically
--

commit be343d0f902aa8be0dcbad3550c7127521779814
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

dt-bindings: sram: Document IMEM found in Qualcomm's IPQ9574 and IPQ5332

This commit documents the compatible strings for the IMEM found in the=20
Qualcomm IPQ9574 and IPQ5332 SoCs.

> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documenta=
tion/devicetree/bindings/sram/sram.yaml
> index 6ee0b14647222..d65696885e6a5 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -37,6 +37,8 @@ properties:
>          - qcom,eliza-imem
>          - qcom,glymur-imem
>          - qcom,hawi-imem
> +        - qcom,ipq9574-imem
> +        - qcom,ipq5332-imem
>          - qcom,ipq5424-imem

[Severity: Low]
This isn't a bug, but does this addition break the alphabetical sorting of
the compatible string list?

Placing qcom,ipq9574-imem and qcom,ipq5332-imem directly above=20
qcom,ipq5424-imem results in ipq9574 appearing before ipq5332 and ipq5424,
which seems to violate the expected alphabetical sort order.

>          - qcom,kaanapali-imem
>          - qcom,maili-imem

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-imem_resta=
rt_reason-v1-0-79f516906010@oss.qualcomm.com?part=3D1
