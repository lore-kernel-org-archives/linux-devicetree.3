Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7B346E46
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833366; cv=none; b=AqsUWtBUkhgZdD5OnQVAxdX/RPKO06N9rbVt4RFqOzJ/F1Orcl6oxi3WtpJCWn0o/08pCiOKdbo5EssGTLCFCZ1qHaanYvttNtMWyFOi3ScoEPsB2LM7uljlDbYq8Zgh2yIJxGtxV6QaD2fnWXQT/Mq3/y7fXGmbYH7mnnC7Eps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833366; c=relaxed/simple;
	bh=jOk6MYSATxqKdhfBjMU1+7wsGf54kHApWqotRVX42uI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FwTIzIa8yDGG0uPIG1V+YO9IA1PNbmI7Bxktw34xOqENI/lBfkW/xlR/WyAGeyJCAxkI0i9Cr7mo7Hz5/PyxL7rYHK+uwT1tsHcxInVhEzfSxC8Cc0YOcs64VDgHC+eXvsvrF0zOquaL8N5iv24I8c6laoo8szQmGi+GU6+Vrm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=A2wRBTj7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="A2wRBTj7"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd2d8bb1068so685621766b.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1778833363; x=1779438163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Y029AYLsU3gQyx7qK3mdElsxQO0fMSNbqm4SAjcN30=;
        b=A2wRBTj7hwyiG/F2ReOxo3hNltPNWyYIjTr/DmJklRxQThPZ21nbBSBUB1Go31Qnr9
         ieISIUOxDqgvQFD+wAU+6afobLPLoM2wcdciTBVn25MFfMX20KgP6k7bNZO6XRTfRKw0
         Vs4PAvJ+iixlI/Wqw9T82HLChHaPpRfH6TgHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833363; x=1779438163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Y029AYLsU3gQyx7qK3mdElsxQO0fMSNbqm4SAjcN30=;
        b=PF5cVJvySLbt1qriH2ge8SrErdpvQwlLNaEv/9BZeZ+he6Kkf21svQMXZfcUlcZ6DF
         Fgh4t7ywOY2WBGmLIe58QPg8R1rVYuGSim3yv6+QNxflRCROZjb3iXWtLkw72fYsaHoe
         jzBIMAE7oOgTFCiahkiuMQBpBRCpRZ8+mCbKJ5MRReErJpjC59mzeVjKtNBlpyh+xcv4
         H2+kTLOC3VVrJjOJGUCJqODZOISG0w9b300h1qVbhmpxlDjK02T4s9NOr9aoTCpRoefo
         TgsqmKC8LAiqkKiTMBwJQOzEQQiibCAGL0ah5mIXvV/wsJQNAJKgDKke4Qyw+fXngGhW
         ITZw==
X-Forwarded-Encrypted: i=1; AFNElJ/2r4pTa2ZwuKadPaDQaW++FgVpHtg/N0ZeqWcxddn8L5e3tGFhzsrlaQJDX5yTjn0L1+yzeewbmlaO@vger.kernel.org
X-Gm-Message-State: AOJu0YxeI6PAmohdcljxQpmuxjZJudgp5CpMCSW4d9UxIq8Gwu2iKRog
	Jnu+yGCkCC3Srr6bolzZAZNuBUUrJ//g7iXa+XDszeVWK8JFTfCatpKj8usp+UgtupA=
X-Gm-Gg: Acq92OFjsCaieYeVuf/yABfx7Gu9B+YT9GNd1OApU2VPYpK+6c6BgszY0w44ilLmtFL
	Y+0fYLfGp/1bnC6MXNpZEqtjw11NFGIeDdUobw6i8MJwzOhEK3NDqa5AMp/1DPCCf6FeszLfxEK
	NBpaciF5fkFg3eALo+xO2p3sqkhubxUjLXn6iJ8wd5m6YkUsoBoxda0lwZk2UeVR4dfORApoUi0
	MnCvfp1AxSXCk6Bop/CvIFcgtJzSy0xNdh6bE9MHug26q9m3zw/CSI9AIvjqlmF3PuRsnkO+hpP
	2DFjHosc5VmoTmKNZnQNDad/a6QEfwKhMz7dMA/axgbWOkMeri6IKRr4DCTKE2OQfpe4wtdB08+
	nWALyMOsa+jbdLPSGJXqmCnlc1LLQ0R7/o360e6BhguxWH3o5916G4bcD3dNKHaiENIW8DxiXLb
	U2YuwCEZ4wxKB8rNwUIP9E+6G4LergdZmaoXG4ssrW1S/HmoMJWKnkPOZ8wjl8H5CzHX2dq01ju
	Ub/DxGcKxF2B2TRabvEhptXx+MLJwXNLNcqzLsyZIL6aFOMRGa4BupSuPc=
X-Received: by 2002:a17:907:c291:b0:bd4:f594:8a59 with SMTP id a640c23a62f3a-bd51792d179mr143825566b.38.1778833363275;
        Fri, 15 May 2026 01:22:43 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e4d54dsm189529966b.47.2026.05.15.01.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:22:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add AM-1280800W8TZQW-T00H
Date: Fri, 15 May 2026 10:22:00 +0200
Message-ID: <20260515082232.1766586-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for 10.1" TFT LCD module from Ampire Co. Ltd.
as part of panel-simple.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Insert the new compatible string in alphabetical order in
  Documentation/devicetree/bindings/display/panel/panel-simple.yaml
- Replace WQVGA with WXGA.

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3e41ed0ef5d5..617cf9d64627 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -31,6 +31,8 @@ properties:
 
         # Ampire AM-1280800N3TZQW-T00H 10.1" WQVGA TFT LCD panel
       - ampire,am-1280800n3tzqw-t00h
+        # Ampire AM-1280800W8TZQW-T00H 10.1" WXGA TFT LCD panel
+      - ampire,am-1280800w8tzqw-t00h
         # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
       - ampire,am-480272h3tmqw-t01h
         # Ampire AM-800480L1TMQW-T00H 5" WVGA TFT LCD panel
-- 
2.43.0

base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
branch: am-1280800N3tzqw-to00h
