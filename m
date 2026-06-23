Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5A318EC5
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782232996; cv=none; b=SjZTJs3A7BWCKjE0dD4k6IQkEfhU3OPiXTBKaMaoJ5A9KV7J4YmHH8y1p8Xjt60Ayy1vbQyAVl6qIvgZPyBm3gV0bRLXCYUIeoBOHQe2XjVSm9bp3bwBm5pp6TcziT7bhwT8s9a1I0blGMCUbS74T3vjPry8035ZRxfroJbhtVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782232996; c=relaxed/simple;
	bh=8GDvnyzfgPqmVvVMz61DihCf8JpOsm/P4ZGMUjP06ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdmGJ9ZqpomfeKeOaCcbFthpn3U2P5RRFBS99YJDgq4sLk4HiBfGaiXPf3I+06D/PrwF34lOI3xNBvZDatWTpVMK7UZFh/tCIFYTNpj8XycMZ9X/fU02a19z4nmxeaLIzkzh2jpux4VRaB82bLTTG8Z/r7yn26AMNtkrI695D94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bcn7PC20; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bcn7PC20"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ad68a06541so38429e87.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782232993; x=1782837793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qulQKjibAH9eps6SD566ixYFtJxwVLM36PRtnWBIt7A=;
        b=Bcn7PC205LdtFdgVayctT6d2c5XlZnenYoLfjcLYj2Dz6i24e9pqV069bz/qD9+CuF
         JSUvQkAvXqtuFgI9dDJmk5UkEdiCPkpyq5ZndnSqCqJevUtchOUnLb3r6wMqO315Njvl
         PB3KH5oxBRPw4+4O2ESLXxw3byjTxYoHWGdra33AegAOAef3fAzo+Ji7tqdCEXmA+cOi
         iQO55wsm+qO8Hk5oWJgqfBh1a0oSL/YtZrTif19GofJtnAVarP7JSIIhGYCGqHfbAxBU
         6lIr8OyfmlPz2QNmdgOsvh8Y0/6JmL2uc0joQQ3zo5g+UCjVu8Lr6Om9E9iJkqa9dKW+
         /xGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232993; x=1782837793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qulQKjibAH9eps6SD566ixYFtJxwVLM36PRtnWBIt7A=;
        b=dZ1GbflcPY5HOW736NXdtCKIGtitktZq/NjQE4LYWygZIDbNznyvdQV4MNbULh+N+U
         AUJ/SZBOZhUFHWd2cS81bnWoRhjg/cFA3/epjYwenN9PWU7cKql/U4ZG6kq06xY3ud7V
         41i1uxFuK1g5THHY8QMRYr/cFaH9yO2AcbV6VxB+27aoI/BrikL1fyKU1vhrTET2wcto
         vFhg3VjXwyjtVWQW+FHvVwpbKxg4uO0XEnzR4LtrWUQ8XGhQsCyqYDYSeDfnMch72DfX
         +nKsV511v2UMCZQ+iQxPVuhyMKOekC1DuTmLyNYTsj3RltXlkbvOoLRnq+OQrjPucHrc
         4nQg==
X-Forwarded-Encrypted: i=1; AFNElJ9BCj1Vz9HLokBQJ4RfBl1/WmSE5IRTuFnqOhrBTJ9en7GyJrVwWq+nW3xSuNuSRPrhc8N78DfYfk/6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5VM9SmN0dAQrrd12z98/L24LHo59euc2Z9O/kl2POxE8VQ9UN
	tANcoR6ivO/v6b/jucWlLHXtqN3+uGIOvUUgtugRsC/2XhMtDwApByRs
X-Gm-Gg: AfdE7clslseoKTfRSv4sNf6scfPnTMB27C9Oghb5I7NIsgZxwx/nyCSvKbODBPqVtpF
	4AMtZ2IPXoC0AYwnjATrtFR3gBgjbuAPV6ZHbFjjJCYo0ZfIFNm9lNKbfyl897mpA+CXpSw4f8f
	Jd4XYHupKdmSqYfFS0z4x0mhLDRt+uAVkaeYvn5Kj7aeM3hvrGVBaRh+j3Rt34RrfrQGYo10HxK
	Vxr3ke/MXiPcP/lFTBxVTwFX9Y/opE9WPZqdmUrIqbbAaTETVlHSQUF8SMq+JAeJfmhAp/B08pP
	h9dKCfc5llUsWEN0DufAz1KPXM3VjpERgLsxlopbMjmv9qxdMAJI77nl8J9alLKuL4UwZbsYWV+
	WEgHM4F2V2wehBC03xh0F+nSpTT4tGbT1IGup+0M1aKXUUmR9XflBu6KPrJAe6j7PvQ4REY7Owy
	27miptNEN5WxptcIzZbhY3B4Jbi49WaHyOrNy/S50+y9kweg==
X-Received: by 2002:a05:6512:3087:b0:5aa:6db6:52d with SMTP id 2adb3069b0e04-5ae3511a18cmr1145369e87.44.1782232993400;
        Tue, 23 Jun 2026 09:43:13 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69555c45sm948253e87.36.2026.06.23.09.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:43:13 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH v3 3/3] MAINTAINERS: add entry for MAX86150 IIO health driver
Date: Tue, 23 Jun 2026 19:43:09 +0300
Message-ID: <20260623164309.16452-4-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260623164309.16452-1-shofiqtest@gmail.com>
References: <20260623140113.12574-1-shofiqtest@gmail.com>
 <20260623164309.16452-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the new MAX86150 ECG and PPG biosensor driver,
covering both the driver and its DT binding schema.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3115538ce829..a441ec44bb27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15863,6 +15863,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/power/supply/maxim,max77976.yaml
 F:	drivers/power/supply/max77976_charger.c
 
+MAXIM MAX86150 ECG AND PPG BIOSENSOR DRIVER
+M:	Md Shofiqul Islam <shofiqtest@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/health/maxim,max86150.yaml
+F:	drivers/iio/health/max86150.c
+
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-pm@vger.kernel.org
-- 
2.51.1

