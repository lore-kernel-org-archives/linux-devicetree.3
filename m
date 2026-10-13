Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED539A056
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877989; cv=none; b=gqhnhdmRO7I80NtAeek7HOe4qxelBBEMuGmxX7WwamemIJnAs+Tl1Q2h5c5EM/O2un6NH4Q1PhYlwke+067wfpPKghGVhZyYmRlBXNP8y+n2qUgrlWnnE9KIx8U0x8IsFlFIxXl2fjhgMLfS/XMwBC8kmqUn1abv3cyWSUMwzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877989; c=relaxed/simple;
	bh=WuHNmevhveRDHZGym3/oQRSQlxTmg4usKoYghVaaSLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4/9MmQTum2E/HFJF74Mcu8cuPQ+OwFy9CjXC6z0IMbmyNL92DRgSd1Ls1iEeCBPLdUA5zp5ROFB/WmKMDvYTog+kC1OLJ//jLRRZqKxHngC+Z4F9jkuEAp9NYyXhHUiNZyhi9LcCgGYBQ0obKBOTWHGDtlD21KuL1m67/dy3Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fvs35mys; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JdYQwNa2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fvs35mys";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JdYQwNa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791877986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
	b=Fvs35mysfYwuDmTMUHEO8mn8S0bzgQI94rnY2T9obqeABIU4UleRIbOZZtk33X25MD9e/s
	AbiAyI4AmlNh0lVbT3VKPhm76CVwTJhsIM9zgrSj9jBjLEM+3zwHjT6uhV7SN4v9EnlyPI
	lUHNNJ1rmPUezCD99AY26JOi6tJDF9g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-ApFvo2FpPK-L38lS6PyIOg-1; Tue, 13 Oct 2026 07:53:05 +0000
X-MC-Unique: ApFvo2FpPK-L38lS6PyIOg-1
X-Mimecast-MFC-AGG-ID: ApFvo2FpPK-L38lS6PyIOg_1791877984
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b028d93c5so1881696f8f.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791877984; x=1792482784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
        b=JdYQwNa2Cu830inBPoJbsM18y1KN/KRhx0lNJuu+kR2H0L9AlM6H3yYq+lndZ5W/1a
         QSzL3Ff4mLxo/9mtQ6d19C9nZAU9YEFVpaReI/X9Jke+hYcrt+ZJWECBJALGBqxFSqqU
         jINMcOwQ7iWkhQ8l92+tzGOBrkf4/5JjR5smW+bakiUbUgE25O9UkdPuv5pwuSnAPcGn
         S8bvpEKyvIRQSimcPVeQb4JLU1+qZsiRkZbaYBXfB0YxKvGt9bMDCnMipvYofaYmucCd
         tcHR0AmxPYqQZ73n/YOMqEUicahITgp9LzaL7NjIcHBbdZ2jE7hAxj4ph+WryAdnrCxU
         ZpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877984; x=1792482784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32p4bkVSjbVJjkHnuQaeCCBADq6jSYClg9R5pRBhYMw=;
        b=1KtMNQIK82GM/6NPS9gJF9fSpA1lvjg4MXkXiGp0mrrMvI+Sf3JbmrC+sU9WBq2dz2
         dGFF9bQR9ayaMIBbFmM0CxIIz/DQve9ovgnPvcBwPqnTjlgJyHI35D5VNcyttSdC0DRC
         6ccwKy8sMCPrpdAwMJDxQhLP3vEkm4JZ0yS4Mo1yCV91QYM29onl3qGMXHsu2/mxvZwz
         mCwkVRhh9xjBFJ7V4hWBAMQl4iv6M859Fe4zTjyLXEJzTUnKI8XEO24yQEeitwDgrH3h
         WOJtlwHDQ4zu3ZqMDgMyIVctXiNElt1i64/Hu7AGahn5YJjhX8vgk/y62ki7iWUPs5Oc
         A6Qw==
X-Forwarded-Encrypted: i=1; AKwUvBxmn/aewm+yAdlffmkLy+fUt0PfjjZdkFpapuWDSx7QptzjTDHOMgYnHR/t0T3DKXsBuDaslNX+d4u9@vger.kernel.org
X-Gm-Message-State: AFq9FYKoQhSn8egctvIdM9Yg4xbfeQhIsWquj+U0upgHz/NwDrqm0b8b
	mvXUEY2reuZNubr+ekZt0q2H/ZM4k8UKetxaBVFGwJFecwoqVnzPLxQgs8BAhqOgWkr5/6vEb+p
	tbPfk412sF06Zrlf2ExTf1E33B+5Iq0kxf58HWviybfEEHDIQ5H6HfidDSN6e3nc=
X-Gm-Gg: AYBFou0tviWZt/5028gnhBEYthxLtdnR6N9GmNYhqO/WIZs2MbQSmftTVI39YSDZ67p
	a4cjapWw/saRdCifJAJtyKdQqphneockySAaY1vZ+uHGfQO7hFthpu0YSYRCvnB4JCw196blj3H
	cyT8E87KnTFump9CEPtCW6ayh6HkYuCBxitJS3p+V0wGonKG5clsotaOvOtdIUGM5jbhABnzZpI
	HNybRW/bYvCH6idGtTHgF7Txmnt4uxhvnjl4DxrgTIY21CiTM8OBDCsMlqsXESHeXK+c/uXZHra
	RmWioKtuDsa56+Qg7B1alyDNY8R0Wfd8GlD+7d2MmpZl/gmrL1/XzR2uAVyXBS9y0JtBGzwMqz0
	8aZctl5cKmppxmwRiQZRwAkGJkFNjMGpZ+zSyzmj8btwISEhIHfxCsay1uykytP+/JT6f6YWKHw
	==
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr226794255e9.14.1791877983795;
        Tue, 13 Oct 2026 00:53:03 -0700 (PDT)
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr226793815e9.14.1791877983291;
        Tue, 13 Oct 2026 00:53:03 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm377412975e9.10.2026.10.13.00.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:53:02 -0700 (PDT)
Message-ID: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
Date: Tue, 13 Oct 2026 09:53:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes
 after the MAC
To: Aleksei Sviridkin <f@lex.la>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261006124731.1528963-1-f@lex.la>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 14:47, Aleksei Sviridkin wrote:
> On the Keenetic KN-1012 (MT7981B with an MT7531 switch), the Airoha
> EN8811H behind lan4 has its PHY driver built as a module on the root
> filesystem. The switch sets up its ports before that filesystem is
> mounted, so the port is validated against the generic driver, fails its
> phy-mode and stays dead for the uptime. DSA does not retry it.
> 
> Patch 1 lets the PHY node say so with needs-host-firmware. Patch 2 makes
> phylink poll for such a PHY instead of giving up, for a MAC that opts
> in. Patch 3 opts in DSA user ports of switch drivers that set a flag,
> and sets it in mt7530.
> 
> The poller can still lose a race against an unbind of the PHY driver,
> between its readiness check and the attach. That window is phylib's:
> any phy_attach_direct() caller racing an unbind has it. The attach
> guard series [1] closes it.
> 
> Tested on that board with the series backported to its OpenWrt 6.18
> kernel, together with a940003f44e7 and 07d995873960 (the mt7530
> .get_stats64 atomic-context fix). The kernel had lockdep and
> DEBUG_ATOMIC_SLEEP on. Local debug parameters, not part of the series,
> drove the error paths. They fail the connect after a successful attach,
> ignore the opt-in, fail the generic attach of a PHY with no driver, and
> add a sleep after the switch shutdown.
> 
>   - boot: the PHY driver loaded its firmware at 8.7 s. lan4 attached at
>     26.3 s, when the port was brought up. Link up at 1 Gb/s.
>   - port kept down for 10 s with the PHY driver bound: no poll and no
>     attach. "ip link set lan4 up" attached it a second later.
>   - opt-in ignored: the old behaviour, the generic driver took the PHY.
>   - two injected failures: "failed to connect late PHY: -EIO" twice, a
>     second apart, and the third attempt attached. Link up at 1 Gb/s.
>   - failures that do not stop: four attempts and one "giving up". No
>     poll after that, also not after a down/up.
>   - four failed generic attaches with no driver bound: nothing logged as
>     a failure and no retry spent. The port attached once the driver
>     bound.
>   - switch unbound while the poller waited: nothing oopsed.
>   - reboot with a 3 s sleep after the switch shutdown: the poll ran
>     every second up to the shutdown and not once in the sleep. On v5 the
>     same test polled 3 times in the sleep.
> 
> No in-tree device tree sets needs-host-firmware yet. The board is
> supported out of tree, in OpenWrt.
I'm sorry to give this feedback this late, but AI flood forces this
workflow on us.

The above looks like a significant amount of complexity for OoT driver,
and I understand it could be solved with a different kconf?

/P

