Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660749;
	b=FVaOeT8BI7hiMusUZUyiky4kjIQhM9xGCAvg2sxyaIzD9J+71XB7BiRYrbKJLeJ2bmZb
	 ZLwi1eJkR139epzBgzAPgxo2o71YsOlMK2CsQRcJ/4qrzLhaZTc17pcMRwMQyxFbrxBeU
	 aNXPiYDid+oftjGkonJFOP90eLNL0EiPcCiLdTaZbWrsT9m/f7kpyiBU5JwCBBrpDVz9L
	 pZuU6sPIMRP4/vMPuNrtP4eutHYdRgo0Uj90xbxUM8GAWPEq3O0XN6UlAiNSV0VNwDiqX
	 k2pBwWE93E/vtogvtQLX3mMdatMCGlMprV3tKZZ22qfCZ70VXntJ438I8JWebz9TFOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9HTtW+Vn/gGQSbX8Dg4iqwQSooM4TxCKWvPg+ZuATgM=;
	b=RkrSghmoFk2EcE71eB03/sTSAU8+N9f+xTkKMHRBWpIUtW1xyTNeUDMAEXM2HRUl/RXA
	 nOJY/XrixVmR4oL75hgUTgws7rC3MdoF4r+hyTWd8igfT6d7OdwXPjb6RfTJdqvePhr7q
	 LfPp838VT3wpqFM6XeBOJwVujubwudpYRUIefckhbpdQMQ6jyhAzdGAYyGHmtBltNlCn/
	 EUgd94XBPQCgpfZ81mHUvVneJVht6DyL19xGJpHCkRTwB5oUAc8IlCtOAbGhbV8v5zApu
	 OlDqoFB37ocO0YT4mmHShVLr5nm+MNH2cO7b0bV1fM6pU/lmtNrkIRpxUVmrD0Q6BUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnPDBh0X;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D2606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D4D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnPDBh0X
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a594d313a3so4330236b3a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660748; x=1796265548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HTtW+Vn/gGQSbX8Dg4iqwQSooM4TxCKWvPg+ZuATgM=;
        b=BnPDBh0XN6ebzXvmM7uH6Jg0zp+IbTUIpbCrxxRhfpvJ2pOtRQb9Er77U2lQO96Noe
         U1PsL+zPoIQP0OstyYC8kiH349eCL3pcyFb8r/OyLLrRh0y4lx1Nxgnb7RJoWsD/9YP/
         +sg1Z0CITiUDdSZsFv/k489p1LriexdtTCmv6a4YVXIAyeF9snI2IkgFBfCQ0axFmFvF
         HWu2ULfpeGa4CyGo3Rfw0KIvjO28Hjw/bHcDRyyFHmxbNKO8iukGefDwXVll9Ms5pZrO
         P/mTVd9uuQcMyyiyuM13PpTTMMOjVWGohpt7yvddlS9uA4TGiTxRIQIFUc8WBzMia+gf
         hnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660748; x=1796265548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HTtW+Vn/gGQSbX8Dg4iqwQSooM4TxCKWvPg+ZuATgM=;
        b=Bw4FWmSa8MFaVG6y0qdKAEu2ps50Uh8cXStZFfRPo15mfuXy4Do1QLM2MMsQq00l3o
         jAtK17fjBTWuh5dOh0AkCCKHgmquMw+P/ORIjR/nvDUmHZNbZfSjqt+ZqTTdXRYhDKEp
         DLxLnzNbZJcxyHDF6YPpCgMx3eknhLWzAqwYL6Ec6rvcjBpCXDyxQqdgyVX3VQVHxNJF
         WNFc/h8gGBCcwErHmq6V4YXeoZdsa5vZSSG6FEV1kejayA/vlYB/hz3U+SApy+DkxqI6
         zVf9evlKAtNgxKNbV9i5LDaqD9hZbc6MbL8vSVDiXkh8lkvFQSoQdqDR/wlC0u4So2bX
         +vyw==
X-Gm-Message-State: APuU4Z/7jGI7iiTTcXEbNO9utBAKFXiQoUamx5kJZ/YeTP/SSRtV4lt3
	vxd4YLHH9fHl41fRgYl7CnGwo5SSQiYjSGlrsXhkbkBc0HbEhDqoryprW4WAew==
X-Gm-Gg: AZFdTZe54Kro6PW/yfa+VvGo25LFHwLfxjVY9tR+iCqpbF/1pU9zlPk33J70eWc56ZQ
	UxzSocw6VxU+DqwZwfgHxfnzERSoeas9xDO+1pNqPnGDglrRij/9CDPYQ7uFKvElQfpsq8zIZBD
	1M8g/rdkF+Ls7c7nKxPv8+ifc2PYt/gsUeXevjE1sh9sDkcs4+f0bqA7AtHsheWzZApvZ1cf5mu
	BWIM7e+ZNAWbdxI1HKPff/ny9ZmuwzfsTQiknnNPrwHruymLHmY/XJye3GPGKFs+qhaMYDCKUhh
	1YfkMUdGL6lzCUqlkxw41Sg1d5XVA8UsrndhXvENE6GUtQV+p9T4WMax6/D8C0O1tgO5aEiMQ4g
	GOFi3Qd3LwGVJGINioxorn3eBj/3Rsi9/9BfN1sSEgaGEnhmvwKh98Zpd2amGDzwIFo+Ovk3Zxq
	Ck4Lc3tlThbiVG+L77YKafDq77bgRvd4xnLkCJPJRxR9U6tDps1LezQT1U+fQMBhmxS2VFCkG5p
	HGZJwOeKz+6uHgLqLKXyc31s+ShNLA/fUf9uHySWsCD3ySbkNpWeql+/aqmx20TRpPeTEuK64eF
	S+J8xSHBJt0v57Yn4kKqnpgOXOYaVwptl/HGGfBNVOayumK6lB7cU5fga5jTSNcrLbjZCdFGPSM
	jtpNNJDSr6+voN5oZUVYguHZBqFJ4Sii3MNZV1JFLlPgHdVJzEk9qQzozWfoGuH9Lxrsrlece20
	vNbg==
X-Received: by 2002:a05:6a20:e347:b0:3e2:5d7f:f630 with SMTP id adf61e73a8af0-4014d75b547mr21301396637.54.1795660748573;
        Wed, 25 Nov 2026 18:39:08 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:07 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 6/7] ARM: dts: helios4: use hyphens in fan pinctrl node names
Date: Wed, 25 Nov 2026 18:38:55 -0800
Message-ID: <20261126023856.767961-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
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

dtc W=1 warns about the underscores in the fan pinctrl group node
names:

  Warning (node_name_chars_strict): .../helios_fan1_pins: Character '_' not recommended in node name

Use hyphens like every other pin group in this file. The labels are
unchanged, so no references need updating.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index d4ed47ae73c5..b62730b949a4 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -300,11 +300,11 @@ helios_io_led_pins: helios-io-led-pins {
 						       "mpp54";
 					marvell,function = "gpio";
 				};
-				helios_fan1_pins: helios_fan1_pins {
+				helios_fan1_pins: helios-fan1-pins {
 					marvell,pins = "mpp41", "mpp43";
 					marvell,function = "gpio";
 				};
-				helios_fan2_pins: helios_fan2_pins {
+				helios_fan2_pins: helios-fan2-pins {
 					marvell,pins = "mpp48", "mpp55";
 					marvell,function = "gpio";
 				};
-- 
2.56.1

