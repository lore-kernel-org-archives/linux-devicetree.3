Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834344;
	b=VPEy2Y4lbvbBkKWqI/19HXg3kyzKexAKSDWUUVnk3bG+AC8zQ8lRF8K4Hec+qgzjaUk9
	 Ln5Hsqbn9ejtu+7NV+PEVX7KIratzArlbIpMYd1Qd9Nqwoz0mw9YakF1DwFR+VsA/+lb1
	 TQ1MoJB1aOBkvLwyX8LKmxt56+33t+sABNKvdzKm38PouEfi0CL/5gDZ/78K2Gn4oYhS3
	 /pBZEpoF5RUcrPNe1txoko7DIZZiUuZFt1MLlhMRR82URBGYkiIyh4kw80vK9wk5x5z/+
	 UtiZtJX+nJrhHgAoQw1UgBzDHB37x6U3TYwkFDe+DNdr6yTbFonF7RKGS0xjlV0HuMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=;
	b=nG5+dTaDpmN4gX9fnS1M1Un3MvFRJQPtzTSTPYVDllzYMaFU3+F08/sZSSloyXONaywv
	 kJPU5TQw4VmlYzMvm0e9mDWAC5fAMjgn2XB0MYjl/7wnUh3V3wx2MOqqztLcQ4BuoEsPg
	 HefKH5bP3FkFpCu3X7WQpn2GfBALR3CGHgLWpKRi7kZL+EwWpKtn9KZr+pTZH4mnDzoKC
	 vWpuh5x9oX/Yc2u1Ju2z2CZVpNelmB9myBueObz4fHN3O9eANWbC/mbsMakNWHQDW7pgx
	 XlSyRyX29ZxWT8E6aGbNWPxtvJvBqQEcBAFKR13+VNTTKhQOl3yzDaOoYJhlhe+p3yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mhArWIqP;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A1606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 02:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mhArWIqP
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so3721282a91.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834342; x=1796439142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=;
        b=mhArWIqPAtS653laJpbY/tNapW2MShDLJBCorKtZTTt36NHJxjsRTwj+xIqyA1LIQ6
         MJkBCsVOkaVALr30gpRTNPvugMNxKYHWWVLZwWgiZIaZgVHvg7vnp71u7Q4CxRCxHzeW
         T4svnpRyZu+gzFZARffiBWvmH7q48gfVe2ZjQTOCdXAccPEmyj3XDX6mZ0djDGNatPfK
         U03/YuOli3MdDlLdS0E9CPle0Yt4PQAiebEYGGgSBdMufqaN9sOZO24eKapqdBkM6Aid
         MvmJqG2FulkmfPgh0qirXoiXQeRZ0neceLwPvlXH8BzZhnwUvLyBGPrRkpcEbihPuSly
         dplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834342; x=1796439142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q/OKruXLAn2hfDxhFwrAwBRikQ31x+YeeUeY/2L4yVU=;
        b=xCWqY+EEfKJjouSFP6HxGkrxZnFHUiGbHVQ903F9MavnbBtS7FGu8LTm32nxvpN8BT
         EOaDkWGBxxLadAZ+RNMtcDNi+gOyDFyEEgqW9PMnMqGUwh20BoBu5wC56qgexjXMwQZn
         HfFfhZxwS+tSYDqB8H4aercEjs6Q98gqDFGcTnFJjhrEJENxae7eZJAg5X3/c/azy6gv
         Cc5U7pIwctnNKJ2ekoFfrQ5YS9MEQ5KSygq4CO2c+/rIR1ohvVBa6eX7WJZQWNL2ZdPR
         Yu0VNEni48KUPNwA3hd3zaxKB2PGAPUosa8dP3qSVSq73ivXbb/AOESvqil2h2Gmcvyg
         JoLA==
X-Forwarded-Encrypted: i=1; AL+hErGsnEEBlu4DpMFBmqxLk6oHvG7gEQiJK6os7TMmXJKgUWxLBkopBhAXAfUhQ4eqKDaj+Xd/Ve3a14b8@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sd8jCQRl8ITEAwWMNpv4e5tCvBkg3oHhlgyhWB8ogyKL28ogv
	hVxU/rl+zgKqddMxjz8GRen1j4UzLfDY7lU5kkx82esS+9azYPIDIivKXKOVKh3FNCU=
X-Gm-Gg: AZFdTZcsgxd3GQcrNtPjlKidDdktCkmA40iwCDHPZtFRtG/ROncKHdeXQPkJefnCtoA
	J2NDY3k7uWFK/8U/Y043jPPniZO0ZfAhw5K2MmSOGinvA0ZLrdEJwaMlLE41ysz16Dp7vWXHJIz
	tjkstuEWb/i+2VkBvvITUqSkJjeceAjsQmFvdSHTjVIF4ROD0Zk+S5BwSAdCuKGk+D5wbTrdGqQ
	mnFR+XkKTt2CVNka7Nao+hp57tYgI+QSNJoowwwv2Hb3d9JhM2pinC1K26T1SovZNJMnKLHgFRt
	zff0G8gHjspbq4iFu2d/tlWTsZ5bX7My/QrOYOigorWYCsWMp47iOKUmRbC63x1A1aokv9Nfpub
	r14Rjpe5xIE0UoDE5YPWd7EV6Ia3NpZEEMLkAf+W4DOPcZy2FgAT0KQLWy2MhS+IhQ0dG8QpAld
	TOHoyo8YLXhwTExVsHYMus6IzyJ1tpWxyJlkbZ0P/isIz+NHn0ELfdwUKsgXf8679n8ta9d50/i
	UL9AEHVCraDQL8gj7ogv6CS0EYYjnPPBi2jMalBsmjogqT7tF8j/Z1qEdGHYmSu+sVOMzPF7nk4
	vQQBpDT34aLks44CnnlZJ94VQIRY2fZzmOgVV7fJSz/y6WMgZoM5BRv61ZLpOtYDs7tNJsWWGj+
	xHzDLOn0gpbVw2g==
X-Received: by 2002:a17:90b:3c11:b0:3b4:f92:adec with SMTP id 98e67ed59e1d1-3b41cb20ec3mr25787093a91.56.1795834342067;
        Fri, 27 Nov 2026 18:52:22 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm43492174a91.17.2026.11.27.18.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:21 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH 0/2] ARM: dts: nuvoton: npcm7xx: Fix PECI reg offset and wire watchdog sysgcr
Date: Sat, 28 Nov 2026 02:52:17 +0000
Message-ID: <20261128025219.2679805-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Two fixes for nuvoton-common-npcm7xx.dtsi found while bringing up Linux
7.3 on an NPCM730 BMC:

1. The peci node under /ahb/apb uses an absolute address (0xf0100000)
   instead of an APB-relative offset (0x100000), failing address
   translation and causing peci-npcm to fail probe with -EINVAL.
2. watchdog0..2 omit nuvoton,sysgcr = <&gcr>, causing npcm_wdt to warn
   that reset status is not supported since commit 7762911c0d8c.

Both patches were tested on NPCM730 hardware and verified with dtc on
nuvoton-npcm750-evb.dts and nuvoton-npcm730-gsj.dts.

William A. Kennington III (2):
  ARM: dts: nuvoton: npcm7xx: Fix PECI controller reg offset in APB
  ARM: dts: nuvoton: npcm7xx: Add nuvoton,sysgcr to watchdog nodes

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

