Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6E33B774B
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786917367; cv=none; b=Ft7YI0UeTj1SPyqnmPXxgiY2tX9ezmIZukmqI+MYofxncB71+zislQszMSLbR59jVcGAKFqOweA8yF4ZL/k4GYf/5Wskn0yR4MzQaIgoWXQwnmbqzp47W16mcNZRwnLZpkkCzapUPpGw7F3uXEFOMtPmklh3X0qCrlENnhTu330=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786917367; c=relaxed/simple;
	bh=YnPAhvKumj4atfxnTtYZIxnxE4cgoSSko47sbyyrNKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qC0xy+EEul1pTXuVLNBb7Oe72H+o6+U29e8LxHSvjqqsw28MTBOv7GRrtziGLM+d7iiow7vtXtu5Y0j21qnnMqXkp/YGiAGwxwsYWbgbBRVk8yLCV7dHl8W/7nVDWrDscTYLrJBjp91oNTIPCnJPDlq3OoJLHRMwXgUvtF6tpBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fq5FmOk8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq5FmOk8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d03fcd26a6so4511285ad.2
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 14:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786917365; x=1787522165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=;
        b=Fq5FmOk8G98AP+yna0tMu15L8xOWTN+tn6a8ZjqEDVwZzhxDOmnJLk3byR6o5tqgKR
         yYajmB0YJ1FYM2c28BqlMT122BOe6+Qa0tfIgn5ERFIXG4dVLZF1YyKKKgJKeDdEc1Eo
         XZe4kVrKELwG35pl2UO2IGtYygu94XILI7L38k0s5qQAT5olKXhLjgpoheQg/eQ34sF+
         9hEcmKA2bx370oaEJdM6KXBYyMoiXQQPukoq0jwuP6cnqgHNMYNusnLI0BqYrxsLw52M
         lSn6O6qXQPWKrEfuK8LEjzHRJK3e8IpJpq8kpb45coG2cVjO12H4jfog6PiT3zcBLHCB
         HycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786917365; x=1787522165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=;
        b=I/YLvU6sneyYt1QoZV7l8exN0YY+hfF33eNLvJXjRK+jgecdI6A5OqbYlJepfYpXbT
         Qk95gwwhPjQR6xueyyIrR5q08wXNAc4VX5GuUWsMiSa3tQ7szIa+eKPcPc1c1vkSjnPC
         NxXs27w9QpfI3ZoU9cW6DOt16qUAJWYwYJr9+ajyJDH8aVsQ0tNBaNy/ewJ9mfWxhMNY
         WEGMMr8YRxrphCtdjBXXCDV+3Hmb0YEQz3D2ZXEkJd/VRGctRBksEUP3YB7Gt7oq5UEP
         1C50gAv7zG/vBqRvQ6RV3MzTzRSJDu4HhPrCIexL6g6Wj+6F8madnLjzEgNbi1FmXiUi
         B86Q==
X-Forwarded-Encrypted: i=1; AHgh+RompSZgIEeP5g4gmXdmujY2DAUypiiFuQU8K9RoEybtCQTsN4TLlN5SwvaA+JCgEsTeysi9b2OKPOIR@vger.kernel.org
X-Gm-Message-State: AOJu0YyTc3Fx40TU+b9CFKMcKEvlcamLw50C/WZUJVQMygqgNdHq1yjF
	F/ulxvYHoPSzXSuWAZInRPbnm63eCovsO/cyRVSkH1aoSByG9CgqEa54
X-Gm-Gg: AR+sD13l/2TWvYBZcntRaxyiOsB4pHFhO6hgRN8+N4uIvZUksJ6HCcZrvjS6Kyn8FT0
	JPTbh2xvqEWT5pX2NgC51xOTkd58vgRa7nQZPaKLAkGQSVzbaSOQYwXyex9tPMUH4LYTNx5NpNd
	wpmCPj4PVDO0diMGQTVNuNkWgumL476smoztyElBEYO1ryFoDqf5Tp8AT201fHcGsFC8BeqsTaY
	tLOMwrepUF7gpfJo60145ZqMTChpsBWxsLx0kP6jnRB+Bm00MUP+1vFZw0z0tPiWhFWoMAUA02M
	v6shIpLyXeBh+azFViL3gQbQlI4g3z3oRPMi4YsEIjfVCz3l7Y/0Q7p7ME1ccSZWJ1ebmeoijic
	41IKSqnUtuRshFjqIbrVC9CDNVhjWDfjK8Cem8Z0SWjaMCNYfKTrOBpSGtxMQAizUCiieLyMHFR
	IQW5xO+Tm0Bce1wm/kXbHo85Smth2t4bFPGoe3SVv6ReGhptmmWGqVU4xTd3lZ2cWVNAUrtmaIU
	Q==
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d3b0503575mr147844835ad.0.1786917365007;
        Sun, 16 Aug 2026 14:56:05 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:504e:1c5e:cbdf:b953:2369:869e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm30168318eec.10.2026.08.16.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 14:56:04 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 17 Aug 2026 03:25:25 +0530
Subject: [PATCH v3 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-ti-davinci-spi-v3-1-23844cfb5e6a@gmail.com>
References: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
In-Reply-To: <20260817-ti-davinci-spi-v3-0-23844cfb5e6a@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786917340; l=1081;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=YnPAhvKumj4atfxnTtYZIxnxE4cgoSSko47sbyyrNKo=;
 b=Dgl2753Re5cUEaNKLNQeCEOIJ4woQyHiL5DlRhR78W0nm1I83BcVXEpjbecipodC4myjHLxZQ
 1eYV5BuJPKrD6y9slJXTnlyaKg0etdOl/bHLONKGwVlTAfZ1Cq8u5Rn
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Property ti,davinci-spi-num-cs is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard num-cs
property instead. Use standard property num-cs instad of
davinci-spi-num-cs.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..39a846d7f8a4 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
 };
 
 &spi0 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
 };
 
 &spi1 {
-       ti,davinci-spi-num-cs = <3>;
+	num-cs = <3>;
 };
 
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0

