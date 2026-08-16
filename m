Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F6C4B04A7
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887168; cv=none; b=uxaH7Za3+V/fdCuzdzwTZLSaI151gxFwMMUHDE7n+Kl0bWU8y2lo0TbS4Mxn96nqd+dJw8thgLc61+dhZaP0L6ORFR7V+a1MTk0gaTqXleH9KK/5IbODElZUlUQHtfwOXOWPRIDjfTlcoAGk2Zm51HWJ1QOjLSX5dAgQ8KhnP5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887168; c=relaxed/simple;
	bh=ixZPv37ovMbvQ/1xTBeZYGXN6DE1mWKjljb0LH8kTIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZlvEE6hs6RGWS5H6ICQfTG4znJkoduxSBdSvDlfs04V4POnNmbHiehkvTu7AH4wVkZhxTo2IXtmB9j1XRUvGbim8hg1z4yBQ7Mc/K+IhA+4DSCNbj0u4jJB4JIVaa9peSHniFVDic42seaTDd0/F0SrbYkAYrdcMoFZfBaDSiUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnThG1JE; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnThG1JE"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1689503a12.3
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 06:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786887166; x=1787491966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbtfuxDNMIVr/V9y10uvywtGS+WnHONVPtW0WqslyQo=;
        b=jnThG1JElrgXW/VbuXouec3NVPED/8mm+uWzwfMqX0hjjijmlwj/nOmniGHO7FSlq+
         z3NBJ2GaPCA3AXD9r65nQMrmx+MZxqHUxx74JRLlVMCfLgcfrhf8O4ZaJTuzyvxMFNca
         A8p17kAEumHSY2Y/8Nqbwq5Y5Yn0RgJlZ6+vITc2XQ5fLdAYbgThpFu6g/wRSUBkxyPK
         an3MGNBqVz2sEtYFMZsuJZctBWrmbchSLQeC/FQQdXRUxVheK8obiXRZhK7ybLG1G2Tv
         V0McUlIggyqphEkBFhlxoiVYYtP5VNEKfW2fGDjJVYEfY+xC4tb9Trz2yb0T7ZFsGUhX
         fNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786887166; x=1787491966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbtfuxDNMIVr/V9y10uvywtGS+WnHONVPtW0WqslyQo=;
        b=ZDv+SiqxQ4Ct6lBpdUfHUKo7kNBV5Z6dCBBnrL3nQnwSSKkhCqwoKu3HWJxbu4AH8l
         jh9zzYhhUKyjcazrwqsVYSdSbxWr7a9cJkKsWaCtnjtdT83+hjJiRQi016v800JN33Nm
         SE1gOm2ASlKo6mADz/HM+v9n01u1VGd2+CqJ09HrCZxjvk0G9FB3XtwzExl+xajK0IVj
         xMSUp8VLDAR+Yx7sydU1RUqzOcA7Sb1Cg/15q83E+9aH56fU/HsYZtmIiF8M8aQWsgo/
         5XkaYsdcE2KTQYGVmmPwFphXht3sdIlgUqO61BnR5EW8+IdhwesFjX2oN5rk0L+1tgUQ
         9mJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod2froL6d+HkI0pUuLK/DBdFnhygGyCEx61UxZHLsayVYZUkXla87JUd1EXAAmP8OwRi2FMTi1eB25@vger.kernel.org
X-Gm-Message-State: AOJu0YzbA5yoxPmIADmiKYDcFl/CkiUUD1X51kG35Ik5DM78OQ9tMpP0
	i/BgqTPXxbqplfGjFcYIU7YH3HR9J7TAsw7bqcJOLuX0WnIJBYUp1cqX
X-Gm-Gg: AR+sD12qxPFu66iysufPvOYxo4K5j+hFiTNgrpqRjFZ8kwOh+Uui770nv8X0kQHRFPa
	vR49UbWjGXHfdX1YZFn2HMc2y5Md7mGoe18qIuzTEO5+YYX0INGerfwyGdNwlcBc7pFUiBzMQMC
	okCNNArh5Ox/SetVQnz2ToqdFZMaA6MJtP8YDD8NrTiGdSONOeMfjyqtHQqa6LAEn9DUxdS/Q29
	5U8trug02Kwssece4MGPpLpMQSWsMwk39PUW2l5amikXaQX4AcaQsREvdhjnYtSvhO794pln4SO
	U+hvtCejQBUj7fzf2kFLq90WMpSZAl2VUTZHLuFSTWwKGer4UNUpagOsL+Be0lQ2tqSlKR2UNqz
	LhirF2p1NHLc3V/sDIOEf+jg2eC//cOz2CxKRFScIyk41zYlzvMHWna3RgvQl27AI8S77PLauDG
	p2ZodiWpJf6mthAokwH5ZnFcPrVpjPHWvsWD7O9U10DA3Byh348rSSlEdZDi1IG4ZLVorJeRxNl
	IF2p+wdUKof
X-Received: by 2002:a05:6a20:9f96:b0:3c8:f98f:475b with SMTP id adf61e73a8af0-3cc71d1e80emr20237094637.19.1786887166087;
        Sun, 16 Aug 2026 06:32:46 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm23599064eec.26.2026.08.16.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:32:44 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/5] Add SM7250 base dts file
Date: Sun, 16 Aug 2026 13:32:26 +0000
Message-ID: <20260816133231.10875-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 is known as lito.

This patchset add base devicetree file for SM7250 SoC and
SM7250 MTP platform. This file adds the basic nodes like cpu,
psci and other required configuration for booting up to the
serial console.

Sreeshankar K (5):
  arm64: dts: qcom: Add SM7250 base dts file
  dt-bindings: arm: cpus: Document Kryo 475 CPUs
  dt-bindings: arm: qcom: Document SM7250 SoC and boards
  dt-bindings: firmware: qcom,scm: Document SM7250 SCM
  dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../bindings/firmware/qcom,scm.yaml           |   1 +
 .../interrupt-controller/qcom,pdc.yaml        |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm7250-mtp.dts       |  30 ++
 arch/arm64/boot/dts/qcom/sm7250.dtsi          | 431 ++++++++++++++++++
 7 files changed, 471 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7250.dtsi

-- 
2.43.0

