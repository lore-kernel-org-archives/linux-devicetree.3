Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9834423E97
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230317; cv=none; b=hN8gQIvw8JgdMPilGzqnuS8mJpt8r173oFGv6Zbu2CpHQeD/BA9h2KAQz+X1V+YuPZ1uylei0Qdh1n0d1Se1cERHgGbS2LvxrngCTvX92CUFJIHZvFDujD/pwQ11lchHqblpVHUDaKfBR7qqEXtVc/7Ug6dPgB2S8mVSCrv7EMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230317; c=relaxed/simple;
	bh=yhY7mLjZfGOCMMgNPHfCV2Pu5mgEkzZsyZuduXNnUDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FT4Lf5IM7BhcffT6gzZsTglP3Kgk0bqLoQBY8jhv953QrgLxUb4OneiH0zT7WLGsGPYu2CK+UW/PV7pfxjNJxdhU5b6mUO+f8+xfPV4fdI9xmxdcuQm7gVl1+j3sgTq8KqVl4VpZHycHDUH8OvoCYF+lkA5KTTgjeipM0PiY3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i7v0Ew4m; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i7v0Ew4m"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceae1ed204so39407305ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230315; x=1785835115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=i7v0Ew4meJNgNnTbQUMhdPeZp2uWzz/mQ5qdVy7NtRNnYqn5qeHGjqAnkBX/ZkoQkQ
         VronlCISSWrZIOwCVUU4MItur+fynTB3iW5WcwG73alCnI+CbAIevvebO6DbSuorFjYo
         2vd+DVrghuoasJ1wnuLJzqrrXpX31v5ErgItk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230315; x=1785835115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=TLxD63ns429gxhJbtOnpZJaKZy6HtBtSj2s7CR+duz/s+SaMClujrTThkVTzixpVjs
         2pfnhgCZJLkUAJzuMQ1wDWQo9jiqufPlrkHRwBR+5/hUO6a8cEFL22NMDGhPrj7LiUs9
         QLsAGmOsmKvxkaoDzdvjTO9Rfpr5Hin2zHSGfMfGV+50n/YJXwTN4FxmXbudUoushXVE
         8Z04yTIxvi0AiUNV1xCJlI6oWZ1GF0H00aU92teLC6x/mhE8tvtYQnA2//YcCVyXfL+G
         XFS3ZxiGE9fSfqofrFfx/X66g6sZFgerhuCXJPeFxUWy0dkv/as92J9CSfDIhSBcziaR
         xyUg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc6HNvYAwCloSXPc6Ypj18Aabju4fDu3F/pwGyyt1VRIbjrPlb/LCsM7q5d9LJrkwtvY89sxW2GSdz@vger.kernel.org
X-Gm-Message-State: AOJu0YxTeDoVmNRkwGdBNWo1y+2vF+x2MI1556dCTTtydjhX9RbvBrE5
	34/9Pe5MfrcyWKiPUnuJP8WTmmJ+d9lyk4E+qifsAMcpplkZc3RWOSTQJjp9Jz/P7A==
X-Gm-Gg: AR+sD11PfhA0zOJCaapJeHYA1XFO6m59mQDsrBDPjaUn2gPvOmJExLrR1VLTCLOZ9HK
	3r8IPo/61FD+0sHOogwsBA/kv4808Rr7wZfQvuEGIKM4cvQgDh21kcZXXH8lLcl/xqbCV3Vlbbe
	LbiJLmtX0iq2BZdfiKocN2y5n0vEAXzgxe5y60A28IUPxmiCjHPc6f3ReJ0C+gpHtrm+q6HbssA
	Ce9PE1G7uafVNf1wJnfiNVLZmM2abYQ9k3N8ngMRQD2wFNm+F0NMCYpSf7XOky21536Sf3O02jF
	37WhQ3F8JxElAYzW7qDzGfx8SNPJwQosgDWGxT78wKIcvf5z/8c7NuLaed+rokXxASCyHpgZQhG
	UPhOWUZFR+qat8fsi2f8JFU4Ezqk+DRzOGktZw6adRkiW8oSCznwfdZyUKhtjQMxGhJIVps1nMZ
	DgtJDptQ76vatcpdnaM9VfnwCbnjfOvSOnSy1fewkoBKftVTurtaN76WN+IAg=
X-Received: by 2002:a17:903:8c6:b0:2cf:6f7f:55d8 with SMTP id d9443c01a7336-2d015cfb0e2mr18391495ad.37.1785230315142;
        Tue, 28 Jul 2026 02:18:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v4 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Tue, 28 Jul 2026 17:18:02 +0800
Message-ID: <20260728091804.382753-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.55.0.229.g6434b31f56-goog

