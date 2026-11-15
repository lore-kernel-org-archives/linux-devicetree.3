Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794713108;
	b=aGDPWBqJ2WqsNE6uain+lFSAO6fi4gM2VXFPFdgusg7iQdImDoB8Sw4OMaZDXmgbHZ5O
	 u175NjWbCq8wHblxb9mBiqI9pjfE3ugGFzdN/cYNkvVOOTvKow5Y/vMCzUYIf4xsu/rT+
	 7ymS9WG2FBtCLTUEs/DRS2VNQLC5b8HdD5MYJ/PK9GuD22VoqNw4KtrbBPCj7HHeEd128
	 nkj+okd979uocpcQ/WpLouCMS73EZ6dauVAmwn+WVsLoEzXSNAogRtF9FWvG+CEPkco54
	 CS3HNrmg9zCm8CObyI8wLLFfJRxlBXm4vLH8cTJevPXAuF6EQNrfsdHkKvGlOPOGxlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794713108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
	b=CeQc6scL1EjBQEhBRF5qZlIMU7Z/5SCZfHOy8UZqloJCmQgVDJCP2rhzB9CnxA/DwMgT
	 9m3I7amR6k+4fOjroGXIpspp+MNd2cwfz+ABP952mcoWAUEUZ0I4KA/+VtKBHLA5fz7Gh
	 l0zHbnoM10WhOrIl1SQ2fTBIcR4e09l2tDOfWC4LpYHYMM3X/FVKNUS1/ACrlqRZGqEPD
	 V5oadxfj+yvAG0zhmgNLP0vpLu48vhZa7rHVY23o3lL1vXpd/dRdAfhbWLN10i+7bmO/J
	 BgDtPL2eFO4zh4QC2veJHY2xlpPZ33yU7D1v18EmcFVFYF3MMMLIm3oWUNzkwFNzmLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhbsYhlf;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E0C606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 03:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E0C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhbsYhlf
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5495d549924so33794041cf.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 19:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794713106; x=1795317906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
        b=MhbsYhlfIboDlJO0nr8sWHoWk4QYWrxgr1DjannNHaSkkSgGBBcYSs3djiqkqFC1/6
         m0ZUne9cIuREQdr+58Uva+zsdg7kB5jgVKFXT6YY5hMIQlk7C9QTgBmy54+Hsr1PeRq2
         2XOw+re1SXRO4deRkyfpCKCg9/tFNYIwb1FHKXZIa8tBcGgxkRV+CABQxMzK11Ij9vXa
         SJMpOs4QIBCCiBaHDKjfNDYhy9HIsKamrxfvjAbVPx35B15vgPxKu6Gx0VOqpzzktnT5
         3CYJZ8VOssDKKYsXLUo5CP3y6tt+shDW+HAXFmMdCBoh8/v5nTcNrF2sm8DK9wyREbNj
         MrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794713106; x=1795317906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
        b=pZQbBaZOwWsdZHIkBERrHBQxLLLPgbJu9XNCHORfkvllwCi/15x+UsGxk9dVADYO0N
         57WZFVbWjT0F17n+LRZ4XcbnzXUIJfWZNCNUGyH+rc66Bndou9BHRp78muIO4+vyyMkZ
         95BiYx0IO9/k2h0COiHQ4iWA0bls0JHMbYB2e1toQoUL99YaIAry2cLpomiJbDU/Aw3K
         80FrFyKXwGJz4EVJX+tDajfKdeFYPC58cEtTpAbs8Mgghw0eb08Cd4OjXaIbcRoGhGoY
         PhAGLxi7jaHUycseTMtC0TpNacoRlv1z9k8WoqdEiBID1+v95GUoG8qm16tDpZzpkQeZ
         aC9Q==
X-Forwarded-Encrypted: i=1; AL+hErE3BGnWS1FyFadUdD/xbGl4i7AXbIjPK6sddFphVejeNjpYM9dxBInmD92KFpRYoPNRU8PcvMCmesRB@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rc7zTOv+PEzIh93fCiZ3XyAEdkAW5Oixhrit8KGyu7cebkx6m
	mAbE6eSz274O2Nb7nZJRAYR9RzFxDFiABNrxxmyr1ItXKTYLQ0xhQfaU
X-Gm-Gg: AYBFou11MNXYRjD0SgbfFOcgCe+odZS9Vcoe8+ipZxR6rftmLfbKtabkqBY3H6wkD09
	udUvSb2XC3l8twEvItG8mBI0tFUtbwA7rRmYQkNzYAA7QGyzLFui6vUsbgx5ROU6825rWDXYWR6
	7m7x144k67OTDwAHDWMQheIYcsy8nuMq6UWJcO0a5J5IGhk7uPcHKJ+jYjFRw5br21o98F5FCcG
	e3XOw9kPS+cSly8+zpDOZt2iY9pSbYtl0OrbqSY+OITYwE2wNEAJfkGEkOHJGfsM/Hg62nsJYfz
	MtL/xU63ZfLQY6qvEM/F4Qh3yN/vGIAG0XvfgPFE8hvXyofhoJkZSE8u/FvUy5LejwffsrhBA2n
	JDDi9/sDs1pAD166YqS6Ln6ZBS08J8NcF5iCXLpzRwI0kOu79/mUQdvUdjqIrhro6ifcWO2sf8V
	iJczC19Lk8qzweMdzVtZTnmhN3hDJEb9bDxq43iorcTlmOp/+FItEH2Fz7qi4R3FZWtjHX8SRsc
	jVG/knmPxvztbNMgtem/rRZwIBz09f2qN8VBDcUoAeuAvWLeOgf2VwrGFIs0uoLh7vrbxsM5vq6
	N/+ppH6rNetxxuQ//Qn7PpJe+o+72UTFmDnPNwydVysGFT0yfZYw07BqCphJ3hbkYuXy/dP7wfr
	AYBNX2d1yKpzoXpuqik+/wwVsF6lzWy/fnnKkIV9jOjvtQRCjChNN
X-Received: by 2002:a05:622a:228a:b0:54a:6b3:488d with SMTP id d75a77b69052e-55ac7172abamr111430891cf.21.1794713106562;
        Sat, 14 Nov 2026 19:25:06 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d6193esm55747396d6.19.2026.11.14.19.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 19:25:06 -0800 (PST)
Message-ID: <81ac592f-18a2-4715-a34a-1f639ff7a454@gmail.com>
Date: Sat, 14 Nov 2026 22:25:04 -0500
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
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro X
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-2-val@packett.cool>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261104070441.74127-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 2:04 AM, Val Packett wrote:
> The Surface Pro X tablet was listed as a single generic compatible in
> dt-bindings, but a device tree using it has not landed upstream.
> 
> Replace it with three model-specific compatibles:
> * microsoft,cambria for the orginal SQ1 model (with cellular)
Nit: "orginal" -> "original"

> * microsoft,carina for the Wi-Fi-only (SQ1) model[...]
Nit: ,carina -> ,caspar

Wi-Fi-only has both SQ1 and SQ2, please see reply to 2/2 in series.

Thanks,
Haipeng
