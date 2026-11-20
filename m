Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201189;
	b=dXA4fBMSHiN74Xd7e8jAOmz54P8k90GV89+yiB3UrT+MJg3BRFxBLVsDsfckiPeHG9Bn
	 3vhBCeTMh506J7Lx42LYSTF2Zbuy+Mr2KC5gv5jxEeX+ZH8CMD3D7OBZrWa0GniGYrz2d
	 GRxBLzgmIc/fWPtH5NS6Lp9GSC5VirXXT8lOHCmRM1rDPq+FWXqZ9O3Tlq8kxLD4DSOba
	 zq29yilklOZRAMSBdQ7/GqfejO26f591A5qyOBz6pgCAPgr1XBXWkxtvbertsZ39Owi0B
	 arIQ2HxrKZtJ+pzGRFmbvNfyKdR+gvSb6MT95C8ELlQ3TeUCL8k0UvKDgokAVKYEQbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
	b=VvRFXGVKTSQSwttGJ3FLJSnKnuJglEw6nhblKTvwaXxjPT02TLzvudguSBbCJHZR1NVj
	 9I7pGA6A2WIQhRZ1fEswfULVFmvjrg87QOA3tK7evPwNyXHXu3mFdIasClCFewyjVn7Nf
	 W+UI1KkxQ2ZgbnKT5dJnZb0P0lPsRgcXoDxiYPusPKkzBEf36V/+kRV8mUq+HVoMC0HV+
	 y44ZzBZavm9CxFzoCOAPiI3drScoClbKWjSunSkCIPCqDgovy5ZwjbOa8UHKiPmCJpE1O
	 LHneqXJ8xLg7Zqtgy2wteadTeHOoyOEZLdQhiFxLlMv1xYXwq+s0n+kK8tXH7nJrv3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZwJ3I/gf";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDA360A2631
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CDA360A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwJ3I/gf
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so492711266b.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201186; x=1795805986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
        b=ZwJ3I/gfafwZiWA5aZDcO+609t3J7/x+kBEjaZHwXFdrLDUlZmBT8ZKqFYEwEX7Ob8
         ykNW7FobzosPR+C6Sz0Fdw5qJiQq/GIeyyFcKZxvMxXR+Mka6M74WbVWT45oTZIUatIV
         8qtng2vGdvk7OiLUYXL9BKQD8WEfaxScKpXsHREyR1kMEYzXCPF0d4vlUq426eD23JQO
         UtO4CDbwI/qfXZaOZoj9CxO3BVYjizp3+kddEc0R8JHtenCT8+yKt+elCXEWaNirbrEE
         03HYg0t7D/tzdeAPq1IF2ALgqzNFdFwBod+xSdSg0rTQRrJPksXrmsInAitjjot9hPYn
         cC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201186; x=1795805986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+xG+koXTgpyKRztQQCKLUQgqoHofBaalUCYpzlKwFk=;
        b=WybWpTPYg4I+aTOBDwrVhMKuENvSCPxFCu2QtZvvg00k4oU69Hq97WfmJpDz9V/Qoc
         Ka9z0FaDb9hSW0PkeuPJD0L2jXUMqj6Yz1RgDZIWsqISpQUv9b+z4CL3V/7XqilZiL/7
         QZNNmDWpnZkAIVPw1DSQs07rMFzPpgYlJZfvl9VpchvFKCzwiImHqx+wmDInIvPvEIzx
         hZd4TWfT9t1HzomxEiRhx69fUB8sArM+HqSa6P373+dn1sKDqp6wYy+70bx9QWxp4yxL
         WV72DrePQHW67BxOqLRLSVleO6hdBq1dHpHh3WuQyOnnAT2nDpwM4fZ2tydXEONUhc2F
         FcfA==
X-Forwarded-Encrypted: i=1; AL+hErG8x+WloSzZ0ocH+GmoTeMcZ/hDRzFgF8OF9AAFFRxPW0Hmbq9vL6waKESD9yWYE22Dr3hjE3e9hA2h@vger.kernel.org
X-Gm-Message-State: APuU4Z/ezbMa3xlZk3Ul1YNnFi6harqACAezWIy+wpTgrqs+iCfjvrsa
	pOAC1HA+Y7TbSrX3zK4j1OXa6ZQxmKBIizBq4PDB7PM+beE4pe7w0qQr
X-Gm-Gg: AYBFou0nUANmSeh/vr0XBfpwIeelo23XncZAJiz0xXhJyTVFdpNoDwLKw4aaLeMJqJA
	ZPvegqrcAfji0vJ4ztKIkvA5noKRb65ZWsRmn4jyWc64ioEJDV49Btmd3gxEaiRLigPesKzKLC0
	zgXgLfZrXsFLURQBk6xpSEMvYZv/c2mx37tEGiFQcPFYfEMU9lpHIg+hdMpLmMEDjv7+/U6eAN7
	KDOcNvJfownzbbAvQOE9CHpdZqeEiUSWSbHp7gjIhRqAb41bX01iI3blvKbhYcPe4hWjU9iMjJk
	91S5Mcr4F3tSt5qn3Jv5F+lJ3Ma+e8CLFQeZ2WQIbUlAzU84n5qJUwgtLxxCKxIqceCvP8WvQIF
	2P31TFKjSbBe19hTgpuXbtp8/k+Uh9EbZFrJYISU9jCt6JpLDC+GYAZHKuMPZc96Dj2NmSK8P0e
	TL4gejUW6BDcpmsflf8tzOCbPE9d038VQ/KEyWs9Nmr7yCl+y0YmHTNDCoL2Zn1FCP962cyLyaH
	DVLBcEtpQD15s+z/I/xwNvUv7SaxYVkMfCng7TV+iNU44dqMnz5lByQvdJuR1QK0bQQa/p3XffG
	tGJpexXY72d6rSs7OvopOJvfD69biRkfA9DEFJZSF6loKcFF6Z8G8JHwYGbbgtw=
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr565365066b.28.1795201186217;
        Fri, 20 Nov 2026 10:59:46 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:45 -0800 (PST)
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
Subject: [PATCH v3 0/3] i2c: omap: add support for DMA
Date: Fri, 20 Nov 2026 19:59:10 +0100
Message-ID: <20261120185915.150228-1-apokusinski01@gmail.com>
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

Kind regards,
Antoni Pokusinski

---
Changes since v2:
* dropped patch "i2c: omap: remove unused is_rdr and is_xdr function arguments"
* added `omap_i2c_disable/enable_pio_irqs()` helper functions
* probe: added `if (omap->dma)` before the DMA free
* xfer_data: signal DMA completion in the case of NACK interrupt
* complete_cmd: signal DMA completion in the case of bus error (e.g. AL)
* xfer_msg: removed incorrect checks `if (!omap->cmd_err)`
* xfer_msg: added handling of DMA/IRQ cleanup in the `b_hw && stop` path

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

Antoni Pokusinski (3):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 373 +++++++++++++++++-
 3 files changed, 368 insertions(+), 21 deletions(-)

-- 
2.56.1

