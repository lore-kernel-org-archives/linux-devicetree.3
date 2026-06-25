Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E3338839E
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384486; cv=none; b=STsOj5ZuNe2I2h176VMgu9RlMlyd68Mf8zS/I6/As6DgBwE9jWX0H5YlWx3Y9tYu/pOCyUqTCYjp8FEIlHkD3IPulVG64eUKlI+Gmp+YNZn3w3/QM3xGYZHBp++ubFaX/VFnmRoOg5lUEkTk4D/KqNFF0l/YeUTgPAmHfPGZVKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384486; c=relaxed/simple;
	bh=Lo7U6DKiKSUYIKuCHiGg+bdOXyRC/EOd7zgkHhIi2ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOVXNr3fZRMuamJCRr8j8kGcM/FAMUuOSqTkltaRT//YKtpi+z+r/1bEctFENP+FE4bDkh2u2udVWXC5hKV/B+ssY+eYXWNY1vaBTBpked3sWZah4/WeTSXca0QT3Wa3cY5s+VZNWj176NS2iQgFoJefZeZ8h32ViFcfBndADeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td0MX0gD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td0MX0gD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49249072f03so11831985e9.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782384484; x=1782989284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=;
        b=Td0MX0gDZn2343Km58PgJVFcZxIQPGxyzHI5/6tEx4W9tidJs5FtqnHwD4MX5A72P3
         ODDQTRnSuwpzfYwFVLiTP2w8iZvWPJJblPASethx8fOaZBb8UxrGPczhYFyieRgTLKGW
         GNwYviK0HW2r9gvs+Ia5N0oWwI8KrW4aE6ZPZ3uDgC5u976j62Gaf82HBUam5c5HqBbu
         Y+R9bPDLheMUWifuW6wRD8Q3PfmNnpzRjEgvvjHcYZhh7ZZb7b3Vagn91QRRHtaiT4W4
         NYrb1mBH+3STMSAcIGNT+r9xuJ8A6LN+x0NEZSGRtPusxPaC32zlGJpz+Wj+I9JGeaO9
         fmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384484; x=1782989284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vzXm5SgiTxDoZ7Na6jG8JfLM+hblqMs5LJx1QPPi68=;
        b=dJLrLTigD9lGY7ORKg+NqXHtboBWlz5PdONplUnH7mOdqg904xX7r9uXP1XL6t6uCa
         zf9+5duHULVXMr9pcisL1ssWrd/Az1ZQmakq0RoeIrUYojwGwqQ7a0D5bozRgLGGq914
         1lu4pNNEG5iM5dqHqM2HyZsPgFfhzLzgoC7tV4pNLuze+Q9RI3hhIq6+sHUMKSMfNC85
         OuNsrcCcarapG40yoP5kKvpTIFBlUL+kjTSqvJK+NVpaBFZOLs/XzMIlvN1Mi4UJcaE6
         b++/FtMhINUgJyiYacVd3WYPzh0VO9GvRzXh6Yts9Hrjd3+aM1VHF7T5vpzjoBIwawsq
         S/tg==
X-Forwarded-Encrypted: i=1; AFNElJ8c+k8DgX0ds2Kq65p16pAc6Oujzx+kTXtMXlS5HDCYWep1r6VDUYvcEpbYfptoY7FqzUwH9Jv53XLp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx89X9GYIIHHApStSh2+Dcl1xpFbZeB+hPXt7mKyk+Iumb4rnlS
	BmOwhnN43g0J3Li+ElHrIC8MXOodAEDbM/e125U/do3NQte6ZGwUi1VMXYVtKsUM
X-Gm-Gg: AfdE7cmSM+15hgdLIRSgdjEBHGaf00IMRlvS65TjjBLZQ4a6zsqdMiRdD2kIXsUle9I
	wsKWpC+LlO9O4Ex19C0PP7g9ozMI0M77jS90HB1BptavZh8f/JMf9Qywpn8qPMbxl76FU3mpnYw
	arr1pAEZHjTju7xM+4o7w24zCA62e9ewI7XawBirTT3A5Lri1vOXqUo5Q7gxkzlSN5nIDehAUkI
	q/q6Sed6dziPrMIpFFmTfCwD2it8Qo/CGE1d29eTHj/7ZXHAi+W3J2PLANOAzATd2/jEgo4/0pE
	fnRqO7+PhXgjV9W0dxZ9lc2Emq+aesMUXuIaGJ4xcANjaKwNhh3RBbGDyWDxuMKYenCS3UiRGkF
	1IW7QRQApcOm6sMrKw08BjZq9k1wDbR5AUReHdHpo32nHSzQQZqKBrvh2ssLsRBKGbQe0/6x+4p
	8iiPUnEg==
X-Received: by 2002:a05:600c:4f43:b0:492:660c:5fca with SMTP id 5b1f17b1804b1-4926688582fmr26319285e9.23.1782384483738;
        Thu, 25 Jun 2026 03:48:03 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm15254989f8f.14.2026.06.25.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:48:03 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move compatibles from mt66xx to mt6795
Date: Thu, 25 Jun 2026 12:46:30 +0200
Message-ID: <20260625104742.113803-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625104742.113803-1-l.scorcia@gmail.com>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pinctrl settings for MediaTek mt8516-mt8167 SoCs use two reg base
addresses, one for GPIO and the other for EINT, as it is common in the
"Paris" pinctrl platform that is described in the MediaTek mt6795 docs.

Move the binding compatible for these two SoCs from mt66xx to the mt6796
one as a prerequisite for migrating the pinctrl driver to the
pinctrl-paris platform.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 2 --
 .../devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml | 5 ++++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 1468c6f87cfa..0cff2a352b1f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -22,9 +22,7 @@ properties:
       - mediatek,mt7623-pinctrl
       - mediatek,mt8127-pinctrl
       - mediatek,mt8135-pinctrl
-      - mediatek,mt8167-pinctrl
       - mediatek,mt8173-pinctrl
-      - mediatek,mt8516-pinctrl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 9a937f414cc9..c703de72e1d5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -15,7 +15,10 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt6795-pinctrl
+    enum:
+      - mediatek,mt6795-pinctrl
+      - mediatek,mt8167-pinctrl
+      - mediatek,mt8516-pinctrl
 
   gpio-controller: true
 
-- 
2.43.0

