Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424336;
	b=oO4DKHpPd6NFcCmdqHUSNVvxRV9WhU6M2rOYChOwqU1fG0OJbPpK5gUpmeQQUKxuxcPY
	 YMmiJZyb3t8CNUK5WE26DO0m44AxECpmA4WvxwnKs+a0FyAkMmoAwznn6wv6CxQByAol7
	 EPN1hog1jd9gls08l12NXk9tK14y9wK3kijDbHbVDsjHiga8l6c1AgLSfRvR0HJ/Qw8Yu
	 qsXcY9mWYZ9b6LRyk2k91pjEENNYjiVYdBHvhY8jYThUOBqOlVHCfEH4hHBU4SNz+mF4Q
	 W1RokOmSTq2AJ/F72xroVmPJhuSeaGBFlzGh9/+OCRvXA61zO8LK4qYavevIFL7nG9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=;
	b=w5pE+VFAVna9DtXov2ID0IVeZMAyjGPzxc7t3E0jZ0HeVUVrazDjR8g5zAdVzxXg/xG4
	 jG43uH6+DOiJsPNNMwLNffk538JVQ+qKNSikFBw2UigUoo/kQeDvzNtDcYHVtbVsz+Ilb
	 WmKOsPNU/aJ7E34QvKL06DQMlAKWM4BdZ+WCpiC9q9c1Hha3CVl4Z+gg1QXEaGhmfFPEm
	 E/CTuWfze8Z2Vq+4HBDrs+rU7rAbVMO6wKmAVlm2b0Qs60fUhC3V65jfT63aVlS7kcdyO
	 SrVtIfXHcWWa/70+DwdCp3+8BvoPhP6CRYw+U8TDmBAEYrEDP1TP5/zU5qOJyfxW0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ba8TENrB;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30318606A331
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30318606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ba8TENrB
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso21050395e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 00:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424334; x=1796029134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=;
        b=ba8TENrBsjirPDWfts90pUDcL14i9TR1XCG+S+Tfh52l3iwLA8bl+Yt9U4knjgpAED
         zl5STchzMfkrtpt5ovoJmtjS6AwDkqqFTugCW8/6NWNGwpDvkmN3DQ4mIgC3qthroXBM
         5kzsoyw1RLr5bveGAHSfJQWFNWbdN9L8YB6s8fExRgHhQRx+/Zi5irO+B9lQ2/9bL/9Q
         enQjJskLMKDYh4UnwLvN/DkV4F4eiTv0uXxL0RtKBOihR9rcMpCqXty1kJZIKjRQUq6c
         HnZiWJIIlQW0PFfwheQU1j1zubbOLhsVR/gbRIn0PfbPQcjB/wgBypdGqaIambjYdgXN
         SDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424334; x=1796029134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=;
        b=gZc0na9i9VIBfqgVTysz8iUIeKNnfhEYW/d47zHI6iCQkPysDk1D0mIJASkBqVaepK
         Tr3pdVGbIPt8oEBA91sR3UIoMHLXMc5T5viBXIPtaLSePUoBC5LCligFYCGqGJxte32H
         0ddCig3ShDhaQqMZvqjX9qe6vbuKl7HbAD72mVgnPRERdp8NdHxrqFr/HsqhppCF9H62
         hW+HbauKXXc+hszXyJHCmSDaTZJuaOAh4AYwa9MRf7qLAHdpNKRDoSkKe7j7y8BABk7j
         EEQlZqo/YhfnpDIbZmot4RRS6mYSvJW8JJnpWo75yyw/+1AN1funjx05TJXhdRDGLtkj
         8U2w==
X-Forwarded-Encrypted: i=1; AL+hErGWX9GDpjTh3u/EeG+G9i2YCWTz2a9KIQ2pdMIF69E00hRnntoKW7KBlsuFj94K5AutLCj8ypIEGXl0@vger.kernel.org
X-Gm-Message-State: APuU4Z/FAtX4ab+EFTQ6EyJw0sMv1bMmfZH7+r+tEtAlKpg6+GUs6QDu
	vFi+VdeGJrADxn3ZxpKCOme99Q8qDJ5vLSM+iB++9Er5Xf62LidLML8E
X-Gm-Gg: AZFdTZcWoufMELOu8M0Me4x9oaWUTQIBqoz730y3brD/fkgBiXqqD9r7YbZMbSg0d7V
	9LLqVN+lZa/aYxGa7JyxWgzLGqDO66TFATX4NnMqpBzAHnLcuHxjNzZ4VBr1VHu9HYej+DGoZ84
	1JKofhdwpFnUwHNz7xFidWRc3QJ/gDTiDYhQyhjV1m8DXmaJzNVBAqIP1LLHm8OYwyvwL2RSpWI
	t9HEDp3ruAz7IwWBTx06e3k8sOppolIupq9e3qG0Jx08ONVxXCas70Qlrbhu7cA8j8DgMUT6gsb
	DSA9MeSg5guEqXy85+V8TYjXXVIuXtNIRJ53HXilrYmVPcYuBroPlxNYmHOwo1Om+3qlMN59dSp
	VIvtM3C1HdTXPDQfEhTjUYo2aFadTDrutHfbRtWaQSdXfV8QL9Hawbalfn7BOpdDpoE+Y0TQUxx
	BSig28LmoTKKhUg4vbWGKKE3m/1CT60rCu1LxC34sjMBSz0Opjnr7H6puDINPkoT3l0d5Yarres
	0nBoamYzOKA4wlMg5iwaRPkzJISk5aXRbiTMBemV6QaoDIiU16PkyKWL5UO/JtFvNfn7ASuYeRW
	C5yyS4UJg9C+EBVvPBNAUMbx
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr234585905e9.20.1795424334315;
        Mon, 23 Nov 2026 00:58:54 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm375960755e9.12.2026.11.23.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:53 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v2 1/2] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Mon, 23 Nov 2026 09:57:54 +0100
Message-ID: <20261123085840.8687-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123085840.8687-1-l.scorcia@gmail.com>
References: <20261123085840.8687-1-l.scorcia@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
one can be routed to a DPI display while the other is wired to the HDMI
block. They are not compatible with any other device, so add a new
compatible to describe them in the device tree.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch is resubmitted due to the un-ACK of the previous iteration by
DT maintainers, because of the addition of undocumented aliases in the
SoC dtsi changes. Those aliases have been removed in this iteration as
they are not necessary to drive the main display pipeline.

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

