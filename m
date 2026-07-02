Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CE042A798
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981115; cv=none; b=rzdh3yWH7EbTdWcwv5DZA+4sb9aXjvk9YpbvYz9x8ybTSM1VymuHVKMnw8aW5iWRzswOsKcxVYDZyw/bJx5H0F9IhWiKukbVyNq8VxBSwsXjZT4Jkk/7YTcFIuSwZBrmnijGqFiZOCRulBjOT7G7T0qzprdXkuN8vT7E+TgOKog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981115; c=relaxed/simple;
	bh=SxEdWObSZbUYZ46vS/JBccmLuboyk8r+0BnZw9wrUVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQHSlYqMdkIKZEQv66PfnPb8VdXI6njrfJXxJcHdjf/BP00IdJDSrt/oVUc6ksQZkKrj5mzhU961W5zyaqd2ioYqbQxHIhNLsfLtjYuDUqMtPIl1Xg8NSrLwgDpoMwfejU663cgCVGWSQBDFrTNAQfaV+V3U2S2/tbJBDHM2qXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xznNSid3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xznNSid3"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebd7da975so195972e87.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 01:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782981111; x=1783585911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uyIInBymlHfz7VGDGtgQL8R4WXsM/iu4ZoItEUD8FE0=;
        b=xznNSid3qZdqU7P6bAKbpcOEZxAKn7KjZc4V13PhEH0U0EWnKFfY/ITq0as/wtKTrW
         aB5+63ertkdXpbV4PMl7/h9UxRITtFyK5i/rdSEFPvl/AXxI6lZ1nHDwPQ6QPT0qPzvg
         PFXgA3RKWq5FhXRDSK6ZsTgLu1jC2723te1fpkVGjEn8Xkn3Gq6Db08yFtJFfhz92DXO
         s0Nu470vVSoKjA8GSQVJMNlLRb8rgn8xK9/seajmpZlVB4tWNS6UHO4yt+E5BMPuEjPQ
         YcrvyAZGOF/hAKZHiYDfFl91Q6A4Hr1RIIhRlFAvx6ssRJ+4X3EK7QYaWqUjOO8jVAQx
         m+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981111; x=1783585911;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyIInBymlHfz7VGDGtgQL8R4WXsM/iu4ZoItEUD8FE0=;
        b=NVilUo+WfPm/UyqoCKOZ8YOk45nMxk6CPsAA0R+qK5MqFm5e4Dr2YaP2rYZYKkpyfC
         I7KUElDMInHxAtAUb3JVUG1dx6Xj84BTupZV/nlqFjQ91QvTdynvXMkLYHuSNdLGircD
         1kmtWamjua8NYJmlfpbHgTLu8u1P4xeLm7WTQtsfvkFGPrWSvG0NPj6Qz4p+L15uq0h2
         z+byxKGHFV33FPvbW2NR/EXesXe6dyo0oTIymen1fvvp65nlf4hNlbJ70Ns1t2WzQMDI
         PXkV0DzLtOyXbXoi4B6m/P6I8YcBv4L0xt97L1dp9aE8nvQ8r6X6FdbEYJuFV1/ahqLf
         Iq8w==
X-Forwarded-Encrypted: i=1; AHgh+Rqd2b7LjuojKKKOjTwN7OsnuxYb9Yt8dDGqqHYVJJ9LEX8pwOxYoLMHZw4VB3bu//E0uQxUJiDPKGF9@vger.kernel.org
X-Gm-Message-State: AOJu0YxKkBJ94ry9BBsBNg6cOB6TX8u5Rg0G7qSmE9uGcXshI12nCRjf
	Lq2viJvpXdDKd+S6UHiY6cTrANVNOOu3E6EQ1/k/jIS10/M5TVfGpkmxy5ZdMuLdvlk=
X-Gm-Gg: AfdE7ckPzOrFntdWztuElMI7b0nJIR08fNZ0GckrEFY1MY+iMooi/Hs78AyZe9tMVar
	sM/awaae8NCT0PU1mxkoB1gXbVZlonGlo5B87P+lZPFPSqlWFTJJdfxAKcg+Je/CRo2gR30IIFV
	vAQ/ocynbUwGIAaNrZHCmTKFSKzdgbUcvOrxjH7Biov11RoQqCKfR4B2oOKVtsAHYNkJgM+31Ig
	FTm+ps95QDnMwXE73bdpQRmVL+xS7DC9QRsSMbtUWQpJFFbqSS6xExyAlUPPSIY4BcE1T6xcytK
	dmh92QG8InEc84ODfJbTTlDGGzogxlQDcQZ0zkfPjcoofYF+dyxkTIpZSFrXucbdkphpBENmNRY
	2yjj11Q0dYK6PmqPS/7/CLjIPxOl/CrFJk53ZXdbq0JntV4XpBZRFkyWGva/V3o5Yh82Ps3rMI9
	AIgmM+PWSF7sDePl5bUkdzsPykMN5gAFEWmgZlO74v6dpAqM8Xscjgpvdi1mJKIez/blI=
X-Received: by 2002:a05:6512:1319:b0:5ae:b6cf:2864 with SMTP id 2adb3069b0e04-5aec676a8f3mr825148e87.0.1782981110761;
        Thu, 02 Jul 2026 01:31:50 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899171asm537377e87.16.2026.07.02.01.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 01:31:49 -0700 (PDT)
Message-ID: <1c583e24-09db-4d90-8f32-d3d3961188a0@linaro.org>
Date: Thu, 2 Jul 2026 11:31:42 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
 <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
 <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/26 03:08, Bryan O'Donoghue wrote:
> On 02/07/2026 00:37, Vladimir Zapolskiy wrote:
>>>
>>> Inserting bus-type into the PHY layer is borrowing from one domain
>>> linux-media and pushing the concept into PHYs.
>>
>> It's the other way around, "bus-type" is an endpoint property of media
>> devices, reference to video-interfaces.yaml to get more details about it.
>>
>>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>>> suggestion will specify the mode.
>>
>> This cell is just not needed, and unneeded complexity should not be added.
> 
> I'm going to stick to Rob's initial guidance on this.
> 
> https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/
> 

Sure, the discussion will be continued abouve v9 of the series, it's
just a chance to do it now. Rob properly pointed out, that the invented
"phy-type" is not needed at all.

Ther fact is that the whole placement of the CSIPHY to phy subsystem
looks execessive, since you add a driver for a media device, there will
be nothing PHY driver specific left in the CSIPHY driver but name.

-- 
Best wishes,
Vladimir
