Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707991;
	b=tcdQRZMOo7zGRH82+m8ArEKcpsQSwyKXUKQm8XBrbNaNfPFt+w7GVd1cbwLvynXfK+Fa
	 W5f2wgZAs/LCDtzTwMSa4m+o4mt2PJfrPgfuxpPvMlGcXL3PbaeuOlkHBW/Ba00lTljOr
	 EvwGfxFko1p690qlxupW8wl22C+Axf+L0NGHd3VF+880du0/cgvicjlR7beJfaLJhnZNm
	 K8MOGUYBfkD9S9B07O/BVcBtLluvVd+Nmed9sQgtdoeh1ASl9tKzkXpKVcMLPHZJ/MI+G
	 heES3e3REQYmHRBkFIux6EeYp1jhPsaiP7ji1U7pfZ6/MZ7B7/wl8REBz9T9yRcOOSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
	b=0cvhrUULLF/daWoPCgobp1rkdLyCia3jJsUxX8mEKNPALY1DTJk3IhQLmQsd5VYDJc8j
	 SCtEMr+JLnf1b2f2EegHETGk7rEC7wsuY0E2/Ee8X/7wAhTdyHs+AS8LAAiGDKX+2v/3v
	 AIw7yqWlBS/voIUk1j4XP7QE85gTUTnap8qEdw0jZW8IsrngS2sRfOvVEKHJk9GeSKnp5
	 j8Y963OgUM5j5rAql6aO22EF6ENBk3uWtz55AQPoVC4Dv+Fa8fT3Klz1vp2QLYUp4tRJM
	 SSBfZ0VyfKAa8VeE0W9hGszhFoqquRlI2bOWBktqz5v2jwI6PxGZcJl7wFmoGZHgycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehc10ZS7;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32BB606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 15:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32BB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ehc10ZS7
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3287600f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795707989; x=1796312789; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
        b=ehc10ZS7ZDz1IL/IvAdVNxSDL9JWgq3HoRFvbcCMC/gcCmwuyephjvNKdKPK3hrvvE
         4RCE4OXQLuY06pczn89BcHDypfWL0AOE1JGsWFEh6Dl+co/5zsEMvHMU6KLc5sKN3aKM
         /751XgVfwE04mMpsCScIeJGees4UX79wLrNJhicwJ2KzCkxFi2cFTKo2up3iQC1FPR+R
         utNhlLF1oouWTWO7LaCNp6voDYU7a+GeL9xC8nTRMukPT/xjPdk/s4HENEG8u++504fL
         JlmtVi8dddMGRNdxnTQk/MoG6VB2bBRsRc/Ed8RF/IfK0oOJGhyk/+sX0w7Me8YkHXQ6
         jTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707989; x=1796312789;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThrtHU7JIVcephohGAN24J7wKmIcAnTwKxtX+IFGbFU=;
        b=abahxFy9Q84E8L12s1xBqF3NY9ZiH63i3bbTkXB1u8fkfzAmR9rUVGhRTJCvw9EP4a
         o8xxAgjCGdmza4MkhHQ/z8JL8gwtcLCmdOVJVDHbNTf77lN5XSY17fvg8s08YtrWVMKg
         r8wlc1456hBxgPRmPTU/CgiJJPNOiKzZxHuTD3LcY5OC34nwHlzPd/JALpcOsKyr6Y/+
         qSUAZE1ny8t+L1vyo//KYP+h/YV5885e4VnnTUR/smaPqRSPLoCjL1ckStVbs37PuhGO
         0qBEXWSVRM9Tt1DfxnCSHnp6xigbrKC5mgri92/+Zr7ZGPDzD4WEU+Sy7HvzQl6tNwKr
         rAXg==
X-Forwarded-Encrypted: i=1; AL+hErHJW5zsnIeNG4D6++UhEkJqivZtUR/QwLkjZhNHX/USIIhSNJRQ1Qkd7kT0wqLkGGGsBRoYBB5MZAks@vger.kernel.org
X-Gm-Message-State: APuU4Z+5GmEhH2f/LrcwZj4VrYoQuk0v3KgcXI66qVkPZk/zt6LRWXqp
	/D6wkWfxO+Ft48W8eEvV6Hb4/2tRUIGreo4zAkFlrXtd3KkCsE+Y5kAh
X-Gm-Gg: AZFdTZdT50NHIjDibTaEo6O2t4Nuxrmch6koJT6lYBhgwYFdy9HMdTfK2ac7on/dBDH
	bMuTvtE91yR0fF03XxTlb9iyh57INHP5nppA9ECMBpfvS06T5WsWcVv7oFr5ao/coD+HrrFJrJf
	NSBFSW2tA+WZ7BgGRbM2h25/EWt+jgQG5NuI8h67+JuEIkkAy9yIfiTQ5E3u1sA0r/slmOUJnal
	qhnMJHl0XQh76psPrEVwxcHINxupyuB90NVfDtvhYt9BB9MYhMuIzJIWtfMcxoftaRgAHkVWzaT
	VZXuWUN7nvdn1S+N8Z0U//2qTbHPkI6zsnDmWpbciQ3CiqM234LBniDvyk/MSrvbiiRWY+0BzA2
	XWGtpFkazPcAH88uRAP6VyHmEut5gmGZBwcTItFe3XRx6TVbv/Gq4gRwDkPuryer4I7E+b94OSk
	FT3u8k1V8Odqlet2yaa2H47jJfead+4fudveum8rhnpdPfIOQwJi4mJMGinLPcjC2yqeYAsvnc5
	x0qK6lJS4rgVVaGIVnkEX9+Gb4CROhkedspD3oMgzFbhR7yCSJygbnKdG2qgfQT7PAthxDgE5ZT
	4h/d1HnobLG4xK3LeY1t+sqIGV+CK4hfOupN2JhtS5XD8A53i8Y1zOo=
X-Received: by 2002:a05:6000:188a:b0:4a9:4dfa:c150 with SMTP id ffacd0b85a97d-4abb2910440mr40139631f8f.33.1795707988916;
        Thu, 26 Nov 2026 07:46:28 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm40084330f8f.7.2026.11.26.07.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:46:28 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next v3 2/3] net: mdio: Add Cortina CS7542 bus controller
In-Reply-To: <97babf2e-02eb-4efb-8662-f960a36b9073@lunn.ch>
References: <20261126-b4-cs7542-mdio-v3-0-35739a0f3225@gmail.com>
 <20261126-b4-cs7542-mdio-v3-2-35739a0f3225@gmail.com>
 <97babf2e-02eb-4efb-8662-f960a36b9073@lunn.ch>
Date: Thu, 26 Nov 2026 18:46:07 +0300
Message-ID: <179570796761.5.9467085930727317606@gmail.com>
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

Hi Andrew,

The vendor register definitions describe automatic PHY polling: the auto
configuration register at +0x14 selects a PHY start/end index and the
register to read, and +0x18 contains poll_wait_cycles. I have exercised
only software-initiated transactions, not that automatic polling mode.

Agreed about the comment. The MDC prescaler is bits 31:16 of
PER_MDIO_CFG itself. I have changed the comment to:

        /*
         * Select software-initiated accesses instead of automatic PHY polling.
         * Read-modify-write preserves the firmware MDC prescaler in bits 31:16.
         */

The code still changes only bit 0, retaining the firmware prescaler;
this clarification does not change the divider or transaction sequence.

Thanks,
Fil

