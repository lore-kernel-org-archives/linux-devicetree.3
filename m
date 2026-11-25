Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632499;
	b=AkDDxlU1tXCKQVsI8ecnLmkstZoVfifhPCclBfWKGoW/snbMY3YV6o+iOPO3YWO+ZhRe
	 Bkvd0GFKXIweh+p2rAOp+eCB9VCCfjjVqsbyPOnAYGz4N1SBC5VvH3OFjY0RqOqE140Be
	 gcwpuvLnJX3idmOahpDYhGpbdcgyiZt4AUsivTVi3ZDAQvOI2Hgl6eq5MdOAQ3fkDhZ2F
	 FgKpNXehFpNWtRAHGtg6lz2AjW9m4v6NI6eEvOJu7IMclcSC4rFkA+1V7373b4RtaPjdT
	 ph8AXHB/Uj9LpbD1bHh1+eFEgxRB6zcoOHEdCBlUnyUcPRzyFhs77usq0Iz/kYZE+Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
	b=B/xjDZuBtvCkbnSjI6voXj5wPkTcJ8emgplzGB2Z/v+0Hy2uylxE5TmimP8EpgWgkDMf
	 0EL6wRqWpRNLC+kdZuW0/SX3q/Rvdwg06nXN2MR/TFVgXy84UpLFr9ZLGQ2OJhAEz8Y1i
	 TwFwCayAU7r9tH1XA8IEPfv+zvQE5Uhlm1IHX7V2SgLIC8AefUVtVC9ZgZGixy+EYSEEt
	 2VdvP95iWgQRXLKU102UjZ4a8OxV2pF07GgRPxwLmZPGEXn26f0TGEFMCK/p+78N3B4SW
	 TsmPswsJr5Pz8xTuDIw09GHUaZKDFlSDTpEZk9Sj3UBKYRW/cUaWWGmKHb0y2oVmlnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNnBk9yY;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E1606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79E1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNnBk9yY
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c516a194350so100154066b.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795632497; x=1796237297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
        b=oNnBk9yYeUkh5s9pJTjawpl5to9WwX7SUukW3RYanpUXdKryi5g59gdyC013GPo5KJ
         44RoaPNMbHUir0M+Zhp87TWdQHbZM4kLUCrIT/znmwvN/7W+plDblEnJSJhJVNx59B1B
         chd0czeEamhlDzqBzlSNWAgl9RqCeMqEu6tglGhHKOhF6wrzB6GX//4va9yD4oR5ChIx
         6K6UWxCkBgpDnKlJT8uwYLnlEsvzSB8A3x8XJ6Yf8H9wGHX4cfSvnWq7kPdJ2YCYmOg7
         RA0MMU1tmW9T8fguHCAFFhimvY97TLhouhiNYSJ0/UyZSjdG48daDEwMt3AoiQ+nHBGe
         C1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632497; x=1796237297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQW/Ymb8D+uLvIjWbZ057G5GtIuukitNqjLkdiNCMvE=;
        b=HRMOfoFzxEVKwoO3NVG3QEuroZ/mVpx+M6ybyVcFu0Pz8n7BX6NBiCQRslG1yU6aq6
         lVnXgpSA1lo25a2y0i993FRgZAg5RsWx4SM8xAWt8tAuf7/nV0ACmPV9o5fhLlWEn6JE
         U9Th/+igY1yKlhIAZtTmP3q0DDMpCuxpjyFcXrFyr5Mch/0V6Fo7U1r2wRaMd9Ov2a3v
         FDJXWElvsWL//ZhQ39+2PouzQQzNkxfM4H7nL9+JzYYH61E539fSJdbFcBwdwV1QoCKc
         eCR83jgFKOYpNN3JNwvmBsp/90Mtvo5Yw5H8T8DHhK58I0lO+Fy6lfq2fToXvA+Kc3Iy
         16kw==
X-Forwarded-Encrypted: i=1; AL+hErFevaMQieu5B+/iresQw5OOC0fAz4naIK5Hv6CkmpZ50uZhUIC/SAM1rnbz5HQ921ijomXpuAlVnbXC@vger.kernel.org
X-Gm-Message-State: APuU4Z/c2vTB9szGEHjKsGYDm+FmOnQz4UoHfgWr+QddxzW7zEZPgaU8
	LDDzr8dKxBn7Y/9PcD/SrUFyQZpRKrEgzH/Q8U7iSv43rdGtyuPP7mXy
X-Gm-Gg: AZFdTZe/DSgqT56/J1bBzxY4h8JD6RmJV0wWH8S0vnEyujRPbFZRlGBlaIz5qDKLqc3
	MhABbrkACuvZPRKUa/WcjlXX1uGYBGWOpmXhx2p4GFfpkbSkAbIX+/9GAs5TiHXJlLLAAPC+I7o
	IaO5mDFD3BIbHQ9SE7WDCtjtFjwpdkBoCX3nqTjrju/xli/7OuirC0yhOjKHi4jA1tc2wBytD2K
	L32A/U8qD20qnCxEHPKpIs0I1XbWJdUAqpB6tqoHBuL7VOQx/SrR3k1d7J4BfcieYtKicomMYt1
	Bs6/OZfGaf4VmagcBSMPU19SGwj+JNMwCn0sVmWL0w4ML/L3aqRN5ZbRhDzj6IXgAIRl7846QMC
	X++vHuFilLXygCRcLKpgCyylEim9K4iTbXn3Yip+6KpukL+jjYUOazzh0DoCMnyNvZUXrfGVsw2
	pZogeRYFcj6/lvkISJk+Ur9s+FzZzOQnm8DH1+worvVDJ0nZKXQPbK6Y0j4OQRBm6WGDrK712VE
	DjdNEDRZgn19FkEcX4eTSJhKXISK/1oVM5SAAXscQBLwGs1ImuuhqX7+h/SZ/Lqg+llmnCggLNP
	vVPB9DYyFrlVC/I980DFlUmWFKNS4uGUGttxcZ/8HG76Nc+SNyRM1Kgx23s=
X-Received: by 2002:a17:907:20e4:b0:c40:9b75:84af with SMTP id a640c23a62f3a-c513a5ec7cbmr1173636366b.8.1795632496938;
        Wed, 25 Nov 2026 10:48:16 -0800 (PST)
Received: from antoniarch (84-40-239-22.cgnat.inetia.pl. [84.40.239.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm677226666b.64.2026.11.25.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:48:16 -0800 (PST)
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
Subject: [PATCH v4 0/3] i2c: omap: add support for DMA
Date: Wed, 25 Nov 2026 19:47:45 +0100
Message-ID: <20261125184750.57866-1-apokusinski01@gmail.com>
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
Changes since v3:
Some minor changes to fix the issues reported by sashiko:
* resize_fifo: changed type of the `size` argument from u8 to u16
* xfer_msg: fixed style of the REVISIT comment
* xfer_msg: implemented fallback to PIO if DMA transfer setup fails
* xfer_msg: disable the DMA request as the first step of the cleanup
            (instead of the last step)
* probe: introduced intermediate `dma` variable
* probe: all DMA init errors except EPROBE_DEFER are now treated the
         same way: dev_warn() + fallback to PIO

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
 drivers/i2c/busses/i2c-omap.c                 | 377 ++++++++++++++++--
 3 files changed, 370 insertions(+), 23 deletions(-)

-- 
2.56.1

