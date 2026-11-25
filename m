Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604747;
	b=VhA/nzmdJcQ8tn3tgG78M864BclBEhQnRMOXRRY80BqwXFUeZxMR2YbGDoaaGF2tjIe5
	 4VsQ3sOvUmTPXgXmtG+yNrXVSpyrC0YjxBBaDDlmX+D+gWgDrHQEPLI6DDWEDjI2sSNrw
	 p/xuz49V+oJyzFHmgz2l0lrE4YVOtRaX4A+O0FnWAYkXQCzaIntlnhfUeLMe1UY3dhUHc
	 lcbmTZlq0Mje2b+W//SCLUCjMh9hwHUb4vk9Q6JimWd/KIVKmYcYzxqxeN2aBn+nneZZq
	 xcvBOPl1AnMTedLJiqgbB/mAqU4BYPCp6DOxyHcTQLTm4zOQL2bVOgPxYOROwp8Ys1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604747;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
	b=xTerDPKCpWSJFZq0jWI55pRnerFFwPXCem5I0KgRA2kOH967Sk60zsxlfMmmFYBTVRjC
	 FNPuG29hwkznU5ctFKGS5EpFh9sS/FkmL6wZBZu5SUo06SSjj9KzbHIXWQAZzim9f4JPH
	 blWXzRQhLNW4zffEO1l7Ht9C+0I7HtnxEmJNlHNSn9/AILo8GOpq4QxkRO+Fu6TFMODfA
	 MNkkUmF6jNRo2twYHcgrwNniybeXXo7SnGwODmOdXa8LV3K+6dnfKIAEw3WYwkK35yYGe
	 hgkvhSuJeeXiy56WPq17idvVa6Mj8s6DGl3cfnjxWE238Stcg8iUaih8KxyjoebSwfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D15XaFpv;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF56606A329
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF56606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D15XaFpv
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so55483685e9.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604744; x=1796209544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
        b=D15XaFpvj6mJXEZ/XxMEq5qJWi7OtVz2OlvvM9hxJvWG2UVk7/p/hILZOySB5hHBnN
         Uieoz1bX37JH290ixjaD1fEBpdRP9bzpyc/QgdLvdxPIwWsg5pcKxvFxRmCUm+Iw53LF
         tfN5NX9VpW2T+uGUml039axpKqrst45Pw0se05jw1q7UEGRrkrdHo0avBA4LuScZUqCG
         wZ/nNryEUT/HgOdfxHRMtjEUjEUwttW+Tq1ft6Wm7QZ8+k33nv2XvHU+PIvvASQoHh1P
         7splO423sL/0HvAQxvgp+Mj5V3fO/KumA+6EJa5LdXQedr1Ye9OjoatPzQSfJkhMPCMk
         40Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604744; x=1796209544;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OPDvf4SUkuKOMrhgiVRjuWrz2umiGud9bUVpsZeAnuk=;
        b=nx0y3OItQ8PVHewO16HiazQYv2fy7x96QZVVHrHFQ88GCB+yZjljQwkYUHrVzX3NJm
         lcDDKN6YOEvaLyyvloBeoe3nQlZgKZpUwh73TLfnTSAxK4dau3mG9q/1C8LWCQEangxg
         VY7yrD3pvIXx0RoSFEaFGzXf/nBBaT8wg4jmwnlDkxJy3PO+ZBy1tL6pA1br8RMJePEF
         LOdb7PWez28NmsEPkZojgZkcMMcYlIa5QzlGFdveI9FSAAPfuqcgtYIsEf1cSIbzmpwi
         kxSHDNzNadhJOSDEKVA9X/A0rUPTVKR2Q8lRgF17fXXdu5vwWH1+jGuB53JX238gGm5u
         dj8Q==
X-Forwarded-Encrypted: i=1; AL+hErFmWCvSGK7SBaIW+biZiD5y8XqOCFu0aqe7pSdGKKQRKd8X+7jS6UMfzvM4smlyAwXxy3LCsmPSee8G@vger.kernel.org
X-Gm-Message-State: APuU4Z8na+MagqHwOc5AmFOzqT26mM5XT8IAcrj6NcmD3e+VGlR898GI
	uVQI/9BDDva40cd5aMBp661Eq0sHcnL9Mm8RGZTXKs9Ec6zPkMgYVNLD
X-Gm-Gg: AZFdTZfOV5xN0Y6YkHPmyxzLkQhCA2tfQWTTh6uBb4gZ2Ex6y6hi/91NyIWQvY6qEtK
	GUDNUBw/7uFMxnICVRp4eNpI/aF015JtW9Lo66+bMBYLAcXx/5oRLtSj1XnagCLk8Kso9zoZ49M
	YmRf5AOtgYqN8122iPltNPs+yCoOxiAL+UGRiU8Z9X5iDVNDYZL4aD72Z+1BbVuv4l/f0SdXOLJ
	vCEUTgD2xvRYtdw1HrEvXtspsN1PdaQkzsIVbl8bEzfST4YrqdmOG+eoyTNmSfWv4GHgVjSGxps
	E8lD3AWs4qOnHilHeSRljR82UKz/q7gENF6Rqd8ouxVAlQJb4wYPulTsxcj3Kv5ZUwNxVfbKiRC
	TpOVfUE1w05m/mSNyOUoBzPj/2Rk6pPIJlO9DjQqFNJNdYa/TBfnh1JKq/5KR2p4qxBiIRxy2FL
	7egH49aqL7PXqF/0l76Hq1EqK+hscJuIBrt/DkxNMU5tuu6ZKVULlMb8cO9wU6pPbNUvOPqaE4T
	j1j9MRNj5uAAd7EErpKMJyoKmXBtLbJWpJjcelTBAQ5aUMZ5/ID8PvUAWszm3DIjbLzZ4Dr1/iQ
	BTY+oQwHmr8qWczfzj9HTkEDOHmS7U/jbPCWSBZwZpmhAMRIaBZbIEHz88jKdsP8
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr338366475e9.9.1795604744528;
        Wed, 25 Nov 2026 03:05:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:2e3:78df:210d:93ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm201583575e9.0.2026.11.25.03.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:05:44 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v9 0/4] Enable USB2.0 and TSU on RZ/G3L SMARC EVK
Date: Wed, 25 Nov 2026 11:05:41 +0000
Message-Id: <20261125-usb_rzg3l-v9-0-ea14d3ab8a53@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAAXBBmsC/23MSw6CMBSF4a2QO7akrUiKI/ZhiOnjAk2Ukl5tV
 NK9Wxk7/E9Ovg0Io0eCc7VBxOTJh6VEd6jAznqZkHlXGiSXrRC8YU8y1/iZjjcm2hFP1iqtpIP
 yXyOO/rVbl6H07OkR4nunk/qt/5SkGGfaCN7ZxjjBVW/WOuKCpKm24Q5DzvkLN8YweacAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795604743; l=1502;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=26F0Gx6SkwUZ7Oiw0xv/NVjSYSUNBgnf2u1Ptjdfq1I=;
 b=PU/eeRLOBV8z8P/k4LIfDNeyIJdOHSL+KZFuDaXI6aRHtwChs7ypp18+Nu/TAu5+Yy3IyL4u3
 Md2YnKyM/xVCDm350K7G64Nn4lwBOs6wCCHBMDUhkvAUAZ3fZ1RQGLc
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

Hi all,

This patch series aims to enable USB2.0 Host/Function and
TSU on RZ/G3L SMARC EVK.

This patch series is based on top of [1]
[1] https://lore.kernel.org/all/20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com/T/#t

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v9:
- Restored usb1_pins to fix over-current condition during boot.
- Link to v8: https://lore.kernel.org/r/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com

Changes in v8:
- Moved patches from [1] and [2]
- Replaced place holders.
- Updated commit header.
- Dropped redundant nodes from board dts as it is defined in common
  board dtsi
- Dropped usb1_pins.

[1] https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260925061617.127349-1-biju.das.jz@bp.renesas.com/

---
Biju Das (4):
      arm64: dts: renesas: r9a08g046: Enable TSU
      arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
      arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 193 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  49 +++---
 2 files changed, 217 insertions(+), 25 deletions(-)
---
base-commit: b086ce5618932e5ee2a0fd5fc759f70ba41ee1b9
change-id: 20261104-usb_rzg3l-16fe5cc8a82d

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

