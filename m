Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044628;
	b=tzyakvCc+qyRjzfHCO2dOkduOMXaF/qSQzCyZ1y6ABwFRYfoNQmRq81bSg/HDyuCN6Gv
	 UC2cJrPnhz1a6V9bM6wifxucw+TAezJaQUf9ziCpfYihiC3laj/3Ny7DMh0hsoTif3Czs
	 WUlq/JrXzGjpJa4JeOc9zZXMMoH5nVdRgstL5U5p9ZWwSYwwhNoZMzKP0lj5GTghbtw85
	 ocDRo9eCgMuzoGPnUUYRZfMSPP+29EqWv05aIx6BjLBK3R2pZ0OS3FpVtyskRxx3cIh/j
	 egSwABw0Bi8jCmjABeios4qvg+bzuXME5Z9B6tb/xUkxLaeI0jM41/XeTqHXdYIz3Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
	b=bOSUw1TvhIQDBjAHI9LllU13ZkL6ZTwP8ciRxDw51EreGwszSYzwtIYlP5DYxjcX7ibz
	 xmTireQ2aCe1K+GigSOkhNaEamDMZD5yfbTpLwIEb6wTqeqQY+9nFKdRlCgaqM0cfofKS
	 Bm1z0Q9tn6y+irkQtBFRdgjW6pO9gxpy11nYT6hLpk3VAFZO0A0oNaG4Jypq0PftRcUNE
	 2CM1vnwgAM23ZQq8CkLx5iTGqOcjLvePhXtpNSkvVVjUo+CsjCZK+dm3mBs6uZPJeVc2J
	 HvR+/fmCrs9Vfum2NGPWOZsHq4kTzeu5zEfl5kogV3KECylLtDkvEmC6RiQ1tt2lZwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQHte7tw;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1B7606A331
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1B7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fQHte7tw
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso92519166b.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795044626; x=1795649426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
        b=fQHte7twvVa4ti4AxeR3ITcPPyA21U0F3oX5LUSp6ezZXwCo8Ey7OWJob3LF0UVAAr
         I2hSfFTBtO6ahErE4Sa7nZkKv2B06BtkHuN7bMEOGpwxaiRIUZSDlJ8IgxL6rfAPQFnf
         FdfXVYD/bFQO2hVWPOd6BboDk8yn3XxgCJQkn3LdMBTMl28FeDtWuO74QQqNRgp8dGqa
         /b0NPin21kI/JlfjlHPl6HNpyQx2X7DNsvGxhyllbGHYhwsx/KEfpnnP/uMNscEajQUD
         A59I2/T9EcWbLLwL5wsZFVqG6uZ1OJVERuMb98S9coSUcftQL18qWAwSEfw2sprW5DPW
         bnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044626; x=1795649426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5k/Nx254skplKaHZfy+hhUKCjKjMi13IPnfogdi4XtM=;
        b=q/qU1g1teDqDjYE9pIO/3Kw7tikrr6ehj51MV1GXXKqkQimLM+LthxM/eJcGjBysi6
         cjDShYyJSfXfUPtMPn+wSUaT3b6RZVYIKE0HieTGnhzWoP2SaACp0uQCkXuUPoz9lXWp
         sZx4s4EJkGl5MVis6AKZZkstTxok1gLq9pTj9iO5t3OuWpG4mGopJ4a2RRhckOWVjWhw
         g52di/nZB67qJ8Od8W3T2l3GeO1n73GIvuEy2AJoZ5TOlDLzFaLZK8ULAHHwclH9tycJ
         tbeWmS+7Jg8Iit0GCyvkgSnHdSfbdAbOd67Z9UrVP1IsOvDmAhRZtsD514FqxEX8a0KE
         dY6g==
X-Gm-Message-State: APuU4Z/T1H/XFH4vrmdd4BEpLuPz+RHqP3AK8aH7qC70n/YTFeWGxk9T
	tosTuYtVl5WwIgpMpUKrUru3Nvjgb0bDHIq1SEOtjgLGN1jp6GeA7mgK
X-Gm-Gg: AYBFou2GnS2P3YqcPcH0XXJqcu8T1Eq8lg6+DHScdhDlcAdz4lhiZodik0QI59j0Qzb
	CNwdKz6OiqS2Ah1qbOJnzJolE9dghKIRYJQy1CukAQOpEsRkgtqPAJ/JIKle3eRqgDbfa5mEzSL
	3a4MkKrXW3xKJgUTwlfAnMPWV458VbzsINQlFPxAKSXOn2914qAYq9Cz7T//GgXM4o/V/xyQ3rB
	8ncXKMPADGv6GH2tuimwQdPjDfz5XpS4irwFi1QTv3+0lONG7vRKawBpJEmP58c4XK63WIfX6Az
	S0jDtz0S+kRryCntySCkdPvepOPx7eUsANdC153Dtm3vAocZ6mX+x1z7ykl7DEia/Rv43sI5PdW
	SLJ914i+beL4xkjy5kEELxF/gRUs+EeMKuA0qxJMuOk1tOyr27osffyeMCTTD8P5+66cV2OH+IM
	AGCGcoGkA6mARhjwa+Isyo46xbWaxWQt+MzTe/k4doBDPSsODanmkwitPP1Z1Q/ZPOKBIultzmk
	9gOHm6i63QvCae1j/9zNkTfeM8BlmHtLo+YHm5XaLmPr3NkznDrh98YMIX3JItFBbNIZiwvX5eL
	IFMUINKw2opwJxd5ythV0Wqjb6wLA5hmdbc5+25vQY4=
X-Received: by 2002:a17:906:4fcb:b0:c51:249f:7215 with SMTP id a640c23a62f3a-c512b8a55f1mr7876266b.7.1795044625877;
        Wed, 18 Nov 2026 15:30:25 -0800 (PST)
Received: from localhost.localdomain ([193.107.16.241])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm47809166b.78.2026.11.18.15.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:30:24 -0800 (PST)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Thu, 19 Nov 2026 04:29:42 +0500
Subject: [PATCH v3 4/4] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
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
Message-Id: <20261119-ok3568-c-v3-4-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
In-Reply-To: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044612; l=2276;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=BU4GHjU/addW49Fi5owY8SmKZGnqIixi6vq82uwwdHk=;
 b=/neaR05ZN3d8VDseWD4vUUFnzqAFmowQBx0qURgqWIMzl0ozaAIRHvzg4a0boh3p323u7e21t
 FjwCaP2NmMlCftIXe3BWOgr3mCScXHJSAZQuCsYw4a8uF5wZTDs6Ok7
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C board
and allows to connect SATA drives to the device.

Add overlay to use combphy2 in SATA mode.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile                    |  5 +++++
 .../boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 48c83f79f83b..45e94a44107e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
@@ -275,6 +276,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-haikou-video-demo.dtb
 rk3368-lion-haikou-haikou-video-demo-dtbs := rk3368-lion-haikou.dtb \
 	rk3368-lion-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtb
+rk3568-ok3568-c-fit-pcie-sata-dtbs := rk3568-ok3568-c.dtb \
+	rk3568-ok3568-c-fit-pcie-sata.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
new file mode 100644
index 000000000000..474488ea994b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C
+ * board and allows to connect SATA drives to the device.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie2x1 {
+	status = "disabled";
+};
+
+&sata2 {
+	status = "okay";
+};

-- 
2.56.0

