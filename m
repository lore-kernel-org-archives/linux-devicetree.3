Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC873C2777
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178705; cv=none; b=CXDOsFlEckroH1yJ/aAfBE7WsYeClyBogOmJiYkMxVZVCL31CGJFk3b7cwiG1wL46UahULZVvPzb9BdZEvrF6S0l2MCcTliEJ1jMGazzoN6et1XYAdHo++RoOuBg4wDT668z3tuTtoC6jQ0uXgUu48hNM/w0YKi7h59ILnjKwdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178705; c=relaxed/simple;
	bh=RNtC37zOpHstQuV6sNG5EMAYqFZvbNq/Bx6wcnohDYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzyiVI7OkqkoWgVS96YdeVnueuCvIOKLmaIzzrxFJQjvcJ9xBM1TtqudJFHD5tdXlSJEaMzYJzDnAg19OTbBHZzwzCAEZr8M36sLbE93bVp2yh1Bq96FYe+XYBHRcmL2hrYyPz1II90e2npWYjfT8DPAh9pvPWobn7JaOOfhFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j04KQqTN; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j04KQqTN"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9690c99c917so1055307241.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785178703; x=1785783503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8JFxz5EfONgp0uYH3QGBbFN0zrTrYZvMAfW3kWL/zY=;
        b=j04KQqTNT9I/zwx9EsfDBKlQ5uiQD6ByM3QqndeaymqOsaV5uXt8UzfGm1CGP71/5F
         oIeoNnV+DGCl0mD7oNEmsMe8PY9osjNXNZ1/fPOLraY4+yeV/hy9o7MIEJTiltYhClvF
         BFKkm5Qb1o2GMuwvEMReJf/t7i+4m9fKpMqBBFc34qUSnT4MHwYancTOzFco086szDms
         9BY8HzISmlg8cLfvBAkTfj+6phFYgJlZQSD1Ns1TnYBnQum4eLmpKUEuLOOW6Y7d6Ptn
         z/E0R0VWT40qav0piZjVJeBCbH2HiJJenvwl7FG6bieK6hBBexvnrgY8FsxZugSXwLLb
         Uh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178703; x=1785783503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8JFxz5EfONgp0uYH3QGBbFN0zrTrYZvMAfW3kWL/zY=;
        b=BD8idEqcqGaYWgQI9EFVABWNbT1J0erUg4Ej31Bwe2qCbb/aF5RuUt0MD2grrc23oZ
         fjY5PzmsAir2R8wXMx/WAf1hECIwMS08k6sld8q5lRXkvk2Y3cexWEePea3AXV41X+WJ
         ycNE/kxEeHRLLmEioM3x/Sd8R20eQIJHLAWdcdL2HnIOvE5rsgaj+xj1ZICcxVgBhFwh
         Riy6fXWWhTMYiu+1tKLsjZHLWsA8U2DGV+WePo5Zp4N/ZKdZiCjE7I7T1Dj0CSpbd3mT
         YJAu7ZSTWzwppF3VgKjQsRN/PJkvMKA5omZahwUmfxktB0hKJwhKp0j/kHVy88gsMDgd
         2ryQ==
X-Forwarded-Encrypted: i=1; AHgh+RqqAJMgvUhrHHJlh85bsfCX69XDmZJQUXdzK6+v0flmikany+PUxCT1IBgv2rEfD4ldtkKPkWGB4i1t@vger.kernel.org
X-Gm-Message-State: AOJu0YznQnOLn0ClxQHH/DQNBfwi+qhuRqe6R9VlkIteKfM5WeBh/3sl
	QLAgW8HSzy3yvO3XT2KFYW9zcN9Lff20Qy1M1FMTFKC/zVZmQpytET5jDE8dIQ==
X-Gm-Gg: AR+sD10OREY3kJDBxmlETdjMX2XS+7SozgrUWzENFl+Xi70EbVKyUSjOlMfqyZXYtwh
	omcvezcSqpeJK41ccEz+BfbU13qlXszgndIB0UTFaLiwNH3wXmIkg1yNDgEklq0dbfx6IOFVnYm
	g6UL5i2ZkmlMm867P2LGog6DgkPGFk+1cpAiFnuULtnuwRv0Wfn6g5NXeTyHjFoFZpU2dGMPWkY
	rFsTMjpg7oOP06kLsgT7tWK7t4Bd3YdE6ei8y7zGEJr4CVy/fbfYbzTyngqGyLylEFxXQxeTLwb
	f3SG0vqogYgsrPwN89s8veXNwcHG03J7bkNtIOxtxxDiEdh8sNnQXjcnYx6f5LAjI87Y30a3P0J
	ZfjucH7K+KG862+0yxSrGyoq9Mt6nxA/OpZKZqB1EQLy/WzQ0H1oZZmh0Ez5pKKzBNXllFoUIVo
	6hbcgc1WAsJLddek9vcX1jUYqf0dTy18RHMlHr/tGAo7rLlJB4HP5lZYqZ6jdRGEhqP+KjLb7uI
	zVKbMzCzwRZOfyPmYt4cBKHo+WsFkfb5r3xI/K/FPlQo09f
X-Received: by 2002:a05:6102:5e95:b0:740:32ae:8ec7 with SMTP id ada2fe7eead31-7542547a5f8mr465862137.23.1785178702885;
        Mon, 27 Jul 2026 11:58:22 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:21e4:da15:d321:6b72])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-750343701fesm6294833137.6.2026.07.27.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:58:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: realtek,rt5640: Make interrupts optional
Date: Mon, 27 Jul 2026 15:58:14 -0300
Message-ID: <20260727185814.2599488-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RT5640 GPIO1/IRQ pin can be configured either as GPIO1 or as the
codec interrupt output.

Some boards, such as the Firefly-RK3399, do not connect the codec
interrupt output. This causes the following binding validation warning:

'interrupts' is a required property

Make the interrupts property optional to support such hardware
configurations.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/sound/realtek,rt5640.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
index 2eb631950963..922fe161f4d7 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5640.yaml
@@ -135,7 +135,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0

