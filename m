Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210106;
	b=N55OLHC/ufW+y/zJYxKfZm7Aa0LoBua6zZihndoZ3jp8Wfh7EOXDQtszAN/g1BY3uz4L
	 FDWy9M72JhxagXdXOibaTY3CM1cO2XIlHRd0/akYZJi2t+MBsC0WExmsS3Sm4p50PPOHP
	 JsN28b8B3/bcpo+MxfwksNiK86l8x7hSHR7vvv6zw7u7QOe8LRhgcokDQOihGWLhPqIVR
	 7tZaBQBeprwgkYK/NMWZNTC5FJpsB62gcBM/5dBLHWgBaTnknFsag2Rc+UHn2/voO5Vpc
	 GD2egv+aU6tPZomDcbJgfDanHtocxvqV+XlbGmej9T81ZdPnQw+oGtdkqLPxDmhyDVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
	b=eQSAILtxT/9FrVpcIeNYVtgfHJnCVnoGgCdMDZM+qb18cPmpQLfQGYpOiTARxdJFKBHd
	 2wEKS/t1iQryssBMaCLK1ZjwKd8Nhbo543kjcanxGS1FBwHkrk/WRpUqWFoHjsvw1bWje
	 n4q5qxIU5/nkEV71cwclaTr5EKV0TFiWXbvYJtLQHyJCF5YMIR0DHQFc8ESVXFmf1T6nX
	 z9Q7mWgE/RwK0SKxV2QApJQmXnaKGCnAAg8Mv2+BaSSLxzdEr4wnlixc91dtGMhX6Ndmu
	 FaCpltP80kaOkYzwSwPbJE2Z47pE2jgSjUILJ0hWzA08HHI7YoSLp+N6FHFx1R5D4kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyhgev7m;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF979606A6A7
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 21:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF979606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyhgev7m
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-486f013db83so520217fac.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210105; x=1795814905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
        b=nyhgev7mW5eKBV/iKX707sp3mXrsjD5epAnpVMWmVKuROT4viIW4bTgsI2iBXHsOlB
         OXVox9hCt42Kdcr2vRg/RB3gQhEBD2XdVO1ctPLQyIErv/gys/LRURfV7p0iCQb9fMYX
         mZ4PJyQp8TW/wN4BW1oyyLZhQIP8f/tt44O1FzFGaLs8CGeYhrsjye0MX0k08vAgmjYU
         Q3C9xNoaVill0AgotMzYXItP5geKFhdrfBgXbEa5Ij8DeX4i5tkiWy10lkfgqAVQjDCD
         jUyOFKFZlLk1PojRBFcAXWqIAJuSEq4u5rA/b4Pgce5tPB1BfnRbZwrCHQ9O2tsaxNvK
         ilOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210105; x=1795814905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtcXd26CBIIDN3LfpX4nHV3TvJWIXKwwyZF0T/tbLeY=;
        b=cKCB70eosYdxs1/nw5OsarrMCKLOzj27TBUTkVIbmO4g55R3bdPpkQuW++sbfda92v
         HyRYLOwMV2Ds9wtWFH7TDnaLxKbtOrFmZkbCqgJcMARxQhSIZKtgruqBFyjJghr7wP4e
         FyI+z45216kcb8Cjtr0DT5ltT0RHXOdZ+W8dZ2Axw01DCT/LvI58qW1yZkYoDgGHTzKd
         M2PeP3okqGXSWySU01mEI8tCDK9kzVrJ6irwXSgLUS2cCtvaKXR9lu6D0K1Lp6H1px3h
         tzZhnbu4webrU+zCQp9e6FzD5Z/XWcOFeg6YYBcyr3hYXseWxoqMMlzjLorlCiLfCtTB
         l4PQ==
X-Gm-Message-State: APuU4Z9IieIWvSpxy0YL3DzB5sObFBme+IpLwif3QRRmh805N2Ch6C06
	F/13FcIo6M1BeQtRVevRJsJ7sJih/EkbI0x55Ghw9AlZDK85aGl8NpnM
X-Gm-Gg: AYBFou29n8cp0EfZ4I0H6tL1VtxIenKTa+1px7ocS1G+fwbhE3voIcjaNwW2PB0YZW3
	WAqMhWCDf4ND3AS1HhDKQPHjJfS2uE1nSFKfbYqszgm0EJXlEoXsWyvA7c5VJXEdwmDYbXXaTlb
	dxYjJQx/erAWH2pkau9JQJa7l6WJLoIZeqmSLcrBkzJ5yqc/+Wv2VlNOdGQxfvmCKegtEEMsmjW
	MW50GpVSh8hoIz4F3cqkSM90EmcAy4FgHU2dYcFUqTDxTu3zYZKq8eO1/Y1LNhjPVTJOHwqahJx
	ifLQjtjjRYoXmdp++Q0pd0JtFDd0rtddoo8qYwLaHSqkSEt8BPlE08la0L7V/4LZa9/7dgMkthH
	UHiV+EXCJCyxc2h2dbQHhiAUW1sAjCAWCDEpIjVN2WMoLlRpWgZ5XinS6ZQzJTBaE+tWYUL8HML
	Gqy2V5lHEWkNBrLuTIUgKq3pHIXMtLnIRc2yAIGcaPewIrvayaCk/RI/kL1ZRGChrqK0wxRW3u9
	8iCGu5QG5/scEuEVU77XjIUiRkinUUv/vwfjIMSkf2F+T0c5HuJBMmRhTOvAPIXtutZtYlXaZIF
	xBnIkxqwmTBf3M0d4HmU8sLmCBmk9A==
X-Received: by 2002:a05:6870:5b9a:b0:4b4:8c0f:40b6 with SMTP id 586e51a60fabf-4bc821920bcmr4451217fac.20.1795210104791;
        Fri, 20 Nov 2026 13:28:24 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d766sm3774126fac.2.2026.11.20.13.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 13:28:23 -0800 (PST)
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
Subject: [PATCH V2 3/3] arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro
Date: Fri, 20 Nov 2026 15:28:15 -0600
Message-ID: <20261120212815.35663-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120212815.35663-1-macroalpha82@gmail.com>
References: <20261120212815.35663-1-macroalpha82@gmail.com>
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

