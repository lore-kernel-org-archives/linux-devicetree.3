Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DA132A3DA;
	Mon, 20 Apr 2026 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693267; cv=none; b=Ddpb/IwAWr8UKnq33tVxeUkdZCrZ214oAxNjmOGUqA1/5p4qeTfisCNDvJv8GpzndEiQoS3uR7zx6ojn2kJHCs4XT/BI/WRfr6B8YHXiHIcqPzXjCBob0NOss2FkkMir1Ildd+oNLwaCTZOw6ViFu9KJqFnsnA38qPIASOuDhuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693267; c=relaxed/simple;
	bh=TEedfJO5TR8o5gDN9orq4akY5TFlnSMd+EhYF81BVfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q2/jAgss5rBt4Sy/zujWsElvcOsQh5jQxPgic8W1eaw5L6HEuPbimBki7bHQkAlhMr5UoAaNfkmnFktCPlX+tPAMH00BFE/G/P/YrN63xwy1WpaLV7EGJgZUP7/ww800I8UtWLkOTC/Hr7IbAQNJ1cViSnljtVwXT+0g18VwxTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=Ee7TOVI5; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="Ee7TOVI5"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776693264;
	bh=TEedfJO5TR8o5gDN9orq4akY5TFlnSMd+EhYF81BVfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ee7TOVI5f4AKDyzUEEs9t3WC8E/9VBL02/IxTl+n8w0gdU9oBRIKZVB4bqd55Usbg
	 WWjSlF+oWytllwIzTJrmsvYwKFx9f+jcWM6fnDl3KWo8jo5Z92bZcBHIqg70SkE1eW
	 x+f/KhqoCadzriBU4Ja9IosED50Eqt9gvi+9h+YQ=
Date: Mon, 20 Apr 2026 15:54:04 +0200
Subject: [PATCH v4 3/4] arm64: dts: amlogic: t7: khadas-vim4: Remove
 redundant clocks from UART A
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-add-bluetooth-t7-vim4-v4-3-9505df0e7016@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v4-0-9505df0e7016@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776693261; l=791;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=TEedfJO5TR8o5gDN9orq4akY5TFlnSMd+EhYF81BVfA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB9Oi22krmUixENvm9gPAV6+FBMaSnSFWTTpfP6HPAwJnP/d9Vpju973LaRA+K1rKFYn37uZIlF
 TeasUHiBbtgg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

Remove clocks and clock-names for UART A, as they are defined in DTSI.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..3227ab27de107 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -250,6 +250,4 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 };

-- 
2.49.0

