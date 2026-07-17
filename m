Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1F3FD147
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294433; cv=none; b=CBhgZVboEE2MDOQ4OyF3QvwfjpKcydIMP750VnL6l7PdwmmYmtIlcMmrOmU6G2tg6JUOWQ3aDWLENJzCVzk28XgI+EOiHfEMcRnw8AYAT4c+/WnldQCyRk23lX07YTBIAOIBaHJnLGSAtGfbWT4TNfjtLSLB7xobV1ubJ9sXOvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294433; c=relaxed/simple;
	bh=4tg7Tw9YFwtuTaNFXfaHJYmypQcA98LC9ovUCSBOML8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDIrAHJP41Bs0BGv3hKyarlYWfG7MkfqOXTGXpYAgn/XefmRhTtwdXRoBfnML7R4wXwojqB7ChXfO1rcYUE5YflxVubIN4rN8ICtQbraq2v9li1YE0RSBGlK+16HkuQ8N9dzxFBSlw/LkRjiKPhy6btfS8GOMUngFonfqXvMC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mFCWzBiP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mFCWzBiP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4728c12ba97so3792110f8f.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784294430; x=1784899230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hw/Yv8W0bG7wwTURy/Xky2RJZ2FwJjbfAnGBUOVKvuM=;
        b=mFCWzBiPH+/ufK2FUBdbJZ/hY2APpxUtA2lKFZjSYXWH3HI+30svivl/52lqjcNpxT
         27N/GuCIQd2RiQ+KwuU1B2hWzIYq9auWvAbAyqvGs2zznOjFgThSuz6f4eJMGigCCEeG
         lc1xIMff5LWPmmzOeSU7FiBP4kTJZMMMcfsX44WgLvIhKWCbyp3zMxgwop11Fs50Ra3o
         Rz2W6kuCNnH+u+zYxXX64Gynwf/eAn3JzUbs6QB7kfEhdxGEXnOUjrYSrBWOFgX9GC6f
         qq5cKIq6lwfufl35Xv9inRM9IqCpoH1QbKSMHmzN/ef+0JzaeMUWIjEd9ZBzx+iToyFV
         bL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294430; x=1784899230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hw/Yv8W0bG7wwTURy/Xky2RJZ2FwJjbfAnGBUOVKvuM=;
        b=gBoSmXHRgAriF3dxbM7fOIqmVoosRbLX5F8vRryQ1Vn/8Nu0+9aMNVis9b1DYyXF+7
         oEupiL9cSgIv3ezBRczGfOrA+CFGHbc1Qc5uI5GDi9t/UY8ASBNpYa+9d7MeRSlftwjC
         /QoHNKZEQMjmOcgdgZdQVGCi3CYFTKPjQZhlAJtMoA4XdGhPF/F7KIH7ogfB4z6CBRKM
         sOn6jsZJtgCQvztn10VhiV5KGtD6srf91ncYf5DNvSWXyDTNbKXV1vqV2zZLA78gt76k
         pRcz+oGqfEgz+PX+VrtB8bCSOHPGt3CwpBho25ZQA9JAZH26TxnNbN+t67uMfYAnt1CK
         qpaw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7FWGUupqjoffFUctOrsI4xkKgEoFf2CBTue9fWTe/YLCvOjYINjYwG8j9YbvwhRsuD3OITgeif1CV@vger.kernel.org
X-Gm-Message-State: AOJu0YwymZbUSgQKFBm084dTgnmXokIp7w7YExrFfzhj+Ms51/94tkc7
	pXsBgcTL1M7K3NZx2T5ZroSA+kswJfG0048VpYJ6kG0LvhoDs7kVe04rJZul/+3h0lL0BYlIuF/
	YrCLzbNa14Q==
X-Gm-Gg: AfdE7cm9HU6/VgT/F7ChXT6QeRihXEHtVCxK61eIA9FvneEQtACFzfaWOLvCnQW6Fss
	tCkdtQcdysP7EVHUvkzf+vcaPu7F6Icj4BNP2DzmVkQCBJskdJnGAmRpWS5niJS8rfXCxGWMooB
	uYDTW7QiP6H7zM/7hbAa/Xx1ONZ3AET5r3CTH44hdAWgdNycvvuB7QkK0bEKyBBL37tpoo/fE0Y
	Lc165xbQLxoPPUhY4DbOrSXPslDN6mc5ziLc4NeoOAyKgEUzdE8k7+Ms/GU6wCCmKSIk6j3aChb
	TOL+cRP6Kay6UCg7ccNiCwXM85HJL6GZ7C2OjMd1DjCrFbGgEuBQUIoTTvFnaOu0gGbIswWZ9iJ
	gl8wuqDI06Kik89+icIxbC4dTYxuA7InKdsRGs0XEaOli2ZyyzZ64+7KHpi14ZW6G/Xbib/qlzq
	+GC0qP/mAlmh27z2w=
X-Received: by 2002:a05:600c:5943:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-4954a514619mr20541645e9.32.1784294430288;
        Fri, 17 Jul 2026 06:20:30 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954ba2abd0sm28220295e9.15.2026.07.17.06.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:20:30 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Jul 2026 15:19:34 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine:
 Use common pinctrl
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-kodiak-cam-mclk-v2-3-04451f1374bd@fairphone.com>
References: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
In-Reply-To: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784294383; l=1451;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4tg7Tw9YFwtuTaNFXfaHJYmypQcA98LC9ovUCSBOML8=;
 b=jn/P0MbHPLHJEwkXoOznJmDcj62GIY+xc3oyTXDgT6bxcM6l0FG4aHB4MlI4ZJHIuVm01DwUG
 UricQafvBmjDhgy2FIMwjTYFK54nEngYu9Pm3CFo6fsT1tqQfMTaNZG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since there's already a define for gpio67 (mclk3) in kodiak.dtsi, use
that instead of defining an extra pinctrl state. Also rename the suspend
state to match naming.

No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso     | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
index b9e4a5214f70..aceafea45343 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
@@ -51,8 +51,8 @@ camera@1a {
 
 		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default", "suspend";
-		pinctrl-0 = <&cam2_default>;
-		pinctrl-1 = <&cam2_suspend>;
+		pinctrl-0 = <&cam_mclk3_default>;
+		pinctrl-1 = <&cam_mclk3_suspend>;
 
 		clocks = <&camcc CAM_CC_MCLK3_CLK>;
 		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
@@ -73,14 +73,7 @@ imx577_ep: endpoint {
 };
 
 &tlmm {
-	cam2_default: cam2-default-state {
-		pins = "gpio67";
-		function = "cam_mclk";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	cam2_suspend: cam2-suspend-state {
+	cam_mclk3_suspend: cam-mclk3-suspend-state {
 		pins = "gpio67";
 		function = "cam_mclk";
 		drive-strength = <2>;

-- 
2.55.0

