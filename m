Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539194;
	b=f+zx5n/RBGlPXw4k5HLnU/uYxJRCrxuGnrXgdN4VIlp2kXYJXtMSNFJdhSppgVPsRJBt
	 IsnVGf405Y/gtjofjosM+QYFSZHZ9WX2RIjJ0ZjJsje3jK5ml5163h3/fyTO0PZWcyzQy
	 2YFSyL6IaG7ylt3/DKodpubl1EqvGnYOQRc4ZjCj41IbOmgdkb1cfxzLhgCZ0ijYAz4L/
	 pMqfWsmuHfwt91OMJuDfD4fX8O6as69pSHiciyokzuXl1AzCDJahi3VYhiiENq5ailAsJ
	 dyUwxeDAjvLweBtjmCkUgJCPq0sYqtonT+xrcONMaHIAn4h9IS31axo6GlmHUoQhv3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539194;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=p8LEoyF+pNhJTE8fUvsD/8VV7FpN7SX/J2UJheFgyFQ=;
	b=zqqhLz7vRTiUoLkSg6/gLe6G+RZzOLm8OOC1G5C4v+ru3ixvv4HELaLsWn5/LF/dbJaJ
	 MgBn8d9/trBkfCYQEtEl5YoB14pXeWxI/9TjRA47mVuFTnQQC3QNi+R6jiijNDumH7os7
	 GwrcYVkLIJ+btCI7UqO0VhRizMRnPFJpl6Oua3jh5hreLbwWawfptHk+nRhAo9xl/sLys
	 cVODgG3O/woNjrYastYKgQBdU8ZUtLxqGWZDXtyhYrmnrEyxgkObV7r/jNjHGmDwoA3Eu
	 IvPnWlW0G1PfrrOMr33nntIPqRNFOPQqx+05x6rwSDi+lHz+7B4L81ZGDlKWNZWqusQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=enDKvVaZ;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=xusfkOJI;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E073606A31E;
	Tue, 24 Nov 2026 16:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E073606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=enDKvVaZ;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=xusfkOJI
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795539161; bh=p8LEoyF+pNhJTE8fUvsD/8V
	V7FpN7SX/J2UJheFgyFQ=; b=enDKvVaZAZrETArquKoiX6yGCBbtEMKZD0HU6YADp+T5bXNTbC
	UWdAZDMiDm2wPQcmo0lWgJ8QgC+e1tm80HBPahk9CGCWnK6wvEL88YzvZE57UIkUUIxMTIJHvKt
	he4By2G8yC40dKowu2J1jb8atRfP8PM7hv2gqFhtiijrzEYY7zyepAGv2NNPrgqXtEHbs+k4xNf
	/on3xC1iI5uqVPD+cu99XBlolnlxArgKY+7n/W9kWFbyObcB0UCn8pOXK0RkmHFhzUSObayl723
	tDyyFX0R92jOB5q8UU+593QQE/H4SaBxOOleQpguiK0hIiIaMdAg7r45tk+XFoii8uA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795539161; bh=p8LEoyF+pNhJTE8fUvsD/8V
	V7FpN7SX/J2UJheFgyFQ=; b=xusfkOJIT/8f2+jVq2fVUWaerrwMOHtg64ZDOsXoNhyE97J9Xt
	b5ysExbdK0b42iKyKJYHxvbvQerL/ooy6dDg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Tue, 24 Nov 2026 19:52:37 +0300
Subject: [PATCH 1/2] dt-bindings: firmware: qcom: scm: fix CP_ADSP_SHARED
 VMID value
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-qcom-adsp-shared-vmid-fixes-v1-1-f1a808dc41a5@mainlining.org>
References: <20261124-qcom-adsp-shared-vmid-fixes-v1-0-f1a808dc41a5@mainlining.org>
In-Reply-To: <20261124-qcom-adsp-shared-vmid-fixes-v1-0-f1a808dc41a5@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539159; l=1259;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=YZd8mfWH8Bh27p3PL2xly2PB79KZCITvTQlis0k2V/E=;
 b=5pgZjBZg5wHADT1zOf8KbApiHtupSm9jYxTTJrJ5FVGSEZSAMYqdwSmW4SRjDdpqILstRG9/h
 62EjCMEDKdkCGAjlvANjmlwN03dyB9SHStTTegsS944014/xXnaYGr2
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

From: Gianluca Boiano <morf3089@gmail.com>

CP_ADSP_SHARED was taken from downstream AC_VM_ADSP_HEAP_SHARED, which
is defined there as decimal 33, i.e. 0x21, not 0x33.

TZ on SDM636 accepts assigning the ADSP heap to 0x21 and rejects 0x33
with -EINVAL.

Fixes: db6ae6650cfd ("dt-bindings: firmware: qcom: scm: add CP_ADSP_SHARED VMID")
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 include/dt-bindings/firmware/qcom,scm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/firmware/qcom,scm.h b/include/dt-bindings/firmware/qcom,scm.h
index 0d29d8d4829c..9b86ac8f1029 100644
--- a/include/dt-bindings/firmware/qcom,scm.h
+++ b/include/dt-bindings/firmware/qcom,scm.h
@@ -28,6 +28,7 @@
 #define QCOM_SCM_VMID_CP_SPSS_SP	0x1A
 #define QCOM_SCM_VMID_CP_CAMERA_PREVIEW 0x1D
 #define QCOM_SCM_VMID_CDSP		0x1E
+#define QCOM_SCM_VMID_CP_ADSP_SHARED	0x21
 #define QCOM_SCM_VMID_CP_SPSS_SP_SHARED 0x22
 #define QCOM_SCM_VMID_CP_SPSS_HLOS_SHARED 0x24
 #define QCOM_SCM_VMID_ADSP_HEAP		0x25
@@ -35,6 +36,5 @@
 #define QCOM_SCM_VMID_NAV		0x2B
 #define QCOM_SCM_VMID_TVM		0x2D
 #define QCOM_SCM_VMID_OEMVM		0x31
-#define QCOM_SCM_VMID_CP_ADSP_SHARED	0x33
 
 #endif

-- 
2.56.1
