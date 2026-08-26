Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82707474265
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770861; cv=none; b=oePrQuvsCcn+ZjL/VGyhtgRueXRr+Ec2O3Q1u8OrikSPyjSPbCTaBFm/YPltflfEUUUxSNvvNp4obG5V7GuDYEdq2FUaGqmrk+AOsBXWJMERyt8wA/enE5BYHJvz8jGb13gHWfcg4fI8O8uDKRSZxT4UkSIdfMKqRvzr6yAovaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770861; c=relaxed/simple;
	bh=r199hK+LeqZ1TLG+BUKrDlZcPBwc7S2i71PiuCEluyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgFl708ayx8DNspDXZfWDcmkukurYofoLx5OK3E8+tA+4bKmruJQ8LsY8JW1txEONA8se3fj9lJYAHZ7rkL4DQgOswV6apFlaXiWNhExp9CtCxyXOQwO57xj/FUlqTDxHc/I/Lynuf6yqopXUpqtBFMHm05prbA/v8a2x+l2kHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4agiFZP; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4agiFZP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5e329c0f2so1530382a12.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770849; x=1788375649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFPG1v4C7K31HHAjywAPdWkZFgAUo2dyQHyuXYjp8pY=;
        b=q4agiFZPJfbR6Sbb33w+XfcVjAh0ytF2+HnVm94BIOv2s67lVjo8QOXhKDQf7hl1f6
         cRdL7v2uLl0QnnxHnr5i2bRQiVkdAw2NM8liiQ4OxPW4BNoQ9cs6SDV5Oiq2LVCiZ/kT
         1BGzzG5jEPMPkekSYmLn6xAPhSgXAsTc4U/oW7PMA+sDFtp6BXnR31McQtpFtTDFEzCw
         TCNq8lhzblFKFUNbDW03lwcoxRVHOAuuuZlH62Imr9u/DKDu8ZFVAf0Fxe7iCbUK56Zj
         9QF5Q++Tkn0ywma+SK1/CWLp64V8kPScthc/YB0VblTsCBOlzFiLbN+x6vbhIsW9WhRl
         /+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770849; x=1788375649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFPG1v4C7K31HHAjywAPdWkZFgAUo2dyQHyuXYjp8pY=;
        b=ho9O1SK1ivHUERS3ILHe1K0l2l+zi8ia8cPZlrkeVkunKVKTErlDVXAubWV7gu4AGl
         pckwojh0GDKsbAqLqqCxHjY1JwMaASO4zXh4Ltpgat1uR7yg+FCc+s8e+fnzsZutuJ5V
         T6EYoVqNLmI+1YpODTau5dbBiiDYY/v8vj7CCnhOgD6ld7ZPNaBnwbaDFg9hfVLdvyJc
         Y+eFqfkbFmNSZz/l94DLVp7kto8x4mADgVKmLXMgG5KxYb34xYzTb5UZuEZnuPfuB1JL
         S/QZuAcqTvAdl4G3+1TVFMyS6Hh/q55ytHhUiUCK4pKr2UDAll3ZdgbemjA8X1+RS0Oo
         CFuw==
X-Forwarded-Encrypted: i=1; AHgh+RoeOE8McTdBvIwQACSUb6DqLY2Rv4YTLrdUbMQaH17/QVTUxaJ7Sx9szqkebtAsTqL1Mv4zdGLxDAZS@vger.kernel.org
X-Gm-Message-State: AFuF++luboP+H4Bs+sFzq9mS7VNNQwfcXAh126tmqpMxi6PKU+/B1mcL
	WFPwzGFrBqshsv/C6fP3LZsma+jo1jT5WzfWUSJeFYFfJi/S0MdhQDZU
X-Gm-Gg: AR+sD12e7TsSXuME4KTIFFPz4jgr54QmVDJ5qA4uSieqL2ZkI0aHL/B0a4VFxkcD1ry
	Bv8VDjplTxnCjOhLyM95/kkykxMV+WrsCtQ9sWOWqQ0ZrDYQHBQP0qGnodfXIojpwCrDLzD3fQA
	m1q7/gMuOkM1lzwEowm66VaQnmlU8kApqkBeOrhQqGq/hCfFiiyikxi25fp+qrV0ysSlk/yfblx
	V9hil5O9bo0Ullh3JIV2ZGoBodORJ7sN8o01BYukChAaSYBajVcHPAtN2hoMSX0m0UK4ZolZ6OM
	BgsENDXRPHkpzmIVS3EnyHCu0Rt70HzcuHCzdmsMqzoPgkUaUC9eY96grZ4WsJy2Q6lrtfcodBM
	LMdM+oVfedQ6ujhH3iYaZ7jW985wEt1XVwggDcQj7vgDAopx7VJ9B51Y+ToVDjU8knaSp7PJ5Dw
	/HooOsgFjGSSaHW0U3x5jslVrSpG9FkLjHRDI4CfYA5sDotjXuuU1/oGw+693pLFPLrUwG8UIkx
	+Oho2WaSCcr2fSC5lnmIEKHjLa2HZ2q+EfM
X-Received: by 2002:a05:6402:1586:b0:6a5:d8f0:dc12 with SMTP id 4fb4d7f45d1cf-6a5df64dd40mr12745079a12.14.1787770848476;
        Wed, 26 Aug 2026 12:00:48 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83ba0sm5318287a12.14.2026.08.26.12.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:00:47 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: national,lm90: Fix channel constraints for temperature offset
Date: Wed, 26 Aug 2026 22:00:43 +0300
Message-ID: <20260826190044.5211-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825-iciness-unsavory-a13f2bf0f2d9@spud>
References: <20260825-iciness-unsavory-a13f2bf0f2d9@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 25, 2026 at 7:58 PM, Conor Dooley wrote:
>On Mon, Aug 24, 2026 at 09:38:59PM +0300, Flaviu Nistor wrote:
>> Limit temperature-offset-millicelsius to remote channels only, since
>> channel 0 is local and this property does not apply to it.
>> Channel 2 is only valid on devices with two remote sensors, so reject
>> channel 2 for compatibles that do not support a second remote channel.
>>=20
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>>  .../bindings/hwmon/national,lm90.yaml         | 29 +++++++++++++++++--
>>  1 file changed, 26 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b=
/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> index 164068ba069d..a7f82b202b86 100644
>> --- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
>> @@ -113,6 +113,29 @@ allOf:
>>        properties:
>>          ti,extended-range-enable: false
>> =20
>> +  - patternProperties:
>> +      "channel@0":
>> +        type: object
>> +        properties:
>> +          temperature-offset-millicelsius: false
>
>Instead of this, could the two if/then blocks below grow an else with
>this instead? What you've got here is a bit abnormal.
>
>Cheers,
>Conor.
>
Hello Conor, thanks for the suggestion. That makes perfect sense (don't know
why I haven't thought about it directly). I will send a v2.

Best regards,
Flaviu
>> +
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - adi,adt7481
>> +                - dallas,max6695
>> +                - dallas,max6696
>> +    then:
>> +      patternProperties:
>> +        "^channel@[0-1]$":
>> +          properties:
>> +            reg:
>> +              enum: [0, 1]
>> +        "channel@2": false
>> +
>>    - if:
>>        properties:
>>          compatible:
>> @@ -149,7 +172,7 @@ allOf:
>>                - onnn,nct1008
>>      then:
>>        patternProperties:
>> -        "^channel@([0-2])$":
>> +        "^channel@([1-2])$":
>>            properties:
>>              temperature-offset-millicelsius:
>>                maximum: 127750
>> @@ -172,7 +195,7 @@ allOf:
>>                - winbond,w83l771
>>      then:
>>        patternProperties:
>> -        "^channel@([0-2])$":
>> +        "^channel@([1-2])$":
>>            properties:
>>              temperature-offset-millicelsius:
>>                maximum: 127875
>> @@ -186,7 +209,7 @@ allOf:
>>                - ti,tmp461
>>      then:
>>        patternProperties:
>> -        "^channel@([0-2])$":
>> +        "^channel@([1-2])$":
>>            properties:
>>              temperature-offset-millicelsius:
>>                maximum: 127937
>> --=20
>> 2.34.1
>>=20
