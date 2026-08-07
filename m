Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A505D38D3ED
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122631; cv=none; b=mG/R114RuQcmRMzY6WcN3Tpztmlb9ggTIzuhsXjkmsCDDjwQ4tUj2Uq5v4pCdpEb5iTz2R5wY8FojBWs+kdun4ILvhJ4gQx/PTLR+gUYUG4HFyJNrd20BpN/bE80VG1JQUXH2e6KaKmrXU4Kfg/ALvP8J2xM09CQYjMb5yG3Dsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122631; c=relaxed/simple;
	bh=TmlLgISAnr4rRqg/Ayqw9Wq6LM6PY8bUYPc/LdR0qDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBhJ5bcXaFIT7i6WbqSUOETshUcz0/vJtIRSrXjbFpz50TI4FDsWVHFNuHMkrMDfQ8KYr/jTh+Bx0/fsWflYG5S+2YjsH/vQDfA3+mGsPQzkfWyxGJrrDZ7NGhepOZdQZjSufLp0u6DJQTwc3Hj7K/3XnmcxACgLugVzu9buGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G79Go3mp; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G79Go3mp"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e27035206so2676297b3a.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786122629; x=1786727429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mE3O02OMWkG+4I4n64q608gMiInuxyO9qbByZw9c+TU=;
        b=G79Go3mp0DSv2cduzO+AHcvddWtrIJPkbEnjr4lwKgV1S1GC+O3UIIgdgFRkJI359E
         RAMaq0780LhNtvUjJ9ocCTbs9ggrA9LdI7Tixb86DMHzFVAmBhLf3ljOdR6LBw053bQ9
         8EPA6Y9KzCC3cbCqDJx1oUmf9dtjYWZWm2tlad6KhBhXO7J3tqjYuz/evGJmDgPZsuco
         imnIIhG+NTyCbmR9phPq59Whkut8j9UA2haB8W72lkVodO/VY4Yxg8RmArfi5PvW9TyS
         CnGLHntO9TAoTlA6PR2bfykOdGsohL8s5kPg4OWyQd3kQHHacHnolNBzZwCL3s/AylrU
         zFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786122629; x=1786727429;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mE3O02OMWkG+4I4n64q608gMiInuxyO9qbByZw9c+TU=;
        b=BlUiUmL46MC8xJggWGOvmro63CTKOBv1hl7pqWR9uvN8i0UvRRYChdQV1NHlFjXNC7
         /5o2THGxBDFjHOwhPwAo5AmOwBA9KHs2XQcL+QbB9g3cpXxbsg/vC1mg2V82+3DQhiGH
         5bbJHFrcWx1ozzgylz9E4iiyYfnxaiJkmKvvhd3TcHWWFYxS4ucOTxg3tJG9X2yvOUOY
         KN83H3P6LOqC5V3bGd7xwiRMY07pBjEYRLc4p3j23Ntq9bz52B11VNJYOSiZOOKmtZp/
         uESbSDZyT7iQLDYQllpIo+T2b4uPXqRCVcI7kCWSDaAEgCLb7LXgFDMqlC8yA26NxPgm
         lmMw==
X-Forwarded-Encrypted: i=1; AHgh+RpRiFm753rLqT40TYlJn7ttQqRdpfs2vltvVuudlumFNMJtzu3mAIWu6WFKi38meZFeZ6kNgwt1y7yA@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdFUX7gu1H6SSnxjsiKN9JqdaWK9oDMCr+hUZ/Tr/Bu9MIR4Q
	cKCQSsICPuJFActXAxUUdkQBiYPzAyRxHtRsmvRtGQY+67DH3iXbcgw8
X-Gm-Gg: AR+sD13aTzRnyv987cEgNRwzTXlNxHv5v6Qk7Xd+QCFoB8g2lMKVM/ezQbz4StIDk3B
	G4xDRWM3c5nkH5UX0cmVPv99hv8rU0JxksPQDV4Pyx/H6D+lPuTUbR0EUFtGvP7e5mHiFtGD6+q
	j55UiuiGs3WoIh6keKEW1Z0s4thnbD8RhOSbUXInOw5zIvXxWFMuFGWX1hpQAKJbYYPnED4ukIh
	6Bn3t2GwtIOVxMQhuJgeEr8JUzBMqP5G0odPjxtCYDPv+lVZjSiRdEH306JAN5ejEs0Gjc/z84P
	EHcV9L34CiEZRj9Q/FgGSYP1rjXU2l/Bby80g47CoE3mogSX91dgvvWVRZLc0nkfWlmgh118HGP
	uj4NFjczKZuQzOytH4p0YmweEhT9Z+0YxUHPBJtWZCf3q37Nelwh2Kf0QzI4ylMuJYaJBk447nh
	jkahvhVzw/fjDV4p/3TAEe8ZylFlbCIdwAL0z5wZAO3RBdhjXZyjLlU4yhoOnDtYaAlBn2o9glV
	xVgrD0jx84VC3QQdGFG135tXhx261A79KL3b+xKe+2g3et4i7c/x5PkmnkG8+GIEFmOCmyHO2lj
	XCVeu8c=
X-Received: by 2002:a05:6a00:399e:b0:848:4d1a:9556 with SMTP id d2e1a72fcca58-84f2dfd0a11mr24731599b3a.11.1786122627490;
        Fri, 07 Aug 2026 10:10:27 -0700 (PDT)
Received: from ?IPV6:2804:14d:4c64:82a2:a0d:ceb5:202f:6629? ([2804:14d:4c64:82a2:a0d:ceb5:202f:6629])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58d82asm1346996b3a.57.2026.08.07.10.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 10:10:27 -0700 (PDT)
Message-ID: <0ca14770-bb0c-4be7-a9b0-6e07d521550d@gmail.com>
Date: Fri, 7 Aug 2026 14:10:21 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: iio: proximity: move LIDAR-Lite out of
 trivial-devices
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mranostay@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260714215433.41259-1-rodrigo.gobbi.7@gmail.com>
 <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
Content-Language: en-US
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
In-Reply-To: <7b8973fd-385d-4532-8213-bb0a811081ae@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/14/26 19:44, David Lechner wrote:
> 
> interrupts:
>   description: 
>     Mode control pin can be used as a status output to provide interrupt.
>   maxItems: 1
> 
> Mode control pin can also be clock output, so we could add:
> 
> '#clock-cells':
>   const: 0
> 
> if:
>   required:
>     interrupts
> then:
>   '#clock-cells': false
> 
> I only checked Lidar Lite v3 docs, so we should see if these are available
> on v2 as well.
David, quick pushback on the #clock-cells suggestion:

The oscillator-output mode, per the Garmin datasheet, page 8 reg 0x4 from [1], isn't really
meant to supply a clock for another device's logic. As I understand it, it exists so the host
can measure it against its own reference and compute a compensation factor for the device's
own distance readings, since the on-chip oscillator is only rated to ~1% accuracy.

That seems like a different relationship than what #clock-cells models: a provider is
expected to report a rate that a consumer just uses to drive its own logic. Here it's the
opposite — the rate itself is what's untrustworthy and needs an external measurement, and
there's no consumer that would actually want to clock anything off of it.

Given that, maybe it's better to just describe this rather than model it as a clock property,
or leave it out of the binding entirely for now until there's an actual consumer for it? My
point is more about whether #clock-cells is the right semantics for potential consumers here.

Tks and regards.

[1] https://static.garmin.com/pumac/LIDAR_Lite_v3_Operation_Manual_and_Technical_Specifications.pdf
