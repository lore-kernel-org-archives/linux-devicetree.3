Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5543CEC5
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976106; cv=none; b=XSbrmsVsXUG7gaCST+7WlBed+uQcsxTu86ceG0kIbmJ4JBhoYmFcRqHl35/jZJZ0bVcb0b7ygu3G7VJtlFrInY3rFjArklRJ0uufnvLwwWbq0yphW4ErcXZ5mJL7yHjWWKbMk+zvo4Layn6UuyBDiildyp/1fhQzORohhGAYfuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976106; c=relaxed/simple;
	bh=Xql/uX8TAdN3xnADnpPNMVEpddtMrNDkEa6mSsu8y8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xfy7d+mkVzDiwzQ/gK8xlQqOYuXtWtbE3ggKImG6f25yeJ24sPw5ywU2qPRdhxzDfWObw4EHlIbx8Nbmgw0ft9j9bEsnTcPwSG76Sr+S2ATqyfgTQVq8RQTSj9kZq2o4mEYV1ef9FU4q9AXECi+YDRHm++EJa8MCYGmSwbGPA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JhCUJuZ9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JhCUJuZ9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8383fb7143aso807718b3a.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976105; x=1778580905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=;
        b=JhCUJuZ9d9RHwyD2nNPutfuSDixglIsTTSJBcHq4ZerzIbQroJset4mq7b2ErxO2Kb
         hJCy50J5aL1qRET1RcK/kmYjuGes7Ptv6nDhXcRBNNKrsWq0/tTVqna56O807pipl7sa
         e1yOvu6gEAU6q7nM9GhfoHSzSJH9UGOpXG44k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976105; x=1778580905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=;
        b=DfN2+ZTOBZBkbjyfQJvFEM/01aD30Z8dgXfbrGMR9JLoE5OPJD+5BX61orvWnWMKlQ
         c0oRziwvR0rmK/amH6e8WusdY6Es0Ia/Eb8/LeXkwH4KXoHPVyiOLJ05iIBV6EIuOl6e
         VsihjGBmXLJqcEqhjDz4hKnUbmSzUlkzrs+XAPi4o4WdMlLXuwW4T+8pLKzr9kGv2nV1
         k1qoxPAqFyuwzwBsfE5qYNTjFq9e8Yfm1EUhoIzEf0gxuZDPwbXb7jtnAaO/9n9S9G55
         OBjGYZyuQimk/BxNxy9yFx3FwWqz+YYEE+qnUf77/Qy5FcwsaW2MH2tbUv2b6XVX97zk
         bprg==
X-Forwarded-Encrypted: i=1; AFNElJ8Vk3wqrZGe4nKY2egguxlZKTkTxqe1gGAiBF9vNKkBm43NQaKvYgiYBD7LqtgqNkx4n5YO2piNZbMB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/NVdZQw9XBUfRIAEDMzLYjfEmGxKm/1s+Ol6a+jQNx2m5InyV
	SCbRuqlSu5Wb9rbPQ2LfhFSOlmYJsHrDmhE7qgf/I3kZj4PdGUdjbnCs58w2YOmK4g==
X-Gm-Gg: AeBDievUr3eG8jCyR8nfDlYW511dkk0v1AULPOKE8EgS/ieQd41CAvek/XFbVQtGvlf
	yCXT0YPXP+Dc7dLG2qpDEuScgmO3wmKbBYJG5IcWUZ3p926upuOneWnu3XU/GeakS626CYjab8t
	6QKUaSh6XzaiTNXCRZB7GG2sFBkl8K/NwtIR4PvB9q8mh0Ph6xQU5Wa4mFlQGOvAitf+xD1y2db
	Lxon+fPNMWUfb4KYh8iYAOAb3QtczRYD7kyqurbiMFx6ycLSyKGIfhZQ2bKCMEItUkEbOqYMVGb
	nkiggRRmcANvbzoXJYLZhx/o+EnMV/OMakx/SguShIHZBH0/E22mnwJvIgQmvd4YSiXhLkOIXP3
	kLW68XusL2qWngWcL/Lr7/NdKb3l9G9WggpUu3sDYWtiZLNxs52Sj2+1dn3lD4KYNaMy67ELIGj
	F9R89Cwr4VGE08rY9GHZRau9mIqJjtOyGBlyzVjhF0kvWrcSxmCOXVsX16I2jEqinPgBBKUKA6F
	8RSItLbm+l7awmph6w=
X-Received: by 2002:a05:6a20:9143:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a7f1c4a82fmr13892686637.38.1777976104687;
        Tue, 05 May 2026 03:15:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:15:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fei Shao <fshao@chromium.org>
Subject: [PATCH v2 16/16] arm64: dts: mediatek: mt8188-geralt: Add little core CPU power supplies
Date: Tue,  5 May 2026 18:14:06 +0800
Message-ID: <20260505101408.1796563-17-wenst@chromium.org>
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

The device tree for the MT8188 Geralt is missing power supplies for all
the CPU cores. Power for the little cores is fed from the MT6359 PMIC.
Power for the big cores is fed from an MT6319 PMIC on SPMI. The latter
is currently not working in Linux.

Add the power supplies for the little cores.

Supplies for the big cores will be added once the issue with SPMI is
resolved.

Reviewed-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index d57e0eec676a..4cb23595d17b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -217,6 +217,30 @@ &cam_vcore {
 	domain-supply = <&mt6359_vproc1_buck_reg>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
 /*
  * Geralt is the reference design and doesn't have target TDP.
  * Ciri is (currently) the only device following Geralt, and its
-- 
2.54.0.545.g6539524ca2-goog

