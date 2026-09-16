Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0735DA69
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 03:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789530476; cv=none; b=QvQ/0FWo/4Htne1W+plU7EQJBW5KhyCnfi6g4KuySK2ft4qkss3xekT2n0ez477fOAUIOw33TSZHEfGR5nXZE53YXXjnGCSqapd/bI7bSgzPz0vTd86Uq3wW2YfsDiK2qC7frVyNvofipTJkVhvHQ9eZVl+gDApuUCY2Zg9miro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789530476; c=relaxed/simple;
	bh=iB6N5HJd5gxJ6JfDRUspRgFcS0Yl2pln4xko2Z2q6Tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nF+Pod/58yuW+ZQ96VcR1ELIoPC/cAbajrF85a7J9xOWQbyn6zTddw6dKBuaH7uiJEbsdXa50CvEsKaSVL3tpbnF7u3/sG82P17lnmn65387V88C2zFU583xBlN7m/T7/TeTChj9TWWhO7jRB7hm4XhK4ec0pCzHJLNinfA0+u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsmVnMeS; arc=none smtp.client-ip=74.125.231.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsmVnMeS"
Received: by mail-oi2-f6.google.com with SMTP id 5614622812f47-4b374c2cf2cso925716b6e.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789530474; x=1790135274; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=;
        b=EsmVnMeSkuIn2cQw8kSngK7Fxr5+/5ftbyY6uFmZLpzapnaO4Aj0oSEu9oo7MA7nDi
         sV2mrexiVoZaUs021wWic8bD042D0F2i/QQOVubxTVuM4B5wSwue1GR7IxLNG+pv5Rah
         U/InkbpCRu2sV4arIOksEvhv9a1mLt4LAP8rF7XLNDH88+WZIpH8FBOLq5i/IpZRhJxz
         IhOmnLkI7NjnR0qtz/0JJ2mRxqEk7s+BVeW5wk9ovtUR8zHo342IjKnKGRZNLzspRslg
         5BBQ96sf3xGEYEilPQWWt/NaDOU5IJ/Vdph/Of6i5eTIOBf3TTHNOge7eRn5GYRRP3sx
         FHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789530474; x=1790135274;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KZUnuuFf09iEV4TXLpHshSHcyHegz5o15LfPCufyx+E=;
        b=XanrkMMIHdtVQSz69fU2+oZetxDEsQOb69Vd3PGlxVSFVtIs49Y0LYbp3hLmvLuFG4
         PgO+dSNzPI7MpY0/3QJg/10pJ3Ypup3hq3EzElDenVNYcUE5HQXkFLYZa++NkPHDFWF1
         YlhjoPoDn0mhcWy27MXRHnNGTOQZiU6O1glbMs9m8qtTsq8Vd9nrK92cqt1RekQ+aXjI
         CGcDK7ShJKrqLXNWJgL6GqIw6HzIQteSxQiMGZZnOYDalmzKq1G6tG6tQ3ByqXefVr2M
         NG9XdvciFlmPS7v6aQX57Am31Rc5sE7sQXAK5Mtp7lb5AwhgNwPuv85vPBt76FPg7sLv
         azOw==
X-Forwarded-Encrypted: i=1; AKwUvByUqzZ7NPw0FOc0Jzo9LofHA439YJhW+7UO3EdT4bvY2HynIEElREZfRsgSgt14T/8sgca6RTbtQz+p@vger.kernel.org
X-Gm-Message-State: AFuF++kGOgUPSQkxRZ0GHgalHMrOhaR/0jQrh0h8qHldXUNHWE43JNX7
	zSRYkp3UxcEPBwIpy6aU/H6i8O5/ErCQHC1MUAy3SsJGKsuMeh2KAn2CusWz72vA9rA=
X-Gm-Gg: AYBFou36bA7z5HEZ0O1ICtfW65xWEbw/56y0qVw2PhebS7aV1Cm/0Id2P1H1T7B7QgB
	Nj7n8ux5VZSTI4t7MuJ8FOWJ/AVfO1I2Pl633+GpKVvPOpVtwfAP7VArGcAkW5wyYTyQBwA1n48
	8x6mGgtd614K2jIYbTXfIAIRLXfGHmdfndKgmw0OhTdT9KZJSs95RYpvOXh1buJsIIiC0cbyzZG
	zdl4Nr+dUkTrWarVyfmPdS7CDn3NECzTrp71U0K04m9i1qwZrRi47V9x4sMOJ57sCui1SBLSHtJ
	nDniUp3y+rdVgeGqb5F2b0GKdRhf6nf3aQ7cUpfJhr+4rS3Tn3v23xFEJuBuS2LSXF5zdqb1RZ6
	WMBMTEt++4UAMJBjP9hnZHPwx4xNlIal2Sz+AqybtjtNuCyP/crXAV5I7PGzIvpv2QiVrPt2T5d
	f2is1KPI2VIhyRmA+FOEnzYY663PBltf59yQY4esOG/8DZTOx1aInUVpE8cHI6G7iP6F4=
X-Received: by 2002:a05:6808:4fcb:b0:4c2:e38d:4de3 with SMTP id 5614622812f47-4ca4a9047a1mr1733472b6e.17.1789530473675;
        Tue, 15 Sep 2026 20:47:53 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca2377aae6sm1446666b6e.7.2026.09.15.20.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:47:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 15 Sep 2026 22:47:50 -0500
Subject: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the MT8173
 keypad
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3Nyw6CMBBG4Vchs3aSFgwXX8W4qPQHJ4baTKlRC
 e9uw/LbnLNRggoSXaqNFG9J8goF9lTR+HBhBosvptrUrRnsmfWuGZwyfpxjWhVukTDzsva2a/i
 Jb3SeJ+/HxrYOZuippKJiks+xud72/Q+w0P5JdgAAAA==
X-Change-ID: 20260914-rbrue-suez-upstreaming-mt8173-keypad-fddc316ae098
To: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789530471; l=2015;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=iB6N5HJd5gxJ6JfDRUspRgFcS0Yl2pln4xko2Z2q6Tg=;
 b=ALF9MhZ4iDbh4vFTTUxFBuixvjgq+QLsNGyPYSFi+QRZHCViQOngwQy98zKiBOP33E4wyYcbz
 YQjSzhJfhYlCnTGnNHLmhDpo9Ie+KvCnRBPR12NrzDy5tFpdqQ85FYX
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

MT8173's keypad controller is the same block this driver already handles.
Its register map agrees offset for offset with the MT6779 one -- STA 0x00,
MEM1..MEM5 0x04..0x14, DEBOUNCE 0x18, SEL 0x20, EN 0x24 -- and
mt6779-keypad drives it with no code change, so the node only needs the
fallback compatible in second position. Add the mt8173 string to the
existing enum, which is what mt6873, mt8183, mt8365 and mt8516 already do.

Verified on an MT8173 board (Amazon Fire HD 10 2017): the volume rocker
reports through mt6779-keypad with no driver modification.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
This is the binding half only. The board device tree that uses it, an Amazon
Fire HD 10 (2017), is not upstream yet and comes with the rest of that
board's nodes later; adding the compatible first keeps that submission from
carrying a forward reference.

No driver change goes with it. mt6779-keypad matches on the fallback, which
is how mt8183, mt8365 and mt8516 bind today -- only mt6779 and mt6873 are in
the driver's own match table.
---
 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 914dd3283df3..b45dbf805ac8 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6873-keypad
+              - mediatek,mt8173-keypad
               - mediatek,mt8183-keypad
               - mediatek,mt8365-keypad
               - mediatek,mt8516-keypad

---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260914-rbrue-suez-upstreaming-mt8173-keypad-fddc316ae098

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

