Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECC5385509
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951951; cv=none; b=DFkpLWRBxYHIGCtet6w4oLWZRFaYyznzO0E45d313gzRyHx174ADBYKguLGemIz3v+Dh/dHFULtFJB/MZIXc+W79FNBNlbOBSyEmmMqQjALnzmwIoqqqNA6BRhQnRrMjeYS4QTwnwXGS2nwcuNOMgvM5iRuknHHpD9qYFF152Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951951; c=relaxed/simple;
	bh=2b7fv8aufK/PjWj6/63cjc8IXdamL9WFwe43EH+MRe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9zrWex4cRWn8tDgtv/mtzdA2f9uwAL9iR4qb6kJs2hE13Cy3lKzl0jFavbxopSDEkQljPjlTRJUl2YpAJIXJL9sBtjORsmvHV4PhytDucLYKfum9qhtiwiUiLMtFNyokSrpvnPrdpChnANAgjDX9bWOdLXA++vbZo9dgFlBOfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WGjWov8M; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WGjWov8M"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-491bc1d4e6bso2269538b6e.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 07:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783951948; x=1784556748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3ffx1ARFvGTVEwrbNuoxCUBdpz3Gg80806XEMXu1NQ=;
        b=WGjWov8MxergdieubyhsFgp+T9AKHKSanbLOPKjmcil7Q3lkOdumUyHenjHuM54hRJ
         iBwmi+YGwq9QJwhRBA3YOWZjN7uq7Kn0i5GCjLGg8bM7rbJEZARmVcFFu7RVB3ZC+fVq
         RtwLpnlxy28JIurwGsmC921uTucKo+ZqmcyBmoxJAZ9tPUyIMsst0tAEtrufEYmv4CWo
         y9t+ouRGd/1pSEph+kFRqOziK+efcjYWBIwOsROyEkfwIc1UzBbqhjRkLs2+BfQJVMCW
         uod9mn5KE76qbnX1pYJ9jWjTmtvwsm8lnY6x5F3eLYXjBhbdIOtqLxnDc3qcPfi9IDpe
         xAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783951948; x=1784556748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3ffx1ARFvGTVEwrbNuoxCUBdpz3Gg80806XEMXu1NQ=;
        b=XYj/u0rdKuooBtJVDFWTHDwEMTqfulOAFUY9o6ZUbYo7aqvwMGQYJPMnZnsEBfOyEv
         E31Yzk38YOt6xj3RWjl+KnFSxSzh6H8fbqX8Dhu0wMZKOF04cGIkCNPMPpoF68HWuwBm
         8ormJ+PpNNdmQaMyYy4Qgi0MW5zfOpL4FEGVu5dc8bvVH//ll6ss7cBZBT98ui1xxYg3
         u06WOUOo7Co0HxXQFQKrnWY8W9GoXeo74zDSBQM1ng4ahS7+8hehJI18Rsf2/HmHMzCp
         yj1y6qqEAUKsUbqIAwCIpv42XS1f2pWN2/48pdO3KXnLxvq2quuzwF2Lx3aAazy47scy
         TVeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8giKst1v2Oc1jIsiGUkfidq5wmacC7Q4EHFRU4/Nl0MvsYOR4X7at3epbOWH6zgLUZHhQBRBeER9QZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuAcnjBiOHiJS2U2aVIxByRqYEjbHOZnDfbT2USQwJjUvb1n9H
	sO+8GcdaKF9uVpzS5xA/1tDDmeT1kMsJtvSJY+PK/AjyMMjw89oo5ZCxUmU3JlQcPko=
X-Gm-Gg: AfdE7cliLtntO3xxiQG91FxVRfVnLP8EWUo9dhz0wjs2LLecCrfDvyPFhmoxZ70/3T8
	ViWlsOpyXqV5PZD5PyNO/0n7eqmWy+CVLNCDYe4x5TmCS2xtymmD8Jkvinjv3bzjaSLSNRq7Zd8
	imrQOkgYdH9XGm1YidxS7UQqm+MJyWa/hNRqtPk2tOISPEYRs+ZRKZGw5gLWuN4acnORbPg8NQY
	4yf0u1nC2Q9r2tOhpFf3AvYuUGkyQlwXxyyH+E0sokiYfHcZurmoz3wZ0o75SNo6wJV/5QI2yJe
	ZcvNnJbyImeIyBPlB0LmVWGs6366ZxVttjQtG9LKV+rj58gcHH7PceF3BXIvLLcCOJlPBePazpG
	4FiHeau3eEr4Tzqo2WIxBqvZhK1jRvqr5UbadVB2RF+fjcGc5mDZQogGqvbblj4xehDYmBHJL+C
	KnjIojWMfjjzfsPazOgvPY2aYm5yKwyaWhQKlnlLhgFHrwHket9Pjm6fbsoX+BnUk=
X-Received: by 2002:a05:6808:23c9:b0:495:f104:d898 with SMTP id 5614622812f47-4a42af2764fmr6846857b6e.32.1783951947703;
        Mon, 13 Jul 2026 07:12:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:610b:e45c:5e0c:e14b? ([2600:8803:e7e4:500:610b:e45c:5e0c:e14b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc83099sm12046117b6e.2.2026.07.13.07.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 07:12:27 -0700 (PDT)
Message-ID: <587c6cb2-0f43-471d-9711-5be91600b603@baylibre.com>
Date: Mon, 13 Jul 2026 09:12:26 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
To: Jonathan Cameron <jic23@kernel.org>,
 Jakub Szczudlo <jakubszczudlo40@gmail.com>
Cc: linux-iio@vger.kernel.org, andy@kernel.org, antoniu.miclaus@analog.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org, duje@dujemihanovic.xyz,
 jishnu.prakash@oss.qualcomm.com, jorge.marques@analog.com,
 joshua.crofts1@gmail.com, krzk+dt@kernel.org, linusw@kernel.org,
 marcelo.schmitt@analog.com, mazziesaccount@gmail.com,
 mike.looijmans@topic.nl, nuno.sa@analog.com, robh@kernel.org,
 sakari.ailus@linux.intel.com, wens@kernel.org
References: <20260711184414.1013686-1-jakubszczudlo40@gmail.com>
 <20260711184414.1013686-2-jakubszczudlo40@gmail.com>
 <20260713022040.146555b6@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260713022040.146555b6@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/12/26 8:20 PM, Jonathan Cameron wrote:
> On Sat, 11 Jul 2026 20:44:12 +0200
> Jakub Szczudlo <jakubszczudlo40@gmail.com> wrote:
> 
>> When device is suspended and it is in single mode then changing
>> datarate doesn't make it actual wait for new measurement, so to
>> be sure that read after change is correct functions that changes
>> datarate and gain will wait for new data.
>>
>> Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")
>> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
>> ---
Just noticed that the subject line is missing ti-ads1100:.

iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in single mode
