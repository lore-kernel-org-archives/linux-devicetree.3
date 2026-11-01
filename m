Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561391;
	b=be04ikfluXGq9euc/a7H0Vd14fGpi/XkQuNaSdKkIoF2gjFBnIupmfnKitLwBAFYhSOX
	 R199Mic18NZDhhaopiNbGOqzQbE5CmpJUhXTAdkZ6+HcmpDmMagKhPoy5BWxJ9FjEnd1f
	 BYbZxL1fpgyIw0CENq69GlQLuG1GzRkYW5ysveImZbmIHwHndIL0zD+l7FNc6PSCnlDCO
	 arvEKyhHQvccHkvf46nnth0T4BiVe6fO5Bm+HsKDVDC1BDNIB72jLSJKWp3sHP9pON1FH
	 E5wLN9yI3I02YPrhkTSsGgSE8V7QbP3N58WVmH/4Q9F1aUC6c/TrBmqEIFnDs74vvQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
	b=Oe21A56WPIfN1uNlltT96YXPCJDRDsUeDsbyJgcNDejx2zWxOu/gHcyT+2NZg2iZCFXR
	 Z7n1WuoGw3zyX3+yNBcG3FTFGuSzIQO+Wtk3/LdJaT2VWNFmA5TLP84hfwoGVdwg9Umy4
	 cZIPibSwA9AJieRPd4bYTmeSm2LtPFo5jHMsGsw2giRz5Ir5ZtLGuIQB7PSznpm0ajYop
	 /Ba/MA5dISkTi4WePsEFPNIM1p89BvZmvbGPskkRbNuU4BBObVftPBphDMGzjJlL6IyPR
	 MrI5LSnwfycrsTxK/L9VkNdESS4F5AT0BURPAoctvrpk9Gm/DvFaRE/mcaX2gHuzJAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Sr2/Jnxy";
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA219606A335
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 19:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA219606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sr2/Jnxy
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso899249c88.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 11:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561390; x=1794166190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=Sr2/Jnxy4GKof3nFeFm9KBFBYre4/9SAFGqRylDoBzNrjjOt8itmHG5gZof712DddK
         eBWZIrjBKRxEBQ4+5IPrD3deYro/ZpZWR5Fn2UHaUZz3Kac3nkZ/FObqC/wL+xhEyWvN
         2rmbYY8pxEEwfYbKZTxKcgP8w5PCAO10RK/3hGnrbhomkQhr2LWoIzPEgd9MIBM3QTl/
         SiyiozoXip3ImU8fq4it1FVnLsMWXw6BCYIigV3BLF2BD3fZzYkUQ62Hp98tredjixM0
         AuMXry4ZXZR8om+k/58LEG14+Di8nxwFsFGzOgoZaLaABlurhS/SXbCww1cb/d9J/xJS
         ohaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561390; x=1794166190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=srqRcRVVpohzsMHS+O3M5MohLVmkBu0y/lJ688jC/F8A2bDe5dmPOejOrvejO+jXoP
         hQBa4rZvJs8oKdHx4dIs8iRN9OT7CxJcz1hqBwJ/fgC4nte0IzV1A9aCNR7vPBZkYHUh
         ISA2b5DXhdV96kjnB6sJBDq1sdQ6To2p9N8lyM3qZQWelkC/g3zVeTtv5p23w4RFlZZq
         pFXN+Jg1OY6QZ4+zvkZkfBUG5baRqCF54vzxFYI5D5FFnseQrBNkdevSPeLiw7gBHByK
         8b8c6REg5W7JJ/s9zpXl1j/gHHkihqyR+5gMSbfppPvBWqfQXl+0fcAmdFUNysaWq9Tq
         MzBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzokHYxCC79989HUGsTx+n7w3yvcgmDer+Sn93MCuVbjL8UJw8JbzMUrvjHDaAnBS75ahoUfnshDzz/@vger.kernel.org
X-Gm-Message-State: APuU4Z/JGwGpwXNd+zlaJpA1PE/LEgCM6czaD6YNvmMybcE3MWz+Hf8g
	tI2HkxohQDkSGZFKszBdIJQsqaaDWb/ZB6erwnjw/QyqSC4FydNu9eri
X-Gm-Gg: AYBFou3FcnGQ58MXlX3VDBqmT3a11QiwsdDGQzkHHpgq1QBJ28z5OBfzuMdRkvZSJtz
	EuvSF5vUxQ/ZOcZWRcqKze6220o1NtKtvo8xUSqaC6UOzwqhoojAxRdEZuCz1pILGlqUkSfYxLj
	oJz8AdLXDRj+8Ga5+cWoK0kIQzQltmG3wQ/4fmnqerN8c7qbFBcCpR0k0lTGWfZO9pW0CvT2Pib
	18IiSvZMFvnwd+/YRB7At3MhjPFyuQH0XYCtEXqMiUDF6SJTJfaFjptJR6jl+7w0jYtVWKsrwNr
	qgEQHqgbVmAN5bQjcrhUXdp4yfvHen7dpmrfO0gKwIXyh6qwQmccdTyOEEYdIklj6vnnt/DOUb2
	IpvCEFtCmoT+4DM/YKpoOeX6VjRU+lI6SaXwu4WliWPa6YqdRNKDCo0KKLm+0MNxuiwhHGHii5y
	cpbsxDe1iibvbclsEnIGiWI8LL9o3LpfykO2BopJgm97bgfzXBhZULQ5GK0de8+gZoz0O7f2uvy
	1J8LgNhGYED5mAcj97dHbrYgONBaPikJirxyy7x5P40A0igF+0oFy3KEy1VY0GWiEZ65gzIWzUW
	tcPMKOVguwIjDRA2qiLZdVx1QBTz
X-Received: by 2002:a05:7301:1828:b0:36a:10d:afab with SMTP id 5a478bee46e88-36a42423d10mr13381248eec.25.1793561389745;
        Sun, 01 Nov 2026 11:29:49 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:49 -0800 (PST)
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
Subject: [PATCH 4/5] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Mon,  2 Nov 2026 03:28:06 +0800
Message-ID: <20261101192807.897562-5-coiaprant@gmail.com>
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

The RGMII WAN port on the Ariaboard Photonicat uses SCLK_GMAC1 as the
GMAC main clock and SCLK_GMAC1_RX_TX as the RGMII speed clock. Only the
parent of SCLK_GMAC1_RX_TX is set, so SCLK_GMAC1 keeps whatever parent
the bootloader or the hardware reset left.

Set the parent of SCLK_GMAC1 to CLK_MAC1_2TOP explicitly, so the GMAC
main clock always uses the internal source and does not depend on the
bootloader state. The rate assignment is unchanged: SCLK_GMAC1_RX_TX
keeps its rate unset, SCLK_GMAC1 stays at 125 MHz.

Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index b719d5b661c43..7e0a2ab829209 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -285,7 +285,7 @@ &gmac0 {
 /* Motorcomm YT8521SC WAN port */
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
-- 
2.47.3

