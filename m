Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465935;
	b=2WpAFjh6rSInO57u3+Bdfavst0XHLfTWvJg4Nj6E5CqD/TSnB+a1akAacZBdnMxjdHly
	 zQ0rW8utpwZXmesEd0WkmRcAbJU5xIC1+xAsuxhuGrg5vRuGf7CvZc6t0oSj87gacMJzY
	 +BTilLNYwZxX9eNxilJdjJgVgU1ejva2S0rk1K8ZGiTdPUTvXXIsdHQgHgiEBSdr6IGzY
	 iqwUBbY0xVTh9Qd9LeBwQndruV+NTfgy9Hgi6p3p1LiVeZH5ulPQsYyne1ZlZmWzshk8h
	 9RHvxOMzJGj8EadKYj1ceRUKvaXaFRgGagzRyIYUewcB2hMgFGEvcYeVO4SM8Xhz0IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465935;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FWj5LUnrVFJezexmVCR2EhLrxxSIAJtvNmwpJufMB68=;
	b=2WAZTzxCXKfNKwG1Zn3LeKAa4RftUY1zzJfQXJj7ZG1+uL1qoXcVx8+MfvvLgpqL6ebH
	 fcgdUo6qpkaJ2I4Aa/ndNKtO2EJMb8hv8JCl4ZZu3TUejbbdL5xn+7HIKqaAtUUzDzQM7
	 0jgnLhpfoYtRyGNYYR8pfyC/IyQZGI3UlfppAqhfA8vU3g8RRwD6HStlVtTzhadb4+zyR
	 JIQ8ErreJzjC1Wr4snuUs2ZQhALpZMIGd2rJnC64v+WsxK0mvAR5z/CInh2E4vTzQ8Bds
	 l91Bux73VS3ZwlNOSNhmwvnMj5HCtjzMf8vCvHdSX1jJTQhWFRKkprKKlLvN+oYy1KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b="i/ZEmKEm";
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AA4606A33E;
	Mon, 23 Nov 2026 20:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AA4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=i/ZEmKEm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=FWj5LUnrVFJezexmVCR2EhLrxxSIAJtvNmwpJufMB68=; t=1795465935; x=1796675535; 
	b=i/ZEmKEml30gBk4V9od15Uym62TfjM75NJlp5eNvdkX1NMgjv2hnaZ5swr/yLEw4wNdUbcvSzy2
	g0IHJwJWPOgcTydoRkI9u7rqaUD2xciAwTjsEnvx9YO3jbgKZqVDjK+3I48pTCOM+WaconNiDj7Nj
	J4Szr4cTyvt2GboMa+Iz4Ik0+Ey7+OFgbwbHp1uFEpUN2+Tyg6PbFPCSPjCia/zRuOXyAL6T++Lqt
	zX0o9Ai+G8OrGJ3yniCZ4I7ErGpvslZA/3e3/wvzO1iw0diBgYisHoWvOND+4EgfF3D0o8pWuqT0o
	PXoqZShsSQB//2zIAjEJs2z6ZkIITE+vMsDQ==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Mon, 23 Nov 2026 21:31:21 +0100
Subject: [PATCH 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
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
Message-Id: <20261123-imx6-idlestop-v1-3-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
In-Reply-To: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=AUY2ja8XxCirP2QoDjD5UZpqa/ZPfxBH7gIhNFVOPf4=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrBKK0QCYfavdLJiHacwCF3628Roxkq5L1tBpwA
 IkILqTHqnmJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawSitAAKCRCEYUX6QCjc
 8RGZD/oDT5Vqyz3h36XS4BnWBmGsEdpxDgFKSJKMsw430YzrtJY43d5tIhwGYQ7pWjR3nQx5qQC
 2ODVYtMEMbMU8TX2GQGG5QLxaBJgJ+ElTlsSREw88q7+bRYOcqha2KodbeyhceTvJbHdH8FUYKL
 n4Z8aUUWwPSNSNg7yr42Z574PnykDPWSdkp9+RPxIJG1IJo2cMmQbjeeQ+AkgqcIx/HN9bkPzZu
 g28wglabWaoqjsRG9WO4ZIIylBrRH++pfrD+y0jAhnsRjQyx96PztMnW5Zn+V5AYfRxRVIs7w9G
 IWvfxJYu51R7/uDFf6bRwjmIyRXx49T3g8ViV+dEyfugYBm3pJKqNcZgCzpT4DhhNCP4ahLnoGP
 k06An7xFxK/vnrPfbaIygo5xgHRCJNc1l5cFhjQx76l3HbRrfqtTfL96OYfzVh2+viaBbBPO8TL
 i+SrXYSRBcTuAx7VPKbbH7tKu4ioFHQ4D8MTvUvQO/N+B9c/e1/YB9xg/IbWbuTp93Y1LV6k6GN
 eOWBbNi2nErNTX7/rNY5Jrn7McErllyVL917YgyssUsY9K4+vWSjik2WGRIhqpdV3EYVdM+uSV0
 Q2PwiqSO5n1+gBQbcaOPsn1EyiPBaR48bIB2wjHL+ExmrNeDiJ4NOICN376yjqIyUVOd21pmQz/
 NIr6AuJdxq4rykg==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

To avoid depending on PLL infrastructure for timekeeping, use 32K timer
for the timer.
---
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
index 1000ee8b807aa..2e907c4163629 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
@@ -46,6 +46,11 @@ &gpio_keys {
 	pinctrl-0 = <&pinctrl_gpio_keys>;
 };
 
+&gpt1 {
+	clocks = <&clks IMX6SLL_CLK_GPT_BUS>,
+		 <&clks IMX6SLL_CLK_CKIL>;
+};
+
 &i2c1 {
 	pinctrl-names = "default","sleep";
 	pinctrl-0 = <&pinctrl_i2c1>;

-- 
2.47.3

