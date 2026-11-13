Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608226;
	b=ONhkKPTOOyyphCIZoYnqwlhCTcfyq3FbM0kTJn3/6FkA2l5k+cixclDNRvqBfiN6NUdF
	 xXeD7GsBdPuezNdwLxT2jUbESUEF7D9QHHP6vjbR6dmQTaPO47NSiCcBegcdcoqIKiDlY
	 ph74012KmcAHsegkr6Dy30pe1sVjuhPy+zCPG7oem9XnIkHhpEBXaCfgrhWoSCt6gyJCN
	 ds9MHbaYPP82zt47TPmjGoNfoM2CggMdg3wbBDKV/FtoUn8MHKQUZStHrFz+4qtwGmBnN
	 3DrR0TygSDYufbcE7xkq5dJE3LlF/ADLGdbEeZD5MG6bqOvY2lvBuKA+GFvga7OUxCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608226;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=N6FCMFLhgSC1KzmMhu82bNQqBAWEEyHIeJ3mRCaIM5o=;
	b=dNsoOy9CEZn497O9rojrXgI5xBFiISIorFs4fOm9AKFXtnIUl+2GL1i22XDXf4XsIzyM
	 i4WbldPrl07dNdpgvIGKnk/JdUyE3cZpYBjMWRLF3SL/ellhAwNRh6jTbb031MX2z7duY
	 IZ0/g9lXx1TgcqBzWKVgCHIbFk2Ti50WRLlcVxYKVkdV9DUGWcIwHOsjiWCuW9HxKLrHF
	 7RlkZR3cxSi9nhLQj59Z5d9AH9lAVsRlAh26l+Gks1NM4V4CZjxABdrN/vL9cV0BcetRP
	 hGs4m4sA/jh+WQZsmAouJfyDeWeBngr4OfeQQe1HgdwmiXEUmb1y4HjSyomvhE0QCvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBAC606A884
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 22:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBAC606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1290488a91.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608225; x=1795213025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N6FCMFLhgSC1KzmMhu82bNQqBAWEEyHIeJ3mRCaIM5o=;
        b=WpXuFrRozqTTg/JhSlHo9nIeC3M1b9WRIkyTEJ51gnEjT6ZH6rZcb0zdZyclOv1XST
         BWE6pxtbKbNocNlx794Eppc8befDww9pt2S16KH0W8wGNnpQochJ3pwCs2fDTm73S16v
         ap6EzXH/tBXkAQhWlinMYIhCISHW9gS1Ib8cwl5eD1eVsCiisSyV4VwC7AigEnp4HcCA
         kn+Q2GURrDiJrJR3Nd+6M76RzlDjc8HGZPtKM0+XAp84bpwIlhcRM+R7Ijt7iH1NP1Fi
         8FW9ggBxxN5yZlXu+y+bl+a02Y9dsH5lKWTkOC9lQum89umLpPNIRlUGSWFSmAVMTMRV
         lv1w==
X-Forwarded-Encrypted: i=1; AL+hErHjLvZIykcIOVrccwlVQxkvN03w6MDN22TQMAgw+X0TYyz2ThfcttVU7QjKoIgyjQmFDUPwFb+ztnA9@vger.kernel.org
X-Gm-Message-State: APuU4Z9M52qGuMJDN7w3iLMSxmmE9wjkJxHswUWOxZgfE4ZtrlPMI29Q
	vQ+D76csCLPVVKynJpXlui5NpZq+YM6wPz+U7IHYgxfbwOtIgxpxY8qmv7r5BByF
X-Gm-Gg: AYBFou3n2qhL/xMu3ATOWiPuwgAS04a3uRUYlJ59PL51IwFgv1v7S9dhAJvoeu+t17o
	piNEu4Sk5PQLwDPrkqYV4M0/N8yH1Cy5qhrjrcYTc4vY5IMk/oqyMDyHoPQbGLvUuHWUDfWXJVl
	zf6H4H6UWMMjRV9A3an9Tee46Yi/7LCQjgB+U6mclO7xTlcY331qizDuWXVyrmWN7dbaqLjURAF
	E1psIIxOlt9rg1YaROVo3EueLIER5YlWEnLgsW0n+e/LqkzXXKZhz1fg/1a4rxoWm3fwEYhJNZA
	qD4UyPxWez+f/BPYukHiDtGttGW3vEdj1xPgc9FJpcnsaIUWjlhGS6WTFC88UVBiyeOmfRALC3k
	+5oH9jPomGd0hkxb8IxBTMrYWpcVmDcwY0jBwc6O913i/3YjYxAaw+NzwLSXP7IydNxGyYPrQTb
	uIn1unw0h4kBX0m5zjCZ6xtKiwd5zW+PDcRY6fm1/Ho/3nhziQ42KI9ZY7TOm3Zr3DaRT5u8KCE
	U/1xF+H5KPGryGSFAT/JS/rrApFRftts/ASzlkBiGb+j1/z25t4PHtWlIcIoPptjUvpHY5VA2Yg
	BXZ1hhaCeFicrlCpLzXxKCvE1Yd7vJ3KXsX37LSjPB66W7m6HYq2W4lfCdVnMTlnEZArPYzhc7u
	7i8dyzEBcZnp2KLWyBY7QWzEDKl4FGx94CJnn1Y8HDn7y
X-Received: by 2002:a17:90b:1d45:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b1b09f3aeemr3483892a91.18.1794608225384;
        Fri, 13 Nov 2026 14:17:05 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm11091649a91.15.2026.11.13.14.17.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:17:04 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso740234eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 14:17:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH3mZkY1XnekpLHclie1IeaGHzD5gfatOCsaehOHsWadlWhoWwVSvj2WB6lFTB2Iy1PWdJ6ax9QJwS1@vger.kernel.org
X-Received: by 2002:a05:7300:c8c5:b0:379:e0a2:1a1 with SMTP id
 5a478bee46e88-379e0a20687mr2633403eec.35.1794608223266; Fri, 13 Nov 2026
 14:17:03 -0800 (PST)
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
 <9804b024-236a-4791-aa55-d83a71b2598c@lunn.ch>
In-Reply-To: <9804b024-236a-4791-aa55-d83a71b2598c@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Fri, 13 Nov 2026 17:16:51 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
X-Gm-Features: AclHuK_vNnHnvyeLRTaZ6xyALhnUZh809k3x2d0i8tHEQBpPdhifZW5Gb_-9a4A
Message-ID: <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
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

On Fri, Nov 13, 2026 at 11:05:55PM +0100, Andrew Lunn wrote:
> > The driver does what is described in the device tree. Ie. boot firmware
> > applying a non-default PHY addresses should just say so in the DT passed
> > to Linux imho.
>
> And this is what i was wondering about. Is it the DT which is wrong,
> or the driver?

The DT. The driver assumes nothing about the addresses; the board's
device tree described the PHYs at their power-on addresses, 0 to 2.

The bootloader is GL.iNet's U-Boot, which is only available as a binary,
so I can't say why it moves them. On every boot it pulses the switch's
reset GPIO, sets up the switch, and leaves the GPHY of port N at MDIO
address N + 1, through the PHY_ADDR registers Daniel listed.

GL's own firmware deals with it the same way this series does: its
Linux driver pulses the reset GPIO at boot, and under that firmware
PHY_ADDR_0 to PHY_ADDR_3 read back 0 to 3.

I'm testing the other way now, with the PHYs described at 1 to 3 and no
reset from Linux. If that works on warm and cold boots, this series
isn't needed and I'll drop it. You were also right that 82e2c7db0830
had no place in the cover letter.

pw-bot: cr
