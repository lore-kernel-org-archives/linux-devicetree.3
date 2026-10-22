Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673495;
	b=W6cBQN9zG4rHkyxKJ7SuaAah2aLQQxdygCLTXGFoTZdTTZ80ceKKx3o8Ee87ubmEpxpu
	 HfDYbQp+rxD2OnbHA95Ay1Zh/aioVltiAQxpA2NjNuM2AVINhEGhpj5CRXY6HB1nZ3ZzK
	 SA7aZ/D5fXgA7U8dLsBuzphSVCA5AbJjw0UsM4lghpgXAUMtIdbNRbFpCLDcX1I54qEY5
	 QGf0GkuTQbZmjegglz7zNqf68ozn3b9x6Y1UNwTgFQuslyv0u5i8AdiGNonPywSDuqdKH
	 f/J7lWPnNudz+QUaFgEwwMUeBTGEQoVsObEnppwN4IP5vpXu/SUeajYY0tdZpDLAGjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
	b=1GtsZDd49ZlVN5fX7XZ7rxrItiQoJtSmqOqJ2HHSns7FARNHLCHqrvq/uBPFjU35uv9C
	 SjxhXNQqWdR6vGerRKy1fqduC1YcGKCUqZK0vEPS82HUcahUSfVq1NPGba1hwOPa+mRVk
	 4In1QwBBKWw7avHPuAHeIwfFt+Z8/LoJEE7bC5p7grpwWREvY8hXp4Nnqlaw/4PRe0Zly
	 vswn7gnEzylBKGZcYxRRorbBDCseHBlOCW4OZDddkhtZBaFygyAYNL4LHZWAM5l16w3yx
	 gs35mhjUGKrQWDnApfWsdMlUBj197W2MDOty7O++ZLE4jAz51SqGrrOUk9GnDqbmb7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jwzX5/Uv";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456AD606A33C
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456AD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jwzX5/Uv
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so10652775e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673494; x=1793278294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
        b=jwzX5/UvcovxAnJbfHqJ0Ou2yQqqGl+TsaNZ8fhJdJLmoSAGhNKrNiofi98bqP4d4+
         4mTtMwl4POKfRjiqmmrc40bYzcRmD1d8i7jFDwxer/Md8BI53CiretADMBhNlgcmqZ/z
         L+xV8dfU+7AztiNRX8wDODbMLW7lwRDRzwLW1z1rTt2p0SLkm4mQ3Uixu44k5my7YrrU
         d70JYW12w/hGMWGIjfLn6BokQseubSp0ro5BUqJT/7vSxTT6QYY3e+U33vfiG3St2wec
         Om/LMV62QeDOCN25880BaIwoxv8iVsGQ/bkTeoWJYU4DumO/bd7RbrvvO68ocfh2dfCZ
         G3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673494; x=1793278294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTIydlDjwaTx3lfLxh8PmRec7L6PCrLK/369X9etdCw=;
        b=gM1qljjv95+l/EhrPSrcXu+cWlCY/iArv/ZHnBokKNbM4hGNEokCcSaUcsjmPDcfGH
         LxyWwcvj+fgOdcmpats1Wk/RQz4QeEfo2ccwhzpAQHz0X2CcKx11eJEf5ppe2dpQUYOv
         V2S9Pt6pukOjxwHKN1ZaqAVf6cWNga1h/vrnyWRy/YX+GJ+eRxHNhMdrsuygbUucJZso
         CY7YsAJwXs3YjtX+dM0GllRpW0/hwAh1qrIJvLANBaJawSp1moaOFEesvxp2AhiGeCW3
         S3PG0UElsqmvW0h8MvoMtEfX397MvCXklS0HZaPFelOqjyOi5c5J1o2sEzz/iMuadFx+
         YCZg==
X-Forwarded-Encrypted: i=1; AKwUvBwX2xqb5nwD940bsHX+Dol6CnBfleH913TipuRyP7bIBCsbM1qYxBv0wlj9agWKvihu2gjn0Hr4rCo3@vger.kernel.org
X-Gm-Message-State: AFq9FYLSWlECG49ywG2TpEQYLvFts54qoD8XH2ShXLf3wjCgUFFffypU
	hd3odJpBcXx2mlQTyvCM3mXkh58cEYEw4LSckqM1BJvxjkWYhAfedL0x
X-Gm-Gg: AYBFou1k1Za9TlHzjcNDvCpouwSsjerxiQjzwAYHitn6F97UShWda8g40COd+ABCMvo
	6PSH97pd9ioc6uhRjgZZ0aIjy+1Y4GeWgV4BGpgOhBngepR7aq5o0taVizH4w5ku//entN4x65v
	TpqCGVp16KlcfTk5XcCx4LNZIAl0mNYfhnohOinqNl0PjA/gY1Fd+CGo8BUbkZsg4EDqFaZbayN
	rmfjtm4T0kAdindZEpCulOyEcAKFujCxkNzAYToeL5eWfWYveHRqzauNV+tOIi+DmuqvoxmbKqm
	//G/ac/kvImP3WqbyTpPBOkFU5ZM6k6adxMblpH/83sdXn3RgZfSlQd0qPjMaHavIrMtw/ne8Dp
	V0iz63DtNEdDoMHZKY78qAQOgeImhccfDuzrzTRDen5Ca3ulHwO6zKZZ8WckHOMLhQCmIhUQF9B
	1XZHJKGsXMzyA557kS7HgAZA8FyMFnIEy3QNUOfeSnBpHYeDMfQKGvVZTKKcuQyopbCF4CW8vQL
	04Q733pJMMq8iCUpnyS1DaoKMIKAGNzNkpwmZeNH2DrdAk2qt/+WQ8kFWJzCaIVvuIkLgCevvAe
	jUQzwI9SjPcWpto9DzBf/OBEYgSELi5/gx06PxqnhZL+iXvVLg+JKXI=
X-Received: by 2002:a05:600c:a110:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a204bb5994mr34273245e9.15.1792673493483;
        Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:33 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:09 +0200
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx9{1,3}-lino: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-5-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the Lino
iMX91 and Lino iMX93 Development Board device trees to provide
ready-to-use DTBs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 18d4ed73eba0..ece4fbd2a904 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -859,10 +859,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
 imx91-11x11-evk-mqs-dtbs += imx91-11x11-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 
 imx91-9x9-qsb-can1-dtbs += imx91-9x9-qsb.dtb imx91-9x9-qsb-can1.dtbo
+imx91-lino-verdin-dev-nau8822-btl-dtbs += imx91-lino-verdin-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx91-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
@@ -907,10 +909,12 @@ imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
 
+imx93-lino-verdin-dev-nau8822-btl-dtbs += imx93-lino-verdin-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jtag.dtbo
 imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
 imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo

-- 
2.43.0

