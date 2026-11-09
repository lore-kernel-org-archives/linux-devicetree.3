Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251724;
	b=BiDfqtLmh7Q6RopKExVoYnIbnOPB6Zpw/eGXZ3kjbtu9A+g7goWRaYJfx22SgL2O3PPL
	 ZBYwzOzQ/KeoaESrm6sdZi0qSlKmigOw0AheSrGSgggQfP9UzbgTrBzbv+KgHk9g+gDW3
	 C8sPWgkL/mTcQpnY/jIywVQrm3NCIZxFIyhzug99cjSHUptxl+ZEZNzeQ/h+DehBox/OX
	 FYRVtH4l45TNOel/ezdDY4uqBCUQajZmvVLR8ldIfA9WVU+SYTVEChrWs7HzaH63lG9NH
	 Cywe8bh0d4IbOcGXSYL38Erh7rk+fnBYEfHSBnSSY6kME+BbUsnklVrglr6SYqKcayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=;
	b=EbotZBNeAr9kun9Q877+bfkJW8dCB8liU6iud+NT7r9HNMkyABJz3JDV+xa3OzYJV59F
	 /YZ79QaYk1umyv8dGmupcDKJH2kL3eFcOHh4wNVlBVsDdwdMGFfF/yeKNPmaCuAmlr8Id
	 3qq4RteYZofQlWmBW6PDP78omoxrmSBwqvqPZEB/LyAaEzYGjSKmw5zO8lo7DF7Lsfu96
	 h2iQaOhXb/sHFRyZ0A14lq2Xa5aK5Xd8Ozj0lsV1g/2DbyAEIJM6FPx/H8FX7kh6ZXPl/
	 ynXG9ckuotH/n3+bOShVXny0S4H+216Gi2HGri/fx/aKnpvYYd+ylNu9+j82buh+7wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8b21OmD;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC330606A334
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 19:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC330606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8b21OmD
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso966588eec.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 11:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794251723; x=1794856523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=;
        b=Y8b21OmDMSSkJP9Tzh0krIHPFzrpRaPrewCuQOc2mZr9BLZuWFE8r8fUaflAt4AMab
         haL1A/lWGiVSri4DXvPSpy+Y6y3y0r9SxhV+FH5JoPTFk9lxrMMNexUyFrBQfxD7q3DI
         kgJE5p7xnxaGaroNTNpsYj7frtb90iUIMP7qi5wSpolcrRHpRngGW7AQeTOcjcFt4ySy
         g+Q/XKKfUvYUMNryS8v69Pwf/lipJkUxFFMshTy45fUrWwqolbQmkq9TnhulI7iTpNbX
         QcQ8RI/P/9I3fwE5zZjmYENV8s4ENgWIcAQWA6msu2yDLnW7qqd1kT4a5+ZaHAHcjgVB
         mNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251723; x=1794856523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=;
        b=KMf3swVD8E9Ew51KMgQFJU1apPVmKt7OlsGoCTGA0vkiWquWIXUaJZvePN0auAfDeo
         zt3Arfm9IWKafOCR8NbOil3OJZnEaAOc8jcnrR7u5753Y1bq3Ff6jER2/hXlu6PcRfNL
         yaFB0qNUnZ6l+1c5kcOrf4PNgIQGCmrHMxNMJBDrl9wPha+CJjvywaFpWdyvYVpcvrhJ
         w0GPROd3tuSho7jD7QRq400hGgoiSoz1JtJSJcEPYgMhnc3HPGXM+TrSuIRC2BgLGDbI
         azNycF0yYCNGjBNJraMhS0YzwvO04SZV7uoh7MTIDpDy9736/IaZEQXJvCPnYQ+NSujS
         9SEw==
X-Forwarded-Encrypted: i=1; AL+hErEny4P4KPIyhJILEY5zXvMpN9J1PLZBJ1PA5s4mNAqGvBGZw+dHqd5/tkJXmaxQYRL/NI0j5Mp1YOC5@vger.kernel.org
X-Gm-Message-State: APuU4Z8uUwntUiYiH3+Idej1pECoN3cFKA9k2Fbwqeshb8Z66lNTVswJ
	Hz2EcJ2ULR1ewws4KNh5F6XYz0jVVJMnulO6s+n9+sFOVLaMVq97rQzl
X-Gm-Gg: AYBFou3P9BYGb508UiZ6PCyFuOcFdlsgg1PiFsRz0xgO6Ark6/OWISvEMtAF/tINur4
	992numdr6sjaAsPq548DZuo4NPlNF25UoZrH7ko9MlDl71W56z9FBZw9HsyYwWqz0QkDku8FzDj
	s4R5ch9rwjzPt6ynAMdEMcJGdzMSSIQOA42i+9Px38vKnGV/zLrBbEaTKh/TWAis2rCdz11YNMT
	dj5pTgJayPq3eGuKUT6pLqNN33R2mLjsReR9v0Mucrinmi9Vj16eYDLa88yUQywFS+AbGt8tVpV
	Ct09i71RDa6RZmXwFTZOpwTVBB6z+EFiohcB4/9gfo74VlCeRWCdfTRQs9pRhKT5zh9zaYxsuA1
	hHPC6gbe9Gql1Hfj83+dsSP8LOnElqo/Jei74Zm5I5jfua+vz8mjDOwaIEgDLWk8ej88MIP545l
	DxpzcHrnXaD83Zogc6ilENpYYLvTau16xxDIbVRV8kiFjReZ5DCtKlOGfHsaBrprUSZ2E6ZdRJB
	hBvJRPTEX6y44kQ+SsP0JQ7Qsw1oIUoNl0MeYDeftRuqsjdAIIvp5oJZJlPORrgtEBN+/mEHrLs
	LlRXZx/A2BKZdEH8TfHfbNS3oPDrmEuSz7oMVbNdUUBrPBfU9FU8cUAZLSXPaUeEr4kqwTI=
X-Received: by 2002:a05:7022:2207:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b3b5fed706mr643373c88.18.1794251722468;
        Mon, 09 Nov 2026 11:15:22 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm788478c88.8.2026.11.09.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:15:22 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
Date: Tue, 10 Nov 2026 03:15:15 +0800
Message-ID: <20261109191515.252449-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The LubanCat 4 PCB adds ~2ns of trace delay on both TXC and RXC, but
that alone is not sufficient for reliable RGMII operation.  With
phy-mode = "rgmii" and zero MAC delays the link comes up at 1Gbps but
drops ~90% of the packets; the PHY's internal TX/RX delay is required.

Use phy-mode = "rgmii-id" and keep the MAC's default delays.  With
this configuration a direct link to another 1Gbps NIC passes 2GB in
each direction with iperf3 at ~859-905Mbps, 0% packet loss, and no
CRC or error counters.

Fixes: 6d9430d58714 ("arm64: dts: rockchip: Add EmbedFire LubanCat 4 board")
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 0d28c6165..a042aa702 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -168,12 +168,13 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	/*
-	 * The PCB adds ~2ns of trace delay on both TXC and RXC, so the
-	 * required RGMII clock skew is provided by the board itself.
-	 * Neither the MAC nor the PHY should add any internal delay,
-	 * hence "rgmii" (not "rgmii-id") is correct here.
+	 * The PCB adds ~2ns of trace delay on both TXC and RXC, but that
+	 * alone is not sufficient for reliable RGMII operation: with
+	 * "rgmii" and zero MAC delays the link shows ~90% packet loss.
+	 * The PHY's internal TX/RX delay is required, so use "rgmii-id"
+	 * and keep the MAC's default delays.
 	 */
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2
-- 
2.56.0

