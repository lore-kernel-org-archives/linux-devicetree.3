Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035171;
	b=VL8jQo0kSOVxHNxZgIaqF7Cms6jn3HqBIS6gQE18ObRZ7Wt9uedykctxo//Al5eNjvW6
	 YHC9DbQDjtllo8V1uzTkWNnuBuW06LlWsgen8Kso2RvsVlaM/1QZYq5pxpY/sP2P2kGEc
	 Rdhs4oMiMC4fWH92R3+voSeZ8pHhrXvF6pMcloaaqzr5rRMO4LwpF7qx0rfczuIUk9r20
	 CB7vMtKQlFa+mVeLDUgT+y8FYjiJm2+5exGY9U6o8vO+kN1JdqArc5mADVDKfXlt1SBDq
	 Og7QbRE63p3tuRxDKafZatqUIHMpab6WtjG6SuERN+nNEwqaE/coJ1QPv+IEiq+Oz4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
	b=y8dt9oNVIWZFuO3/YvAUsRVKTLAvZrDlTfGZNTTsWiTsCZiYaWV0fpj29iSwKvBXwfZy
	 M34bdkrVHIT6k9g9bW0xHKFH06Taa1yTbJoEQPixe4Y7pYepZbKg+3n2GKAIjZKIFSzoH
	 ZKThGUet+C7SF6NLy2gz9DqyntYrvZ4vo5Ng3uYMxlM6Yv1pw0hXwjdBfUks/AUjtT/o7
	 WJEJE9pgmvE8azKW+Tc1EmS07MZCRHVSMqjzbSurbY8n0mKqufzVeLxOB96HDwlbPoqZ6
	 xQNMUmcZr62RHZhCLhbcLMJNbNfSOqUdBTHmGonY8jo+9Ay+pYYIymxUUa0VEYBhToA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlxGHW+k;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E795606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E795606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlxGHW+k
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50dd1e2f11so233074466b.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035169; x=1795639969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
        b=jlxGHW+kRyHFaEMpeXR4BNALXPsNplbIhzII6rNliHUbcX6NmABOnQ8XTqgppKQz/0
         jnpx4OD9SPT6Kr4gK+6e7zltezYlXyxXT2NfU5Odo31hxeQDHI1/oRoHWTSOtpxIboeQ
         FH3N84C6KLj2Igb3KbWBC2z49+iRGJvp0vB6BJ0/VWt5XCdgR97RAz5PXJN+PoywAORY
         xte54o9ByrMsQ2uilazjjngyPJdALuFEoOaJiHVqDv/lnXYuJF66BDqjNusCCR1GMXJe
         eOgd9Vlih01Qr/4o+siFo0v2a4oF4APKzmmYHrhLbqFeAgDBI043ZSqUkY6x4nruS+yR
         J75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035169; x=1795639969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5MhG98OmxdXqTOc5Xluyx99XKwhYZJ2KKliQ9c2OkM=;
        b=fKs5btzYie8Bq4qqeIBmGWE6EpKzT+72zQD0NsU5YYWX0Ai94mwNf6Qhw7MNuJSldu
         T6DKx7wZzzaVG57CWtLokAmUGzwY+BpMIf1WlS/N78lX2ir3MHM8wYDMXwJPH9+R4iUw
         MtXNTIJlmTxj6OKCZDXLnjQmCrFocj7jpBcy1TcCw9VWmj9P2fWs6eE5hRqF6e31Lxy2
         e0mK/7FLgljl9tU9dpBHElF0yYTZn+AHfQT2bzjsHvv7WdeF7gCuco7yLs5KZ3h/ocT6
         CVTThCoFeMbyNT2usZXd5t3YTiLgUm2FUCK6Uy+n7RvFEVK4fCzxgYm0ls5BlLtIx6ZV
         uIuA==
X-Forwarded-Encrypted: i=1; AL+hErEfQEqkzmE1hFcct9KYe8Ct+hbAlYFgwIsRTQnrQNRSzPhLCq25kX6/1gciPkb4/OfvOP2bGT2Ke0yc@vger.kernel.org
X-Gm-Message-State: APuU4Z+GAlWQixLomDujxtdJGEJEkQzL8kgDCUqqAYeBlY1RkQWVw8vR
	101tIHiqoM91nKyottLUfWALtzLBAH0jvyWlvi2x6uKm0D3hvwuEASFR
X-Gm-Gg: AYBFou2tRbklgogs/KQ4x6xJfoR5Ua/RJiaIAh9NUq1D+KWm/YjeM8T+UPvntW0rCAL
	+sEiHQbDR9uMzb7rx0JerOyNZsoClVARDxBRtXAL91bjRCnvxVPwFnP4lq2GgCRQkVcq5x3EVqJ
	Gm3uKlhJOyA4dZTIeQ8CS3zSOQf3oajtNt/M8P8C7Y593WMqTOrVsU7yyjbXvGy2UgvcQzjqZbb
	g+rVSkzR7t46t7n52xs2l1R+hkX/S3ucOMQTWvAK2PRQ5u7WYGqt4wVr/UAjRyDWcY2Ik+rH0wo
	wzVWaULJPNaeUEBtG6xKcIG7lYW64oFK460hocVpZyri5B4plw1x1bb/XUy9887v+tbelzqqfMf
	bS4jK5XHBamDPSg5X6vUQfFNCRuyaLqbhKhXQbKNNLtH2otR4UT5NpDqdabsRnBBQr0IUTeuqrL
	BNQcUAghqeFs3FT7cfXOU6vfU0mPosNAqGDtN4X/3DOPPbzaMFIh//8m3gwnosf3dSKFWmPhFxU
	AtMF5w7INZ4ICVnvBGp693LUYArYs7emHl2u3RyBs/82jWJv3lvgjZSajR3Q78S8/q37vZeV53g
	o4louzyT5LvBcHIoBw2gpH3ntLRMm0xW1z/VxpBnf1s58ARLv+DdqXheCYtPPOJ53JSXNBIoCu9
	C/t7pHp4=
X-Received: by 2002:a17:907:1ca6:b0:c50:ac4e:3770 with SMTP id a640c23a62f3a-c510e516a2dmr391250066b.34.1795035168876;
        Wed, 18 Nov 2026 12:52:48 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5123421612sm35303166b.41.2026.11.18.12.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:52:48 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v2 0/4] i2c: omap: add support for DMA
Date: Wed, 18 Nov 2026 21:52:03 +0100
Message-ID: <20261118205213.88778-1-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Hello,
This patchset introduces support for the TX & RX DMA transfers in the
am335x/omap I2C controller. I tested this implementation on AM335x 
(Beaglebone Black) and things seem to work fine.
Also, I noticed some unused arguments in the receive/transmit_data()
functions, so I added a small cleanup patch.

Kind regards,
Antoni Pokusinski
---
Changes since v1:
* new patch "i2c: omap: remove unused is_rdr and is_xdr ..."
* probe: added `goto err_dma_free` instead of `return`
         in the case of failed `i2c_add_numbered_adapter()`
* changes in XRDY/RRDY, XDR/RDR interrupts management:
  - init: do not enable the above-mentioned intrerupts
  - xfer_msg: enable the interrupts before any non-DMA transfer
  - xfer_msg: disable the interrupts after any non-DMA transfer
* xfer_msg: added checks on `omap->cmd_err` to catch
            NACK or AL error occured during DMA transfers
* general: moved scheme-related macros to the top of the file

Antoni Pokusinski (4):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: remove unused is_rdr and is_xdr function arguments
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 363 ++++++++++++++++--
 3 files changed, 350 insertions(+), 29 deletions(-)

-- 
2.56.1

