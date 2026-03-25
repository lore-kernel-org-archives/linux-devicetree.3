Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3A2FDC27
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216246; cv=none; b=mz4uX7/TimUfFR7wmxPVRBD/TOsMnuxAsXpH02MuiYuTbMh7heYrSmmCRTlqKyfVJ9bC5JA6iZlgixLgaANf0BXABdAGujlx27dn9UJ456KraVeATP9YCGQoRAGfKiMVFlbweP4NVbPFN490z1gu8J02ezxGYEacswxlTRaHxUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216246; c=relaxed/simple;
	bh=BLgHUstfAcn8HjPI3+LMBZ08W2YcL4fGUT7KyF/jEKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/getTT1U0lPxQl9A0YBTli7r2sYD7an8ij19IjUgrc+WHAaUf7c2XdymVnBf40vTMu4uGT2Se+lj+lWfYwNbitAFVE+rSl21sEapyMDMlQLl/7uyGaYYa15R4eselE4KeyMloyJOq0V/9Lv+gZr9au6ZEIZzOVHJsksDyIQRyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1whvykk; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1whvykk"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1583160a91.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216245; x=1775821045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuMPAUkAJvfBgKNEN+2BubKNuxBNh0SHWbF0CWlzYqI=;
        b=X1whvykkwcvPreNHL5zuEaETg7PtSds2nhv12qoOyVFBD7PgI/gE7KbEGFwP5ouQ7U
         yWyPfB2ucNh1FtD+gQF35kXsZilJnJGMRVpJp6miBd1byl/DBuc+JmFsVyAa9zjgltLq
         zLOgnh/C7tZc0ICdjx9nvJu0tWr0GQX9LyKsPPv4ZNgojVQovjWSs/jTohi6TFx3mRFi
         SFMkooMqf41spvtTZrBA8AhklcuBr10bfoogMln0W175pAd1ZfbDpueJ7zWBjhLc/EDd
         V8ICV6ODuchbWW3cfZpmepfl8a+MIpReFYFdwt8EYNnHBLtcjZ3y7yAlQ86yN88Dxa6N
         H2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216245; x=1775821045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CuMPAUkAJvfBgKNEN+2BubKNuxBNh0SHWbF0CWlzYqI=;
        b=iBjAaWa0NH/Vclf+SOdx11h/ycSBUvh7lXh3p6MRlSg874MEE+L4pdScDNLThQt9ou
         LTpvFC7Efd/iu3gCe+4FgU5dCEbXicER1VT/QHMFrynMRoTIuDqzfGFgGQs4/d0cOv+k
         E5jBQLl6odqYGHZY8LcX+Qyh6F5QKJZQ8p3c1DBYL/33HBBR5jHABKe3+AwN11mZu9O6
         RU5ytH1fv+V/WbWhWv+EmJKf3nlIAKalgvsaRpQABX5k8jYbeiY9WFUjImoztej92laN
         uPrS6bqI6YGFPWh0iBSETCFfJqJRjdqiAXyaG8oyH1vAdp5gVlAv4Qu8uWOoQ1u89gKV
         fYtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVofoTUYwKRRnUDVACabO46waDQ8Mto4cMy39spIhRHG+sI/BANZe4ZFH2Zco2qw3K5yA2+oQpQaXoL@vger.kernel.org
X-Gm-Message-State: AOJu0YyNwnNNhsqx9NCAhBNNvqJGGzZXN5EQQdglrJEOlCoYh4D0wDFS
	WGJbvbV71x/f5dlU3SjwHe5Z21n3ycGLUCKMe/t15MiwrLWR9/Od6JU2
X-Gm-Gg: AeBDievHBmkK7uPDy+lH7Umr4S82aLhKqSaCYbV9WS/U4dqx0ok2fMg5n0qX82DDk9e
	pmuhxLlWMcR7dWSvblC4pcOuIwiZPHgW7hTvLOOCMtXLLqLm7sOEXrt7p8VcCXeQRnBoazPsDUK
	/jY7jXDNQonK3n28U+3cTwQbYNAq76r3mDD2iGot8ImN2MSjDkVePl5XJv5ob95iyBk03Xz9NWB
	8+SnCPSz8HTGdheC34D/qYaMuWfeTC8gz7KEmEwNmK+5mJXmJPGHuZU2n14gIWwwinpYLSyoWoE
	n0Dt8ZI+OThjOAuzi2cgu/7D7vqYjZr3Q+xXpK1hdlWSclv/hge4neKccG+ZPqLrydileOGgGjk
	SL+Vxk5twCpAnEW2vL2mucRlVTzEc2+xrgvbm+bj4YtxDgrj5/iJJSbtvxtFima6s7VkzT6XHtX
	xXg84hX0Ow0mHaXwhW3H0=
X-Received: by 2002:a17:90b:350e:b0:35b:9682:51e6 with SMTP id 98e67ed59e1d1-35de691ac13mr2549960a91.16.1775216244668;
        Fri, 03 Apr 2026 04:37:24 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:37:24 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH linux-next v1 3/3] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Wed, 25 Mar 2026 13:46:10 +0530
Message-ID: <20260325081700.1502-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325081700.1502-1-linux.amoon@gmail.com>
References: <20260325081700.1502-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Link the usb3_hub_5v regulator to the USB controller’s vbus-supply to
ensure the USB 3.0 stack is properly powered as per the schematics.
In addition, align the USB hub regulator with the board schematics
by renaming it to VCC5V0_HUB and marking it as regulator-always-on
to maintain power stability.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index c35f4763c800..3dbdf53b6d8e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -83,9 +83,10 @@ reg_5v_vbus: regulator-usb3-vbus-5v {
 
 	usb3_hub_5v: regulator-usb3-hub-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_HUB";
+		regulator-name = "VCC5V0_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
@@ -361,6 +362,7 @@ &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
+	vbus-supply = <&usb3_hub_5v>;
 	status = "okay";
 
 	hub_2_0: hub@1 {
-- 
2.53.0

