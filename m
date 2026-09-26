Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DF7353A7E
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450978; cv=none; b=BM+WKa//3saJKf+aUTLGY+mLyJal/k6bFlveQQ4EC/9gzb74lVVDYYdTWZKB27KIi8C+mkJs04VesEgAN1qZE1lVtaAnYiHI1QVFTzyBX1bM5Q0GyO0/aaAPJYNPzeNiMfrBbSED8agLxgoF8imZwvL4NYvlRcIP2bdz7pmZTR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450978; c=relaxed/simple;
	bh=1ebgJkP09GKvWRwvK5F2YFranzNOE8JKc24FCxtrAac=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gbQ3QeHwxSU25H4pJ7Ma4sfWOd0DM8f7iLcC5wjnVgMdYvb8Emg3sUq927/EAcL8TQygLTDuDP56wWM2zWTrd/+HiHqMtGxni4DlUivT9Gv5YcpZAhugdPG5vk1ve16H/5gAo8CrpoO/LLycJhM1HMA+FZ4MzwYoNSo7tnL1QTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNVA/a8q; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNVA/a8q"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb752so978708a91.0
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450976; x=1791055776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=SNVA/a8qgKUb3gTUOZ71bLh9aF+GX/IvEj7/+R7clocKI6ceYsIqQxLVlGEEAXwKty
         O3r8ieBNfrCcDAha9sevmHF/A/xdcGeaZFZ1MBPOkQS+lOC562MAXY4fp1Gl/HoLADSj
         MUL3qzcxewg17wzMeXAl8PlDRRYUNLwHLWODcEvyM5avk9Vwag0V4EEQrUkXzIXehbcq
         fHay8THxNPJiVl3V+EKUrgQd+Bd0D2kKVLiFXPunkjZCca0ClkHU4VQwn16ETrVwwdFS
         lDw9Y1LerOfh8LwqR2TuTjoHN8FNemW3e33YaAtNKHKynBmLFQ5Tpjw5O9qJ3bo29i/O
         8Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450976; x=1791055776;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=IHmiMY7iUz6o9+RR1bH5t5NEjFCR/+rE0MOJNrPQvwid1tySUoVPEY0htRFJf447gA
         uefqFIOXXRNVbrL2HQL5+V7XEkkEUjX5IWsfUxaj1tO+SIxwAGkfYyLl0zIrNPvG/Zde
         pzhzygx4VYC1awoK4RWK8cNxx791DUGYwCvg5xR2egxA4daZ+sxWXYLncOd5hVTXNSbl
         hclh6rzMm7ZoU7iYWlDl1ZIzVikcczIMF0gu9V2AIJFvGxyZH97bV5Ot8ORhhx9peDev
         9lnv5hQQw651X6REwbjPqUlhc2WXbhouAY5/tAR3xGZNSnsD6N+R4MM+SXgSByuFapQb
         HxWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdQYrq7hXt/SfLZGG+/jo+0jDCVOd/PWxBt3Ej8BVlHgge7NDA23llEnmccwQK2v5sUvfeFEKtgn8N@vger.kernel.org
X-Gm-Message-State: AFq9FYJrex1+8zfA3+fBvn8esI+yG0Yqr8KH+HJIaw4ELANxx7we7Ha4
	AcU0LXyBktimjtrIanhLe8r4ewqzTalT7k51M/lin/kUwZl3BoLmHOGZ
X-Gm-Gg: AYBFou3GoA+0iGbZXHibgcX1Xs78EsOFjIWGk+OeYwjJvfgr0foqwTB+9pRP+3Yr/3L
	XnxFrwhLkpylNWEpTACDoTI4coDgpHsWodW69ntK/9qwMUd50iBSiG8IL4ksKAISqahSGjzkaxU
	mwgMKf1lpVwt9fs8pRbEhUWId3Mx+Rg/ugw3S8WStvznJawWMjwtHB3iFF60dSX6zU6JGnP9/bD
	meRzup+yn7eQE4bWD+0yA7k/pg0CnnetBCMBV3HOJtbQVYiHFfC1I2shvpjG79fe4lHz/CcPL8r
	tTBTTfqieCf+Edz0RtwlZR5aEfuK3gYUnu+xsn8VmlOQvTZKs0+gWFSCTrG5a347O1xKIvcyhPX
	lRN9QrL/qsaqzcSa5cxHE1zLMxtY2TBQY+ekGoJ8Xb9QwvqOVB+kScTfRZLDlmTG7eNrLk7OdsG
	Q4BCHY4fLqoKOum+FchqfyJY7JTm8DqNOllpJF+OWDU9AzzSmtA13Gyf3tLTiLnxUFzfSqBTVS3
	Qj/wlbwXEc875yvLf+FVyH0CS65dvjiT8PDWkAtNbM=
X-Received: by 2002:a17:90a:e7d2:b0:3a0:eb54:2e60 with SMTP id 98e67ed59e1d1-3a0eb543751mr1574379a91.31.1790450976021;
        Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
Received: from [192.168.11.3] (215.96.231.218.rev.ocx2915.net. [218.231.96.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm3564492a91.3.2026.09.26.12.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:29:35 -0700 (PDT)
Message-ID: <df064f9e-ad54-43fb-9b25-9e2869506732@gmail.com>
Date: Sun, 27 Sep 2026 04:29:26 +0900
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Linus Walleij <linusw@kernel.org>
Cc: arnd@kernel.org, Frank.Li@nxp.com, aaro.koskinen@iki.fi,
 alexander.sverdlin@siemens.com, alexandre.belloni@bootlin.com,
 alexandre.torgue@foss.st.com, andreas@kemnade.info, andrew@lunn.ch,
 arnd@arndb.de, claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
 david@kernel.org, devicetree@vger.kernel.org, enelsonmoore@gmail.com,
 festevam@gmail.com, geert@linux-m68k.org, gregory.clement@bootlin.com,
 imx@lists.linux.dev, kernel@pengutronix.de, khilman@baylibre.com,
 kmehltretter@gmail.com, kristoffer.ericson@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/09/25 22:30, Linus Walleij wrote:
> All right, now we're talking! Could you test and review this patch:
> https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org/

Thanks! I'll take a closer look at the patch and the discussion thread.

> I do avoid touching the v7m path and it worked last time I tested
> it  (on an STM32) but I'd like to see your take on it, AFAICT generic
> entry is not really possible (easily) on v7m because of the
> pendable service call mechanism but maybe we can think of a
> really complicated solution? ;)

I have experience wrestling with a PendSV-related problem in an RTOS kernel,
so I believe I can contribute to that part!

Best regards,
Yoshifumi SHU
