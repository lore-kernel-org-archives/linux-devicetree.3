Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50794611C9
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462151; cv=none; b=BdlyJbqyv8sVsHLAcBLVNIUtsLT/6twl9ddRZyWOVk3If3JPrdJpTP9NCpBPRwIQ0y18c/iklefh7sAtUjKu31ZJ4WIrCbOw06MF1/vjI+Pzr/Yj2DzfL+sByONtg6hiV1ggT1k4PPrP4n6kSLmxMD2FiyrAQKhtP+ylAflYodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462151; c=relaxed/simple;
	bh=a2V+I7UeXRDj3lHU2NGFDjdBIe3drc9UQsymhMr1D/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vw2XbHaAr1J0ChkzgQ10GtdcUrDkALPNJmZ7HqrMqo2Wq+qGq3lIj04j0tz3H//sJMOGRPFWR5VW++dv2A3PCnsIhmlktcfJtelpI/XTDvKt53rXXm6qyk4wOWwkFcTr7+2ef15VeDqmPtN3N/+G8IBtM7vSl0jop6QQx47JtJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSeuqfoh; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSeuqfoh"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso5592866b.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462148; x=1790066948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC6zM5DNH7SSIqqjxl1MzTwo2sU+cNMvlHaMx4m2Zy8=;
        b=SSeuqfohJURUKjycap9F5z+aJZ7iCSURdtZibOyhO3hvCOFyz41lmLRYwcTVgacVfC
         LWfwa6nTCLi55gxhj2za/c8l5u7sAb/L124ZcgbJ6+jAVHj1zugpuEtItf8tEzFazhnL
         2LuEaQn3b6q+6szsI8r6B5dokeyKEebIHpzXikm8+p+xnl324MF1Atz/Mv3MECt6pxZd
         +SnA3w7DKZQpXGDp7NEATbcX2S01Si2YUc05+61Uk3yfpYyrkGW9vibGEopCr6Iou2aO
         N3UlDj/4nl1ynntXmx+mXslHCYIyKcm8teM5BuSAMB1pXjK5qJ/9c9KnIu9g1ihIYZWP
         RV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462148; x=1790066948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC6zM5DNH7SSIqqjxl1MzTwo2sU+cNMvlHaMx4m2Zy8=;
        b=HUKNYVcnKLZQKlIE6mzL4o0odtZzAV59rcn6V4Umh02Iday5uVm740Ca6Bf5TnpFZg
         naGv2OYIlBnSY2QZqKB7GlftqoHMP2EyvUb6rlZyJdWbwysgxfwpmIi+S+zKj33Ne70H
         b9hKXyCcZR6GpK5oW+U/uyVgPQpdezYejvq9vqGqHfYd1JjJwFhg6NASH50MlCrhlE/W
         W9E4GSTV6rdd/4vcj3ZTXQrvjksgPDYUe46Go2EKFCFPPST/aW1joC4+50UZXY9+cKVz
         1IvsYIAVgjb6+XpirRxnFJyZVPdzZeHg0GYhlseHk9qWrg/wBMUwAyKe/m7VXMXTo8SU
         lOgg==
X-Forwarded-Encrypted: i=1; AKwUvByO5xuuMKCkGkVVc7lvv9iKl7pUkGsyfg8bTIZaeQhjM60WbEYhS8ErO1/aK64PQChXMkzT8WM53MGX@vger.kernel.org
X-Gm-Message-State: AFuF++nsOF/s6bvIfaxJZraRqKdwOKJZ8++/3EWDfRfHMJ9EwVweP4Wg
	SRmvzWZiwfkTsvFsogFGApGKCD/V5pfS2sBsOY2qrXNsi9GONJGZJdB5
X-Gm-Gg: AYBFou0HZ4wCvgE8YeDLxUlULdCBzzQgU2eXu8enmr9MlW2biMunG1VFb+C1tl9PUZk
	yfOk0gU56CW+uSkRI7roOVZbaZfmXgr0mTvJBzmZojUy/ljZDX7mGVFt0vWjIccog7maPNs4H/y
	I90bl+K+3nTpVzMtGjAfhWGj30674gUzwuhR6wUCRtiVntt5aLFFYHexSvviSCBPlFQTve4USkW
	ELS79gPGvBkus8NmVHGDlOCRdPbPPgP6rss2HZBWxYefHGrIsr7CXjLkvef/RbPPtAY9wxDrco2
	VAqZkdBh0GDfymZEOh3spSUkR9Gyq9o7vx5aF/JdqEjpUuWiFuYfG8TcQTVSpuim7WsyjqcynBQ
	402IZOx4kWAxENXkJn3snuOlkTIs1aRnqU7nqU+6mDsZVHrt0+zBVGCp7sWLL6Mi1P2jB2hK4rS
	Llww0yKPojbAUMwWFw/saIOHS57RVV+5kq//i4/9O7huYK+cDg4fMrAzfgnCXYf7adSZX6PpT2h
	gkIBb5csnev7xTNcWOtotQEQXrOZjk3
X-Received: by 2002:a17:907:d25:b0:c29:56d3:65a with SMTP id a640c23a62f3a-c29d792b30emr12532966b.33.1789462147841;
        Tue, 15 Sep 2026 01:49:07 -0700 (PDT)
Received: from workstation (161-53-210-87.ftth.glasoperator.nl. [87.210.53.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966067101sm552702966b.35.2026.09.15.01.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:49:07 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to device-specific pmic-glink compatible
Date: Tue, 15 Sep 2026 10:49:01 +0200
Message-ID: <20260915084901.56622-4-zstaseg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915084901.56622-1-zstaseg@gmail.com>
References: <20260915084901.56622-1-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
qcom_battmgr can identify the device and apply its taoyao-specific
battery property mapping, required because its firmware shifts
battery property IDs relative to the generic sm7325-pmic-glink
firmware.

Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
index 6f8bc65bb99b..bc4dfa49ef38 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
@@ -72,7 +72,7 @@ key-volume-up {
 	};
 
 	pmic-glink {
-		compatible = "qcom,sm7325-pmic-glink",
+		compatible = "xiaomi,taoyao-pmic-glink",
 			     "qcom,qcm6490-pmic-glink",
 			     "qcom,pmic-glink";
 
-- 
2.53.0

