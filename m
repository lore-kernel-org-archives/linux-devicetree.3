Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5417937B019
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602804; cv=none; b=CY+S2J2+YPb8nC4zSpYGEBPWnHe72iLp3BMxUFcm00gnqMPDc9MIYNYbTmCNEwGZ8ALMbUUsqlQLAXphxLTpZe9WggmtUe82pV8enO9cr3XMp20OEDwSb4gmh7bOFfxQf0V3JJO+dw9SvhiMXAuqtUCvOacAs7XuOZmngi22pAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602804; c=relaxed/simple;
	bh=1x/8fcBOBGwQhPNEF75nOw7LbFJkmoN2c84cmfv3ius=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEJmeT/BVrEtAcR7F26QZBjTmI5kFvpz4dFr4mc3KeR4DhVifEm9Lpyod2nCq9NAo8fb4mc4KlRe43twr2uBEu+Xx8q6SWKAC1fI+NmTEdW1ylAVp/PEap5sAPr1FkWSDi/dzbGDjf3WXu681z12VtQIJsV5O6Pyse4PNC0UMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pCsIBIBD; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pCsIBIBD"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-934944f2d22so223422785a.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602802; x=1788207602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOLy1+a9YXmFraELoFIR4gVacZ4F6tH0XUrBNuPXgmE=;
        b=pCsIBIBDLwx10+YaO9sEpmdmW7rB6v6lwzISt6NjuaoSTRn7ZjO+fZifskQZ6Xtj5/
         mcleid+a5NMx5Sw5mCNMWtyivu7lJslQ5jnhIv/FrWr0nGWmquQBrK5T3EZvIoRfAkQe
         UjtVXt95VwsnmgbZ3FhP0c68Wvj9Yyi0ywvHGVi2F+MT9wnDfy78LbmWfaG4D2aL+CK/
         fpV7IBKRlmkCpdmczfxF2570cnfi9UAeEHfUo9ooYWCy82VUlLqjzPTAJs2g2EeZCR8u
         b3OaHdjTct8QLW7ADTTy2RLxPS5VbI8Kf4hEAhWS9Fj3lEjktGRUtaSRxvl7bF1EWtad
         j1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602802; x=1788207602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOLy1+a9YXmFraELoFIR4gVacZ4F6tH0XUrBNuPXgmE=;
        b=lm/7wKd7dxDFozTS7wlXokF2W72krer0add2tnb1lAC2sWJe/qpgiaHdhwjbudW+rN
         GPROX42deJSuxNeEeKstT4cJWy35yK6dy6jvi3LDyi4CNaQuc/ymmBCrIi7fYc72zDlO
         mBbemRfan8jNTvRfXsaFirmpHlP47eh0WQWZXG+NtuEt5mSQhq8iYc92qjIPMSyIYsUW
         KZaEZ+P6pVpOfHyGufaO4NN5nR8Yh7IRGQgso3gxWR+wT+lqECIm69RpkhgSes2eDw+p
         21WRBN8Xg95dYGFYifegOyQ9xQ0quonvrVj1Hjl86rKqLSV/PikauTIn2CJhKltcMnm7
         7ORw==
X-Forwarded-Encrypted: i=1; AHgh+RqLR/X4wv3VzDgAuv+/ZWim/E1DuJiS9Jtn7tJxq08dis7VaqagkvTpz0EQ/CC9gl3qJbjFg+2J5GRf@vger.kernel.org
X-Gm-Message-State: AFuF++k6J1I+9XY80O5707OLZQ4609oZ76KWae/VAMRZ4+RGJnK1Tdmg
	Ozp/Vl7e2qhu3Z1ZvInwsCEplJOA9bI0WbtwqE8N39Ewr6QQpEe444ac
X-Gm-Gg: AR+sD13COJj+yLw9gB2Ih6wWNoYp1SOjBksA6oXUokG8r4zdfCKs3iW8+a9ygRCV9ZP
	xiP7lol3YbiCbnLSkK6lgdGTWvzVQsuBYjYlEcUkB4jWgZr3Gj4lH2OOYiPg54+JQdJlOmKYozW
	ITyhzky682DvWIlBcw4dAxwV8zjnNByKFLPVfx4Qm4WPCyRnNNYee1S227zHk6H9KtjMvpZdYQ0
	2LVP48wdCHzH0XY9SeaEopl3aM9rX3Eja4bdcPpH7/ASbnG6MncTdKCvi8kNE8apa6jI7VTH2sq
	b+OhNdIwIcrtXn7YA7mWnKnAXWkuaZdTC2T2piOJO4g5XxJ/I1huhB9xKZC6zNpeTzmjcAKON0x
	9D8e6W8oSJAYI3q9vrbuSnqg14j8kzrESnEdOMknlXKbgxgM4TAbvVySvKQUQEIpDE/yQKMsRQ0
	wzKysdy1VAE3lUerCD+UKw/K2fCdB1AInCT4Mpl0KpeLehWqHuQdIWTsCMc+h6tw2P0Kslbt8rX
	8nqMcEtH5S80Sz5ICsMGoTD8vk2jYryeBBexHaFoZW2ypPnGX3pctsX4eLts1TzQLEHsVSTZwnb
	fu0ipRjy2KlkXMEVE1GKBur1
X-Received: by 2002:a05:620a:4809:b0:92e:8a84:7041 with SMTP id af79cd13be357-93739542819mr2709922585a.8.1787602801988;
        Mon, 24 Aug 2026 13:20:01 -0700 (PDT)
Received: from zaina.mynetworksettings.com (pool-173-48-203-201.bstnma.fios.verizon.net. [173.48.203.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749d91ec0sm579356185a.26.2026.08.24.13.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:20:01 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Nick Li <nick.li@foursemi.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zain Aboobacker <zainaboobacker33@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: foursemi,fs2105s: Fix typo
Date: Mon, 24 Aug 2026 16:19:51 -0400
Message-ID: <20260824201951.3116-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the misspelling of "generated" in the FS2105S binding.

Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml
index 4da735317e0f..17c938a565e5 100644
--- a/Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml
+++ b/Documentation/devicetree/bindings/sound/foursemi,fs2105s.yaml
@@ -63,7 +63,7 @@ properties:
       a. Register initialization settings
       b. DSP effect parameters
       c. Multi-scene sound effect configurations(optional)
-      It's gernerated by FourSemi's tuning tool.
+      It's generated by FourSemi's tuning tool.
 
 required:
   - compatible
-- 
2.53.0

