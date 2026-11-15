Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744224;
	b=p+WC0aNcsg3KXau2vC/pSqesiGcOVFfLFJasrxbmQru/45rzxlqF8sjJ7Bj7kgqVcxkv
	 ELry7TbfWS5cpIv/0LJL10fQ9IwmOOocj4bWs0MuQRYwm08BWpkbvhyQx609/+gP7gCrn
	 CEMh+cOhnGEROelcLWQqbjKZecnmVnggBuVwSMYr93refC1KVi75Xic/Eh5Nj0fQeNG5K
	 LKWsv6NX+EMAnFmrQO1cbE5u9HxQFxFw3lI1tk3Gt3cgVygEUOCYvTU57M2OclMSapIeG
	 b/1Ah0BWcpSBXfGgYXccqdDOojHUh8/cDc27nURzqY+z3zAEb3Fmeo4gR2NqBMhm3NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
	b=f6w/Fmx31QIJcDzHrzvS1HwLz+Y4t1vY8L3w5xmL6BLc228un1bRWlEl9T3ZENd+Xx2+
	 1Uw+hlQCNoLFP31ZIYoiV+fHYPDm+kx5s1ETZzv55iuqjnIr06saOlY4S2FVPqr4cRcgN
	 MJiTPuzQKd7q4EOZc+SoZ4a3b6T+hHoXutvhbhV21az7u31B8XkU4CJcqdDXOEq1+BN6s
	 YItGduEbO/+qqoCplAXJZqI0ODKyuiIzSMPSiHDyJ5lnGquGjj8QepNuhAuXaMIfgEEFG
	 d8Yv5jkLpyPtiTDVMBnpMCvFMPqrhRpFPk5ksnTiP0kavYDw7J1P5o2aweWxpiCIfEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUV0k4wi;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B734606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 12:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B734606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PUV0k4wi
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so14295345e9.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744223; x=1795349023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
        b=PUV0k4wiuHhnC2t7Hsp/WAP5J+moB0hPEz1xgcSUOumUT/V74YrWQ+u4/kcDQAZZAI
         FU1UcT4LA71zQaO4RNN3fDK58kEm0gyjmnHcM9RXVv/QQUcKWnFnRVFUJIN5LvgOmRbU
         CdkX2MpZzMt3w1jVBaRwXSai8LXU3yenBkKD3eLHOTo7bbQWZTnRfd7OxqDr2Tm7aqgM
         tqbEjAIs/onLiVZMqsDdlB+BeBjSC46vX/IUEnjCJMfCs4q473Yu0+LQXUWKpIUAmuWq
         g5GqBSIfulUimYpqvkhkiTnwvyFlIbN6ai/HPSelBPAghTiFoksA7JqN58Ta6+eI4q4I
         045Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744223; x=1795349023;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2xfTStPsDXrBa4bi2OyO6+uMbuqPCiOosCTtZjhiB0=;
        b=TLNabY1lAzRWE2/yUONE6UbaSNpZ9Q6yLaoyLn0U/FNf+oL78VYA2oCrcQv1hIUWzJ
         oLIGQNS1Rg0ibf0c0tP/DQUF6EGjAnu3k9ayfRb9/YMJB9M7F3zD1nV/vVu629IiJkFY
         Q/pU1IVBmhb0FhoE78rGyX4S3Wi5SYNs65oPapH/k7ChRHs1eEsUAtumyWTMPr6A9Du+
         eYEdEflW0n2p5DUiNCUiSK9D8U/XR8g24koQ8iDOEOi1+n+wIBAgNUDH1nUrJB02OPSI
         2vtjkcEIkcNEAO81I7peTo6Gs7JBj8l9DvCa7VRytY9iAqb4sZs0F90SG1LJODIUC9s1
         R6Xw==
X-Forwarded-Encrypted: i=1; AL+hErEFVRTJYf7eJawT5ABju9+EVo+I7g9hdxcYHVojuHYXefgadV+IlnBsnMHnTbTlnLs6vyqbaYlQ8F8T@vger.kernel.org
X-Gm-Message-State: APuU4Z8ntZoPjQuHPztC2ca0nm0F3OQqnZ1zLhXi70YsvYJZ96If29rI
	ZlmCIWbaBmOTJGk3e0AHGi0/9HcCde/uYSNGgeFmgQA7xNg8hF5v4MGUtMVZ/azdyBc=
X-Gm-Gg: AYBFou0GlUm4guHzcRP9CpFsv1zKo0aVsmCSWwrqJ90zmNZ4ySHVo9MbdTIMlrGIdXs
	rAMmD6MFngYzdHbgQmo4fq15DcsDOHm0m9bCUTPPc3d2h5xk6o26h1njHZaMx9IOaDexcg3pnse
	OQvK9821hXENCAm2dqTt0VD7+mswNIjly2aoTJ14qMHXffYuYRgaGXQUwathiIVNcnFbRWILepc
	RZDnng7Ku09DAuvGaBtq4DU7w0antXRJx6VcXB4Mjq4nhudzNWbNoj0t2PIskxa07WNjm5lKOnH
	5c071tbYmvtSu2vnElPV+j7jcqDU8MqG04GB2TRLaxVwubvm79It+NkvChKfBp2Squ9vC1zOdmS
	hKmmHQxQxCL/C/a9IaLCgn4hg4CEypu8+8OGhZw5EmK6BJEnDwCpYBIshVJyw1HEaI8dGeuicQe
	KFazeONYmK64NpPUWFWDMSu8DEfQXxFfyc3tsXpDXEEMWu4FjF8cdcDAwrhqvGfOTytxjQYRQCs
	vJg9vAg71x4jna8zaTxaLUC076XkRufrzcOl7nV9l3Qdx6fPD+Iw8tpKWZKw5K4/VBFnqRllgEH
	dEAhfbvPTfnjxrRn1tM/Atml95G8N7zksBmApPvKXmQ=
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr148644995e9.3.1794744222495;
        Sun, 15 Nov 2026 04:03:42 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60021375sm15371401f8f.29.2026.11.15.04.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:03:42 -0800 (PST)
Message-ID: <31101889-9d4f-4863-afb7-0f884b50088f@linaro.org>
Date: Sun, 15 Nov 2026 12:03:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Eliza CSI2 PHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> Add "qcom,eliza-csi2-phy" falling back to "qcom,x1e80100-csi2-phy", as
> Eliza integrates the same CSI2 PHY IP.
> 
> Eliza has no MMCX and MXC rails: CX feeds the existing "mmcx" input and
> MX the "mx" input, so only the power-domain descriptions need updating.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 8ff3df1d0d2787b2af0499c1e4106b86f56ff82c..884984f6f6b9e595df9bb3b0027c0bcf285b8058 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -22,7 +22,9 @@ properties:
>             - qcom,sm8750-csi2-phy
>             - qcom,x1e80100-csi2-phy
>         - items:
> -          - const: qcom,glymur-csi2-phy
> +          - enum:
> +              - qcom,eliza-csi2-phy
> +              - qcom,glymur-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
>   
>     reg:
> @@ -48,8 +50,8 @@ properties:
>     power-domains:
>       items:
>         - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> -      - description: MMCX voltage rail
> -      - description: MXC or MXA voltage rail
> +      - description: MMCX or CX voltage rail
> +      - description: MXC, MXA or MX voltage rail
>   
>     power-domain-names:
>       items:
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
