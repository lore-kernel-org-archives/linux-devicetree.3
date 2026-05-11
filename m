Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD7C3A7F58
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485775; cv=none; b=I65ptnXkM9icOTR2HRHcxP2yPGuCY3bOXoJma5SMghgLzfhVsnxVp0IBgJGC2E7BpAMADtlIQlsHUZYvDdyCYtLxOYJ4Zpy6y/pHX842sxqp0iSch8lE6rLM1j4di7djOwT88BULoU8Q08LiY4EuLQ3VS/Ne6kAJylWf7l2GUv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485775; c=relaxed/simple;
	bh=9AkI0Nz1ZzMhKBtxhwDRab9jEHmljwJvezZnjRbkhVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oi8bN65AwbvoEhDCpsdtb3gtshO/bpCE2ye0J43MZQuyAoFklUq2XmbQ+iUUB9YWl/4adOOmLQQZ7Zj5eb4QBe2eEBVyLbzfOcGyKmQM9oBIcs0jJpd3yOLX8c8/LZoHIS0q8wODdzxWISt2e2cfdo4SQJEE6OHw1LAuc/BiYfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPBeqN2e; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPBeqN2e"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso3916859e87.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485767; x=1779090567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nwdcazcd5nv+n45NTFsXMrutWV/muXgCl4fYEEYQm0=;
        b=lPBeqN2e9ErSrMh8A3cTXPcgf9iBSBAzKCT9Vr2arQCC273vZyXvYZ4nJTa1l7uQxv
         ECJDKtr/SKtHINTJWECgcCdfcqp19T8yLe/WxFGsskO3rH1dDIj2uU9OV7a2NjufsQ9h
         gHSwHOTDisI2FIm/MfbyKP56DWHKvFmWl2eLIgrkDiZdnE90d3FAfnESZs2wClLhJfUE
         X5u5+0UaYIPKKVO6esJ22moSM4XH7fOAEQ+4eZuj+rDqT8osENwGCYrGKcgcESvCpUWM
         N906inbSvoelUmlNeImo0TGdQ7sUBCpupLw4uUD6eGpF1hHH6o5V4TsrKUwzI1TeFvVJ
         T+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485767; x=1779090567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nwdcazcd5nv+n45NTFsXMrutWV/muXgCl4fYEEYQm0=;
        b=nYnL8MpndZsZPqePchxhVAWIQsXECY+Dq7CQ9lti+Jd2/A0vRQZcQ7IFg6DOgWCWK5
         6MiAYZ20PNV0HxOyz5U3a+jSZXa3bgfyvhLuJx/IFaBX9rZ4aDHHP4whVkrUihDJRKQf
         MqrWWwo030IxMyS+whEZxpdaiUbT6lBN9c7hfdRKCyfmSdgBpR26w9HBIIxtVKNWBh8N
         o37wH1mWzLRL+FzDXYHscG6z6Vu/5OJozM48+tSRXELLxjnbFeaipuVNwYlrRNk66CG+
         LMabGKI/XpWo9EIUgtFQBGY94XmGYnkhJ874jqxxTJVk+IgnHKXoauzUTR0W4cNrrsp2
         PRXw==
X-Gm-Message-State: AOJu0YzxhDasnmKDnsMbCvOm3pd1CVeVXhcb7YW/Q6bdsnwAWLPkKtAG
	+UG1OvH1yjYPx/jEQmeH/zmTAYyGL5wVvqVMwjRHKVV9IKFhtXX1b3Tq
X-Gm-Gg: Acq92OEBjDSqAx91GKiry+KtCUxm6iqsdSQdvs1uNN64lsRQHMwkPCpWkAwpkJpZfii
	TvxeyurPJLpLrCoxc2jHAbAtm1FUQUFbqGzz8+0Wj1ksAFSG5BHBo9nFU2XLOdwafQbT7AvpdJr
	gH5ZTZL2WmAGIHXZyti+W5C+oI8QMm/deZcaz4CvIoO/8sVT6TzwQWV8JvnrQi6RJUhDSFkEpCS
	CadEJZw+kyTvzz+6MvCIk01bcssWvPxo2gwTLYC9/KmSFP+PnEiI2gqP9aXaRjrVK7vsCZlLfwx
	I3h2lK5euyQ6hsMErKfPJtu7Ex2OhgOV+AQU49WGUcvUIZfd5iqCzuWJWLy0BviOl+E4Wx6oxdy
	/3DtNo00PFmaznyBbG9tTfyM2zNUkz8HHZLosVZwrp3Bu0auxG4kVUsJ2KTTKiZZI8kiiplAs8b
	RvqdBe2OgBm7HXWgTCG6GzBDg=
X-Received: by 2002:a05:6512:2350:b0:5a8:9672:e297 with SMTP id 2adb3069b0e04-5a8b70926d4mr2899659e87.26.1778485766903;
        Mon, 11 May 2026 00:49:26 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:26 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 8/9 RESEND] ARM: tegra: tf600t: Drop backlight regulator
Date: Mon, 11 May 2026 10:48:58 +0300
Message-ID: <20260511074859.24930-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop dedicated backlight regulator since the GPIO used in it is actually
SFIO controlling backlight and setting it as GPIO causes backlight to
freeze at maximum level.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 8b68bfef8dee..0bebea0cb8c4 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -2192,7 +2192,7 @@ backlight: backlight {
 		compatible = "pwm-backlight";
 
 		enable-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
-		power-supply = <&vdd_5v0_bl>;
+		power-supply = <&vdd_5v0_sys>;
 		pwms = <&pwm 0 71428>;
 
 		brightness-levels = <1 255>;
@@ -2422,17 +2422,6 @@ vdd_3v3_als: regulator-als {
 		vin-supply = <&vdd_3v3_sys>;
 	};
 
-	vdd_5v0_bl: regulator-bl {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_5v0_bl";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vdd_5v0_bat>;
-	};
-
 	vdd_panel: regulator-panel {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_panel";
-- 
2.51.0

