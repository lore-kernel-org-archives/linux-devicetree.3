Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473089;
	b=2xATERdl1Kqy73M4wI1uYNQU+4hGeI0Ao0Oj1nm5DB4oTNY88JLvvzkAY2CvnLJAkz0o
	 8v5zovKBRMkr+k34l/rzcGivZrnNbFxV6oR9TofwjcG76Bir2qDshClqIYbuzuZjY5Ygl
	 i2mA/w7gFQneIKphDS46SdfNTkkE3qBfntGQOGWll2yt7bHjO41664OgcYtXbYD7Oavae
	 NEPBD6bG1as8cYwtUdjVF2rv9NptlOgg6m4VyCK6z2ypOWYfNMp4DyT4dmoKMIl4PnQjZ
	 2gR4BDQwLwTMyuDI+VKdW/BUoZ5GF5B0qzFBrVQysCUKb2cvZg4vM2xY1OOxDkfhn/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
	b=K0gAy00iMHYgPetNeVArYLwyPZWD36zljDyvyu6EsG84oJ7YMW7r+AEBu8r8IM7fcgsF
	 AhVMZgfmzhA8hllLHkq+XF08lleIJPvLrAR8Jib9ytbY8Q3i2TDSeAw+dzHDzoTXhjpax
	 8LWWfMFtS09L+DsTfJOHYKIaXQIJ6y63CvcdJEs3wmCiOsnhGlN/7/vp2HJI9ZPYSwxBj
	 fwh0jJrH7MZ/9T54mM6I5IYePmmpIX1JzV/ygmlt6tuN89Kq8Bd/ZcfkdBqjxQP92723z
	 D1lFbGyuAavd7ikyxB0NsuvC95EnlOPqSjn6I+78Nf0mUgrs+sTpmeeNAn4w0WraaCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlCAErAB;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62956606A322
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62956606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlCAErAB
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso3626335e87.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795473087; x=1796077887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
        b=YlCAErABvSeA3HncMRsR56t8K9bcfLsLA9UItBrKavJ0SpSC7Lc3NsWwBU6JFHrpLW
         vio/WvPHUN08i3vmw6OXqvtfm+sri6unRkoP4lzi17rUtqVlDgSYGjEbXkq6ob+1y3Oa
         VLp7qG2/eyoRRfamv4pJVW+5GV/T+NN87nr2qskak44iC0g6cZx1PJGYr29Qu//2Ts4b
         YZo5hYRUr/I0llLLEpJcPo380RttdeQFS4LgkCpUSMswutkEMSXhE3lgeXbZXZrKtqFO
         fKt+/dh8nnpIrKJ0bfcZDAMaA1+z6C4HgIr/DSmOrZtnzEznZm0jkHn0eS9YRiTM5Feg
         CssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473087; x=1796077887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
        b=Q7TWW7CvDQ88enqJA+csvjxDz14l/PtRXYicKZA4Z+atoAuJ6kvuS7y3fOl1GWX1Bz
         BJELGSV5xGQTcBKYRNFV6prY2xksDeg+f8Rh0ftxI1eZGeiuaeo1M2mw2QknK7VIddBu
         VDTXN8JF4YCKSXRfGNeA3SktRV72zobSk36wPj934pWju3rx+hfZYSO6106ALRBPLd8s
         2STsw+2pS30RWhmIz01BUcZfMnnUpTNAhsEXWcMkr2eb6i8PF43SFyEaJ0Rt5p7Q5FsA
         dPuqPQIUBru7TBhBO7rl2Viv3ImcvI9kKsg7+3eoXt7IS5r+tVAK5u1aKTGx8c08Hutt
         PHoA==
X-Forwarded-Encrypted: i=1; AL+hErHDsapyBBfZ/RIElsOql8O7RBeQY7XRJg/SDP3B3TqFg0NAUggXReGhgaY4Elt5WL0b9DxFimhuBfqv@vger.kernel.org
X-Gm-Message-State: APuU4Z+gg4mWREMI8M8jb2w++x9oql3Kf+hFUGoSgXiAkXyVa/76ahxo
	DKoz+KCfnokIPm9N5fyKHtg/BxbWWVp4joaKgmph30bgXui8xn7v72Ql
X-Gm-Gg: AZFdTZfiPLgbkwEdku9vHBPFTH3LA+/OxNobBTC6xFd1X+S2SWnegI3qKZHBNHLd0OS
	uHydUdtxpXi7IZ64Z6CANjX5atuD+66WiD6/bXcGGJu6UI3XsWPifvJNUGF5cx1Cmms+QjnCIWC
	Z444rOSgVowaPgIJ0RuwzZyVqxHhKhldeoeUISeIlc6Ka1Yt4106PrZPaGNMrlhNKML+0rqogaz
	VGSt5NR1L5g3AaEmCuSjylNh5KK8HONy40cQ4bmeA8sOS3annGC7GUMruriuRnGRHXSCTooL6hW
	xU5XzAEKT7dNPtSCQeR16iz2EJSsxYmTiINu72XWCkwc5f8AuC8hz0/Z2ZUEPvryJ85eTqurRA8
	nARtswKh1deKuY9CHX7j2Uhc7EICGuejcymJxPhNaELsiKU2Y1JHtUN+0nvUG0vNXMkvaJF24pp
	RMdQECBgJaPgyO3a3h8rDMclQF5ZUcHFLif4kP/kqezdXU+5tdJstT+7aHP7HwHR8K0blXq2w9x
	nuQMwyiwF/qzyT/oMDNoogtnUcn1LJitOGL+WzjwfBm3NWCTeRTFNq0cEBXtcQO9P/x6L+9Vp3N
	HxPohOYxMHR4HjwCDGIlfdU48LsdtuaxyXPjMEURplPVpp4wRmsFi2I=
X-Received: by 2002:a05:6512:32cd:b0:5c1:57cd:50b with SMTP id 2adb3069b0e04-5c1bc847888mr3847641e87.14.1795473087230;
        Mon, 23 Nov 2026 14:31:27 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd052d6bsm3315161e87.65.2026.11.23.14.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:31:25 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 3/5] dt-bindings: net: Add Cortina CS7542 network engine
Date: Tue, 24 Nov 2026 01:31:21 +0300
Message-ID: <179547308136.447306.5703918766544571012@gmail.com>
In-Reply-To: <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>
 <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The hardware has three GMAC interfaces feeding a shared NI/FE, queue
manager, traffic manager and scheduler. The forwarding engine can steer
frames between GMAC ports without the CPU, including rewrite/NAT in the
vendor acceleration path. The posted driver configures CPU forwarding
and exposes the three MAC interfaces; it does not enable hardware flow
forwarding. I should make that shared datapath clearer in the binding.

On Almond+ there is also a separate QCA8337 Ethernet switch. GMAC1 is
wired to its CPU port 0, and GMAC0 to CPU port 6; the external copper
PHYs belong to that switch. Those MAC-to-switch connections are the
reason for the fixed 1 Gbit/s links in the example.

You are right about the phy-mode description. Both QCA CPU port nodes
already use rgmii-id, so qca8k programs the internal clock delays there.
I used rgmii on the SoC side to mean that its peer supplies the delays,
but that is not what the PCB-level phy-mode describes. I have no evidence
of deliberately extended PCB clock traces. I will correct the example
and the SoC MAC nodes to rgmii-id, and explain the fixed MAC-to-switch
connection. The existing QCA delay programming remains in place; the NI
driver does not add another set of internal delays.

I will keep the Ethernet reroll within the requested netdev cadence.

Thanks,
Fil
