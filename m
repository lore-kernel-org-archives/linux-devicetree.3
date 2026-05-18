Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB43A63F6
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142055; cv=none; b=NWQ6w8piKDBEOQsB0Q4Hunmh8dlH0mGIdMg7mssRmhRVmIpAJhIcvrSkLifGDijaP8DW7oRaMAzTFDud8oyXJqC84Qc5LQu9mmDly+EqSXW7X5D+S2BM90NxHsYRqOqIuy2BS7XHJ6teKoNsPYk25mlbsfZr6MHrNLURYUmQUxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142055; c=relaxed/simple;
	bh=BB1Y6UYNt+5fsI+CPTJ1sVHNClySS/lhkvDIVefPULg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilp8yttEMt8eXE4XGFD44eZhqeOs73FulH3LYMrwnTfAZrL2LZbg7XKEmVnRsttPsj9N1Jf+jbz8ssIBYdfDR8llSW8pMh+Z9QwxMnromO5d/BFuIe2BYMFpP9FTYvVIs/D36vuWF/3mgXBHF2VoXQQGLwVTNZCujp85savCPpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhczwa/K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhczwa/K"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so23114535e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779142052; x=1779746852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sGR8lYC7RwoehcYqlTGMusvCrV6UmoJY2p/GFIP4wIE=;
        b=xhczwa/KBcv5kBpNw7gFMObagcrY8MkXyYLJqUb1ILcYZ7VZGJXPP8iLWqnAdpGRv2
         uRyubucV3vQAvYP5Z615H7ZTFS8EnNDsZAvNJMfOu0TQfZfkmRZZZogi5J1HpaDzRL8Q
         IGMC8Uh/kF5WKRfg7eccVKsOvxC1N2cQF5gDuwX7FUh8Tg2EBiPo6faO4L6Vx7hM5reC
         dLNrnaARNnHzmVIg+d0D7N+arK6NrDYGtyyeYKQkRnFaLs2ibUxo5vN3SPohnIB5zuFr
         qSAlb3nSTADqaqM+G+/Y+ifPhTGZB8bwh+z6uexlDRFbGHmIgeVhuIEf2VVH1LSLiHVk
         j+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142052; x=1779746852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGR8lYC7RwoehcYqlTGMusvCrV6UmoJY2p/GFIP4wIE=;
        b=O45baVYpwIGUQjXxI3/i3Qxq13I4iX55nEoW5CGDFm/KJQIUmP7RaRFbs1jFNCGeUW
         8mnfJHF8bAqd/yCpXBBNFV+QIImpB7PwPmUt2NYdlH/NIpYHUbaAb9ZituxOb/31d/Z9
         4csq5DeXWltGwv+SPfQOVfLQ3erGuHsKBYiTid1p8d2LW5fO3Yrp3MjC8lQzpSYFP+Kg
         6XhI5c+NybTdge0A6x6lEf+c1hz+ZMxa177zNQ4FvwkGRoPZw8CV2dTUp6r5zYBvb94+
         ngKf5LIku4rBXADQ1BmrVFex4wPoi9Mn4n3tR/9Y1iuYhMnZGDEtgfPitbT2HN1ZxjBR
         XdqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fE/X/4GXQMu2UIch6R/N7W0sFCpRZP5/Py8fqjz0qbQhsmQmbB8V2alRXtc2e8uDLrW7yXy1yByZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YxY248wK4ZRFD86WQcdFSuHVwS/o4v9AIJCIdU6/MzUGhHkhOiv
	8tzaukZWAxWNAu8x2sVHXuGN++SpboOq57n+Nxn5+jrKCuWC5jzKkjV7U21v94SWVIw=
X-Gm-Gg: Acq92OEpFKZetJB4u6i3+vod5Syd/aJAiFp+7TIo3RcG63yW3ymPW8LmaWeZrboUDOe
	EmOKiPA+ZPL+2b8D4SzzUYRrk3vR2W4qvIVo390iRo5pYAK+/cilg82B2XRq7aM6lUtyT731Jv2
	nCw80wa/rl7fCA/XUgKkpZv0SqQ1W4hykArsVpSDXvsM0qnZPK6EP52RVQJqMTppsyba5SrbX3k
	3yiNEMlk18Xky1C5bBpvubwECC6urrFt2LJDtGiaPgox6GRA2Y+ObATUOq7HIt+4BaHAmgzTjqB
	w5w38gfetg/QeH2FyyZwtl29Poa/AASUEdSp+hCJcKgByNj7xSZGaIE1xi6Sdys2fQ4FKCDhrLs
	t9tH6Ruwww7sB3xmhoLie2psEK1aJwNKFz18+tAGyjGK02kFPGUT6wpsR/ZjcbeKg/OWsrpjE8g
	B7efdzdO13COvtexQXFEKSXskbUf6yHRkl
X-Received: by 2002:a05:600c:8184:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48fe60ed790mr252457835e9.12.1779142052380;
        Mon, 18 May 2026 15:07:32 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm261653215e9.5.2026.05.18.15.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:07:31 -0700 (PDT)
Message-ID: <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Date: Mon, 18 May 2026 23:07:30 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <cover.1779127507.git.taygoth@gmail.com>
 <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
 <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/05/2026 22:45, Dmitry Baryshkov wrote:
>> No software TCPM state machine is used because the hardware handles
>> the Type-C protocol natively, and the PMI8998 interrupt topology does
>> not expose the granular per-event signals the TCPM code path expects.
>> Power Delivery is not implemented in this driver; the PMI8998 PDPHY
>> block at offset 0x1700 (register-identical to PM8150B) can be wired
>> up by a separate driver later if PD negotiation is required.
> I think TCPM / PD-PHY is (more or less) a sensible requirement. Without
> it you can't negotiate higher power modes or AltModes support (which
> means no DP).

If the PDPHY is register compatible  as stated then the PD part is very 
close.

Looking at the pmi8998 STATUS_REG_4

- VBUS_STATUS
- ORIENTATION
- ATTACHED

are all driven. So I believe it would be possible to bring the pmi8998 
into - along side the pmi8998 logic.

@Maxim have you looked at that as an option ?

I believe Casey and Luca? both worked on that.

For preference I think we should try to land pmi8998 into the existing 
TCPM logic though, as another TypeC port handler within the existing logic.

The important signals above, appear to be driven.

---
bod
