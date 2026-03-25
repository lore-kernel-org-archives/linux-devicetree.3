Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A5639020C
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216231; cv=none; b=XjjC8TAvdfr6CRNW62Svo5X4bwnVR/8iP8TS7cVgyVzKoP2z2vMjp2zZC8qb8SplIBFSXpuzAv7tOJp9uqo6GBLkALJ+pl7VdRTBmal4iDrb/3hYvH6dyU1imLIbEh3N8djZ1fMnEk2DPqMdiz6fqeDJVjrRlEOtSAATmNn6LYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216231; c=relaxed/simple;
	bh=BMGCx5ILZcTjxAUcT3t7B0xVT8LVp+LvmlCkODVsCjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlSRt7BdZBjM9zdBdCNH7pggadVNPjVZYmBCCh6NsCDIMspvZulNpA1s5wnJOAVNvmVBd3Cd0cJZ9c6+jwsi6465ll4VFklgwPCZ/aC7lXspplKsGKy+5W4lHQ8ubsn2VZpPr3QBse5T1zLGD4v4AczkpNm0+3Ff395AiNTcK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stlw/Sr1; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stlw/Sr1"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d9923eec5so1173072a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216230; x=1775821030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up0rOTXqSkB7yplKxiVR+mHCT5zajSVPdbYhj+cSxrI=;
        b=stlw/Sr1yvKstFHU1Klzds2LHkFoI2WUPTNfPjKXDBltWZj0DE0Bb1gE8qbUZvn6w3
         VtBPMA9OLXJoHFGB3l57RBvQA64LzwsXicZ0Ylye801B8D0zUvNpZlDwqDztZDZ2QShb
         35dfaBb8vohRhpYlrNSsEm3UAXYBiK7+DV38+mffZDwsXFabFPvHdYQxXX0gYVQ+slBs
         WUxnskWezQ6ZgVeeW1+iQJ030SdhN3fndPsThKKY43O2jWC7z3i0cX9hXauv9hByfXqL
         qUn2xg8T0e5WyXiTRFnRJ+0By4XMIVatoxcjlOj1Gq7s7bh+fsau4HaL+T88gzHfdc0q
         adkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216230; x=1775821030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Up0rOTXqSkB7yplKxiVR+mHCT5zajSVPdbYhj+cSxrI=;
        b=KZZnhXnaJTIMOmg3Z7HccsTewPj3ISWyU50I7dTRVOh+CsyiFdi91bTtb/utI5sztP
         +RRtcUkh21aYVIukt4gueh5CPyVspwcLEOcJqT4/q2HMmgZ3XuSZSTj2JJJblTJXsdQs
         jHYUKS5oqT3SEhSmYWSZ48Jz5nujewDM4I0tblv86NlB0sHG0CUDN6ISqhGngMGmvtmZ
         aECJuoHjVHrF5vZD2BwuvwliWCNeaKQfkOY3nZQ3oPDj5lyBV9TpbGC4qw4wr21a3Lc0
         RU2EZ4IOr1NXnyT/Y7bQTOH/4IloJNfcDMn8mmb4JD0De/6iXLIJdPmCEHYFoTm4UyDC
         xV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFPJkg7HwWc6SQeZdjGBLXP97H1ZNg/VRHaq2V2i31WV17C8YiAGgUyram4xW6yhNEhUlDsGvW4wGn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8LwhFTUWWiPV1xoqS6+kTdD4d8V0pUOc3BUkDACFiXkJD26iE
	RKmoleBm5KALrlEYS7Z7Z180+/tLI1aWtX5XYj8VGTzQb/KJ4Wsy3nTL
X-Gm-Gg: AeBDiesMVzaZPywYHGAsEpPwTszKW/c/s/PuyELylXA44HM0ydUn1BkdgIY9qKYGp/X
	Yk/dpv/S0l5buzJifZ8c48OGQ4dkiqNKstOZkmkppJuUjWwZMySMlDQoxK7XwnVwxNRpO2lY8NH
	5IHVDzjuvCzXDBWV5MpcAjW7cTB+/F5MKagP7FnPlK+TA6bfp+PFAzb8Tl6rvTbaqaEswH49fBT
	uSXYQxmfIsDvjBIjXSf/1FNNJum6T34l/v3W3J1uSL7LiO7EG08wDjZ8eI6+FjTxoYLZgGR5Kmx
	Xguj3dKtgKaBZJ4NvOQwIykOiLRp7CsxFM0VedratVNgj50fLj9DWFuht2OTiXksaTkD5SLGfmS
	0vX3lro5mqetdTguuczsTNd6zLs9MqNJFg3jhQqtJhRiBYaDqaRNgOyGblF1MjO9DIxe1PVKpNQ
	BOX3qUCG2Sx/i4HtUQnSE=
X-Received: by 2002:a17:90b:2251:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35de69acf35mr2108980a91.22.1775216229584;
        Fri, 03 Apr 2026 04:37:09 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:37:08 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH linux-next v1 2/3] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and lable
Date: Wed, 25 Mar 2026 13:46:09 +0530
Message-ID: <20260325081700.1502-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325081700.1502-1-linux.amoon@gmail.com>
References: <20260325081700.1502-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the USB regulator labels to align with the board schematics and
power hierarchy. This change renames the regulator to reg_5v_vbus and
its name to 5V_VBUS. Additionally, it fixes the vdd-supply references
for both the USB 2.0 and 3.0 hub nodes to ensure they correctly point
to the 5V_VBUS input source as per the board schematics.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 9727ecdd9f6b..c35f4763c800 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -70,9 +70,9 @@ reg_vcc_4v: regulator-vcc-4v {
 		vin-supply = <&reg_dc_in>;
 	};
 
-	regulator-usb3-vbus-5v {
+	reg_5v_vbus: regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_VBUS";
+		regulator-name = "5V_VBUS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
@@ -366,7 +366,7 @@ &usb_dwc3 {
 	hub_2_0: hub@1 {
 		compatible = "usb2109,2817";
 		reg = <0x1>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
@@ -374,7 +374,7 @@ hub_2_0: hub@1 {
 	hub_3_0: hub@2 {
 		compatible = "usb2109,817";
 		reg = <0x2>;
-		vdd-supply = <&usb3_hub_5v>;
+		vdd-supply = <&reg_5v_vbus>;
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
-- 
2.53.0

