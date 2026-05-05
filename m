Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE49540F8D4
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976068; cv=none; b=h9p/gaI6cbo5Q+pUEYvMGJkOOqgoYY7C2gTPjzmLZa0UZpk4LHX67V7R76e1A6Cu4/ndeaJeYkgtxbgseb3UivCdKnWGeFXNM56bAptF3W+VSNFbSTrzWbHzvxBMKxHXNG4TvFPXZ8O6iYP6jDW+YzkeZ5q+96qSLyRoBHYJQ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976068; c=relaxed/simple;
	bh=YK3zSo8gzrBJ5mnzucLhNVu7KP63kMPpR5+3SR1j1xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOXgRfyubIBV6wRBKm24m8+u9Y5WtL6IeQiO0DgQfyQvFvo14T15mhxqqdbODdh8SlE/3kJ7FaTQ6F08Y/zLEQEd8RRm6XO+FnR/AagwtHcEkir4+o3qROa4sp5laB9Puo6JBelHOIJn75PR1pT/ZFdXbuXYfxhVTO4RmbKoIXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iez8Zjml; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iez8Zjml"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1876316a12.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976066; x=1778580866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jHQUJgJrR8DY8rxB52JHUO786dUwTkd935pxJWft/8=;
        b=Iez8ZjmlooAAbKQA0sTuExXYXoAC/Tr93vvPFoNQkGCjvKmABmcxyIXmtfUmiSArS1
         Oh+Zb1mzieO93zPtxceom0YLfKYT2V8VBRIhelgJofs/4e898iQeyAYDnJtxYNOhCO+O
         SziOqrTwSTb8B2d2gyiUD1/bZKGEVKySIDCE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976066; x=1778580866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jHQUJgJrR8DY8rxB52JHUO786dUwTkd935pxJWft/8=;
        b=JrQzW5I5qPTFaFGSpn42WS9VRxesoZj+ktr5iQShkaUY3MyGYcVQtbhDLzXHw9pnGs
         AcbbRfbpAR9pL23IRlXb5WhDSFstJ+ybYurBZQy6opfo/tWjlKyM7yMIetYMklabKt/k
         j0CGl/u68VwWHNS5tAtM3kstN7r68mivM8SQ50h0bnwWJstB72Y0Z4toXVJwBoO/GdPV
         uvciV6HZveh3ry28+HF4k8zQpozQfTep+XaTis+QWpXPNiWHxAD36GFIDxrHXMBzCmi+
         m2pysxPk4K+OnjKfej3dkt2/o8f+6byYdTE5GT8IzJT8TruSrHam68iCv7U3N1rPvG1B
         IOHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LsbBKZgTBpw0kcgvV7EHFymA83q3lq6ZpJhnobDJlaTaBPW0to3LfG1XGHwZgu91vU/kPJFNfjknY@vger.kernel.org
X-Gm-Message-State: AOJu0YwQS1iZpN+R977tYnly3903u0/AjgwIc37saSCSaohRVOy8QI78
	RBhy3ff2eDofTSDZ32PvppNBumJPF+96zNs5RtmgPFT6fliebIlAeyHdY1lHlkr0MQ==
X-Gm-Gg: AeBDiesxvnTR+esywIqsgz0WOk/t1nYrXMoC/Y7HR8ZioaRWbGxfC1Z6vVRE7vduTca
	oYvqvWWH670Pntjq3zBHKJ/fmVNcN8UAgi+3hKrJxSTgTli54TyNNinizvJknukM3xygYILDepB
	gJTLLnLEu2jnAO3p6T28wDH3VCFV6QI9AegbsMQw6dETYLVOENGvmlCPo08tQ1WZb7PA//2YaCL
	7sRiI3fCyHx8BGBw/Ylu1UnofpNEuhAmcOUk74h4CLvPlE5gxMmlgzS3uiPPjeRpClf42y1wwqw
	yc4OBA2JRc66Yyxir6BUZXpEcmslkLURWgBRiGUs8wYDDCgZqc69G7NOQKDSEC5Ry0J5jD1w+Sv
	irwdk6flaqn2HB97ESgNuMriC0gfW7okZwLW9I09hzzmKZm8k2NOYyezqudbQl8Nelr6qiWjyfd
	PK8uFBpMhT+E19yczZ3pd8rZ7cIy3UqNYEFzGtoJKOyUUOXG107xqoYOUiHJQqTT2sZMOR3lg3L
	K3w43eyUu+8aVnvtjI=
X-Received: by 2002:a05:6a20:918f:b0:3a2:d79c:415d with SMTP id adf61e73a8af0-3a7f1bc3679mr13967471637.30.1777976066051;
        Tue, 05 May 2026 03:14:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/16] arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:13:53 +0800
Message-ID: <20260505101408.1796563-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 .../arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 2e53c1bacf38..8054e2d20bf1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1440,6 +1440,23 @@ pins-miso-on {
 
 &pmic {
 	interrupts-extended = <&pio 214 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_g>;
+	vsys-vcore-supply = <&pp4200_g>;
+	vsys-vgpu11-supply = <&pp4200_g>;
+	vsys-vgpu12-supply = <&pp4200_g>;
+	vsys-vpa-supply = <&pp4200_g>;
+	vsys-vproc1-supply = <&pp4200_g>;
+	vsys-vproc2-supply = <&pp4200_g>;
+	vsys-vpu-supply = <&pp4200_g>;
+	vsys-vs1-supply = <&pp4200_g>;
+	vsys-vs2-supply = <&pp4200_g>;
+	vsys-vmodem-supply = <&pp4200_g>;
+	vsys-ldo1-supply = <&pp4200_g>;
+	vsys-ldo2-supply = <&pp4200_g>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &pwm0 {
-- 
2.54.0.545.g6539524ca2-goog

