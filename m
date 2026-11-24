Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539186;
	b=BacC/s0ltdeJXU7P8zRmYW4MmG/xleUp5iGcm57Cp2Jl2CE4GduEyUd7L6bWxssx86/M
	 AWLDVCgP8/1iPfdVEg2c4yZh5PgBjGyzWOStmcT2MUsVV4DpgqC46eojSYQ5Lg1o/fJFo
	 nTe26LVOBo5wgFJo7BnBy7IsqtI/It9Kf2wFxNrx/mU185hSX0+5Rex7vvsUA31suz4Nu
	 srErFjZk/WzeNkpuS112YNAgLh7sH1a/AriDxJ4hMOV0FI986xHaLxrW1jehmULNFiJTa
	 GTh49JUR8jyVf21TvvIJwv590GWQ0SIdvNZxE/Fko3c7U50EXH6YMBudUAf6Fr2m56A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539186;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eT1ZgrV2Ck4fZ9efmuPbNNxaLlj/EicvgatjwZYwpsM=;
	b=iLoL1PRS2md2wtG0EbHtIe3XYPlyAveV8Fr21e+G4aaTCZ4HYJllMmgdIOcoFTKMqXkQ
	 Srs+Fo0EAnhIUwUQJpmoIpV/P+kLcO9HnT4WhS+xkf6Fa6BnfR+fu3Wt4/QtsWCJxul8i
	 Z28pDs2769OKFyE5fD24h8MmhtBrQZJwdVqYo2mpslKDYoRUpQLTClq1VxveR6dkvYn8y
	 gJkWPh/kUFeRTEWy6zMfCUHtss1vssNIvezmFqfkFZ3fnMmXPRgl+gxHs+VE2yxvD2HzK
	 rsWCQC/hT7fUwzSxcgop3hJFhyQNhS7C0lWYO7BOzA95OJWoScm7MdTxtKXssTUrceA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=gMHJQwrw;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=h6aH8hQo;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62D1606A33C;
	Tue, 24 Nov 2026 16:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62D1606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=gMHJQwrw;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=h6aH8hQo
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795539161; bh=eT1ZgrV2Ck4fZ9efmuPbNNx
	aLlj/EicvgatjwZYwpsM=; b=gMHJQwrweo4/Y8x42rav6qKyHV0vD9kcHz/HyGJiXoqrxr29bq
	2hm/cn4Hi3yajAywzyKM83kc8oBtt6T7R5R+KoVaOHF4ix3prXyugSRjkQes3+2a0VkWbvq1vqI
	K6LoxCBbgRI0TLVSoIB6sMrgI4IEbUXAFUaBFaMGu6oME20kkcEzDftAZswnxGEcU7lZRI1silU
	dgH61eXMy9F2RFs/gThhG6KXeJUMoV2f/JjlX+gGpqzMltQtaMKXNiNBQ69DLKRTuIAyGVrzQX/
	5GzospM/lkI8yFnBR5yBmOLXxN2763EoVrYyyxp/9UaEgUcbQSdvCMKkJmxjWwWcC6w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1795539162; bh=eT1ZgrV2Ck4fZ9efmuPbNNx
	aLlj/EicvgatjwZYwpsM=; b=h6aH8hQoalxGA1PH+hvvxjKbYpBzZ+h4FfT4F5YAU+WFCoddam
	OlEcG+8TzysJCJ7AC6Q7jKRwIeYZ5SoAAcAg==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Tue, 24 Nov 2026 19:52:38 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: sdm630: fix ADSP FastRPC heap
 assignment
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
Message-Id: <20261124-qcom-adsp-shared-vmid-fixes-v1-2-f1a808dc41a5@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539159; l=1431;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=2BgrgIQTUEyBQDKe7vrxNA9ztJIPlRpoy8d6fEsJT1M=;
 b=sNkoZgl+EWdz9p72D93p2cHZKPZ7/+vuvpXc9Eb+O71x8rpLYiB9hiOQQV+ZSW4mdEbf1+Fe0
 IZXIzoK/T/4DvABq04jFb9fJFvVC0U9IuIf6yLurQJpwmiMsNZYH6Vw
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

From: Gianluca Boiano <morf3089@gmail.com>

Downstream assigns the ADSP remote heap to AC_VM_ADSP_HEAP_SHARED only,
without HLOS. TZ rejects HLOS + CP_ADSP_SHARED with -EINVAL; since
commit 6a502776f4a4 ("misc: fastrpc: check qcom_scm_assign_mem()
return in rpmsg_probe") that fails the probe and rpmsg retries it
endlessly.

Assign the heap to CP_ADSP_SHARED only, as downstream does.

Tested on xiaomi-tulip (SDM636), destination VMIDs:

  CP_ADSP_SHARED (0x21)       ok
  HLOS + CP_ADSP_SHARED       -EINVAL
  ADSP_HEAP, ADSP_Q6          -EINVAL

Fixes: dc11a2824f05 ("arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC node")
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 20225732e4a8..327a8049f707 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2477,8 +2477,7 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					memory-region = <&adsp_mem>;
-					qcom,vmids = <QCOM_SCM_VMID_HLOS
-						      QCOM_SCM_VMID_CP_ADSP_SHARED>;
+					qcom,vmids = <QCOM_SCM_VMID_CP_ADSP_SHARED>;
 					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;

-- 
2.56.1
