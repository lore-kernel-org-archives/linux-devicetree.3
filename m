Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400DA3E3140
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838227; cv=none; b=a+uPPk1YNtfbFxMNtbK6WyNUG1bRNS1gxYlF1ovHQtK/PPQ+i0Wc3OWAFqH56jKO81A1u7rv0VYyVWNOri7aIHq31pQE6+7qW4lqX6f8cw5dkGegHcRojC1ffJxjnhtD3S5GNlJvn4Kf36RW5UUvrIebD/YcqxXqcJ5Mc/xRfJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838227; c=relaxed/simple;
	bh=p31nuPzvFGHztMfJEU5PcIrw/ODb4o1rno43j08o0eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GbcvDKqJPQihpqvZAwIxa47orf3vycvcltGyhb/zagPmFKlLU/cGX4cJGLDETDepCnq+MGc6oRCx7B+0W9ujI4O0W8xUyY3FHir7ay1ob2yqaaiZYNkFbM3ujhJiHMlCv2qsy9dysnJKpUG4nr+qwOf8NcYSkIV4zDbQTOrQWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TTTn1t+F; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TTTn1t+F"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954dff6536so8707875e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784838224; x=1785443024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvDVjXMkBmC823RzTkpYCZMBAfM5/raWm5UVKD1gJ1A=;
        b=TTTn1t+FAkGknrnGrxUaryzN72V9bviMG1+NLY2vK8+9BdsPaHi4PKoujUGcd1VbE5
         M6Pa2tTwVfGcTQl/hr36CxFudFWvcEaTrLP0zomDlwPHzmE6IJ4gnCNHCp26nkCwplW+
         oxd5ejN6RG+k/xAINn0/4lx0pkW+jXed6RcYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784838224; x=1785443024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvDVjXMkBmC823RzTkpYCZMBAfM5/raWm5UVKD1gJ1A=;
        b=UgWaJvS0NwnkwJ7BR/QngGZz7tXAMoXxeUy9vBvjyAq/bvmogCKcFvPfZSfnNMCu0H
         uuQGoDAnU89GT5+QMczTndgxRc+WBZuSNdiATpzKcI3USluwkUZQ0J4tX3WdikjP4L0q
         uuGqScaB95Svt2/fwof7tbFF76iaO3ky26bTU2tWBetvfjVd+gs6EqEC8oUiCjHAvX4f
         wUfzGSZwbvSZx8u4dEB1Sy28kprP+IMRw2qe54A5RM0+M0jI/Eard1yM0xILLfbcMBxT
         Bj3NIzJHR9Y3LLinzsvIO4e1ZhnoZ5T5RgP5fogMmyNMQtsIVDcfuNpFW/MKy1ktahHJ
         FVdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBF4pc9cX5xwi06odiT9BJQiIFcWU97mEjionrq+IZSXf/0H+vcOH5SxzQLZ6Lq0AkTId5viSXXQQD@vger.kernel.org
X-Gm-Message-State: AOJu0YyFlzH4nvgiMy1Ij39pDWKECsXmp5FJ44kfvno1is1P1vwXY/D0
	u993cNKCee0MqGbcm8urqn2ZiTz4ed/b6r8vXX+yXiONcsUNW4iXZcDvMBoflT3GEoo=
X-Gm-Gg: AR+sD11BxMSQjEXXuhpbAOO0yz2114l4ZvGUbkSbGH2FCkXVNid4fYPS91FAZUVRwgj
	cI7cRPDYwn/PzIPEJbYNFGHCD9ioN1wbu1YR60Gp5wuJ4vkko7wlS5GI9bXNlPdpGjNCkEF4NM7
	qLp0Gq6vrbc1Qsz2XN987AccYAi3xnGx7LUt+t3jTCxMF7u36JFlsJBl8xYEwqLdyPuZgcymXnL
	p0H4bw3o/LseIVRB5Vq+baaYZFZ8gy6GKiRsPicEIH7/Qy8zf9G0LQWICsQHrifkl6+ze0fyPtX
	xK6plV3u+oYGtMsqTDAcxKiZ6OGA9EkBM8nF0JZq4JUoN10K7T3x9vAY1a9u4mgj+/zrn3d3shU
	MDMXdo16XBoU4JOMEoKsHp2qv4/s9kqPdM3Tw2fol+DASQSClPnjyQ9ajb4xFfL+SKyMFWx/I8n
	4t0OBhuDAGpw7cAIunNQPtwhkIAz/ut0wkI65E1bWrxwbIBSmagJEFbOjdeAY33ng7cx0nYTVGy
	K+x5mQXqP7zVoV5UWzotygx0zmfw3Kx8hgf3UnM3dPdo7e/Gn+CrSFjgNcS1HYldImrVmzROHSg
X-Received: by 2002:a05:6000:18a2:b0:474:64bf:8fb6 with SMTP id ffacd0b85a97d-47f8dc993a7mr5621124f8f.39.1784838224153;
        Thu, 23 Jul 2026 13:23:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm17516051f8f.28.2026.07.23.13.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:23:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f429
Date: Thu, 23 Jul 2026 22:23:33 +0200
Message-ID: <20260723202339.974529-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st/stm32f429.dtsi
index ad91b74ddd0d..f94500cd90cc 100644
--- a/arch/arm/boot/dts/st/stm32f429.dtsi
+++ b/arch/arm/boot/dts/st/stm32f429.dtsi
@@ -794,6 +794,10 @@ rng: rng@50060800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 SYSTICK>;
 	status = "okay";
---
base-commit: d326f83e819c53aa05c40d64f5805d6237b6aa1b
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

