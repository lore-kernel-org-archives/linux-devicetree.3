Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9643E48A8DB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863181; cv=none; b=RFEp6BOfN9Uoea3sy7uxIxXER60NxlgofTioTuxrd2oAeOCEHGlZiw3YyRr7G+ZLC1wZMLbDzq7HeQSz16ptsZeF/tvktKXPEUnHIsbV/doZfW3GS5ZOprRACkbtlMEIdqsaJ6GqGD4+kweicNxiwikEx0K08kZCGPi/NLVB5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863181; c=relaxed/simple;
	bh=U+tsQLnWyDRDHVr0CTIeZd5q+U3+1+j8XgyYVIUKJgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4w68pmkrPCDKrp8DvaCVEA0IMZMvcmvYNi/3Ac7r0xEngaM224aUYUBnkHtKNTgzs7f0iFczmUV+WxfBeFkWmtFviYFF/ArYE3QzmI01QfHaJWgDSkOc4GmVh2al863uOgMo2gsGl/nV9EMBLX4Ukqw1f/Tuehq9vz3sSnHZJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwVUoMqe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwVUoMqe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84a3323d858so6788b3a.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863163; x=1786467963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g9LXkLmF0QQK9cYGRfMDJlE9q0WVIrmOfOlOL01nvng=;
        b=XwVUoMqeoo+x8e3n7QBBKL8qiLzrHAm2kfbtKR3BWANn/SJ+Lzm1UaFISTxCngZi4D
         DPtWAENinBZI3WG93XboC0lcUFwcRQzwnzWxauJit3DGyBtJb33m74PqqsHgpxz3jlK0
         5HeSRBAAlAb3wu/YCWIu/Ikpdjmbl1gEN3zXNBkSShdlSXnr4qOHrezSMPqU3uEHt5FI
         nfE895JiiGfIv7mqUfIXb6fFuu4Lo8+O+lj5O9lSfnT/+n949K/9hyM4XpuvDaRB8hmG
         VyFqa/9QuE9zulmg7qGr0BT+H3TqlIK+E4ILI8w0HJCI5OPVTQrlZX3MV6wqan+s8zF3
         4SuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863163; x=1786467963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9LXkLmF0QQK9cYGRfMDJlE9q0WVIrmOfOlOL01nvng=;
        b=jxg1lUgdPLC3SeYMyC+Yy9/NjSHuEJLX7F5oEMg1CqdV2ED5hBEPa5zkBkX5YWXdk8
         ozK0fPxE4aUA9+atK6dNuHc7gHVD5nEyj6VnMz06w/5gZp51ixYpeYaxZVe1sdasBjTh
         IWt772YX7Sl1PVatoRm1gE/8XsMQVfZ6P7pIzLuolJE7SVcgxqmFNsscQpFxTTdNTHCe
         YrpyRKKiOs76DuWTvOq7KWqGs80P9ncP9i/QazZ7t7DexGIVVvcUSjA35N32TvMXB9AN
         u9jtGgaKfrtOgY1rSY5s70dyN0MAAvmvrJqatAXy2TxatpTHhKpvKcsWtP4hKGOoXcmw
         gjsA==
X-Forwarded-Encrypted: i=1; AHgh+RrqPEOa15nFl6dJVmQZMAEh2976l9GvFFK+PlRH4BDHzabkfcmqGp86Tk3NNZhvNmOw7tV0OLL1V/sY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz55qBXRDEJFlGMNVy0Uo8oIzL7cP4BbdGsNSMKjc7RoOtUThZT
	XcSLm5O5lo0E8VgLwVcabzyvWim8x45BB7kgctuQgcUeMrhu4fY2AzAS
X-Gm-Gg: AR+sD10h/OYUrqw5UvNSYGXNAl5VCXDRyzvsEenOYGTk9kP6P0BRUOsnbZsmGjFYaR8
	jhaH0MbCqkStphpXiYir4oKsmmHY4crwrpBqE5nfui379G9byFshxE0EtglO1xTa/E5yjLAM990
	fWcq8cs/x8iVTlNXdDm09S5CjC2u/znVr0jztvFPHtTIdjZESTjCIEIuoPV++NGqTYkWDjn9zh1
	JhDdLKl4T9mfnDkXtOV2Q6F6JqEP7B7o8n8dVgpRhMuN8aqW1U/gGxE7M40w426Xee6S5IU7JF7
	rk66EcWaSU28c03ySnBqHcs/6vsa6tT+WVMAb8dS+6xF7LP8Y8o1NJPgm3qW9R9bLpL8B+Hok3v
	MYefT4wGdcTiQq/bMuixhbTCY9fxQt67HPqNaMuvoQ38NX63zPfkJ0Wow944BEajKGcpH5gH5yt
	j09KTgQXOukzrXKz4dVosM/KDXerjBHFe8kXzYLZHT32WeHS9YUVpy2VvjqAM6t+EksP3iUgI=
X-Received: by 2002:a17:90b:1651:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-3903c7278f5mr485167a91.3.1785863162872;
        Tue, 04 Aug 2026 10:06:02 -0700 (PDT)
Received: from [10.15.72.252] ([2409:40c2:5423:e712:2aaf:ae79:67c5:476d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca52d329sm5147124c88.4.2026.08.04.10.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:06:02 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 04 Aug 2026 22:35:06 +0530
Subject: [PATCH v3 2/4] ARM: dts: ti: am335x-shc: Remove unused ti,no-init
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ti-omap-rtc-v3-2-ba3bbd8af570@gmail.com>
References: <20260804-ti-omap-rtc-v3-0-ba3bbd8af570@gmail.com>
In-Reply-To: <20260804-ti-omap-rtc-v3-0-ba3bbd8af570@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Keerthy <j-keerthy@ti.com>, Afzal Mohammed <afzal@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785863118; l=689;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=U+tsQLnWyDRDHVr0CTIeZd5q+U3+1+j8XgyYVIUKJgY=;
 b=d2oaSN2HN8Zp08jvzP1h/JFly/E/A1bZXz8xT7Oc/auJ2ktdbJ1oD80wjusZOUj+ufvlK397Z
 ooo2sDDDyeVCR6cH+M55M9bEOxqRKxtHFy8I3vZfdgva51LLoPBRW84
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The 'ti,no-init' property is a legacy, undocumented boolean property
that is entirely unhandled by the rtc-omap driver.
Remove this unnecessary property from dts.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-shc.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
index 597482822608..2b946823928f 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
@@ -241,10 +241,6 @@ &mmc3 {
 	status = "okay";
 };
 
-&rtc {
-	ti,no-init;
-};
-
 &sham {
 	status = "okay";
 };

-- 
2.55.0

