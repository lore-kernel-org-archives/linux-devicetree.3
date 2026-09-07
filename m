Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AE73E8356
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 23:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788823649; cv=none; b=e4NrkmXapMH9i2e5ps15QlMLGtvd8GrcN2iGaH4ZG8m8GiBfWWoCs/1hYZn/xZuoxmN1RdtT5/dZ/n87uon55bRuyNhxUxy4DlBK/nZQOhR8yD8Lz5L142YF8OSuHzacAq8VS6iWuGZhP9gOPbihBx8ZeHu07w3o55HXOiUVjno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788823649; c=relaxed/simple;
	bh=/zq62zwl2SYqbX3nWntxxVcw7qJL9ZY4f2IiFrSdXUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dDqcqKVWUq/Hc7NFbHatyU3Wt/pHnRcJgXLt3ceWhzOVpC5KQRFyPpIxgWKgYcmv5PMLu/Px/whrAGK7K/ZvgnXUKlwM2jileewCq2NN+dXxvnUFK+bUzywpYpLi7bJ15RZ6y+ob7x0pcEkXRNf+pBQAQ/lLHBtG4W2bl4YP7Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYFn/DU7; arc=none smtp.client-ip=74.125.231.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYFn/DU7"
Received: by mail-oi2-f5.google.com with SMTP id 5614622812f47-4b3759b7ff0so1488762b6e.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 16:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788823646; x=1789428446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2mXpnCZ25GxwnmGohlXqYGxtFFG4TCx9pnjWCRTcOc=;
        b=IYFn/DU7zmkUxhRouGb8RcpsQGZynVRMaqeV+ux64GLJpSCQtvSaVIKqdcb/07ZYH0
         lKnu9ikN4grTsKzIU/E+HoNtYHYR3Z8eIkBSlrB02rmE7ekmgT3kr9UHiXfE+LiVfrIi
         heGTNsRK3z+T7cDzBUEDZf2lMwB1Srhp+4YSd4odyzNKtT8/6qJ2fjs6IYjc9AHXS8fQ
         UhEvGjZWMThVbAoSmVdaE7zMzkk28TyPFYYiobkQxxamWc5JcJ9ycirucD7E7PUxWPhU
         QHxglUqGawnJk+Sk0TG9kcE16NnaPZJThakVhnwZ+6sj70QI6hBP5GhQ8gA0MHFhZ8b5
         LmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788823646; x=1789428446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2mXpnCZ25GxwnmGohlXqYGxtFFG4TCx9pnjWCRTcOc=;
        b=o8emCS2pGafgOVx+3f/qYYJngWU1UamkhhLLGt6jfRR8GLN841n568v/ZkuScDmceV
         usQvuZwOInrSuBY0h1sKJOTvHEdHeagiV1qdot37OKS52T9qjCFw4Ol2+c5eVMPSpstC
         9/+vPYiXUn3Y7dJZ7Rrt7aAStIagzt1Mb0qZRgdZqv+RgBg2K1fmq1qVitq0V9lgaICo
         VIXt1lxXtAMdCX1c3EbR/UiffraKL7/nEP5YB7s4zbEAGc1JkTsXx1ZkbD2TlwyeCati
         HBanZsftDKj7DDO2RBir3PqKnBBOpnZSg5hWtbFfnhgbmqUKDF6v+9UMqyamyHnQdFaB
         pIcg==
X-Forwarded-Encrypted: i=1; AKwUvBysMwABOPLyRUjWKStJMPy/u8/gTm1u+WClViMRJcSXexwkYmNWNHmSHr9f1Swc7fB/5YAdSZTqFqZF@vger.kernel.org
X-Gm-Message-State: AFuF++mY5MfLHjiz+f2ryeMNiql1m/6yYWtuOKz5mYAZnzJekUYw4zUJ
	yJJO82YYvXRXAtczGxIddbU1r59jyMUWnLV1jdZs+2qkIQnsr2mRHMrN
X-Gm-Gg: AYBFou0SlyW0kHEMjqAhBR5NpzPIBZX/FMd9VGAnBh2futIFfIPoPPNncqA24tssm45
	IU9iZ9dgde/4HHFeVokEtvki8y+VAikyAR9ggrJ8Fam5evBjaXw5cBH+iEb+4uJhVALk/s74dF+
	0EvC1Z8P5KmKKoqBuMikqhEg/IfOxfT0DtJFrlXuRaV5uyxbcZv6QPDBZWMwN7rLe/TSE9LS/lH
	hwgxx6nPE7nwXWQz/e0Q3mUPywFynx180Me7hbUHPxMiSW/Yjh7yk/Z83agl1my8qY3rl0MtXbr
	ZlvZnG1kIXTz7G2Eu/4L5oPAw3xj4vAdkFuVz08zv1s1vuX9q3xv6HZQ9rJy1tXSDivszu1xCSN
	VyhO2684goOvEj5ZBIy2HQswVoZzosgnNpU9YAFAmIJD5pCAkvnlAtKMBPanRWOvvQf5DfESY4j
	Y4BGEicBAIHYR0iNjtAvycWUEsEuQz2AQE90KuSqBJiq51bSUmVNwiAmqCOO1JRqzwZjyp3bdZG
	OmYtf4=
X-Received: by 2002:a05:6808:e8b:b0:4b9:a829:f00a with SMTP id 5614622812f47-4b9a829f91dmr13256254b6e.22.1788823646304;
        Mon, 07 Sep 2026 16:27:26 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b96babc2c3sm13310503b6e.0.2026.09.07.16.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 16:27:24 -0700 (PDT)
Message-ID: <668b6dce-32f1-478b-b78b-06f8b5d7e5e8@gmail.com>
Date: Mon, 7 Sep 2026 18:27:22 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] Novatek NT51021 DSI panel IC driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
 <20260907060129.120497-1-ryanbrue.dev@gmail.com>
 <54719b3e-d882-4b0c-b477-1e12dcf65133@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <54719b3e-d882-4b0c-b477-1e12dcf65133@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/7/26 1:42 AM, Nickolay Goppen wrote:
>
> 07.09.2026 09:01, Ryan Brue wrote:
>> One question on the binding, which is as much about my patch as yours.
>> Where does "boe,tv101wum-nx0" come from? Xiaomi's panel dtsi
>> (dsi-panel-nt51021-boe-10wu-video.dtsi) gives only
>>
>>      qcom,mdss-dsi-panel-name = "NT51021_BOE_BOE10";
>>
>> with no part number, and the register sequence in your driver matches
>> that file byte for byte. TV101WUM-NX0 is a real BOE part, and its
>> datasheet active area of 216.576 x 135.36 mm agrees nicely with the
>> 135 x 216 in that dtsi, so the attribution looks reasonable. But if it
>> is inferred rather than read off the panel or a BOM, it may be worth
>> saying so in the commit message, or naming the compatible after the
>> board the way panel-novatek-nt36523.c does for
>> xiaomi,elish-boe-nt36523.
>>
>> I ask because my module has no identity I can establish at all. It
>> answers no DSI read, DCS or generic, before or after sleep-out; the
>> vendor kernel and bootloader name it only "BOE", chosen from two board
>> ID straps; and its vendor-declared physical height is arithmetically
>> impossible, since 1200/136 and 1920/221 disagree by 1.5%. So I am
>> naming mine after the board, and would rather not accidentally imply it
>> is or is not your part.
>
> I've found these part numbers on the photos of a replacement panels 
> from the AliExpress.
>
> Also, for TV101WUM-NX0, I have a confirmation from Alexey Min, who 
> disassembled
> Xiaomi Mi Pad 4 Plus and took a photo of the panel's part number.
>
I searched around on AliExpress for my panel, and could not find 
anything about the BOE

part number for mine. Oh well, since there's some precedent for naming 
unknown BOE

glass after the device that has it, I am hoping that will be OK for my case.

>> If it is useful, I have the Fire HD 10 panel ready as a variant on top
>> of your series: two patches, binding and driver, adding
>> amazon,suez-boe-nt51021. The only change it needs in your code is
>> making mode_flags per variant. My vendor asks for sync-event video mode
>> with a continuously running HS clock rather than burst, and your two
>> panels keep exactly the flags they have now. Burst worked on my panel
>> too, so this is about matching what the module is characterised for,
>> not a fix.
> I will try to do that. Can I add you to the maintainers of this panel 
> driver?

Yes, you may. Once you get the v2 out, I'll get a patch ready on top of that
for the Fire Tablet's BOE panel!

>> I will hold that until your v2, since Neil's renaming will touch every
>> identifier it adds. Happy to test v2 on this hardware when you post it.
>>
>> Thanks for doing this first.
>>
>> Ryan
>
