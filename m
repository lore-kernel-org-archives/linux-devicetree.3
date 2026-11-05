Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874371;
	b=4m+EE9pZPFGQkprNAv32Sp1aYJ7v2qUb1b93GmLBQ59x3mSxS92prKOyXJtAEa/JMjU0
	 ZxwaV+0zIXKvQSXsI24lLQ3j9vOclZMvgJ2jkZ6krN9abyLypMWMVOvNZvEXMOIl8GZF7
	 +ToP6fk7sG0eeO6vY2RCaKqIDWN7zETAI+mzvDyuK/YHLo6x/0tnaFzZwx4VnpwQV5qwY
	 ZoYpuGE8lFD1gMxnbEA6tkzauoY4blb6hKGLamP6xyvvg1h9FSOO3X6YAmH3yywgNyc/a
	 WBoryCrICrSVCVYhunGxJIV9qlyGTNWFWTG0nVUC1E70nfNHavNGsYp7oza0TA1aQaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=;
	b=WxWDwEStKYg4x8jEHdFQ9VyMIEDsr9+KaHtBf9fpqd6Fa0ZH6JtbYosp5FC2/li9RT3r
	 xskEug0x24vrt7MzjrKLxiFhripRpspdbFvHN59WGJjuEHFdYFAaWshAU314jRhtDvHQB
	 lkoBtDmiOduSuRET61PCG7NiILONsAxHjjOL7vgP1mEkEwNRhAGUZfJFyw+0ih6tSS0p+
	 xD5mtsjv99XzJ68y4h/7vPqzJUpFXM6aoyK42gwH3bUDY4rvAXC1JV33jDhjIFnHy7IS5
	 Kzvjsvwg1l9ElzXF51YkpkTux6WILJavw7ESZ2uGl+eabhQZeZDTVK35jBHicSMgSgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJyQ3TJT;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BD606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJyQ3TJT
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso278213eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793874370; x=1794479170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=;
        b=PJyQ3TJT2CEor3Cn/UrBve2pePRDy/wgARH795D7FN1PbR3aOqLJ/hPMakI9+8myev
         eKv3gtfPBL5Up657E+/j8eWmoFCX2Ug4x5iscFInhpV7uRslS5DiXIHe95s7YYiFBLjG
         YsfwO4vJlu072pOdLdgvn79T3NOsHvrfDekO5l2lMZ0HeAYzZYdXzcQ1hOtwJNWmpeFj
         4yCSRTEvwA3cIvOzekhWI4UM2YpyZbbWG6CQafkIF/y7a4BUyViPFiqsxtwtRPsBw1S5
         szNS8uxlgcHmnj0zX7CUZ8yJroOzZ/qBOzeGZGqP1hWkMc4YOy0NgLI9lAdu5vZDojB8
         SQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874370; x=1794479170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfxbEV1+fg5DL4WByiUrgmxcxFW2ZGkGENp2uYMYyr8=;
        b=hbbUeaKinn6gc3kwziy9C1vMf3WMzUD8DwyolJwA9AHSIExS3HaulWkUbpLAPUn3mh
         54W1unfwR4QD0/bMbYB/95rNTM3yOY2uztUhWvlZnBKKRmyV4AMOvq7LXohT8rj2yP3Q
         7ZXyf6fo8Uo8KQ1Jz4aUqpIr4iN+U3XBYP+IsM4BkCM23WUtpCT8sfK5PclwghAKG3bK
         nodPhDkMlif/KE2wQs24qW+LbS1CZtPjem2K413qyDZ82s3c5Q7amOFn7bnXp8WhCwXo
         2AQneKccG3cYefBzlvTLKtuaC8XUDk6hGifyXSlLqRqyR+FejBwlmDgRgh09LHozivKO
         AKdw==
X-Forwarded-Encrypted: i=1; AKwUvBx1cQJ8VT4va8pPbZ5FIfTVXyhbPq1zYMN4k6HkoP1UhNBS+/NrpTc+o/I7RlcDdGsUPNDWXtbvaj7h@vger.kernel.org
X-Gm-Message-State: APuU4Z9HLL5rWHddNNpn5+dPPPEROPLKoKhlqvGx8tufIKhG8LykH7zt
	RtNri+jWFFWXUYuxqbCWA8dkAhF0sJGsxOiLIeZNgfNfjGLLqM/nL3vf
X-Gm-Gg: AYBFou3h3Kz+cTOTZYd/GbnJDixH0Ecp/J0NAdJEnwMm19KpF1bezjQ836vwsC1paZZ
	K3LA/p1pg5FFGDJ1Cfl9ROHCY8yqdGJ7NyNjVCgrfrI+2n4TkRSCLGFdOEOk7Om2iKuxb9Ud9fk
	XEF6oM8A5RBllAZ6noLk2T+4vjC/W7IzxmEfE6mtwAFpAC1N7XqnTCPzWhPR5BrZf8uDNpAmg47
	BiiFhqIVH2T1DlbP8KitF2flCAWoa2DcptaRoMyPRl4XjaJdclx1Jr/mTjDSFnQiHPPX1iCbPYS
	1xb+DTvUru8hrS/idkDvWxPupnQZCnrW0HE7MrTY9xv08BuBeXql9eLlo1mTT238Y4pDq6iiQ/R
	avrlTnOP2ynj2Z+Q76vya5tK/SNz84tiMsUA4DSGjDmu3nJszDJEKw7mq9KpgypOcFxEem1pflo
	oCSyg8p8E9D0TGrjnPUe+uhmgxuCUlCBaQpFv3niY6k+o/ipPff3V+HsMIpNFPVfAzqY0i9nX1G
	EBnRDsQDbgXbfxnI7mDbr0FDsiassYai2AiRTlQ16Yq2UsLI7fsWyFqVnGKC1lbnj6fG0i7Tz7P
	xf/xaLrkALlUp5BBMMCIbwkp5gxXUz8HQ/1dk67PQLKv
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id 5a478bee46e88-36a4242f5fdmr27765980eec.17.1793874369763;
        Thu, 05 Nov 2026 02:26:09 -0800 (PST)
Received: from aaron-m75q ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36e194f4633sm6253335eec.11.2026.11.05.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:26:09 -0800 (PST)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Thu,  5 Nov 2026 18:25:56 +0800
Message-ID: <20261105102556.1365-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

Contrary to its name, vcc_sdio is the IO supply of the SD card slot: the
schematics route it to SDMMC0_VDD. It is listed as the vmmc-supply
of the WiFi SDIO node instead, and that consumer keeps the rail from
switching to 1.8V.

The WiFi module's main VBAT input comes from vcc3v3_sys, and its IO
supply stays vcc1v8_s3.

Fix the supplies of sdio0 and sdmmc accordingly and enable SDR104, which
now becomes possible.

With UHS enabled, sequential read from a 64GB SDXC card inserted after
boot goes from 22 MB/s to 60 MB/s. WiFi remained associated at 5 GHz,
with no WiFi errors.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
Changes in v2:
- Point the sdio0 vmmc-supply at vcc3v3_sys, the WiFi module's VBAT input,
  instead of dropping it (Heiko)
- Rewrite the commit message (Heiko)
- Link to v1: https://lore.kernel.org/all/20260922055011.14972-1-yaozhonguwl@gmail.com/

A note on testing: with a card in the slot at boot, the first
initialisation fails tuning ("All phases bad") and the card comes up in
high speed mode, as it does without this patch. A card inserted after
boot, or a rebind of the controller, comes up in SDR104; the numbers
above were taken that way.

The GRF io-domain device binds about 250 ms after fe320000.mmc here, so
SDMMC0_VDD is still configured for 3.3V when the card switches to 1.8V.
Forcing that GRF_IO_VSEL bit to 3.3V with the io-domain driver unbound
reproduces the same failure on demand. This looks like the probe
ordering issue Jonas described for the ROCK 3B [1]. It also happens with
SDR50, with a second card, and with sdio0 left without a vmmc-supply as
in v1.

If you would rather not enable UHS until that is solved, I can send the
supply changes on their own.

[1] https://lore.kernel.org/all/e9ff5387-b3c1-41a7-b251-a12789d25a70@kwiboo.se/

 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..fe1f8d7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -777,7 +777,7 @@ &sdio0 {
 
 	/* Power supply */
 	vqmmc-supply = <&vcc1v8_s3>;	/* IO line */
-	vmmc-supply = <&vcc_sdio>;	/* card's power */
+	vmmc-supply = <&vcc3v3_sys>;	/* card's power */
 
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -804,6 +804,8 @@ &sdmmc {
 	max-frequency = <150000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr104;
+	vqmmc-supply = <&vcc_sdio>;
 	status = "okay";
 };
 

base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3

