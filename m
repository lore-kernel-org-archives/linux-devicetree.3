Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAEC480359
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628684; cv=none; b=Sc64ii1WzPckYg9dvBAg7J+lWR/b4kRbupw9FZ5hBQhmTD/qHy2YVrfyhG5j41Rr9XhKZLHXHdryk4jq5RGWyovTxMUYrZvgCrRJgbLhS002hNeXZZ+rowTODoBEcVQJfC6+5C522bGczozycHd+A7Yy7Jai+580S6Rz+2jHAXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628684; c=relaxed/simple;
	bh=U69SQbyV+ssf8xjwsV4lwLr4kMLmiOJVFI6WxgPKEdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTSlQOQYZWvBVf91fqlSlBfYjtMImNx6GKaoDFPhhpyyTplCciQr1c7cDtmH0s2AVjA838+fledP8oZlfKBnAG7pJOwWIx9ADkUav/oJgNqjZHrDTA83xi/su8G2Nubc9yKVi4aoO+wU8P7v/lQfPweu3Us10Xm4fu23Qy5ud3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks22+TfY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks22+TfY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4955158f26aso18259145e9.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628680; x=1785233480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qy12RKts9D31/bxnU65LpuTKsVkQz9PKxgavdVWUciQ=;
        b=Ks22+TfY23zLOXm96eKOV1wFRwvKnUEsmps4Az3glpbiEElH1OkE7x0TNPoRtFHBqw
         sRfoh4yyZ9ezRJXvap6mgMnCyYHGklrVz9k+9PqtaQby6vuibC3u+zgcXWxJobzIKfve
         c0OfsKNXFo+74ymuv8MttJgpFRyZ7PT6wRFy1D3nD58t4I70+gToqnzwhjQ+8ubNJIXI
         /hsnYniXJYN1t01gTyP0Q20iK6z03NHSUhCS0N6v13VsBgEPR7bcxRD2A6hWthZSQM2S
         9etvYmi0iqa2Ns1i28fWpNUS2Osh1h6GqP4B5f71PvE3wXWd1fp/uvh6+IGy0Ja/K80u
         h+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628680; x=1785233480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qy12RKts9D31/bxnU65LpuTKsVkQz9PKxgavdVWUciQ=;
        b=eyZmFUJ62znVitibfi2RdetNhdRw1diqjxkjU25TK7LwjQzOqRxgugrN2yYIDct1k/
         pabeh7F3ap6+2PsOUhfNaWQ5DPynYst1agdfU6q8Btv7tctCCMMD2gEQMtcIjDiHOv+q
         +8iC5o0eh3kqqh0v9ZDd+9E5VsIhDiHf3lJI61N/LlUV2xvHLk+HEeNsU0aLBRVsd4f7
         Ur6WNFFcFJdoDMG7vVAkvFiCgZ8MExvGsCv3O2Rr4XOtfcO3/IO7SiWaL47x8rXhCAvw
         uz1pISTCGps/lO2o5N6KBeFK4B0DyRLUW6SRObwOe7bMqslZ/gRTd2XWkeLEpCgfc+tc
         Qoag==
X-Gm-Message-State: AOJu0Yztrv4R9pGdAOEeoHtxVN/oXdUcRjLAT/zqW174plRUc0r9IQMV
	MAj1aGdNgOqCH40NjovWSaXqYYaPp1dh4PoeJmUT9xpYoz1Xs6B0Ro43
X-Gm-Gg: AfdE7cnxsHPpd6Hy7NW0iz9ZAkENW9fSrnNjAjchM1ZH/DxzXPrp73RR9vvoh3qSYxa
	mH4oDMJtLAjmTbROnn/eDn5b4FEIEJYUdnAv74n0N8svo0NLtGF8zdPMCgxu7IBNoXxaoI+WOz3
	zyuqdmMEDw4+UrK+bg8w5QgKaWA9WTpvoBh/MCJdKkjiG1/P8z8uKAnDRmDzAI6fRlb19oeHh/T
	cAWigHrBra7tpmuN8RMRN9D2uQyGz/Croi3fY0RUrP+bKUR3fBmJBbUBZSQxe6ejEiqYQf6Sqvz
	CLbvypVNmZIX7NAMjRZPuZD20uCaVmG/l9qACHUPuAwfGLDTg79EhtmwMnINS/JTULJ2ResgFvO
	Rev4Xpkll2zcFXE2pGQ5OB3fNa3bobRfTFvMylgj6XBSVercECaaav5hsfDXBdag1LgwV4MFjhM
	b26UdcmYa6O3d1RB9Ou3eY0+Y=
X-Received: by 2002:a05:600d:6447:10b0:495:63f5:7a4f with SMTP id 5b1f17b1804b1-49563f57a9amr46059765e9.33.1784628679879;
        Tue, 21 Jul 2026 03:11:19 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:19 -0700 (PDT)
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
Subject: [PATCH v2 09/10] ARM: tegra: tf701t: Configure UART-B line used for GPS
Date: Tue, 21 Jul 2026 13:10:58 +0300
Message-ID: <20260721101059.451699-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set UART-B line to use hsuart since it has GPS device linked to it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 32d55c18c7446..0d182fa5c1af2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1283,6 +1283,11 @@ drive-gma {
 	};
 
 	serial@70006040 {
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
 		/* GPS */
 	};
 
-- 
2.53.0

