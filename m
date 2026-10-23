Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792795388;
	b=o3puUb/F4S56KnwZmvU6pf2AywCFa3lkAr3wBpNr5nAQ7a16WpseB4iZafPftf8PeheR
	 BfsYcD0YB3pyJBUrAywQPU1L8pwvmWPE+TDu/JeMlXCrh0S9TeQWZ5YEZus2jOADFvt/R
	 y59edpwZZumRbowOMhMC5MnkVs0HYq0CIWp65SYIazxEJ6wxRSjjyqr/BPOcucCqqer/h
	 38/LKFobe370BT2orIGP9Hl0c67it4kwu9dzeAEf1/uiabMyFCca8CZrx2e85pBCugMhc
	 L3fhsjF/FmAVaU4nQBxv29acBtmyDqrk4960RXh6W1l4eIKMomlM0ctXRDaVEnhtt3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
	b=j4lLWylMIKg4gMuw4yA9W3dZ8u4OO26hqFuc3/Zv52JDydvr1i5UglxisCnilQs50iZr
	 ws8JUhJoY12YjeTq5wuBX+u9Y2HlqOnsbdwBnwtHBgt2gCCCwftOfAxp6et1cqQg2pvgC
	 D/AujQp3uoZ+rmhs19ZkUOUrto77yjW2Eaei0mD+9FvLvPyE/pxoDUS5bS5wrwuJKJQwu
	 pOlaJaRWCFQ9cr+sL9+ggJpkCmArkR+UhaiSU42geR2EOAvgAsmF7RwRZPdknXHRbVzEF
	 mlu8kktFVMJSS5f6Ki4+JdQG6XxykZ5pU6MkJV6J/qomb56K3r0hnbOO/iIJ8/c/0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qWQcWGRE;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DA2606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 22:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DA2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qWQcWGRE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214af2076so8132225e9.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792795386; x=1793400186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
        b=qWQcWGRE26epRvhdKbyIh87aCmJkyDJV5cwB/scQQmyfO1sfK2JHtXYblWIS1yryU7
         nJ49caCLbmHN0pUpe9ChYkb7k2L35KVVNaABfCTbGhXpcZw9mX+N9n/KSKMKDn1MpkA8
         GZIDPtkqCJRMOCxndovyFWB7adcBs973+he/lN/yCF6G5NBX2+MSRSjnesz65gDhns/Y
         Huv+Ytga4FPSUTmHdFzNEUvrvZ2ufP499FbJhRtoDSk72Ow9E+voC/vVLYjhdQqkUxdZ
         NHijy1YxKbY+PLx6HMvPmmLUmnvceDe/Sw7c1VvbxBhYROJMi3Pl5EgYGxIL1bw/Ndy1
         N0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792795386; x=1793400186;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oaa3IXbsmPMDDQXEJKkwgW9mOxnYdMqdGBs8GCpNSf0=;
        b=SDoYE6+/2cRRwAtV+oAwayYcmzm48ARvS+5+LSbWoqHUiU9fqTvdQj3xKRuzAG9FZ/
         OHsAi2GqnYTwci0313E2VtHze8+JkCj2SYTmh9NGdG9EE2kEmmSaspUIw5Bt6E5EPiQN
         1iwqo4HCZVVtdPLFhrKB4POLVXlVUzFMwtsaAp68lmaG3c2Ub+IKNCV5FhmCy763Ij/p
         7YuOqIQ48pbIVLyhhkjI2XS56njaMBTgO1Z60ZIetlbd4n8iYu2duDe1lqDBZvllqtQv
         Fw2b7TpShgky1U4bxRaU9HS+aH61vDXaEru280P6p7YA1ATHIKy+F+o1Afg/3GV6ACSC
         aH9w==
X-Forwarded-Encrypted: i=1; AKwUvBxUXcWQMRomyb1njg9kKLVXTWoGeBANPan2t6PfdIk3KJTozAe1P1m1+QUIuOkCH6x4WzsmqPr2hJqb@vger.kernel.org
X-Gm-Message-State: AFq9FYIzpi4PAI9qI0f7Oh2sX79HlM2gl/DpoZGFHYlEZjZ7y8LsZ6GU
	YlU8u69ve7OZSJSBAAb/3HRM6y65nblvPPLe3W6880FtJkKGCLEvLFQkEyoioz74DkE=
X-Gm-Gg: AYBFou30X4sFRVb2Os7a4kYCbYyw5MOLLuMpHzhBBBqD4Hf0BcvKvfEGDZfm7IVuBL5
	aTGDtbtMrVCyOoYzoh72cxyHNjVzIt469BubgG8y5G/B+iBxCvsiM+JEq+zEFhW6BBxQv5CLwaG
	AJGfUbQJKgPfRV3s+SAZmx8C9OEbeF8kvR/u3legPqLcjtwmu4o2P/xet+w9plcn03fXSVv+L8n
	9ZldETfOlYXnYUg2y/xp3s6BNT/cxAA8EjWtmEdSZIwUpXvaOpYfDtRpfb8KwJegWOjwKYiixGc
	89AZvzQaIfb+QW3u89r0LD1TLJHTw6ApaevTSOOTohyUs/XLtCmL1UVHUt8DdObn97pgRFxf43p
	gYaqYxGZph913QPQg3tr1PYeMkCjdYyAf+iXLyEJYcWNaEQWVScW639DtmZmJelMWbSpGRbfHgU
	iVbzOFu02cCXmK/D92T0lDd2GTo9Gv/KmOOlhAOQKvzULcb5NY61CK9nOuUEUTp5D18tmweL8Qu
	T/DHf8/V8DQiEC9hkADrKyfKkoghuU99koaOi0b54wZ+DXYWt5FyY1LSnwzvH/HOPLx
X-Received: by 2002:a05:600c:4e42:b0:4a2:16c0:f5e with SMTP id 5b1f17b1804b1-4a35ac8b429mr4136005e9.10.1792795385869;
        Fri, 23 Oct 2026 15:43:05 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm787610f8f.38.2026.10.23.15.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 15:43:04 -0700 (PDT)
Message-ID: <3dd8d329-a25a-4afb-935c-311cb8ddf094@linaro.org>
Date: Fri, 23 Oct 2026 23:43:03 +0100
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
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Waipio
 compatible
To: Vladimir Zapolskiy <vz@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261023163057.775917-1-vz@kernel.org>
 <OlcKP8HHAIXkRzYX6vdMrXfEbLNpOVLfNZytB-qiRopju0IaQ_xxKo-mlzphnAO1Pdg-y8mu0lcw0UsQZC0ZuQ==@protonmail.internalid>
 <20261023163057.775917-2-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023163057.775917-2-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 17:30, Vladimir Zapolskiy wrote:
> Qualcomm Waipio SoC has six CSIPHY IPs, which are compatible with Hamoa
> ones:
> 
>      qcom-mipi-csi2-phy acec000.phy: CSIPHY 3PH HW Version = 0x40010000
> 
> Hardware supports up to three different 0.9v level power supplies for
> CSIPHY0/1, CSIPHY2/3 and CSIPHY4/5, but there is just a single 1.2v
> power line VDD_A_CSI_1P2, which supplies all CSIPHY devices.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>   .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 1f1e2a4993b2..2a11ca7c7d11 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -19,7 +19,9 @@ properties:
>       oneOf:
>         - const: qcom,x1e80100-csi2-phy
>         - items:
> -          - const: qcom,glymur-csi2-phy
> +          - enum:
> +              - qcom,glymur-csi2-phy
> +              - qcom,waipio-csi2-phy
>             - const: qcom,x1e80100-csi2-phy
> 
>     reg:
> --
> 2.53.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
