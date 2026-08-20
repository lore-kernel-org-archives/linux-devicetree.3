Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C943E0C75
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217719; cv=none; b=hYcVxyPO2alvdWoE3Jyq2ypPsu6kmFHe45S+0vcI/HeuFDLCSlM8SgY0JT6FsjzUg96f1kkgrjkVkiLqQXFDUPGnyDLa5PtsAhJ1K8HYBoQBNfsxX9R+Fn7LDQQ53uOJ/DakB0J2f31YubR5+q+kB4ehjhaYyWRNOH9F7Wv8HiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217719; c=relaxed/simple;
	bh=ZbJCzupaEBjvNX9bNYjoUoHZcTlhtUg+qKasx6CHL/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgHlcjHnVYworBve1agBhcZdiJtCqNCNhGz3zckUDvIAp+6oCwVeAynZGjF8pjUngbRf+ceT7AoB1cy+wSUOqLadnK0DyvwfcUhRolP/U31okcj89vdM03i1qp7akqz2V4RvB4vk9VoLxiRFdVeot9X/EIjRpGTVXIGuwzLhLlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fYr0YaC4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fYr0YaC4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so17335525e9.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217712; x=1787822512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHcPefLb6jkueZtGNKuEiyQEEuFbmF4AqxweRVSlXHM=;
        b=fYr0YaC4vb/gj19Qycg7tc2nEis+TDpg88P12AXuXCE5DefL2eQ9KMvbXMu3DY6LMt
         YEs9DhGxF/XScRLkfcQwicIOzh211QmAdZE2CVnY3NrciIWtiU3fGoN+d6PfxzsJDfgt
         cXoAZc+cODFVzLRAOxOCQ8ed28CdSLiEtllmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217712; x=1787822512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHcPefLb6jkueZtGNKuEiyQEEuFbmF4AqxweRVSlXHM=;
        b=mPTiN3Oy7jKqxK3r6OlZCNeWAVpzfDmCiznZazJxLqcCOqVyLtKVN7oIijEm8u3jbh
         aRQnzhlTa7Tyy67kNZ+hqwzL8V2ssXpWmww8MX5Btv8Ghb66nMWiv7EJj8E6Tj42tnkP
         YmyLYi8mQuNdzUw+BayQxf6HPbBiyImMgmlAhDybtgympuNiCLhxnGwZF8v8YHF8drHA
         0PFT3mgDaSJ43UlHkHB79SBFaIU/kaPbqMF/fTurf6bw40q2gXtkMgpgmpKwKmK06Mxx
         YpBtFSF/pncfvbQ8m4zZOi84JXUHHzR3bzpMf8c7KnRehwJIx9zB8KRPudHn24bxxVq+
         e6hg==
X-Forwarded-Encrypted: i=1; AHgh+RrAIXdVwPrkUd14jSkSxirOL75BwWWdVHDMrq10xMggkCoYI/Sj/XnF3ekk7JboIOugnk9JEBh8WJHW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyv8ymvQBqt2ewvGwAXYzWhDwt4vdyCguOwXxX8qymsA2KY/jH
	VRtLgfy5Lx8DhZwLjC3ZkYvS/PeomXsQmtfTIad98bt2L8RxbUPE9BJcBm7141Wo3Ps=
X-Gm-Gg: AR+sD117Yb/rizc8B4llr/9Jm4a/kAMSHXaidSbcsFDy4jwj9MJogFeAKngA66NKIbE
	WNGq8I2Gr4ny1vw9oy98ecwPjo/5o6945j433WtW+OHxuyf4TgFVJtg2DQIOh41hDCnKkDvlMOc
	51xBS6/rdeR0BpziUihoI40dprkeZmXmwLtRu0svaNjh42OZtujQ/F0YXX73ZKnx+KUzsaTbDWW
	q30w6/d/Q4DdkMpykiPw/3f/YSmEBiNbVmDFI5eva0tJbqugIcnnoICe9EeZwcP+GflXFOpEc2P
	nn7pVSu9+vHuV8+2hsQ4JfkDsOcDPbcYSRn+zMYwbmb33UKDeH+ZxN4j3wiqJf8stcR6GEAadon
	nlCtRYrk8E8v7ftBav7nkFTYx/v74bR+MaPvAr1jjC4YVkzMt3oBye96to9sdkTS+rl/tP657zS
	+cq+jBOWu4m4cBBDvrXTk7wf6mVXvHWlEuoB0KWjMMuXfpqB5J4J1fUM7eKVmJzMQlM1nQAPpT2
	EoaeuBnMr2JYOOpFay0n2aZiWBV1IoGLj9gNijJQUtRi7THeY7khp7K7yWrqN2ufW+rmz/zTl1y
	+Tm1vcOGeYAKa/762ZbGK3jz8YGfDXZm3VA8bKSWRqZmjIjTjNV16abKoFAA0A==
X-Received: by 2002:a05:600c:19c8:b0:499:a277:e8c8 with SMTP id 5b1f17b1804b1-499aa1e35b5mr152829295e9.13.1787217711728;
        Thu, 20 Aug 2026 02:21:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd7a9sm165259515e9.2.2026.08.20.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:21:51 -0700 (PDT)
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
Subject: [RESEND PATCH 3/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32h743
Date: Thu, 20 Aug 2026 11:21:38 +0200
Message-ID: <20260820092143.44829-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
References: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32h747i-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/stm32h743.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..845d13c61da8 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -732,6 +732,10 @@ gpiok: gpio@58022800 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clock-frequency = <250000000>;
 	status = "okay";
---
base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

