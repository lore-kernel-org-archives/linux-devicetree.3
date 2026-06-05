Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6851B453482
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643402; cv=none; b=lH/nKVQ6DNsL1zRDW2x3L/eJfDfoGYU1IQi+KQQQc+SGSydS2uUkG9nPYK4om1E+qMUjKmMzSaMlgRNtlXcink+DLA4WjwbzNVbMa6bt7etjw7nceE0D0SqyTZq5ssQMveua34R/44cy6r0ZiiCOOLli2zuoDnkBaEC3yNddne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643402; c=relaxed/simple;
	bh=81QWGp2xwz5I5iCFmW4tGpxlb1ZZCK6gGl11cl7Gxbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9nutPPBEKHJKzQn9bpwpLjUEGfSMeHnhFbsmbFmFf0QSxw/CPnCqZ4lLZBWut3/N9cH0cvTZNh3xVXCIhnu9M1BUfrZ3BwVDycRqqs2/k2TfK2Zl+TfXpH127Kfn6NM+XZBHMI1JjgsAVzmS1TTDmv/XaNKZ+EkGlqRMa76H0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiQJE1lB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiQJE1lB"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso7086075e9.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 00:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643400; x=1781248200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//utTjSSQFS79aIABVKNXcplPpUF6UEdGauCN88OgVs=;
        b=OiQJE1lBfqJhsNSGtRE6hvNCZl8O0JH/n7508pOaG1Yj4F2I6RKttuwqTB5YKQQl/Z
         E6x2r/4KN8KIHaU6pmmeH878wdben34ihjWaXwHAWJHS1fsCDPlZzPmdoRuMG4BdPZIB
         Dl8GlQtV/ViusHFXgkanRfIYGewpeIiL7/mjpuoKz+ZjB1Pw+ddj+gAzcMJ/VfgC4UFq
         ekjq0oBKyIFvt4pyXL2iMKg1W9ePRKVw6suImJwuSwGKmafKW+5SuyUCa+QHoxjMAy+k
         jDDGw7ZmoTkuyGfQdIyAF9cUwoiOgWl3byEhUAmjmC88boVVkyxFijC/Z4Qy50Ar23PA
         h/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643400; x=1781248200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//utTjSSQFS79aIABVKNXcplPpUF6UEdGauCN88OgVs=;
        b=QqNwG8lo8ON29KLh4b8OW+DfJbvH8cCF9cdBarwqGoazAsBOsiT8L+5gbcJ8x1pwVo
         EbIdFIbHDiVMOyFDFp/t2JIxnpmt92IGiURFpOsrzQMuKJKq4IcT9fjA53feyMbCEIM/
         k4O7V3zrxd9Qga6iMu5JtLPDgHC5Zfpgx3uUUxOLeKUfBJlXXkNK6T1zDp1r8Up4bKVx
         ySbaJh9UJiBb4f85TfpYDOfJ7j5KBR8C2JCf5Z+C0egLb1WgPUArvGSmyfkPes4zExDy
         loAH871jn3JdVAybR0KB4e47w7xTWGEBGp//6JmyF2yymcJeJf6/6kqs/m22EGLK4xp8
         82/w==
X-Forwarded-Encrypted: i=1; AFNElJ+1EAfhej1+jJMFyhkshyiO2rXH3jbKJfPyjXGwClbf+TsTFUpQHmretv5XdGabpp7NSxTyDWZA7mGz@vger.kernel.org
X-Gm-Message-State: AOJu0YylAbJ3edVS9aHLSv+N9SQaRiY96g9x0QcKVrgeRZlhBBjsX6MG
	PmgcPWB7R6QMwK2rcoPwjYx6FCxsBsveuz6kr4tMit1q6NrdI/zJvroE
X-Gm-Gg: Acq92OEv8FrbU+23CxRVl8NSuMOxhDmjBLqijILVLnzgDJbDsQFhXkTT+DbxP5CWjOm
	qkiiNOHhgEPzzvKEvUSfsUlMS5rwvnxha780ixiT9uk0qlxv9GBWonta2nYPVQlflVv070F2Rg9
	L0LdwKRm2UgUqPw4aOl6lNDb5ne/u7+/MRJwcBl5epBpFgoU0qbx6ALq1S/u7rVvVzCvkXlZDWm
	RafR5xIXEO37Jokwl478j64yM55o1oW21qI0+RRuTUZQ92zlkJp6OVHP6q6lEjEUwwJtxtplDqJ
	xzhcFCQZ2VZv1/eK1sfjGWUMQCdDy9juG+DfV17tyWbxY46QByJhLssIrLR5V5E1bvUH5nyrPP/
	fCTznj9TkesGUg1YPKQEPcqPAGYvw3ZkGX+qOxYteHV/dI7coL9gPopT9GBqH0ZAB1sJO8XwUWr
	Y4MLbwdnHicW2hoxsXqALGcI3qBEEBoOo8LHzyRFJ7ktcNTMz9GgtoxiYB+A8raPht/GwAI98XF
	hXEPE6hewuovSidJKmffw==
X-Received: by 2002:a05:600c:3f1b:b0:490:bcf6:46bf with SMTP id 5b1f17b1804b1-490c2599fecmr30837895e9.9.1780643399552;
        Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v4 2/7] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Fri,  5 Jun 2026 09:09:16 +0200
Message-ID: <20260605070923.3045073-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0

