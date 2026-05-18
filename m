Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD4331B80D
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125456; cv=none; b=qhdYvYAZtINeLxTF6rNVAHLjhwsuH/TtsX4KL0pwsRRt4Qwmq2W7Tj36a0qHmUHSV3LcX0FdLDzjXiLP1LYc24EhZQsuGf+v8XjdBRvUkyZkYViVEdSQ4ZgJqJj6ccA2fuFPi++E5tqaPwpN6nb3ia0IJVuJ2fO8e5C9yamtr28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125456; c=relaxed/simple;
	bh=cVR6h3rkGrL9zNSGot5yOVYOujBEvnXGWmyJCWYxP7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iz72mAxm+Y97FDy9oLXL+f2xB6s35ALh2wG7eA1mbE1JfkACEHJV+rimL4W8w9ib+CipPew86AVBSl1uLeYMjLYD2+AaBv1g1nPSzkuWN38w1qJi66wmjgiANU785ixLQqTgo0hcCkBaxGZSGDAtYA8+f+LO9jUXvQSxZ0OFiM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amVoc7Az; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amVoc7Az"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36643b96b99so2454614a91.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125454; x=1779730254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWw2oT1MTBc+8KoSj6yzkVCq1ZSMsbmsrBxPiF/hchU=;
        b=amVoc7Azj6n8G/WN8yGXwY0tUOGp2ZpHr6g2ctq+vjwitrL8DNpEJH+YqAF/jhmfoB
         CW4F7Sdr/04Ls8pxS40FaTHRm6nXaXgLWUH5aGMxgN6ooDqxl1NwmLxsVKlgyOpkBuIh
         bWEPQiPFNY9jLz32Yij0NcxJlxQXxrPDVOL+1GEqiKoMr92NCAwqBVTnwObmfIvG3BRY
         XunkTAs2q1TciGTo/vF/OQH9/FxSPqwMne4wsrc9DJwmSDIbxea35mRVLrlXslBwWBQD
         ym/j5AQu8uCF5aiXXKzyfX7RBtf1GtXJ2QMeRr+7sTHbZGjnfeAaiiw3gUxbhuI0229C
         LRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125454; x=1779730254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWw2oT1MTBc+8KoSj6yzkVCq1ZSMsbmsrBxPiF/hchU=;
        b=pDmxeTa4JOC6fe24OIJ6WGx6/7vkqQb0ZXd+QI9PdXoL4OK8zJpwdX3FoQctA4V98N
         7zlZFmOeNlz2wh7WT5+O+KWMhR2RTOedl2jBLZP7QY6UfOkldNdZD0BbJdxvCWO05nky
         YGV3s4PqFeeTtGbT/LFTHJe3JXue20nLYb2Gwx4cQtUi9Qmj30HIs2XBPsmC1GtiuzEd
         fKg99w9robRYQTkODrv/ToX0e76WnpTwHQANutGvQhgJB9TLcKodz8NvrsMoS0WEdheO
         p9BB93eAwEgj+49IsWPUJ8roD9qBT52X9Lx8slx0GqAzdTLuynRxwiidPx8o7bFoKNzd
         pnpg==
X-Forwarded-Encrypted: i=1; AFNElJ8508FZNwO2Tt35ONkxqqz1V6i/pHRr0+8RNgLoJW8cnm3vF0VGpXGtjnKc1HiKykELMx0E1T5mB1By@vger.kernel.org
X-Gm-Message-State: AOJu0YxWCabUUl6P5mV7XjaE3ms1Ymf59TKcimZzyPuFAyEccFOoMC06
	NSj1wuw4EjLbt1EWbgxJm0TxlBlbi6e6vKk0qaqOKa26FMeEc7TbUx34sy3qWg==
X-Gm-Gg: Acq92OFFEvFxo5h5K0XVblq1Fq+AVLD/awa5Muvh/PBQ0/kccj75VREDwjuty+7IqHY
	TLQDtSDnmG2gRrfAcIxrOfC5+2JRZgFdloO5AVRqT5q5OSpzL6a7fVIC+7twEWh5pZxBFdVPcn5
	WVl8TVVQQCnKh34V7Fhl3s+jC7U4JVku3XNzI0kNrsNJd8BNDDvrdT/28BbZlrt6kMZgxuCInFp
	5p0uC7z3VaZU+U/JkoQWVOGEX/0YSTPZUQEbSPZXxh6cU4Zp+YtpwW1+x5Rrkt3XfvbN06WnU5+
	jamHymzbueG/L0jdHvmXH8TLQ4YQLr1SQruvxlqpsorj1JUXweEmgWN4ypaNtBrdl0kEY04dNF7
	pXTfPY6ckiQ62z6IX38m3r8gz/V7QqyT8dGouev3M7dk/IOqd6c/vjpzpMXNjI8+sR2AMRzsckD
	dV1awhObkQlUNVh3iHtTH+MitfTEzxKaAPPHBE8JjAqKLrhEkwXtTcZAoJ7jrp/jrY3TahnaI=
X-Received: by 2002:a17:90b:5904:b0:369:1dcf:4a56 with SMTP id 98e67ed59e1d1-36951ca8d1amr16086188a91.21.1779125454436;
        Mon, 18 May 2026 10:30:54 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b5:f305:5cbe:64f9:8c32:7cd8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb116860sm14118696a12.25.2026.05.18.10.30.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 10:30:53 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
Date: Mon, 18 May 2026 23:00:37 +0530
Message-ID: <20260518173039.20592-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518110435.16262-1-blfizzyy@gmail.com>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vicharak develops computing platforms and manufactures single-board
computers, including FPGA-integrated SBCs. Add a vendor prefix for
them.

Link: https://vicharak.in/

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..1948356337b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1767,6 +1767,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.50.1 (Apple Git-155)

