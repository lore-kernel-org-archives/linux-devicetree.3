Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912863;
	b=JBtqFveA2JWxcwSJHRgqrZX+CH+mlzqrGjpYCN2TYr/sUTaJXRgB2P7xEJWwV4CLY7Bm
	 V724tN5JR8VbRwF30jwSgLOBgXwWabqoB28If5AFXKEY/xcj2f5ocd4qgCN64gPdEdQm+
	 O+XsNLflWDLyzyLimg0+6S6JhHWN7Sbi4Dapx8Ne+yzvokiONHKW2yR0y1q/FaVYxWteG
	 wLIsULvpud6rkdt/oFxvY+l0KpYG2NMhsk57JwmK4fQsxWaAWcjCG+pvZtPTqkzTVorJA
	 PzFdfVlOPyDzX77q4oYHZWZPmL/vd5ydVzK6cb2n6T8chhm5fIxKz5w+867I8gBT5MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
	b=h8YIODAtnhNi1roDPJALw336HxR7XwArCM32vaMkWCJTL8PfWpoO89jbTEvjDCjU8I2Y
	 L8N1WHSyVdvM68d4hXIFpZ0694PV07qO4bsKtFwQ1U/aBzYLj1+d1uqITrrBOYv4YnDjS
	 CQSJJm6lkpaw3e8s/woYYeD4eF/BoFBHlRKfpWKH+a3Cm4ReD4yve+vCd2epVsPgO1tFD
	 eEOJ6PpAseU+/M/l8f+bzV/sPR1GqmoRM219aZVKfw+TK1YYN1mrHjTxd4szkES8lILry
	 CWEL1IVb8szd3ID7TnRYXfChws6BOlYyyuPcXznjUzSjARM98Gyt+tt4jzM95hQz6sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBLiPogx;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E15F606D83D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E15F606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBLiPogx
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso130594a12.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912861; x=1794517661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
        b=lBLiPogx1HagL7iJ7wlCKBNbjtZOWQYJSYWopyI3EcLhp5+tDMsSb1VypBbCqJI7Es
         FtGrSTadlBFXArfHaKP96K9I/OHUrjU6CjAUlpXwKmB1BPA0jy4H/1vNhQBJix866N82
         z5TYyoTe2YCK0LYgFhqBDXXiwxi12kgntXz8rU3DKCvBn3khzFj1+OgPUD9lWMOlYVXI
         o4XddsNk7LnJvCxTMiDSz41RW5AKxHIhjBjgW4sAGEhe2kPXWqIiWRONxdQk0eb/4NkU
         iKVLVs3onVQgBhXFg2Mt2UikWLw3YzkyuBCvtJI/gPkWjEMTiJy+qDZMiLthBfI/pQAd
         f8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912861; x=1794517661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
        b=H6maFxizdvT+4pzxQ8Y+JwrxLZphF3tizj/NF+T2paSZtBywcFaUPOj2Np8/WZbIfy
         CIai9YYEPeDvn6pKoj+ALx5Zz8gU412QbC+YMnO74IBPj9Z5SoDvZVERKM3XbabBaodP
         qekRSTOqWrVoSqjQsnslPjY/1hL+iPKko3iGFKYaIANdQM5KFPrS+PCnqqnxV5XMp8sp
         iG/NmBs5ImY85XWes3M/c+QmNCAi+Z2pVNBs7GxSft0tb1Z4bKCwrYu/OwVsqH9XISrw
         hkxfWIsko+fMPdszg6Hr6Q2Bl4af1EE1RDus+GW3V0zHG+Q+E+Pl0NSTznsJwFAlkeBg
         iJEg==
X-Gm-Message-State: APuU4Z9IBkU/H3CroaZ5/j+/sxD+wLEcdmt6Jtva1Q+iQrHfOSTTap9f
	dOvlBNOXiUXMsn0fbVV1EwTAIcaTGgujH4fI1YuJBfRCXqi9ZRytMKo88kKI9zkjK2xzlenF
X-Gm-Gg: AYBFou1HGMJSfSVNfLWsKuMKy0U8Yl74Td3o4BR3QTU8Ypt9YVOkxFwC8dtq1Uj6oXr
	XSmVZAyNc3CsGDGLLCHjDOxpHdPm5oxcLU9GIzZLYD6ViiL3mnqmSu+YvtDPc6G8cPQaOPYQ99b
	/bPQ+M0sG8Q+ozo7WKCC3Ynv3xAKoAuv1iVG70cd8aDEkfkYe3gwsWIJiS6/Z3a8lgteg9EOuND
	DaXRsKoiiAUQlFNIRGl2CaNc10kYe0zS32I9d98E/vV0dU2MWKx6snsK0k/KNF76dmzryedjnVm
	E2/pCHHEYAu+SABAeyiQhamQhHbGydgrASCMadmUSb281ddI0s16rYjXzr9qvUklILfkQhtPjav
	CrIUea5ABV18cJCi/WrVtiCUo685CQbm3RI1gbwjdh+tKZCxtNO1Np55WcL8VnWa2wEee78gmaJ
	EdH8MYN+Msv4fshuJrAhUqBEef/IbpZ14j9zS4h4jfRl/Vb+YA+MyPGRBvBwTdLBJzNy4EynUg+
	lfORcZ+KxFFt8Tcd2rJPwtxWCzUgVV3VNlfWp72/1mVrIbV3jFg/t7utGMLu2AyvpEPQ9BrfxeZ
	/TPn8txRHCsDG9TudBoxeYF5MjKMscedrm61rjFnoH1lM1o/gg==
X-Received: by 2002:a05:6402:1d55:b0:6b3:d0a0:3a2d with SMTP id 4fb4d7f45d1cf-6b5975296a1mr338144a12.1.1793912860655;
        Thu, 05 Nov 2026 13:07:40 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:40 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Fri,  6 Nov 2026 00:06:01 +0300
Message-ID: <20261105210622.523747-4-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
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

Add a compatible string for the watchdog of the MediaTek MT6895
(Dimensity 8100) SoC, which uses mediatek,mt6589-wdt as its fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f9b725592c27..cac7d9ae98dd 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt6572-wdt
               - mediatek,mt6582-wdt
               - mediatek,mt6797-wdt
+              - mediatek,mt6895-wdt
               - mediatek,mt7622-wdt
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
-- 
2.56.0

