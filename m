Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325402;
	b=3sBieBxRXF8aUlvEdhX/L0QzJA1ps4Rt06xxZT8X8jKzlpNACcNavscsuAjwHYhpEF9G
	 pnr7KJ0WuwjuFmIMxRIuG6QaKw0fNAOVX8FT1sxmIf6YL1kECKMDTyP+HR43xw9afdOKX
	 glMpGo3h8JLv4HUc6squwBU2C1exennP925VSCCzcy7Jr1HPQhVqnFyxfa+Z2GiqeZ/A3
	 HKLNaIkTlW4g/MtkxVFD6gOlOtS0XtvdmFjbHLn+brkvWok/EPfQ4KfXtS3K68M7ZQEQ0
	 ZKDNBF7j7fl7LGhpu5gM2Yvn/LTwRGpBcm2q2aw67cGZxXCUJO5G4/w8wMX9fJ7A6RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325402;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TQtG4o/ML/2sB0MvTtvE7H8moOh6q/FDtaR4iqmNY1g=;
	b=h13JYM2ASlDvDtDQyuluQuN5qEaLjtIIohFobnnHG1R5Ov0wn/2GfDtMLdUvFBRNJdv1
	 m8SxJZNZuRmYxwDjEpAtN3VSeptMUmHqumiE3A05qewtVpb0Pwkb9x2uaMk18+4y7DLYJ
	 9y5PA1H3Z4OB/QOHvRKeTF2R37+wu7xTqeo2rlnQrAZCz20jiHNDu/KhPTpofwzJXj2qC
	 xZ1ettb6eNJy2S7/Mm0XV0yJ5WrZUh7qgyf5ZWif1HIeiMH8NUt+WYlkVFDyzc6XMFtss
	 ZFlzPOS+jNHbAYJbylZYRH9YeMTuSdeJaXji/gOp1fP9QV5yXil0i6WbcTS6LmNoCow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33166606D762
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33166606D762
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1086967a12.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 07:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325401; x=1794930201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQtG4o/ML/2sB0MvTtvE7H8moOh6q/FDtaR4iqmNY1g=;
        b=SgWBFlqLHwDW5MsbuyBLU1ctU4fo4Zq2I89CXAp3uVhn9X+dQjgulDdi+Ju5pwPO/z
         mMFRucHWG/MU5aw5dWd7N5AMuMqQZmUVXxtiZPvZVarwzkom+nEFxQV0InAurjFKKGLh
         dAWh4s9no5d5SZMiSZDLUSdcm7uHDMYePEhcuRFadln+7n/bdSwdSq1k0sDpdY8JVrUT
         IVHppq+iCAdtpGy6o5n3jqUga5n6D08FIeAHgeovMFmUvNbx6wIPYqceyZE7lIXbF9f5
         YiWsLCan84WFIAcdP9DEOxl6uZnUVwQHV1M0q9MouoEeAum83/ImQOexMkM7dm/06IEz
         T8yQ==
X-Forwarded-Encrypted: i=1; AL+hErEILXnWCecxmbcwHF1YVmZYFsj6UFaGIood41qJqABFiVfYKcFXVa88XM7tYzbhsdhf5LryPvZp/VG/@vger.kernel.org
X-Gm-Message-State: APuU4Z/eKqNWaYS3NYZQlMO/Qz6gXcbHQc0u6l0LREZ/SMTBkgTysBVE
	6cqmqttynAKqMyow0XvV1cqS2jqoAZrIEJm2GrWJ2/uk5XfasyODlDcf
X-Gm-Gg: AYBFou2bmMewWXmliya+A6PLG6sUDl4xOeCYJ9WOzcMKFOmuglviPacHfnQOpmGaDVW
	04UkXBvbemPaRluT7Q4B/vR0TZPopgkeDCAriTjcJnHn0aEUCqXtCurolMduY4i5aKr90PiuSnK
	ZLv4uKXMjFLj/LkWw3j+if1+LJsYvR90ARDb2JeBfyGD3WMDXzk2j1Dv7UOO9oAuYtIe+xpIivg
	25FV2FXy9gmQuf//CmD50uYrNpIlz8xWWf4lShcaVsLfoRSY2/GbpRSvGCa5wuEDFvmuNZ3vaRp
	aGRrG0ZZY6LWZfIJKD7/BIOrj+t1qo0Vs1r+/2hz+bA2WBZkQl1GSUZ0mHbbdVdKEmnlAWHH40o
	IYTFL4VR3aRHO+KSAZFCwVeVXMML2h56bUolTWRDhCw+qCdzdoxsI1DpOL8UaAOb3CNg8nhzMYs
	0UgpvIASCFf5ad6IFDka2LHByKPzvZBp55HPBy1efmujP4upaAhHPqgp+Gvw1M1C6RifZJhsKbH
	DzPztL+m4ljJakchBQOitRm7QthXsfuNdy6V2Y7kIhjzOedGQSSlT0S7+NeqyNpaUUMJ3uX3x+5
	L6dlrgWnjw2GKEkC4rNUsj2vYi5D2u/gp6ddmzMBMwqH6LvnDkL1PsMOyLFUoioKY0jM3w+C
X-Received: by 2002:a17:90b:288a:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b166cc035emr3111438a91.12.1794325401459;
        Tue, 10 Nov 2026 07:43:21 -0800 (PST)
Received: from ?IPV6:2800:a4:890:2c00:14b6:ffbd:f8b2:d9f2? ([2800:a4:890:2c00:14b6:ffbd:f8b2:d9f2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d5e830dsm891469a12.4.2026.11.10.07.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:43:20 -0800 (PST)
Message-ID: <987c1008-d0ab-4508-82a2-1a26104a47c8@andrewgigena.dev>
Date: Tue, 10 Nov 2026 15:43:13 +0000
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <20261109-slick-transparent-ostrich-28ddad@quoll>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <20261109-slick-transparent-ostrich-28ddad@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

First of all, apologies for the late reply and for not following your review
advice earlier - that was my mistake, and I should have responded to your v2
comments individually instead of letting them carry over.

I have now gone through your v2 and v3 comments again and addressed most of
them locally in a v4:
- reg/reg-names moved to the top, redundant minItems dropped, property order
  aligned with writing-schema.rst, example cleaned up, ports use
  patternProperties, bus-type dropped from the CAMSS binding, etc.

Regarding your v3 question about the order of reg/reg-names/interrupt-names
(vfe0, csid0, vfe1, csid1, ...): I took it from qcom,sc8280xp-camss.yaml,
which uses the same paired VFE/CSID layout and is the closest reference for
SM8150. The entries are also in ascending register-address order in the SoC DTS.

If you would prefer a different grouping (e.g. all CSIDs then all VFEs, as in
sm8250), I can reorder the binding, DTS and driver resource table. Please let me
know which ordering you prefer. I would like to hear your feedback first so I
can adjust anything needed before sending v4.

Best regards,
Andrew
