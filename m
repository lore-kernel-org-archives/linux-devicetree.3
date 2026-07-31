Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8903E3F8238
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498086; cv=none; b=ii6m8qySdC9US9q7UXFrmFW59vSVCT6jYXxmX4pceoLLYX1XBhRSO/uZ0MduJcbP0+tR+5PyWOWGd1QwXmHlI3v8CJAtqpt6KagQcEzUJ5rI8NuA3g4V6JA+1MLQV/LRpVnqoqg4NlCJthhY0LrdVE0COqGPS+uqgdjYybDhepo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498086; c=relaxed/simple;
	bh=Mrx+PulrSFoIzDST/DeOmn3WXMolDYXYxy76YuvTzYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IH/reRtOF8v8OjhCobB5B8DvNMONvN1wmkaVse1hoIiB6BGjxIOwA7oBNkLMWDPmAZ/s1Tx/JmukaZ05+p/PAFvZx+khpMex20iraHiVISScpW+pDxva89vEIYIL5Pa/xGgGgYXMd+Ffq1a2M9BAvKm35rNBhneJpSxrMnRgu4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHEy+33L; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHEy+33L"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so672654f8f.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498080; x=1786102880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WacSEcT5W9bhgw97kGJ5zu1q6fpoaqDrjKCe+vlhLqE=;
        b=hHEy+33LHSJUmK1grCgtLjbEFRr8EyihpVVk5Pudx7i/WcrLQtPceik/Y4zIdPdy7m
         +SFBqqAo5HxGFPWyCt0eMzZYug6I9cNpyi6bk+tJYATEMkyEzrlYND4PCKV8+Pql2deN
         avuEVWDCnnTqAuqbsBtIQzzp3DR8+gCc/RBPqiyDC4ApEOFj3lnjSPp584dmoN00h8pM
         gwQgUX4sNxGIrKS+tCJYebyhwYuh7NeuCZZ/Jz58qvTgfs+b4tchru1AChgH0LG9/nHi
         gYWS7tqXkYYWTamY/iGaf2tXLGV0NDksLhYguDvB+Wuohrx5p9ZXQcpM+RkqEjHr8mNM
         keyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498080; x=1786102880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WacSEcT5W9bhgw97kGJ5zu1q6fpoaqDrjKCe+vlhLqE=;
        b=mnsziEnwyzqYnIhT7KFLIo6pax52lsg99Pb8G9lcuxBUjqRk+bFMIV8H3Otzd4+kd5
         ZTwduVo+JBq0IdCSTf6xx1bLsCf8hEwFMTJbk9hWbNyw1wp8nMgx9Fhr9ygP3p5fmr3T
         VaN67XLO3t7X5jBeNuQx8EGDwVRSvEW5G7YzmRGP/0uCwQie2fEZ0IhLd3T1bh3glGBS
         xGAlkVfL2cNqyEc9VV9mkowGSKRsXlZu//OeRi8D4eqHZqqr56ZFSyuITxoEsy89hbAZ
         O1nAcOcyz4ctck/9Akxq9q1L11l6R8ECEyrZJ2+z7fM5Iiyl4yVWlRuW2f4Yc+6uqXWL
         TqoQ==
X-Gm-Message-State: AOJu0YzSREvsCPUQBEngMInYLQ0j78tTOAPXKqct6O8hvRvATUMnYnXx
	ELIO7hLY+5z6wcDUf/5NENDtja67fy0kH62T4u/sgAN0oghxXeSahPKy
X-Gm-Gg: AR+sD10YXei6ixgGkVX/G6eg816kkHc9ZHDpE7QhVtSzrC+NYQr9fzetl93Fxx8koT5
	mJLEKSVs9G88mSq8MdVjoA8bfZ9Qgd9TavhOJRVmATe3e+jBTM3ywkLPvnT3mJfEv/mRFo2egFH
	r7BramKD46H3u66rcrQB/Zgt5QWvxSwSQ4ENDa/NiP8P91GMDbNelSDDpUaEPxLCH82IjhQRBNl
	IMuv0bmnJDXiNMNyrgMTE+BzWLRuXxuiAp5VWJ48QeTSmrDBbE7HMoBQmuTC90b8x+9ukM7vVtA
	/8R3x6ecpAo9o1fAKXDGEvs+iO51Hjhd0H2ZlrLtELIJHDJM5ZBh1sgwqOGr7v/hUy0Uau2Ryh/
	w21fgT28fTbhQGlslq1/xfCrIK2d+Wd5FBL62Kd51MiwjynvZ2ZzPLY3mAi+seeZGK8hiqzv8vj
	xkr3Pz/Etf1bybzxiSYWNjK1amGDmfeRR4qsi2JOUHmLJkxGmUzU//qTXhUuUjFoLHvIA5aab+E
	bMuNuttog==
X-Received: by 2002:a05:6000:40cf:b0:47f:93b9:b76c with SMTP id ffacd0b85a97d-47fd2b6f8c3mr3877593f8f.56.1785498080557;
        Fri, 31 Jul 2026 04:41:20 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/10] ARM: tegra: tf701t: Configure CPU DFLL clock node
Date: Fri, 31 Jul 2026 14:40:57 +0300
Message-ID: <20260731114106.169398-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DFLL for ASUS TF701T since it is now supported by Tegra114.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index f02e2cf65fe82..5358cdb6efc10 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1621,6 +1621,14 @@ i2s@70080600 {
 		};
 	};
 
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		nvidia,sample-rate = <11500>;
+		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&vdd_cpu>;
+	};
+
 	brcm_wifi_pwrseq: pwrseq-wifi {
 		compatible = "mmc-pwrseq-simple";
 
-- 
2.53.0

