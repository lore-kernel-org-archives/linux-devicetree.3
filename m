Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A363A839B;
	Thu, 13 Aug 2026 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613004; cv=none; b=AoGoLb1Qjiigw1P8u5Iw6hVbtQWXD4iEiIZ0VEAkr1lIFD+Z1eVmWmQ4Absy2FX2hx5KbeIqQJrVtLBveNhQESfkWxGtaG1Prr3E0b06oZH7151t7fEHQPa/JLAmjOBi+IMZRFx2xFDPF9nSmv1BVz1xmer5F81P7GQ20qtjAcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613004; c=relaxed/simple;
	bh=s3zI7nOLR0Z5vKAKeewt7XYVpty2Jl2KAfOyuADbS44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hkyg+Sf8JU2d2v8vB+HtcqRsxfaanJSqHVpQeoPUm2U7opoTArwVoOOv7fcqv8h30r6bSNiwUrFvUAMrnj7x0BFFLCxAUCtW1ntpVdV1P71IM7C0YdbaJZ+yqbdeqWVgMQuGM8/vldFYs778z02Kho77dOFWychNPAk9m1OjoK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUKPOEnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUKPOEnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679C91F000E9;
	Thu, 13 Aug 2026 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613003;
	bh=8vxeSAsDBifNCk9WgDPm7H8YFJNCMHP4uEaDtM1kMGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MUKPOEnp9Rs7/4PJ/y3t0htFbL+cTmu4fxHM8DxciFv6tVxvfrevpnUXRCANSbhMB
	 O45gsgLAIUsb/emZjwsFAj09GCDN5djCgczknk4G5ooi/zDgok9kWcDx0YtyC6zhYo
	 hJySgqjo9GKw3LE06DwgnyD+l0NPuFueM4SwPiHKUBqCZsRo2UX1adxcWdDx/oy7Mg
	 i4kcBJeNI2C7AvIKjUCcHFzLU84m2IpZaKr1znd5Ub7Rv8pHgQchurfh07bjDdo6o0
	 AIiSYLolngui4dkmNV1/aw7fqVbgSBgrn/HjvbERszh5imzAtuxTqMSKjWQ97Gm3HL
	 h8ygL32EShHkA==
Date: Thu, 13 Aug 2026 11:23:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Retroid Pocket QCS8550
 Devices
Message-ID: <20260813-tuna-of-pastoral-mastery-8ca99c@quoll>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-2-a5a365ba3dc5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260808-rp-qcs8550-v1-2-a5a365ba3dc5@gmail.com>

On Sat, Aug 08, 2026 at 12:37:56PM -0500, Aaron Kling wrote:
>     Namely:
>     * Nova
>     * RP6

Nova what? This is some cut commit msg.

> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 954be28203017..52ef669d6fe9b 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1161,6 +1161,13 @@ properties:
>            - const: qcom,qcs8550
>            - const: qcom,sm8550
>  
> +      - items:
> +          - enum:
> +              - retroidpocket,nova
> +              - retroidpocket,rp6

This goes to the existing enum.

> +          - const: qcom,qcs8550
> +          - const: qcom,sm8550

Best regards,
Krzysztof

