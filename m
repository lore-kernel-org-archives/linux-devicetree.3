Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664D3FF89A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511089; cv=none; b=I9whhj4mqOjfVD+jPk/cklvmRtcCra0ZADKlfrVIQHmAvTBbfZVHXNNCmeKGzb1HJEpVyn7IPgHLxR/mxOvz2K5rVB+D2zN+1kWjh/l1IOiS1YLCxYdMgKDIxmN6G4GZNdXr4/wf3kl0HBiWRnxkuPeAKQJ4755VeTA2QFry2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511089; c=relaxed/simple;
	bh=fiqN52hoiPIbCm1dNMUPMNLC988GDAA1ANHCAtIZaoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nujgVjwt1nPdNTLZR7KjrdhifEn0aazUygPiVhZa4yt9brU4oPK6JqPrS7SXJx94CbTEvmcVNzn8/I/NCpXm6pLELh2PAuBGwOB1KrV5inGQjt8/g8KgIzhzqJK4S/viVHo5DkDlX/aSYsXIL2DaTkVHjsylQB5JyQq6rAzVQd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=wSHOcz12; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="wSHOcz12"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-415b23dd6e5so1641985fac.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778511087; x=1779115887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oS24+5W/osQp5tsZpUP3jxZildDxTXPcVZaq2XXbhPY=;
        b=wSHOcz12X635QhemWjgSptQiaAY4B8/1e88+bW1/EVjp38RMom1IyBm5fSaB+uG+3Z
         v/7qfgfh/UVihw8MBAZOKUHOmpSIA3ZF4yEMUiLHmTmQBWJvV78/V8uHZMM0MZ7Zd6sL
         qVZrXhNjL2raucQ1KSA2WjxKgil0Psd4C3IdlgwLt52WCUpBzwOJXaqgRuUslEq38Vdp
         0l/gqOMjOhPCCKn4HITFXwHSIp2iAyITMMPQdb5pCieeehYlnmw4R4oxu8Eaguy//UK1
         LctWext2e2TQ5EOiKW5AW0lG75Ag7PRjBuNw/vrSlsU0Yq8AoJZ6BKxEQlLpshShge/o
         1TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511087; x=1779115887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oS24+5W/osQp5tsZpUP3jxZildDxTXPcVZaq2XXbhPY=;
        b=O23C80VHGQeOCGLHDKVWEbCdYuhv4dv3eJAYiCrUJl5ahE/OBQFusoDQhVaZy4YEpC
         TAkX/pSJQDieFp+FNg5/yP/E1PZaPV1NMoz3KMsI+4UQJe67DB90eGk8IfaZCvx1WhFC
         K0juzipWi2DeQSFsdEGlYyOmaNA/nhUNLHDdrpSCWsdBO2BcjpesRmrQmaY8dGvwmc3z
         k3aAoLjo3gEQxo0qLu0Pt8PkYrSk81VKjK/s+WC6ejgHsZYKpwFPkTm1GF/Y4bt9SyxC
         +6NqU1x21uWVDHGr2ecHiAbz/bIFX9fF/3bws3ZbMXk766wCcRszlYWBJZZqmNH/M7ZC
         ztaw==
X-Forwarded-Encrypted: i=1; AFNElJ9nsLkvaIkpjMB81/7wk6kXXAJK/tUfL6g3GjimcflP9H73rynKFd6QgTowm5U1fy1QxzkUNQ06qQki@vger.kernel.org
X-Gm-Message-State: AOJu0YwaW5mgEy9BtykrcOgej1iUKgpMNsyTL545j/XWDSxiCjIOp+xK
	V00s3DgwRC/qFuHou59w2fvSAeTcrVtiYehmTG96aerfs39NsZGHviB/GFq2E4qL2uQ=
X-Gm-Gg: Acq92OHlR5uzTIPONC42gp7Jyyy200jQtDMVQtGV8VfSM0gr/nVjM0Ya8PTICyiRdOz
	owauImxo2HtgvQkgM1iseE3V6td/E1Eriz5xPZ2tuFtL8ZolbbH4p+Yg5+6rzMnjVq9kB3SBd7U
	qDiXYfSiGCBQ6Za0Ojzl7Pu6H8GNxSXgfmxINmUZMgnG1Kv5OUhswtZetNI3iPXBsVa1FdIjrvM
	PxpAUqYnAB1146Ke6K2Q8hS/+GoLzVqos8YYJxoiBeNomBoWpLnziPFdCh5XYvEQtqBVA7ltZxc
	NBFEeVyZUq+i5/kStrEuqi170mTlbJP6V1Re6Dj+PVd6vqcMVcDhwGLnfMjcu3v0U9VD9Prxavp
	8k01uBeFXSx6Hz7JupjxTr7XIkrxjtilt4X0mR/eS5FZY5iuB1uj1gjmf9EaEL2MCLJ+Wex1KhS
	aK3BxESo+DfakWKhJz4zLPEf6xR2D056R2UcXAgQYfs+P+eeN4zh8gfODHwspLID1mRRBpbRUhk
	AFicvUkpA==
X-Received: by 2002:a05:6870:d1c9:b0:42c:ecc9:58b5 with SMTP id 586e51a60fabf-434f586a72cmr14643597fac.11.1778511086772;
        Mon, 11 May 2026 07:51:26 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:591:4577:3439:3a1e? ([2600:8803:e7e4:500:591:4577:3439:3a1e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4355736dbc0sm10029411fac.11.2026.05.11.07.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:51:26 -0700 (PDT)
Message-ID: <3493d6ef-5f02-4eb1-b81a-89597045acbb@baylibre.com>
Date: Mon, 11 May 2026 09:51:25 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: iio: adc: add AD7816/AD7817/AD7818
 binding
To: Denny Lin <dennylin0707@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260509022718.82957-1-dennylin0707@gmail.com>
 <20260509022718.82957-2-dennylin0707@gmail.com>
 <f6e2a4de-4c1d-46ef-b383-db62091fd0f4@baylibre.com>
 <CAGEkeHfeZWi99TMvkXHhMSrUS8PshuekqjszBXaS39VsLUZ4eA@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAGEkeHfeZWi99TMvkXHhMSrUS8PshuekqjszBXaS39VsLUZ4eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/9/26 8:37 PM, Denny Lin wrote:
> Hi David,
> 
>> Why are we adding bindings without a driver to use them?
> 
> There is already a driver for these devices in
> drivers/staging/iio/adc/ad7816.c, which includes OF match entries
> for "adi,ad7816", "adi,ad7817", and "adi,ad7818".
> 
> This binding is intended to document the existing DT interface.

Usually, we want to be moving the drivers out of staging when
adding the DT bindings so that it all gets reviewed for correctness
at the same time.

Drivers in staging are usually there because they are doing things
that are not actually acceptable for the final stable mainline
version of a driver and need more work.

> 
> Thanks,
> Hungyu
> 
> On Sat, May 9, 2026 at 3:13 PM David Lechner <dlechner@baylibre.com> wrote:
>>
>> On 5/8/26 9:27 PM, Hungyu Lin wrote:
>>> Add Device Tree binding documentation for the Analog Devices
>>> AD7816, AD7817 and AD7818 SPI ADC devices.
>>>
>> Why are we adding bindings without a driver to use them?

