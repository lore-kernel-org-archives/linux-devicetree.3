Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268422;
	b=HNIGrfHLUC+vUAZYUXQWUfeGEZv9aShu9Yx+0nbK3mdioGy3mfK7oqtvdM6hFOPBJeLF
	 nlgfQjCyHt1razE/JWFhMJnsN3W/ivXIS2344sRqHunA24E2TUl/4/yfeqTFbo/oMdJNm
	 3C7pdIzwqQpgO5JExlz0NcXaVxKUc3gra/5vyLfDpyLKaLjDlOxsryedtLpe2Omg9TAZq
	 OsCNtzxfwcAd5u/MDibVyujaBFz95JSUuMBg+zdZWQ7N5t95OLw8JQ0WAwn6TgPLMvgqO
	 a+ugymK3hTTjqU0VnOMt7uk7cqv+veZsbNC32KAWvApV6C8AOF9zuYqmlS7ABx/anvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
	b=rUfk8S2Eejs8EobLrws6BSmUCtZEYNPAKGgG7ZyLRLY1srcVQQ5/Kw95fVzFKOncJSD5
	 A1LZTQihJ986lv8kal6YvjHjO4SKDGgoTLSHjMaVUSE76oEyELZavC8cpMrHrvXGoUCCr
	 XP0vx4qhXQEqRMHYU9CQjg7gy6OD3qkQHBF6tppontGN1gSbnvcFJPUzAh3mizsZvXiZO
	 TisTA8B1mxzYewkNONkivQYWYs2oVre11ZiX7pOw/CuI7xDBZtz8DY/XquLZP0xj5O23X
	 8VxPpRd31Ub3VoICA8jr06IHy92t07n4n/sCOfYZ7RYpij0iw0a97O460DuSLpSJp8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAFFjDnK;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054B860A260C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 054B860A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAFFjDnK
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so14811515e9.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268412; x=1793873212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
        b=lAFFjDnKXk3yH9RHcKlULdwN/XxVDGn0oMA8mXORaKO4pb2jDfGpEFQuvU2GdRYBrp
         odpaKHZhwiUMxt/EhkksTRDQKBX23YlXeGuXC0spnbFsv4oV/poSijzq+2qP/JhgEc/d
         kU8NIECqSVobeduQxcoT20A1EpeYj4nSO/JzjAojX4gqStiVhWoMojgLLiSH2fpGShX+
         K3p3JmvcAFy+T7yFWuGZT4Gj5Xow/XlQl/KVGMKiReFsU0RZOR2bCKv7Pki2IukrhFwv
         2paWFfgdWETuDBSmNXXM/GNoRDbiJtDQ8mQXuUJ9ku/CPcKcrrg1Cdb/NOBB0OYvmTVA
         Y5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268412; x=1793873212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
        b=MOiDU4Yu/0wTODLQNnbwhxuc5lw3LJic+HDM0b/gyfYFhvdRiFBFLimLpiRZDlM42L
         EIy6FCMdKQ0xvgMNJu/qE0MN71xPrHke3bXeXe851H59cyEujWshWxKUCZHzGF+lF0AB
         xrRWkRapmb1wEBkD3kRZ9UWaQBw0U85xefFspxxS5JW/h5gASmS9T6SaAn8qm/GuCsFL
         S+dlNkk2nWqvqPv5WNZQn2uH3/hJm30V6A6QyHTxK2WkvlZpFvMjZMzXQAYSxPwy6ZPT
         CtTxFsLcitrwkiSeBUEJCRFcxefeqXzkx1oC5Klxk8xcMiDggbNGUFIO3RkwAsI6dbIC
         d+gw==
X-Forwarded-Encrypted: i=1; AKwUvBzdpQoPumpzgJwLcCYcy2yi1FyNS7fwc99Lx6ZTW+SNAGd4ZHRvPyj3w8Rc7idgqvsDjB18BSLLEsI/@vger.kernel.org
X-Gm-Message-State: AFq9FYIspmaVS0GDDT0v+0YpsUMihUh8p5XwpVy96YHpgeqCpRaR+1SI
	04IXsE6CsKrPzw7N01U8uWykvb09/rkE9ONEt9Xb5FJ/aEaPhSGi0J0l
X-Gm-Gg: AYBFou0GqQwMwwtJMkrE1VnrqWKq+V8jvfZ/NgGUvQkPtjzeSYxI8aHcrtA4Tc1vytU
	OftUOVW29nVJEBhggKUUY0QOKtF4ID0PiEK5RZ9Ew/Y+bnDVoFy6fwS8/U3EF4X+O+5FHa2/n/r
	QI82tCak//FWKq395JEnHTRPDv79c0bMjrl8JQN2JiVa5Lw7vl3uT0ZV/7Ww4S8Tf8K1xh9m7Le
	c6ShSxHLIKOxNiLbQw7SGMnNcCLzkSA9zDVdzGvkkM1S8JGl3NnTUGxng0NYqsSxu6IR7f7mMcC
	/B4mfPk2Zzo1NqD8LYwoyGkSzUS0xZ9xinob10eIzSYheKDPezTEa4t0FjRyIio/htt2OLd7+LL
	jYUtCAzuPlj4O63rg1R7hzIsa1GG2mHQy3aCULxUumblsgHYnLz3kJEP1XoWwfq5BVtJuitkpI8
	ciDjshLMR+T/7tVfZPitfdauuN2hxEJqkY1RIAmg7Ls6kndlAuXk96UaB888onreG0GbfzaM5q7
	4Xz97rGgqrvH1wg3S+q2IsqSoBR55PUVMpR/evHzviaafWlh9LLv1F3Sm81NNj8FUEE2rkbuYHm
	YD3bc7Qayoa/3g6S4dYtRme0sfVEyYci99RsZVhpGYmunwVAokXO9OnsiiQVUXy2b9IGRbwBnUm
	DHbmDdZJd
X-Received: by 2002:a05:600c:4ec7:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a9660b5041mr117976975e9.8.1793268412452;
        Thu, 29 Oct 2026 03:06:52 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:26 +0100
Subject: [PATCH 4/4] arm64: dts: rockchip: put the PMIC into sleep mode in
 suspend on RK3588 Tiger
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
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-4-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=1641;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=SDfGdhdTbDViPNWR7gWVkSFVjA2d78IFMYAVeDi6pgc=;
 b=+lV6mFqZezu/+F0xruZF+cG3BHg9hNr6TFfbzH6ls2C4+aEQv2qB9TmeiX4sbnF59e3EHmvUT
 spRbBmKPD3LBiX00XMbFZ9MHPNkvGrR2KGQSbwdMr2iUT+IH87yeXEr
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

The RK806's PWRCTRL1 pin is connected to the SoC's pmic_sleep1 output,
which the firmware (TF-A) asserts when the SoC enters suspend-to-ram.
It is configured for no function, though, so the PMIC ignores it: all
regulators stay on in suspend and the regulator-state-mem settings have
no effect.

Configure the pin for the sleep function instead, like other RK806
boards do.

Measured on RK3588 Tiger on Haikou, suspend-to-ram with the logic
domain powered off by the firmware, module supply current (5 V):

  PMIC pin with no function: 0.218 A (1.09 W)
  PMIC pin with sleep function: 0.086 A (0.43 W)
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 161c89c62bcda..592a2d11b36b9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -471,7 +471,7 @@ pmic@0 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_slp>,
 			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
 		spi-max-frequency = <1000000>;
 		system-power-controller;
@@ -492,9 +492,9 @@ pmic@0 {
 		vcca-supply = <&vcc5v0_sys>;
 		rockchip,reset-mode = <RK806_RESTART>;
 
-		rk806_dvs1_null: dvs1-null-pins {
+		rk806_dvs1_slp: dvs1-slp-pins {
 			pins = "gpio_pwrctrl1";
-			function = "pin_fun0";
+			function = "pin_fun1";
 		};
 
 		rk806_dvs2_null: dvs2-null-pins {

-- 
2.47.3

