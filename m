Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203449;
	b=aXgp8wy/L4VTH9vlBFpzDYi11VBY7WVY2FAQcrXVwUSB8qNlCAVcNtr/O3UOAUv4u3vc
	 7iR21YwtaOIlTUKDol5t1uApCew9ATQ/+3IRgStEY/tbpBEntitR38tJc1d9E+8AN/ih0
	 u3HLEmWlcjYTAtZhDCTbBIk4KkUu/fBh/FEw3T8pzuRN8Zz4Nf58Jr7Hu6/jmzzOo/RNz
	 fhLcw3hrOjOdZQclJFvOsgTYXg0ZCPK0TJGhHbY337yQOmEuNJ7VlKaz1arSpp3dkZTeO
	 W7T/VEuab8E8ZQBAWpFW7YBkMOAok60SEIhiSrPjZOU7kRtJgwUlbZajE4m9JHLTbEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=;
	b=noP+PXZEP6/vbg+mp1k2cWrivi+7b9tGF2A9l3V8kuqRE9NEU2ZHFttA9YPF0Q00jjDU
	 SLSVQ1ORA40Lw1E5CTmRyQF4MVuFdnCrmp6BSqW1c9oXdYRAH59yQAF154Toig20xSNY/
	 1AaY9FAG4qz/Yyj12JUGYs3uDKNsC8CsoY6oyajDJYvA858lHWDdUgtzuXq56v1hQiv8a
	 sIYCu84lBybM1RRntwse0zAGlZreAJgBEM97efH5ptt/mUF450wwL2PMCFX0zj67Ucto4
	 KdSBNLowJwuJiN/9TGb0x9r1RiZy75abVdz80Ty5Y3eoZgE3wyu/ucNNix91GgRTvCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h7w/6mjk";
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16D606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD16D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7w/6mjk
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so1883097e0c.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793203448; x=1793808248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=;
        b=h7w/6mjk6+6kpdKforROPrJX+UDA63yf6nVts44aIrSXJJDyONSXYHDrGBuI1KOZ3h
         0GakPDtGQJ9AX5Yms9cJyOljn/cP6nLUH/BmSGtMjmj9Hnu7FJ6nSdn6V59f5/OuWqYs
         TGq/8hmQ0Hoqoo+pLKrhtcng01yYB+b7azWGX4l7IoRFQFewVB6GQBDGGOarGsrR1qQb
         DlcV7TFre0T6I6/A0qDwyCVc89uhVesfZjRVenTMQfNAufO6WUEdgQWnfborHpREF/SL
         znFx4+xOEhqvA5Qmz9AuntimIS0MGiMsgWK5uZJWFUNTWwMfS81dSK+TBz8jLyrfPwa3
         obMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793203448; x=1793808248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wW+/Xd8Krv/fKYtWcQLYyD+KltWSe3OXoRZLQJCTD0I=;
        b=q5nVQBq/s2KKAHYLRj/T/NuFXN9LRbN2MTy1ADldKj7HBEAQYG7NFS6OF5A1fosquY
         I5/7tZTjrVT5yqXdOn1GAbauJ+J/WIpJcwbKTtbC/s78zmnGPFQILgJozf6dTlc8CIXz
         urES10FWLqSz+5X2Ji8SBGUxJnGSABHTH0shdvA0i9gMvY9kwNTQDeHaKi3jt7TVb00J
         mm+kKq6SWiYtF2Qhk//N1zKuEDpweQWG2sGN5foesE6JEfmc1b13uzgLJqz6IRiEkuu6
         KH/VX9Cao71+/tZx0fBVaEoy+oxMM2XRUYMv9FK+YHqm0kFysamyjJD1X0kIELjW9m42
         B8yA==
X-Forwarded-Encrypted: i=1; AKwUvBxUvUuf6QMemtSkqP8TZuQBYzdH+RjWSobcUoUzTfUDj9F01QzwhNJ6IVikI7ArBlbQZh08DX06vh2L@vger.kernel.org
X-Gm-Message-State: AFq9FYLUOXgcy6x+jwI3BCxz8Ffq7lOjRBF1y1EIAGkgPTdBwDCnFW7m
	/ha9D8koU897ycE5pIUrczFRak8IH4zgzG7zuUh2VX65cYh+VAAMbhvN
X-Gm-Gg: AYBFou0q1yPUMbz5ikjbhxwg+Bdd1IUaN7PZrDA3pHag00rFjK+UR2DwECdRdTL0IAi
	re2ZQeHgisWeVu+CkvtPqxUufTVVKIHXt94Rog3fAaENC58eKLBa22m7tEXwq8XfFFM5peL7Bqw
	03xTTTdx4NQnsTm2CVw6WQDX9qCanQGSHHdc5+4XedNULxG0co+JCPXXXQlzVR88h9sDBqvRQAc
	b4JNl8XxQ3CS9B+qzj/erXVTA9bf+LzhDMbYeMHmfLOfHwgzsOFp0q5t7D9QLjeyL0XwO/+DWl9
	DzLi4UX5Vtl7wqftORZIUHY4F5Z9gFcd/YrWPvSTURRhs3BNzYIKMcvTZYF9MY/laQpDu8fjcF7
	bXGIH5cdFkY8TkFGakRngcmABDOixgkitcAy3zYtwiTSTROxXcBRn/mB87Kd5Hto10J5eEeje/0
	twBGFt6QsOAJvKMhlFBJ8t+skNY5qhvcu0JZsfAggUZB19sR+olX+jDkmKSOo97ZR24C9GvUJjt
	CeU9mZvzkhZ/wUuJGr0v3LnTniKe+6+o71yRRwxvDj/2IzhC5CbiNhDHxbQB4Bhlt1NUFwMiYky
	LkeKr9D7/FYlam24+dML+wXEguZHHVsQcRBgKiPIQk8Kigs5S7Yj7neZgztCnwzb69aspctkx+i
	Zww==
X-Received: by 2002:ac5:cd4f:0:b0:5cd:4fdc:4c30 with SMTP id 71dfb90a1353d-5ec3ea67966mr1617819e0c.8.1793203447486;
        Wed, 28 Oct 2026 09:04:07 -0700 (PDT)
Received: from localhost.localdomain ([190.177.146.128])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-991259db2d3sm6354565241.6.2026.10.28.09.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:04:06 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: cjd@cjdns.fr
Cc: netdev@vger.kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v3 0/7] net: dsa: mt7530: support EcoNet EN751221
Date: Wed, 28 Oct 2026 13:03:53 -0300
Message-ID: <20261028160353.4239-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028011317.1557238-1-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Caleb,

I tested v3 on a TP-Link Archer XR500v v1 (EN7526G: on-die switch plus the
MCM gigabit switch).

Setup: OpenWrt with kernel 6.18.44. I took the four mt7530 files from
econet_eth at 3a8bcd2e6398 (they contain every line added by 1/7, 3/7,
4/7, 5/7 and 7/7 of v3) and booted from RAM over TFTP, nothing written to
flash.

With the DT from en751221g.dtsi in openwrt#25330 (MCM "econet,en751221",
no "mediatek,mcm", dsa,member <0 1> on the on-die switch and <0 0> on the
MCM):

- 18/18 boots: all 10 TRGMII lanes found a window, no "calibration
  failed", "TRGMII inter-switch link initialized", DSA tree set up, ping
  over lan4.
- The chosen taps were stable across boots (+/-1): SoC->MCM 15-22,
  MCM->SoC 27-29. In the SoC->MCM direction the window always starts at
  tap 0.
- 6 of those boots ran iperf3 for 6 s each way through lan4: 0 RX CRC
  errors on on-die port 5 (~1.05M frames) and on MCM port 6 (~1.29M
  frames). In 4 of 10 boots MCM port 6 already had 1 CRC error before any
  traffic, probably from the calibration; it did not grow.

Following the binding in 6/7, the MCM does not come up on this board:

- "econet,en751221-gswitch": mt7530-mdio.c in 7/7 still matches
  "econet,en751221", so nothing probes the MCM and there are no LAN
  ports.
- "mediatek,mcm", which the binding requires for -gswitch: the probe
  fails with "Couldn't get our reset line", since nothing provides an
  "mcm" reset yet (the TODO in en751221g.dtsi).

So I think 7/7 should match the new compatible, and the binding should not
require "mediatek,mcm" while there is no "mcm" reset for the EN751221.

Not covered yet: cold boots, and the other LAN ports beyond link-up on
lan3/lan4. I'm happy to give a Tested-by once the compatible strings line
up, and to rerun anything you'd like; the full boot logs are available.

Thanks,
Cristian
