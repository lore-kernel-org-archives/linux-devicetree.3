Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE8E4EDCCA
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615921; cv=none; b=R8vxRkPbXDG873TTfHQXwHhkJ+mffMtlm6dZwZjm0SvY6JUGJN57ViOJBHJFLFjf9GEajm2T2ijTIGP1/VRzqkj1mIBFClUH1ZKY08SPz2UdiARnV3REglEeI5HYvEfPBbc+aXcMO60DU+eIwOX0ALvg6V7Vja1C6gfdJA+pb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615921; c=relaxed/simple;
	bh=zmMCjORbtJtWDSFmQRFFbUAM5lSo+Rhe75Em9QNmcMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZgSZim3VihULPSzUDHukqHcgEfb5+Rys2igw/+4YuaftBqi9GfTdlyu294skoxWkfSFs81tlgrIwB4nuc4RCf7k9KnL5W8nxUSX+n/Y6DFmquF40s200Ubq0H+7mDR/Kl8n2qlhGcGVPJJj/2IWdFGMBsxx7sx5dktL+oFhuDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=NetVhJQc; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="NetVhJQc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso2048084f8f.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615915; x=1791220715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OeSLEttyfMvpfX1KhFTKCRoBV4HzzJzo8yo9uusQA3w=;
        b=NetVhJQcIKlctspETkivLt3vo5OFIC7FFYjSpRuWBjISR0xu89urR6sFRMU/UdBOA9
         3iivU1hE+waIaMaDNXTsqYVgS14uTtY0Xs9M9eQktB6xdSwqBTqqPMUZmPqyYXQdmwUL
         EYuSkGG4Tp6mUhG6+JXHfX8wE1kh6Y5fuaPfTGeckZ482svWR6yZdFTHRnUMqgANyKNR
         NzjTPu1akf3ZV9mSaA3jc1gKahocd5sWuQIDMRh0nMXzS/t4jjMCaCxSmlIwo/dp/HuW
         NxySGHuDEQ+HkPDP3P+URdbHMHsWIERXAUexZKWcFNe73Ug+0civ+H2mSt9jxjwQSpeG
         W5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615915; x=1791220715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OeSLEttyfMvpfX1KhFTKCRoBV4HzzJzo8yo9uusQA3w=;
        b=mENqcETmKGCJ9NoV8f3z/J/5zVvOMi5tyJRsBjx4YTVgX0rmzxULVHre8389nWn/AB
         YsFKyia4/8RK79dtkrRAnO2MX3F4TtbRgSIRbqTGMMLoci03mcbmNYCjryFNin73/Tuw
         rgsMsLajWwEEisYBpAUcPPrlEHR8kq4/i8m7z8Gv/fdCV7HX/2HxM8PyumuODQgOeT0d
         LosuZgHwkf1z3DQQZ1QXaYR6ch42YIGjQNAm3e+xmtPMgSDNWPCX4qUgD1Scdx0OmFgh
         Gswr7OyhPalsE7MEvWct/cr6WMFbdn8Zn9lLnscgblYl+3bWXoAFHusE3b4weGbZuFWe
         h1hA==
X-Gm-Message-State: AFq9FYKUu5jesxoZGAtVEVXccDKnF5q6rR1V+cYkwUgiaRtb68GUBslI
	GkXbpIIWoGc/Veui6ZkLZ5qeRMuyjQkKQ8FujVO88dNoGfTHetAm0AyRC5DqC1uCk/I=
X-Gm-Gg: AYBFou3to9msYh+EZZlBMgqbZkgekehJ6fYDiM6lpmnUdyaon1jOqi1NscykHQ+yt7j
	FOGkj/7VG8paCHGH+gcuqJ3uOagPBvFoJbco+bD/KtHzx3aOkvTxU48D+zg2il0D4anTl28KkxG
	JoVR61C158TgiOMDfC2KcHyAtTAfMUo3cTNnGYETl/0F9cwNxLTT29/PfGs9dgFt82/vRnShsuv
	Ve1wFZNGIwKHIS106IGojREP9On65UHGuSZnsiZCTxb6L8nj8jNDXoW+DGjyFZCfh+1FEAEugwL
	vILzKax2SMPahERp/RqhmC/Dv61ruazYD+RYig/xAz61uaU5JTzmRuH0Lu/goYpn/uXS2NGyXQz
	8nJGegJEMihLYfszGBBnmrGHtb1ATxG7E2gr+tH5rerx/eKvMyuDgxV40r45/8YaK54wKkab9Ht
	+Cxe79vJSh4VHCdesEUczdQmpoooazSmqsVmeVbQfFsG0VAArM0llB0rnBtHuqMabfdVD+c71QK
	Fwh8+u6i7uewK5G
X-Received: by 2002:a05:6000:2010:b0:488:7803:c1ef with SMTP id ffacd0b85a97d-4887db496acmr19598301f8f.48.1790615915014;
        Mon, 28 Sep 2026 10:18:35 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:34 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:19 +0400
Subject: [PATCH 4/5] arm64: dts: rockchip: add reboot-mode node to RK3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-4-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2965; i=alchark@flipper.net;
 h=from:subject:message-id; bh=zmMCjORbtJtWDSFmQRFFbUAM5lSo+Rhe75Em9QNmcMI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhj3YPL0uTO2f9BiZBOvFShcsOx+TPNS04cRlyJ/n
 NhoxZrl3DGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUP1Zm+GfCGWTwv5jr0yTn6vTWuYubuoonyJqYCTx5oahRz/y19jXDP+P9028
 9SFQJEnud6vLruqLUqsUTilI7+E7pzmyTivQIZAMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The RK3576 boot ROM chooses its boot device order from PMU1_GRF OS_REG0
when that register holds one of its magic values: 0xef08a53c selects USB
download (maskrom) mode, 0xef085a3X selects boot mode X, overriding what
OTP or the SARADC strap would otherwise give.

OS_REG0 cannot be written ahead of a reset, as it is cleared by NPOR.
Instead TF-A takes a request from PMU0_GRF OS_REG16, forwards it to
OS_REG0 and masks the reset outputs so that it reaches the boot ROM.
That register is the one U-Boot uses for its own boot modes as well.

Describe it as a syscon-reboot-mode node, so that a reboot can carry a
request for maskrom or for a particular boot device. Under Linux, for
example:

	systemctl reboot --reboot-argument=maskrom

Requesting anything other than maskrom needs a TF-A containing commit
2a97ba20e901 ("feat(rk3576): forward any boot ROM boot mode request on
reset"); older builds ignore those requests and boot normally.

Link: https://docs.flipper.net/one/hardware/rk3576/boot-rom
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index e87ace5d05e6..c938dbcad712 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -881,6 +881,42 @@ php_grf: syscon@26020000 {
 		pmu0_grf: syscon@26024000 {
 			compatible = "rockchip,rk3576-pmu0-grf", "syscon", "simple-mfd";
 			reg = <0x0 0x26024000 0x0 0x1000>;
+
+			/*
+			 * OS_REG16 carries a boot mode request across a reset.
+			 * TF-A picks it up while resetting the system, forwards
+			 * it to the boot ROM through PMU1_GRF OS_REG0 and masks
+			 * the reset outputs, so that the request survives NPOR.
+			 * The modes below are listed in boot mode order, each
+			 * naming the devices the boot ROM tries in turn.
+			 */
+			reboot_mode: reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x40>;
+				mode-normal = <BOOT_NORMAL>;
+				/* 1: USB */
+				mode-maskrom = <BOOT_BROM_DOWNLOAD>;
+				/* 2: SPI NOR, SPI NAND, USB */
+				mode-spi = <0xef085a32>;
+				/* 3: SPI NOR/NAND M1, eMMC, USB */
+				mode-spi-m1 = <0xef085a33>;
+				/* 4: SPI NOR/NAND M2, eMMC, USB */
+				mode-spi-m2 = <0xef085a34>;
+				/* 5: SPI NOR, SPI NAND, UFS, USB */
+				mode-spi-ufs = <0xef085a35>;
+				/* 6: SPI NOR/NAND M1, UFS, USB */
+				mode-spi-m1-ufs = <0xef085a36>;
+				/* 7: UFS, USB */
+				mode-ufs = <0xef085a37>;
+				/* 8: UFS, SD, USB */
+				mode-ufs-sd = <0xef085a38>;
+				/* 9: every SPI iomux, eMMC, SD, USB */
+				mode-spi-all = <0xef085a39>;
+				/* 10: eMMC, SD, USB */
+				mode-emmc-sd = <0xef085a3a>;
+				/* 11: eMMC, USB */
+				mode-emmc = <0xef085a3b>;
+			};
 		};
 
 		pmu1_grf: syscon@26026000 {

-- 
2.55.0

