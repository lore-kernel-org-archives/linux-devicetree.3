Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445652;
	b=yNuOVP1rhelpqzbynZ1oL84wSVCejVD/TomSii3Hxu0TbqjcDeupJy8VaBHSa5anG1Xs
	 dbAPhDh7Eco0CPG/G/OvA9BbP6qUbWlPS1mBb43mEcYFMcvRjl2/D3iBDG0vJRKnih9ON
	 UdDpifmJGErsV3cFFnVG+bA6cM5rFJmODSWxs1HTqV/Lue/FD2KaGCSKHUtp8OM9jkAww
	 P3aZEMm4vlbwfM785PSanRlde6RCYM/7B/QJ0pY27D7OJ5dsmuu1ZjmoHongmNDLIsnkL
	 oR6OpTe6dxMSovnSZIaCNHoLC6OFwujNHMmLW9cKls18QOo2/hJzKDyaJhwl8Z3jgWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
	b=znGQ6b0t3bqCup/kX6iY/hG5MJ5DSXFG6yY2DNkJ3YVSeXcwo7vd+P/UeDzErdhy9W7D
	 H6beh2DgVSBeoPVHV2KDjukMFhwgi4UyOz6Ak1txJJhccgZTCXXyJ7gEit8NYq0XX3Vk1
	 kzHK97jETyNojg/S47OO5pP0I03RAAq3I45htEPTE/r+y8eGLY0OMZTzjMREtlvP6Lo4m
	 b4lneXgQGwx32GvpdC9kvD7a3WWU3Gi1iN0vtP6a7gR0RyHe0qCLWGpZSns0NUi63yCeC
	 MMw3Rb4MpY6lis1pab/Ltxb9aJiXPneLSu6PRCT7TKTHZNwAovED2kzH327WYtXNDQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DzYTfl6c;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E9A606D149
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E9A606D149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DzYTfl6c
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492690dd5daso2569012f8f.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445650; x=1796050450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
        b=DzYTfl6cD/WSjpjEKM0f8QXZw/9LFLq5s47ekiK01Yb5jiZqNHvITc49zeK2FSdF1J
         rVH3+eQsQwvlCYZ2dtdeKfeeZKpjDjPs2eXrzgF2J0UxoD1gg5TQQtGsnvtoIQ2rCpVO
         7VvVhInqYDtvDnlXFHkj4b94cB5JXane+2fX/FMXtbQQiVIaajFxeFoDbTF0KnK5pi/D
         hiunvss/Zi/G+8nGPGyosqf21CgmcPIctwjs1vqKcwdZuc1B4bxEFwc9UKJ4C7mhBJVX
         SMmwBg095gqDY09thmHMFZLgkJMI6eYhPTZZSKk6styZ32Ihicvo8zaIfuz3qSakP62b
         tQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445650; x=1796050450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LzrFFR+hhT71ELT3fY+ftWxMDxLj5bwX900H4igILI=;
        b=PUzC4AISvKzDnNCrd1bJqLcNeANT27xDjdKqMIi0VAeY2cyWigx7U37tap6M1odh5k
         +Il5vA4nvi2MMbt/4K3GcjjbJIqvZOPfDs0X3EZq+HGVkJtw/Q/FyQS8spUpR35TMzZX
         SvYOWBXBBjIewf8kfzbaHsELehC/MbpaZjMVdg2SEbMJLf54X9LtxSqcwnwUwMICK9/N
         PtYd+vZXAk1RSJwdwvIID9STszesFQZ+17DdlVaq5KaX+T/opY7CHUFVOVlD7YvHZWx1
         q7l1kjbrZTpDlMfzVFhtJ+Tfz+OOWBMTf/XozGWE2nZ1dDdA7OOGpl25L8frLDW9qBaQ
         cYgA==
X-Forwarded-Encrypted: i=1; AL+hErHNxZrgk185IvRrVTcR8y4XEhmJO7Jil5exNYfRrdWga36oWxibEOPpnQwc2h2aVcnBDDl0IWIgCM3k@vger.kernel.org
X-Gm-Message-State: APuU4Z+mFnIZIgILpZBOkH+AfyRol81/ikqgsaB81hW/ug3/uzfvxt+a
	fI7ZV7HrTUdnfAw/9TB5kug7E/HZt03Lz9cwOV3+cbkVRD81+iyIIDVno6bFN7HN7Wk=
X-Gm-Gg: AZFdTZcs2lwmF+ek/DTfUmtz3tQI+T1GrOtCymKlJnG84E3wCzio60g9FJebnatmY0i
	98SFapeE7lRW9+QavdDSKzvwq88wXb6tqGC2P8ljMJqKyQNx5rFyYU4aCBUmt7pq0lWIkPSiaiA
	1V4Sdqe3CkRE2SRbgktQbhyxxRDuZA50yQxxfeplIosKor1QTj8SmBwON51IkOhPjQ4zrWLWBOb
	ZqAR9z0jdUCEsmIVb3pWIfPE8wgtrLzOT/N4/1TLDuCqjTDoYg9zJvPW4OVFgBHKKyFWfF8jXfe
	B8aPBlk8WhKJSpwh70eRLhQfurOIrOmKOWQYsG+8YmUOrDpXlSkM79lnRkXQoP+zBLB4Fx4cdVU
	3JcJzvk/bi6H+Xsj+9zOaKHz9QQqQyvIyZckJF7c0nKbJ3ntkwAxgfEpOvKI+n1K952Re4d2saU
	5oMTrkBdNymcFexOe/NIRvgdJkC/BhUgT14xdTgMbwJW3pKJ60n0TWf0qntJn6e4anUu/cY2SGo
	p2LI8Vo1/ZSl3geQgkdiWLCIVeV7iDyX4rDHQxfNrXVI4LTRF/tVGxt8MsMxVSa6p/+YI63ogsf
	zIz8VjbCFDPNzMkySDUQ4/Ajipk=
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr16463654f8f.47.1795445650449;
        Mon, 23 Nov 2026 06:54:10 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm23615057f8f.31.2026.11.23.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:10 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 28/28] arm64: dts: broadcom: bcm2712: Enable HDMI audio
Date: Mon, 23 Nov 2026 15:57:06 +0100
Message-ID: <20261123145728.29082-29-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

The HDMI controllers of BCM2712 feed their MAI FIFO through the 40-bit
DMA channels. Describe them, so that vc4 registers the HDMI audio
devices.

The DREQ lines of the HDMI audio changed between the C1 and D0 steppings
(10/17 and 12/13 respectively), while the flags request multi-beat
bursts, wide source reads and the AXI priorities used by the downstream
Raspberry Pi device trees, where these values come from.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 9 +++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc..97a4b819c01a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -8,6 +8,15 @@ / {
 	model = "Raspberry Pi 5 d0 Stepping";
 };
 
+/* The HDMI audio DREQs changed on D0 */
+&hdmi0 {
+	dmas = <&dma40 (12 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 (13 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 7ba0fc540257..b7d7623ee9c8 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -483,6 +483,9 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			/* DREQ 10, burst, wide source reads, priority 10, panic 15 */
+			dmas = <&dma40 (10 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
@@ -513,6 +516,9 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			/* DREQ 17, burst, wide source reads, priority 10, panic 15 */
+			dmas = <&dma40 (17 | (1 << 30) | (1 << 24) | (10 << 16) | (15 << 20))>;
+			dma-names = "audio-rx";
 			status = "disabled";
 		};
 
-- 
2.51.0

