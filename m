Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239104;
	b=ckjKHm0SHavKubj0Q+5qj9WTTjTn89DN4atl+ezD0idWvvKDZjQgTn2z//fR5/EaX1T5
	 U0ZONpZC/oX9ng8/Msf1YF4/fIaCZP82B2HKhxFl7w3ufPxD6N7fNj5YrpKXT6xthulKw
	 kSh0jiDLXi0wIIS5akhw9zL92oLRfidn6QUfyv8au+vJVqlRygM458Y0fo4CRa+Bpv+cT
	 t9XVUTKpDuaOgb3Iw3MFi5E+J0kMfJqCBGpwgIsTRJvMLa7MFqVpmS+x+wf3OUN8doGpL
	 5vkXycg3XE3UAFhPWAlyWdswdbCeaOXtHK/leHT2Dggf/dFH480fQBFOQDY0N95M0Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
	b=I1BNkB1X55+u8WANeC1sg433aTIEhy5ezlNw3vSpdTdPShzsaUbDp7GUHaCSHlSqAY0D
	 PXapot++xfS+F9p5ljd3xqmJrcpnb34x8AhK4yKKYRU+5v8rB5lzi8ImoVmuhC/tmn9aR
	 M32KykB4qaii5EaYLx/ZQsbalTK8SUYRpAj3RYI3dMZK5Ju7pUZUxPf1+2mPBUQo1NVmM
	 oYS1ZWfLF3k8ip3i/lSt9ECZEf518uBeK13I8QqoWTSWeeN19Mm5ntXLmQZbu9sgvaoxZ
	 FRfqOkAzhi5aC3Mx+S/1uPmJrvN65ax3kfnDBKXm+t36oCypSiWiGS+ly68WWjDqVsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVg0Psww;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0DF606A331
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0DF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVg0Psww
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-372bdb942dbso1411234eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239103; cv=none;
        d=google.com; s=arc-20260327;
        b=qiGfaB6tle4sEKeKTdK3SRQHMJCIr6Fjcqvu5GY0vymNHI6QEUnjvjJIwR+o6+DqeI
         Y/88akgUmlbEJrpx3v5Yi7Z3LgK246ViC6IhhmkZj9PPJZ70bmTqxU/NKnxw/wa1EzOb
         ine9GXfQXadaMlkDVL8jK0pBDeAG+03r9AmaB3tel51UcxxsQ+0epDJ5w6lNvmiRjlZk
         7DX0nHkDCyA9FnlX8q1/WEaBG+8V2U9Jh4vltuBpQ3L1423AwcR/eWYC3rPuevYr+2pH
         hr3QNCallDs3utUWqc4KX5GeQ2vANcVEkMGv8lTmYw16KBMkFCzfCH5ltlP4YX4FHjt3
         GKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        fh=1TE8QHEgxwLr3rXwBIYMK64rVmqxVaGPbnrSdlA8asc=;
        b=Kgwu/9RsvaJSXVpjlPIRsKZWCbVqHVgWihos+iuxxlPVpmmRQYooEeXSiIOyhICigd
         yIco+stLjsP1UNl7IZL3MfOhi1kwZbBf4behlHJZ+wNcrpzfLKroSFAi/wdHmCGGTLro
         PeatHKp94TGiAUIFX1u2fDzsY8MAUY5T3rp88C1VE6UBvrKNvKwjBb9WJv8LyMXmX5TZ
         9SggXgsYN8WmLlTe3RBsbFtwVN44ERltYKJuKoI5kLh4yJ/ZjYz8dHPCstwsOFmA6DQ0
         wlwdwGKOteiIxVtmTS79fuzSsJwMBbukjQD4eFyQK6z0FuVqDX5khjqAp/8C2WWOSXcX
         qbkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239103; x=1794843903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        b=aVg0PswwY53Y1ZbhOKWKHq6I+XVXF2v0WHXI2GLYAInyhgZSnU8LjDtFdZ0fwFLG2O
         BbTWxNf9swnT9aecxdK4u+PqIeiGLDSG9E0ZsabQa6sVoxE/Yq1Wk8+VQHrZjpWX5yRD
         kDTz47x/FAWWGk0lAw1jS3oxEXLYN7G6kB6JBR9SLxByxp2HIbvjOnLzR9mGs8M45TIz
         qw5xrve968WQEkpFD8sR7lCRvqGmOy+7njy2OWI+YuM3P854nmGS3/GSrO0jglZMCQKq
         uyfN+ExQWiOS3NN0qPVvh2PcqOEIE6LVw3qm6wy5oHPpwNOhE5teY005tZFWTdeO+Wpz
         j4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239103; x=1794843903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        b=zYKXtT9jO5RphhuLg7qjjiLAQ74oSdmCrv04coXCha/AKayJafyHVHkWzk+NDge1hF
         ecRGqgfOgBfb/OwGXhR1F7gFiPeah9XjKL+N8F98rE60xOAuxFDVgDYC8tWUchp+7G8H
         hXyIEFclNiHHFtkOPY8uKh/9yqG59Nd0wLcyQ5tZCpsAXfcT4VcfoS0mE8Mgk++hJ2sc
         5xAMV5jbbmKLHxWOivimGbs/c/v94VGv6NgLAYUhTrLl2iOFXUZ1Emf9Q+AqkcxnnqEp
         2Uq31VcDtFSlRXldQXms325sBSwvgLWIneixyZXanEdx6qUONB36YVvbSRtPBImdxg99
         wiwQ==
X-Forwarded-Encrypted: i=1; AL+hErFacDKpWiC7xjrJPRopvlVe8tLKGVyUbByGqErmfgryIfTj8gojWB8SsagADIAoLR3+F39yr66v7t6F@vger.kernel.org
X-Gm-Message-State: APuU4Z9iSI6tmLR7DixptOvBilxqIXN+dyogJaEKTw3GjyAjsRO66xzr
	h3tFRXWtDuh6NtFDWUTr4/WBIe6WkbPRkh+0fMcd9YaE1qhCcLXCEmdiChLjVmUzNw7MMb4qOyd
	lrlIOfDxIcR9RQDv5UFp7WwW/n2YIqSg=
X-Gm-Gg: AYBFou1zaJDPrw3GHwXpcc5bPrtj7bCD4FHyDzhUCSDr9hpoVlxwjBfAUJ4vEP5qqRI
	y0sbC/4TnRTPxkiKcffgk+BjfETAixbyypzoJrK1JaeG0PF6sPrZkwwiMzLlK5ldEPwMKxLi2Cy
	zBwV/mv9bh6U3zIK/pKjzW46ETNCyalE3KGTZCuENZ+a/48vKAbr85YOBf3ner4K/HI2/LicM9A
	QGLHHgmoJ9iK7pWq6PgEQGeP6JkaTArHcukrWWc7M7Li7U8UPtjDdV21GVrvgJVsc9KM7ChNrDK
	1tZFNq5YPHM7/OCLGtD3W8sXVFuZbHCi7gpaXlQ3/L0I3pcTtnn2TMZVKr6fTuzCOM1JU/kd16x
	wrmRG0Z1PQfqVoMkb1rNXKEMIejUDNqJiM/RsgQ==
X-Received: by 2002:a05:7301:7004:b0:36c:9b35:5d46 with SMTP id
 5a478bee46e88-372571d9ac9mr8099191eec.26.1794239102976; Mon, 09 Nov 2026
 07:45:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108212826.15890-1-oo.hehir@gmail.com> <20261108212826.15890-3-oo.hehir@gmail.com>
 <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
In-Reply-To: <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Mon, 9 Nov 2026 15:44:25 +0000
X-Gm-Features: AclHuK-AhO-ARD3koIln2PIQIf1KmWM7RSd3LNIFnaM6Tz5301_ColSop3oW-YQ
Message-ID: <CALp3LZ61ZYcWz8CPQZJbJSDfAt7cgyyqA_bp+Gwhyr2peBVwKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rtc: Add StarFive JH7110 RTC driver
To: E Shattow <e@freeshell.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi E,

Thanks for the review.

> Is this copyrighted work from previous year 2021 being imported without
> modification?
>
> If there is modification then I would assume it needs appended your
> authorship and the current year 2026.

It is modified, so v3 adds my copyright line below StarFive's.

> Align 8-char tab stops per Linux coding style, and then tidy up the
> extra junk clearspace on some of the defines

The values line up in the file; in the patch the leading '+' pushes a
few of them (TIME, DATE, CFG_HOUR_24H, SW_CAL_VALUE, EVENT_UPDATE) one
tab out. The extra space before some names marks them as bit fields of
the register above; as it reads as noise, v3 drops it.

> I note that JH7100 does not mention RTC in its datasheet. Does JH7110
> RTC have any commonality with JHB100 and if so then would rtc-starfive
> be a more suitable name for the code filename and module?

The JHB100 clock and reset bindings do name an RTC clock and reset,
under its Peripheral-2 clock and reset generator alongside CAN and
GMAC, whose inputs include no 32 kHz clock; the JH7110 RTC is in the
always-on domain. I searched for JHB100 documentation but found nothing
on its RTC beyond those names, so I cannot say whether the block is the
same. I would keep the jh7110 name, after the first SoC supported; if
the JHB100 turns out to use the same block, it can reuse the driver with
its own compatible. That is what the pending JHB100 TRNG series does
with jh7110-trng.c. I would appreciate advice from Hal or anyone who
knows whether the JHB100 RTC is the same IP.

> Review use of authorship macros as appropriate. This may be okay as-is.

The driver is derived from the StarFive one, so I kept its authors and
will leave these as they are.


Owen
