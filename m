Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48659303A35
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 04:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789531212; cv=none; b=CphmgDXAfPp3+ZEpA0uQobHTkudkhVQtpOzLAcnj3DNPEoUTu2aUCVky0iehHvMGPBHsXVEn3j4izcfVg9SgROttCTEU+nOgw+W8Rbferk59PInh7QWXIKSly255MDJNy+Agw0dsyo0g+g4o2hZ1Hk9VoqPNpkMuP+E7LQ4K4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789531212; c=relaxed/simple;
	bh=V3XOtPw8mvE/u1nZL4hGnQ0ghex2V3k6k5tNy9Sdu50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=raA48TxKIFz4SSkJWuSej+tGk7l+0Nefz6OmOJkzIGylBEzHVW6uRKbfGJhnvYxVlqoIshoMLX2l4XwzflgR2EqSY1J/4fVOi7vhxedIQ7muV6/pKYEveLnP7SI92zItc0be/irlP1zGMk+XS9PkrW6Bem7XtA0ym3fjJWkYztw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lbNShW8u; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lbNShW8u"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so311477a91.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789531211; x=1790136011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=26iBpb4QpSVJzFjDwMEtgMp27OAl8lT0VVg/30n4/sA=;
        b=lbNShW8uMOQ51TLfMFt+etvLbldQl1vWVhdXQGAg01RVlHYFDFr+Xj2imQAUqX1GA5
         Lmm+o5nNodiVDB+le26jbLaTVHIuxFS7SuHMCokA7dTQuCdJTKg0kPa2zp+kWpCn79et
         w45CQy8IhxJ3XgYS+hqRsX14NrpjQj79nof4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789531211; x=1790136011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26iBpb4QpSVJzFjDwMEtgMp27OAl8lT0VVg/30n4/sA=;
        b=FlhUJgsPnGFUreL2I06IHlFKN9/sQbA4CnNNYkz+/fzHaYJ7QXYvnMkY53rPw4qqGc
         6L3q2Ie7/dVJ1IhTSzBFshstZ6EWQrcgHlpAV+IwMzTrbzyD9cy5pFchFntVve3JSpWZ
         T4uSz2R0cbxq0tzRGtyujrwqhJYjYB5wIYRW3NwVmExMX8y4ngwH1+7QCdSyULBgrVim
         wE56Og5hrTKwCVMmdbtsc9fS2X9YitGMd2pX2JqJ5qGLJSUJ/MyQPLBoT/E6s8xpmkKY
         ojhIZbuLkaM3xkDBLtb9a4ky6mItNZZA+qwIT8T9OtQ6kmPSr30rtyGmZNmfnw1MeHUM
         1yHA==
X-Forwarded-Encrypted: i=1; AKwUvBzs40aoSRiDq5prAB3nY4D3NW9rWgPv8HstV7niOHaGVl2f8FsrQbFIviMXUxaFg3z+L/mxfawCEA8s@vger.kernel.org
X-Gm-Message-State: AFuF++kA6Xs3NNMddDgJg6202EG5RSd6mk8z2Su+Ngf4bNQ5rKzh9YCL
	XOTYHYozCTJP8AhT3Cn1AEGucOjUGw/G6YzSZoDF7CEQd9pM/Gqmej7N1tYKU2mOVg==
X-Gm-Gg: AYBFou117IrV5bWwJI3sY9C88Lp9wxrIybBJjc7davKo7s9TctImzOUccrkWt7JqqfL
	YCHP9A9mQGXsY1Lu3KLFisT4+t2m7tEhNvnWrRE28BH0wvAn5WaoSnfnDP1Jewty9lGkvA29iZi
	vhVdc6xF6IejLGMVlmXud5lxp9fw25jURSNk8DSZqtOm/Ve4yetZF3E+Gu+4XQT0kM3F3rrr9KS
	6XSgJmEzukrah2bBypwlFyDgCQ8N5KMv76I42O2Qpv3CA/h1gDWmt2fySs59kAMWvptko/97INr
	eXC52NsKNHKH7p8FQtDvdcIZKAGLUeLlG12VyJzr6zO2NCHXXU5MoCOOCiejo3iNCyrUrpylhT7
	uKZqc4EpZwbnstTYnYgITZBukOFEk2XxCeHYiC7giKCBnyH6ZtEJ9GeVE+Z6Zd3kgwOMI0OpB1c
	bp0SWCV4jChmcc9Sqbjf8cPHbXgkLZ55giOXJdU4Ns9AEh1XGtzzNaDv9McSDXSgT3u09/Q1bU5
	/aiiYOFAl5HRkLV64ytVAcf9ULj9u+v0nhqsJtw/mQUJjB5DKwsMNA9zDUAwqK8AlFt
X-Received: by 2002:a17:90b:4ecf:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39e1e49a802mr2704118a91.16.1789531210421;
        Tue, 15 Sep 2026 21:00:10 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm2030139a91.14.2026.09.15.21.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:00:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH RESEND v4 1/2] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Wed, 16 Sep 2026 11:59:51 +0800
Message-ID: <20260916035953.3111607-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
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
index b78dbedfeca8..e75ed4bd458f 100644
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
2.55.0.1032.g73a4cd73de-goog

