Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B202D9EE7
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775218130; cv=none; b=RHyz8Vkjsa0f7YjAEwT7VmLHjNSCQtpYfNEE+0EbZTmGnpHkrIP4CgMyVWimH+neqyX4nbHH6r75qRDXrNkpqfx/rjdzzvC8gN8TlgNBfDSUzC/OCsDj/8nwlo0Ge4CYerJgU7ZIIASTdO1icSlnz6Qmmk85uzMzVNizu7t7JIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775218130; c=relaxed/simple;
	bh=W78zLFEUBYK3Umfr5VFantLvQf8xy7/WNThoCj7zKjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIlzfrQ0PACI4hi43sPgtjOcLjrTsjMPGR4xn8EqqR3crJA9ajU5muYMe8wFNI1XI0MGpViIQOSR3U0f6ZZ3hQQKAQSYrQv2YILHpxjtLJHqFOyWC0Ic24xfh0a79KP9vxh8QPd+sqMkmXTf8sulxUERq54TSADcpIiiCWjggGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ6AMxUx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ6AMxUx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aae4816912so11470755ad.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 05:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775218128; x=1775822928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5wmsZ7aJLbe+iLC+rK57UUTbvfLEuAbzyuSZU/YdcCM=;
        b=lQ6AMxUx7TuvJrBxIElEKe5hsMDfoOTuP5KcomwZlVh4lBnac78pzHHyZRAJ1ukB6B
         wx8FncOvdqVj6xdzUznyiOuhSR0IafaNsi1/v1Yk36+faZ/5pz5r6etPkeSAGReFSVJP
         XXLVoVEjUlJ6CUQfAaixyBrj7pEq7tcKb6mkZquM8MVMptIG3vNmTKTz2iPPGSbSc0nj
         gLZVWg7ugWy/gFWPFj4RfDXOAlJAt+CUrtOsjhPj2wmkC0Pbt5yEWCWd0XlNqsay5AX2
         bCSXuqfjRUVhsRwZk6lmr+t4ogoS3wmBpjySr6+rcJr+3BUCIYTmPdDwbuvoiTyJQCVk
         pD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775218128; x=1775822928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wmsZ7aJLbe+iLC+rK57UUTbvfLEuAbzyuSZU/YdcCM=;
        b=b+UHrwIU49IYg5sxd4g70SyRxx+78j57PbZTXZFv2dzf/mzhkhwNZ3OIfgPakAi4Ql
         EWO4vbrUOG17L71ubmXJausjPNm09EX2jcjw+j4xYW4Eet5/rmU6w5Uem16XYaGxW1UF
         Gs4shJxt7ivN7pN7l3Z8RmZVuR1+apbuag4op6jp8PvOk2o2Z/xZUw+7EZD5fR+7Nke2
         Tw5B+hnqtn1Z1bJkT6sDCA1b+w7LTmV2KAWE+/Mz6boqial3scKuWv4p4ZwtphTUbKh8
         WTBLOKrAvH/UZ066YMNdV5UeG95IVWsM8ebkHgPRuJKFGr6mGa1rQEGDAVNCv8gIMr4n
         kFLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJZA11rwl9C4ZA3XZmWnfx5f9//jryrSk8aXH+kwpjSMgCfYSMtD5aT6QoH32MiUFjmKmgoDSE5/lE@vger.kernel.org
X-Gm-Message-State: AOJu0YyTz3RzreNEVLn5woCNycqAe4/5HZ3VfmTlf8rhDUQGlkgr4QxH
	CW4Z73wAOLAlLBZUM5c/4J71ibYGEMvdiFDvbFRWOzlPMiwAQejUkjVH
X-Gm-Gg: AeBDiest5Uoen3K9bvcFF0JlACs+rxVQEE2+MrkwWeWlBP+gEvEEcE+yaBPvcXHkb9P
	dP+kz/UqahMzC8X8LTDXfTWNgQt6QxksSQywbJc8kl1fbexMV8JK41T1Tf07ADGsLPOWuu5550u
	D1QFbTxNG7gJ5HP5b89r83ZiGTeTsQTATRyGuljuvn/vn4KNJ1MD/V5Nte2UuKE/d163XUFFqQw
	v36/AsI2fIe+0tVLioNpnQ8+5lRd0At042Z/uT+hTnc4GvZab2uREQiRMx+AxB9R/nWxDaybXGc
	GOGdFsYTBhLHTWmozh8+sMjZU7u/wzbm9wq/Mrec5CueQsiWuRQqHh9yMxi/fYvUhKeq3CV0GAU
	MjNn2xbLIBBI3KFVCP/qjatU2uBAowLY94BNCZfgRF3I8v+lACNHtZH6DdHfvB5NbBuqj3eUNJS
	WEHKPlPwiLq8zXrFDXOA==
X-Received: by 2002:a17:903:3c47:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2b281802d24mr32407485ad.28.1775218128287;
        Fri, 03 Apr 2026 05:08:48 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274979d5csm55240055ad.38.2026.04.03.05.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:08:47 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
Date: Fri,  3 Apr 2026 20:07:52 +0800
Message-ID: <20260403120753.105869-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the FastRPC node to enable offloading compute tasks to the ADSP
via the FastRPC framework.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..ee02acd18856 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2966,6 +2966,33 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
-- 
2.53.0

