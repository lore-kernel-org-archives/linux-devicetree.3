Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B01552FD;
	Wed, 20 May 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273823; cv=none; b=ayzoxBiYKD8j1L+Fslnz8zdzp7Rb+bvUFFmoKm5K5jlzFTNh7I1Vd9Xm2iUbNUKs2V8PbBOTTsv6jZn6srI+g2f5mADm2Q6TaVp3Z36b4WGdLp1NO6sScekSdOZwbRVArJhpXEIX2v6xeikXYmrxC0Xf1kh3zWNUnBJYgo/4JxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273823; c=relaxed/simple;
	bh=bj6Id8EAV3QCFlNOdRDwqcZrzk2gNVRq8xA89i4EBWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/MIllgoU8V27a4H4HDj4Rz+P2rQ+p/AsvcogIQV9HS8gkLOpwx84HEvmBfmc+h2bXDp3Og230na/cMUQhf+feHNdyHTwXKywBmGcPatS5szWD2CKdx1F8ckS3JI55pTha20bwsvFYpd7azGNwPh1UcMb3osfyGY9fjbL64xeyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YY5b0DEU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YY5b0DEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E8D1F000E9;
	Wed, 20 May 2026 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273821;
	bh=QZv+oZ86UOoW/9p2GNR7IP+C5hYApHGXtBu9CwDd9N4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YY5b0DEUP2T740InDXQ5sM18b8TzbgHPEJnsPiw2toEnodbAMok7wxmuGSEb7QZHU
	 WSLtu+MGw+cD2ZJJoWidwqhrAMyL19I5SY9vyvH9nFMK0QJXOraj6uhRR3UZNLKeqX
	 D5SjxhpoX+zEKsH9WNaNAXBTBfpZpx68JBOa24H6zhqu0iCBQx4bHUlenbQ9SRAktM
	 GR2mrcKhxG2HDBStPSgnMcXK5LynZE0DBSx9hBWloHbRDrcu0XbxzkAQCw/9QSXVyW
	 gtuBK2UJVVNXlDm9RvhQDJgz4flAD0cpmb5bNtTJXdZ29dg9RByzOr9RwhBzDHipBN
	 5LUhJbclz1fUQ==
Date: Wed, 20 May 2026 12:43:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
Message-ID: <20260520-hilarious-tungsten-giraffe-5f8cc2@quoll>
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>

On Wed, May 20, 2026 at 12:35:09AM +0530, Vignesh Viswanathan wrote:
> Add documentation for the CDSP Power Management driver, which handles

Luckily we do not take bindings for drivers, so I can stop you right
here. This is frequent feedback, expressed many times on the list, said
in many presentations, including DTS101, explained in writing bindings.

> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
> Power Mode (LPM) transitions via MPM handshake, and provides virtual
> regulators for the remoteproc driver to control CDSP power rails.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,cdsp-power.yaml         | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
> new file mode 100644
> index 000000000000..f0f89fdeba4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cdsp-power.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,cdsp-power.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CDSP Power Management
> +
> +maintainers:
> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> +
> +description:
> +  The CDSP Power Management driver provides power management services for the

NAK, again driver. I finished here.

Describe your hardware or drop entire patchset as it is not suitable for
mainline.

Best regards,
Krzysztof

