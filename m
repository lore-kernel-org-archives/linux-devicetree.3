Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC27B3E025F
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350566; cv=none; b=JECofe/5sBGxRU+PdlXZLcZA7KOqykp9dQkBhS5ziKc8T5zkoJhsAui1+hAVsSU8ODCG2Po2TVJ3F33JsFVdmipWTXIHHTEDSQpvgu82vhP+8d1GSdDDRzJQipElTdTXrXR8FcgwKKINLd8QwdCWPHr5iLbP720Cnvyp1+rF0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350566; c=relaxed/simple;
	bh=lNett6iejLsfwaJeQ80UJS5S0wekv6jUzKXG7ijjLbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myUtXmTtC7+d4jx05YiYPQrTRb+T4WCqKQIVYXhRXQE2mTvguN4vcC9HvIM+jLNHE6sl2Yna+jXbczCOnA90WUfSiLDX1lgCwcAshzbjEDGFar7FhaIc/OmvGjKbsfDxCIpO7Q5qKdRPXR+0Y92i1a+5Z+6KrEqmmBvkrvjaIDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShEDho6o; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShEDho6o"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b97f9587e6eso1139052766b.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 07:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776350563; x=1776955363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dQoW9IEupnPf0vdvP3gC5QucYExC5rqYZAdJ429kig=;
        b=ShEDho6olUVEGBGJTjv3+w+BA5wC8srcrSKeNBKhnsFxynGAp6YsmeQI7Bk9O9O0iM
         9dYoJLB5Al0zxwad1/Z6FciSpvNcFpdj2FSI/B6H+dlmpP0zGGYdXv1vPKqw+Jiy4+Ti
         BmEd9/btKmDk2gERdxIKF5YaZsODlQEeZXqlWr9BkQlQtaqhE72SZmblRvDIRhgRVVD8
         R2/xav8sAvGhKQ1qbd2IlcNxKpdE4WL48SwEbUO47poXmDeJAtE/UtUPxrA/dAgRGKEQ
         4Zw0F9X88R1Vkf3p9lcO45c0pO+KSIL+jVaGDXmWndDu9kVdgEbmFQYFwYOL2o72aWNP
         CYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350563; x=1776955363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0dQoW9IEupnPf0vdvP3gC5QucYExC5rqYZAdJ429kig=;
        b=PY5SxWpova4Sbs0KUUZlBir9FTSuHpeXq4EUxdytTxF7t+lASZcrvgbUT7Vk7O+PrD
         8iiJwLWTwXLJPLaiktNNKh+h0HXYGuRoQ2X9MyUMqACZLkIE2IZ0xsxFknLq7CnX48QU
         UmrmNXr5KmcWiegJHHuwv8CBEUTmz+avObyJhvV8hzM/cMdmaQNb7Q5xF0JRSsg6Xddm
         zNIqdfopn6RRjGNnWGjx4+lB8DROXqWqvQpI3qb146Wlw4+p6U7oQ3Q/H+q5dPRJlNJj
         NPdi0mMMHqkoqOZsq0Gbg2s80bk376iXWBiwf6YuGvRvYkNWMGzhZWlvzrPu6c4/IX3d
         XPEw==
X-Forwarded-Encrypted: i=1; AFNElJ/Caq7HTvrl0ewigX/dG3+TraZ7zTs11tAmoAkmeshpq3XYMAlIoY1MInu4Qzk8gaXlqXo8rSOzEmjq@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuAHJxNoo85eef2BbUlBuFp1muPPZ5dcVgjOS2C+7hOnUvEVf
	lqA5hQCD7YTSb0Q2zdviLGpZcSsvE8eO6WbsYjIrVhZdR32LjFMG0RCq
X-Gm-Gg: AeBDiet/5c41Uh+O9YSQobEskb0fTKQLzXrqcN0VV3xmIXfzzsmtBrdbxoYIuY6fJs4
	LH2as82MzpXjRMK/R68iIp5FSp11op0F7quNyTrSo32QZT8EuW2S/GpHndQhJIesJeWwRzeK5ax
	Y49bOjTFLIp1q99fSKWUIDklwNco16+oioCwx39mQzinn2S4++tQrKuStWCvFjWMjx2tvjsEmcF
	3H8kEe8AMiN/Cqb3TqRm4W3pNANPbc1mnwyoRw+Aeh0yZ0UotT9ndErZm9hIWxTqAXl4i4/FAST
	1o3iXorJpUnajUHd7O3UGcrANyqAjhMvqKTgYIe+l68q8R7ChkECW0xWsDeF/QirigXYJdQ+r/S
	7pYNkaDmwMAmTt3v/1zHMRtuapjMYVAkorwuNvAwzlWVJQsAiuqTENcyMr7mwA3OJFW5XfkQ1Lr
	cW7XtC8oh0YJC4dMMixe9xVOrC1aTFhLKONB2I
X-Received: by 2002:a17:906:99d0:b0:b98:a49:a22e with SMTP id a640c23a62f3a-b9d727fcc57mr1457033066b.36.1776350563046;
        Thu, 16 Apr 2026 07:42:43 -0700 (PDT)
Received: from iris-Ian.. ([2a00:20:636a:3838:3bf9:3a9b:8000:4975])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba2a112cc9csm90502766b.40.2026.04.16.07.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 07:42:42 -0700 (PDT)
From: iansdannapel@gmail.com
To: linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mdf@kernel.org,
	yilun.xu@intel.com,
	trix@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	marex@nabladev.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	dev@kael-k.io,
	Ian Dannapel <iansdannapel@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Dahl <ada@thorsis.com>
Subject: [PATCH v7 1/3] dt-bindings: vendor-prefix: Add prefix for Efinix, Inc.
Date: Thu, 16 Apr 2026 16:42:34 +0200
Message-ID: <20260416144237.373852-2-iansdannapel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416144237.373852-1-iansdannapel@gmail.com>
References: <20260416144237.373852-1-iansdannapel@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Dannapel <iansdannapel@gmail.com>

Add entry for Efinix, Inc. (https://www.efinixinc.com/)

Signed-off-by: Ian Dannapel <iansdannapel@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Alexander Dahl <ada@thorsis.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 00bffb9c4469..9e20384ff624 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -485,6 +485,8 @@ patternProperties:
     description: Emtop Embedded Solutions
   "^eeti,.*":
     description: eGalax_eMPIA Technology Inc
+  "^efinix,.*":
+    description: Efinix, Inc.
   "^egnite,.*":
     description: egnite GmbH
   "^einfochips,.*":
-- 
2.43.0

