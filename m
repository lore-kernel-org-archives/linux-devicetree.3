Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE80135E1B7
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010520; cv=none; b=oZ66QUgbWaJNE9nfBwnLrD1LloN9HCEDvGPUgQcfLUlu6wIR6T/vrhh+GAIeIROkDGe5dVNgCCv38MEIrxaRgRTby3BztlcAs8vCfFBSZXVsP9WXnsQNfg4ybTlARDVhTSsXMK1hXpwsJtsty+v1y1CNSznHz32UYdiHQbxOtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010520; c=relaxed/simple;
	bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bh8EUa8C04zJVtE7H3ivg9kcmVdBTNovsAwlltOygF0Nb8g0DXXMRT81yslKq2Hvr3kFVWKZbdFMyWUnKdzlsvpqIJ/v7IzbEwBbsxdD/Q7bcULxd5tFINkWPMcS0NdlMeY2KPwoq12wU2rne9UTkUw8VilqofHqN1JXMaEIYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqKuqB9G; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqKuqB9G"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc61541f8cso7987875ad.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010519; x=1784615319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=FqKuqB9GqZiwlTnmvGtWPFf3xxt5BhGilUYTwb281ZbNiWL2uLzfQ+3vKk/hA0ts34
         JjO7pbNyOAym6KMP2c35zwfBBIiAfwM66fK9AIIsR5RzpEIvgjCN+4DHFlzHHffbiHn4
         eQpHSi+JmWlYphtMkvZpEsk4K2TUUGqPHowX20wcPGFLDxScyPp0gmyoMJ5c00vEj0gb
         swIV2F3neOCHHf1ze3kMhncNTeuKNyECCU/SlhFRkOI85T4tmnyF74XxQl5v6GORr0ho
         hFt+JZEANBlCB2Y9gkrfHsLdy6BaPVGsAm2OfX3R6uLvhADpSZLmNLTFDORZA9iJhs6t
         nKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010519; x=1784615319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=hZ35m5Uc3W+oNpfGCklOLgzZrgh6CoSfx20STZsTMNJt3hNtQcK95ezMwglfdCVgHO
         dQnJRC3dRP7tGKWlGe1qte+YNHOTnnMPshLQf+fePT5C2p+nw1h8Ya2sfVS9MvSpcxxA
         0LZAqGFTCI6+ycyD4S8CqqTzZqZ3/R/k3fwp5wskhj1DnCplF00Pbaq8MLGHF3tYFzxx
         UlIISRYvrqjbhGMDSmOrMub4t2di0FNk16yoh1MGAkzoXQvnNvZ076jIaeSJY3/n9GS0
         oRWW4PX1HS0CRTGfU4YkIluej44hf3ivKh5UPVSWEQGJixWqmxJXZGawvZ6YGgnzKiju
         6xug==
X-Forwarded-Encrypted: i=1; AHgh+RrJ2PTSUcYw6aEufAuj1uMYZj4YLP5JAXMZFSC8TDo3g34Cl0E9IQHvcBcLpTnPEwcxuPu4rVG9r+e7@vger.kernel.org
X-Gm-Message-State: AOJu0YxO+ochQOM5/pV/shALG/n+nLB7Vi1JFPUiw3ZrTlZL+JzbQmut
	DeBFGKA9VZ8d96hDYEQr8yndmkfuDow5sp2obb1tw8F5xHwUIAdOW9ZekHrxVw==
X-Gm-Gg: AfdE7ckiGiNEoDKWqXjMDj80kSF+UI8/kg95EmL8/iA2uK3I0WUsrSKMHIQJN/LvxXB
	zCmFjQfw9ZwhAzSjo51SQAb6eXZq2htMlB89L7x3VSjN0hnCOUnvzTvsIWY2UB+OZrS9+NhQYRJ
	l0KCl8tlZLspIb8Bw6Ov0P+emmtJb+ENcavXWBxLJ0327ZdKDbmHCz1Vg3gcwbLi9NkUEPJ1eBq
	4r2x5TlvD99vB5j4wvfByq5Xeh6Frfva4HXJIqdTw7SPt3hV3QGi0+dmPA/3r2nZjquj08nQxYb
	XVhofJ/XHKOyjIAbkR4GN6DWXwADRx8Pa1fNaUOikBVl0irzAR0F5SdNs57vV3b+fn/fsM7ok9U
	YqvIp33vsvgnYyEvzDnmZLacolFrbzc1JturEUXIlVsxkT4zEqR5Ei8uEZXUzi8BerXzBEiouxv
	viAqEwahNh7q7nBHxlo5UxGi73SCiXHl+1+pwlLrkG/g6Yk6StZ5A3CpTcMb31oooSOmW8NIIb2
	7N4l6i+KB/Uxn4zfe/K23/y3of38cnl4lAooFQey3h9FgLzpTt+TuiCMjMyuY0G
X-Received: by 2002:a17:903:1b08:b0:2c9:ed2e:b8c1 with SMTP id d9443c01a7336-2cea17f82a7mr116774045ad.12.1784010519128;
        Mon, 13 Jul 2026 23:28:39 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:38 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:11 +1000
Subject: [PATCH v2 04/12] arm64: dts: apple: t602x: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-4-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnWivv/W/4/x3RrdIzlzWU9vRK7mipW71t6cSbT+
 hMPL1/62jGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq5hiG/8GNy25EbpV/PVXZ3fRO947qQNbgU4tFsrZyLBbt3NVn6sDIsEZmxYw
 ljJN2/DrpbLKm3v2p04OaCZdWXxaP83gd3hJwkR8A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t602x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..301df2f006a0 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -122,6 +122,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0

