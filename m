Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06D282F1E;
	Wed,  6 May 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055907; cv=none; b=NDvnZs8XjGTnlPs269qzccz+wjpPYKUkjJF45ibLHigqz7QCSSszkjUv0UHGD7Y6GquDlwb6CQNLML28Eb2HmPN5J+aWztMuKBixfE4+ItS9LnZO9XiB36lI4Is4BkxKFcoc/dRCdFH3yqAEDm4KmiX/84p2nWRUYgDcmWpNJzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055907; c=relaxed/simple;
	bh=rNqo89TeznXdliOk+PYy1hpxFc0fAsd4HgbE6CeQ+sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiB7/Auk0ugpfuAAzNG/wcp4xqv99hrLzzjxCMQ7HJtGRWcFKeFwD4o/m2wKV+6MrP51jxPp0FHAqdVRVE3la+ptjpzeiXAGdHrn2q31vDh9OQJR1gQmADQBfPJfCNFON2/eL/NbeidBLKFTJm8xy9mr9ku/yqszbOAxUEYp9lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cap+X26g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cap+X26g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AFFC2BCB8;
	Wed,  6 May 2026 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778055907;
	bh=rNqo89TeznXdliOk+PYy1hpxFc0fAsd4HgbE6CeQ+sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cap+X26g5GpKVOxYatMYDzw6pB5NWnwxCrqKDHJRLaj6CkGRAH21H6Tzpq8Szm63q
	 boCyRKBwo86X5VZ26z/PGyA+3uZfRsdFJKY2pwsfse7G07lAcvcfethdCE74Bv/J+T
	 kFjacH0Gp6IyOf1WehVGcS+ijJSYBF0F3Qvmf6+QeN7vwbD5alLKKKlsj1IAybLUql
	 1fWbXAFnHeCoGmyHW95umi6E5RiVM7F6FVKNiM4Tyipmf0XK9T6L8ewefbHVMoJA3h
	 8w+WGkfH/Zxsu9G9XzAbPrLDZxlTF+7KnbFpuLM0Wi9lwd5tEJYxIwx7uJfbv3F3/M
	 SuauHJvQ6CxqQ==
Date: Wed, 6 May 2026 10:25:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Document Eliza LLCC
 block
Message-ID: <20260506-imported-emerald-quoll-fd1ef8@quoll>
References: <20260504-eliza-llcc-v1-0-d7006c899812@oss.qualcomm.com>
 <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-eliza-llcc-v1-1-d7006c899812@oss.qualcomm.com>

On Mon, May 04, 2026 at 01:00:07PM +0300, Abel Vesa wrote:
> Document the Last Level Cache Controller on Eliza SoC. Eliza LLCC has 2
> base register regions and an additional AND, OR broadcast region, total 4
> register regions.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> index 995d57815781..90f5a54b76e3 100644
> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> @@ -20,6 +20,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,eliza-llcc
>        - qcom,glymur-llcc
>        - qcom,ipq5424-llcc
>        - qcom,kaanapali-llcc
> @@ -341,6 +342,27 @@ allOf:
>              - const: llcc_broadcast_base
>              - const: llcc_broadcast_and_base
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,eliza-llcc
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: LLCC0 base register region
> +            - description: LLCC2 base register region

LLCC1?

> +            - description: LLCC broadcast OR register region
> +            - description: LLCC broadcast AND register region
> +        reg-names:
> +          items:
> +            - const: llcc0_base
> +            - const: llcc2_base

llcc1_base?

Best regards,
Krzysztof

