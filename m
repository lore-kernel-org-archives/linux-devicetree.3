Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8921143C7DE
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222289; cv=none; b=gzNS6mdZf1Qw9mJi2YV4DL9Hz7SLUyEdN+NwugdwtpL2DdfZ8al/3D/eGa8DiCpTQv+OyPgPVGpXjgweaWKLynsv/sDyUMRg/B/zj254PhHl72uu6XwVFDd3XYJs6fkrJbmRRTyyDjRZz8fNbybdzd95smvlA6cVK6kB+Nny+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222289; c=relaxed/simple;
	bh=Y8Yhg9LDZgOOn4IYBYFpDiXxdAtcDCdbUesWkE9/tns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reJTNVZTOf7wT1Y+PVN1aq699W9r4+is+Yzv95XvVJA7wGidrGumqQ6DadC0v7W6LAxmiclIN0X2jiz1Ve5VrpNSU3LvDByuaSzKrnDefUAFffI9CKuZj99WwB94iL/iqq5gS9MRZbSx5TaM+tNJIcEAC85U+89xtZz5gM/Khpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCdB7emv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCdB7emv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cee9b74ee1so34695365ad.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222277; x=1784827077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=;
        b=hCdB7emv+75h4IkFh1xMx+pBtbjzjmnsR+CZnIl33l6AMh1Kga4EuQntgWs6bTNZsk
         07eZprtW3kOQAg4y0WiCLa+/4HOuVC0mfvmTspbg/IT/0Ltu0xZwLnj3hNSinR/PJ63s
         KmtfLgmRAWsusaU2Li5fvO8/DokvmNh370EIiRDOa2gsMZpmQLnu15PFtAhHvZnnBzPZ
         brFwP3gg80TJhb/g9b2FoDIp/890dKtQmX/VOhFG2FvwJ7bihzVK47XobpkQr5YRErC2
         40BbJcHaYVZLGzeCCZweOGxG+aTBU3dD/fr0akQS3wwn2+Q885uHwlKIla1c6naSNFUN
         X93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222277; x=1784827077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=;
        b=ABArQaOeDICHiTgXjl5cCG4dwoySE2sdd/FPw5NNOfIlEmRnXL39cmm0z4lkZvDBX8
         0S/3I21sTTZAebl5NQnTLxpbEny+PZ7UqeueX7OIDDcM0XzPGSJQVarVIk007HtoYFNo
         j3oirhDFn+aSqgXM1DvrCCBzHI3QiAscRhRGlHVOgX6IQvCtteiZQMqVusdU7aVAp8vb
         fByIYzTo8nj1xJoSYphRXfCqUFPBW17AnEItjMzV4SIRXQZw3lJme7GyJh6c/EefLD08
         L35+YHyf1lzz+Pm2+FfF8dA3BJlMcOP7H2m8YdSPmPU9OOmB5tk0R9hGcYEHZzdaPoWL
         b8VA==
X-Forwarded-Encrypted: i=1; AHgh+RqQsojw7iyj/3/cZxwXfYiFYao6i5+RyA4YaqYn+EddPx9rGsjdDF7CTFpy0EQv6LOpD7tRu6LzBR61@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5TpuLo/5DBWFDDP/T77O20h5YzBY04WKWC7nWQ1QdtOWF+fcU
	LJJhmrYZSWv4iPSnHNnA00WW5HXOmkt4XFt0V6TE2Nnip3NN5PVPBYg9
X-Gm-Gg: AfdE7cl+coi3p5hJQAUt6jC2p+Euw+SDJ8/56Z4ArkXI7VobTlWXWTzvyEYvJRh5LKc
	mum3EdnpJKU/2/Ndwl8Vee1Gv7wF3nqUwD3IlXNQmmgpnEIJ1wx3YTKjL0ppUPJVg503JSwzAPA
	N4iEoCvDG4uf8OFwx6D1MIbISYdpF/R9s4/5UrunUTFEfuBszSc2KyGUdGzoFqEV/zSrXLrBOuV
	ovQ2hvb0sSP7RpTkWnjFtPvT3HVMm/zmv2a928cLbTC1wiCwhjujGLf4xFgE+5s5ghw9smrsStm
	Hwu/r7Zb/p3peTPmAjzkmCp1Z3LBR8XEQe/2qjcSBBOPm4NyEv2JqFhHpGcF++m81AqMBMEXGLP
	HY8KYeNqq8swGPRUOYowV1V03Ga7+OFzV6tGziPduksQIxLdIxzdPkM2yiOM2yM8JhUXZ7K6tzo
	UvPTzQqxRyO3QgBj9sn9xaIsXLIYHgtPSSYg==
X-Received: by 2002:a17:902:da81:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2cf03c7c756mr75109205ad.1.1784222276928;
        Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string
Date: Fri, 17 Jul 2026 02:17:32 +0900
Message-ID: <20260716171733.300885-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the MT6320 PMIC.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..f2823338cccd 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -34,6 +34,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6320
           - mediatek,mt6323
           - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
           - mediatek,mt6328
-- 
2.54.0

