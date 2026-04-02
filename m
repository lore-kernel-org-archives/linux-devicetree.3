Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2889A37F74F
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 07:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113311; cv=pass; b=GaL74HC/Q2bBaqEFkjCAsjE61ZEde3BiRFEg1jlJVOs8bvSeXoc/iGJSDLPrMiMpYGbcAKBdVsu3wcCq+G+ybI7nnCCkbJ72MY6lb5wnijIdidxr+CI6g8tn0RtvmxcgRSR+X7fRNmPh8ewDIrRBn9NAU23Ou9x40LyHvxG1oFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113311; c=relaxed/simple;
	bh=lT7Ailcfdo5kd2YVlswaj5ZYH6UyjxsxTfhu+tarC9s=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJfRM2xCnkCdLWVCATPgO/iqiKw6sz8GIHNcmiWaJi8e+cud233ZsD3aPPOwx8QI4foQz24qvDF9s88KWmBUuvZAaoll9SMpK5UB7q1/1AhqYvibIO6PFFohRA6RGWUNw4h26wHtJTFNAgzDrn8f2BjRFKoT4I8IdgrenIIjmb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=cAUf5yhR; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="cAUf5yhR"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a2ee65171so8169117b3.2
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 00:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113309; cv=none;
        d=google.com; s=arc-20240605;
        b=Ot6PkH2slat100ozPSJUDiPIFrdSWf/ISbGfbpjznBKokJJBGMEXov2I3BA5jKuyC/
         J4VDFEhKkAlmMA294YaI3yo1F87E4F9zhdVF3nrMfrl7Ev5d6g9shcQPXHZfZCJm/ukT
         EyrilRmnzhZHoXNfl+QEk9CsjcRcAG3D7cUaewDnNq0R94Yteo7Mit/rZOxUHcldXTEU
         t7a90dIgjNAqmAxpV/cPcVuhxFLLXqGjoXAW/p2roc1M3PK44wztTeB8XceQpjQxzeFS
         dKn5/x+fv+l2W8x/IXt7z672yhHentAH0femqs3m0xHYRmH48s7BYI1mC1X4HSrtzCsB
         jB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:dkim-signature;
        bh=j/nnvjn0yilI1+9JqC+f0dBa4pcKrV1vrwVGTdHhUA8=;
        fh=CJbVlw3QZ0N6LLlQ4cnDhLMCvfIZFxoEKb1XpxxLemI=;
        b=YazuXGwABTVeIBxQq7/Q5bEIj4IMMGUY0p4zkXIkT2njaGpf+Mlmp5n0ZuRVr17mWc
         Vwk1ZGSalEtsXEUTvKiFHCH/rxPj8k6bmCmid7iX5lhSb0IItncaWTm29AR3y3NgJtlz
         Ak/XX9Iq0UXWN4W3LYnF5YExwNhKvnu03pwiLVNMCTsRpZ9Q9CHC+q2+oBMPj746jKID
         QCqqGO3I2Nbk2bs8feFCycfTmGFLD+nMUzFKSyFR8iHV4JK8n5lpGl3yNhJgRYDNKbg2
         GfQYbrcRFvhgA7n2r6PhwfIkBCGMDeDaOOJHdDBJUU3Ul/edTxQDQYZ8des9HQN8dfm/
         w3zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1775113309; x=1775718109; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/nnvjn0yilI1+9JqC+f0dBa4pcKrV1vrwVGTdHhUA8=;
        b=cAUf5yhRxsv8e6B5eSa15Ln7PIRxj84Ju5f5GhfG46aBt+41kLylo4F3629LXYWDSn
         y9AtJ7paGjC3P4BkJ8353/DJc/qPiZF9lxWhqv7aEP/BI7wOSfvPKqsM2HxxIShV/CgO
         lJd2u+L06Mjdj2gpCK1Ik+ZGL88sXIx7ZbfwAdrGytPvLG9NC8O6dd483KwqEnfKtJxt
         CKbjgxp17p90Y7e8ExZk2lQqih0/EFGlvKJlg7pn2TscG17dlxgYxey710esqB4HCcGi
         mZEknxbc+8HJZqEAgWVB8wx0SIgqhA+6U1XPZTTg6sk/AUIzBdsJt2BBzIiRDgw7ENZg
         G1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113309; x=1775718109;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/nnvjn0yilI1+9JqC+f0dBa4pcKrV1vrwVGTdHhUA8=;
        b=iWe2u4BkB1cX46fStLcLoTcpop6B0UYc3/hQj1GRQ9Wh0Gt5bFvu+tDyfdhrKWMbiw
         UWGTyrZVB8WkF+QmIsoFeE8Y5xvRnMnuawTyrKTCML/eD+UAq/xilAq3ZU5BLk/xH/Km
         Fvp9XTLklHCFfbVYWU00rTOIelz/nM57YlG5hubcMHkltnJ/jz5FUlcuqtaXRo/D68dJ
         Dk9UGXG9/FkEysMSn3Na+IIoTXYFBOXjX4Bc6SsghL1i5MLDaKSsm1maLqer1X1hEXaU
         ZaIhQW34VJLXATr/zzGzyw74BpGnxgpsopmzU3Y14j/HY5r8CMQr0gc2POOVm+R2MOJm
         J67w==
X-Forwarded-Encrypted: i=1; AJvYcCW0jL/ntPL4QL6N61KWIT5FT3SL1DAaCp6bVOIua6E8kDLRa9LgL1Sl8YqsZv7yhAgTBunCZuuW8l1l@vger.kernel.org
X-Gm-Message-State: AOJu0YziaeV3FX4qjajAE4ZFWhS9daFvXAXhLdxZFtuhwNWqoENQCEnk
	R/3qhRR45ozpJtoxsZKALNRwgjWEznMXQ2OMTlpLNM45C9jefFJrI1eNb+VLMN3C8j1WIRFa5lW
	XAlvJoXxXyNMqwTIjWBCuUOo7DUuBqZi/UUCGLHHNog==
X-Gm-Gg: AeBDievWS87aRU9P4o2E+gHSsRuxacr328SUeqNTURFAABsvBjj45/KNm7RSC6NRfxB
	ccFM/XEPlt/GTBF9JpFhpGc5fV/FGjEFl7y4ULLaeF7RCTirOx5l4OnqZ+El64bOlA7ODbG7bdX
	Pg4t2h4yNixZsapD3TMvyncpx+gIVmtfNLRA65Tnp/StBmWdbFIAPnWlxwcr/bimlGgEtzSeiZy
	xI2I1uAcD7fi1S69WBUNXbQcEhaVYKvOQGA3PZcFlLbDbOUyCQuGQlKBMqm1JdgfJ8ABYjfi3tK
	QkJuBeAP
X-Received: by 2002:a81:8a47:0:b0:79f:b903:88c4 with SMTP id
 00721157ae682-7a21214d9f4mr54532207b3.46.1775113309147; Thu, 02 Apr 2026
 00:01:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 07:01:48 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 07:01:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai> <ac2r9m9mSMZxgHwN@zenone.zhora.eu>
In-Reply-To: <ac2r9m9mSMZxgHwN@zenone.zhora.eu>
Date: Thu, 2 Apr 2026 07:01:48 +0000
X-Gm-Features: AQROBzCvBf6oUImmXQaI0PNI48VmeBhc1PCRPeIfMVg9ZE_RxL6HflqfM9gE5no
Message-ID: <CAGYn4vxjR2Unf9AeORv8x5GsYzfgxZEJhgR6QwkAvPS+nmRxAQ@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] i2c: xiic: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>, abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Wed Apr 1, 2026 at 4:41 PM PDT, Andi Shyti wrote:
>> Abdurrahman Hussain (7):
>>       i2c: xiic: switch to devres managed APIs
>>       i2c: xiic: remove duplicate error message
>>       i2c: xiic: switch to generic device property accessors
>>       i2c: xiic: cosmetic cleanup
>>       i2c: xiic: cosmetic: use resource format specifier in debug log
>>       i2c: xiic: use numbered adapter registration
>>       i2c: xiic: skip input clock setup on non-OF systems
>
> Good job Abdurrahman, thanks for following up in all the rounds
> of reviews. I finally merged your patch in i2c/i2c-host.
>
> Thanks,
> Andi

Thank you for merging the changes, Andi. I would also like to express my
appreciation to all reviewers for their valuable feedback and patience
throughout the review process.

Best regards,
Abdurrahman
