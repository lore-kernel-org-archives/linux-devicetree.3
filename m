Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678986;
	b=Lcxs4BVPZ63eAMGslFeo87Dz7qCq2p3WxrFzaly4dTqNgWSmABk2mTK+4ox628FMBJGo
	 QHv5WOD/mafGqEmSDZJ8J8Hbu+1drZDbPNbFFvFAAZ9IjCnD+xlSGNh8Hc/2vLfI1rCAG
	 U3XxfexE2hjS3a0pV5NS07mgkGtjScqUdSk4BlnyWQ7ZJTcXCBMnRgfvzx6z5W+NTmj5o
	 gDAS9QVTJCUI8gaUibkHyxx36eavuB9jXzD/xvYgmlNtVnjOYvtzwHanM8DFrr1GY8SWP
	 FxjO9681lhkBWXEz3MORXzhjXPKkxCc4NkwSwfoZYxxskYZCd+78A33FPMPg8A3dk9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:To:Cc:X-Mailer;
	bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
	b=pYN01RQZKjZGHtySQRW1sN5msRmQ/AQmXouN0q15T6UgIBeSymB/9jhCGeGCkpvR4Y0W
	 FmdwZttOivTRCpI8gY7hRefVTGDRSCRrx+BEJ4NUvvJSv8T9GO04DVOcHAvKQ8rw9FV2m
	 yEHMK74NCoWN6f5yhi76EHiNVYrwjcbgZO4ICc0vcUkx1v/5qoqcb48ZJRKu4WQ0TEdbV
	 bKUHPOyI9GsmvnitBYbt3J3jUz6mrVpinMdLznp5dDMa2nyvJGYJgFRrJPFFbbDuvQPrv
	 sY8//piom3eF/gAeMppwffnoLED9Hthb4YsqzBhysExs52NNokCCqgKflmYMW8av0DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oefI+SRh;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA3606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 14:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ABA3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oefI+SRh
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so12030965e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678985; x=1793283785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
        b=oefI+SRhk4UgRTuRM47u+1b04l6u5XLZOSIZ66bQL0wJyvbFLyM4Ug/lbN3QkWZI0b
         vZkYcN3S/tijHM0jbhSVJ9GrpeQ+VVma7DHe7Xe6o2cTEh2kFW9zVZP8Njct1r58gts1
         K2vN+nVpb066Ma84PrlKbqLcb7FBWH3zjd/ojMYzg7/W3WbFRGAQDLFtgaP/mSoavT5q
         MmvuNaBgH0kt4kr6S9AG4Rwuiz7eY+UpY66O+XI5zbk1BrNDxhrONRgMBHNqbZGaH8o0
         EemoURaaZkqTZg3hfKpYE1pKu2e0FqTXt96gmF0D96zTEKF16Y+zZahIOkVqthsS1+LH
         dChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678985; x=1793283785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
        b=Jhmsdm10bfcSsoN7R4zYiDoPVYS7teu5mQoS4+PL+JgBhqjOUOoF70pw2sg04kr1GJ
         LvPgbu3ij2lxuT42efXQc2L3iZmyfrJ9RMq6ge2kFK+IYTtaXTG8hKhOg9cvDHGi4QLd
         QnQf4WQb06b3pE+cQip6cGsLFL4yQyvlPFejkrAjn2FkapizTq6bt87C2S4rfdHboTXP
         eM06XspVh6m0YCw8tPCUjTwwxTn6Oa4JQSgQMViyh1XdqJcDjKzlRMRggRWiBVjeVFRQ
         upoWeX9VZTZwhtBDfZl98h7gB++RKZHv4FLXrS0W9cb9IHgNgjpNKxHXBESs4NDxJyKA
         GjDw==
X-Gm-Message-State: AFq9FYI6fS/0gAv+044q3rgdSD0cwsbY6iXO4Mw4T0g80J81lOPdaDAy
	CLd61Gl1Lb4wPC8XbdNWBwDNHTy3PKTzNKeRS5PpxGLttVPT8I++dXEa
X-Gm-Gg: AYBFou2mkqJ2lq7ZS+ODrMM99jkXAVgApFxgMwRGMMHif9Oyhg6jE9ezaRgRhauITRj
	gW1+XtcgbuizWg2A2P8AHA5zg6oMDSmHn/A2+z8twf4+k1GjEQnLioW01UST+gg7OrPI5vz7cTh
	VfnXpPpkzZ5f4UJvFy84OIwD35ezZX8drYM2SmNcUSXS9Ub8yE9R2/zNNr3efEKNqCCr/u+WqS4
	oaVeQNBa42c1ZsEz+ALPI+CaJCEetUrEoHR2CaW089viCzv0neKlxttWWHedlY+dTVrr+B8v0Fa
	bnFVMe4I0/HXyiYDjDXrSfFlvpjKavP6m7kDREusZEevNHljZFdHiQvMqW0Nth/Q5xDdcs6+/hk
	camipngbRlHOXYQUV89rQZ4v0c0ZuE3YEZY45po2dqgeYyAsJoQ3Y7xRemAJYTIV5TdlPbtJ5xX
	TVk7w+34HpkC2DdBwZV6INKPhcnvT3Ubqkzg0H+zjO70pjBkUvzD/9KskkDn/hD1zGNjDalSe48
	jq1fkGTPCe1eOD9pyffnl/3JffIi3/6jIAENdWpqg9u18TKeY43itzIPPdX16WY0iRuTnqjbGmB
	75+Dnz4WTyubcWmVbaH44Twjne9Aff2L5qdgcQ6xSEWNRgYFbk7vsV4=
X-Received: by 2002:a05:600c:a49:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a204b20321mr50739115e9.11.1792678984170;
        Thu, 22 Oct 2026 07:23:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a207b29276sm95945435e9.6.2026.10.22.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:23:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:22:59 +0200
Subject: [PATCH v3] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
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
Message-Id: <20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com>
X-B4-Tracking: v=1; b=H4sIAEIc2moC/4XNTQ6CMBAF4KuQrh3TH1KoK+9hXNR2kC4KpDUNh
 HB3BxYmunHxFm+S983KMqaAmV2qlSUsIYdxoKJOFXO9HZ4IwVNnkkstuORQMPkwQIhzGyeIDVh
 tUOpWt00tGM2mhF2YD/J2p96H/BrTcnwoYr8eGDfiF+spzkZMFhJav0ARwEE5o2qDzj9MdyXJe
 pzPboxsx4v8gIJz8ReUBDZeqFoRSPkGt217A40DcXcRAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
This patch was previously part of the Verdin iMX8M OV5640 series and is
now sent separately, as requested on v2.
---
Changes in v3:
- Split out of the Verdin iMX8M OV5640 series (Frank)
- Move the UART_4 overlay to the shared Toradex Cortex-M UART series:
  https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com
- Link to v2: https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com

Changes in v2:
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261020-verdin-imx8mp-m7-a69e26868741

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

