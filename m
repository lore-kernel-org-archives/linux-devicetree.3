Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839373;
	b=oF3uiD0BS3CkLrlqfubheDIwh4W7qR+2DG0XgjBwF9BCCIq4NcFE8opkU0agZS6PiXdE
	 amkDzPD6pBQWQMHRTz//YupWPm3lKUXhnr3mIEbnt5yv87uBIVG7Lao6yPfMS/WoykjWB
	 dcw4nLh8gM1sOjjpQ7NNURUn5MVm3PflNZ6k8wHdxI9Zbs0VYnDEXaeOS25ZAQzyu2va7
	 JEv4elBIZBgmxXjK3XWCYBxP7a9lyHEh7HnEomHNpMlIE/n6DjUbYwAJs5q1HLQ7tT9lt
	 +BFjrh2ISw4tHJr0s9qHeSOoVjrgE54VFmIDG2Nty/KIW/mDPDMqZA9zvjRrMXAUqZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839373;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dlcvkUVMW/9VrLP4zZpdDbI5u+zIZh6oyaHuXCV8ZD4=;
	b=5qkxBYlXjKvpSp5wKv6Cpy9OAamLPUF7bhixD5iIkDL+3cXxfXd4SgpB5afPwiIiXUEz
	 IF3/IK0vEPavlLyeV85SIyltrtwyjbeXwbUvkIxk8ll80dLZY5hyNC3iYjjfCgmeJZok5
	 bbAYewXXCg5BzE+UDSRGost4VXPrURV7Q2aqg4jncvPTni6IUtZ9PHfffU+T+La6v6jvv
	 2XQNMsjxyXHbvxijOUhUM2MApDzMupDc1aAAy8qbD1PaMDCmZ3Tl2MCSdYjVk0kIK4okA
	 0Zx02mfx0wRH/eB0r8vGmlkRYJYVumI1nL8buiT5+aa9JId57MC5TvjiH/Ez4K4R8UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB69606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 00:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB69606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso699474a12.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839373; x=1794444173;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dlcvkUVMW/9VrLP4zZpdDbI5u+zIZh6oyaHuXCV8ZD4=;
        b=cLPrXKy7ZlQVVJVB9x9GPmFgej6zPmrBHwKkfa4HQqlHlDIp+kjKP7yPGzQOPCD0kq
         GoKpHZwfoHYXo4zlGGujlOfzcPrDABzEqyhbDaAHyOzfck69xMn9xHjMrjm5EKzoRbxD
         aU6LBd676J7O5D2M3ax/swrPaTHPlRj7uoKx2Iyav+dNmolrf+z+INg1M+yXSq1SJuVS
         +EER7l/7yF3ctTGLYCzxWQSyHDdjtW9M1FR304vNt1+OOv9pwYjHfpOOy+9RllvaaVCt
         IfJwLQFs3Hwgk8Sa/mEk0dguDVTcTcBjXq5tGbntfUXfhi71wLBgc5UxSC8UblMVB6p9
         Ne/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwldv+WNz4gb6IqMZrBHBsTTh0vMoXEC+AAqcZ433kdLNinnDm9ODWWiQcothSSwi0KameyDXYUXx6I@vger.kernel.org
X-Gm-Message-State: APuU4Z8JBk6MOjJ/GlQLNYOPGh3jp2qTyymiRZcuAY4pkRjyg/XAoYeI
	ixX9UBTYVH1qzLi2uAznBIYWgvdyvsUpP61IuDBio40nbIXyGzKF2gJiO6cIaLRB
X-Gm-Gg: AYBFou31s8dfYVHi2OA2r/CQsL9XVUB4QJn02rvVqnq/8c8kSvTqVWYkyL7AfF0Ll//
	/FJCYO0B3IxdsxtE8hJVy2bndOIk9YzyC9P5OxZ5lW2uWOX30XCRaR/gImCBpfFerg4gBa7I4/5
	KFnBTRdaG2VWtwZPLzLlPlSkWjwha09NbnK6SuaPfCxCUNFOt8G2g1qdKfHurDX9l5KKx5y/yoP
	1EcEyFGuHCqHx4K9qKuB7BIwF7YSg6z5Zc6VJLiRib3Zd5yHf7BOtjwTE1VhxS8VVuyF13NXL9U
	XQROlqQifLtCv87BLlo579Bek6znBWGkuYn7W9RTsBrpsjoHri70IvjJsUJV7CjRtEDtdJdf4Bi
	vEHJZE3aAzZXi8RAmwUz6S0l5k8CMsUe8XnShRw8nt8vJAH+j5E9Xo4DO2rUOIKuKhSZudjBucR
	Y/12mrwo9FTTqZijY+N7od6BXWqQMF8/uNSq8gzixiMEg0M50ZKNAJAK/UwzkUlgk0DBYY+QHns
	WUJbr78bat9DhysGfjtHAhVXOAwOeV4LLNp3o8/RVnKG+1OM4j2NjDeUF6u6BuKC1v3gumw6KeH
	Ceo7eGfMPXrQIdgJ18RahqlozeZRU7ugu+CBraC+YLgJNc/+ugbBgWHx8a/j609fwcJTR4l8qM/
	NuN+NMFLAzdNf5waRM77cVjnwLjInGg3wb73UnOAu+3SCFU2q0kLTImNZ4F3iIMru
X-Received: by 2002:a17:90b:4c44:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae897356e2mr14059461a91.19.1793839372685;
        Wed, 04 Nov 2026 16:42:52 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312e45dsm1286458a91.3.2026.11.04.16.42.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:42:52 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b2c599f43so782635eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 16:42:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwgN9iJ+YIQaXsxvtSCNLKgdJz9shTx8HFefdec/pUbPVfLCjaOzc0tiY4qtNueO6xR7jVXROLl5/8U@vger.kernel.org
X-Received: by 2002:a05:693c:6092:b0:369:1084:8ee3 with SMTP id
 5a478bee46e88-36a423e52c8mr30753485eec.23.1793839370626; Wed, 04 Nov 2026
 16:42:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev> <20261104-judiciary-fool-05c4157a7cc7@spud>
In-Reply-To: <20261104-judiciary-fool-05c4157a7cc7@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:42:39 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7SZAqNm55Wz6yC0_HP_DCVeDbr8b76+p73c484t7q8ug@mail.gmail.com>
X-Gm-Features: AclHuK9UIWS9fpedIq3oDi0GN4EX_Euc3hJiZbuLEwPXjtpIZ-TUvM_M3RT-lRw
Message-ID: <CAPY4CJ7SZAqNm55Wz6yC0_HP_DCVeDbr8b76+p73c484t7q8ug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO controller
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> FYI, these other devices need their own compatible strings when a dts
> for them is added.

Understood. v2 describes only the SF19A2890, and support for the others
will come with compatibles of their own.

> > +  reg:
> > +    maxItems: 1
>
> Move this below compatible.

Will do.

> > +  ngpios:
> > +    description:
> > +      The number of GPIOs available on the controller implementation.
> > +    minimum: 1
>
> With no maximum?

v2 drops ngpios instead, since the compatible implies it: the driver
will take the 49 lines from its match data, and the binding will take
exactly four interrupts, one per 16 lines.

> Please fix the ordering here too.

Will do, in the same order as the properties.
