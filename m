Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD233B6F1
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025210; cv=none; b=px6dEVNcd87dlD/gpmjupdJwnkSwJpoSbRhD4Bp6X7lZetA0CDgB4c55m4f3ztF/4Bfv3BuTA8RRrEAy3cOLUTR+1+StxE4uze1NWT+CszKf3QnKk/+/Jb3qodbWCnj/5bnAcFFfZgitMhpVmcEwKSrBpI1ssij6QgvHT677ezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025210; c=relaxed/simple;
	bh=sQHELRsc1NbOmaM6rVh4L7StNjPdVuwaTDS+H0e9BCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYFVV7QOX2mkzTsZvAen+2qLHDEy8TQ1vUwFUfH711GYELjFW2puXWJslUajXvYqgV+hcbf1UCLrh68AyuRhH0b/oafHhCYF8tH7I0DpcW/gW2fuAUGCAqQnlG3pa1WbF6aEcAWvNC2s/Lr+32C61cgakBgvQl/f5hLatHVuLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1JsrquG; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1JsrquG"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2c9e8da469fso8606535ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025207; x=1783630007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=Y1JsrquGRJB+sEtBITxMFWr5Lva8NKEaRh+9fnqtrK6exouFA2Mgr9CD1Oix3gj6oK
         P8Z63Onjaunapw518sf0h61Yxhz0x4COHHtnwgXg0uEHR/4t2scC4AzbDNuL7hqoafnR
         7OX5miE/Eb9HKIRCXtbzi+Y0H+a0GrIQdMZWkksqkxrGwIVtpxosaj5F86De+QG+gmiG
         2HKtqC3QnhWhYnr3+LWSLuYA37/gV0OQScf9f+9ynq6+ZXfd7Yh1UgLfFnFiHGEB0ltO
         gSWWAWnb+nlh2Gype2iLzrMPPUr/y5rJTytZmFiv20OOYNRcjeIJtgcajzg2NXveA0hQ
         xzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025207; x=1783630007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kX4f21jjda4cufwsAQRS21Bz34ikOLxX1Fk3vMjHh/s=;
        b=RxmwQw1Sgvcghiagy1y/RNZ9xnEt6j+W8nylItgp8lZXS/4NrnrwnRzIQOgXonCyIh
         E5WVoOHRkA4uGtPOpHeOF4HbMUylKSxRg2/Rzy2e8v58g2KwAwfPwh59so9vAjX4Ymwg
         5uHklEBcwXgUo416F/ENFwsC9OTez+IyplyIGcqd+dtFe5Ag1fHrTrZpR9q4X/BN+Z4q
         i+wcZhnh657ELi/GRymujX6Bzir8uGwNdIJagVSMiyE9lWYK4SjWj6DUVD36YAPEifbK
         GCFq3BP78D9eIBr7p5hOD2MU1pOgSDhwsRWhmbq+Dn/M1cUAX2+fj15Hm0TD1RsNYBVW
         OZjA==
X-Gm-Message-State: AOJu0YwJHCQk/oq4kH5QsnJXayQlDwfA5Ek2tCQv22wl2MgPp98kVcfX
	BfOtfSVClHCD6n0I9IlvxOcDjsWCx/5QGnjcp48suQIy2n3nSrD4nUoRu4wu4zIBl0P+3A==
X-Gm-Gg: AfdE7ckVXPqBwso3qZDT2NhMC7YsUyvPEUUZG7oqeTe4GeIq+2shG/+uP6WLT1FHNp2
	hc6dhOx6msImp+JRfqyMP6H534mR/uQ11G+d+oIchiyXQyyhq/IaAg4oVWzf9yhJy38KXmjxzb4
	OFYxDNKTzQXkTyDlMYOvPwC2iWLAtSDb6LN4/P7NJG/cDTOHldyXN6ra6Kn9GuxQ8dFPfaIg8kI
	Ubo+pHtNi0RiK2NBK0z2+ZIj3WtZ4DAmWFNZ0BBApqBYHop8ERGnBz9kOWXTvdav9ABBBildInr
	VD31wupqBjXk5KEGph6y3ZJJ7WAcybYSBX4vsdlN4cp8VAMAjKSmcLi8atJhm3NlZfOyP5GxXCf
	PhRaeBKG64A986yp7St2bYdHEDB6YiJWLOyoSooiDDHyC+8NOC9cf0xWD2sLHJFjTxgLboLOBdm
	oKWMDernkpDTJEt519G6nlSw==
X-Received: by 2002:a17:903:1245:b0:2ca:281:27f9 with SMTP id d9443c01a7336-2ca911d8c3fmr66893435ad.27.1783025207272;
        Thu, 02 Jul 2026 13:46:47 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9004c1sm18654065ad.21.2026.07.02.13.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:46:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: Add graperain
Date: Fri,  3 Jul 2026 04:46:27 +0800
Message-ID: <20260702204628.2407308-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702204628.2407308-2-coiaprant@gmail.com>
References: <20260702204628.2407308-2-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add graperain to the vendor prefixes.

Link: https://www.graperain.cn/ (China)
Link: https://www.graperain.com/ (Global)

Signed-off-by: Coia Prant <coiaprant@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7c..641a37c0debc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -682,6 +682,8 @@ patternProperties:
     description: Goramo Gorecki
   "^gplus,.*":
     description: GPLUS
+  "^graperain,.*":
+    description: Shenzhen Graperain Technology Co., Ltd.
   "^grinn,.*":
     description: Grinn
   "^grmn,.*":
-- 
2.47.3

