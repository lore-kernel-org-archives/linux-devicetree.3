Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D746B38B7DD
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787207202; cv=none; b=paEz3Azh+ETVgihNb/R8Qb4pYpOaQrhtViHr4DapjkwT7QFVuIU7GMAGkOLUJ+uOio1u/mRpQEbdppAjaTiDBhQGzkQoZoftEJxi7Z687A7Kg99BWVsKmhxBj/psnnwDXyEjtnJIzHEY8TtB2AcJbIrGpR7ox/GyMcAujMIYBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787207202; c=relaxed/simple;
	bh=A/JEzo4oku0tiBbjsBGAehAa5pJ0pwG0ReCbeYNLryg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pRzyUARgDhSM+Moy+nBvYwt2OC036M/FD8FeNy64S6HQABKAYlEkjTZ/3G4NJsUjCN5uBS6yeeqh37CkVjYhQrkqIU1grZhyDk5IUBDsI/NqgG89q5J7eEghmsl4BOfoYgbIKJ6TTbP7r5bIr+oCbHuYqUSNwf9VOi2Nf6pnR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=X8XI9sOc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="X8XI9sOc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1028352f8f.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 23:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787207199; x=1787811999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qm7SmvZPsHEoC38JCT2btEmORYaih81ZkIr23Ib+H7c=;
        b=X8XI9sOcw1QdcAQKeCmby5tWDhM0h8ZKfEO0V0aRPlso5iknCYijaFzskh/XQMy9YG
         h6wPOTAH1JsUi/GiGdr0+39qI9SoeQWgiQfoILUIXuHfniqA9az/shPVpmO6AR9fz+nO
         jTQqp8wFoYCCwl4bfLmq3KkoygRspW0NBh9pOzniZ7spp9LJMqOqvTJyYE18n620UG44
         ywfkx//0eIVawNO78WUBzsF3RZExA9x76RoBGWNIHMRgbNtDPoV2fZ1cB/cER2kU+5Bk
         36w3CwN7rCp8CdKegngdTx3gMVWhS+XwUBbOJKjG57GK4HqZlpdBKeUeV+uAkJYkFfbo
         E0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787207199; x=1787811999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qm7SmvZPsHEoC38JCT2btEmORYaih81ZkIr23Ib+H7c=;
        b=sRXh5n/kRQPWNEXyg5aYyeaoQTfaxNmWIRkk8C7hhRG+N9RdevnBklk5dWJRl5LBeN
         WanC99vbnT2zIN8VH4twKKc6Lx1viILM+QsS9DZnfDSv2aMSvkMO/O/qW6YVaWU07qz6
         RIsXZu/S2xYyb04wAZq8Buqz7a43yODRifGtJXYwC8gDIVDLbuHn4vVyeBDXm2q+PzgI
         uwJv2pXmUYAyNcG13kptvEjWqa3Qwhru8yntsS/K6lZYMDOywY9W2sQy5RbOZMlClq8g
         PYPMLPplLFVOxWVk7BA1+9SzJ5mMH7EfbnjQ5tmcg7JboFFBlQ7uc0SaIy+00GntMxP0
         3xhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGBT8ANIp13uRcYfHxttQw2uZEdFc3PWnVFbSGW5WAn79IqY+t4rmAJfGScFUeGBkBNkU1gQ4MZfI7@vger.kernel.org
X-Gm-Message-State: AFuF++l3h26wE6noTD5P//5qZcVSCtKjrH5ERE085e4yHhE8y9wriusR
	DzYvs9nW0AL43eKhAxGywtXJxGP9XacupwGe+0PIqzXtma8hJ4cO+0H5E2VXW8YOUAY=
X-Gm-Gg: AR+sD1146tAVAfYPtgoHErJRrLszpOC9HTbjbpmgtueZndA39/NVPLiXAb8izYoaODm
	XdJu6u3XyXLTJn/yTFe6prjo2aPTcdPngxl1ap7UUQHi6XUIpupexYXnqnbN18tXvouZFsTF0z3
	+iPn0rEa0HIZVc7JOpwnXX+Dft8P5BsABNxNiYrmHhPncnQGC1gZTQdLf0tsGCNrC0D9hr00y0F
	gUbfvIO5OZSpRk8jXlpZNZaYqndi6yRsMVz++NJjT4XAYcpIOYikPB2J2YDXcZOGtFZbVFgEcHU
	RHQntGZyX/Uf8pE01wUx5U3rAj+O3mjnsrSfdSpFzz7tIscWg7cCRY9LEwKL76kjFYe2lUbN0XM
	Hc1uUIw+38UHENHh2hkfMv3Y++m60BPQN+3j+LLH7dpG+BoWTQQYCaiMfuFV1n0022SlDE3B4dm
	7YpBxsnCepbgCZt5dDxymTPQPKxn6cIf3Q9HSzpi9TdURMQolwkgBwLmmjplYrhapSfUW7HHNsL
	GI=
X-Received: by 2002:a05:6000:468c:b0:482:b813:8315 with SMTP id ffacd0b85a97d-482b8138536mr3858488f8f.21.1787207199212;
        Wed, 19 Aug 2026 23:26:39 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.23.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441725sm9980054f8f.3.2026.08.19.23.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:26:38 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add ESS Technology
Date: Thu, 20 Aug 2026 09:26:23 +0300
Message-Id: <20260820062626.39218-2-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820062626.39218-1-karl@asseily.com>
References: <20260820062626.39218-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for ESS Technology, Inc., maker of the SABRE family
of audio DACs.

Signed-off-by: Karl Asseily <karl@asseily.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e..b3cc100388a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -549,6 +549,8 @@ patternProperties:
     description: Seiko Epson Corp.
   "^esp,.*":
     description: Espressif Systems Co. Ltd.
+  "^ess,.*":
+    description: ESS Technology, Inc.
   "^est,.*":
     description: ESTeem Wireless Modems
   "^eswin,.*":
-- 
2.34.1

