Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23F44FD7B6
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677738; cv=none; b=KxRbTZnU5e/50gBTWnYpvrcpzUhgIp5c/IOneWtwbD7Cs6vH+vjGUEedvHPk1+9hseswuPaN3i4k1z3VJOxCIiiZJE6r7HH32Q0MOcv676yd5LCarEZZpi4Pem3zF5pazyuTBzaEHyZonhXGvTw0cf2GwhxjN5dbM9/kC6ob7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677738; c=relaxed/simple;
	bh=7swkMqPaYDA2lMwF80q1xxmYZJyUeDGGLHz75wJEGRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqs4XlD9O86itxDg22hyh32+9lyUYVZIuhE1xtcD/kEf7WH8f+7IpR4pXt5z/HBFu65ZWXixcWlpKDEWbt9qyPWgcALwzKouX3/MpmjNUVYEophPHADpMMZ8BJvIAP52GwmIb7QsvoW+eKF/CxLIvTadWErTS9SGAERaOI/SWXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=hM+OmhG3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="hM+OmhG3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so22481835e9.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677724; x=1791282524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wqp7f3x5gi8Fa08DrT1eEvtbc+6lIp3fUU9P0chtfKI=;
        b=hM+OmhG38gy2wsXLbh3lHQdrwkdkECZS/h/M8DiSWdfLGQLYYmJ/x0aAjw1fKiZAPB
         ikQhF9UeVH+/XyhGZyyrqbHEHJMGMM/fvCxwzBaFg1jhVvZWQDAMFFDwn/kCDQae07fe
         MlyaN5qlKn6k7OOmvmqMnWYIb+QEuJQXg7VY6oj0Q85dP78xYCG2g+VQO7i7g1Pl2DfR
         cVcm9QgxhzEOZNY4wOU0xkgf/DZ9nKfe3aTULFNB0SgsO4BiY2me4xe8hjRJpwSsCmBl
         Y7nUBZASLNknnVDlqIGVvSRCItyHVWs+ATMApybvazrq6i8LG9IlARAop5SgCnfgtN4X
         AWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677724; x=1791282524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wqp7f3x5gi8Fa08DrT1eEvtbc+6lIp3fUU9P0chtfKI=;
        b=w7h29EtirJG0h4gvHAB3kh0sSYu5WZTY0cQfpi+kkjp0jxKi08eqeMpd29jLMKoZMt
         afsHGmGCTAE70dQUn06wY4RjnakZ6E1+pMLQiDRWw7PwOlT+DfFoVWdGKQ21iNwTK7R9
         IuqbZg9f19kpN1hA8dNJiyLeO/RQk/JQUw7LJpnSPP31brDquMkctXNeCAFMLQeEYsK8
         h4waGySdBw+s+jp/wtqZm/TAcJIBVp2UI3R9Oto09oqKTvAEQbT8Z/E301nd4Lln+2XR
         pkSYdUKHxGDgp0tBYK15sldjsDAVke9xKG1sThatP5sUGucKoiORMAKsUy/TkEnjF6GL
         Z6mg==
X-Forwarded-Encrypted: i=1; AKwUvBxeHnOLkg6+WzOwcPJQkfCHgoH+SSPT49rUrFagb1WDqoYBtqbEvAJAmji3THrh5NIi/u9xuFVco4Go@vger.kernel.org
X-Gm-Message-State: AFuF++nzV/iv/HE1xDUO6+BTZN6v8y844rdTRngPVy5Ve4dRdT6Sbs/l
	p7xBuVzlJQz02Qqm9OuWaUlqL0R5SzGY3woqhNtQRTPp7X1wojdZhEyq+1PhoyOLN8GEuPbqU1B
	7GsD7
X-Gm-Gg: AYBFou0Y3IUBieXpT+r5PLjelPfanTW3QxNdDBapRG6jFNsPWvc88ZEQgAN9TbyFiMa
	HoKuHJuMQsLuR3MyAD5N25Lhk8OwS9Ko+HwhZo2LEnD/lDUhaBiCsGz1kyE2GkeTpXnj9jFyHhA
	YPYav9HxVKTm39r7JgAwGAD5JiOBtd0sdSH9hQ1JNjiWOnU1mRZZ2s38yE/1ozXS90P+QwIzZYW
	ijR766U65fbxYnaLyDA7d77/mb4btVcmsexKGUcXP9hG2CAP9wqUyCr57qCwurgYLtEFIZr7HeS
	vWqiwkM4NzcYoMnFYFNT1/+5YAajX3/uu0duT5TxoHlWH0144oHXalXGMHmCk8RM3QAAX6/deT6
	30KhnEUQPtJBqKvZy4mZeLAiwByf8NhBEuw3c517wbR/2DtV6/tp2hsiaDFBJGc1PIH4NXv3tMi
	jTQBQOopbuiIpHijJ6IpcP1Ea0zShwAykgGMrpowjv0nrMP8fLMp0bmj/Rfne+poZRmhNmVXkGK
	RQeBKIvRlsVTt94Kjc=
X-Received: by 2002:a05:600c:8718:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49ff06f8316mr198386125e9.31.1790677723751;
        Tue, 29 Sep 2026 03:28:43 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:43 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:21 +0400
Subject: [PATCH v2 4/5] arm64: dts: rockchip: add reboot-mode node to
 RK3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-4-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014; i=alchark@flipper.net;
 h=from:subject:message-id; bh=7swkMqPaYDA2lMwF80q1xxmYZJyUeDGGLHz75wJEGRc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnRxhxTnvOtxPyRcGQ3fxJrWGafOslgb+c/oYvNpi
 YgTnl/OdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV+14z/FP7sOKDnOvU0vau9+kKW9L3Hsl2X/Byh7Dif8U1fSfWrmZgZHiwzlP
 pbIz83R18W15f8n6uNun4gvXfzbv57ewEDBrM/JgB
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The RK3576 boot ROM chooses its boot device order from PMU1_GRF OS_REG0
when that register holds one of its magic values: 0xef08a53c selects USB
download (maskrom) mode, 0xef085a3X selects boot mode X, overriding what
OTP or the SARADC strap would otherwise give.

OS_REG0 cannot be written ahead of a reset, as it is cleared by NPOR.
Instead TF-A takes a request from PMU0_GRF OS_REG16, forwards it to
OS_REG0 and masks the reset outputs so that it reaches the boot ROM.
That register is the one U-Boot uses for its own boot modes as well.

Describe it as a syscon-reboot-mode node, so that a reboot can carry a
request for maskrom or for a particular boot device. Under Linux, for
example:

	systemctl reboot --reboot-argument=maskrom

Requesting anything other than maskrom needs a TF-A containing commit
2a97ba20e901 ("feat(rk3576): forward any boot ROM boot mode request on
reset"); older builds ignore those requests and boot normally.

Link: https://docs.flipper.net/one/hardware/rk3576/boot-rom
Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index e87ace5d05e6..c938dbcad712 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -881,6 +881,42 @@ php_grf: syscon@26020000 {
 		pmu0_grf: syscon@26024000 {
 			compatible = "rockchip,rk3576-pmu0-grf", "syscon", "simple-mfd";
 			reg = <0x0 0x26024000 0x0 0x1000>;
+
+			/*
+			 * OS_REG16 carries a boot mode request across a reset.
+			 * TF-A picks it up while resetting the system, forwards
+			 * it to the boot ROM through PMU1_GRF OS_REG0 and masks
+			 * the reset outputs, so that the request survives NPOR.
+			 * The modes below are listed in boot mode order, each
+			 * naming the devices the boot ROM tries in turn.
+			 */
+			reboot_mode: reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x40>;
+				mode-normal = <BOOT_NORMAL>;
+				/* 1: USB */
+				mode-maskrom = <BOOT_BROM_DOWNLOAD>;
+				/* 2: SPI NOR, SPI NAND, USB */
+				mode-spi = <0xef085a32>;
+				/* 3: SPI NOR/NAND M1, eMMC, USB */
+				mode-spi-m1 = <0xef085a33>;
+				/* 4: SPI NOR/NAND M2, eMMC, USB */
+				mode-spi-m2 = <0xef085a34>;
+				/* 5: SPI NOR, SPI NAND, UFS, USB */
+				mode-spi-ufs = <0xef085a35>;
+				/* 6: SPI NOR/NAND M1, UFS, USB */
+				mode-spi-m1-ufs = <0xef085a36>;
+				/* 7: UFS, USB */
+				mode-ufs = <0xef085a37>;
+				/* 8: UFS, SD, USB */
+				mode-ufs-sd = <0xef085a38>;
+				/* 9: every SPI iomux, eMMC, SD, USB */
+				mode-spi-all = <0xef085a39>;
+				/* 10: eMMC, SD, USB */
+				mode-emmc-sd = <0xef085a3a>;
+				/* 11: eMMC, USB */
+				mode-emmc = <0xef085a3b>;
+			};
 		};
 
 		pmu1_grf: syscon@26026000 {

-- 
2.55.0

