Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640D47A860
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754273; cv=none; b=R+22cpkTWzoYHGsUf83QhEXMKLk9PS/HFK1KCbCAtdJbjKnT+imXrC97TRM5QEU2Y+CJyHWfKQ23IAE33NOurxFiC0od9P0sdgoBY5MRH/LU02ivPZH71gJzNCr2IOCJ/Tt4tfymM7f60/dh9FeF0G+EIQ32DXF1UxYXmHzKesY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754273; c=relaxed/simple;
	bh=Ow7Rwd+Il1QpdirFAZCaeWZNs6hGeXrAUZB7iTS0DXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiqq3OdyyYRw5lXh9hZL0kTDRlDBO3aVm/twX2S1M72kCspGdZ4z+1gWxCdE5212uBZLVJ6MvMGHtO64fookYcAzYEBVwH8Wh49eY/Ddp0vlwE3NDLuUKYd73gNr+EPN68GWaz5tChgt5NPqq78p0oCOJ0L1ScMfouJ79XaUSbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFU6gfJS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFU6gfJS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so723154f8f.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754268; x=1790359068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=;
        b=LFU6gfJS4+nUCtUjGxM0oiYO1HMiNaESrb3YYvpGVKy5ikouc3NwphQUeF4c/92hPK
         1gVv0y5OHjc5QSHZhRW42FSaM2pJGOw38HwKGxBrzDYsWDRldQfSw/LBFi/QRxW3D/tG
         BUShc3q9FBwef0q1oeKqvCqD+awbbFTiaL1r+4vh9iLU7CsQ9JUSQ9gOh4s0gETdX/7x
         E9M+Y2yzYdiYsklFWj5pQQt2z+25CgnSra7A+egV04RKMbCHy3OLVvVQ5tbXDqToTA7I
         w29sSBrRXQlsDvccSZrLDL/EJJwuPg+WMiL7qwZmIWjlIcrhLg3Sz4KE2nh6oml9R6+t
         PtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754268; x=1790359068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OQlNCcXAkK+hbxqoynuSjH/ynOWBUHLK9W984JsgL8=;
        b=scsVcTM5i/XQowb0pRtZ2OAik7mWzMhD2ajeEfiUwragRrXoDG0fIVKOGYk9Jcyzc3
         vJ9gkQsuvezs2TY7D9GZfj7L+8lNW0idh6SOjecIZOEQMxi2kA/tbEYnFPTuY69nvQhn
         dxiuZ5OTsVvS00WgTBEr97SRtMN+Nbm887G0WeSmJ6vlElVuZA6KbUsHJ0TCVjGq6l14
         7X0hbosHDzfKietY93mFk44q6PRnWeZlzZh5fNugemJt7RgAIMnZT7Tbqxd4WsOLRppk
         +U9q9+ytuZgdIGZ9Bj7TdlI8fdG/zU9vLOHu+0vEg88ukIiNIYuNVgO6Nc6dxFhrMgrs
         bEYw==
X-Forwarded-Encrypted: i=1; AKwUvBwlEBqeJBmDBPUENIE3e4rrv4xni1dMG5y0vAPvIXjg3YZWwB+Qms3hgwaAnbSXXWVXkosaNRDE2hdO@vger.kernel.org
X-Gm-Message-State: AFuF++k04wLqGVh3qqQXIxpGYHOILEfdtNsy+neUlGe2Teh6kHVW+ybq
	6C8oXA8sfD9qcaQy5rsav0Q/wbeaU8PIzHNWrAsmTDRAbrS8o7JFbyPx
X-Gm-Gg: AYBFou1SMqP6G9xdl2ENWjIGfiY5B4GhuoknNMfQljytJbJ9VtHUrLdnCBItKUzoOW4
	Ny3edmMF7Ke+EpexImOXdgxW4Mxv3GCJKMwFaiBb3vveQh3haS/en5HEmLtz+vfvVScENedrOSD
	8dDCy5JEa268AbX6MGqSJDgYRqGp06MSyRr2ug4En+asoBYzjF05p/YGhHYFsYVKsj4PMRk7AV/
	7By9eAir40hWYmN61+96lYU3IP9kRCiAhaYbf/j3q3lj+MsT46iMMG+W+3LJK6Bzp13TuKVAAwd
	9dLCB54pRSNPjvbDw7Q9IMN4X9eJ+D25TwjscriYJKQ4ttVPCYuZx6404pXRi39hNVUQDEq6fsN
	NwVmkj/yp+HBzSeNOcwvdNAndoPG5xJzO3imMFn5GdNIUwIysc4re/HJSqro3xUPXfFVB4xQ3AH
	IVWgkGlbYTsdg+x5ZPUlKoyeLTX6QVPngXz1xpjx65uS9ez88mjlSQOcYBqfZvNvSCS/U=
X-Received: by 2002:a05:6000:1785:b0:486:f282:e66b with SMTP id ffacd0b85a97d-4871e20f97amr7779772f8f.2.1789754267647;
        Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Fri, 18 Sep 2026 19:55:25 +0200
Message-ID: <20260918175736.355305-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918175736.355305-1-l.scorcia@gmail.com>
References: <20260918175736.355305-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
one can be routed to a DPI display while the other is wired to the HDMI
block. They are not compatible with any other device, so add a new
compatible to describe them in the device tree.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..6cd96a5cd4ae 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - mediatek,mt2701-dpi
           - mediatek,mt7623-dpi
+          - mediatek,mt8167-dpi
           - mediatek,mt8173-dpi
           - mediatek,mt8183-dpi
           - mediatek,mt8186-dpi
-- 
2.43.0

