Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F353DD876
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556187; cv=none; b=KskYWPnrN/QlL2Rz/PaeqYuy9IxuRT3UGuRYoYEWCAL6A+MpW/TU0h4ghCHG4d75XAqK1YJZKX7gL5g0PWYyQgtcHQa7NW3Z9QFeQlfagva0VFtwUXBaTwH/34Q1D816rCMDzsPAOy62EfYy8VWGoRcKzVoHfYRs4gbWe+pLlww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556187; c=relaxed/simple;
	bh=WD6SpV06z/+rCtv5vu2qcqn8DOTtcqpPeKOCYnW7Gl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Urs65poUemu/5ygWP4CCR7b9Rv0QTHj0NufNKXs9MsLXMQ6HCepQL79UMEY6cRFeXJcnhjWKd3Y0Ve0iMmQUzHr4+kB2+G9+IbK29FdpyKHKmemEpAOZcItAn9l4IUHcsWG/p2WmkZ+jvJ2A9fXAGlqSNFn2grp6YZbZAg7ih8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anlTD5H1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anlTD5H1"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bec49f7e35eso38255266b.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556183; x=1781160983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj5QrO6XqMBpUhtJt/zlH5aTxtuKQkoxIMlaQ1G+P/k=;
        b=anlTD5H1/C1mYsJVoVC83k9pyO1ASOxNH6uSJFl6CtdRxAWGMOsmX2VN/HVtCNWOjP
         6jzjjCVTqMJ4fC1Su5fEodD3i2Uj9xen50Iokfc4HK11M+xxot077Ogck82Xw17epZYI
         yW7pHfQ3ayYIq+n+I7BQ8f6jQlEkkHgJ+UfejFBWjOW25QjfPS/jpFhuuHVIwEWwwrMd
         i3RcWP5961aaviZ2j6/lgwL6bGJEQc+OgQRUMUevB4tTedAqjXnisjTfFPZvoJPlV7S/
         vsvQwlEW8th7ww0oXUZabUIykGMua5CQXhPy4t4avDhvhsA2UVG5vu6lNDWjpE86H6j9
         A/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556183; x=1781160983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qj5QrO6XqMBpUhtJt/zlH5aTxtuKQkoxIMlaQ1G+P/k=;
        b=PcZ/lo098cCuqaQU0JfXzml+Nw/SiCm3Uk1Sx9mmAFNFj9nmTA3qr58hs8wVLEiJ/x
         fkpV6mhQ6+fbkH2S84z08Mrd2iURPrsSCvXbDPo31Pcl7cMNHYpt+S21nVj/53wi4o1H
         KO6gj48NlRJRX0BZ4QbcJHUFiNylHy6QNxqHuuQRgwMYOrBgIlPcpqhOdyayaik9LNfW
         F9MMaO/Sqqq/Q9fMTp2ueqgwjI4NbP3Obb53ta28g2Hj6mrLqMacwrXXbmz7UkV8/4Yg
         ZajHUh/bVz0ObRnFKvdLxt/NLcudxWd0g6h2vpD5/Jl3hPBIITT669LdbGOCs6dgC5F1
         jIhQ==
X-Gm-Message-State: AOJu0Yx9EdlUXVbLBPdpD+19s++YR+5LXIXJS9SwP2wMhhbMtbG0m27X
	fTgX2PVNKJ5YHP1cRHlBuIv1wzsssnQzTVs0qlrKfLsNeIrELGvGmQ2d
X-Gm-Gg: Acq92OHYEROICLiaI79tvG80hvGaNnNoMq6SPXibmggw9DjfmB/IvUblVwbvt7C4MeI
	ZsM6xdPmZ8+vEmM1LM2T8IDkkMiVcBXXgHC5IUJE3eQn7lsvifpiDwDdImXpeOl2CqhVvN+zIaO
	cmsUHSbKYlW76D6TrrUqC8lP5kl6KBL1Yf31Qmnyve36W0Nl6B8wACfjrLhjqcf7Uji6ufUirCh
	Ujc4e3Y+C5fKO/+GsQENydF+dCCotY6XQ3r19JGWExwIgCSIppoixEhOr0uoC+eO54bL2RAXFNu
	ThPTlqQ74ONjeCNo5tv7E4/xOdt4OUlRc6FtVizET+pTY5F8Zy77MKot/0c7slvfUyEhJeCVKi+
	PtczfAXIXtjGOih69gCo+403jBRJXrj17v/C/4/ATnNiIYDDyIv1g1cnikieV4nUOOSu5k0ufga
	FUX21VuuwzB4t/sHJwOd9gq2I=
X-Received: by 2002:a17:907:3c8e:b0:bec:157:a63a with SMTP id a640c23a62f3a-bf0ac20eb8emr318362566b.1.1780556183335;
        Wed, 03 Jun 2026 23:56:23 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:22 -0700 (PDT)
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
Subject: [PATCH v1 08/10] ARM: tegra: tf701t: Complete power sensor node
Date: Thu,  4 Jun 2026 09:55:54 +0300
Message-ID: <20260604065556.137614-9-clamor95@gmail.com>
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

Add missing vs-supply and io-channel-cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index e3e0b4ba7eb8..df4ccb332301 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1391,6 +1391,9 @@ power-sensor@44 {
 			reg = <0x44>;
 
 			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
 		};
 	};
 
-- 
2.53.0

