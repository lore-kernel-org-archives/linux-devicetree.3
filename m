Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C78406832
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093922; cv=none; b=kfBRBRaqiJgBhQLRomVtgFZtI6VIPTL27wz0vW42/cmc9a/tH0lGaz26NOb7NZb/LQiZCzXuAjDyIt/3RHB5eJ/YskXYXwkYg0AO5nW+nJL0BwTUUgUOWFok14R9fAU3qlT6mV6FB9153ZxVuLc/raXwt7YFSNiCiTZTUxlfHPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093922; c=relaxed/simple;
	bh=yysbUW3aZgPyrjC1A+db48LbzRljGcyZydolnzYEPR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZvyxtQg1FoZwZUBZZfb75vWI9Zsg0iHnZbZABNjG09vWnzssZM/eykREj566ddlbhB8fvcj/2WvLbMFSqu2jYc1bZcw7DpAAweybLkGG+DtnmeHfGoyFPY0YL4Ea0rTQztARW/qEggxvIwhRDHXouOZo0n00KKhGVRrzzhTqAfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xp+XMkQo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xp+XMkQo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso35262435e9.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093918; x=1781698718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7tivorkStwB1FS3/hWit3SBK6zemxB0rzwIUjUwnSE=;
        b=Xp+XMkQoK1AdUznczIqALISNLzJ9hxgULuS9WFghNCBtb68CEXAwPVdugSoqcx9k3F
         SEVuZgV1n6BMaO9jitBERr63hM+/dq4rWhib2g2BgJa/J0X62nX3y9NxC577TtOIkI0J
         Pjs+qbEutNdHF7pbdpn3ZDxzdLCX63ZEfo5DnQmyAL89Me068Jghayw5QQSnw7Xvnnxz
         /ECXOqR1qprFRzsmhnFVVkQ9XmG8HciKiamVMaQsYSyyD9q+vvFSJwvhPxmniIg2fBoG
         lYN8Dt08LWKPaC4JUs2iXnYfDAwq6TCWHPP54d39w+9RO2PqW+m5gwAd9HpbBMVbvi6H
         zKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093918; x=1781698718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U7tivorkStwB1FS3/hWit3SBK6zemxB0rzwIUjUwnSE=;
        b=LLT+RUJI+1YiRiB0fu2HGyeh1XAeDBxIetQaKtOWc+LWnkXJaedym+dwlTJiwTpQxM
         5mTrZSFGsAEUEIG+/AyvvntYrHY0/a2va9YVvO/KEtvMqV3az7gHzrVA/YBIPRZxuCn3
         6eoxDlf3G+AhnjhP/hTbLexPCLN9v/FzIGP/b52HH0+/SOBaYbnLtqW3tugq/98COcDL
         CjBreCTfzkajPZ+0XVTaIyp3iKZZ0lpqxmbpfs0Rx5dBFyAYz4FWFZFhU5BDZwSQ77Dc
         r1fiD8MWI7VB81Rs+6eAaUbPtA6rtMEl2UqkSSXYUbaku7ZpX4oGjt46AOasOqHjZtbt
         iZDw==
X-Forwarded-Encrypted: i=1; AFNElJ8WwptvL9fip5pf9cAUpdW53GlrJQXtrPqk7AItmXj/r6/Ck7ftHnjEyp+0O6s11msyuX/b9Yh3eC4u@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6GFtX+G4WlVxUY8zXA3DzL6x/wRMNY+fYuo3uEbQzQeDJWD4
	XfsZMY11wqHVP0Br0ldQ9tLsWflC197vfxQj87mw39ZfnViSmPgnAEO0
X-Gm-Gg: Acq92OGY79bFPSuFlsM36K6ERr7c/eVb1WJLyquTi+gfgg+E5TkmFcB7k9DOkvAn1Hi
	5jK47zWrM2vMEJjag5NOK1lrNAMR0EBTrYp/m7n9zZd+Uh/1DgFVLTAsXMBqyQFwWWFVitXHugF
	3ka/ikrFJGX+SJ1hz6XJXYa8whbcE10AX+hqK0gkZPcpDXOg14TK99AriI0w9LB/M2r71taKYBE
	kQ6+byOxzKBG2C6Azb9GTyYxyynjyAdqtMiGI8Gm3GIgo4hntBbqDQQWPX3mx+OF+aTVQflstNs
	hQ9e5GcE6Yhhv4wxrliUSouiLYCr72zTrORb+T6fLhBiGk6U2WHvfULvsmW0OFjZvrmL7lH176D
	1lcxzPWhc0MlmTpSeSBrWYUqeNdIVlFaFHXSnrcuvQd/b+TAESHQPASm3oSGPei9VgO/6eregfa
	SRmpMxy6PhgKE5cgu4K+m7FAa94haNR/ia0QJM05/1YU06XP4qy0fSkSU=
X-Received: by 2002:a05:600c:4750:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490c2cb81fbmr286119175e9.2.1781093917817;
        Wed, 10 Jun 2026 05:18:37 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm566553095e9.15.2026.06.10.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:18:37 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names
Date: Wed, 10 Jun 2026 15:18:21 +0300
Message-Id: <20260610121822.2524634-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610121822.2524634-1-tmaimon77@gmail.com>
References: <20260610121822.2524634-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The NPCM7xx FIU controller nodes reference a single clock, but their
clock-names properties are not described by the FIU binding. Drop the
undocumented names so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>=0D
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/a=
rm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index a16450abea0e..83cd10b47273 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -193,7 +193,6 @@ fiu0: spi@fb000000 {
 			reg =3D <0xfb000000 0x1000>;
 			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI0>;
-			clock-names =3D "clk_spi0";
 			status =3D "disabled";
 		};
=20
@@ -204,7 +203,6 @@ fiu3: spi@c0000000 {
 			reg =3D <0xc0000000 0x1000>;
 			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPI3>;
-			clock-names =3D "clk_spi3";
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&spi3_pins>;
 			status =3D "disabled";
@@ -217,7 +215,6 @@ fiux: spi@fb001000 {
 			reg =3D <0xfb001000 0x1000>;
 			reg-names =3D "control";
 			clocks =3D <&clk NPCM7XX_CLK_SPIX>;
-			clock-names =3D "clk_spix";
 			status =3D "disabled";
 		};
=20
--=20
2.34.1

