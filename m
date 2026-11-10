Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340365;
	b=JtKYbzECigKfM5ShmSYYTFG0OoxY3ptJ3FbLQNERregbmoldlSIlcRJ9f4A19uwfRlXU
	 x/0ypOxLpOGF3ZZrKeGrEo8v2RVx/bdFIIvoW3hrcUd7TgYLXf/gH60ElUIbTDVw+nMN4
	 xmXxUFJsdUg6tOJD8wEohyEJX+unOAoonMokJbx/mao0RRfw/oAqrXmgKVqgi2JdrZci1
	 spwDeZys5OU5F/FFz8xhMeFeZ08hkwEhWXVwXLRrdoDHNv96caeQWtUkpFqha6y3kIf7Z
	 BqnucwyE371BMCQAz74OySupFs/SKYqOpRb5Q/8LpJu9/N9IiisHuu29ta/4fqDkxMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jysfsGSRAYJJWkmbtwBk1tFImXdGDkNw2DYjF9a8f5M=;
	b=JSlS2EwILaP5JOWIYNxHDnoVNFxp4qlcYKh8/MWqTckt/Ehw0VuXs2uasQ8k5xkV7W1V
	 ZjFbbhWnIXKQIFhRYJ2BgmOtrXgbah2iPTdEX0wTyQtZWQhygMPr9bNYZYuZecY67Wxxj
	 mjHxd+lXD7IfBFn9J6ZI/V7fFpA6nEl0i6KRwPyl8jgcEkQmKaiiS9GayOmMmMFeE3Fzy
	 NO9SWJo6e+olE9HnripP0jOjWjSLTLCj0a1cHbWH9P/mGqX8pvva/rTe38NgPXNm6gXh8
	 R2E2udKYxOwm1OruKGEuCQhlJA61nx266rHwYMnjsWIBJslPQXG/xcXU28m6fC/af6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J41g6b6A;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5956606A33D
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5956606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J41g6b6A
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36ecc11bd26so287050eec.3
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794340364; x=1794945164; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jysfsGSRAYJJWkmbtwBk1tFImXdGDkNw2DYjF9a8f5M=;
        b=J41g6b6ATnFGFSDIFPyS0leZ5T4BVLZwsL/PVzgG6oFe4Lu4rpcjZtjq34EF5u+MwR
         e07S3I+Kpqkgfq86S0TKajDGiB/6tl5JkxKbXcbhkleQmd3GwvmkD6LoKuxs/sBqTcQq
         7/YY7KE8+kXBIuWIKfubNByEIQbEXW6qKranAJnXgCtsB+Vignrc68EhpP5RGqWR/L5y
         Ax331Gymw/u7PCEqIV/Y4rtV6OAbWHPdrWkZDUWSrQb9AqZxU6u/gHGh6rdyGDDlQAOs
         9JhASEyYVawuOT+9swaOJwm3FF6AMYp34zg7UWOabD21I5fryMdRerUuLBhxnOKKHrBU
         2xBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794340364; x=1794945164;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jysfsGSRAYJJWkmbtwBk1tFImXdGDkNw2DYjF9a8f5M=;
        b=ZOtvbpOu8J2LaqSqSaxcmdSEtV7VD1awzSrXs9KSSrne6kqiph9Yv73for4+ZaAzIX
         uGP2sGMXTv4WpixZIvSdrXyyxsQzUeS0CsbYOgsqftd7DWnUicArbzoBgEDuO3qvER2h
         J+2G0Wsrlj1fS3A8yr13BuhW2cHOBXA7poy1HX2ZQOmtJdaRGSmIgJu/FZ4WNFeXCyu9
         PrWReKbiGTAAGD72DJp+oYA3K4wiMeEGDy6kALBVkl34rn8cNxpDz7rddpHv1VHeHlOZ
         fc4UGxenz5f64NO7wUxOiOxLKouCHkbdC3apOBDKHTRW0GLXemLu0rR/n+gW/wakpP1U
         s5TQ==
X-Gm-Message-State: APuU4Z8a7i6vwuCj7ch0YeEBQAvDmGFCiQwUOu9QtY38gtIH2dlQTwCt
	w53QZu1A7JqZJkT0KpQXCVRazPD0Hu/bD73/EhrWedVFE7yzb6z4sJdT
X-Gm-Gg: AYBFou2tR1EItbVBCMGo26+5JCvqsaPI31R6ksz+Q0sNLu7LiXcZ9d/7AlFzcXFO/dA
	PeyDbRmYMuAAgcYYFu/lvRk4tuaBktJIpQFrOGeOYipVzJz8RYyquv9CB7t4suTcaYAJyvEwJcF
	WCG+Gllhfvt5nkm5konpBN3ES91qLtX6lWweuA6sVqEtSEiPVJGDR+V0ZEYec9iw2w1ECs+XtgE
	k6p4mZ09gGcnJ6VFpobJ5PMCO/sHjjSiP853NUJhrTcAMvkZssZgVRNlS4iLhUKQzRVbIcbPu2M
	XLtFrFlAzr5Or2ndGFqj34fVpMhgY6ryEGbglRuCySlbo3GsnIAA7JFKCAutEIlOOR7VjD5dv2M
	AFXMPsm7aVhsXd4zRxkQCyj2pG/Tce9zh6Vy01ITMO+tXC29t+epffEvT5FrW7hKbrRBaz9pyun
	4hkCkJjTKFG4n12kABIwq08erBCnYQoO+5wNlWtgQ7aUmPhzJIIgocgc+LM7rBEVn723RMs2So4
	vCJ0wocnNE41xXNfetzgXYT6O3nWotaZN87IZ1vZdf3Ia3BrqpBnA9a7FVfbbUCnGbRFQML02QL
	ytrt/7SX6rSlHYPgtMde6wTxwTDTIW9jCFWr1Ac=
X-Received: by 2002:a05:7301:fd08:b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37684fd500amr475269eec.1.1794340363843;
        Tue, 10 Nov 2026 11:52:43 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881f:d9bc:11f3:620a:3333:518d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm8834225eec.11.2026.11.10.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:52:43 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/7] ARM: dts: ti: omap: fix dtbs_check warnings for omap
 binding
Date: Wed, 11 Nov 2026 01:22:30 +0530
Message-Id: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G+gCRf2KeCgmag5WaUWE4t8NH
 mdgpkLhLFxgaCpkvqXIkRRs28C8xbQyCimDMy5Ya3q8BI89nkhXwUUejMFHskze9R1odWZW/R/
 H6X0/auU/d2EAAAA=
X-Change-ID: 20261109-ti-omap-dts-fix-a63ad1ed3298
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Mark Jackson <mpfj@newflow.co.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, Bhargav Joshi <j.bhargav.u@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794340358; l=1894;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=JZTgm+NyAQpAi5REbf5X2XAtbqDVD0s3mN3VcZz4p1Y=;
 b=VtTLYyyu3BZystPVhH1Xh4HSIZAJMCd+8yfX6elGU3R5B5Z+24iYkUmTvBpidxaCno46xBFTZ
 et0zSJjufCbCNUPvzWK9u8tOeEHNtf3R0MP8TtcwH1vphOKCnzgZhEd
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Several existing in-tree boards and SoM variants were never added to
omap.yaml and two AM335x boards only specify the generic SoC compatible
causing dtbs_check warnings.

Patch 1 adds vendor prefixes "eets" and "newflow".
Patches 2-4 document the missing compatibles to omap.yaml.
Patches 5-7 add board-specific compatibles to am335x-nano.dts and
am335x-pdu001.dts, and remove redundant fallback compatibles from
omap4-panda-es.dts and OMAP3430 devicetrees.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (7):
      dt-bindings: vendor-prefixes: add eets and newflow
      dt-bindings: arm: omap: document missing AM33xx boards and SoMs
      dt-bindings: arm: omap: document BeagleBone family board compatibles
      dt-bindings: arm: omap: document missing OMAP3, AM35, and OMAP5 boards
      ARM: dts: ti: omap: am335x: add board compatibles for nano and pdu001
      ARM: dts: ti: omap: omap4-panda-es: drop redundant fallback compatibles
      ARM: dts: ti: omap: omap3: drop redundant ti,omap34xx compatible

 Documentation/devicetree/bindings/arm/ti/omap.yaml | 107 ++++++++++++++++++++-
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm/boot/dts/ti/omap/am335x-nano.dts          |   2 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3530.dts       |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-ha-lcd.dts         |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-ha.dts             |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3530.dts      |   3 +-
 arch/arm/boot/dts/ti/omap/omap3-thunder.dts        |   3 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts       |   2 +-
 10 files changed, 122 insertions(+), 9 deletions(-)
---
base-commit: 65f4ccf74634be22d5e57d7159d667845e354c42
change-id: 20261109-ti-omap-dts-fix-a63ad1ed3298

Best regards,
-- 
Bhargav

