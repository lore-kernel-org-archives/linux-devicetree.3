Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561378;
	b=u+Mt/RA/ij5yb1/5v9wi/jqi5YOxjJZWEPH6x/OCMxKoVwCesPuwMKV7vDxAX1fuaf+z
	 EumPFxrgl1bWPjSllIypCd0+XYtClMRRzGXbDwcZIQLrjvNFsUjdLWZCStdypr6149S91
	 RikH36E9l60CVQ9myfW3rkO0Pof7Q37mz/QhIBp7LP+OJqRsHZPYBKlk2sFCRAKqLwALR
	 m+t1b20YQEutxTBpxorlm5QdkppKrHVX6Er0cC9gGzxIKbFoPr+IETB0LSiLx5wuGHCgP
	 YbJglL2NDJms3gNsdaw1T7YFNMRE13s6co0jelGjAr2moU1kzjqhVTT1YSNmsTpQryg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
	b=wX1GtBN7Isb7DCjXrMqavA+727lNzwjKWs1Dzq2fGYZkFfS+MflXPvqLUrwFBog0PyXO
	 7RoETWvA+TgLoLyG1BLn2L4ptL8q5V+x65sPBnCJHKZC1gJstUlGr9EQR+K9QNfLKtJGj
	 zz1+nj13enTyTKYtce9cGfNK1m0EPNiQWfrp4BmqvWnw2R1RQpcgFkAbz6APbiIaCAGTu
	 QJLfTo/J6kT0zO0Ubn4De8FN57IrzdOBNv6etaF8/s+O7RYG+BChv6V8eTRfkb3LeV46X
	 OvY9qoAuLpDxCpJueTMNks8Tbmq6wBExyq1HWAo3Gut9SAYdWKLgxDxChy32/2e4k0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qM4unuy+;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445DF606A329
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 19:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445DF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qM4unuy+
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-369fd8abd71so2551685eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 11:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561377; x=1794166177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=qM4unuy+u6DMfAn18z5l3tOEd3W59i4ICx/Nkg6fXsbLeJGUQwtHbta2kcCDw7tkX3
         sswIow9vEOoHKucQpW4oqdI54rvCC1kdoY2tK57p4MJrYAmr82B9FcXaXOh/xDj0m6Nk
         IOa2/dAm3WEpGSwRh/WxyUDpPdWtjWJVkhSnfFJed8H1AfVOKkyx/sSfoo9YkvEofA9q
         6bzKU5w/5fpgVqRgYRa7oGdC7a8Vxx6kyIncK9GSeekRRDA0YlnUTaBNB66DYl5hg5Nu
         bxWjuiz/Vska7EkbwiNX7XzHwXeh2+VTAw+rDdDZAx+rT9wt5OeKw0SEY4YpbBeGetMR
         M5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561377; x=1794166177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQgMc315r3kvQDWK2uMIX5umY8gWuldHWBME7LLziZk=;
        b=nB+62JxP+0YUddiPvV+LVvsPTAdGHN42CzCpH36SjL6G3TrJGbgeDmR6kDGl6dTo14
         a4szroQnhSsGDkKIhZgW1Dwcwg3KhXVz4OwvkYni+EF08cjoEM0mUxQSFg9KefAzL9W9
         1bQ195+hw2n00A2Zy5XTaIxdwDrGE9wFAdgyMMxILet3omCZ/3IkFgHnWR36Y+B3jkjP
         f1YYuBM6kazYjTGXlawstFg+r+uYjma8bJvfs8hKa36YcqCg8NJy0a8tpMUSTgOrQelB
         qT8aL9vkDFk+5GAjluSwjFXtZL+e0YMeDoRGM5VLnXfFVbuAI5qgkvBNCvFjuFih4+Il
         nDpw==
X-Forwarded-Encrypted: i=1; AKwUvByvYaQ8LMasGhUND7lOG1AwduGSMimRlS07fsJRKpTaNO704DTJ72835CymG8+KvcBy8ziXDZRAcuIR@vger.kernel.org
X-Gm-Message-State: AFq9FYIJHAy2lcB1msspXIPeKMPEL6R3Jep90LMLuH9vE3m37HSzm/kA
	gUZ+fSwCpLri2UIlo48hzmnoHl+IzzAhLzYJGTQY1BkcDWBU3ARo6H/N
X-Gm-Gg: AYBFou0DuDZQ5Oh0JDoS2bJ8hVQRBq15bopjl5yT7Zcp7deUmxs6zIVs4dvNm5GkYPw
	nnxH7DdzQvfzGOrkN6puQEMZ6besaIn6o0bzPvROmvG5D+lMQjn5HWzjcnfS+QP2Va9r/luxDQK
	6bVUgpxn4xtDVT+ZZUE8ES6Fpp8pMdbBk/NvDicKYL0MLAlEhLcIOkJMoFUAgJ4uaM32rVQisxS
	bZdZhLwllCgCvaFFvLsUeQhXdnzoN5523LjMiIsnVrgD+zmkiGQO3V4w5V8fTT5nFVRPcO35XRE
	QHyeJJVyeP4UAsAechwy8IIsLOzBzCX0RCftlmpZDotS+mNErwcIY2srLglcHE/Dq0OlmjMAygk
	IaFrFEWqmbfmd43TFcnXsDQbQgR5tRGpYjto51XtqS62WjhFJJc3u+4xo587DRKlczmUjodTSg0
	rpbHnvfEMKTy8R6StiydeYQF4Js8aTvyednBaEabI3EIZRnLWjUfFnunAI7/gJIsvmSLZK0miWF
	/5fqtiXMHkwQA8TCMQGtXyID5nvJ+urR5fPNaeBNGxixXI8UDvH+bKx3YNklJams4HCg1ncvHNb
	muimKvQ9lp7xb4uiAKQ3RUH+t94=
X-Received: by 2002:a05:7022:b0c4:b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1af2ba7e498mr7041623c88.3.1793561377291;
        Sun, 01 Nov 2026 11:29:37 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:36 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH 1/5] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
Date: Mon,  2 Nov 2026 03:28:03 +0800
Message-ID: <20261101192807.897562-2-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
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

Both GMAC nodes list SCLK_GMACx in assigned-clocks, but only
SCLK_GMACx_RX_TX gets a parent in assigned-clock-parents. SCLK_GMACx
therefore keeps whatever parent the bootloader or the hardware reset
left, which may or may not be the internal CLK_MACx_2TOP.

Add CLK_MACx_2TOP as the parent of SCLK_GMACx explicitly, so the GMAC
main clock always comes from the internal clock source and does not
depend on the bootloader state. The rate assignment is unchanged:
SCLK_GMACx_RX_TX stays at 0 (managed at runtime by
rk_set_clk_tx_rate()), SCLK_GMACx stays at 125 MHz.

Fixes: 156a530ed5ed ("arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
index 4903e32d0ead0..d94bc34a31e67 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts
@@ -268,7 +268,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -284,7 +284,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3

