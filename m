Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6830404BF9
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093446; cv=none; b=P7/dOYUnXert3CJ6BOn2VvRXbvDpC1b4hQnmQHpyc6wDC7xk6y5xdJHmc6H/I7fQlJW7KmYzE+WMT611YSyeYuG4tuhQJQeHeCTaTYSjhFYZ1ru3wvkrM2hp5rIC6ZulAJDgV9zU6BegFzkiEXb7iOa7+ce46NXFv/L2EZv0KDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093446; c=relaxed/simple;
	bh=st8y4T5YN6SqtZtFwtiBYLCoyPi/Wo5ON08Qei/HluI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5VlxRpsraByzW+InxiKyXN7gHXS3JdjDYqE9AkDvUSC2MSen8xCZHsBssVZ8Ob4ImvOPH+zNj1nQgHRIlr2fKy3URh0/fi3u13TY0dOAUBG8Sx1WTHGPnAHf4vT1snuk7ivPnFgNwdcu2H/RdrjqPLE7SFNj7Ap/Ispds9OSn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9VNqaPG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9VNqaPG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf13f17da8so5475755ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093445; x=1781698245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=F9VNqaPG4Kyx47+ajbtluehGWRWQKWXDlABNY/1xYNWDLswUMTyucokEQbSrF1GEun
         ytJ0JzvagnTiFTKRNMYAco7BBXk7MZYAhBN7XSTucBJAYEibI+jYjdOUVmCAWpyh+Tdo
         8HL8XH/CUV+aA/5AYPybvUYNAdcEFOfv5wNyjn3JUVIi+PY1Fd2nQAdUCjbemW4M83vv
         FQFrC3j2FbDz5iX1150pXc0KxwXbbRfW3V7sU9LP5o4ZnIkToikI1u7npWXag+s+w7YQ
         Fe9+qAaB8r00Os8lBAdg7qgeQjn9C0zwrBUwyk+mkAJInLQTXAAx7YHjWNskwDNq6Nx3
         0ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093445; x=1781698245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=akaN59wbiX6bHpsjH5PLAY8IrAH/V3gWj4+VnHoIFZkRc4Z/uvuwyWNq5cKPiaA79z
         ZG43AwFYKpGNxRS7nD+Ug2AZPEciNol7em2FcMYYttgAxLX2ZBEvMGYlWWQrL3O1BokL
         tgSHTyo5X/s/w8NZhHzPApA8jzmgLQVuI+1uNNQuF23e9QbGs3ZDskv63JsWApeCXn0n
         i7pHk9mGYRzFz2YWkvDk/VYCPp0N14gL9EiM/Emy3T/cgYOVcjmrOtnAOLJ9sKj/rxy9
         fXB57qapbYBPJkv3ofuHA+KhgNo8Ug+6aKs9GsRiUWGP2IF7E6pPNvScfg+UoQUPQrab
         5pOA==
X-Forwarded-Encrypted: i=1; AFNElJ9hUwNImGigrxRWsOGE3Ok4IrJ4V0ig8aXD2pbjHi0esCG70kjfgqKGkMCzctTiQ+ou6SzpeYkl+ZH/@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6z94WVbuWhqxwylHK/U0uIXtCT1Ndd5JAkXHVE156Lgf/59T
	1isLbK/fYqNcn2TbJBi2N+vzoZMsN09+ZHuGU7rknl1aoO1Ad3ixRhIE
X-Gm-Gg: Acq92OFUshlLQ9PA834EO2OWPYBNgl0wMeL4R2EBvV1tU7z1ZdXXsPH/Gb3Cea69DL+
	Qt0iE1ZUuLa9JzEHTMEkiBNDnBDg1n8BzZxXFHeEDQm4GGxFrJadkl/DlfxjJc6CbuXRfIxIh43
	A/CvRDbFZOHL/rZuAfeY2f+9Bjm37QGs9VV1y1ljcZO1X8c+hHsXn1XOGrUiLPljSomy2rzy8HO
	N0SsIb0fltQPs6Uz/V0J4KlI5oAHUwyJvZ+GbtHJYts3vtN9rsHOCvCVr0Svi0PAG4OuaR9og6T
	QraFS8UqOTGc4hZ3AlUKBpUAyJTrI6Kln84tUlslp99vQ/k9hZQkh7ZJXpdL39QemW5ELnU3ffF
	QSuRaEcffoIKiahh2PiWpWBS0fHhsH0e8VlXjYOYL+XPRX7CxAsoje0PbVcA5FHL7qhNjBwjGCH
	+IeiRa4YD9RI+DdbTGfMTF3P9dXpb4q/5QP90P
X-Received: by 2002:a17:902:e78f:b0:2c0:b359:99c1 with SMTP id d9443c01a7336-2c1e7af05f6mr128447045ad.2.1781093445308;
        Wed, 10 Jun 2026 05:10:45 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm245738445ad.26.2026.06.10.05.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:10:44 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Wed, 10 Jun 2026 20:10:09 +0800
Message-ID: <20260610121026.1517621-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..fcb1d905da7d 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo256m
+          - const: sophgo,sg2002
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.43.0

