Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615252;
	b=OJndpQCauuea6tOpIoyww1Yz2n/0XchTHN4s0RGorSoCGwfgfrGQMHIBjNmkl0ayMYJn
	 wUkq8byvlW0wI5lETiKfVPhcu8a9j0v5NTaDQ3ncw8XoqfqLV8hnut93YmG0NMV3DMsJw
	 KUtNUxfQaj4f6pBNkCVQBloCnwDIo4tEGMQsIZy1bpHm/u/R9Oj2NFnnMhq12DIcJptAA
	 uxtAW3/70kZhfTqAAWe5yb4aBw/90oZtHvlkQtCmzzXHbbVA18woovaSRDKgTTOe4QvZu
	 87BF5TEoXyyxW5MQmRdElvGyhJ2nZz8Vv2qxrJRhLPz8BcfF1gau4nbbAUJAI5MeE0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=;
	b=4elLyXEoT9ujg3l0ONBXs20PPMxAUb6b073F8/4RQzphCpAhOpQS83HCDyAt3COgPf4k
	 whUZt+kTkb9OuPsfDgofbOJQXIxslhAZmXbLCfduYgZXj+wH3L1VjyG/H4SlqQWnOWnNe
	 S2sd8lQszYHkUH8QGga3CcctKP9pQIwwyNdDo8UpgNd561mf7fUhCnDPH+mVv3ArcYsiG
	 8alI5wXrE/1o9kuioIOoaPy3Wjz41Rzx63M+L5pvKGzphZn83UwTgzxj9M5Nyk8WgBcfH
	 4kjco1Yaei1rvwNh1XdbUvl6D2V+QDCsymGCDDQZiL9WguqBt3uYc75g6DWFqzjXouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEb+fLPU;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47897606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 10:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47897606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BEb+fLPU
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so3280369c88.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793615251; x=1794220051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=;
        b=BEb+fLPUzTXs8LBucqj/UwMC+uzVHcNWZbrWiTqNKRGUaZNyssXUhQ338/8ENkI+nM
         b2oOpPMSgRnhulOnUvSPymbH/aDABL/2NiI+Bl35ClyswuKekrEboftvS5nablmxJBQQ
         hOc2qBGYLFljroD2krlhjqaLUke4k82mEW7zYYTZZaIlw8B55x22L9q0gmFhLUCpZhzh
         NFLqPv917bjAHSfCYlyzYMkTa8S47R++knwXzV4qUmQuNQGSveaCCo4eZ0L7LV94CXMh
         4MWHhSwm9kVC1IOlcKmIwM3keEEKlR+TYPALyUJ0CXHR+LjeGDZhVty2pevwWNi2m0vq
         BxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615251; x=1794220051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tpJcv2Mz75PRvflBvczujUTIalVMwE9SzTvO/85H+Vw=;
        b=B7YUN/FQfSjWI0Hm6GDnEgGKYVz/W8G2HFzm/0SbWl69tPTpbPbTuPGnvy0Yz8QsmV
         uw5t8ZFoptjI95XzDI261MFR2zsXWvvDmXqSuCvDDunW8PsYbi08ziQu11PS6bqcQKz2
         OPoCua6oE8W7YTQ7m2FWQAnAi514juZsPWKVhENVPkLY7Ynaqp3+Zra4kpMnve/m7Yhm
         /2lCcGOan/Lf22RZcLaCbOhPkWNMiMks7SwA6E6M5WCkzR3GnH60VOMMexT7Auy456cX
         +V3wyt785NqrTMRTgdxZXQ5FhXLoJCFtVs90T1/xU74uTOBd6xkd3sNRDQyaSB98yRrf
         gOFw==
X-Forwarded-Encrypted: i=1; AKwUvBwbf0MY4TVZMD0BsCpuUIR10/p6Wwh12+2TnP0f34bjgXlt2hBlHLlmlslRWi6dqg5Ib4bvLeZF95HQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLTyikN3al8wis3ADhoBtE1wuc8ViEA5dGgigkAOW/l6eCc4Efo
	fIJaEjcPYd5nrYYzJ9q2k2q9SlJunGQR+ZT0qt22Xso4FKUNqMZYYGld
X-Gm-Gg: AYBFou1kJDGyX8SSEDhk77cYF85kiCRRO//VeDQQbhCSAxYQKrwcr7/33tjSTx/d4th
	mB4YXVAkhyzjxryz35hg3P/8Hb0ABGPhCn/i2z+cOMIIqBE0+QOJw7ipzVMjexjxbBdmaOLwJHA
	9/GI4XlTidnMKfRrVSiAe0O/ru/9l2u/Y45hmVb0Z9m/RmrMa6mEPxu0byK25aukV+yJ/BUh4Bi
	iI+FnBxjW/28gyW3KITBaZpS3GUX+s32SGFBDLu/V+aC65df0ST8pYZzEjyHzQuNMhtKQ4ASaNO
	l66cp5ujoBFo3Z9O1C2rC/VseGGerZUyNb8b2PphSTAKLilCgJ5b10W+3c9kvXrad83u0K+wN7i
	QNbVPw+HgX3u9WuVFONPcBT3CIwmabEQyWdyi9KtuQmtx8jKbDrYPTqX7NyVL9HmTMo0mJg3pPw
	6EM2+x/oVZca9WH1G6caoGesw9yJHIaaZbgFcVMqbm8mYT0YL7qAvstPL2v5iWAddvF0foDmjN8
	91ttIctcQuJmykMFx9GFqu+zyYvfkDgw9zk7POppVWU/B+dqrh387tuiUZb3OJ8abPx9hbnS/kL
	PfmxAMrGrNTZdXIPYMEbocqj7X35BUkHCnxVG5Pwr0s=
X-Received: by 2002:a05:7022:f409:b0:151:2e62:fe6d with SMTP id a92af1059eb24-1ac5bda5860mr20263781c88.22.1793615250911;
        Mon, 02 Nov 2026 02:27:30 -0800 (PST)
Received: from localhost.localdomain ([14.97.230.66])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm56946724c88.7.2026.11.02.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:27:30 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
X-Google-Original-From: Dinesh kumar v <dinesh.v@adlinktech.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dinesh.v@adlinktech.com>
Subject: [PATCH v2 0/3] Add ADLINK LEC-iMX95 board support
Date: Mon,  2 Nov 2026 15:56:50 +0530
Message-Id: <20261102102653.272056-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102065645.121046-1-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
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

This patch series adds device tree support for the ADLINK LEC-iMX95
module on the I-Pi SMARC Plus carrier board.

The series includes:

 - Add the ADLINK vendor prefix to vendor-prefixes.yaml.

 - Add the ADLINK LEC-iMX95 compatible strings to the Freescale
   i.MX device tree binding.

 - Add the common device tree description for the LEC-iMX95 module.

 - Add the I-Pi SMARC Plus carrier board device tree.

The module device tree describes the onboard peripherals and interfaces,
while the carrier board device tree describes the carrier-specific
hardware connections.

The device tree has been compiled and validated using DT schema checks.

Changes in v2:

 - Add the ADLINK vendor prefix to vendor-prefixes.yaml.

 - Move the ADLINK compatible entry before PHYTEC in alphabetical order.

 - Enable open-drain configuration for LPI2C8 SCL and SDA pins.

Hardware: ADLINK LEC-iMX95
Carrier board: I-Pi SMARC Plus
SoC: NXP i.MX95

Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 237 ++++++++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 414 ++++++++++++++++++
 5 files changed, 660 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1

