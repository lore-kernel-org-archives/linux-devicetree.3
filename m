Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAED3812F2
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218799; cv=none; b=qyeBNoKiq0OcHTw6ZRS+WoYSQ2cWD4HHhpB9/pd+YZwvSi9/YqPscEsOBS6n3Czgg/MaAUSphtXEsLujMtK1IhkNowJtb9WdDJ+J/rBJDM6benQvmV2on+jr9UQLo0R/F6qYssR6uRx+ySeEbEc84AsGVFFgDc7RThaMeCOpFjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218799; c=relaxed/simple;
	bh=4daVTrSjSfN+ddZbT68UXgJEAvj9+FvfkJvj7Q7oQzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rR2oEoL10IckfgBMiMQJ8VHnZTtwfVCPUHEZcfZnwXQZBW1kTY+gQMhoRtaBamZ6g0YxThSX5Km7/tYW2FG2eZ6dinsR6NbPKSzVOcvCY7etsag7tdiyAirJh4GWmzfM9atjwJCWI3RaYJ0TjRaNhpLfSIPiigsI96I9wjmYusk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrX6D+Cl; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrX6D+Cl"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84867f07d63so7800553b3a.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218790; x=1784823590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v07hhIYgCpv/xDn5L0MGVWF5jtYyj0RekFw4y7lgqkQ=;
        b=CrX6D+ClqzdTTCENHIRT7NW4L6+x++/c61jSYfCjjCiIbcV444oLhv8AKdjm5nFXCT
         PH/pnu1rEKd20hHLMueQejnRcZ/TOsMKbPvfN9ao7g4uHRdmDb+Y4+e46XlFBPb9nlvh
         Pw4KCJpiC69Dag5HJTw4NpH8e59PNF53bf/I6b9gUnt2Tj5hqqAfbImpkb7+UKdZpQUk
         SHi12p/5k83H/L+/FR3IMQH7eknrFk8nbbSn9ZOaB0f1Ax/tDqh67A6D7QA4sdIuw/sS
         gD5E5SN98Ea3Re3b5Odt0RVGkDKbmbxqGJD5sL1nn+dvqh+iwQwSBvZs88x/tRwL6JMe
         7S1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218790; x=1784823590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v07hhIYgCpv/xDn5L0MGVWF5jtYyj0RekFw4y7lgqkQ=;
        b=UqeaW8JqMc9KHz1mmo3rckVw6k0AxVwtuk3FpwOKDkoIgWRWHZlGQRzYbhL3CBgo99
         VeDa/Bs9IAaZjEjRcT2OgbUl2aKIWlfB7yWDYRcA+mXUTozf988xFyVRayqy7gAxd73a
         LlQ+7isg1mTWOV11mKOcRIzuTbk9ZYqeOkVTTJ0Ie0zOmjn6Zvzc1ZNQfywTVQidskje
         eZclmesfF7ihX6k/nRo8MW9jcxUDsmBlhL3Tt8VvuGfTRf6i13KE7REes3ukai9izWNp
         wdnue8cDOOQ5KQ/B+aevOEKTkhR1OPOF69ZbcQg2l83jP4EnnvBLFG+8MeI68nK8Bt8F
         wt8w==
X-Forwarded-Encrypted: i=1; AHgh+RpmEgKOoG6ABMaIq7x/xk0cWZ/ebyIBOqUMDmKgzLzlmSMVM6NNncYJ8bBZfZsxGYk6Zv8J/+9o9BAp@vger.kernel.org
X-Gm-Message-State: AOJu0YyPT0AzIOfrKfjexnrTTkpSJOEdPeB3okiKCIXHJxgI04YYhCWV
	jyfX0XbmF2u2li5lfdptU9NVTkHf+c0CJYYl6d44w80tSgUxND2vrIAo
X-Gm-Gg: AfdE7cl+/9zDGvCZvBq6vVw//BMoZGspXrtLJ5f9hjnIXcgSMMvPzpTHDW64LF/p1bH
	E74j6GVLHnD4xop9eIucwktZA43pUKTyp0UhsPqtKXfFz4G6URLe9sWXz/B9jumLUUzE0rbLqrW
	EUeRCq+8yqHHUSOw6mxrEvRCwnp6wBnnY6YyV68KCTs5JZ4qF2t/ONYCiJK/0nnLOwHCGuX09UC
	VyQ+lsLSkgGvc7YsxAPHOZ9TeaGjlnX/vGtCxj8wfmJFX5UERue2eRE70HBxSdmYcI7Djn5U2Rq
	6q0FxxcwPb/smIw45aMnkWXzK9m0ptf7rum99+S6UQAv4YCguye7zqHeUUc6QY8oUoIVW2TnTfK
	0b2eU9A71QUh4A4d4xn3Hvfnsl0G2B82+0Dql9g8SdEecuKvJItcM6M6C3EOkmt8/4wtlj5JgyQ
	50extq+/kCavKDp6TNF872SVW5h9h9CBzUsA==
X-Received: by 2002:a05:6a00:4f8f:b0:848:2f7a:2e50 with SMTP id d2e1a72fcca58-84a67308928mr7306361b3a.63.1784218789947;
        Thu, 16 Jul 2026 09:19:49 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:49 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 2/7] dt-bindings: watchdog: mediatek,mtk-wdt: add compatibles for all SoCs
Date: Fri, 17 Jul 2026 01:19:18 +0900
Message-ID: <20260716161923.266315-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver recognizes each SoC-specific compatible, update the binding
to list them in the top-level enum alongside the existing ones. Keep
the fallback items definition so that old DTS continue to validate.

Affected SoCs: mt2701, mt6572, mt6582, mt6797, mt7622, mt7623,
mt7629, mt8173, mt8189, mt8365, mt8516.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml           | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f4eaa5f7c5bc 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -20,17 +20,28 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt2701-wdt
           - mediatek,mt2712-wdt
+          - mediatek,mt6572-wdt
+          - mediatek,mt6582-wdt
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6797-wdt
+          - mediatek,mt7622-wdt
+          - mediatek,mt7623-wdt
+          - mediatek,mt7629-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8173-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
+          - mediatek,mt8189-wdt
           - mediatek,mt8192-wdt
           - mediatek,mt8195-wdt
+          - mediatek,mt8365-wdt
+          - mediatek,mt8516-wdt
       - items:
           - enum:
               - mediatek,mt2701-wdt
-- 
2.54.0

