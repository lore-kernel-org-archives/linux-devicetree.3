Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DDB387362
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806297; cv=none; b=hFQ4jExHWlTAaXF2AHJUg8otdNFBP+pRl5pTU8m1f0Q1N42jThQ78KjZFah+pjI+pGvaoStIT9zjXv4afdo2A2wmLHD+wKoxc0S3Udp8mRvOR8CS5mxzE3OnBZjJWqBt3L6R0KbG8mgNXL1WoP+tAg1XSOGxst7EJvrEtv0fZ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806297; c=relaxed/simple;
	bh=3P0tOVUn+JiOZLFR0VZX401X3jxq4V/mMKfAXPPWGw8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SKx9P0qzLdEhl3NzlWZVbxoKu224B3pHuCtXgX5dQK5syHcUlux3dmGYNr+lDkoKzZwxLOX2+JOS+wKKM8ufM+Lw/jzWz11hqRYWilCTnO6Yfd45N8gVEMvDkgNtizsMSi/TYuGosyKSTs7zfjX7PZcjohgPdOYtU2YW6JMNaSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dfSM6Jxs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dfSM6Jxs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so310250266b.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 00:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775806294; x=1776411094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jC6nuTCtenEXxubvMtX2npbfK783JARm8sUf137RZP0=;
        b=dfSM6Jxs9G/Jh22bIT+bzzK9o7QEKnCQoE1XAU7JN8G6WEvTeRQcun3eXwJCyyIXui
         ihxkHtZ+zg6Fe1bJDaa3ADbj7zhKxAF8A5nMM78SrE/5OFlOpkXh830ViXc8oAwujHFU
         Cxff/S2THUPPMPL67R3yHttmxhtJKrkAhRpsf778LnMPKhNbRWWl9I+o+cj7B/3wPqLW
         I3tJ7ghY2xh+OaFCQbBjtZ26Cq9WHrkeVhf5yMInivOnkPanfGNVbeIBQhhewmtpBvX4
         50/zKqIMgAE0qz6afcg4WMjQXPf/5UM8BhiP4TENgIu9i9GvIZXuruJL6avEw3i5gimB
         BrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775806294; x=1776411094;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC6nuTCtenEXxubvMtX2npbfK783JARm8sUf137RZP0=;
        b=lMIjMNF3aWAXj5B9iHMC8jXd/SamRRdy1JuXtJJ8NOTIl8YOE0rQ2cvJVAFOIamcPm
         QdEo/X7SvIWULUs3YexYmV4zrp52Mbgmq9+MrwTXa5wGnhgvN+wbat7qLnEsAPsLpYnM
         5vpj5cIATrTfzY2LSJqb/DfR+z8L5iNRUM/u7pYOhqb8DYz+hK5x1sBkbe3VK6gkzG9u
         kDZDxfPjmgSK4qFY+R3R99xTqCf7fPCbU/zGHQEL7F5ERiqG5OOnsEFbvRmA2BgA/sOT
         l6ZYIjvsHN/QYZedZ/pap81wb9p5GmYeTA1dDiPCR5SlSkA4Ax1GIw72xk0z+mplp8mz
         EJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVRIZ04QMdzfKEyeeFwWsDCEf2d8CJ4wFO/FSmPVg0vJEYzusPqSXmYCnPkSZCkx/2JfvXe0Vh+oI+4@vger.kernel.org
X-Gm-Message-State: AOJu0YwRfIU5+Kzg2cIYqy/AjRvMaUFk+WATNGBSKzNB0rQ9d4ysEsXW
	rNEi/CHvAx593of6WfRCnjLgp9kdOIK5zTzGthWJvq8Y1s4tdBmx3qKSXQWT23fBtmVCqJMBPrg
	VFZHjbvI=
X-Gm-Gg: AeBDietdymch6De64M6w5FwPQwZGxEJiAL/wk8Yb+5VWLWKsUJ1LY6HWpTnjdHHdS/s
	008yohefv5qi1a5FaV0k+3vfVvmNcP/w/K5iK4LrONQhxoCDMJ42irm1uVPG3R7EVr+RTZzv0Ss
	NARww8mTbC6nL2l/6w2vZhoSzuHpJPjAv/3T2Sq92U2av5X9WO5DaO3dg8SngwsKN/uYPWLsGiv
	lJyH6UnrChXdv1GIaSy0d8/AIP1+IJHXxd1SRJoxfaiOHyUz9ZK8q1TtRKD9jj2DqDPpcrxd5j+
	FLnDFjYXQUgqyFmFLvIbv+rTiDZMIFKri9YKCJ/AZdPD5kls72n0TmItlI2LRLt04fpHlqhoGEk
	sNUhBrcFLY/U+mUUI7XcEwSKc/o3CsIAgMF2+b04UAwlY9nZWDozXniLZX9X8fhDTuVfgAj+hrQ
	vQkcc/WPg6tFnaoNyr43iA3WjquznBVns8aEOV29s9o3tdSNLqi1szs3QesBc83iudq8XgDzp6y
	2YHxw==
X-Received: by 2002:a17:907:1c9c:b0:b98:6926:13a5 with SMTP id a640c23a62f3a-b9d72ad9e26mr128087166b.46.1775806293696;
        Fri, 10 Apr 2026 00:31:33 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670706252f3sm365513a12.18.2026.04.10.00.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:31:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/2] Describe IMEM on Milos
Date: Fri, 10 Apr 2026 09:31:05 +0200
Message-Id: <20260410-milos-imem-v3-0-d215385fa5ab@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22QzW7DIBCEX8XiXCoM65/4lPeoqgjjdbxVAReIl
 Sryu5c4PqRVj7Pab2Z2byxiIIysK24s4EKRvMtCvRTMTNqdkdOQNZNC1gKE4pY+feRk0XKlhQI
 p4QC1ZhmYA4503cze3h86XvoPNOnusG8E/LrklPRYY72OyI23llJXOLwmvicd2HOFrtjHLU9+J
 sNj0PY0pJ7cQO4cT5ai4RW2rYKxVkNVdotk9xITxeTD93bgUm6Z/92ylFxwkADY99CIsjmOmsI
 8eYevud5mlR2f8OYXLjNeiRY0HPJThPmLr+v6A2c5bP9sAQAA
X-Change-ID: 20260403-milos-imem-3a034224946a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775806292; l=1077;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=3P0tOVUn+JiOZLFR0VZX401X3jxq4V/mMKfAXPPWGw8=;
 b=fzWAEBRrgzqqypMJayiqOzYZx/RVQud3fWjTLeg6NEXOhn/H9Z3hdI0cYqt2V3lqMIeXXIvu0
 xXD+Giubpb3BmOKL3dphR8CjUpFBwBpwAfbtZCAeiOY8641sCP5zIHZ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a compatible and describe the IMEM for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Adjust node names to include hyphens (Konrad)
- Use hex for ranges (Krzysztof)
- Pick up tags
- Link to v2: https://patch.msgid.link/20260407-milos-imem-v2-0-5084a490340c@fairphone.com

Changes in v2:
- Use mmio-sram for describing IMEM
- Link to v1: https://patch.msgid.link/20260403-milos-imem-v1-0-4244ebb47017@fairphone.com

---
Luca Weiss (2):
      dt-bindings: sram: Document qcom,milos-imem
      arm64: dts: qcom: milos: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 0190c2c6dae368aeb9bf59a449ebe23f24bfa059
change-id: 20260403-milos-imem-3a034224946a
prerequisite-change-id: 20260408-topic-sram_dtbindings_misc-5e8834f63d51:v2
prerequisite-patch-id: 1052a7a8c6ef7e9ffccd547c934b318f27ce4c26

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

