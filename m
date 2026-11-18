Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980909;
	b=smyhuAHAmyfRXCUBpNdUBxwOKOneKoqtgwDpKFLfIty2PcxFxFGJJ1Niiik23D8cJ/ll
	 YKEhahl39akMcMcAKyH/VfxAPTfRa7TKxZT1h+1hNylX31ivjcTF6y4VUHNcgqvJb6ljP
	 2dDuVX/QVmVOlcnb5hhevFCpoJGsKTvJwSopHcSe/C74+aMxJ+vY8aG86y9IZJWUUee0y
	 Jt35TfL6dOblDlC9hnvbnEh9jnEYMTWbMDy3Yzvjea5k8058H5N9DQhCbnLnMHoVNEF9+
	 4cYRpMPJY+pAAhtpQfWkYdomc/dYD7P5dmJfz3PLGKMaeLeNFjoLiKq8qlKj2bw7C8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
	b=x1ovsZsZtDUBwLMXUChDq6rhKKjej11G97ZmgTe7+DOsufLpKl8I8OTTInMso+LxngRn
	 QBeNoMvgZ/X038dR9rdSJpXnwuB/bmcRSyMTeJopVxgKogRwzoYE0XNKHDZAsai+Kyfqk
	 8hmcdyLtJJ6rwKvs7c+X8nsarrdDgNl1QuhSbck8IXlFhN5ERV/RTxHWClPiXc1HnbfOU
	 pgtRrr9+w9ihZ8ZIjJkxiyUMuSH0fw2h4JZDWqTKocBkVtu3D7rBa5nrPMMbdpJSVYv8q
	 fSZNhDUBW3oMe1H8WVOO7Wc5EmQ86HKpCX99xholtzI51kYbmWJ2t0Ctsb3+Ym/J8FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsENBPb1;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8863C606A332
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8863C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qsENBPb1
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380b40312e2so1831394eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980909; x=1795585709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=qsENBPb1DEYRftnTn+3wPvZY64iwsld/X+ef4KS1GL5ie/J+kVkwWzM8N10kA686zT
         lbUdPwotH27vw6Jp8+acEgYDjC/TJXLPvxdEn8ZuaUnsiMzn+r+AAuCn9xt/IboXKASR
         bCtzi+fUit85aZ5Il7/mFGTyP0g/nr4U+yPlLYqTb/gIpl9KTSYy1srV4DZBr7o8oHPI
         TTQMZJQwcdQuB5sC2TIUC3pto5zCtiFqpzNG5vgTTu/8ItVuu2LhE6ghPK3xlbPDEZDs
         wtxQ9TRQmgl7Hl7yzOgmOAq4roz4htZHW1xEHD69cybaERv9Ci9vAj/h5HfbjCstp6+B
         /NOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980909; x=1795585709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+6eCIHLWHFY3nDB/Vr0c1/yRrGzwmD3XbYPRK1ugF0=;
        b=2xQgKn4pA5ShivnoDF6UFgBfm64Xzpb5lMKlMD3m6rf0FHhNO/PORIf4wiLvS153cW
         j6CBodqWV1ZffiUQENa02lHm2W3OmekHj0PKttPSA6cshDWZQDVE7RQsBxRxshQNx42m
         1JyTCRcW/MimyUIhM0bzMtxZhWpL3ALTIBEdGB56MNihUq8+4rjWatvpZPKh21WJK0Md
         SaEKzSaVmsUwm2QD+kqh4PpxlOCJ6uz5hvLnbxXijXkaTX9Ya+3QuObiHNn2oHzo1E50
         rQpkCddOAoUfNebjf7vxt/nb1ciKtxWt3ivwWgM/G+zoca5iEkZn0tehBnKyqOurcw2V
         byrA==
X-Forwarded-Encrypted: i=1; AL+hErGGvJRzDsuGZiUW1c72Z2r0FpCa/sdP8WEZvuM6ttmJIes1/O3b3yX+8xEj9/Jo4Uq+Tw3FP/riZj9r@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sui9qhjljhQy98lHUAr8xu9uprZCKvbAmJgyIMKFA93H2QbPL
	2jbtAzoO48yia3WVxAwlNIVO0mDtP/eBSTAyUi6QByBVk1esHpkACUbD
X-Gm-Gg: AZFdTZd+OIyTaCd99uAPm4yx9ibCVy9KHp3s4hs4XcriwLHeV+UmYmjE+OEt+jMptEf
	1FiQBKdUvEDatPPGM8A4dwJugGNx35XG7DzULO+QhcSSlguoAQBS5j1R6y3pPalOU0t+Ht4/oEd
	+oo/pub9q1Ud1G3oNbQwNTnE+1LyuSMQotNdOZLQz4Qs/Rqo1z0jZneuqD3fQ8B4GseVicADoDG
	BxxtXBVxmQHIdITXzVFsaC4EYCULV+dBpsQUoCewop4e4SBSkuXRIlSh9tetqFIXX3MEq34QLCv
	SbYd+p5qCTuBHfKnVEwUUgOtZNhiRVJMH2D7s3HI4JnZBe+Rt66CaiKnbhMkvc6cPLna2pfzFhc
	YO93lp2dBJENjv7R/BeAsMDhWq21bBBgmiAPC2vfE6Hr3Zk+VYlNgN5z7aO8S+oPfv+y8ngabeM
	uY6P2srlReQO/chMPznfZxkQoiuvqph3pZMXu+dSHPfCy/xnnu+klThahK2dNrwQ7+rGS6I+ITk
	wq2Lo2uFjm2F8TJWwxnKjIFcw5gkkjQvUWEGoK2aJhJ3aOwYc+Yb2n3l5ooKnccYA3XJybQszWf
	g/CG+qh+jRepnF026RXkAODwrdzJM9SQi09JNZnXr1xVYFF8ngr3kkcxoYBltUKFWNk07JpmCac
	shTjgVRQVJO8db8duTTrB0ms3ktwc+SEzhtaUZBoKz1gIeKVOJzQtMSMBjBEg/7vkZDU1lBwmTu
	TK4w==
X-Received: by 2002:a05:7300:148f:b0:36a:1f8:a5a4 with SMTP id 5a478bee46e88-3828171b242mr2168030eec.38.1794980908654;
        Tue, 17 Nov 2026 21:48:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:28 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 08/17] ARM: dts: BCM5301X: phicomm-k3: specify switch
Date: Tue, 17 Nov 2026 21:47:49 -0800
Message-ID: <20261118054758.132233-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
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

bcm-ns.dtsi specifies a default layout that is not correct for the
K3, which has three LAN ports and a WAN port on switch ports 0-3. Port 4
is unused, so disable it. Also allows setting the WAN MAC address
properly.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm47094-phicomm-k3.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index 5b9250976f13..018faf90fd4d 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -52,6 +52,43 @@ &gmac2 {
 	nvmem-cell-names = "mac-address";
 };
 
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@4 {
+			status = "disabled";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1

