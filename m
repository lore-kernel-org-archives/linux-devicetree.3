Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547635;
	b=vySaXh/VY1CZ0bQrozCBK/jfHWb5BAEEXp/k6nD7CZmlQm4fAAttfvqLO72O+rqCHPQ/
	 p7owj1f8APirzZmO7uTgXXlFY8pgtkRLWFQtBaVRC9acxvdnMWwaz6ggYCfOFobFo9Epb
	 ZpwL5RP5hSzmS1fkWYyR4G/BKvHnghwZOQOuN4rvzwImqOeHxuJs3vEG2pkL0L/5KjTZa
	 l4SNxrEMyL1S9siEU2o0lc7GnDCmHfYwe+RPOxADP+GWElZAb9nsvjN7EKRBwytRUeY4V
	 PYZ8laQ6Sd72ROwJi8b0CC6C80bO9EgnrmrcfNCG6LHtDlzcP9hLstMNRXdNgwRnjXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
	b=KqVUoF1qOFweUqol4pV+Wob8hZuNgLtmOlycWxSoNRp/hRg/jVQIH+op3N/J8PegmlPd
	 N1t004xo+11BwYZ/XpsUIphkNxvTSkBgWoWeQ5CJodYZw8XjacnHb48wd6+yBKO2M1QLc
	 Xeb1UIHF5Ltub84Ia7nebaMO1M2OAFT4v90FA7eeix43leelizDRHjIDWYBSUULHH10gz
	 DKSlqS6ySCQjKV2ouCruYeUkp508R/yGtgiTKVc3HU7fdQtr/e4YLF+p8WcAGonMX+kf3
	 0JW7DXiFnXQAHR52XGxaE5Jr76tchQYuP8Ohv6ibQzf3njfGjPpR+ATJr9PplY3c2LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=orNnxcsJ;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008BA606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 008BA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=orNnxcsJ
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4ed6d69bdfaso2703244b6e.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547634; x=1796152434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
        b=orNnxcsJT5wLRMmayn7EAo5FOU0Ktovo8gRz1+OSCFk7pNnaNHxplKx1IJDdcsM9hh
         ShcT+m8DtooZ83MhT1AO4OIO0lPKMRI4+Q32Ne9zetkY5hfQ21xMQ1QKkTub9IEnOBco
         YDfJ0sv3GWjsMQabzHsixzL4i7quoNVRlrF/nmkNO6AlON2qw5Z7xaaz9o8xXzIOTH7S
         70N9b0tW5zIzoOetuNGU06riYyu/YxBPJL2W89MbFbXY05HcLxQsWgTj7gF0aZWm9qVH
         yZ4wEBRkmGhFMNxOo7/JDlIeKXg1W57igrcnB6uT4NjWd1ktTy3vJfexEg9pv2d3d9gh
         BinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547634; x=1796152434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
        b=AsCfNfq+f6OPLoCL0kIOffBMwoj8fFecEa2i10xPCHG28EmxyH95+ygYZs6sFagTLU
         pfzWzVocOxr8JZOvhC6HB353fTauf8/Myd7iCyBGQgOHKsMfZMOKZSzJNN75bAxByjvv
         k36cMFJGo7GdxByIZzw9Gx7GjwQMmy6czpkb9AfQ3Gp/0/6/5wOOkEvfo7PfAS20Q5Bx
         WvBgHAhyHGxeK40wg4vdcthnJCs/TqXHNxQqiITCbDm7j+g4N6Zx5D/m158yq6bs3lq8
         v6DiSx/hZ1qkx8MeCaHYIigQytKQMU0VqtDlWfPwI7moXoFrJRgUDsmy7gRZ25CzMjQH
         JTeQ==
X-Gm-Message-State: APuU4Z//GR7e+0uHb5Nv5WuUuCgHkC8p1SC4D1Mq+I7ad5bXQ/GQ+B+p
	VhbzrJNnGnhD/laMNO/pYFmwq2F8nt/7cDtnExD9sceC3O3qfnDUgVqGSINMWg==
X-Gm-Gg: AZFdTZev7qgiULA0Lt9rILan4EMTUWA/NtV+BcILlKk21dy3CeRPZMR47Lu4ActuR5d
	fP3I0127dbNJ4LuELd6Wyj4CmtZ1tJRWmfCND8uqLWoZaWwlRmn7a5TxWyZ10NIESAK1N2bvvaJ
	Mx2xkiGomJqY2De+TivJIPo00wtsdY3QoGNY/Ii8RgQhfjWxL3bMrJhX1xrtct2VrCq0MFQDycN
	IXq1hsOvNRPgrYjRd5ZvO12UG79K7RtjrfX1l59W9STU/YmToWcsE3Zt8BaEFtBBjl+yudHF3EX
	j//LGphrT61EGraoXopSJg9DkblxeWvWp3+/pmxIEp2OOTy74H81Fr/6lJX2nCd71LBZwwdFalc
	TJNlBipseeqvzURsuWZ/gc57VP/OSq1iBLRll2h1X47kJ0jF+ZBXfHQyhpU6iDKCjGWab7ZXXgS
	+1PUvmHiQ5p57inzYBUYhkhKfhgjoqwAn93EGsvNDqBa2PC2qwRvmeujuenjY2lwiUuJzd3pXhA
	PME51q2s6xZkV7v68OWBA0G50YqN3QAV0on78YBF8mLrHa+66Ha3a+y1/ApKPN4Dh7gLReOP3FR
	aOBv8xxckVjIeCathNc3cBwZvhav1Q==
X-Received: by 2002:a05:6808:19a8:b0:564:36f8:ee76 with SMTP id 5614622812f47-57a06b269d2mr16096285b6e.7.1795547633773;
        Tue, 24 Nov 2026 11:13:53 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm12774058b6e.17.2026.11.24.11.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:13:53 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 3/3] arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro
Date: Tue, 24 Nov 2026 13:13:46 -0600
Message-ID: <20261124191346.434143-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124191346.434143-1-macroalpha82@gmail.com>
References: <20261124191346.434143-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Cellwise cw2217 battery gauge to the Anbernic
Vita-Pro.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index e66803b5399c..2203e092e8c8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -954,7 +954,26 @@ hym8563: rtc@51 {
 		wakeup-source;
 	};
 
-	/* cellwise,cw221X battery manager at 0x64 */
+	cw2217: fuel-gauge@64 {
+		compatible = "cellwise,cw2217";
+		reg = <0x64>;
+		cellwise,battery-profile = /bits/ 8 <
+			0x5a 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+			0xab 0xb5 0xae 0xc0 0xa9 0xa4 0xcf 0xaf
+			0x96 0xff 0xff 0xd7 0x9a 0x83 0x70 0x69
+			0x65 0x65 0x65 0xb8 0x81 0xd9 0xaf 0xd9
+			0xd2 0xce 0xcd 0xcb 0xca 0xc7 0xc8 0xc5
+			0xc2 0xba 0xa8 0x96 0x8a 0x85 0x7d 0x7a
+			0x7f 0x88 0x92 0x93 0x94 0xd3 0xff 0x5f
+			0x20 0x00 0xab 0x10 0x00 0x91 0x68 0x00
+			0x00 0x00 0x64 0x3c 0xa0 0x89 0x00 0x00
+			0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xb2
+		>;
+		monitored-battery = <&battery>;
+		power-supplies = <&sgm41542>;
+		shunt-resistor-micro-ohms = <2000>;
+		status = "okay";
+	};
 };
 
 &mipidcphy {
-- 
2.53.0

