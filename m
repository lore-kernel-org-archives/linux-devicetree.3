Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F543E92BA
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706309; cv=none; b=UdyA4eF18Cz6UUNWNEBL7glvdPBdvVoeEucG4WdQnApdTNTBS38k48x21nkrfYRPmMpdt1h0HTqHW2qVzqomkNAvdkps2xXuytLse/gIObS5XddhNf2UN5W8q+RXKX6roxrTNSmk6DqFUyCPt4cwLUS3HoenXi3D3bexlOfeCS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706309; c=relaxed/simple;
	bh=QtSgviyssTBIh+gpFF5oWYlI+wnUX6VDGWmwQj4nPj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMmjYppg64KmFilnuQHro8/qqJwMNXTV9W2jGSuwQ2pZPlCMEYPsw0d1NkIgKWbRPNCGd4Zd7J6TvFBdRrkMMQ8SzhaAVFXZE2amfie/axpGv5EGU/FYtW9z3LDwHyUIBHBtZpKZQTpeUW3pPC8z/xZbF0ElEyjEuzNCdEM/iVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/fU6hsW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/fU6hsW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36ad15213fbso525617a91.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706307; x=1780311107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gK5p5D62bxTBsAn+SEu49ocLQ2IY7s+ZtWdqBWFj84c=;
        b=m/fU6hsWYm8YZJ38EllPAKS6N9wrzCKLL9FncPvNMDRUTA5cL3mz3BLwgI6bnjUJi/
         De5Jj2P4ERqTBOjOUG9NzTnlfgkD3oWLDEeGh7dFW+dxY+w8fEWcTytqPPuIl2kw+Ff4
         MbFjzK2oyNYlakFJo5yOtgmdMkzzHai6vTBtHEo6eP14Tcz1cENVt+1FI3K2vos/WdU/
         VAoSNfQbV9P+kqxKefpmS7bdaD+mtxxx8AFt36ipjXP13Bse7jJ6e/BJ95CAIZ8kyVRf
         Jd82+CUiCqCvPYpzMQbOPWh4N2zlEVkyh1eQI3mQZwv3mWCGalC5B4aOWew5O53P+re6
         B/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706307; x=1780311107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gK5p5D62bxTBsAn+SEu49ocLQ2IY7s+ZtWdqBWFj84c=;
        b=tIHXF+SIpENOidkT9WyC1OmEy8pw2oCuTOWpLCTnd1FpHmInwlhtLWglFR8e+cJj5n
         kS0ATvzk9qawVix5CCkPFYsoAxueGTTbrrsjP5+bpuVy5yIcMzUGXRDmy9NxHSy4MM3d
         HDSVS5rlCaSjWT6qivByT+SYUX5Np0FECX7e7QtX8Zr1E5RGP9kWBlIk/rIOYo7TXYWU
         pkH7IB2jZtoGGVNGmY9u+/sMgMjJUvMUajseZoK4dgmDKVcOyoVwzCILW5LUhx5v4LAt
         kbb58x7xcqBIMyZb0mJrFo7k59otKfU6r0TWndfDGD178rAz3fFpfc6Aj/rDk4nssG2B
         1iqA==
X-Forwarded-Encrypted: i=1; AFNElJ/yOtP+wZTtIymesxPvcprOHl8ZAaLmlH/oM1MuZeLejKDAbmhrBG49X9lOKJ5Ch1lYWkaKzdD20DLU@vger.kernel.org
X-Gm-Message-State: AOJu0YznrfG/VOWMKWXVPj5mYVxbpOvpokFEZaXZC05lvsupZ2Tr3CMU
	GPo6Olsv38w9zUbo5Jn+SgWA/fy2mDJ0ZOL88sc8T72j/BsM9ZWauKjl
X-Gm-Gg: Acq92OFdNguteB0zuCj6MR9JTXFoQx6eUZSRtFzRKHQ4G5/OPwHAsxUGCcjChTQd/HM
	b69DC9iZzS1kuh4lA7o2u7V4DBFWSQCT2WulNnC3Jf6SRDxGD03mU0CwGNB/4tUNUDfTATu9ntJ
	B8MpCf7LFk6v+otvZI/khqlrEeK/3sDFl+s+5K9xO9JuqjC8GGf8kMFWRV6Ylvb9gy82GRty9xF
	tabvu+528mGhMvNvOL5tbAe4k7aYlWMEOh0rv7ORx8FHHSjrekkyfXbIbUxoBniXXxi0tIXmEYs
	4dNFSSUIVD2Fh96vBhlZly4C+BfjwJ+u6bP7KiDOzssVOWKZ4USwmU2P/9i3pwu5RwkhBba1MIz
	5quaolkIskAka9vG1u2FWp1uGfZeny4/yzJEUCMv2xP7oqolbf8SfEqig19wiJORXMweMEOes5D
	6pziqDGH8vZsq4EjsgHKFs2p8//jG7Ovo6hD6Jp55RurPXaRschlzuPpLgVnaUGrK8z2+LcE5WZ
	GtlSQ1nTIo2FFy7P0/z3xZwVSYVEc8xlIGpRVV4kjy/G1d4e3QQC7Fyd+uUSg8=
X-Received: by 2002:a17:90b:4d0f:b0:36a:6a4c:17dd with SMTP id 98e67ed59e1d1-36a6a4c19a2mr14431253a91.27.1779706306855;
        Mon, 25 May 2026 03:51:46 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:51:45 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v10 02/11] dt-bindings: iio: adc: hx711: add VSUP supply property
Date: Mon, 25 May 2026 16:21:18 +0530
Message-ID: <20260525105127.180156-3-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525105127.180156-1-piyushpatle228@gmail.com>
References: <20260525105127.180156-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional VSUP supply used by the HX711 on-chip regulator.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/iio/adc/avia-hx711.yaml     | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 1ea60dff98d5..0baf620e9057 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -33,6 +33,19 @@ properties:
     description:
       Analog supply voltage (AVDD).
 
+  vsup-supply:
+    description:
+      Supply voltage for the on-chip regulator (VSUP).
+
+  dvdd-supply:
+    description:
+      Digital supply voltage (DVDD). On the HX711, DVDD is a
+      board-supplied digital rail; it was missing from the original
+      binding. On the HX710B, DVDD must be greater than or equal to
+      AVDD; when DVDD is a battery rail and AVDD is a regulated supply,
+      one channel monitors the DVDD-AVDD difference for battery level
+      detection.
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
-- 
2.43.0

