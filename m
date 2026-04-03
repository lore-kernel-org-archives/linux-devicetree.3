Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D9037D11D
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214965; cv=none; b=Bp6LOL3uhQZVTgxg+OSmQ6vNUYYUU2jGYTliDsmAFAveBFv9Ed2+El0iJejJ7aMW8a7t26RQZS0JIRXWSNArAQUaKND3IyX2p50b8C8pazSsqfMxFCoMzjCVHulVJ18IPVeAVJPXBb5uMQDkDZPe8Y0l9J1lF1Y4ipvayxTR5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214965; c=relaxed/simple;
	bh=cmszwX0Ji3XjQt7Fpy6t/qmhlzCiNP9RsFnOxecQxzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6LX+ok/sYACuS8KG7GL9EWGCuYxauY/ZktIqIFePYSwLpscY2CJ76eI2yYwjBsRGDp+zWh2xV70CRScoFuV5/uscDZPjxBpFi+T/LMuHBLAMQQ1EvDeG8OPY74XIvzEadJvyRoXGpMK7tsfUXU+QNOGD1NKVFxrpBfqKQ0A7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sspcHdxf; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sspcHdxf"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8a093c784b0so25370876d6.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214963; x=1775819763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=sspcHdxf7w6J9dSFJBvSPg+kggTAQzGU9RyleO23w9BAOWp9vVa5VOl5U59kgn2Ur4
         eGZJRT0NeioAxcf+VukOtB82SYicW2ybWR1BoAwZRGYrekWtugsVNmbdhCUuYgNV3LH3
         JO6M+KcQaAIkqHeLr/2yauSvCYp+MhUXaAkQIAFPtAg7C1rPxHc2AOafpZQKaXrXselh
         V6kON61EtBcWaycwSlQW1sLPazhUu1X48aGA+5/A0Udg518nz0FtuLHzWSaZwzM+E4Ud
         DTCxwlTahUCi4VaRGMpKpVF1ypdzeLpdtg9CUJAZPaXbnhI0TzHtS2CDkqb0wqHFfT+5
         FuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214963; x=1775819763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NICNW7Co3viLg/bgtUjVDeGjmH93cilbK6h9R5fkil0=;
        b=hv1+KCVrv+CnkNHcrAFunFbtkf5ekoT2H/kHvOjIS3bOkGd/H/vB1+mE7BEnCInNwI
         iRWW2Tns9iuzg0ZtbGVag9biofO3tDwxwbvOxruyseeuEwQfnC47GFiyVYda7Ni2t3D3
         BYXcqa4mw2nT8gOGVaN+Ch3epTeCbesAmnhJBvP3bFXp434P3OLpcoRgBYyrhe6yZdUe
         bQjnS9jtWeEXZEh87H9Pw7XWyC2DAIAqiSl0nK2ZBaO9/zlSUOI+EvazeoH8P22ySlNc
         j7Im3sOV9O68DXD2S4psDgWC5BI4Ol/3vr6wTlxXknPycTiIiBZKxxnSNQ64Vhu6Nd/L
         OgvA==
X-Forwarded-Encrypted: i=1; AJvYcCXPaOFKRCJ37zxHazUeOc1bOqU1kLEPJ+RIZSyKr/13H/sQMOuOq+wKgLyB4DiZSoyj/g5t7bx2niG8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3AsWndT6/X8YT/CrXr9gL25sru1RP6t0iBA1eiv+8nO39/6t9
	Bc7FHIfs/ty14qK1SMRwOgOG3HNV+t2+avp1wx9meTRw10P6JJdaTDuD
X-Gm-Gg: AeBDievecyqbtQ42YxWvomXAnsogP0vHO0a/Zp86TOCluDx/uioM+woWCppOOY0aEKk
	vZhVq9YDa2WVx10oUjlSecC/lqAa0sREeiuhEMnEPhrjPFvma03umh+YgdCmYlNHvPLSXzQC/pW
	f3hc+cXPLjefKeUWi73TwICU5UnbtzXtJrx9EilBaSgACwvDbi9+NdrnizLG2r7BatmPrVZ2jsg
	nYYL6vg8HFs3UXFImERdwYsXyLObaly0s4YOM7Hls2iDUMwpyjAXFWUbIXWjwm6rPD/XyGNra1d
	BID/ALgrdobk4XPvZrQ8B2gHqRpgJaKLqzGRMnp47L0YEnYLiZFkaiEwRpw1fYphXUT5gvsK/Gp
	6EUvb0UqVE6Od1f5+ex9j4Hrz5SYPkRLy2I7zGgIEbDf/WazDZZLtbJ0UncIKEUf5Vu77bz28qZ
	u0Ibh/AqYArBptZ/LnmF1ahc6RSww+
X-Received: by 2002:a05:6214:4186:b0:899:f6bb:331f with SMTP id 6a1803df08f44-8a704bb884fmr39763376d6.41.1775214963119;
        Fri, 03 Apr 2026 04:16:03 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:16:02 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Fri,  3 Apr 2026 07:15:14 -0400
Message-ID: <20260403111516.379795-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible strings for the sg2000 interrupt
controller and timer.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index e0267223887ec..decc43df3c839 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -73,6 +73,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3bab40500df9b..54266b3c2a185 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -50,6 +50,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.53.0

