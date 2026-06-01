Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796883B8D4A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323337; cv=none; b=pDq9kKkEZ4rd0ZeCNNmxydGm+rt6MeZAvvpyiy7G+8oPZIjLmeY42/i3yi2rVKTXrP2N0K2issQ490Nb1gnPAI6YLS2dI6266IHICX2dxiumFvlryxx89wy4lqCVt3NFwjJydZFzMEBNG13HliJlnAAi/m4s5UTAWLRhs+jLZME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323337; c=relaxed/simple;
	bh=IxB7Fd79A3gZ1r/a8Cr3tbT307HV68s4njAYnRINXlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hA6mFNzh6+WtvrkjYvFTewABRVnKUainaCpWdp2yvy6SnS4oEh5L3pId2cQmgIs3Ll0m1dD0UlGj3XGHxcpwkeZVtTQenYB1SZdbzQnUKQWIloLRUqX3Ov/+vYU2pnVmxCDBi95ZzJzOSwaf4+RnY1iDqvKIcIPVST6RBx3TewQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k1vJM7tB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k1vJM7tB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45eee266c6cso2912689f8f.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780323335; x=1780928135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=;
        b=k1vJM7tBtva4X1Eo4pUIcjiPrNX/aL/a48xSdtVgurZlbveyp9kTVF9eG0QiOYn680
         Cbh8OkJHXi+D8D2Ts6lpLB/ncxDzo5kzXJgvH5LGoEocqFfWf/omi9252A7HAopwBl1c
         08OFY0NG/zPCCpIZ7Z8tCKKM12Zmd+yBNpDBH6t0hvu+CL5+Wy0j/PohhGHyRTYvI2UA
         bv/P9AjjhOOi2s1M379z2rrOTdKttYlDCavlOgnGDDrbeW9jUBI6cKOn8c8G6QNNIz57
         SuJZXa6D092R/pnlJP6LGzZEz+Ren9BSfsCaFlWtctwVi7OUl8ovinbDayrGc/x8gna0
         O11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323335; x=1780928135;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaUY+wznT6I0Vd1tbKHFAPphi09g/5Uz9b/r1spWPtc=;
        b=bldIiAwmpIGRPbBnKgAFCsHZBquh15bg1rwcWK545mAJyPC9/H0DviemJQvYWADhU4
         GHLk/gNhs9up+Yg/zUWgq7BWN+EQMNoBbNBHTwucUYAivTdCWJH+VJ/lZfSpzxsyKhlF
         prXcbWtEvhfL6h109owAawh0czzvwJW0BnEOt09FV45KW5SeXQe8uYstjf8JPpTB+5ak
         WX4XHqiU4y6wSWIKv9bjo5JRxpgC/byORUOLOgCUaaN/5hDNSGCyTjmi3M42MtxM0UNp
         l2EAq5VhNLbRfhTw/TRbV67mqEy9JnJJTbEODd8LTo3vKKnOlZpwC/yjWy0J+VvTB4SJ
         tSWg==
X-Forwarded-Encrypted: i=1; AFNElJ9jQxErANJusPQF1rpTi2joFLD8sQPwIGMpkMKsfbGjglXHx0myTdFfiGiq4dium/ROCuFUjaZIKLG3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6XVJAjpfbQowWbIST3A6pzdzgJyulJTNaOgpNhQkiQStHYFk3
	ghMjPOUMM/2T94Vgu8Ymnip7rqFKoO3gw2jchjMr7qorZ3WpJdltFLlGgd5oc2dz5wo=
X-Gm-Gg: Acq92OFTsB1+OGEtuapk0z83fmhXvy0ZAIZMgsAyZeeuY1pa5E3sn6x4Wc6gzUTnGUw
	1kPa2/3Y/VuGGErPSTyVQPWgdH+PAt4cbiAivshuUUvadjEhKNgP4EYwiDwWO/CBhF0W+bUezrc
	z/CFcAH3BZCCZY1EwaJ4vJaAuVHKteStnrYIoa+TZ4gZbmescy6HLlfvn36yiEjwT3P8ySo9gfO
	DBDWoSC1mq44jhpFGVmSkCTSI+QQzM+Fr3R0diKCRZKPGh/svhUZt4lGIYnUxXq1zLBsXApkw7R
	74y2ljwjLZBUtkvA470wKkMqqcM8m24c/eDLe18yUm1ML0CKOOcQGd8s3dn6mAD3wL4YVSQiBIF
	RA86zHC1o0Err+U4Uh/N1iqBZla0fI1kDIlx4FWMXYJ3srYv2tC7yrsa/cKotoL4OrcuA6Eyn7v
	2NCkIQHjO1384oCppUpAFBuFaDRzJFnatVc8wkHWz6HYdsdUcKU3oelS0w
X-Received: by 2002:a05:6000:4610:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-45ef6b670e1mr21405913f8f.26.1780323334783;
        Mon, 01 Jun 2026 07:15:34 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm27847640f8f.9.2026.06.01.07.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:15:33 -0700 (PDT)
Message-ID: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
Date: Mon, 1 Jun 2026 15:15:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
 <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> Here is the full IOMMU SID list for both platforms:
> Agatti (QCM2290):
> - 0x0400 0x00 — VFE non-protected
> - 0x0800 0x00 — CDM non-protected
> - 0x0820 0x00 — OPE read non-protected
> - 0x0840 0x00 — OPE write non-protected
> 
> Shikra:
> - 0x0400 0x00 — VFE non-protected
> - 0x0600 0x00 — CDM non-protected
> - 0x0620 0x00 — OPE read non-protected
> - 0x0640 0x00 — OPE write non-protected

What this tells me is that the Agatti binding is incorrect for addition 
of OPE as a separate device.

> Only VFE SID (0x0400) is shared between the two platforms.

Both platforms have the same IOMMU list, its just that you are 
correcting a bug in Agatti's defintion.

Again only IFE SIDs should be included in CAMSS...

> The current Shikra submission enumerates only the VFE SID.

Great, this is what we want.

I think for future submissions we need to be commenting, naming, 
something each IOMMU entry as we have a problem now in Agatti and a 
legacy problem - already - in VIDC as a result of misallocated IOMMU 
entries.
> Should CDM and OPE each get a separate YAML binding like [1], or
> should both be part of the CAMSS YAML binding? If part of CAMSS,
> please confirm and we will add their SIDs in the DTS in the next revision.
> [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/

Yes I think CDM should be a standalone block and BTW use standard DMA 
APIs with its own IOMMU entry.

Similarly so OPE.

The CAMSS node should only contain the IFE SIDs.

So, actually I think your IOMMU defintion is correct but Agatti is not.

Sigh.

---
bod
