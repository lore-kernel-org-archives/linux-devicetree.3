Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9378E3A7F4F;
	Fri, 24 Apr 2026 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029211; cv=none; b=HAj4v0KR8faNggnUNXFFsXIJgZMFhzgzf/SeirGsy+bqx1uEtXGaZSvGhYFxJF356NThSDbnBUT7DZ6RearL4b3hZl/AxdHyltd/iH+h33WONkiX8bdynQy65wVftjSDtS1K+A0thhy3u0Vbw6RopPfJXRVsdTBPQED3q3D9HEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029211; c=relaxed/simple;
	bh=XaFdDu5uWnEAqQOMXavO6MIDs+fdvbNArE3rIPlpLx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hi16s1jNFvBawpSPNg1EQ1KuUkjTMcbzs1r+6L3nvgg25tUp9BpJy5tbMa71PwpTIum28Pje6yhen1ZuV9T4//xsOuq8x25SzGXqStHJ90EQor+gEtHDK4+POtxwQxp2meLAkcY4bC7w2phapSgT+pPKgCUy7MtLJmsNm3HnJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OEmUxJ5w; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nfj7mRJR; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OEmUxJ5w";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nfj7mRJR"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777029189; bh=6aYLdJrk43/W3Kd5SO862wf
	hECWFMx0YscHXmg2SSiE=; b=OEmUxJ5wmzu3+FA7PNdmT9CNSr4i80jJX0/fOmVqYxpZQbd7Ga
	aTOHhxbKLTt6CIsS7UUEvUq5+z6tglWDFNITrTD+hBWRXFc/wNEjLFaSCiUauOUTewOaOknCuUE
	eUYfsu6ZP9urvhJ7mYkimbvezs0HwKp09V8LUllfy+os0JW11YsVHDTGVVSV0VcCwwSecE96ziJ
	GrA29V4c8xu3iOm7wI8SkGumtJukZM6pM7flOXpFdWnucIyNnpFlj+YGOYJnYXk8O0eMjVaTXn0
	pbhzyisI7M6M3nQQoxPBA9eU4rIJVseluAusFOOdgmyNw8vfbz+oAeQz6KJSXG+MlcA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1777029189; bh=6aYLdJrk43/W3Kd5SO862wf
	hECWFMx0YscHXmg2SSiE=; b=nfj7mRJR92HtghGe7DIfMdSkc7ZrQ3a8YjEwaDlETgG+Ks1DIH
	tLimfbMrkDDKR39x/cbZGiutjgrSjMnaGmDw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Fri, 24 Apr 2026 14:13:06 +0300
Subject: [PATCH v4 4/5] dt-bindings: firmware: qcom: scm: add
 CP_ADSP_SHARED VMID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-4-ee5257646472@mainlining.org>
References: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
In-Reply-To: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777029186; l=801;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=XaFdDu5uWnEAqQOMXavO6MIDs+fdvbNArE3rIPlpLx8=;
 b=Z3iC5n0/2jW5ezQqi2ALBi9NgctDJ7V523GdTwNsEPBoltwDDqEvZI7zxd6uwTVVDWdanffNv
 tZR9VXV/gTzBHXisE+Zc6cCb/f9/K9Ucmd31wqwR8cro021okrZiBp6
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

CP_ADSP_SHARED is used in FastRPC driver for older SoC's such as sdm660
for interacting with ADSP memory region [1]

[1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L3602

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 include/dt-bindings/firmware/qcom,scm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/firmware/qcom,scm.h b/include/dt-bindings/firmware/qcom,scm.h
index 6de8b08e1e79..0d29d8d4829c 100644
--- a/include/dt-bindings/firmware/qcom,scm.h
+++ b/include/dt-bindings/firmware/qcom,scm.h
@@ -35,5 +35,6 @@
 #define QCOM_SCM_VMID_NAV		0x2B
 #define QCOM_SCM_VMID_TVM		0x2D
 #define QCOM_SCM_VMID_OEMVM		0x31
+#define QCOM_SCM_VMID_CP_ADSP_SHARED	0x33
 
 #endif

-- 
2.54.0

