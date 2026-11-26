Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708934;
	b=xLkuWrUD9XEXCYg0VgfZhRhy+1POG1m4kKY4N4bgt1fFsFViYZCM7Mat8Q4KEPYaGJA5
	 ECgRZhq3hCWTSxnZaI75S3upeGVz1nXrEShzxxqlURTxo0qqmzlkNRP3AXdlykWbIr8Na
	 NuCzDV5jKPkO4kACTnbOaVCiF0zHd8t5o/RapJptAJGBDzfmhehxlo7e8XPtNRf0WJptd
	 R5Is5TO38g8uxeOm9XUfJQpBe8D5Mp+EDdMJ+O+fnBgK9HSGkqPtyWShvXwO1kZWs1FsO
	 ab1aammW1dbrYgwyRSzx6NwZYkeT8QqxboftY+3KqKk9XA4uqcGYM7zivPYsntzGQqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=;
	b=tfJZSc4gYVwwuhnK2V27DUEKoHCxQcSbh+UUlijAjZeANat7qRjCtyAImb5ky7FS7aZv
	 M4STdSAb9bhynxXoMBM0BbnPxMrHo9YA9qhhQZCkZAu2jQ/EZle/HQcMpJHL95FzhSMZD
	 5DCd9gbLoPYtwzIAlEUziWWe8BBbqhlTDrscVXi7KfhVMOgjlK0C5EkDRd2xO+xvN8mSo
	 RXqN6j9QQeRuxkKlvUG9zQt0F60IzbaZRRJaK9ZZaduttnwTd/r9YPrv1IIWzO1lKPxBb
	 LiyL+48/gRlopunCH+j7f+rc/mn6Xm0RFe0sGzTnsJb8m7Ewx32Uu6gm/VpPaWOd3dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9bQezl+;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0E606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9bQezl+
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386bd881d39so7236138eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708933; x=1796313733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=;
        b=E9bQezl+vPZRAppt6clVXbH3hbgfRDZf0rswzMJyoSWjKBowSAqAq8E1HU2mNQHv/e
         hAY0IlC9A1AXXT8MtWHR3aa/4oynKVCvWn5Z+YNX8vw0mqK+Dh0eqeZIFGL+0SxnCSBq
         Mk9gH1cLS9bsCsexp8bc3eDLbAzyxpI1/X3BankRU/uth+Zc9AvwIfdavE8Z36Tv23zv
         ibVA1foAD+ZHQN1jLaIelhipLcz978kPhiTSu1if2SIM196ZOsMmh5wHPhe7ymFkz/3P
         VD9P8JDy1Gj2Kk79kjzCoOdgsvb+5Wjzyiyl9ALBc7s42lCZ94M5JlyBjTAxbJ71tIOS
         +Mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708933; x=1796313733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zNw8Pd/JqrMGg4lyFXAavmYqzgxCJ5fQLfj1g0DY+s=;
        b=ElUvhTWjiytZHaKLKkJREFrNmiZz+PfbsgTxTu4Ow2sV9T7mH9qvYLRPProwZt+rJ5
         YQUJAbK2AwOCjw/qmYn9q+4jIF2B0ibvxD4CISOFRBrnYJEBmtVZs5gYDmHo6wRioDqJ
         FOvTw/suXUg/TChDmG7RprS6B4oshmqu+BmEPhiRZ60Jua84VrELhDBl4fyessZ4bW8G
         gxk2DurMaspg+EefzjbTy8HsMjTDUUXoEHbW+hQr9cEsD8e7HWqUSaQNARmbG+tH9W1K
         MVLVBjMBvpP5G8tO/iRIwRCsBjj+8/tQSMGPPL6kuE0+uIdmH5f93KnVaOcsGkNxNWdy
         Qckw==
X-Forwarded-Encrypted: i=1; AL+hErFv2ws431EIP9zkL9OSMJudqGqbqCwaAW6MHxUzdm5x1owpuiagZGVC6V1ZErfdhPM7PgeE1kq12ivF@vger.kernel.org
X-Gm-Message-State: APuU4Z+6rHCiF5ZBIFS2a1w6EBRD4kDvwMcJlSxr6Jda9sWorgtggKaR
	l8ZoqdBJQRDzuK5yiY28x5xgNyGlEpY2cuOP6QM+rO9tDlPUTwmdNqzd
X-Gm-Gg: AZFdTZcI0vemXk9Zs+ZMqrgUy0hhkImwSsRjezDe/8QfWcJOUXwlgR/KfKwudVDC5hc
	aUhe1e1p5gPeVwYIFaUvtGRoMErC3QLQzSvg6b/mLo1oAN+zDcN52gQTj3+2+u8kMkpL9pMa5fA
	C36jUMHZIcmFs7xeL7lRSRBk/LNQ0BqJa5UUaBBqXxtg0bRyCrkdbFSAUbyv8zw3JfFmcowndez
	Ws38ZLSb35u3j0NOr315Z9EpirADL2h6CidwuQuv/qrL64ElbUkBIveHm/8DxT0ZfdavoNHF3e+
	IAp2/Bb4yQvu7eujs5EurLjmZ+Yv2Qs0G/5MPPbiu85jSulqcTPjoWm3rDFByr4LaMqJdSZJV8C
	W/1nDcv8tWvF8PX2Dmjlc55JDlVXsnDke69FPOnrUclBaPJ71KfvxhufuEBlRLxTTh1k9PqVhL0
	G/nsT8jWixfod1fgJrYDPBfLvKO8Ul4TpTp3uKB0VS+8vE3DtqbyfADwgFZATwZOOn1cmbsXkSm
	V1D/fhSDHHOuQSCXkBSCRid/sz/4c1EJFbmmOXpTD96NIBIfYXPVaXBCOaTtrk+AYeSng80kzYn
	FcpfWfzfRdVrTHJUiuDtBgAeMIdBHAGLkW3OrgYmhJMkdA==
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id 5a478bee46e88-3857180d3b2mr34804423eec.38.1795708932635;
        Thu, 26 Nov 2026 08:02:12 -0800 (PST)
Received: from localhost.localdomain ([183.82.206.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm80062260eec.11.2026.11.26.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:02:12 -0800 (PST)
From: dineshkumarv85@gmail.com
X-Google-Original-From: dinesh.v@adlinktech.com
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk@kernel.org,
	conor.dooley@microchip.com,
	s.hauer@pengutronix.de
Cc: daniel.baluta@nxp.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v5 0/3] arm64: dts: imx95: Add ADLINK LEC-iMX95 board support
Date: Thu, 26 Nov 2026 21:30:59 +0530
Message-Id: <20261126160102.52163-1-dinesh.v@adlinktech.com>
X-Mailer: git-send-email 2.25.1
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

From: Dinesh kumar v <dineshkumarv85@gmail.com>

This series adds Device Tree support for the ADLINK LEC-iMX95
SMARC module and IPI SMARC carrier board based on the NXP i.MX95
application processor.

The series includes:
 - Add ADLINK Technology vendor prefix.
 - Add the ADLINK LEC-iMX95 board compatible string.
 - Add Device Tree support for the LEC-iMX95 module and IPI SMARC
   carrier board.

Changes in v5:
 - Remove duplicate GPIO expander mapping comments.
 - Consolidate GPIO mapping information into gpio-line-names.
 - Update SX1509 GPIO line descriptions based on the latest schematics.
 - Add Reviewed-by tag from Daniel Baluta to the vendor-prefix patch.

Link: https://lore.kernel.org/r/20261125113845.297658-1-dineshkumarv85@gmail.com

Dinesh kumar v (3):
  dt-bindings: vendor-prefixes: Add ADLINK
  dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
  arm64: dts: imx95: Add ADLINK LEC-iMX95 board support

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-lec-ipi-smarc.dts     | 118 ++++
 arch/arm64/boot/dts/freescale/imx95-lec.dtsi  | 609 ++++++++++++++++++
 5 files changed, 736 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec-ipi-smarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-lec.dtsi

-- 
2.25.1

