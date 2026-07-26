Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F053630AE
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785076361; cv=none; b=prAOPUAspY1F9aHfkLrK3TFqsUyr5A8yKahu5pZkiVtQsJGzpcI6V8BtKEzLGAkvy61icbAmd3VgMjeYG5L7o0k1uW6fsMIKoHk4YrWCi+CAXmJ51CP4nPzibX2p/H03t+ve8N9msHJxvBtI0tEWEZvArj+qM1KrWUKBbO4hZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785076361; c=relaxed/simple;
	bh=s4rIeCCgo6l5xX87e3qcMC4MnjazRMjVsmVzVb47VSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIZZZfjuiB3kMgkWijCQZsx//CqhPrzaAMDRwwUOj6b+D2vhYwIG52UHuoJtWCcyCSVc2+E2MPG0u1S9fdJ5v80OMM3QqCJJdsdJrjpZ/TDnIPtw3thwoHlgmcM7eQCTKvpaP8wZrRfiZm2ZgH0TkAeiA2SUBxKvcr5XcfqCPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1fLrzS6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1fLrzS6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacf197759so27929025ad.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785076359; x=1785681159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7F3AYz8DR4/4e3Mn9I/dRrRD8hvn3fnDDc9Y1ajQk6c=;
        b=N1fLrzS6UnM9eaYh66qT24qwAJXIvJiqQofcevvpATvNY7cc+P8fO4FIwleEquea8T
         3n/9U+oSy9gyLJt1lTTvvm9wpwdPWFkfl9SOC+I/7IZgaEGDBfnkle0JKab8kPyrv+Ze
         VSX+ws3VsPYWDeaPPZIL8Yx38FkYR61Mg45xKSYD1a5J/Kl0nVMfdv9Ghb9mPZiPJjkQ
         r0tzukqaC6GcMYYDmNFTOHChoLDhp6YlEeR5VgaJkspBFcg5TMSI5WcP9w7faz6ywjrw
         mKEJqKGGoOnOL89lraKrKo7W7vI5DyZtGt7tCzXdmgMMFrYba7/ugF+QVOwl+hOsBsJM
         0qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785076359; x=1785681159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F3AYz8DR4/4e3Mn9I/dRrRD8hvn3fnDDc9Y1ajQk6c=;
        b=EuAjz5rnYmL6+fW2E2by8rI2Sbc8D+rQb1+3Fk46R5ZWoNvMoTPJfCow7Mmxy5nezA
         c8KYP6KHX80nP6BqOlCybuXaDyvp9ZY5k5tlZEl6j3zC3uULdCjTTeDbb+PaeU3V5eiu
         rHgmSZZ5S2zB0RQpILbtoGzwPJgcelX4tKKxyVmdJyi8xe+X3jlMCT7+/vCmWh1njDpJ
         4Z3t2Cp9uzUcdCsBeuUZTIPciynPD2tIacPUyMensLmyNz6XxccaozHy1HUCtjJLtQSK
         8Bc8XNfuhrdp8qICGCgOoRYbI67JZNMusumyYE8s4U9sqKA8PGhovsv5TI1GH6OGgnrI
         4G6g==
X-Forwarded-Encrypted: i=1; AHgh+Rrt3+NI+YpY+bOyj3w6kEzC+awX8dzMKBk2/pywN1YSl6uyHKjfwCWVLZ/RBJBOva/2RYt8Q09FuH2g@vger.kernel.org
X-Gm-Message-State: AOJu0YwiSIK9y9BpLkGxI+ie7gA5TzXbH5luEstsa+ijCyqVoLgmIjpA
	POdAC4IxpKyROfA8HepRlNv5yvvZZwa2R3z/i2XGCQAPzQfnp67acF5X
X-Gm-Gg: AR+sD13tPv7LyXXXTaupRgQmBiVJ8dXNe9wfhXLkAZtT/4kfe4RKaJ9uhca7s2fl/Fc
	QPgUnhbOFjBodJLJmLQ5wHkddA2hNja/iK9lOoNGdA8nimjuJTrX9JEp2H0cT/f6shbTAMJL22J
	aynTkT4+yq5KII7jzgG/+qddTjEF/U7S5U5K00+WhR3xkDlwsDhhj66jiTvREIzDXIkPa6A6fPC
	hXRQCyauXzrvJ53ZLKGp1Do/6Tz45cZL7Nv8Di7wTtIbJg/zI7TmOzuc58z8oRcAzb7ue90U8Ly
	nCjCvd6d3YzGUmttVQiv4tVs1Pbn2JgucKKoM2ybqDp2wzsdRqeXe1qyDKcNta08sKCn4MSZCCH
	4+GtesqeGexBb+JM5dPtMpnWLtA36LMlQe4IrbYoV+PNNvfaJBHGkFw/FK8q0zhi0BLujlFLX2N
	FzEAu2YPt+MhkihqtyJucHRBWc4RKDFdmES6zO5oGuGGg3
X-Received: by 2002:a17:902:c94d:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2cfde56bf07mr54508055ad.0.1785076359059;
        Sun, 26 Jul 2026 07:32:39 -0700 (PDT)
Received: from nuvole ([2408:8456:3213:88d5:c960:d4eb:e951:e287])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f8e73sm20552015ad.72.2026.07.26.07.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 07:32:38 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/2] Introduce Lenovo Legion Y700 Gen4
Date: Sun, 26 Jul 2026 22:30:46 +0800
Message-ID: <20260726143048.130116-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an initial devicetree for the Lenovo Legion Y700 Gen4, which is
based on sm8750-qrd.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Collect tag.
- Add the dsi panel node, since the panel driver is upstreamed.
- Use consistent name for fixed regulators. (Krzysztof)
- Link to v1: https://lore.kernel.org/linux-devicetree/20260719093226.197740-1-mitltlatltl@gmail.com

Pengyu Luo (2):
  dt-bindings: arm: qcom: Document Lenovo Legion Y700 Gen4
  arm64: dts: qcom: sm8750: Add Lenovo Legion Y700 Gen4

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 1170 +++++++++++++++++
 3 files changed, 1172 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

-- 
2.54.0

