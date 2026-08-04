Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68FD496914
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 19:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871749; cv=none; b=eYrIllhRMr5zw1VHTnEp9hlJMDikw2iqIqZiqlrPVYBkmLa0zFe7q0X4eIzFWpaY6g7FFHw5+oDrkim280l7M3e/QVKyB+e/QjCEzZ48vVOHrVWa49IzIKIVtvbsZRUyNEJfP3WMompKgmuxVXLBZjk8qDSWt4NMt+l0C88FuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871749; c=relaxed/simple;
	bh=U2YoNQx/hGloZRC8McPJss1WdTnU2vgI7Fy7zmdhFok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzIQMv2dMpt2dmpWyUJ67ca4hY6ah+PBtufVdH5Vbwi4PJy5/6s9z2PYKg/pajhMknmTtWR2Ctts6sEIHHKiD3EtQWZDuihs72UXdX+2cMAROvU08mdxSm/wPgD2vizf6QYDYaMmydSLsO+N06oMgQPl+gj2q8QEKwTW2wPfr2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itB1cmNa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itB1cmNa"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so1226425e9.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785871743; x=1786476543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=itB1cmNak3ayfAEubxJt8+o0mzp2yW8ZrJPi1XzprmpvZL85zQDYXOx+O4/CWrsf+r
         /62MJjT+FPcRWIjiRXJcnPoqAxr8FELx05VzepAbL+WiUfYkLcRzTN7D1IebQ98Ew+Kd
         exhy6rD0cAtzqILnMhCjrdP+C/5Qwdv0AuUUUy3jDi3PqJpKhUxKLSdOEW2dNyx8x216
         n+/KU2sb21fCGKBrBNKTubVtwst+KML9ZAmthljTgX2ftHLv794vEeNwVH4xA7rM3vcK
         uiOaPRx4wenaA95EnmIblzPKQaDfKG+BZSUSDpeut7qF4PCfzULanMbQrH+af5/21K1e
         6/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785871743; x=1786476543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/Qd/2tRCLWffwMQFEM05180CiTbv4f9HSRyN2+W50k=;
        b=ZKoSLlgAiaNrmw4VNCg36y35WJD15ad6xR0Dr4QSj9WO5hWbgxRswQLNCKRCHQqMft
         9KpeBZkDrMJS3Wn5IRuLbTeWttgChkrz3zznd06I8xf5HLA4ua22itgPxZliS4W6HSYI
         Qu1vvkrFXSbvFLY2MyLPyZNFYypgys+cr0mFt0OpAyRYD8JNkVVWNmQ+tpO6fA0zDyXp
         PX1NGRrAeNnj2Jxqvm3BsngkKSd8mQgeLHBXQJmtxgodN4Gg2qPNGKfF/i3PfFMiAo9e
         /qjiJ2K5Wa6zDpuRFGX8Ou8/Ubo2qjiIt3o0Mm37YTIKV3wJmC6hCtmpkERbqtPx0l8y
         0X/w==
X-Forwarded-Encrypted: i=1; AHgh+RoruwI1tMxvwHY64RZFLezMSxESrQGJY4RVsbw60Ilke4lbWZa04sTqjJBaZoVWAWS+NY4JebIN2pJu@vger.kernel.org
X-Gm-Message-State: AOJu0YzLckpnknP9HC24CLrmYIOi2gIfAc7m83ffMXfKKeExt3qvpXKY
	ygZOsm3ZQXyyYLNwnNCYwb4LTx5FdzbWDJCzhmWjPBe7jVh8XbTMTdrl
X-Gm-Gg: AR+sD11PdPzDfx0DC8T8uwB6w+9/T6LyWUZiQoWZksxGtVAerX/YQqd8iaZlOdOtZBl
	1vJD/0KRMEiZ9I8GyKJNh8cKsa5ekVYaSEWOeT85FCPE5AsZgDnK8S8nPlbzO4pc8CuNJOWebCX
	Ww5MZXj35kMTj0wOL4W0Wf+ebIkDNqjizy24DVzYru1Lwc9NLHqcaFLrssDt/722wU6cdxoSKTL
	LWRRchF8TvHJbXDsrNvyUMHLlw6aqZMQQ+kNaxCH8JFpVeQEn8P92v6RyYwt7jDBIrHPBcLiMLp
	lN4d7cQFu49kaoFD/ivNXAogigicAmLL1+dnBf93LyVrKxBFFR2I4gUSIWq+5RyXxk7TMMjaZ4G
	o92np3lznQMI7kSpV/XFzWYwuOG5XuTRUffpb72ZfnlmpyoVkGqJnP8e0YmvKdUk5gzP6xlVIok
	/PuOfBu+cBHUuGF2972wpIh1Q+BsVKp/PFxNuUcW44Pt8dsQEqTFtNdWm/497FdLADhh3lVF/9s
	TgzScFB3WND6q6zLUALM2w=
X-Received: by 2002:a05:600c:1d1f:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-4994e71d2acmr7600625e9.5.1785871742982;
        Tue, 04 Aug 2026 12:29:02 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:68f0:30cb:8ca1:f965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf820sm8248745e9.0.2026.08.04.12.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:29:02 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jorge.marques@analog.com,
	antoniu.miclaus@analog.com,
	mazziesaccount@gmail.com,
	jishnu.prakash@oss.qualcomm.com,
	duje@dujemihanovic.xyz,
	wens@kernel.org,
	sakari.ailus@linux.intel.com,
	linusw@kernel.org,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 2/3] dt-bindings: iio: adc: ti,ads1100: add support for ADS1110
Date: Tue,  4 Aug 2026 21:28:39 +0200
Message-ID: <20260804192840.29121-3-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
References: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register layouts are the same as for ADS1100 but ADS1110 have different
data rates and have internal voltage reference that is always 2.048V.
Also correct order of ads so they will be sorted alphabetically.

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/iio/adc/ti,ads1100.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
index 970ccab15e1e..28c5e2dd0ad6 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,ads1100.yaml
@@ -4,19 +4,23 @@
 $id: http://devicetree.org/schemas/iio/adc/ti,ads1100.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI ADS1100/ADS1000 single channel I2C analog to digital converter
+title: TI ADS1100 and similar single channel I2C Analog to Digital Converters
 
 maintainers:
   - Mike Looijmans <mike.looijmans@topic.nl>
 
 description: |
-  Datasheet at: https://www.ti.com/lit/gpn/ads1100
+  Datasheets:
+    - https://www.ti.com/lit/gpn/ads1000
+    - https://www.ti.com/lit/gpn/ads1100
+    - https://www.ti.com/lit/gpn/ads1110
 
 properties:
   compatible:
     enum:
-      - ti,ads1100
       - ti,ads1000
+      - ti,ads1100
+      - ti,ads1110
 
   reg:
     maxItems: 1
-- 
2.47.3

