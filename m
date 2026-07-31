Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629873FC5C3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498088; cv=none; b=WZhS19IH6fpOZnqNnxF5MsxvSSE+xzWCc6IkupgnMLjO2TxV2se/iM1uJl2yFOYXqeiw7nwhwg72f7iwvedUbm1Ay9DjRd3Xudm7VNHgwG4kIYi8KxNDLgdWyJBwFb/KlTtAYxCp7Ti2bu+XoZ9WyRE5ITChDpcUh7Ek9E93Gp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498088; c=relaxed/simple;
	bh=SdPia3Wk/M4L3/GoETxNmypkYl87Us1TqT7WMu6QyRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnQLpgO9frF46Wbaonkb0hLWIzlJFGBNZ+6PBMRG1nRgUEztwlXHJXwhEP16XH48NKjEfoKp0iap0olg7nvGRE+vnL9XKHAUG/MNUSj/GJGgTjTf454T02MrrrwUr2b2c5gZxgI+F30pdruaUMfn2PGOm9EjadRoTvXnzMC4lsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/d2MIyj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/d2MIyj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4758bd3731bso879218f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498082; x=1786102882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJlaZVqU9d/kVsfcIjb0Td1tgBgRm/rDWbTGe5IqEMU=;
        b=a/d2MIyj2uwAgaWB48EQ1qR/6eMPuJ2hx6FUMOJL+ahahPAD8OFhnejclI3ZGb5z1f
         lwptcFn+i5Os1Xx1D+G5HvrRMc6mZhAvLSnQ+RubUNl4LElN+8fjl3Nfy7Duo+LUw/pV
         Zuf/XwrToc0JavJsSPDqPlP/BwXTSu1ctR6we7F0tVg3V/3TVFNP3gyw69Vh7WIBETG8
         MMymXRS+wUbAAWXHV1ZUOGIHPaNNZKdQbwfJgqfvgAcNnWZ3EAu9WxQ9DwtAspJ7qvkD
         xNg1OIuXEKu8UIvdv4FaHej4atxuAPRshFDve1T/NsWEzG5JrymvUACwmk25QEzeyYVh
         z6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498082; x=1786102882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJlaZVqU9d/kVsfcIjb0Td1tgBgRm/rDWbTGe5IqEMU=;
        b=RolL0LF43YJK4W+cS+MY9mpWncC019AFU/ExpmKU44uDxK4SLsHvXeacXJj25b7zcN
         ifSC1j2TGKubC8ieGtU8one0aZFRwlDhjP46uSey4DUP9vsCPR90UC0Qi46wWYVhKR9D
         MOiaePmjCa2nBCgCwIVOVnUgenHmQey1yaklYoUJIxRfMWZ3jnoObxAplAlPZ5Kla/jL
         0jqud9Dz9xr5gZtWdgRDhX8XwYw2p63XzA9d18GgJrU4cJs5HKDsxLq1u/XC5i+O/Pu4
         v4sjo92DsZ9+gamUT1wWiC2fH9YmxOZwzJndxT3IMH4BOmKJgv9wgcgvZ3Vo51icQChB
         oh2A==
X-Gm-Message-State: AOJu0Ywd2S3Z8fK21U2WH1SKDjoxLmWjQPf9O7egvHQ9R88aM3weKIh/
	f8EC2f1tInhYEd5nzZ+qYeyGaY+GsKn2Vxbwa6iK4W7zfO1/rdUriJjz
X-Gm-Gg: AR+sD127k2PHUdDJHjdC8uwSLNdcd9rpq8+87Rq37tv1mqMQN0utXByJFWzb69T9oR5
	bj8BpCfuyRYeFxbno/vuDCm8T+FEBNTTRK/bs2t/LTyvsGK96hMmSSM+qRw0lS7nOok2YeUl8gu
	TcI6moEqkQm5xb2Rx+azql43OnVAXkTguGBlql4DEShc7koCFqJvUU0skIg3IBDnbd1zb+4qjzF
	5VpA+X4Q3O7Iuo+LqUiv3PQzEmSHocPEa/EJQR2tmeUXTSXE90mYlS4ZgwKHSadIfcVgM+EqoGJ
	Qu+fH49Vl5zYM5IZ8jJaEjqgsaAxti0H8NTISYcjKcfStCf1UYHyLa36fiUVmF4gOCHuDFKm34e
	bbBwFNo/75a1Ve90Qu5Co1iY/oM4sB+sZC/Q7DWgTnAS3Dmhqal4QjOgOuS+OFB+0t8wdrWLerZ
	/c+N/XHWwF4rLYU7TSFpks7CELhDlgvQvGa/5r5/31eCCDdPyS040oer09D71WudV3SWQFje/rM
	+7E8KKRwg==
X-Received: by 2002:a05:6000:40cf:b0:47f:8603:a879 with SMTP id ffacd0b85a97d-47fd338ccf4mr3178102f8f.11.1785498082238;
        Fri, 31 Jul 2026 04:41:22 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:21 -0700 (PDT)
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
Subject: [PATCH v3 02/10] ARM: tegra: tf701t: Add core-supply to PMC node
Date: Fri, 31 Jul 2026 14:40:58 +0300
Message-ID: <20260731114106.169398-3-clamor95@gmail.com>
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

Add required core supply to Tegra PMC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 5358cdb6efc10..55e9256e80f33 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1599,6 +1599,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <2000>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 
 		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC  */
 		i2c-thermtrip {
-- 
2.53.0

