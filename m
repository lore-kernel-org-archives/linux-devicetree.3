Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458030;
	b=qzAJFah5q1MecIqys9QPlrkxFcBhOF0EK6O1YePefxEWHS/QjbK/518WmatR2twvsGSm
	 Yt7dKxT0Vojgk7cplLgfLSkq4c2F+DAeNpAygD57Qov+KfNo+yNwSkhE55l/58swrqBHT
	 yyESagM/GhaEMHLICKyDeYOY2ItFbcoOZRG28CmGDEte7cRp5yNzshQKD171RygjyAQxZ
	 XrDYccwhs7AL0wwAkBv7AvpDNXiy3z1lDdRjyUpqvHjGCprfH/HXHd0esPT7iBFxZuhc/
	 KIKqM99I5e+Ht7UtAQGcnWi7qEo2zaefBp2NtS8DYkgzeH9O+3xgXHCn9aZLSBDkqEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=v3oHSdXRqTXEkQ1Kg6tzlq5Y/Vbou/Oklmbka51QfB8=;
	b=cr4XCP5Vf//oiHEYTOPNEwSmNXpqMLeJfgd++c82gttZpU0ISK0G6+Hj0NdJPGk4SPeX
	 Qx+AzR+T6ZLX2pJoDl+qklPEmFnH41R4RQug3H/kbCILWUQ+mi4/Oaa/SaUdCSxDhWyMx
	 fkrlIk0a9c8m3xbf9BKtLvvC1HDj7Asdw+qtfa6PT8BW0HzW7UqzQzuFnhtooqcE2uWWO
	 5PMLjofw3IqHv6moY+nuK7n+t14huL/6NUiSAtxp3DprST3HL/kqE4g2WVGlLQag9FRha
	 eQ0Bh6g7tkUeGwpl6DcgALO1F8jcUF5f9uFFCQQMVzfQpdtCOxsqPfSOxi1fNO5IqHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MgIUQ1Hg;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45D606A31E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C45D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MgIUQ1Hg
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9e53d011eso10767765ad.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792458029; x=1793062829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3oHSdXRqTXEkQ1Kg6tzlq5Y/Vbou/Oklmbka51QfB8=;
        b=MgIUQ1HgumkagGfq3ojlaOllQGiyh3tuIxCCZ93uzNoKbH0UctstNJTiov6h/15hgc
         SWKCJRMffuIlR2hMSwDvjb23iTMLj3yK3MIYPDSbntHRVZ2KmXpUdV5EIbvuwn7gS+wg
         LNVsJ1CTDC2TTOquOZIfTz4GagudWLX5os0euOM2f8kpFylb7iw81bnvbX7wY0CW2h4E
         KCcqoriRVD+XNmjCkNpX2MgRmqABOlbkicuYgYWLfTMvlknyAv8jTqnaJTzjgTOXHZuG
         7NUJmQIg9uxEqDVEyh3RhdQEfyiW/2TLNeJ1VYrRzcUzcZF/y8u+yMEUV5xhQNrutnDZ
         WiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792458029; x=1793062829;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3oHSdXRqTXEkQ1Kg6tzlq5Y/Vbou/Oklmbka51QfB8=;
        b=PpyrBh7DWP8QSiNbx2H6+vz40ZcYMwRmhfEiSPXxqr1ijBZ+hriL+6gbLiH3lBtAFi
         xCXoUfzSpU1kEnsdrLaeE1GU5VueRW28XyEtmDZlikRtLxvPycOeNSCPbc6S3XHs/H1i
         S3WAdE7S9uQDR+Tc4IRORvYsY4ePU4x2U+jNW4VElfvB4bvF3BD074T6Pu33uhTGzQNy
         xZILO6KagTv4DRvcXxifKns293I+C8hxWbV5bhONTxY1XFsVMwURkm1lxceWFsTfTOEv
         CYc1IK4zJVvRb4ROd6v90olQQm3ND1h35dbGsv1ngvMlE3lln/wBCm7gO7pI5ZssZRes
         wd+A==
X-Forwarded-Encrypted: i=1; AKwUvBwFp0uk4knNe+blBM6MhWVTLqQpioDUbvyH+12SAUCMaVH+FwmoJxzAAkW7gQVv8ZhtXnw+1GoS2SKD@vger.kernel.org
X-Gm-Message-State: AFq9FYKxd7oM0DKxw7+q7ERSDbep1QooxVdDFfGMEItu/FIljEKwjj3f
	p2URXYRHzeFpeS5nUDrejuu/3CirWXtVK+k3OjDiWWlUBu7yERPGy+4f
X-Gm-Gg: AYBFou3caE5/51Hg6zzaVAiG+lRO+uGRoQmjGGLhgfAjVp3r1Sb3uBjfD8fj4Cs0RNE
	o1pZB0lAN5Juanb3ixc5WkBSp8OQPz+9ThZi77KHiDNrjLEbotLPKOMvRaPVWp3sK/28BGyuyfI
	iS+tUuHRO52jHP5u3olksdX9JSiWLi4Pkw58XH2kjI4ZUz9O6GP/fq0CUlYTWZnJcEjWvEAeUER
	fWB02NCTgG7yY0xR0coz9OTwZWYGVpytzp8rDntdKTPlwrFCgucGmcxxs+rSceZs0p6DsvEkicD
	5hu+qrNj2rbNaNiZUAymqqxLjZonlaqMvtR8CKGohMEXJjIC1rH38+3jItTLcQmNUO2v+ypbhn9
	rjXS0c6jx8tYVock/++MXurMNvMustm7f1tkkWoLvmmWWfbLd4oIhilZWM3GoOpD6hXpKY/yqqw
	Q/GOj43K0RFsxtkEhyxCMSBsr+aMkSgz+uBqsXMCeIrz6c9PZ2w2kF3Rn2Idom23Xr/Z1ZlqA6p
	rbdd143FaMAPWMNmI4EPyqLkAlt3DNHkWR3wrBKtnv4Z/LR
X-Received: by 2002:a17:90b:380b:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3aceefb87eemr7913039a91.48.1792458028879;
        Mon, 19 Oct 2026 18:00:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1517e7cfsm6466715ad.58.2026.10.19.18.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 18:00:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85d47f47-1432-48fe-b83b-4d53381c5461@roeck-us.net>
Date: Mon, 19 Oct 2026 18:00:26 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] MTX-1 watchdog driver removal
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mingyu Wang <25181214217@stu.xidian.edu.cn>,
 Robert Marko <robert.marko@sartura.hr>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 manuel.lauss@gmail.com
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261016221617.2223004-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 15:16, Florian Fainelli wrote:
> This patch series removes the bespoke mtx-1_wdt driver and migrates it
> to the generic gpio_wdt driver which it should have done ever since
> gpio_wdt existed.
> 
> Assuming the patches are satisfactory, I suppose it would be easier to
> merge those via the watchdog tree than the MIPS tree?
> 
 From my perspective, patches are ok, and I'd be happy to apply
them through the watchdog tree. However, I would need an Ack
from a MIPS maintainer to do that.

Thanks,
Guenter

