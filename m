Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794374896;
	b=AFrk4mVNwy/iP44lJnsbhKUv0r802t8Y4VE4Nt6FzyeKMNzcOXN1v5VllD1KkKN8hk/F
	 FghrmgdMu0j/UpmGEv01M4dn0QxPP0jBUOyiaMQDlcRKOsr04Fbv37b0HWKn7GD483HW2
	 YyIhThoQWi9yiLQHmCicDHDG6Jws3qR/XniTEO4flaDyutD2P2gLY/EDfsgNgAIrMCnMi
	 AwReFnYEjM01bZhYfs8zqwc+Jta0+5lBYSSeCEcFAmaX3kYvxL5CahMWImCxG/asHtgli
	 33yqtIkiUqrc1N8r5nldOQA8ep06gIEnTZIHtSSxRy/RbfUCXumDRriUj13R3b62iRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
	b=ojd0QzwZlpT6FjqzdtRrJ3reTayJ0RckJ3j13dbM+25aZfhVBEDIaq7GkOZLh3SyB1Jb
	 F7RD3P2C5TyzCMg6fniOjbfVMvlnly88iZoKt0f0zMx/fc02yDOwu5zYGtDPTkqFHGPwT
	 Cps1sHxqUb0K431GBmohNMJq8G7pvpXzxcDpgVu47FVVMFnCKoiMQl5o4gp5+4Sc78dwY
	 m58ZJ8Fo/ElkS80z3jBuWL6cnmdaOX320vmg3h1MAlReGE7F2b9KRA/EdPQU4AV5wzmrz
	 0noSIsVmU0/FFrcxuzdMOx27zqa1xcsNpqhmTnR5rKvGuuIQiBDUJ0LZB5oCEF6yySQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tb5TcgoC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04014606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04014606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tb5TcgoC
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adfe77d35aso22657171fa.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 21:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794374894; cv=none;
        d=google.com; s=arc-20260327;
        b=mhB9hKp5oywd0MYEKdEnwsR+9V7kn7lX+iMvJfY3BgHnYehngo1Kqx8XVl5W4hOFmh
         okvg5w1GREZwzsrEwEqeRI5RMIsRVzpcSID5jXPwOQRNnvUtvqcnmzQ58b0ghgIGvjcg
         JtNREg7Cql0UsvSvNzLYFLPdxCCoCe7c08V7QY/rF+xIS7MDs+VwQJz4KAEHbvyWFu9g
         mD7lf2tslV+/Ae3D8N/sxV8KPNJOTTRULT+QmOAILi7d80UDBOIXLNe2vnkhcq4X9GcK
         eMYN75f7iFCXPK8s8Hsq1t2xRYGUJpJima4UIHJtOQ8zgdrtLIRKfixV6qBSSrM1kQQX
         5Czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        fh=Gs+uRtpxl+rX5jHqaOp0iLEvkLQfC5kKSUYExhG0PYM=;
        b=Etjxa3LT+hHhkZpOo6gneCWDB0l7iYNZTcZvqFkpJgJoVTu53SKQ9qjl4lrbMfViES
         pwmEx4PvtU9E63I/CCTD6vJWuqX3l3D9LOAm+lz24kDU3QKCnSfaxvcaTx5KdJOznZMU
         YFrBoIBWcar+AYBZeIBp/Ehfvdwew9zmBthhiVDbxgJTIiKn2LDC7KgNRTq4SjRR+BdS
         ySe3EIc5KqYr6FjYBqd+Et4N5/Uejv+bPSUDjCqM234IM462NJRSe7yJOnNoTpfeSIhF
         OT/0n0Sthjf+CK5bvNZvHC2IjAVuiwpmK7aTe7oZY+Z0h+T+FteFEDAhUtDJvoWvhpyB
         pqYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794374894; x=1794979694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        b=tb5TcgoCqELIeNjBV9PYMO2XyjTx3xYv7Byi61nVP9HZNGhc/yflX6MqtMg72gHAA2
         d0ey3ZdiU87Naz7S/vmhM/hGchC9YXvL4nNwmGedLi4lf3yvJItS6DkkPOMeNO29muKS
         sOwnWXPT7qBxq84sfdU7SUzcUgiAWrCX1ZEiwUekbR1VbdfGSQ3/fiCyyatPVB9JQzvr
         XJb6yDvwjcISk8f+EdRU42hf86iGpox1ZKccBpvChLGUjxARzIPOjg09TlCDEcdL14kw
         ucuSLIoH4n1e4EWtofCqmPXp1TosUwCsjN5rLrnc78T36oGMjNbytrkdwoFQtQlpiOwk
         Ee+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794374894; x=1794979694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        b=WLmY4JoaEVXbP8ei/Rdkz4iXzlwcZM6l8G7RZTms1zQQ0fbj8lSaloNbJml1bnpjPP
         6v+J6tEhRL0/rMYX7vmA1FVx/igkhD+XF6FxjvpeCv9zs8PFpL/2whRsqUKEbEoryEY8
         lptbp965BA43Hc5bhBq0sXDVRe9Lv11rd++ImaZ9LV8Wt/7XBGkt78guzsCrvN7lYB0X
         nnSmCHagfzM0/Ppj+2KzX8Lg0AzQ/QrADPMrktgGt2iuOXZSiZHcqzBYkzBEG3XMa9+M
         rNjAz2bJd5QHBboQkZqhM9ed8xAAvxE7HvD1ZYgONRuQwMphUcVFodlQ8/TQLOLzxm8d
         An3g==
X-Forwarded-Encrypted: i=1; AL+hErEt91Z1x5tpHnl9bpcxhxoljdemPRQK6Zxh6FlzqsR7xO66EkflrzkktJiNQWh5qg+MWk8F+9C9c4nI@vger.kernel.org
X-Gm-Message-State: APuU4Z/cHJGAhf1o6rA8FSC5HW74PRMoJDSVkzxHkVsl593cUwwKIRUg
	qQ/OFaepmcSAcDmetZK3gwVK4KT7XeiLjCRonG0KMkjsXRKgXjgNlxkHk7TUpFqOEbFHbRnxa14
	EriCLY+EoBWtgTET5yhJ0dDyv73kaUww=
X-Gm-Gg: AYBFou1Y0Xpd/31PJMNKkvEpO1I7dpyfsyStZmiwCbnt5HIDxQpAbcmL0h93l5/Rq/Z
	VmHxDxuUq1/mhvBj2g5HfX+fdBBg2RvWfKRPzkOXhZ946wTtaoTV7gOQqpPybls5ieZVP8+jKx1
	j/QBVfns3bb97C02kzrtSAIFO+V94xunHikbKUd9JbP+LEUk/l3wwSavcuwe0tNIz4RXnIxQLL7
	LFj/EQcxSsfPlEh9exnU13nXpLLt94oe5+CH+pKAeH3A8HQwydu4BmlRxcodftavLxmT4uvzG4j
	qwXSCcOK7lx7Kjw8H3LUGUlSHlcQiR4hLFbf21d6+gwEwdWIlxb8zirs/e+K8wCtWfwZFpx/2s8
	/jF3v9LeFjYF+jdbXS9w7X6wGO3nln3MPA550og==
X-Received: by 2002:a05:651c:885:b0:3ab:3af4:c2d8 with SMTP id
 38308e7fff4ca-3ae126de2dfmr1890061fa.28.1794374894004; Tue, 10 Nov 2026
 21:28:14 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
 <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
 <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com> <cb3d9f50467089c6b13ea83aeddfb032c046848a.camel@codeconstruct.com.au>
In-Reply-To: <cb3d9f50467089c6b13ea83aeddfb032c046848a.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 13:32:41 +0800
X-Gm-Features: AclHuK9X5Dqhm5-z10kEg9eblLbAlNWS5sD8otV-cBTsQml1KPQHVi6FoGfBKpQ
Message-ID: <CAF7HswNubLB9ZJRsJge5_YEGY4xZJCWaLA9k+My_8HcmC4fRzQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and GPIO
 line names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:21=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
> Thanks. Can you please let me know when this one has merged?

Yes, I will do. It was only posted yesterday and is still waiting for revie=
w.
I'll follow up once it has been applied, and send v2 with the reworked
cover letter at that point.

Kyle Hsieh
