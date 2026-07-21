Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4206D3815F7
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642795; cv=none; b=cYRsonOD1nIb78Ti36oU2rOMcWFA49ia/DLduP+cf277r4W+9PJTXIqPQwvRxOiwrjo9dUoOQP5blpY06azJjW5QGEY4LJuA3tMpsg2hCI8VpK1bIMZhZA1secnWoGBV01bxcuVy1DdUTtF0Z/mDD/QGLyoHwizFOU1fbfG7uRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642795; c=relaxed/simple;
	bh=QVCAARSUbw9D5YSPa8BhULoKdPaGPLDjhQh8GG3iwEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hB8slKqCMRbJEeTmn8FaDleBIZDFW4syYube59KfVusOaujnwLAfyDy9PNmE07bdMvTLrF9UUpwRxDz7EJFLcxPLI94lGASB3gf+5p/RbEus+a6+YUVjq9ltKHxTcW+xkye6JrN0C2o8oEcHMM8Al38+azd8UeOJvpQ96HD6jPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uV3p9Nsu; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uV3p9Nsu"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c16794450aeso818273566b.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784642792; x=1785247592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sizHsiXLEVRMUTlHJ17CUIbyBUb9Anbko+cLuXMaFUs=;
        b=uV3p9Nsusezmnh18SVl+vlJoNU0H+Qdoc15wVF6gGjm2AUBx58q+tuiC0L4tMvDcRi
         eMLU4LMUrzkktTzfCNCmi+oTzZaB7wOHbtPxm9sZx6rc8iEyAYWVIEMharOLymvVzTta
         dexIQXvUVm7tkaD8TUnTMf/8CTWefea866nXPi9Wck0Tm96w3dRI8oMk5nwCFsQEcdCv
         mSyPb0zXWNEV1j2dt5F+VhT98LqGrSaeGrRpC0gVKbkcFdwyz7LPxQlCA/5f2tX/Krgq
         LyTbdWfFcAhRuCjPTk00bXHgOokIXNAHbS5dG7VGztNd5IZV7+94djuJwrz2oHUx2JaH
         WvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642792; x=1785247592;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sizHsiXLEVRMUTlHJ17CUIbyBUb9Anbko+cLuXMaFUs=;
        b=IOI2hahBTX6NVEEh1gtMJxg+2fa7CMrqtnl3FYW82lztxCS/2TQaUyKVOh9dM4zl79
         S87GurqOO3TQUh+6dGbnjGkhamgsSwacoomRw2FSZa2HxzOkqxoxMEkW9IOmEIu8KVge
         lzAgoPU+j33aGSf7Nk2LArPtB8UQM0zWbEt5yCBk4wA3SyzA2+BhwWGIycvXjUzLKtfB
         ShUvPXKETHrjbb2xntn6tfPUiBX8wXH0zlRRXjh4cd6QzsYGmHSXCdKVuq/9hPzRZTct
         Z1YKxeohsuzNrPYYsEwd/BsyW8d0dVKjldxHt6I8jF5o/j0ZWomz0T0DQMb7lWIVvCmO
         Fz1w==
X-Forwarded-Encrypted: i=1; AHgh+RoSc/gJYQQaJS26bj5H5EMqwqVV5Ua+s/oaTn/uoyOw0iMaWMGCTdA2UMLYzJUa6VmcW/9qF929zg8M@vger.kernel.org
X-Gm-Message-State: AOJu0Yw96VLsE3PpVAK2tWDb5sUKyDHdjLSpiocaSnbf9QftWqF95dvn
	ljSZ6O48ku64mNvIA6DClxuP/Bou5AFwzhGSg4ANn0HanywGtVFKAi53LVk8nCaK7Ng=
X-Gm-Gg: AR+sD11G4hjWVnYFVOgJZYwKa5/yh2aXS1HfS0aFce2kWpA4NdFInijEbfKIgHReAXQ
	jflRn76kKahCY10xlhHuSwQePX2W0Agzb+89rixKHdU+ySVG3xQWyNJ9FxHPZyT2Zz1UDOAnfpu
	KAEoykkUkKqGFLAbwwFyJhfu6XC9a2QKzfDmiSRf0hLoLWpz9PnMd+MCJv6t20b+lKMJC1GxAa/
	3VhykU6Vjh9xEnTcpuR4m+iH9GocdUnfeupwht5fFo2mRLvdhlAvjMslowRLuVgQ4UExS1US4a5
	f9pJ93/7cROO0253wJXNbdOV3tQyHRnqqNoca8MSIVGX7I8jZ7yGkSo2ZqmwigCCepXnZGoGk4l
	wl2g73eihfjUpSawdpIliaP5XVgqp9OGvkzKWdUehMp/Tk2EOlVpasNselmoNcYTf7XlzeOgqpQ
	g1T9/MCDLypn/hJQbQp4HUQPL9pQ==
X-Received: by 2002:a17:907:9627:b0:c1c:2c22:3aa4 with SMTP id a640c23a62f3a-c1c2c224b1fmr47399366b.56.1784642792212;
        Tue, 21 Jul 2026 07:06:32 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf5df5sm589883666b.61.2026.07.21.07.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:06:31 -0700 (PDT)
Message-ID: <33b60b3f-c256-4c48-9608-5bd23f18b1e5@linaro.org>
Date: Tue, 21 Jul 2026 15:06:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <LyWJAb2qKsAFTMHNJUce9VqoqbkFKUQanb6z8ziA63RYZ1P9jj1XpA83uGPvz9m4QnWvEjJFK8dGD_8EtioHVQ==@protonmail.internalid>
 <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
 <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
 <_t1jiMTX3iIXhUkTDz0Cbh_uZhdUK_Y8vlIwxt1VNRbuKuRnpVCWabal-b4AuFrVaKrDnQSFOWtDn6-VCbS3DA==@protonmail.internalid>
 <345ca98e-09f6-4965-87bb-e64dac096498@linaro.org>
 <c236cf94-a775-4158-88db-9a337c7fa862@kernel.org>
 <e8bc8ade-d699-497e-8c4a-fbdc03fcc549@linaro.org>
 <wzsAes-UM4_r8scRyy_yhd39ZdxvT8W9VroVPOGWABLsw7MqR05o_z2MwhgiC1gTSBgfVHpXWADbsqoIOsR0Uw==@protonmail.internalid>
 <ec3d6035-d4de-4e38-8c72-b29a04b263ae@linaro.org>
 <1f128571-ed46-4a60-9594-74fdd5f440d0@kernel.org>
 <864c13a0-a52c-43f4-9d94-646bf66ba31a@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <864c13a0-a52c-43f4-9d94-646bf66ba31a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/07/2026 14:35, Vladimir Zapolskiy wrote:
>>
>> Had a brief discussion with Vlad, Neil and Vinod
>>
>> Resolution:
>>
>> - phys = <> retained
> 
> It should suffice as an optional property, moreover any kind of
> phy interface usage is not supposed to be done from CSID driver.
> 
>> - phy-cells = <0>
>> - bus-type from the media-controller
>>     Already specified with camss still aligns with Rob's declaration
>>     "the consumer defines the mode" so I'm comfortable with this
>>     compromise position.
>>     This will still facilitate CPHY work/mode-selection via
>>     phy_ops->configure() with how to define the CPHY part TBD.
> 
> As it was discussed there should be no phy specific interfaces
> between this phy driver and CAMSS driver.

I'm probably not getting this point, sorry about that. For clarity 
though CAMSS will use phys = <> and the PHY API phy_get(), 
phy_power_on(), or phy_configure() as there's no other possible 
interface to this driver.

> 
>> - data-lanes = <0 1 2 3> valid
> 
> Would be nice to get an ack from linux-media maintainers on it.
>> - MAX_LANES 8 instead of MAX_DATA_LANES 7
> 
> Since 'data-lanes' value follows some register bits and not
> the actual PCB lanes as in video-intefaces.yaml, this shall be
> explicitly described in the CSIPHY dt binding documentation.

Yes we said that.
>> - v14 with these changes shortly.
>>

---
bod
