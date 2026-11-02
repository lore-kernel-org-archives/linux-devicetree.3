Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641199;
	b=odWK1D4bK4gj3+ze7hxM7hCZIs4aMat0w9L5N2RntiH8xRuDwEISvKiMq5RHri0HMKuE
	 BlILb1JrUQ6onMeiIlszPVA3rfLRk61/5omEo8A4VcVtfBHD8A/jWq0CLfj+oWV0VHPI7
	 iVl3HyqZYKfp6N8h9d2QS+N8nRc54AU+1sPx2KBQDHcuD9gmko77OgGaK9FNqP+qRutj4
	 VGshlwIfIOCfzeiS3C/pWrZ9nJG6AeccgNlbRlm+qTQePW6Ui6sYbBxUd0gJtO6MUaRQ5
	 vvO5fEuDPsIK7Z1l9yclnac6tbvaBBy9PbwIqTeb9kTkVQUvehp3FkLJhC8XgWfjcpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9J4z2p23Rp3rNkD4XaoXW1ZLMCK5QuoS2JU2MXoD8Mo=;
	b=EtF6S7MB4S8XuqlqnC7JJ24UHeiOmpErrjlt+Ik5dH9lZJOZsajaQlRytPMQzoetly1R
	 qgvnn75j2RsLcMDIAsIxZVo03oMNQW5VziabHGsLt5tdip1MK82u2LI3dI4iXWILcKNDO
	 tyJXee+B+cdcn1b1yivgmhtHyZo7Q2EfsmSEiFtGPfBrqJRhONhehsZIduRQj5hQNs/CB
	 wUzL3KWmKSDFe6U2uikAh2O7z69NSzPhePhXJkmjw1eJXU7O+59ItYCh470aQ0I/gl75l
	 IcjMreK6u5D5522xR3qe9na1ZV5UenGuHVOUFXZ14m4rjA0mtWtBIlputsyGYdkQrpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZjcelk9;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9D606A90B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D9D606A90B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZjcelk9
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53aa0802881so1668241b6e.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641198; x=1794245998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9J4z2p23Rp3rNkD4XaoXW1ZLMCK5QuoS2JU2MXoD8Mo=;
        b=XZjcelk9gmOaDB3tZ8Asg3xSRMkwG2Gr0lKecCcnRYjKRgTE9QGj0Yt8OJkeHzQu/M
         hCTZNhML3swPyTT6T4H/NJfQuCp3xMk0zh66kn8zasNQar3BN9aWSr2Hol0ZmDQz4/bI
         u4iMuPliqVXlDIAFrOX+3NF7ieyMgqv/GyXSJbzSC5gyyXoMU2PxPBtWEOL7EQaLrnR3
         5AWwXVApBA8eHSD78rBkmTFoXw26uva2kxPa8ykC/hGhY4r7Sl+DMMV6GC41xhhHffxg
         jV3VHiuTlEL1bxt8LggeAtW+E40lMoJJDHU7y0tjauEOpF9pnfJnLzYE9GhApG1VxkH+
         SaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641198; x=1794245998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9J4z2p23Rp3rNkD4XaoXW1ZLMCK5QuoS2JU2MXoD8Mo=;
        b=COgaHrtoK56eIGS5jv1jb0i9WxLPIo7pAfsaH4TtzbuUJ9Fbm7JB4eorLH5/t342D/
         MJKFFd4HjXFC8YJrtiNTh3rHRQaSXtZAzAYr7I6bLNe8v+GCsQleEIuII4AQXHa9qjIe
         PN8CEgVjN76mQ37PF7mjJGSo8wqvk4z3CMIfniLfodgUW7TH2orbiglw9VhGchwkTTYQ
         gT7mZqVa/iygxDNaq2autTFIwhsj4QPyuhUwpIeSDBvCtIKhurDUCgu0TL+Znt+LIPCq
         tZypfOfCKtRCOnnFYZ40tpUWDXXlSPCXIZhrUYQk3ePX4dN299dcLlOkNUt45FafOyAJ
         JMmg==
X-Gm-Message-State: AFq9FYLVIZ+HZLvhOKyw009ElXC3KriEHGdPq7r4Aq7x4XBd6SD7vOYg
	FLI7/6/Xt9oZtt6goxwIJsSKCH990gMQXqLIhqOHbeMfCf/FH0iiclW9
X-Gm-Gg: AYBFou2NRxXuCwHTqnJHxfud7EMmzNY0uByBDgq9xoK8IZnCIEBIJgfFejJr++fNOFO
	u1WDG5Bi78ph3hYS9brou1H3Ky935pxsd03o8Ga8h3Z2k+zMkcKiiXKyrsdrWC+UgsT8TjFqU5m
	5uTIoa0I0E+R2u7A0wzARv+LW5Iyll6e8fXtSgZkBNpmDyIty68xG08k23cB1l2QT5D0x4ByYNs
	LosQt1mASAxgCLcsHS5iAsNyf86NAZx6e2/79X1DGgARiZE6wbWe0ZvGPoksrPK0FbW+3p2HKUZ
	QJByEOCl7iU2qhKmThfn8c5BaiVt/uOZYSaFI1oO3v/oJH91bp+IevikB5CnnN4nejW7j+jKKL6
	8aBecJS+xP+cAq+D07WIqO4khz3UPI48nwZ1wCnsojceUnNtE4/LziNOkwf2b0hZLUFptctMWBv
	aBywdDUc4w+maTfI0V07RRpZ7AEsjvkYDwLRJpgpvNkjieH6h8UOT+nmvpEaf1h+o+wW9MX31SO
	81Yd1p46LatT5zbA49k9ONJ+AlcL81fBBlNRxPmkzdaSD1DINR0fekt2cTo2WKcreoRgCz5pVhq
	j+UAgiaKzPkbe5TDDvSoEuNzJRMA0zU=
X-Received: by 2002:a05:6808:14d4:b0:53a:6769:c35b with SMTP id 5614622812f47-5640dc1e923mr7201227b6e.12.1793641197636;
        Mon, 02 Nov 2026 09:39:57 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm9237058b6e.6.2026.11.02.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:39:57 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	diederik@cknow-tech.com,
	arseney300@gmail.com,
	michael.riesch@collabora.com,
	shawn.lin@rock-chips.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add cpu-idle-states for RK356x
Date: Mon,  2 Nov 2026 11:39:44 -0600
Message-ID: <20261102173944.312295-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add cpu-idle-states for the rk356x-base to affect all rk3566 and
rk3568 devices. With the fix implemented by upstream Arm Trusted
Firmware [1] this now works on both mainline A-TF and the vendor
provided binary A-TF.

Tests on my devices show this parameter provides idle power saving
of around 5-10%.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55024

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 1a4562df20ee..7e23f6983448 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -56,6 +56,7 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_SLEEP>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
@@ -72,6 +73,7 @@ cpu1: cpu@100 {
 			reg = <0x0 0x100>;
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_SLEEP>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
@@ -88,6 +90,7 @@ cpu2: cpu@200 {
 			reg = <0x0 0x200>;
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_SLEEP>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
@@ -104,6 +107,7 @@ cpu3: cpu@300 {
 			reg = <0x0 0x300>;
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&CPU_SLEEP>;
 			enable-method = "psci";
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
@@ -113,6 +117,18 @@ cpu3: cpu@300 {
 			d-cache-sets = <128>;
 			next-level-cache = <&l3_cache>;
 		};
+
+		idle-states {
+			entry-method = "psci";
+			CPU_SLEEP: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				entry-latency-us = <100>;
+				exit-latency-us = <120>;
+				local-timer-stop;
+				min-residency-us = <1000>;
+			};
+		};
 	};
 
 	/*
-- 
2.53.0

