Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906C3A1E96;
	Wed, 27 May 2026 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875222; cv=none; b=NAqHBkiAy2RxPXAhWqpyUcpz2NN22b0H6QbtstHPeM/ega1nOOaDxMosoQ2WGo+ln/vMzoU6JXdj/a0PnYly0ZaF27ylPtLgK8e3/ywxpFMyVEpiq7BDKS0TWGiHUwVFaEioaQU21CwQdUmKIKuUIICo1uOyNFnr9b7vSpMA1to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875222; c=relaxed/simple;
	bh=pvSyXhIAASx1/AF9cmUIcyAZU34WNwAkrQAANNdf+cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNOmnAWEAE6IHfhVFmchO+771F/tdgPdbAZ4Kh4cVOuP6hbZWB8CVF/G5xlYsiI7EKk5XIdQskdOpuxDWB9MgfcBY9S/r/8EYGKp9elFlPv/f48OjoRAu3rnkHyKJHWSPxuz+70eyQeli9qfY1J/ThIytfm76kp01DFSbOv3FL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dztGWNBX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dztGWNBX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3001F000E9;
	Wed, 27 May 2026 09:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779875220;
	bh=h4ygXi+M61Kh65pAlNbVGkkZk7Opw5+JbN1xsmPciA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dztGWNBXJlrtM4TSWDh08qXRvph15INJ1Gv5A3AGaywUjyIvqklrgH6H1ao3LPfri
	 j/gEkobn6ZBREZx9MfeRbB5IoFN6NHeGDGJT8KW8YrUUg+QZ9MiTgxpErIak0ulq24
	 UEeZBX3HIJCg4tjmyVIPjyIrF+pXUJWrATBdZwSFbjmSIRhHdZpeJs24t51Bd3BWgz
	 wgY/iST2IURBxtJsYEcDrnbg+l1aIfY9NOsd3bd+jNumZ1iHBmrn3ey5htb5thXccX
	 bcxm04D7kpBhMmeH4LHeF20ECtxKiPbbpLeNABrc9zlGKrTT6X4Mk5nSLAJEzOkmnb
	 XisbgmYN1Mg+A==
Date: Wed, 27 May 2026 11:46:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,qcs615-qmp-usb3-dp-phy:
 Add support for Shikra
Message-ID: <20260527-lucky-porcelain-bullfrog-185f1d@quoll>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
 <20260526184401.3959717-3-pratham.pratap@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526184401.3959717-3-pratham.pratap@oss.qualcomm.com>

On Wed, May 27, 2026 at 12:13:59AM +0530, Pratham Pratap wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Declare the USB QMP Phy present on Shikra SoC. On this SoC, although
> there are DP registers, the required internal pins have been removed
> and hence DP wouldn't be operational.
> 
> Shikra needs 3 resets (dp/ phy/ phy_phy) to be asserted and de-asserted
> as per hardware recommendation. Extend the bindings to accommodate the
> additional reset.
> 
> Use QCS615 as a fallback since the software interface is compatible with
> Shikra.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml    | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> index efb465c71c1b..65ae4c6e09db 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
> @@ -16,8 +16,12 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,qcs615-qmp-usb3-dp-phy
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,shikra-qmp-usb3-dp-phy
> +          - const: qcom,qcs615-qmp-usb3-dp-phy
> +      - const: qcom,qcs615-qmp-usb3-dp-phy
>  
>    reg:
>      maxItems: 1
> @@ -33,12 +37,15 @@ properties:
>        - const: pipe
>  
>    resets:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3

So QCS615 has three resets now? This needs to be explained in the commit
msg. Or fixed with constraints, see writing bindings.

>  
>    reset-names:
> +    minItems: 2
>      items:
>        - const: phy_phy
>        - const: dp_phy
> +      - const: phy

Not phy_phy_phy? Joking aside, you already have a phy - "phy_phy" - so
this is not correct name. I don't know what is the correct name, though.
Please consult device manual.


>  
>    vdda-phy-supply: true
>  
> -- 
> 2.34.1
> 
