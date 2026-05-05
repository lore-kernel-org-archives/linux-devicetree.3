Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB94B8DDD
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017596; cv=none; b=NY1ebcht2WE3Ii8cuChqEjN2xuQHsmaIWuJtpcTO8feySABoTAmFvwtkFPN4iurnkieboxotN6xoVps4LobTRNkVKQVdEyAi9rEG3iP2n5xsGqE2Hx4SfYtkQbNGHLjzSVM6CnnUIv9G+5MzsbMJ6GDTGWZ3Xyxc2lPV5Ojubwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017596; c=relaxed/simple;
	bh=DZKEanc292MoU5uFVUkAMMRJ7zjKboXEf5oxvifSHrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t98K1Q9PzT5yonxCdftJN/4iaR5x9cybk9zPXYUnXB+9TVD939FWl1S034lK7IkcKOMKB0POjxJYgSTMiKNiO0zsyoY/0E0u/bTNDy2bkklSC4d0UQU0SmV4e44RF57Bpxtp6sZbF8VXAWyo9T4Q9DjlkLdy3LUy6q+6ubccc2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqEek4MM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqEek4MM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so36488505e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017593; x=1778622393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJBvhYuyv/JdwansPLGJPjqYXoVeTZUEnpdVBNEj1Pw=;
        b=CqEek4MMjrUAPYiQp80urURuawoVLaqQL66hrMJcxu4tLxfzc7GKFscLt7egNyZMaY
         YJE1f5eXZWEnTB7yeuP/bUGQ3BsV2UQGU7QrL3EksKPEc7zCs2MWudkoP3OyghxChCbU
         v74qfPFG3L/pcu082NyCB8IKEE8KSDXhQD2cI3pUmCCteawNZJoEWbBWhhffAXdA4w0P
         jmqZ1Fo/KO4BMJ/u16QE0sZYdlkmvWjGFLIcPXIdfnc351oyozeyEiIYVQwFLFSCh90g
         PXkgWoKqB1RGKguYozJa4cYqfEtXLVuYRWXx4T7/Oq4Fd7UMMGlF9vPBH8FcYvwyVs3j
         ZpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017593; x=1778622393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJBvhYuyv/JdwansPLGJPjqYXoVeTZUEnpdVBNEj1Pw=;
        b=c/VcCrd9xk8WZ8bjIYFFUsuIEVFqX988z7c0tKZVeRxCd5ivU8MSUsGSNh0N/zTLHr
         FM5dn7ChCjSi4kNIV1N2dH4xZ1zZoC29QUbfHCu1F8rtAKFb0U5wik/DmMqygK4PRsd3
         mb37c8FrzgtwRYIjGKpMTZzgC7bSqp3LujAlMsXtRr4Zjmmuw2WY6SKHSmnLZcRY/7J5
         ED8UYNek7sXwnVrs5zS5ypqjTbSk0PmdRgD01GKjOPnr6G4EGCmf8kUK8D5De57PH3DS
         PwWElEsaPhBatwyJetI+BZGvWn8Hy4tlE6mid8J/Txe8KlTMU+AAS0VsWcAmJgZhkDnI
         n1bg==
X-Forwarded-Encrypted: i=1; AFNElJ+bE5wlC5Z2rd4cx0YToWwgsEuUIGnaD88/Czsp8YBd+paTUQqMJ8Zu7a9yhfB66l3vEDRPMfWeEQVi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ZhwLa6TF94jzFROFHOpNweCVAH6mxuxxYqD7tR4mIJsECIp7
	xJ5K2OCpkcvNNXobCSdB55vlwgvk7nHw4MprdSewXdeuMTnSFuqGf7N3
X-Gm-Gg: AeBDietuh321EuunNmE+npHyx+G+nSlMbo+ZIQ+jEK3UATXQqE5iEllqzD2Lkg71EGF
	/z0V1wOyOF+O6ygupkZRilzvjJAO72JqtVQd5EPfQxdvbNlSOepYvusGzzEWgsexXnN5GAQu0Ye
	wYRcs+PUV0qmTmxCYlZ8PWDE2nQcIl6CmdXCGonMcJEORMKTLBzBlk1f3Dta7n0tzK9WKJSC0F6
	WjewBEZZ3WCKV9LA6TB978NoRYHCSYMXauIQ4AvRSZ0F09cdM0KUeS5jSmN3P5iTzENc/ACBBg8
	wewHxB3+LeEJrf7MTzJUscuMSHaF2nnlMmMJPb/4AK2cQZ9YBi5G9Gm13vUEwqnpTu3A0+OUToJ
	ROOAl9XbmktQxBiQiCIF/URPrR+oKMY/eMSt0VCNgQSFSNnwUHKk2AqHaSzUuJf6kQSBgFI9OeG
	Hc5jPKRueH9in/5PRvxmgu4SfrflfvVg==
X-Received: by 2002:a05:600c:45c6:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-48e521e6090mr12630715e9.14.1778017593036;
        Tue, 05 May 2026 14:46:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a824f9f0dsm411556165e9.15.2026.05.05.14.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:32 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/mediatek: dsi: Add compatible for mt8167-dsi
Date: Tue,  5 May 2026 22:45:00 +0100
Message-ID: <20260505214541.333657-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505214541.333657-1-l.scorcia@gmail.com>
References: <20260505214541.333657-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mt8167 DSI controller is fully compatible with the one found in
mt2701. Unfortunately the device tree has a dedicated compatible for
mt8167 since 2022 and it cannot be changed with a fallback nor removed at
this point. The only way to get the device to work is to add the
compatible to the driver.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5aa71fcdcfab..167e33fef025 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1305,6 +1305,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
 	{ .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
-- 
2.43.0

