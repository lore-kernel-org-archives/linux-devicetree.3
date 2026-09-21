Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E174908AC
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990771; cv=none; b=hlh9yk0m6UDmCxi/IN+ZAkvzQQGPaEOQTMgG3Rimix0zcsQvG5hbqk47SjOeQbP+KXGOJCl7Bd5DlTz5WJDrUucDtck3FF3GY3+3MpNQ35OXHL0f+5dx9zUUjYcs+YIhQu6FJcotxn06lHBq8aK3dhC5Vppt14mmCMWk7URwxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990771; c=relaxed/simple;
	bh=m9Mw6P2oxGsZ1t3n45KlrprqxCXpJXI0GfeDIMpOA8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+NBVuyTBMrLW9UFiz/rW4DqdGYyevEaPokP4nL7XAnAM2gSZgoeqwhKYsj07LDQWJEKRwjoTIxCKRWUkpn3zjEVXB1zqLELUORgH261mfONHiaE32poY8O+g9GH+v8WmttimIVJlDx+4x0hszZWgCjjHN9HBEFmdlA0OM5pKyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnlOrPRw; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnlOrPRw"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2253541f8f.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990767; x=1790595567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqNF5JZ6UPtOMyOPCzIVZh05aJF/SoOQw4MLana8W40=;
        b=jnlOrPRwB7McA7Zj8g0IqnSDdqub5HRewI80kpCcP1y/jb50SV/KfdUo1NB123ZtI6
         jT8RgaImmJ9+XYC5tOAQ6E+hL6Pa5P3G34UG+cb29iuvSIN04LrTEbw6j1IM2V1zdPfT
         bQR1EoUDnh4QRzML9plPlgBy90xYXuVtuqPCpuSeF1ZkbYit56RCtwuY0GA9ZLyPM09D
         L8TxMvYDubqd876sDSI0msZOwmHS1JC1lpCha06WPF5bPR5WX9sLhHP3iXR65IYXrHwg
         i9U462EJe8CUa5VTsVs7wOgHxVoeL75eywuSZJRpNGbpfjtfUx2r+pEjb/xjz19M4+nl
         wCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990767; x=1790595567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqNF5JZ6UPtOMyOPCzIVZh05aJF/SoOQw4MLana8W40=;
        b=vPJTqaSa6dLEXqeewiH67/SH51ssK1jvx483dskLZlvmXHo9K3vFHuo2j8kAR75d+L
         GbnuAny4hSM18jGKQJcuvzFcPVGdsKBYJ9bc5J4VAoZdVCkKEiHdhRP0VW1PfN3KE9+T
         HTdwnRSlaIPLptQUHni0OUZJmpBS0bcIChi/EPFU4mROrv9sIMaWDuxVq15pxiJhWUE1
         LE4I3get4q8NQ0CGjvQburlvPdPfQ5GW/h1yET+J6WJv1APDx2fgPr05E2sOvPpFt1Dd
         XVMKdY/CBmtjhbrJyejUXHaa7s6JnJcbve/Bz2U+g5XqC5tr3BOAcIWgcHojPEczS2+s
         2PYw==
X-Forwarded-Encrypted: i=1; AKwUvByy9cpjHSb/aBc5M7uh1S08PGLCd0QJBgclNfZFvg7GMO+BMZ33tnBQD70n1nTk6RDb3Qb5JT4gBgax@vger.kernel.org
X-Gm-Message-State: AFuF++nag8eEtEht9WPNtSmBF4/H1XCxZzb74q6XkytpUZ8uDsPQbKDk
	8eB2/AN394TMerrob8/RyZYnXB66aPbk5A4kEraW4xLnAVY4H6+wCadc
X-Gm-Gg: AYBFou0JkSqK3OcDSkjVlweMGnSLRPIaz3m05qeUXW87BsBosBlhl5TD/5qXhrmMfaK
	jt+emBe4F4mIGCIEF31ekrppeUKZlfnprMAfxcFCjn0ytbFnAFbdD4OCPm2tIUKH3UpJB7ungJi
	VYjtT9enU/ZX/hfnJ3dUbLhA1av6zg4I89g1L/MbHDK0ZflDooK59KCjjGKRdLD3pcoYSPogwD8
	DWSohuFQb3JuFu3UXPlhMkmxCW0f7+9olx5u+yfuuLnzDQXmEgzVU1M30wcW9Byg/Q2i2jV9uVw
	HyMMV+fD1vf0DMWnFVXtQimrZGesfNXPSq9oyrI/QdanFiPyVV5LyplDwT6yk1dyl2Bgda2SSB/
	MMOe6He7Iqg6whL6GfTzkci6yYgwwnMkp7N+nk+k/RetRVrARBGynQWcHHYeyk3gQarQGYNGWjT
	CHAsozSawfvM66XVnOvAqwygd6uiCYT2+VK9EhTIU4vgxxeMIH+rBT1WXLmIVpFdrQz7c=
X-Received: by 2002:a05:600c:1c05:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49fc56af038mr172418205e9.13.1789990767340;
        Mon, 21 Sep 2026 04:39:27 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:26 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Mon, 21 Sep 2026 13:38:55 +0200
Message-ID: <20260921113914.779393-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921113914.779393-1-l.scorcia@gmail.com>
References: <20260921113914.779393-1-l.scorcia@gmail.com>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

