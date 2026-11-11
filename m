Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428631;
	b=bO7t70YlRYO+0Xyv+qFEaJDdLYn8Pn1SbOMbdxFnhDb1QJNd2l/5AAZklu/vBJFfMKZo
	 z2+l9pgXUpWGr3j+JjBT1OnHvEYWMsbGhkueaLL+mvt1c4x+J+ntp/PXxHXkHSxu/z+6f
	 2+Trl5GnykzYzTltT8ScGf9BAx0yVtGJwT2N7CjRDdjmPyYGDlrEz2dhTwvTs0jrNSiUV
	 sZctQPLjiw6kNyfJ25fFJDvrtRk/B+3udKIDjVzacPQ8oOfAwQMDmuu7YwQK63bLDJ4p+
	 B9MV6jdogPn8zYEVDr6AoiB5H70Zs4Z/NabKJ39G1JqBAgiNx8ycXcEyGEYHhg1YQKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
	b=vHldQ1eBUriDPg0ahvi0Nsvjkhfm9obj+vUAlIwM3ZzQJ0E/R/TDQRKMmMxCVg9dplwk
	 yGcFRYx9nJKQ4jAqiozpwTCu1dpDlxS/coYr/UpLcvulKkLtITNH3DCvM7SxEXX+ijAPz
	 PVKx4X8RSdOkGeBRkc0K2xZzIfT30xiiVjkSqN9mlX0UMqletjYHViD0g9Zo1LmwR/tkS
	 7qIU+mhFf4xoSpwO/mgM6M05ReBMa0vUgTEDg+REA3DSHgHr7aw1wWvuXpFhaisKnjQJ9
	 hIzHRpk9zfEBLhiFiSLeXKqhWp/9zsaV34MEgQFZl9fVlanywMVrV9D6aiFfM9XDfRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvVQJW16;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B29606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 20:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B29606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvVQJW16
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so2774741f8f.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428629; x=1795033429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
        b=zvVQJW169YCl2FNv5XPTZUnB12yoJm+4jxM0NiJnDOVIPtAqUg6eYQ3foS1EnyNukP
         eTcWw99nUrY/yYWpegdwesAg5R+XcMpkUL60Gg3+8857AfWtcNZSnd3iNlAlH45m1k9R
         gmDy2K5k0Rik78HAIafesPAcgbGe1B52O4B7tSqGymO+tCLWGx/b+3qGo6v8aVAM4yE+
         7NP79w2BJqR6HXVJ4tZ9cG7DfXf/F1JqsxwhmIG1lsXJvO+zhcENxKFAUo3/6l8AMaDC
         uybUfHV2d+yJp9sf/PP0Rr/bJgRlZ0dTT1944Xg22EPxn+fUqcMu9uM8h6qEAAN+SxNO
         04ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428629; x=1795033429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
        b=b7e54+U/C9HMjSBBgq+OmwiUyiMxf2X8R+dEVWaG4VVIGQvFxd/e5cSy71JcG6isp9
         85GbyuLTSNN2DbKNfkxM9N6tbY4Q/vRBipfKTPnsK50sxjOFDk33BYiDRWFy5Ctkj8je
         l4VoYeMuzOMJtV7myfHV+Vy4k93oY/TjYFB6FPIdGPy9shVA8/KiXvo5YD76zWjHsc2K
         +fj1lcAbdzZTEz57RExeO3awL/QwNUs8bPN3rV/YRuDRIHy7d2b/ZCVW0E8rPP/YcgHS
         i7PocpYSGSkpq2Zc+SupiWWXEJzxG4KJKzAzKtKT13q2xvkQPKk40DDl1C74hkZFNonD
         jGGA==
X-Forwarded-Encrypted: i=1; AL+hErEvyW8Tor07com79NMeScwaQv7Lw1N9ZmRH6IkNWN8uCRqrDyqTFewjLIuQbiTXoRCj/en7PUzwlDPl@vger.kernel.org
X-Gm-Message-State: APuU4Z/HcFXxQUVVslcvrYCHPo9+FYDR1XMagmUsBktYGQaC7HNrDz6r
	FGVXLmavIcGXRL6PzvdIyS3MMqDUDYKL4yMsQGX9CUZH+q81trksCQWZ
X-Gm-Gg: AYBFou2/8EVfJXRijbdO9zxAvoqPZ4ojB33ILwx0Z3Z4ino4yMNPfIhWsterzkTulw9
	BszKhchI4oOkyluOC3ev0xI1INRSi9SbuDGkBGbpz/BWts963XGTNkeeHwL0g1IBTvD6S3WYcj2
	3iVQJ1kP4TwDzwrOmoM7U3CwwfjR98XP4fUqqQ17tCbZpsBG42nMZ3PXTQj9uuT08dFgcdNEl4f
	4bvfjoZnC9S8KXVTt6ugLsdltyFD/RBOw3jyogXvL0gnZX2xNb78265V/XZZ3fpwmCOSaXmT+4A
	MZPJTkJevAQyiFc1eZh4HSKvf2M2s77lajTCR61CEfC+vv+CSRuyRU+rkfW3yXgUgb3K7qVpyYR
	rNW5irVc8s7vKJP9wYWrGgEh5L5dCnOhohV5yWPrItpPpkBMI+XJocAtH10D4KyGBUZUkCT87uy
	ZGoE9UAwVSY4/tLIzH7V+l/avxyKYtk5345pjjwkuwMKZlbKbuw2Z4NMiAFI8LtE8TErf/jN4if
	4QLgGzjaUaKNQKEoOOJRai5hQcEhkLU/tcgyDYNSbQcV2jBmqP/GB5u8Zbr/4ni5pmnGhgGqnfX
	WZZnSfhyfnoqKp6TAVg8/wWlv5mgAjcFE/DHbMKR4AS/SSxZFFZC5um+YaXfErfn4skGvZsFD4T
	pb8fuGaVQtnfynQ5rP6Qu6cRVHpyOlfAliyBG9YzpAs7vwvBDlZ4W7rE=
X-Received: by 2002:a05:6000:611:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-499c89825fdmr6554563f8f.10.1794428628387;
        Wed, 11 Nov 2026 12:23:48 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:47 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Wed, 11 Nov 2026 21:23:09 +0100
Message-ID: <cover.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

This patch series adds support for the Variscite VAR-SMARC-MX8M-PLUS
system on module and the Echo carrier board.

The series includes:
- Device tree bindings for the module and carrier board
- SOM device tree with on-module peripherals
- Echo carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Remove the unused ft5x06_ts label from the Echo touchscreen node.
 - Add uart-has-rtscts to UART1 on the Echo board.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
  arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
  arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 648 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 +++++++++++++++++
 4 files changed, 1295 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi


base-commit: a62533fb6362e6424a7bb4ecd4b5afe1a3355849
-- 
2.47.3

