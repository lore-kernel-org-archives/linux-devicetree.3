Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0DE2F1FC7
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128761; cv=none; b=kWKwRcksUtiPiVO1RZVcq5YzWzN3jPTgZkr5HXQQPxOqqfkaMWlPzxWzvK/DaS7X91XxXw7qgTUZaAA1rVJWofOs3dvTvQC+zMFTySI0Uvc+OnK5co2tcdxLhkY+R70H5isM7z9ETXm3GcAUaVOTfZmWmhpzolgqsSt6YbAJHzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128761; c=relaxed/simple;
	bh=hJce8KkqJxPTE3J7Vzepo/98v8LFPJybkOZQxttxP38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gwq4HFgNtvwxzGJpz2s9AO57LPpyBkYIdPPUMXxUt3AvBGK8sBHuIUelUAwuN1wx48m+VYtLGgb8jkfFY+Mz8l5H35JtVfKwFe85XJgP0j8w046jYHNyGrcgcJcxgoLMoCP3l2yaSGDATvJqMhCji7sbJYFnZUZ7w9hkOQzta5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+8PdtuU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+8PdtuU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso9379315e9.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128747; x=1791733547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DzRrET+2CK6J9+3R0nvrRXkHdDyhShxAssXo4w7Y3Wk=;
        b=R+8PdtuU4eRegHubGNz3nu6vE9W54fpV+9otvoIpf3QhScV51kaLZpH5Yrm/zjiDzB
         2Wq3VqDsZG4GZdE2R8OK5XdHsHvnJ8EMuDz9BlHaVIkfE3COJ3N6hxpx1hQeNc2qr3HR
         XDFOfxzY89sZSazW+l3gZoXzrSMGDPhjIU5EfTKoHaZc/rHIXGEBJ6IrGZ514QBxMYve
         WKrnY8+eivjV+oJQlBbhuZMdgTQQjeWf43nHcYkamNOlhyHD7T7F7L6Xa6CB74UiwKqW
         c1ZHYTQzuvOemdZnk2pzZmXPBbDPu6JkGqFzt3U4bMMH0s6iv5ZoDDheeKG3X9+pYzm3
         sJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128747; x=1791733547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DzRrET+2CK6J9+3R0nvrRXkHdDyhShxAssXo4w7Y3Wk=;
        b=hi01DiBDz2hNsO48WRqtvrPJn5TjHhrHbl17wGliES9dIl/19wjjz/HXg9EcJx2/dA
         pKFoKAphEF6ydrarHQW0w22o2ecOlr9zIC55QGCdHmbM6hulank3/8PfeaKIz1G/ETni
         vX3XKM31rWqA4fvXn5tu4B7X+PYOm6y0vOV0LGlU6kwNFqASxv5WjtoS4VuHI01zU0JQ
         LH1226hgOwDSW84gQV2o0InTl0dpAmv3OIvjH8sfHkgHt9i4voQuqSp1k5Kyx/UxGvD+
         5BZVve0x0+Qk+yiQnC9CHaaxDCeQHbiSYErHpaWVO/RScocQCimdQgq6a0lRqImakQSD
         Yj2w==
X-Gm-Message-State: AFuF++ntPzYhEuSWS7a3/GOajJvlaD0/nnFKYMmvqwKSCnzfkSsFzbAF
	u4z8J3zOPxOnjTax5PbMg0o34WSa+pTIdnoZcNef+/vpH4zqZzn7keRV
X-Gm-Gg: AYBFou18MpPEjcJn5MQCydS1T/e7b4kuClvr4kJ3nGNaT6gbwb2cfEMHGwXAikfjZhl
	QAceF7ymmCRXzBEsbM9xsaTUvulTg0W0QQHAXEOXK8OefhrQ78bt8cnFmg/7LM640KcxPA16F0h
	d6wapdEgQdvNejZXeBoaFnvI5LXXMlgSY+kgShlIOJfvW6fllrNbRYBxWALqzaDqtoEhwWXA0bX
	NR8gugZi8jl7kvS3CF7mT50hP+7fbgn921H9RAaCT+3ByOmYVBuAprDjMzX1pG33OT69e2CyNZT
	GXxvOtch7alsdeXNd7I2pia+DTII8o9YKF7qFxIKisggeyjt9IXBPZcZ0HxRHN7HsWLMi+Kf1EX
	kUDzBmcX/iAOLhUDJUHzARTYlx3KubdKomeD7+NdlfhJK/es6/QRseC7HbFsuGxVduty48vhlDB
	iemAzfDSWdxItzZD2EhKqvBnSz6XJyqQ2M3pt+sgd59psc5doWuoYDooK3XN5C9L1EbC6iz5lGh
	N62DAs///jvxteUy6E=
X-Received: by 2002:a05:600c:a011:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-4a0275107e2mr139184455e9.1.1791128747297;
        Sun, 04 Oct 2026 08:45:47 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] ARM: tegra: lg-x3: Update USB configuration
Date: Sun,  4 Oct 2026 18:44:55 +0300
Message-ID: <20261004154456.145362-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update USB controller configuration and link it to MUIC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 2dbef0185a0b8..e334473b7635a 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1215,6 +1215,11 @@ muic_to_charger: endpoint@0 {
 					reg = <0>;
 					remote-endpoint = <&charger_input>;
 				};
+
+				muic_to_usb: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&usb_input>;
+				};
 			};
 		};
 
@@ -1788,7 +1793,19 @@ usb@7d000000 {
 		compatible = "nvidia,tegra30-udc";
 		status = "okay";
 		dr_mode = "otg";
-		extcon = <&max14526>, <&max14526>;
+
+		hnp-disable;
+		srp-disable;
+		adp-disable;
+
+		usb-role-switch;
+		extcon = <&max14526>, <&max14526>; /* vbus, id */
+
+		port {
+			usb_input: endpoint {
+				remote-endpoint = <&muic_to_usb>;
+			};
+		};
 	};
 
 	usb-phy@7d000000 {
-- 
2.53.0

