Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189074499B1
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045787; cv=none; b=SMQ1HUZI6VHZFD8a64odlxwyZ/KIYOEXhHmiNlTuqatKj2gvJhKPgTex3mDk/B0P+nV7tWT6eCnfoILjuIVVvu9ezK+aQJtQJD1Z1rmGfL1Fa1BLCwE8+8P5fKpm8wCSe8468e+hmvQMIL1sRXyrTidzrX3uVJfv0R2Q0U9J7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045787; c=relaxed/simple;
	bh=RkuPU+szxSRPLV8KTuj8qDOUbDRUGKXjs8KU3FAuvSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYT+/4esobbtMNJgDo9t7O8SvvXHH31AiviSWQhNjAeU/HZZexSJ78AkxS5e8e+GXYNrnal4xd/WBqtMR0WZXJvct6aK/kN6SnAX+RbNhRLlsS9EA/WsmXrEMnckxqjYGWnVAA6rNANfZhP2AxoxBmici9oi1DGNnfZsIt6r3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/6OENRl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/6OENRl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cca0c5799eso40830905ad.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045785; x=1787650585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/6jA0iwEsO1NI5+qHVdBrDXRWsEHwRKhdyQ9tPIjyM=;
        b=p/6OENRl3NhDtFQu6fszW6tgv4/U7bXL0Cv+4h0hMgjNlCWZtDxhoKfXiI0U9+Hj/k
         c3p0u0+mAykZ/9RhFCyOh67cnPuiwzpZ3CXpwziwnfMD6k3kldAdqmsOfdy5qOlHzWbJ
         QOqUDZ4aAzt+a4Tb8ZXd4OjViUUnjP0FAOwZ2FYKrpd9gnsJb1bGwuMrh/d1GFffp24g
         EieGpYoQJIf5N1WBdkh9McCga1UN7Lp3PDEJIeooTaV+FRYi2b2ESL8kj7zAl/DtF+z7
         mKjsZTvOd0dTDJVVU44rMkRoQrGiyKm/XxShNz54pamwgcaTrz1VXABhPHZ6lp9QcCC0
         WktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045785; x=1787650585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/6jA0iwEsO1NI5+qHVdBrDXRWsEHwRKhdyQ9tPIjyM=;
        b=r3IoX7CPFLntlzzxCn3LNSuQ+CckdnxQ2tZYwguzeAYfZ8Ni0yONUUvHz/txyEY/a3
         ZWeivvFWjGcnSyhGcMtK3oZiTMbwX3n4pUT5onAFC0QraOXDHrLkvk7l712yWzCfiCj6
         9tCbS59eDeW4QJ0037insQIUFByF1euo+DIp81NW7opv6A+znIuZS3wRJrN3HEh/QRYL
         pRId/vf71xNr8WnxqS+hrXflRR9HgNJ3lXsEMQsRYKu1porenx1aUYBuq4LoORNVp0Cu
         Oby3n7xrBhov2V2lAUDf0DO8iDeMp8S77HO3svEnaqJuVorWEFEgkHYO4i/IgsSzm9Dl
         SWdw==
X-Forwarded-Encrypted: i=1; AHgh+RoSYTd/heFK7I+V1tWK06O5HvdvbSi5YJfwY+5GTuY9ISl6pTPwL7QSbLSdCzoxzcoumAbApDmS2ywM@vger.kernel.org
X-Gm-Message-State: AOJu0YxhtI/lRcIdRF8fB0KL9hiihjxj47Bt7aUgLfIEHCLXuaRfHfOd
	M2QcWT2ynByMc+LKiAoVei8hx+iWhd9z5kTFqS1m1MCUjtEnx7beqEy3
X-Gm-Gg: AR+sD10T/LDeRM1r+O+xgWHWaLsSG5r2W9TcuNgkQBXvgPziEY1tB8OrrznYpwotA01
	d9WaogkK4Telwz2NKSfrUC1IYFx5Mat3ttwcWUhJEXFr82FQO9LscG1lLIPBASOyVtJmXOF96Jx
	9EidnvADdvuuqvEKdkJuXzjs6IvkDIdctrlHwPm86mU9x0+GARwPF6Qi2mMjhFY+9BoUflb46VD
	jxYcZbmm3Ioy3fo73xhW8XtXvgqguqYtCdFxIgl6bv/ZAnNZBfT1MHAVxes02DWF2M4BjAkQSmb
	n2J/xj/oO0k+TQ1RhWff8DoDtCTqCamc/1EmmSKic74IwEeWYS4grqu17rOxlBZjTAeT8riRo56
	VUo09DePh1yuasMEEPwbQr0vXGlRNPAVM9ujET/+irPCcux4IDCG9z0dX67KZN8DrGoFK75VzMI
	T7uqTL5Vbo1st94GYHMCjW/qbkJmoIlLEyf7zf3ahR4GgW3Abn7PG0AfxSq+c=
X-Received: by 2002:a17:903:388e:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2d3b0b3788bmr380549035ad.9.1787045785218;
        Tue, 18 Aug 2026 02:36:25 -0700 (PDT)
Received: from thefoxflat ([125.165.209.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb51e0e5sm15171535ad.32.2026.08.18.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:36:24 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v3 1/3] arm64: dts: qcom: Add UART support for Xiaomi Redmi 5A (riva)
Date: Tue, 18 Aug 2026 16:35:47 +0700
Message-ID: <20260818093548.27803-3-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818093548.27803-2-imkyufie@gmail.com>
References: <20260818093548.27803-2-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 4ea4fbdb5..abfaae502 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -13,6 +13,10 @@ / {
 
 	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
 
+	chosen {
+		stdout-path = &blsp1_uart2;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -25,6 +29,10 @@ battery: battery {
 	};
 };
 
+&blsp1_uart2 {
+	status = "okay";
+};
+
 &blsp2_i2c1 {
 	status = "okay";
 
-- 
2.55.0

