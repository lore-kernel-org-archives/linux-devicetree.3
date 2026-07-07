Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D38630100E
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425384; cv=none; b=EY9w0+o3ohmLR3D1Xa2wm+isfHKbKNEYjJMmz2YxOFjIq/DcCqDmPVxyfRUREEVnti820iAfGv4vuK9HKdxABhgIP1x1bdacbMoBop7v9LUniZdZeI6GtGdDh7eEss/dCEOUxjhTU7JbKLA6pQF4pcSCJ6M/M8i6D1EWHHQHqxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425384; c=relaxed/simple;
	bh=wWcvkWdyZ80X/TJzwXAkfG1rlo8jd3bQ2DYmK67MVbE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gXNXA8QjAAe8us56h6RY5H+rkUhQeB8EjPP7OE3kEHwdb9EXZoHnU0iZQfZDbgd7FBx+ARdtYVmf2TFsUFsIStOvmgo7/24eZWD42i+gsJ3ufgpHudK9QftT4HTTSWPq9893solQFsujNZ/Tcx9dKNZp+RwmGE6NUU1IBNMmzks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqwBAWAN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqwBAWAN"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493d28b1930so31065655e9.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425382; x=1784030182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L9RDGbpt0X65W5NYkJywTfGuzuPW4bNvD1G1EfFxluo=;
        b=kqwBAWANLBRjH+1GOCxthicTx2UYjfj/yCb1Y4/M4hpP9PG8y7tej+9gtMqgpxXdN2
         Y9hKxuUYo8v1v6bQE65sjFtl+h63kpj7HMEdOpJr0sNmz6BQYagbrTvMwrKiQIIu0eoD
         6z9fRgQazm4J7WzhGNKIiUe3oUyECFrpzNqUofzx6bOmq6y+7Fq6IO03Ht7oM0CPVe1a
         pZ+6BqmNjY3K/EnckERlqcMWkkHMx0z/34bTihRpoEMwBvGIIwnvy6YTmdxsBijezc9T
         cy3IXiH2abcWHp4yOAXQZaRhtkn01uNL9UC+EufQw6kBAFNi0AfQke4jbmI44HC2o8L6
         bsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425382; x=1784030182;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L9RDGbpt0X65W5NYkJywTfGuzuPW4bNvD1G1EfFxluo=;
        b=kha37BS5Fc4tRkAYFgUQ/A1UfIq2kqr26aOxd3wYiN9fCC/z+7pdC3XUfKy1Bnp3Qn
         TnIkT7H3z36xQ53faIRKH6+1dnn/q1WHVYeKR2y4Aagk/rn1jJHbTUlGQuw6R67BXnLA
         m68aGBabjPPDxz7uWJRgXYl+A12nLSm0OmdQpJk7NcKGfZ6vTIg8Qh1u81qQkHbNX7Em
         Xaz7YhZT+SRlA4us3i6Bae2fCKMCGVRZyCVgasdkAXtzVyQJo5PPQ/Jro/dq70YYHsD3
         HuLfh4VV85PLjO4yaYjEKrIpmcmoy1L1WYlTNXBNPcNJMmxmXohEiVk/A+jKKTDbDIDv
         RBTg==
X-Forwarded-Encrypted: i=1; AHgh+RpfCrxBKxR6AyIhXvPOor8jSRhxbW1AMqxM0P/OUkHl37FkX6xQkZXJqLsaFAvurJWcQznuo/81rw1i@vger.kernel.org
X-Gm-Message-State: AOJu0YzDoCL06TE/8x8w5lxIi8u+61oiqUQFmhnKcKVgu80wAyZv7te7
	7s6tp49CWs0d0E7FadMMiImmMcjW4eDuX/Pi/fQA3NIQtkagNN5YwRKv9jyrVweNwI7eZnwYWXW
	SjqYydYY=
X-Gm-Gg: AfdE7clph+NnNP3hYDP+Nhwo6cxEUSsH96nv2i3gnti4h7GGauk9yPatFS7vzzplxfV
	kfERv3XqXBUmj9nFXHDe1tUfiIlQhvQwwBV+L5TT0w2gqWXoj7onXGG6zntThyIz6oV8ZSVAGJE
	8NgsoRcdFSA2f1RlN81yJB/P9UsqGYzQOYOazC6nkqgvfGBK/OdjMH6+aOnr9Yr2+S1cmECoEdY
	OV0odj+CvKdyoT/d103sYto4bXxgUTrqowZClPoIgaZcsBiiaJlo3JTWYqfkAv5zvvL0Ux1kl3Q
	OGNY/jrmUXCqTAClLCwEUh5/5PNRPIQYW+gRCnkH2QUGijVp85KIW6E7xcbiXR2eY4YnutTWeHq
	JLvz5fsKe0ahD6SLli3TmgoHLj4GCShSxENXNye/JIKXfxzAw4vo8W9X2MCzXOVHy82/upOYpm5
	wy8L0OsDnVy9kei9rLg2lOtWxXOq6LRMrdHVAQ
X-Received: by 2002:a05:600c:474a:b0:493:c062:a533 with SMTP id 5b1f17b1804b1-493df0673f8mr58244645e9.17.1783425381754;
        Tue, 07 Jul 2026 04:56:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/4] mtd: rawnand: qcom: Add MDM9607
Date: Tue, 07 Jul 2026 13:56:00 +0200
Message-Id: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDpTGoC/32NQQ6CMBBFr0Jm7ZihkmJdeQ/DopQRxkirLRIN4
 e4C7l2+5P33J0gchROcsgkij5Ik+AXULgPXWd8ySrMwKFKaNB3x6UKP3vrGYd/0RlOJV5UbzVz
 r2hEsw0fkq7y36KX6cXrVN3bDWlqNTtIQ4md7HfPV+3sw5khY6IOxVBilyuJ8F29j2IfYQjXP8
 xdb+GEmxwAAAA==
X-Change-ID: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. There is also only
a single clock that can be controlled using the RPM firmware. Document and
add the new qcom,mdm9607-nand compatible for this setup.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Pick up review tags (Mani, Krzysztof)
- Clarify commit message/comments in PATCH 1 and 2 based on discussion.
  The OS can only control one clock on these platforms.
  (Krzysztof, Miquel, Konrad, Mani)
- Link to v1: https://patch.msgid.link/20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org

---
Stephan Gerhold (4):
      dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND controller
      mtd: rawnand: qcom: Make "aon" clock optional
      mtd: rawnand: qcom: Make has_onfi_read_op separate from qpic_version2
      mtd: rawnand: qcom: Add MDM9607 compatible

 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 25 ++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c                  | 30 ++++++++++++++++------
 include/linux/mtd/nand-qpic-common.h               |  2 ++
 3 files changed, 49 insertions(+), 8 deletions(-)
---
base-commit: adfc275b317c02cd043b0cf28b8cfb7459b041f0
change-id: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>

