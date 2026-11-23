Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453078;
	b=ZaJXOQSVZCBAPuqfX9HZyRxllY4ApeBy/N6U9Qx7h6ijMUFZzOYznFk414Q70HWPs6Lh
	 SU26ahyRhUilai9Nd/H8R34l6i8iCHx1n41L+HX9Maponq5cc6G7niGsSFRxMAaPGs/cY
	 npmCx9XwQOEoe7OPO/KhKdPMnamsEb3nCkAUdz+2PUNMJWz3BZsjNSS5FaiofpSv2FDZi
	 CprwWT2rNxC/9AKzMax2L08oZEUaeknrlj4Q+La+aR1LyOHULEKx1qYydCMc5Ca1LRtVt
	 PotrBokz7neyFNAya+cmIHjdJy/lluFmPcWNOtpuOvst49GJuk2eEpy/JxZYyqonWPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vPQa4vtqRqby5WDNW845XbNQIUuJKanxgqfCE4nY6Wg=;
	b=aqqb0Ms7KYbPMCXVVy/jKkFFLPNfCs89Hboa833kXqgZfKPMOmsWt27ZBbixi42xeb7u
	 SLWGrVKBN3JUGMJONKG+l9kps2c2FM+F2iXaPj/Q6UfqHhN2FBi2ZVBzArBqBb1FIHgZi
	 0jOdWggeB+10UqjaFEX0+xYZ1rBbCXbNWos6xv/DyTSz2mHOhuLrKoe/MhE48L+ivE5Mh
	 CAdwefW0OvEgP7ZuKwr+DsbIQykSYi0IXF/ZR6/d+0IuK8HSpOznJIxK9Q8dXiyPKwoqA
	 VEM4MEB6i3ZlniRPSKBq46zmOuKK0gsOgx+hlkI7Lq2QRBGStGhhbj8rQfbFRi3AFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I0/nl+4L";
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E0606A336
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A8E0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I0/nl+4L
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso3083918eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453077; x=1796057877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vPQa4vtqRqby5WDNW845XbNQIUuJKanxgqfCE4nY6Wg=;
        b=I0/nl+4LGkp6UqxbJmvvG+msXYu/PN8Hgdd87dydn3XiFP5gMX5jXs4xa3fI6hJe9l
         qjX1eNYBe1ZIfdGAkSwv0JVcTc9y3O/mN3OqODaJpLJAiv/sR7Q/hlDiPeT/SETSF17t
         /oddYWbAEYHid4FjPfOBHbIHm+E5dqo63aC7NjL6yNGGlZTYd4mre97zj2ka7D30el8H
         viOFcngt4/YMO+BCHD797PTV2VKOPLaYZ/2OXU0o9SGmaGv3rrQkxg4KnTRIJBSWlcd7
         50Faa+Rd58okHwm2wsnbgTly+YIzEi4AM1iVJITor31fNzb4cw3dlB/nbDJJEa/dTbDB
         BzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453077; x=1796057877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vPQa4vtqRqby5WDNW845XbNQIUuJKanxgqfCE4nY6Wg=;
        b=LGwF50AXuQfkoGPPshvnVsKTKxxf31B4tYmoxgXmHPyJ/YQE0N4WS1kVh9nMGKtnfv
         8IFOstiSXam1zRSSYeeAm2liKE9brh1Pqq4v7xiCEuep8pEMvkF1n36KrrtLCxV3pNVX
         cIIGd6f6D10AZcdJOsTNbV8twky5vgAd2g5vaIYH+f6uVla0w9drXRuYG60+6ccatloY
         UG7w2tUJuPnOUDDkXaLs3+0AzmHu+Add9K/jSsaNbnmaDbhIypDfAFbaoHMSpmY/ekvb
         awwXFjcB3JfkRiFroqOjK+bHvRyVaN+xrYDV8u28o2AH6Q/5RKhPV9EM2yPgA81ktiee
         MKZA==
X-Forwarded-Encrypted: i=1; AL+hErGpJrSpeGlOjDPe3vIAlpDCKC6riwPWzhOd6wd8b7iFVKHyf7yROadDRSHZUb7BS5D+uSPrxT5UoLoT@vger.kernel.org
X-Gm-Message-State: APuU4Z9kNBy/KvWY3iakgppx6l9r4UnChDFTN86HWUT0CdYKArstSoqo
	JAfNnSBEprOc30QFiLxQEymdcZnhV1qGcUP/jxdAsmDdjsCnSnjhiNyA
X-Gm-Gg: AZFdTZdZkNU+tVvVpRd1qObiM483nvkeshWIAxWPUi2L/buryghQngpbgHUky+Ki5qR
	ztRyc7wFuD7hlFIzU6cq5OGWNVeDwNqG59TlinhLYy9wCTV5ACSR9uH4hOX4hG1q+lmyXbcnYCf
	OK47Zn3+6XnHzEDyY+jdmDIaXHBv0VbCtx6UdujnRCm/xcKLJnMz0NPkM+vr5lNvOZ9DxNPSNNV
	2fUmz9yQ1zDpTFSuz0qDAMyy0Jve+PoFaxDHOYpJ+h4kn2LK/1bzwIsUJZcKuhUc2PrQKIQVX2S
	DiX+T56VihUhB56b2eAuZPErGmYlnU5RX/qcWfEvVTI2EHYGlO5Y1kDWZghHFme1O87J4RT/QKO
	2Qy8raLWxGPA0k3/dVECREaXDzK96LhMI0lVwa6eb0o8JyRNM6su0ocr03gdO2NoYuOr2/P3UZ0
	K1p2LN3UBHEsWErfPONOc/I6K+SyiGxEuEwADxSuTixTHctIjRv+7CHBRikE0c/+B1A3kdm33mk
	VFDEIY7NP63AwqElkT0Vy7maGQiCMVLyeGlRa8Io5/boEt87qpoxXBNDS+UqoXjId7X6OrcOXOm
	LKZcUJMvn/Bs90KqMEyiFrfU0pR4VqWr0H2Pk5p+ih0NOnjHg4or+D6iYxo=
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr13616256eec.6.1795453076526;
        Mon, 23 Nov 2026 08:57:56 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm13315280eec.0.2026.11.23.08.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:56 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 1/3] arm64: dts: rockchip: rk3568: add XPCS node
Date: Tue, 24 Nov 2026 00:57:01 +0800
Message-ID: <20261123165703.667564-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123165703.667564-1-coiaprant@gmail.com>
References: <20261123165703.667564-1-coiaprant@gmail.com>
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

The RK3568 SoC integrates a Synopsys DesignWare XPCS that provides the
Physical Coding Sublayer for 1000BASE-X, SGMII, and QSGMII interfaces
via its four MII ports. Add the XPCS device node to the SoC device tree.

The XPCS device is accessed via the APB3 bus at 0xfda00000 and requires
the CSR clock (PCLK_XPCS) for register access and the EEE clock
(CLK_XPCS_EEE) for Energy Efficient Ethernet operation. The PD_PIPE
power domain must be enabled before any register access.

The XPCS node is disabled by default and must be enabled at the board
level when 1000BASE-X, SGMII, or QSGMII is in use.

The XPCS node requires a reference to the appropriate Naneng Combo PHY
through the phys property. The SoC dtsi intentionally omits this
property, as the SerDes connection is a board-level design choice and
different boards route XPCS to different Combo PHY instances. Although
dtbs_check only validates required properties for enabled nodes, boards
that enable XPCS must provide the corresponding phys reference.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
index 2f42bf26fd9b..c8f846e5ad9b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
@@ -110,6 +110,15 @@ sata0: sata@fc000000 {
 		status = "disabled";
 	};
 
+	xpcs: ethernet-pcs@fda00000 {
+		compatible = "rockchip,rk3568-xpcs";
+		reg = <0x0 0xfda00000 0x0 0x200000>;
+		clocks = <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
+		clock-names = "csr", "eee";
+		power-domains = <&power RK3568_PD_PIPE>;
+		status = "disabled";
+	};
+
 	pipe_phy_grf0: syscon@fdc70000 {
 		compatible = "rockchip,rk3568-pipe-phy-grf", "syscon";
 		reg = <0x0 0xfdc70000 0x0 0x1000>;
-- 
2.47.3

