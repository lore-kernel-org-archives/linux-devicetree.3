Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842AD36402D
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472173; cv=none; b=P3g53fX6cURKq+lw7AwoU81QGuX1Wmy8H4E5vnx4Az4imjGJDNKIUFx6XX2g0MtN4ltaeXty6lEgnM2Kk1+uppl5yKvdg85ghtKXbRBFb0K+iJNDWkav2HSxq/mBcl4VZ2ilOmbmuYc6d2UlOkgQCLd+1GTI7avEVEMNINAYl3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472173; c=relaxed/simple;
	bh=mY51W8N7ujzaXb6LJXdsNTCXlWZK+x23C5q8MIUExQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuBXPx2C0kH1ZTMFeJY6RCDRFwCkFgyqffqMYgGVLyNsyiBXDeCJUUdrQOozfjzaZQnKQdZFiE/ljARtIg8q03bQ0nh+aVUudZAhPk5FXmn640G+65t4c10QDynNxVfM4Si5MdQcG+MdZrYalRjQ0PMjauHqYqUZ7CFXhy5jzFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=reUSZxwT; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="reUSZxwT"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bd85ebb368fso1125829666b.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779472170; x=1780076970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLvNmT5N9xfhkp9ppRLQBuLBsM9Wf1Ff3VMJ6yk6VUQ=;
        b=reUSZxwT5H32x9jevRAp+lVNO2MW8mdloL3VJNF+6PxUXHG468g4GOdeiCn2ECOrwv
         tcv8780ViwhvW8vFsWByl9KflG37xK/5Eps+bOwNkrcMN6tqW6hwZ/I3txGnDIgADUFi
         7/qPcmnHt4is6VGjYvLL54Il9jtjDXKNtzZ30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472170; x=1780076970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sLvNmT5N9xfhkp9ppRLQBuLBsM9Wf1Ff3VMJ6yk6VUQ=;
        b=fWNyg6LMSYL91ftSwBdUr5prGJKFcWahWRLe3Up98xI9gKAm7P2lTmRE5DlGLu/5yZ
         4/D6BaGdtOiXmgUFzN4zQMKQ2DdLjB5zs2ZweBTChQvfD1Sd1KxZ34yyAEKhin67qnrp
         f9gdi27PUcgf05ES1TiM5sX1588gibBIYdsIU65TvrzgKKOiyjlJ2F69YJACVPyr46Q+
         5hnhGDQpgr+ggOFCV2xK8OomqYXcPkuaxeEM/a/cyA982AjQ7TpZV6TR/yyrVrG+jIt4
         4F1IGeeRn0i71nVWKRy35QXNSv80aFy4NAGhGwfe7rLBiIxdP2QT/hSawz9RJu/SCnML
         /Qhw==
X-Gm-Message-State: AOJu0Yw+wV0PWXtN50kChNVCcWeBKGuqNquEPRs3LF8dy6UVYAeSL8Cy
	5wLAqGXsEPK01DePktdwuI/8qTrae1zz79TE83hckaWU2qP3pGRhG4kWpAPGnHYvstqj1GK44Sy
	KmPvwOac=
X-Gm-Gg: Acq92OEOWVWjMbqAUxQVfeoBmLj7LaFnvi/7FjKwGg89KRk+C5+X1e7fPigL8dkBLWk
	AGqurgqJikBALNpbs9/ntjyzBzpxGvqoERY8dDs6KIx04q+IIKbK2Ct0Ak9zfwrGbRHNaM+q1Vi
	ht1Irz/X3cEFFkSuArGJ8wsPk0rHpRe+HVb4WSZXIXiVXTTAmWsviGYJFUkLHu7gNVhTuZmMQYx
	A3PJt5RmxXHhuNb68PcvRZeliNBXlqUhSk5uhGUznOeey2pXI8O3BTHyl+puycKxOOOiwepHDOM
	qLBVObNRRkv8WuFNFMnwP0h+pp7RbHw4zpzRKkXemSR0+f+xkiCw2Xj0Uz8u4i6Vz5rCSdvdnGk
	f9+/muMhagnaTNVu79+bHLe3CSezHp4QAFpA4I7nEdSOSlEb/tA07wTWFRfsA0ZeLSMYDIoDtVq
	098OQoTnI/SJscFMxigeFnYxMNxj6cjsyKccfPWOGQxOfE7gn973+cEDi97E1dF87aU3yCqg==
X-Received: by 2002:a17:907:75d4:b0:bd5:405c:7964 with SMTP id a640c23a62f3a-bdd26fcb78amr208821466b.48.1779472169899;
        Fri, 22 May 2026 10:49:29 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com ([94.162.24.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5eca6f9sm74302366b.38.2026.05.22.10.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:49:28 -0700 (PDT)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Axelera AI
Date: Fri, 22 May 2026 19:49:16 +0200
Message-ID: <20260522174918.61523-2-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
References: <20260522174918.61523-1-patrick.barsanti@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Axelera AI is an EU-based provider of AIPUs for edge AI inference.

Link: https://axelera.ai/
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..595ad9423ece 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -217,6 +217,8 @@ patternProperties:
     description: Avnet, Inc.
   "^awinic,.*":
     description: Shanghai Awinic Technology Co., Ltd.
+  "^axelera,.*":
+    description: Axelera AI
   "^axentia,.*":
     description: Axentia Technologies AB
   "^axiado,.*":
-- 
2.53.0

