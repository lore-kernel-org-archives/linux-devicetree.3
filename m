Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594853;
	b=SieG5GK//XaYeOIAExk49nuo2GHAr1Dvkim7ePHUmmP21uwwYxaxYigWlRkWa+16KW8G
	 dWh4IiENvgLBnEcmpsGjY7dSRLySz9hxtVqGfr7Fk7999nPJwalsS1W3l3iWKjKljvcmP
	 9PJyvkVW5tzfKoQJJkKlyyUIacZXX2XoYpiKsgbcePWKjcuEA4WGimQNLcbLVhgAvq46h
	 HCptkOnIouox/Up7hzme5kBhYSSWT0BKa0gUX1cyYkUG6rLaE+YFkszCh6HkOM/3WpKKc
	 u67dYgEpV1aVDWvKptxpFIrgx1Goe915c80kPlEfstyZ/YqSEffLHS5rJo6ATGtxyPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
	b=PuDWosiqTkycSID90YUJW2CWAz7XGEOym1zPYE0fq3XH6peIFj0eq66a6g0NNZEmc5xe
	 5vIkoM0iRNk3n6tjmB+ndxPnQE4l8N4JlM8ULBgsl4o5foVogmNyS8DRJTsyW9NWXbnKu
	 sfpmGlq1T7qp76bygzJOjX4aQJ8BIobeNg9nNzKRXFhKbJIufH6DvshiedxsbfcDwDoIE
	 LgoDSWxQm9mCcUAAYsRoTCJgZy9qOkI63WzvW9/N2mGEQ9ed14xAYqO96CqXBrDZAlzXU
	 g2sCtqge1gnwgSrbDgBp6RoakhBYMP2R7FhQHak+3ikkXC8BidTQ93MdqnV0g3icZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A4xznEjy;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EA606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A4xznEjy
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bce4e278baso764971e87.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594851; x=1793199651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
        b=A4xznEjyd9gjdzKJkX+mfkvPlnSAO+4xALnxI/8O+5f1RkwqiNl9G9bfCPcbIutDVY
         GVCQ6FNmtaV0q8s8YugGHDOeZRepbnQP7RqEqiqadKtcNsI9ax22vJGapQV9Lya740fX
         WpW+bitVEHaEIv6cCUxh5CRoe5V67OQ1ib4iDx0evFxiGLA8ifUnhFnOSsNECBJsOUOx
         7UCYNCH8OA24vPDw+EEq4bMJMiuWSAeDrkFaeVzQJH9s188awoox0hcdInX75Aaf5WEK
         O1lBSq2ov2DhdZVHI4M0oputoc8BXV4E6DsTtkiHjsWBEczfjA/T3rbIkHrVTTjE1Qil
         6IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594851; x=1793199651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJUFxlHAzttxqjIMcqfssbx3dgr60QqCU4WzOg2ixlY=;
        b=VZDbePiC7gC26SpnreTgrrvLXvNLE/9rfvH5D17aKjnZyVVg9PewLvyl5hMYfsZmKl
         aX+xe8bk4oKbS/K83IqJB9W+7tdef0TS0QH7NR1IZ2gI104K8/qumnFBGkphlfRQj6rw
         zbfMvzlIAf1ECB83NakOosDBeIDta8bx6XnDmxJyQrW8woMM055Qd71BT9YeVsAkyjVh
         ztw5A127+SPu1cCoPYXgsA4pz7MtcxfoY5qGoayf2bn1PmCoeWKYO/mtSqg7QcTRYzQH
         xwS4oY0x9IfOR/gl6P61QE6eiWFqpTNqROIiTvc3y4eNhM5vhRY+GmX+9zicUcEljWik
         QChA==
X-Forwarded-Encrypted: i=1; AKwUvBzUYyVZI+IL0NR0F/7YUw1YxFoKiFf1YvghwpRIaXydPpuTSX+oI0kqSTXYsPsU3vPSKoy/1RvHhGVC@vger.kernel.org
X-Gm-Message-State: AFq9FYJZRr/msY178MDHyNFw+XlM7Da7x+AOgc/CWm7MICGviovR2lJ5
	eGvYGFeC40VHhfHkO87SCXKp4vOEojOgtxWrc4hFw+VnLCGeud+018rs
X-Gm-Gg: AYBFou1p0ARDC63WMiA7dJQsagBvbwtlO68iaoiVVGnBHdtcP9FgXUWJIpfNtSpJ9+D
	UKZZBosrE6FnLlD4ItDVrORlVGZ+1Pn5cdF941R420iSxwLU9C+BgHsv0s3pvTsWC6Jq8oIl6Gn
	DsUSfwr8LV4yVS5mtI37W7LnG74Ewd11HGsGLD8YneNfvwIZ5slkwnT5vJQdFLhBOj97Zqq9tLb
	jTpp+CfC8ah+yeG+15BOdxWLNBFAHErUkGAqNpHccHi57fbSNRhpLJJgKKxk3gDxnMjzossa+vY
	s+A0iSrgOwYaoXOIXbI8Tre2sNTejF9tWkdyv1NzGl3C8HILeUxpiRylmZ0bm+kE9A2brj2BD5T
	Z8vR/FfKdDf7sAnLSMEnicmfVRibTlxKEpuKJeNeCft/o9IMuZow1/RtgGkybuRK2pK9ge6QU+D
	FkNO45s7qcYLkbXTHUgWgqxwxIgKVUkBadp6vfD9kS9CHNrB63GZcwhnk18q9Cq4vl6aCNOI9sE
	e+PIzRuDRhRNle4msY/cGHzjn0CmGKVYOqOCeDWD74kAypDyt0rCXRzNQ==
X-Received: by 2002:a05:6512:158f:b0:5be:5184:a3c6 with SMTP id 2adb3069b0e04-5bfa1bf3e17mr812374e87.10.1792594850692;
        Wed, 21 Oct 2026 08:00:50 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa48f1698sm168605e87.7.2026.10.21.08.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:00:49 -0700 (PDT)
Message-ID: <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Date: Wed, 21 Oct 2026 18:00:45 +0300
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
 <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>> Have you tried using the bus through the normal QUP driver path?
>>>
>> No, I haven't. GPI DMA support for this platform is not yet upstream.
> 
> It's a copy-paste job, try it out please.
> 

The pinctrl driver for SC7180 has no QUPv3 mux for 51 and 52 GPIOs. I
also tried checking devcfg.mbn of my device using qc-devcfg-parser, but
it printed limited information:
https://bpa.st/PEZED3BN3JGND6HS6BOGNHQG7I>>>> +&usb_1 {
>>>> +	qcom,select-utmi-as-pipe-clk;
>>>
>>> Is there no superspeed / DP altmode?
>>>
>> I could not find anything that confirms super-speed or DP altmode on
>> these devices. Besides, ufshcd-qcom fails with "link startup failed 1"
>> after setting super-speed and removing "qcom,select-utmi-as-pipe-clk".
> 
> On the stock firmware, if you plug in a display via the type-c port
> (perhaps via a dock), does it show video output?
> 

I don't have a dock or a DP-compatible monitor at my disposal.
I found the schematic for these devices and found no wires for DP
altmode.> Konrad

