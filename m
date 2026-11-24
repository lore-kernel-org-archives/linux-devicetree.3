Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558216;
	b=hwrM8H0gxyt3n165bwBRfJWQ7WSRIzGZvfvb0QYGShU+PkdJuOwSQ/mMLI8sEKLelhbG
	 zVNjUgZZqcLCi1SOE0D1oE9mEko+p3mcqXDr3g5dL4hwg85xJc5kRRm8ANR8AoAiPHt+w
	 uJnA5bBVUFlJ7SrnMOqZNmgXhgZ5S3S/RgqVl2QW17f2945He3acN29gIVj8RRBWpm/9F
	 CQ2k0Kxwik/A0JbXyqEWG1zXvEBbNWhMsJdfLEhxyYwFZMum4z5Vk+mwDc48wO89khgCq
	 LNyNZQD7oLN5uWVGkLxUKoMR2k/0s2k/wdgS5GyAii4vzi7ovo0jwKQ3GMUAf5Oh7zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558216;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZR3zyInuNBPEhvGGAWnWJLh7T4opYjhRsUx0N4KMfEc=;
	b=QA/j86LGGvrZB1Yo7mv/r+cU4zOyF9dAHamhV4PRUga3HcjuhD2sropaIEiTxLqbf0dE
	 cD34KB71lnWyO/AAfhsp8q19+f+F+Ep5iMA/GYrCCWhXo+1yUcPABU7zDMfEFUbZngRgr
	 VLuNYgqm5pFiHBMIkpA2JlQ9MtmNw2SJZrhNZ8m2RLGgMU0pxHb+kbwyABs+uu4Qu4iKG
	 R5uxOSflGFM5TNr/O3karriwrjMw07FgbIkfTLBC63zr8eChho/Zt0dQvYCs3CkdOR1pm
	 y0/4WzLesvfCqzIgqn6anLwJwPVpFNLKFUWD0jpbI4R8CVB6kL3nOXhg6+xXXQByj+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZKye5P3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF28606A6B4;
	Tue, 24 Nov 2026 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZKye5P3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558215;
	b=PV2KeAmgzcMfNSgiDOFBfXojGRpFLgKahtNpxjn2LjcxSyiZkSHEoJou6ITxJFNbPu6/
	 QNPGVbONfcLKIMZhCgb0OLGpWXfkcSm+zVzQxRivkvrMyeikep6OGZpCK1RwGSwOHVIYr
	 zSz35SeVv+sd3byH8RA313XrRU4c2jx32ii04eX+mA4uRw7W5T91f5BZBBxb4yf4aW821
	 n9CyZWQDBl+XPO2Vn05Pp9oRDKBSPM3eYkcc3jj1Bykr86hokxN/jBLRiZ8dmkGcSwjoy
	 P+MtE+et580du57WbtgUV7dxwuDZGlGzV8SU7jdoIvEO0M6wHqch+LoXkV1yxufliwA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558215;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZR3zyInuNBPEhvGGAWnWJLh7T4opYjhRsUx0N4KMfEc=;
	b=UdxC2jMzoeh9SYyesC63PWOMxyRmVPwuVk45CGAnxlMwngQdBmVojz3atP/Q+7CRpqA7
	 3blbtiMpxqiEOxA2tu1AWaIMNJv9Cc3plbOE3zi0bNmTqX+vQ0A4h+t0hK53mZszHNsoQ
	 xuUK0AWd0erhey3KoowM8/FfUxNEf0oqWNrPQAlfd+vLrXX9OEH9HAvl7fRi5UAiOLivJ
	 MCnttI3hp8dlbP70H1TZEXkRzXhgVhEOq78i5zGJlBEdSUpImcu3Rfb+43+2rf/WxKPQI
	 e96U7OVmgPJxUirEJ/ZJi1Yc5MfNWoyL/xcSSjIH7HirRW0bifUvR0E945J/DFQlPAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A943D1F000E1;
	Tue, 24 Nov 2026 22:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558215;
	bh=ZR3zyInuNBPEhvGGAWnWJLh7T4opYjhRsUx0N4KMfEc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iZKye5P3YECexth2YfKyDfS8xOjY2qHfOXzzCGQlBg1jijgx2qv3E9Jk/33ByxEQO
	 TyDh/krvKlcvoCXL5gopOnVOW5cOHS9zfKU6VWMK9nY3d8rEZKkafpon3lwxfcANXo
	 3YoCnILbW0yh4Kefbm+XxTAyxe3lbjdOQrng0inxax/chHximEINFeaWOie2eJn005
	 6kKUSw9n6kHaYKBfaDRYP+umVIrv7I38qeUUQe2wst1XZGvGOHgrePRsUuLO24iaHZ
	 3FsEtLMx2Fcn1d6cXxMWL9ZTzXpfWkejO5yeBLqsJh8t+fh83Y6NC4LZGQ5Qk8H8VQ
	 aAjwg3jcl6vKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3831E4CBDA;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:09:54 -0800
Subject: [PATCH net-next v12 06/15] net: ethernet: adi: adin1140: Depends
 on PTP_1588_CLOCK_OPTIONAL
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
Message-Id: <20261124-s2500-mac-phy-support-v12-6-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=916;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=bUowD5pEZxYOnYYm7grV2p5YyU5Lima44YR6FQvzDY0=;
 b=Z9opoeKTrnVwXpZl+oukzs+hrs9jmWZq0DgdfrX/W4QUA2Qb12gYsvK9S1oPVbM5Z8OaofGZJ
 KrGOWPLp4VyCLc+HuTzdjgedtjyDcUikb5xEHUW82tpThyla8jism0D
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Add the PTP_1588_CLOCK_OPTIONAL dependency to ADIN1140. A following
patch makes OA_TC6 depend on it, but "select" ignores that, so
ADIN1140 built in with PTP_1588_CLOCK=m would link-fail on
ptp_clock_register().

Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - No change
changes in v11
  - Moved the vendor changes into its own patch.
  - New patch in v11.
---
 drivers/net/ethernet/adi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/adi/Kconfig b/drivers/net/ethernet/adi/Kconfig
index bdb8ff7d15da..120a52e6b283 100644
--- a/drivers/net/ethernet/adi/Kconfig
+++ b/drivers/net/ethernet/adi/Kconfig
@@ -29,6 +29,7 @@ config ADIN1110
 config ADIN1140
 	tristate "Analog Devices ADIN1140 MAC-PHY"
 	depends on SPI
+	depends on PTP_1588_CLOCK_OPTIONAL
 	select ADIN1140_PHY
 	select OA_TC6
 	help

-- 
2.43.0


