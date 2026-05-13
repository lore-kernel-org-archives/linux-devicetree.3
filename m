Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F93E95AB;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669066; cv=none; b=fbij2dfBjRw7ESW1rOFNN/KpTaG2Xo1uAeKbqTlKn4wllrhuoTDr77jOmmVUFwCA1ZsfG3lqZfNuoWIS4VkY/Kbvy6tUN0+Fn3XYytN6p/iWlMzEIPTlhXYsLugzYM7Y8sxNoClj3mKg08g8lmbRk6UdrNYBWYzg+cvXCG3zOoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669066; c=relaxed/simple;
	bh=D5pKwkGTYVUDViuNvaK69HYxWd8+FsaP+xhOfkL+fcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=stGVlv8P3sHxJHE676GpAZ7c/c1kvrXsPtbJnz9fnFDMABDkapftOv+xoWunM2MonbZllywuAhg/3gkVutU0Um6LeuBAVmXjQeP28uEaQaOtDwq9Py0WlwnZ0T2Brj5oP7xG0lZN01HJV/Rs9fnDi8/1/HeQDG6C9PReeKICNRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQB4xHLY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQB4xHLY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EF2BC2BCF5;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669066;
	bh=D5pKwkGTYVUDViuNvaK69HYxWd8+FsaP+xhOfkL+fcw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JQB4xHLYSZJtHr6Sb0Nm1y93yeG6NYoOTQ6Wyti7ZSKt4osOvbnZL0tEh5Oj0dkbH
	 2iNLTckRxXWi1UFiyex4YgSsrxsTHTwKo30DtiaTiwX/uVleKdHl/o0zDcBw4znmux
	 Oc7LITIphVO1753TxP6OxQgrvbuGaV7KbyjJO1Z37W+nZ1xJo/NnOSC7nbHSalZO/p
	 NzrTtj9uCj2Nraf85ZL2wNjUvoJ0H/EIM9E9Ar9hkC65ehAtmYpVYtReGMAX45IKcN
	 OYDgPfREz5f9YzALLewmeal3spIrzlI9IgGtfWTRFnjeNeO06dEDHhNVywAunjw1vm
	 cSHZjS6Th+68g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F31CD4F39;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 13 May 2026 12:43:54 +0200
Subject: [PATCH v2 2/3] arm64: dts: amlogic: t7: khadas-vim4: reorder root
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-add-kvim4-sysled-v2-2-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=3G/s+tL1aEZqmNnatksprjAgR3heihJkkWRnLe3A2sA=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZLGNv1+I0r086/u3rve8enBxNKzk5j6ttW4f/N6P3zC
 sufopyFHaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBE4rYwMqzYztjWVZ20+8XC
 VWesIuae+2tocXK3j+Fqz798R9coHF/N8D/yQNV77SCOUwGTPq49bTTHY8HTmOQJNzSlZ3DUulq
 ZqrADAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Move the xtal-clk node to restore alphabetical ordering.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..fd1b983354a01 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
 		};
 	};
 
-	xtal: xtal-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-		clock-output-names = "xtal";
-		#clock-cells = <0>;
-	};
-
 	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
@@ -155,6 +148,13 @@ wifi32k: wifi32k {
 		clock-frequency = <32768>;
 			pwms = <&pwm_ab 0 30518 0>;
 	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
 };
 
 &pwm_ab {

-- 
2.49.0


