Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2143A3DEAC0
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556189; cv=none; b=QcHT12P2dzTSonfUihEp022IFCBvv9ej1w5BzGkHB+4b8zOPQDsyVWv9Rkb3Nvd9lGmnICKGc+L2SHCxfLvn4EtY7x/kQJei53CesQYCb/9QNFw81a/jitgzfyx1ECGN4RV1almep28Nueu3a4K4iSIR/CU6UTHzxhM8k7Y4sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556189; c=relaxed/simple;
	bh=U/NkWV1nmCpb+qhJ27AMxYa8WdmwjXZO71aitOsqXrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpFwrRMtKsWkSdfge6njb/6fhs4WCl58gRxHvjWwPXID7iV2UgaRjyo8ZI+S0VLBOEq8VOvxZ5vit3adpjN2BHHpEMJkiM7dZRHwDg7DbPxJPFyUnPLayIdqaFq2iuwbGZNYyyAT4PBe1u0B9Sf/xCnwOQ/wiPE5sczZTDeHdxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgqTRQgS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgqTRQgS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-beb1bee8c16so42066966b.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556185; x=1781160985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAwXO83VuDCKcmp6yvkIKlFD6KbkKJbbg2C3v5fhKN4=;
        b=EgqTRQgSOJIrrMFuQRYqujnffHEQgJZeWuwrf49CSAPaEIzYJIqCGkuFZGPuB7l12o
         UEcaFn2/fJ6WXJ1MBY96tiP/37PHY0rNBRJAhlP9k12lT4Gqo3mSROKKcXv0Wu2dQJ9q
         O3q+RV+7+ow0Wv8QTrMSjZ+p7D7ogUIaRBu3oWf2Vwy6g4UHzxC0rDj3lzUyc0lXQXCW
         4gVorwU8f9Muy7AiactGangkJGL4F0c4tM68gO2UpgErIj6rvh9jHOqIjH6jRpTEMXfC
         26cGFCKy8njid8S4IO5VpiFk3l2TqDHmstu/K1L+z+wuqku9HtJ9UyD+h5NQJfBSW4bN
         WnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556185; x=1781160985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IAwXO83VuDCKcmp6yvkIKlFD6KbkKJbbg2C3v5fhKN4=;
        b=KYxGaWgMyjINdS/AF+0OBQo2opkmvf/DD60dWyjW4Z/1vhMlA+W8ZxenCzVXp9QiU6
         Z/Fvy0uoiORXj0uSMRmJ7bBoEt2pE8A+6rEIb9CuuVqqfKQBDSQCDxSGpWm2sBhp+LVq
         asPslirj9mYk4x1e0ZaBwhvKT8ke8ZScCpmalaqxnCww6WQvxDPuXb827bACCnhwb+Wz
         DXWufE1A+wAb0XhTISrnXeXvuYN/kE+m3GqZ1GP2Jr5Z8/FNealnvdJVaDE02TH+59D5
         zOzd+Rv9O2erBadbINF2/U71LsnfV+7FK/pOtrOwFCmTEOsTTlNkjulgZF0UoSXWqSrm
         qE1w==
X-Gm-Message-State: AOJu0YyZrrGgTM01kqJ6PWxblfBNqyKdBFLNXiSatOXh+GGBPGMrwZXu
	MO/+LE/uz6xwBGzouEVaDaUVvfTE0lgbgFMKAXkNOZQo6AYoRO6qM/2O
X-Gm-Gg: Acq92OFaEV5JFTykVvpKnI9FiPznMG/bWjVZ/Yw7SpqAftXOVa0AgdzgIhuhqSb22ls
	u4TSaYqjJnvvN8ckNjfnCyY+c9/VXerBYzMuyw0YTg41bRmA2fT9VnP18FzfLHZ6jGQ/Z9UHqfp
	TEIn+//PcHUatYQwyMI0rb4aUcJf7NELEcUgUhUNJ0mHg1EVfNS1BGOpdD1leN9eFKZQiMCpoEe
	WX7YdRxidbY++r4Hip7smOqfsUdzu8KggR98P1Ykp0wYc/fBV+xcDdSymdZS0cmGFc3m9KZq472
	BOhwQ+WfSz/AUKhkkMwF8yY4sjA5Cb9NbrFm7qsmNLMGyHoo+I7C8oGZpA0o5jJI2UZXhOKY09J
	JP2dlSl/VKMfsArOAVWpHWg9xRPlufko7s4LDTHO1lcXOpy2BquIDSShnJvCwgC9rB7GNR2KOyv
	YVO+LGa94BrTVSFKDW50SukYk=
X-Received: by 2002:a17:907:180d:b0:bd5:1605:e1c3 with SMTP id a640c23a62f3a-bf1d159be66mr118137366b.1.1780556185381;
        Wed, 03 Jun 2026 23:56:25 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:24 -0700 (PDT)
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
Subject: [PATCH v1 10/10] ARM: tegra: tf701t: Add chosen node
Date: Thu,  4 Jun 2026 09:55:56 +0300
Message-ID: <20260604065556.137614-11-clamor95@gmail.com>
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

Add chosen node since some bootloaders may require it and add stdout link
to UART-D to simplify getting kernel log via console.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index fa4e3def9ec8..c18c40a5e63d 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -26,6 +26,10 @@ aliases {
 		serial2 = &uartb; /* GPS */
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	firmware {
 		trusted-foundations {
 			compatible = "tlm,trusted-foundations";
-- 
2.53.0

