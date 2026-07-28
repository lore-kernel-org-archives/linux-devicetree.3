Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C2420476
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230312; cv=none; b=EMm3MVEx9The89IwSNK3IMXPc145KB94AiVAED/djQQ5UJhuSq+ofvPYbxC0h6HWtM0+Lowk+XTix8Zuduer+zZowuQSin3L7dgisMukj1qyYPWdcgalBNtpQINOMuSKqLtTyGX7AoBlWDoHMjrgobC9fswiK79JyMPYm8rNRRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230312; c=relaxed/simple;
	bh=aIFMPuRdmJNDMfcNywwoN0iQ5141uX9JSYiOoIkP3dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1YRa4cqZqwZzC78oFFFwFcMtiRrKhF2W+yDZ7iKMBqrqI6+GTx8tn00MFfcrX/EWbUsJ0FG01pi7qrdyzBsm+9ZEGLLB2R4NICgGOlo6kTjEcvLM6DFyyoWjgM4C65FLQfeAvNDxSV3zgpfOS0HbjmyoxX6gNk9CZsYvm43On0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fKDIGodD; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fKDIGodD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceaf8a1265so43659175ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230310; x=1785835110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=fKDIGodDmCiUWxnhOocxFne+yF+hl+36GD2rZZjgY8d7hvScNE0Ty06auHQjGtwoZI
         Pf9JLBh0vbfPVKQi/4qx0+Jb3t3zoxbWiUxM/gWZ3Yi1pAQbxosjPyWqD81AGlUeKVzm
         wuK6X2JzVlt0Cps6uDoKolfwGhlGq14OHJkTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230310; x=1785835110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=LKX06RsT1x+BxEeJYZWQXyXbe2ITZo2mliDTscfYI3xxtpEkw5zkujaF4gHhk9aMtY
         Pnn5BdeJ9crEVfcgX2mG+cvo9apx/tinPTRKeP8YFqRb+ZhCxwSskC3DgweH6XuF8PVA
         ZQZgcx9J2DRe3122WmOxOOshPcC+T/JZ9KgHVZJyvT5f2Ke1mJXzZ28vcd8UKE5HPR9u
         jbyU44wawukaNratuZJHzbgL3IF3w3eid0uDSOd1/QpPvU2at23iM89Ai9BJjTK/qtzb
         MvKeJ2X1HpJ5uzCqInrWsQFLkpkKXY58P5YFEDtBRytLONRdgZ33j29GiSI81/fnWKdG
         cS0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq28GG9RU76vLZCoMoQ7/9/eZxAvR5Om/1jUK6M59cgFI6Az7zBNoDsTDw+d9k+NqyELqK54WAQ8TCG@vger.kernel.org
X-Gm-Message-State: AOJu0Yznqp8AHMWiwntS+W8145skLN1ssBMyegoRszReNFp1t7GupiEH
	lBZOk1DL8KUYkmhdn2UjYsLh5Ekgk1nYcOu6klNWDdMeDJVfXs2t9FzBQPFa6qFrhA==
X-Gm-Gg: AR+sD10Sw3TC7NndRerdsKjm6t3KVebn5wVUK6Z8KBXs04AGRfn4HfZFeQzc/D+F/zQ
	jo9w5h/W8m6RfxJ2yUVuUg4ce41NBidX0mHOALIu/dcm0QeatlFimivAG+GOx0iwLqZeChNoPY4
	bvn3XYdK39P8kCDdtP2BfDSnGQLLccbBvw7dZ2NJX67KqNFr90B0E48Q1uOQLjlKDPdJ/YOYsQy
	drGoTDW+LsvJD/KVFJirmVshvD8F2hIwtIDACH7eYpzdm/r0rVV4EGAsq8ePzElGysLd8GWbPFa
	0kTRunRFc4/jgcaXUiAYHkxVF9A8FVMF8+Ul2oF+oBcZVYECriquOUGyjZtGiiBMCDjvVY6YTna
	6wF07DmKZaFZ5YNxeF2wXTereRtuevzHnVGes+gYiVgR4RZptq5L71USLadEmnlNFVHw+vCkoHP
	4VlZ6bVWNzY6E7gz5P6o4ku8kg3kqDz9pnVYoE91E8gCgbmcTE1kLyc5797YvBu4mgks4S3BAKn
	he9TVSw/hvIPpSqGD3sMlg0rbPvYUSz9wgKKjvD0sk3Tg==
X-Received: by 2002:a17:903:124a:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d015ace749mr18293065ad.7.1785230310643;
        Tue, 28 Jul 2026 02:18:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:30 -0700 (PDT)
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
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Tue, 28 Jul 2026 17:18:01 +0800
Message-ID: <20260728091804.382753-4-wenst@chromium.org>
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a6bccb600a57..e9218e0f363d 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.55.0.229.g6434b31f56-goog

