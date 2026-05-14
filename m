Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713E3A383B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753587; cv=none; b=SMokRMizoZUelSVqRfGyvxyxSQEXdW1lWRo7vaLM+o66i2p86B6Oagjns2jNx9Z6+Wsj+iJGycT5+lukJZJz7b75HuQy37i/a6QQppCc9GwdsoEeQD0bD13oRB0W9WBxHSzaYY1Her/w7ezJdyJbdsFd0wnAjHe0LKKTYZgSMrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753587; c=relaxed/simple;
	bh=okc92Elx226JNWwh3EtQQc7AWCdF3MMdvbc2NpJGenc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHwynPG6sHNWNJOiLPmgDEmaNeRa+2npfsEeNQIUh1nZG7MAjDN9j8pdoKGdQPyy4za4pkpqtoCgnylIgaORyV75n/dNxEO/0Ck8taRvV/x+Pu7rZ+B3MlZkWIoGdJ+2qqqLgp3Yn92GUyesbUfOO8ZxE/drmHfmmiwUjPATg1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mdxs23ER; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mdxs23ER"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-824c9da9928so3826672b3a.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753586; x=1779358386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9fm8OjDakj3wm8FHoPAz9QnbfYJEtGv/K1EWte5dtk=;
        b=Mdxs23ER37Vuq1P8O/g6d/mJ12E4fUUTHVNmG78mPqjZBi1DEhmF3CVIGsd+KDjkWE
         4k1Giv9aohS+dkxZSRAcDVvmAkww108grzQzKyDkZIr0LaycWy4OFCawhz7BE+bm9qR4
         HlIkgs/CZ64KMlESLxQ6TRtFTwC1NeaUaZ6jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753586; x=1779358386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9fm8OjDakj3wm8FHoPAz9QnbfYJEtGv/K1EWte5dtk=;
        b=ix/Jo1u3A1o3FzEKmHCcCT+lJXeCad/jJav/f8NhrIx5QA1FvAujweVBo3HDDI1jpD
         STF8az0w3WBtx/c5mAy/REGPjmMIzRnAPLnccRc6hNsdujCVj5RLGxWvXdeDxt5YnfhK
         MAxZcCm0hDNyR92X613TJj3/FtAboM8+SrCVYKZOObI40P5r1mZhwhUA8eulZl2KEiML
         ey5WIfdSVDAYRJYVikdvdZoi5T94txNBxYbK1dj8GHT5BWZsMDC/2hu36Kb5q/jik6rC
         5PpD9ewRwHYVl0RDdfYDM0MIRsLfKfHc6tK4M0AJIjiwOyv/bzAHdjCfb5f2E+20L6Or
         NMEw==
X-Forwarded-Encrypted: i=1; AFNElJ9/RA3oLx8k/whajctV1Mc0Suq2GWDSvEtKuWvESQTKpWrBuYATqbn55Sp1D4ffUeuJDURMsVmbMzxs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy0lKa2oaLDA+GfI3L6g/SKPtrtvdyk/77qC7s2mcJksuZem6/
	ODbeJGKZUdQwx/HhchqR09W0mlgV/uIFGKRXsccH1F5JIVc4C0bmJhObfg7dl4O8TaxgdXAlN9n
	FS2c=
X-Gm-Gg: Acq92OGRjOfvblsdDX/RwCRaOMdhOqBxdQ87LyV7XSpiClvYSqteKho57pcgfjkrvYJ
	2ErEkjaE4V5yKRR3oBNGC5vsUN920xyePbT+bIvyoA65IZpnVyGAWyiw5rxzp4SaxUughq4JYEw
	jfme15iCGVlaDH6WzGmW0zoXa/F4mS/h01yzbxPi2KRgBQK1k9riUFNP94LHsAUMp3/1M6rVtgu
	1cL4HWiXCQNf4eZvf1TY9EWKaT522sfxdngGIin5iolxLYXUeSiLl+q9QX+DKSqB801R6YlicJA
	YRXxcbO9Eg6mMoQhoVRKiwpoS/mpNPMf+ZsSqBvgiUZ8aCo6/OogCllV+W62G3Tr2gq0ooglW02
	bWJt3tE9Cm/mHk7ECptgvxQ/E/P4yg/AtiAQqj0ZI7NSIr31KcKBu8ccOFuk++eUH2Ma8qjeOn/
	NxHw7eh51QNQIIwfPL9MvWZ0I1fli4LfmsHhLtYWkzp2jH2OertzZ9VJUYPNDMHr/ejAwTRSdzj
	J0r51sO
X-Received: by 2002:a05:6a00:e11:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-83f0431542fmr7743449b3a.50.1778753585633;
        Thu, 14 May 2026 03:13:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
Date: Thu, 14 May 2026 18:12:49 +0800
Message-ID: <20260514101254.2749300-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For JEDEC compatible SPI NOR chips, there should be a single generic
"jedec,spi-nor" compatible.

Drop the model-specific compatible from the flash node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 84b89b317890..3c8b4c2f6f23 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -631,7 +631,7 @@ &nor_flash {
 	assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6_D8>;
 
 	flash@0 {
-		compatible = "winbond,w25q64jwm", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
-- 
2.54.0.563.g4f69b47b94-goog

