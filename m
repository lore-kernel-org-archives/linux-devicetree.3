Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503636;
	b=l936pmPJ4ZREifMC7TFbWuFtwnrMbDwtQJ9o/fkMkP2VckEMEYQT34ds6OlT9yIYLdfH
	 1zr81SvcOs1HTXA5/jJfPECFmhqA51n4sot1f/eNc23fq4trwJcNSNmHV+vJ2x3BUnlyd
	 YTwv0UboJQGPGxRw7OeGEKsZKl4GTO8UwzfNsNdqFzAoourZIOpkntbwptqqm3XVQV/60
	 A/QmDep1rbIcqc9TfS7m8CSBM9IRhVbU/yRKW+6hioX1P8qpSwfBoBaYspAQqeysW/ML1
	 q8DluT2au84i4+yiPOyEWATGusaNjh0TE3J0nuJBL2DDwhwo0M5YUHm12y+N4Wq0yOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
	b=Dn9/7lFwC8oHsDh15WC4E7ulK9vzyqpJQq3AUqxW/Ul1lblPROEqSLeGYZtB0mpLYerh
	 ByCsR38XWypQxEmn/QTWFjOD0bqS/LknTlv+sIja4KceFlLnykMX+1NktdEC3j3Q1mQ8o
	 XeREPx+Oz5R0fCvtIaTurzW3MyQfiyF6O4DkAtbtdRw/1HxnkAya9in/1/5QerwE/XsL7
	 q2n/rIxug4xSe+nU9UECJ0k2C5f8ygqk1+P6fNTVRmft+dEVF4pCKJ0prvpABgNX+g0s1
	 nBdqGgVaPqT+DhWaq6bxZq15n6PWKCkHwoeHLS2AlYYIuJtYv0rnHE3G3YLN6PCXrOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gfm54EBI;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA4606A32C
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BBA4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gfm54EBI
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so32110681fa.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503634; x=1796108434; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
        b=Gfm54EBI4fcos0re543fI6RXcyiEUs0tY0dioSTbUsOMcKVbUYEtG4QhLs+356Uxi6
         NkVnrcCacS05rQX8R4bUQsfFTT6qy9Wumse2s7VYU+Fklz+tkWEtkwaMpcQTxmDqiIDJ
         kE9ZfdQdk4uAZmXmoAdo5cQdVjLiS67+YAk6DHmlPWUX0gZQXukXZxaXjX8IAXsnxcOT
         5jN48kFWwlHfHgrZa8x1VAQijfaOr2QCCwQKjTZoaZQc+7HzZeQ41HyBDUOu8dNQ8Ab5
         ukIm+YvvYwhZ+rhX2Wrm3syfa2ziiudUb0Itt2kGbNyHwXBPx8kBF/6e30owK2ok02kY
         7QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503634; x=1796108434;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2bkFG7ZS7VXLjGlbW2rruMDJvKfO8Yi+927a5d5sqI=;
        b=sAFFjj9FmO0kNabC+Tuy/0F4e5uLXnI78iit/a9ejW3m482krVyNQEYTt2psgjiTUE
         YtD7tRUWOnr90W6aQig1h/5SL1D6OeaiBdnTxyAvIwXlx4d/lDQ+7W6qoC6MdXCShPzL
         d56ADEajK5YQ2kPD6+WtcDI6fEG/mq+n7OdHDG4/LIRRL5yYA/mHp2rmalnpbdHVAxX+
         PuWepBgsiPRoB+TCJIdqp4B0iTLYFI2bHu1+Jftxx/eKvAQppTZHyvHUNGCOtCwDU3qq
         D5W0TXMNLyqr/9dPFROkpr4XhimnlluGQUeh69JqJcadUuks2CoEf8njxXM7zHS/r8un
         NDNw==
X-Forwarded-Encrypted: i=1; AL+hErHmaoc++QTGvI8zlNbaxDKsZTDc3dyvOZH2nt8zTdgBD4Rn3BYMP5UnDCrT3FZo7dTJgctdHioGuBq6@vger.kernel.org
X-Gm-Message-State: APuU4Z8fRlJKvJV5LPfjsv54fRmVOYh2bnT58mwRH43lwvTlACauJ58m
	dsbs5jXFcO5sozLSjLEPZva6mNJEYiGOayTJO3/IAm/QuDhR/3Gia53t
X-Gm-Gg: AZFdTZfy2TLlwpPyydXhbpiEYnBZ3FE1JlC4JNAwNoU9JiJCR6jjLTzHuahdm7fXoe8
	gz0ae1q+ViqhI1bBsJCKwloN/4NEZjesq/OXoI4FrBMv//PiaS9gRlz3hbeNaev+QlvPZ48ArpV
	3vJsgszIRToItP1Exy6tpyiXH5VFAQpP6nVFwYWObAYtSrUqt43a+t02CbehTPu6GjJKnTjWe/z
	laAV+XR/wzv9qHyyfrNg092zD+bckQRA3+GiXNV+iv7HHdYDEM0BGDJteicvLijuSx4cQnCIxee
	eSAJnPvn7Y2RdAdzxtmYWDhCFgoy8nVJKDweHnutZo/T01mVMfiowLvMxZIFaBDTqM0sUfQS3BB
	9ndrA35mtBHeTT7GYBRLiXhpP1W0CI6KtmLs9z0dlKcoyzurl//jDKaWC/ULy+RI2wiVzPzC4Fy
	wfgFeUBap/DEqMmGyG0TvHWIJGgHrL8ZHfuC/8ehsTnjpJPfEBxLRmKYXTUNJ6/YEDfajISu40q
	R/Bnpt9qYyG66LM44P2ZqOKxjPbkc2lccQPafoSyeGaTmq4kIHN2Gp+PIGHXTg0NQuuAghw4ECg
	vTUqyut/wcYuqgWoeBYSwq5FmGMl6VM0cd65jIy9bTpKr5pWkmyXmqoVL0Qfcb+DrbhDAsuoUrN
	j
X-Received: by 2002:a05:6512:1394:b0:5bf:d004:a84d with SMTP id 2adb3069b0e04-5c1bc6d11ebmr3582097e87.5.1795503633589;
        Mon, 23 Nov 2026 23:00:33 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33312sm3554315e87.4.2026.11.23.23.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:32 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/5] dt-bindings: reset: Add Cortina CS7542
 network engine reset domain
In-Reply-To: <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-1-fdb5e8c2d508@gmail.com>
 <eacbc1ca-d12f-45f7-804e-2c7454d97eaa@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352891.6.12053051010700273859@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Krzysztof,

Agreed. The shared-global follow-up moves this reset into the parent
syscon provider, together with the PCIe gates and resets:

https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/

The prepared Ethernet revision removes the resource-less NE reset child
binding/provider; the network engine requests its combined reset domain
from the parent. I will collect the remaining review before sending that
consumer revision.

Thanks,
Fil

