Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609323;
	b=e6Z0DDdpCWkouXqL0QQGYtaNoCM4KdUbI7nvsHECeweQ+Xk3Az/zyKDpLHGkT4TC9oXi
	 7DYx9LwRmrGtIdz9nYIeD4Fs63c3AG/rVe9fq9Jib22FPmJU9jxJkN940J9H2WaVjuEYM
	 kMSvjCeUpWZeYaYogkw6vMDXGXRKysYOzNyVEZPS6EId6BOXpWLbNuHBA1dFz2I3Ylo3H
	 dN23A2AZO4NRvZL1PMfSGR+ed4T7LkfOT5OJiiec7U6KLJF2t4k57P0f3yhZDvaWgDKa5
	 AAJp7WtzPTv7TKAO89Rz9Q4CQTaECEwHb3zllZbdLNg/BFJE1BloH8vP9wcUUQu7G9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609323;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LITKaWV7XMnQptJT0JVIP2eNuxfwTtrcVKQlo7sTeg0=;
	b=ljufo79qScRZ71osYdy4y5idxsyt/sDmhJLYZRo5MGWut+FHJa01kvMu5TEwzFrK7A4p
	 w+Tdg6vt2wgsSpZILfZWtn9WJvIs9oKkYlbQ/XPKs+Zh39GmtnZMzB9TNVbqkIRzjmqvF
	 4oSW1rO4kPVjVWC63GhU5+Hyh3ZmIvjjX9Y6cYcILZNsRTBtVKJzt0MkukwLizty0rWdq
	 LyqOH4x9QTQDG/s5xm45NoJzrs33gKqRHv6xp0ARNXatIogtSLyMrqrURhO658Azxo5g4
	 3ID2cIQz1WNitVMQL4mAIGWq1L7csdcwWc9mBDxZP0hfPeJVEqdVdL49aiGYkwaneRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29B3606A572
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 22:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C29B3606A572
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so904667a91.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609322; x=1795214122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LITKaWV7XMnQptJT0JVIP2eNuxfwTtrcVKQlo7sTeg0=;
        b=TiovbHRjs2UcV5RfsGr/u6iwJPDFxZbgJVL5fZwIfuLhIFr4jHNXPsHjQ1wOL++5OK
         7VVAl4SD+Xyl8gcgdZWaTiXzlzLfVo4c+vtTJ09KHNHd0jcAM9YNY3b3hZfx6habyyD1
         KdmNYwe7FgmYo1+rfzYSAQd0JlWVcXJ7E86oeb5mh1YH+/Ux0YGXkMS/eyLLIeNEZFdJ
         nB3dBuVidZb1oFUWKH/6u6qSB0DIfhT/8ybTXPBJpsAwEhWwxjlRK4Un/XHvHYTpBuwE
         xGA1vh5lVguQIAig21/WqlGMqimJ6+rgPdd1v6a64lZg+EOxlCetquMs/3t42mMWk6eL
         eU5g==
X-Forwarded-Encrypted: i=1; AL+hErFKW/ay7wK6wiV/4ly+O/G2ced1QTmkkSe0eFDFV6OC4bBXPm4cNh+EwxpuSL/kd6Hbjps23IDNR6Tx@vger.kernel.org
X-Gm-Message-State: APuU4Z8za+BsXBT04kRpnIABdtsgeKyJwUIv+XV6HCPlXUhTiwjnGEZi
	Q+4oFRjYbDzE6uDjfwNdRSDDvYn+h1HFxlmuCk0LZ3aF9mVfuCza+QFDhCiIQPiX
X-Gm-Gg: AYBFou3/7vaGYsaK/eGAIFooMdthr4Zywd+6tBQ/7bHMa+H2m9KVUZQK58ijmVHXCEF
	XVwehxqUKbC3De7H7y5Qj8Y/qGhqBt2+LHGGSnc3mQ3qGFzdt1OooBLOk4SaVc/dhiDEohkHcZj
	6frj4/VNh8QSJtiVA+tNgPr0QHTIfU5JNnpcVDxd+IGM2rWODDmqGLkTN/u6lMriF690Lw5RqaI
	Teg7XEOuvL2w7bYCpn9SH7imuNP++DeXuLVtQYWxtu2qSrvsORdVZCNCjvJKwkS5TXDxuJmWWCk
	tIg/vPKjw2fPnVARHYOxMo7/F+SG2uJyqBEsqQTX1j84LFZ3YA4A9/4/GrfwXpfV1Sq1xFaHM/1
	n46HdfcA8zaHPvv9wUj1xOYS3fgHGD0jeXJNn44HAC/FL9421WGybAF8IJAIWzP2q+kofBjt9bP
	liKNGT3wCsF5t6NbDitZnP/k2vOlKi9Prc8hByDmHfpOR3iJIa3hNor1U2XLqS+aT3Kdb+DFO4e
	bmxBPnydM39zqxhayFfVJZLk7OWw5Yq/pcT3/ekK0FslnRGop9bX0ez2CyLBvGo6zq4ElM2GRI/
	qRTc4ATFwl7qjZ2Ixe4+560alHsKi5zW6oZgv8g/oJjEdSJ9IpNSxtGVRY5lZcKeGQqVCJPEUV1
	wyAXBjTYCCBYrDJ/WQbg+2cv8vmi2upFB/utPJqC9jvGJBI4y77QxEoszNpHw7x81bQ==
X-Received: by 2002:a17:90b:288a:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3b1b0815b34mr3075136a91.6.1794609322095;
        Fri, 13 Nov 2026 14:35:22 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec63b9bsm6386179a91.12.2026.11.13.14.35.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:35:21 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so2260642eec.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:35:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGYQC1VRBUhDddHdfFVAfq2P60k273yMYDdW0YqVcgLLbX8y31m7YpLdvfQ4caFuwB6KaRUdzKivSzM@vger.kernel.org
X-Received: by 2002:a05:7300:85:b0:376:e950:873e with SMTP id
 5a478bee46e88-37965f9ad51mr2968029eec.12.1794609320230; Fri, 13 Nov 2026
 14:35:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-mxl-gsw1xx-reset-v3-0-863e82074893@telaak.dev>
 <a2f45802-b75b-4a19-9508-2d1b5ebe473a@lunn.ch> <avcoghKd4CU13QI_@makrotopia.org>
 <9804b024-236a-4791-aa55-d83a71b2598c@lunn.ch> <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
In-Reply-To: <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Fri, 13 Nov 2026 17:35:08 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4gB42mW6UW4Qk6r1+u2_AA=58WTFCvRrea2cedPuAcBA@mail.gmail.com>
X-Gm-Features: AclHuK92955TDOieITeTuWAvZpOeGFZi5VRbt4O1JwbW-bk85arSJHpEKRZecOs
Message-ID: <CAPY4CJ4gB42mW6UW4Qk6r1+u2_AA=58WTFCvRrea2cedPuAcBA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2026 at 05:16:51PM -0500, Joseph Telaak wrote:
> I'm testing the other way now, with the PHYs described at 1 to 3 and no
> reset from Linux. If that works on warm and cold boots, this series
> isn't needed and I'll drop it.

It doesn't work. With the PHYs described at 1 to 3 and no reset from
Linux, neither LAN port passes traffic, after the flash or after a cold
power-on. The same board with this series works.

So the addresses aren't the whole story: U-Boot leaves the switch in
some other state that the DT can't describe, and the reset clears it.
On your earlier question, the driver already writes PHY_ADDR from the
DT, in gswip_port_enable(), but only once the PHYs have been probed.

Since GL's own firmware resets the switch from Linux too, I still think
a hardware reset at probe is the right fix. I'll send a v4 with the
cover letter corrected, this explained, and Sashiko's points addressed
(the silent skip with CONFIG_RESET_GPIO=n, and the repeated pulse on
probe deferral).
