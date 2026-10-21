Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618920;
	b=zK5ng0lFxUpCfaqQUDp7HNSK71FQeOqT98dYOxtYxbY7QJojkh1NbL8v8QCFZsJMN0lp
	 7GI3eikkw5KgG9fyKwQfK5UKU8vRpYnudhAl2ZEdPO8u0zHKPsDo4yH9JOYJVxEXKcCmx
	 35Wvuk33xFPzdVanK4RxGr/EvNEtfILlTAKjt93qAqNvMothNDQyM7CkGRl5+A2Js1UPU
	 AiAfST81B5fPVJwhSi4qQZCdJkurWPg18qL0NAc0/ODpGkl+v9dUf6nPtGm2Ah4AHjjA5
	 iJKzuSYvqQnO4xAHbQWcFlCpVeNrGoe6Ysazk0bSLad2B8BNGW7WWOoidXifvIaPX+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
	b=qGhR8A3rE/e4xrXA6/0RQRModf4Yy7f64kXHaEsVUxi7Kf2EFb0Arm1wfGhQ0Ch0YpaC
	 C3heWGePajsLEG25WH9rKMKw92laE6TEzf7ZrSX7KFvQiTDGvE/JBuyP00YdvPh7ZqQov
	 lO/SAuUW5jFHoLaQbWd2u5TFYopfjyGk+gDQtqr5jQO2xrNTHs3nl3RLv/A253qMnVt/E
	 YI237Z77FHQo2IgahQJnlKEcrMLsz6GSy36t6FmkegBZTJgeHHomDBkNrJFseYpvWBu1K
	 lT3ph8EGj+gdvazlnaqiUUU/g/YmQlQamrD/3znMTDAhZNykRCDIeim/p8o/u0LtX9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=APWtFxd6;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC9F606A325
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 21:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC9F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=APWtFxd6
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35943f55c06so370240eec.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792618919; x=1793223719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
        b=APWtFxd6tsDHcsvtGIEJLxjzQrjUDtB/TGBRRdI9SCU1Vf9Cv0ho6bdDochbsJsFJa
         6YfvMf8A/nSP+14qATm48kQoFOG1ByuAB3rbVQdwZO2TfuHcvxFiBKR4b5ut9TN9/fbH
         yjAoYMraPnA+gHvtp+zuq1YzI3peJw7SFb8J9/0m6D8h9UOuySeend2KQW2JQPXnq2po
         Q6V457vdylOlsNUhaQlncRmq8Pn37Z2294HN8hlMSfZBPe7brhJnG0bZBgN4CUX+dZD/
         m+n1yU5ya1ug0OmKJO54G/kFInmAi90awd6tcB2dGOYXl0Hs7l7mlwZBKGT3SFE0lgE/
         Ue9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618919; x=1793223719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
        b=W82pe/3M2QErOTqoY9c0qQWzy2CqTTTqc3WgXpDdSV3k5X8Gyc2QMb5b63anICRcUo
         6xfVOjn68zNiMmHQMixqdFsW/c6uxfD9IeO56MqONKk9/7QROTFTXmHEth2L2Yp5lmDV
         xcvHq35r4y0z+aC846+/tnFsQSXzSs4Bl7PZJu1rc//oKKTgxFfB9TTJeMu0ntkfcoIC
         Yi0MsA2HtbE6RNuooG+8xsPZrJu0Lza1YXV57Y9FnWUdQhh6jBi6YlejTlW9OVe5Xz+Z
         pOaTAoERVjhfHrJbAsnW0U+1TuKy6EXEsG8guzPSDNJtZ4ZXeBYwo1T0oE4TxnWx8arf
         WtZA==
X-Gm-Message-State: AFq9FYKxoAaxw5ta7K6aiEy3/ZhxFlNdIOG/ChWaYfc7rJZ5fz00As94
	Ox92BtxqHudTeOhO4ffdjXCDdTXz7myd4GbywhWanff0QYuK3lElaUyI
X-Gm-Gg: AYBFou3DuRSaJwmdCg9WkHIG5PHv0pzE2Nw9pbiCRyndrdaAQOGaRtmHC8SjuwvDcei
	wTdl1VMcYPT98FF+PRINrCz1FMW8qS72c4HYjLmT7z1ZsYhcOKxyfdQlZZKKWREgD82ime1ry3t
	PXzXcAgUEfBTkJyEJjdeSzkrwA8PP3PHrnAN99NI2hyxyD9d9/nC5dTG31fdt91an6wRMbQLYg2
	Her2nwEtzAFmoZji1TfPKCcaBToDLYSV5pVkGTtqrXS+9UNELtWtwxUhO+RN7d1kZdm4Urrw5L2
	25EW4pERLL/+n9m9g1S6cYTBjQ9xQBj/jLJ2VW07rv72l22/Uh4yB+fbRBY13lmICfEJcOLk/fR
	hlbO0g9Kj2PM0Hj99laN267r805NPNEzj227SRkWJ7yWbJQVrCyic84cr+PT67JEGWur8dT8IPu
	k6XM94Y2FuLDSJ+/PjeqIdbeBC+MltTH7E6Sx1E9irKdsSXN2jyEHjtiOXLcpYcKGPi9YKFUi+G
	u0KPuNRFlrpEL8HqnVOWqqgaZ0ceztZ46BWm85ZDFVQAj6Ljy/K7Olny6ewnsBWdit2IWKYOmcA
	II4rpimE238LLX0ZYbbgVr+lsvVZprW5
X-Received: by 2002:a05:7301:7e17:b0:366:6c79:212b with SMTP id 5a478bee46e88-368b122ff22mr622562eec.25.1792618918940;
        Wed, 21 Oct 2026 14:41:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm10773723eec.11.2026.10.21.14.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:41:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>
Date: Wed, 21 Oct 2026 14:41:55 -0700
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
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
 <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <guenter@roeck-us.net>
In-Reply-To: <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 13:04, Abdurrahman Hussain wrote:
> On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
>> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_voltage()
>>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in regulator ops
>>>> --
>>> Good that I did not just apply this patch. Do you have time to look into
>>> those issues and fix them ?
>>>
>> Looking into it,
>>
>> Thanks,
>> Abdurrahman
> Addressed all sashiko comments in v4.
>
Yes, series looks good. I'll have to wait for the commit window to close before applying it.

Thanks,

Guenter


