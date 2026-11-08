Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162498;
	b=Gid5bmEhlsgFisPFvnItGvGgqleqkwIDOObTkAveI/zqjQfF70RZSTQqrvbmJ2Pfp5N5
	 IBlXSzyF15q2NgA0O/mIE2HfCzqK99Ynml3XHYdnbDPal0aQYErIYfBJ3yk8GE5EDKNOE
	 wUayJQXILKAGh2gK28xCVX/U1cfquhCnoWDQUmZrUxfkW3zu5UiKVMZA30zOmQppzxB2d
	 VyLSZ1sjqKENppIPFUO6q+OqsUQ20jOl6XAUTDZZAwvd0DKHVQmZLe6NHUmXbr7bydlfH
	 JltVUjzD18DzJ3prmxi1CqSTLcxZT71eeC9PWB4FQN0Ibp0Fw99l4eA9dpRJH7ghe5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
	b=MqA6sXBAdE56NX3zmx6pNne0QZwj8CGI1RRo53VnlOLf4yy+VxoOskGPhm5gXTfXTtnH
	 uNxmYSqKjwX1v9zx5qDwYSuKh64vVJFmACGRmu7IYj9232zia/qGcLR67VqwWWc5HHbKM
	 v+kUJNCtXoOKTRfC3NTLV0nqXlAnH8EG4JSVGi/xgupXiLhAdxtf5m2RetpsEFnenWLru
	 C/8y35SyIbLfYYE3QSPL1k3nCWihkOB4tNoQzKq5hT9elwaOp4gP1XqTbMi5kvGdO5mMV
	 lKuzk4CtSECO8eEuba+ZdAIueV2JQas7rsqDblnOUWHl9MWO7v1Cjo2nze0UWbnuEmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggr9Rhlc;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC8606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 18:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54EC8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggr9Rhlc
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso28728066b.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 10:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162497; x=1794767297; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=ggr9RhlcaiP+4+478edoxac3okADJCWVpY1iF+8Xi5P9iILzqZDSOzhI4/j1dUXf7A
         Jctj2AVSxth9HClE/DggW0jSecx7Yz8ZmTM7KUpMMUDDpmC0275rfQIaLJ5lRuofLCLF
         H4UhKM4GoX5hCSpZCF6jUg4XEgOaVUC3y5Psfxhq2WC7RYcqp/Q5kNi0JjfJOGxKxdjC
         MtGrkJexY+vEo91JqlQFNy2gr2eaUSS0c8dBb6rCSPXlvSXzMyH2Zk3+Ww5oZQaocrok
         zRSGfzgSJr0F4bHYIf+leTAumLKRgGr9JkI7dRARp3w5ATvZKwSx179h+Mtn8q7+d07K
         seyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162497; x=1794767297;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7LOc5o/iR4ccdtew0ZugkEGQ7ajVcmy8+3GKA8lPx8c=;
        b=TrvEszKjuIlazX0x2adE704F2gBkjUb8wUkpdk/IY3pg4GKMxzrDzVZE91IyxK3qMq
         xll3wbm0nBWdGUYOQVe9J2pSY4JfGV44lCV2K+uREZwXTnDW/GQsIlbs3l59rZ+yEChN
         JxvL9d4GI+Ehihmonq1yYCK1unG+I4S5mBdOOhr4l0Q/iGzq1tkSCKa5ZIQ5hsq2fYer
         7QOAjgxJ/IX/IOf0MeQJ3QQbauI3BNlMgBkmcZx4cA441YNIf/gilcpp/f6S2220Gyq7
         v9AeYU+O/AGwFc/TBGBL3gqLfnmE4N+yYR6sz/08x37o5CRw2MW73jio91VfvT+y+OIG
         0U9w==
X-Forwarded-Encrypted: i=1; AL+hErEWwjNTIxkvw95MomsLtdr2dUC98FKoCaCXwchYCwFkuB+At6MQGo0vld/gstN3T3+wzOK8ty9p4wWi@vger.kernel.org
X-Gm-Message-State: APuU4Z/d0hfiBhVqyhiL9W0DTCECRYPM8UAHU2ak2REKuWO3tltQiJTG
	IpG4S8W7QfpeI1gthVi0S4PurNXP/70sWmWGm6X0MDMnMkRSKLUoik++
X-Gm-Gg: AYBFou3eozbupPx915MX+Mn+8UrDsHMwOmmK1ziT91sxSzBIcqQQkIhu2F2I2wwS0MC
	O1MY0y+fBl1vvCY0bbeSrVB4krPLzXtP/2tuQDqiuBQx4r1rkrT9FnbZHh9zlsdv+9Ylc5aGalM
	Ey+rXHuPtOajZctmpa8SLVG1TrGLF2l2lnmVuvRyQZfnhF+c4iMjvuSlLziXn7kx8s1FlvdnZ2g
	atNRYpTexQI1o4Xek1uVpyzWFdXyGEdkmFw+4anfXDmsBMy0lndocdwjqpd8Aj2z0i03T/R61mf
	tGOYwYkwXCIaCM2atg2ZJ0q4BRKoDGm3X13vtrqAIrRR4FCGszGvfesVT3v4/HIL1bkPMHbKoO8
	ekCicHekQryqCBsV2mimyIGeRX0qRPhpmaawie5s8qMHyot1dQtlJZkQPKCSS99L7tyG49ySknS
	8evajARGtIe4+0UYTqQSKToMKTV1js45gfuDh6/Jocu8cRH55zqYAkDpn+YjivjnyjzC9sR+XnR
	HlLKA/PxHk2dayIXNScpmvS9cYA9282qJiM9w96YeCjEdw7rrSm8YfCv3jYANn62N4NZ3WFepE7
	tmmGXHFcAVcZmMy0kILKXxqFLsqZJIGQ1oEaMkLK+IqvDx5k0dyMX9S1Pm0QYly3
X-Received: by 2002:a17:906:9f90:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c4d6d35bdb4mr141902266b.14.1794162496378;
        Sun, 08 Nov 2026 10:28:16 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a47515dsm75254366b.44.2026.11.08.10.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:28:15 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH 0/2] pinctrl: mediatek: Add MT6895 support
Date: Sun, 08 Nov 2026 21:27:09 +0300
Message-Id: <20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWUsCE6XoVYwLpUM7RtEANk2Md
 y/V5Vv8f0CkwBShLQ4I9OHIq89QZQH2PfgXCX5mA0rUSkkjNvY2hVksSZumFqYyiCgfrhos5Gg
 L5Ph7Dbv+dtzHiWz6X+A8fw6MQLJyAAAA
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node will be sent with the next
version of the MT6895 / Xiaomi Poco X4 GT initial support series.

The tables come from the MediaTek driver in the Xiaomi kernel source
release [1]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261102: pinmux,
pin configuration, GPIO and EINT.

[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5
---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1617 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4573 insertions(+)
---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

