Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203784;
	b=ZzHP/eGYS7YAtEldAxkGGntLeMIljKLfFa78MnhlmBPrCteMLmhVciOBHiLaKFT/KbZZ
	 PFC1ew0fDRXDTReF24R4jrk9u5iU2z9weQ1UZlBsxlNf39ENnYu/dDVOmGksYTHo94PLB
	 nleoJ4qJo0OxZI0bsxlfiEiWa/boBwcsBeGTaWIRUiyzZE0zk0sOIbs704QclQnypOK8v
	 zrEO2KjB9VCdR94WBx3Qz7hInuVXENPpDiIPXi0yhyMpqztAMRdC0fbXHbqL4D822hxt8
	 ljfwEtDskZniK6R3VQxeIvMFpzYyf8xpHAx/DSaPlTZJPmTZLK+xWCQiLbNrX3gbtQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
	b=rQRMlgxVB44PHqvxiIIrQo0tWlLUdI46JmgkNeFoZBH85NikVn7/7h4bbnv0VVLSjFDR
	 sBO9jy+0SgoyZzQ7ZMCnAI2rhHLMoqZ5p18DQxT2V4DZnZGlY+GvCGeuDr8LKpQTLAllR
	 eI0zcM42VfEONdX1U4cXHb9AwsCE9bxQW+LCyhh4VIcI9NeG1ATQlDI0/4q/nx+NSfbPw
	 m4sDiKDbsgvYteX7a2dWFeZGE87mdCemr7l2Kfc5z4hejh91eMaPSb/STo2EUUfSmn0Nr
	 NfPGHti7j5wD+O8jdpyNP+h3jQIkNbAiQcySxw1YadjqMcknJ4SeQMinBywuaaW0h3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FAC606A32D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FAC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1033168f8f.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793203782; x=1793808582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=Ji5Xvtpoxyb8kVn4SdVY2cX+DsEgu1bKkZdsC3ebjs4d1+CltzAuRtjoP6qRorAjmm
         U/OTale8tpuOeROnVeyxXNIIaWfog47eEJFCNp27SbEPsWiXlbJSFUU7KgmL/w+kS1Qk
         Xoz40ZBJl6WRqwF7cZjV6sWb8IbzqZcrFctXWKFMXwrZRtrx0RyDRwjEA32GAPhICZjW
         MQaQxgB9raqsmYBxkaP7PzkQnI5sX89vYUiv0DZuFdVs9fh4gndC7Z/ZAgGohdQcpiRV
         +IlqliYlhUTo7YEUzaeGWGEgvu/pIVHVtE9NKkTWWWXdySGqcXDMlZXy58QAKS+slkSX
         voyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203782; x=1793808582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YZcts4qcYFLKUzeEZmCB29OAtaKV7wlY2duix3l+9sA=;
        b=ADlP06D2Ozh3RBqWZJYHl9jtMU5j17uShMrHvhW/bzkyv2sZcQQCgGIOzNS0ZumlB/
         GYLhSPtsdWyMsSaujx+xiofsjtlf6k3WNGAq7viL9XxLiOWiiiCX9sySy67Ou9c5emIU
         m+gMCV35oqTh4AqwnSH2gR/BSANCrsyjNnSJajKHVSu2lwgxQ4W7895DEES3Jl1MlNbK
         ljO3H/BGVcZWB5Ab/zLNvU2dVP61bZZCanYsv/222SijuiKen9J8irNpWgegD62ATPlH
         KOXePzSneMzC/l5CxcnzuBg1NbQuVNVE93mEmDylxVRNqv6cub2CGLM1XX0xjLaLKV8o
         06DA==
X-Forwarded-Encrypted: i=1; AKwUvBwYqRbzAN7VI4RVQqjL/rdfYC5cLC0CmNc1HwaWl8QMluIGIKRWaP6I5bzsjqjcZdQpxh19urJs1131@vger.kernel.org
X-Gm-Message-State: AFq9FYLyNpUecyo5C+Tl0qcxwcYhCQgV7As++0WrT4CKqX6EjwEOb+kZ
	iV87ZbIL+4OlE2iPED7Gt+IiSfBtBi5C4fVZachRx/095IY1KqdqhE/fnse20kquHjI=
X-Gm-Gg: AYBFou0/UTJPQxY8pCtuGXmckPxKBRcoEBnCd+kXnl5hs8yCn+Fh4o+pGAw2l9IgAu7
	dd6pgz+5tT5/scDFk7dx2bM6BMNwNJBz2kF+j2dBcRO/CwmHJ3juOOxE1mwmpKX6owBDk5mwkjs
	q0MsDFus4K0EogqrcQk9r2rnBj4CCPRiGkEOnA/gPQPVTmJoGMkSIxbJQEvleXqLz5liJ0CItA7
	MLlqyj9wA0gAA59RfY1ihBU0rbAQYng6sb9olacOvbPTk5VLHC/iZB5hTzdjF0OO2uPkeg8Wqg6
	TIRDgQBKCNLiKwdY/5ahR+deJK3u5T/WwuvC5mcZXf5cMP5U/cSDj7E4Kz4TFG8bkIbE3Ltxm99
	cGMUmLbobqbL5oyQsk90Q6KX1S5klgIrikSbe4FFV5tl2GieQXh7BL/gfl6zrZBaTjWwazjkp5E
	gJFynw5B8bB5Nm9sW7aOc991C5SvjrXRTzMPwsEqJaLhnnRcvoY/ForPnWFNbBO7GIjHNmEu/Qv
	IBtcX1b2nWgoyv7mpOFx9kfeRjLBvVGcntl50jRF0lYUfns34bzS89cPZA6psBB7lTGbImXTP73
	xojxUv+zCWlyxg/cALmfMlNfj3loKw==
X-Received: by 2002:a05:600c:4f89:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a966c41836mr68052215e9.19.1793203782221;
        Wed, 28 Oct 2026 09:09:42 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm1572025e9.14.2026.10.28.09.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:09:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 28 Oct 2026 17:13:35 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auIfL4ZGdfNDUZxO@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auGdsv0OVG4iLjZV@monoceros>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auGdsv0OVG4iLjZV@monoceros>

On 08:02 Wed 28 Oct     , Uwe Kleine-König wrote:
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > +#include <linux/platform_device.h>
> > +#include <linux/mod_devicetable.h>
> 
> Irrespective of how this patch set evolves: Please don't add new
> includes for <linux/mod_devicetable.h>. <linux/platform_device.h>
> already provides of_device_id without introducing a batch of unneeded
> dependencies.

Ack.

> 
> Best regards
> Uwe


