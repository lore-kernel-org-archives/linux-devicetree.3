Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8913815EB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556180; cv=none; b=BOMAmq5vTJ9AREpfRCcgeYClkrls9lDhde0BSoTKDoKZLq1UgEAduOFzYdHAx9iqi9iCN4+JyxkfN0I6TgtFqyO23b1eTkFP4RrFG0oZPTGaIMUF9zWJCL3A+6YAJRKV7xDxLPorVf5yRNuMJ+x8mXj3xYEhjOhB8k9omRs131E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556180; c=relaxed/simple;
	bh=VMxmBMhiTLTzddssIUwmUZEIKtXmDkZaeZcPqnQK2RU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Do0FWQTuzmtJ03qWMcmc85QcfVC9+LgBbE2WsHW4M0n1te57TXaXCZ5dEzKiTeGTptYyLUgcm7TqnsIxYkixCKVzpkLgEzSiMfoCDVQKjpW0Co/f8BTmCl7+iqpBRhv4N0c/1YJQ6ldaTRVeXZDLgzApEQXd6cIV0DG54RUADhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbH7cb9G; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbH7cb9G"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68d234218bcso646176a12.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556177; x=1781160977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y47murUE2Bi/OoU4lIULUU17WHpCtlUIA1begJSq0eM=;
        b=lbH7cb9GLsQBLqG3PHX601AfV3rMWAVh1ZzJMgHtk07WZW1wWk1zCSYbDY+5Y9clkL
         wqTzi4Y5XZ2sg6RcAq7Tln5x6VDwua6fB3f9FgcJKYt0v8XV0vGBtvoVrUI2D5IUZWpf
         8oXjPXBFOULnuUcFjJIdD/UD9IWUc1Ox/FaibjXoutB79K9/KlnadTvdPoc5fQAa8UkH
         UK9J67jkNFtTD/38xERsWbq1QQKJdSSCzt/vJYMmCQ1TUAdUsYU0GG/GqLBBDaxS38UX
         laO9o5/9n5YKwssh9awVOXO6W30ORDYYCsYzNWgxvGzBcyrLMosqO6I5mTKYKFwFGbs6
         m/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556177; x=1781160977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y47murUE2Bi/OoU4lIULUU17WHpCtlUIA1begJSq0eM=;
        b=Khz4UVwBlqG5dkEMXfDd/6jG/XBqfmZbj15L1M7Ao1VBBw99OxR0fUKadHzY0hBkc1
         EZPhN68SZrrzBa0h7R7vtW1u3/vfRwNvySgGB4CKb7TqVkGX0QvOYlzb6xoywJZF+3S9
         Gl7HDktoAe4oRvyH9TB88r3oK4orlQSHQRyxBn3TKFD4dVy6t6wB0fNQYo5Ox1fesMtg
         JhZn2zkfudaMhxBoVqgk3DnAUVt5Fyj4pJb9vGRziBQyzE2KUVrqJk9C0i1cQqFKChp2
         eOunzY1+J1OQtsJv+R3TCbWHrnZFoMOLC+s9L/t+GL7x3djf384YvBkHVxCN1hfNHINB
         huVg==
X-Gm-Message-State: AOJu0YyHkE7m1Ztz8Pc4EjeyreSZFG8OBF2tgHN+SvX7guSWaGyAcYVF
	x0rI1EJxsWWfIftC8Yh2GxGFfESSEMk6uE018Y22w5Yf6Hwy45IVQyzR
X-Gm-Gg: Acq92OGf7vfP9Qk+zOcb7qVbhrFlU+ABS4evO2GbyPmWyq0QGKOw/iMFs+KCFGbo/fk
	IiCkjAx/eyaJNcAi4s2lh3GSeh4PmHPi7ZLIH/FARenMlZsg1OZj+/Fp0G0zdAbewnLqNebi1/N
	MGth9ZsPrpTkz+m67L/dXBDPjXAFITu3pAcMBYh7i7IJoRxfGQwNxSy4ftoRiHChMSGuVFlcSWi
	+83RhzIY6POoGseO+TnBPdbYB9VAehK6WqQqgX68vCQztxxEJtO/jE+k2Ly2novRmCvU+dtQ2pq
	earwg7EO93acnI2d4zzWfyy0fE4z+l/vlrUh3Xsam/Un5RTGWUThDGvKjHi9O2Av04ax70hxw5J
	gVNtEzaDYLmSv7nINXLUDrxPAo1G/Miv/hyqrTFbXCN8Yl4rsCiCvnwJGpuafvxEP28w68E0WLV
	U0D3y2VCksJA7nZ/VUWbBjo8hTrMf2f5xPmA==
X-Received: by 2002:a17:906:f58a:b0:bd8:1c88:cfef with SMTP id a640c23a62f3a-bf0ac50bb57mr345862666b.5.1780556177262;
        Wed, 03 Jun 2026 23:56:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/10] ARM: tegra: tf701t: Add core-supply to PMC node
Date: Thu,  4 Jun 2026 09:55:48 +0300
Message-ID: <20260604065556.137614-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required core supply to Tegra PMC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 041ea6e06531..f20c1db245fa 100644
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

