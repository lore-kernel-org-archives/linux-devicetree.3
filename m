Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924773DD525
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250812; cv=none; b=hE26Xs+9bOB9L3yH251FiL3vwP8WQHvlc/Bp31+N0PrmGjxWVubf/QMnB1OASdBDrow2AKrHwZx5hSxJr2S0qwvpE8anJ6mUawHeN/Nl1y+2kOgU+FWQRN+zRKDrA/lR+WXNiMH7Q+mtnmELSBV6EyPDpUkZFjn1xhkuCu4mgYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250812; c=relaxed/simple;
	bh=/oZQN6CLyIMffYWm3DYjqjp43iZSlTeBEiYorOde5DY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WADTtmhSGpQ/K4mxBudaX6MJLkou+J5FQtRKy4OMDR2h/wUqBguC++CmCxH1vb1x+Q0meXgKAjt9caKHCjlyQ5Gil3uPlIbecEbG4gJ45ptX77xbPWARNu25Hmo+ZMlzNMjxL+4ZpZx/Qe1UtBgz8iMtaWvLUDz++9p3G0EuLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ce3gqpem; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ce3gqpem"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-396aa835272so356271fa.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781250809; x=1781855609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=;
        b=ce3gqpemPOhLIiozeWiDvK4SKSxpcsNzFsE7a0IITQaN1T2Udpx5u9iAKze2XnUTRM
         /a5N1yUrD2q/jXd71nR2YfgvtVqqoxTiApaOoV1zBqDkUNWINhHjirumqSqwTSm9/XcP
         KmRAN6ZYZRK3yeK7470HY3tEWGbKwMu2UmJ6ymSCbN8Vt3X16IiX0FG4539kcAaPBuEe
         wFlWEbvPA9bkM5dD1j6kUko5YdVrbhz4h9WBls3h4GVTtCReDb6/OMmOwyJq8zxSsEfx
         6YUKTlo1gweG/9C8x2Ggdwrc58D6ehVQNqk08IRnfywwGNtkARD9rfWrdyaRAczRWPHO
         R1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250809; x=1781855609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=;
        b=k0a57sLwUsbek8nBFXAAWVAlfxuTVB714ccx3ahbbsalbFM9U1ZcykX4aBxSNLDfPD
         UgaN/P5qvdCTQ+fiFOvEPcGWkoU1poK40uXfyPgTHJQV7FprTVfZZIe/hsQHhyxArinU
         wlvGQ7Y6EZerb7ZQBJJqkE0ZzIHXzq8fZmwRbSChOFo1+SLNEvDos2ORvosGAwjmx539
         GqCFJVUtUCJ1qHPl+lAuBS+DmHKOCBJ/bDlOpGpRdDGHExZnsltYXH+hlyjApixUsn9U
         F+Ox3Rp/EqtFMJx7n43qfikUWnBHvmdncx+O4Hr7Kfm7xC4QmqKE/UACKDN9cCAje7jx
         QdvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/16/q5dQqPfnY6h3LVYTIMBnVVHHrDdq3JcV5C5Nqj6QRIHBQfXBSWv3BpAvQL1qRAKr/fEWs8YUgn@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGCLoVUKnSpY1nGsacspwfpZh98CZCeNfuA83R2dain+SRs56
	5VWYAxuq5ad/u6pqUAs0zmSfGieZNe9pC5riKsF6kBjL4S9U9two3VVjI21Xs5cQBXY=
X-Gm-Gg: Acq92OFne3v4mgmdcAAvur9tY/6sWrRj5RWS7F1Gu0JmIcy4D9JcwVs3Ya0WrhkKLg5
	N83oC6WHeJX1s+7cZ3BbLVBzX8Q6ayzSyJPlcx6q7efclgcQkgWJQO/oovYiSKYtxf7XgKFOKvQ
	ZAxfteMvucNuJwZdled7pHVonBOK261ojKocI8hMiY8iyaDal36HviWYAJRopmqupISNxPxCtH3
	itkVNMseiIMdDBOfs/SMpvmqJGKbianOIVYKmXPNB+UcHxjzsticJdVrFYZA6/ja04htPYSMj6w
	jQXUybUyOa76kyeMuGoFffyhKf0qJ3B7AWEfr2I/CkuT6DLi0u48/VXFDPK3Kr3gT8n1Y0OXwj+
	QaYIrfvmsyjAexMAzXs3bnpXdqa8ZOQ9VCkLYR+NstPPlKfeo9VYnEE1VZYyFmox8+AZDV8rAZl
	UgHMGMA457RSbcFNjPOOTal2ofyt8aaMiTkjg4/VDM6jY47yCvjVDqcgRA2L7OPQxlztlLFDjSK
	4rxjQ==
X-Received: by 2002:a05:651c:890:b0:396:7fd1:f574 with SMTP id 38308e7fff4ca-3992b03d73emr2255821fa.3.1781250808762;
        Fri, 12 Jun 2026 00:53:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f1891asm4038351fa.21.2026.06.12.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:53:27 -0700 (PDT)
Message-ID: <a63182bf-ba40-414b-a630-511e97938529@linaro.org>
Date: Fri, 12 Jun 2026 10:53:26 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
> platform-specific compatible string, using qcom,qcm2290-camss as
> fallback.
> 
> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
> single IOMMU context bank instead of four.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -14,8 +14,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,qcm2290-camss
> -
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss
> +          - const: qcom,qcm2290-camss
> +      - const: qcom,qcm2290-camss
>     reg:
>       maxItems: 9
>   
> @@ -76,7 +79,14 @@ properties:
>         - const: sf_mnoc
>   
>     iommus:
> -    maxItems: 4
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS VFE non-protected (VFE only)
> +      - items:
> +          - description: S1 HLOS VFE non-protected
> +          - description: S1 HLOS CDM non-protected
> +          - description: S1 HLOS OPE read non-protected
> +          - description: S1 HLOS OPE write non-protected
>   
>     power-domains:
>       items:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
