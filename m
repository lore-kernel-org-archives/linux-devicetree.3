Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106A03AC0C3
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141608; cv=none; b=m89dyBMnilisHdrYCLuhS90el9/CGhOsG6JnTcXeLDM0P5+A55omUbmi5gUqh/TylBpk7sqq0vT/K6RmcJwNPZwC47q5N4W+4MQjV3lsJRdIjUeQgbuGOKuonircLxTlVZgCQ5yunk1N3JJxjogFUmQ2qSUBfe2eW6SX2U0XDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141608; c=relaxed/simple;
	bh=9z5gaCcETkHlKLUfBh1xAvlPs3trKDl48H0ub1c3+4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AhtdWALI1NygJzxJczxWxHuY9mS7UyQaCwPUsD06XAiDVOyEOk+ztmhnx1nIVot1rlMT9Ofa0javNd+hIdOiXHb+hiX0fSZiqj0AJRZPW4fzpc2JlmK1E3Y0oxJKtPKl0PTz2uLXj8YyyODOLAn42gGVsaRTq3ti9oBbAL/73Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=ocIhLwk0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="ocIhLwk0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45efa0326fdso204555f8f.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1780141605; x=1780746405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1FWHqbAB9TF09zdPmqMJNEE6N9Lu/1qer5VB9ESMa8=;
        b=ocIhLwk0yRPju3ENzZqMAplhzIXIQ6qNdjPCPiEecnMp51LnNMirkQEKaPsvPectbf
         mxSMozyEjf2IzKnaXV7gdAfuYEX7pdekzSrZohwHuKxzjJqaR1IASITjCLI5w1PH93z8
         TsQd4Q7PxG8l2LW6J5/KtjccOnydhfsHYLgAXwlGebz5kE2PUN5Yi8oC08dTPY5RNGU0
         rGjo9yrhGRXnJTrzoOpodF3nyFNV8APCA53cwnW44/CNnQGZ5ThBqS1En2/ttl3XXASs
         CtbL+qHjlOmouCwWWuBKptJgVzNTkG2bhB1IG10rK/JOLSTi8QR0P/WFEqZZUZJXkkm9
         Vqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780141605; x=1780746405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F1FWHqbAB9TF09zdPmqMJNEE6N9Lu/1qer5VB9ESMa8=;
        b=FdonKcMSAofuz7scejq6cUtyv6J4DaYFEzAkpMq1p6kJOR6WOPOIeIauYuywRNRRO6
         q4t7Q7my4WGJFgFnewYnipRrfNUtRly6D+26mnjE/YBRgYn8JaPf0xITGZwc72UDDFvk
         eZUnkPZ+kGqOtdkMj58qAFySG3N+732mK7nrT0yLCPiLXSWmvSqS4+Aff/SiBDwDJijt
         dxWM6YulFmfshAK5cPpxDmuN34iUoZrKKlCoHM8hLiY+3wPI1YHdh9nxHaTrNoy6VE26
         gQ8Fdvj9rqc8pHa77o70Bp647H8e5lSVJiNSh9xFE2Aaw+PdVOnOeL8iHRQ0xSAKnMPE
         gnkA==
X-Forwarded-Encrypted: i=1; AFNElJ/yaydvEXmfnRhAsYUS32zVS9qpjLD+rSWpP01E9me5V9dg/E/+qefEi9ww9tu5kKcLUAEug43hh6Sk@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjk6VkVOr2H2LWK0Kjo7twllsKJTWzzkRY/lDdlT12HvlkafRB
	AI6J0dNzINrLehc0X+4OyHD5WUeSC1Fs+Y5Fq5Gr+0tl1g+24ak2BEXEVWiNjqlGc+4=
X-Gm-Gg: Acq92OEvocOc4jWc3bqonqssQu7BdU+7mio/RqrAvXAB+u9wZOLWQOXEjo952HSyDwT
	CrjZkda6RQaM1lyqkZ/GMtQWa6jpAcxUmaVsvpTsxWK1ixlPGzs5aywzPqKgy5DkVs5TtSCjxzr
	ZBAdlXwkIvnofFmhl59ARZRFn+nterjMY6kgTNb8KdKOtWhX8SmYNKgqH81fhLAuMqvsNl+ie0a
	88j3WtWg/3zLDwntZ5g+yaTWiWitl3nL9t0LJJLYa6Kury1OcFe+F1bZydynnsw4uw3sJvKtYyV
	AzqJv7bmmpXLqOVNDckc/p4c7SgpGjmc4rs1sUe0D88/yLOiUlQuIYR6KYJXVbGcREe5FB7Kl9M
	yKmN2Qo1Mj/2BbKHBZXpY0bEupXYcuYar6Fs8IQBtL0lZJsBcrwLYRSn4IKq0NSn1mwoyrvN7Td
	fUL+CqIiEITRW01GZdrLweOStP8JhbJK824f+SivtMi1s0SO1CWiMi
X-Received: by 2002:adf:f2cf:0:b0:43b:5097:6f62 with SMTP id ffacd0b85a97d-45ef6b99e1amr4501090f8f.36.1780141604850;
        Sat, 30 May 2026 04:46:44 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:953e:2ecd:ebf9:4298])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef356a4c4sm10888972f8f.31.2026.05.30.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 04:46:44 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: alen.karnil@ideasonboard.com
Cc: asmirnou@pinefeat.co.uk,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 0/2] Pinefeat cef168 lens control board driver
Date: Sat, 30 May 2026 12:46:43 +0100
Message-Id: <20260530114643.12795-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5f239b90-79ca-4533-a39a-a5421d6920bc@ideasonboard.com>
References: <5f239b90-79ca-4533-a39a-a5421d6920bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 28 May 2026 09:36:13 +0100, Alen Karnil wrote:

> > Could you please ensure you are using the Makefile provided in the cef168
> > repository?
> ```
> $ make
> make -C "/lib/modules/`uname -r`/build" M="/home/admin/work/cef168" 
> DTC_INCLUDE="/usr/src/linux-headers-`uname -r | sed 
> 's/rpt-.*/rpt-common-rpi/'`/include"
> make[1]: Entering directory '/home/admin/linux'
> make[2]: Entering directory '/home/admin/work/cef168'
>    CC [M]  cef168.o
> make[4]: *** No rule to make target 'imx477.dtbo', needed by 
> 'modules.order'.  Stop.
> make[3]: *** [/home/admin/linux/Makefile:2024: .] Error 2
> make[2]: *** [/home/admin/linux/Makefile:248: __sub-make] Error 2
> make[2]: Leaving directory '/home/admin/work/cef168'
> make[1]: *** [Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/admin/linux'
> make: *** [Makefile:16: default] Error 2
> ```
>
> This is what I got hung up on, which is why I moved onto copying the 
> .dts* and building it from the kernel directory, which lead into the 
> previous issue and me needing to roll my own .dts*

Could you pull the latest version of the main branch from the cef168
repository? This issue was fixed recently, so it looks like the code
you pulled was from before that fix was merged.

The fix involved using the dtb-y target instead of obj-m in the Makefile.

> > Will do. Should I update the patch before or after your review?
>
> I would prefer if you were to update it before just so we are in sync, 
> thank you.

Will do.
