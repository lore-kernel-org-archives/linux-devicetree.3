Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376547B41F
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 11:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198929; cv=none; b=hq4OraH44dOgUJs6aKh7PkkSW4xgJwfPhGzZ7uhFivVRG373OwRr8pyO4MEKvIBpyNRqoUihpzfhEZnnzJ1TMcuYUuEA6Y6PWBLmoApys6ZWoX56l6gx9pmxQuZJC6SwHMAiWwMxDYZ8CUNEgVlgtPCJwMVwqrWhzsDpUYKQWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198929; c=relaxed/simple;
	bh=iQptdSxIZbd6XD+am5BwvFFoB8o0BWFfJTajvQKVbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8qEuGSinOBSkjGNjs3mjqyKmg851/IQMCNxsZVpaFL767owouUBA1XM4dS5Hq/Vf++y0+Dxf9fKfPuhk/2JzOn27dJoiCi+2/ax7+CpP1jjiz+a/5ldZ7LJZYG/Oshar+7CiLHOBVbiOTwluxkMAJPCItpBcafFmECEe/PrhWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfWWb6kS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8E4/9fS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfWWb6kS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8E4/9fS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoG4m1744291
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 11:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=; b=LfWWb6kSDgH44Jbh
	d0xVrKflfiSPFoHkHXnL82awvAmjwEcZTYBTD7Qsy0G+RiFD6j5lcTv750NKMw0b
	ZV0YeDZqICmUFeqjd/LT1hxU0gmN/p+6SjtnVEM+LAgJqoc0KJJn2doqSHoEWOkn
	4v5qmWu8YBlq+Q41aiPC2pU5BOrVl0ph18JqLLzV9ZjqwFqz06e+xPPkUGIpD653
	Ob3opncIFrJOAXdwvI1vh2odYmJl7WuWn7mRxWpZLvgKazDu0OXiKUtfTEWBAPh7
	RTQD2y2jRHHVM1lvBIwP9isjILUbEdWwTHZqUili/u6fHxWGeRBdfGb2iED8FJlg
	MG0uAg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgysut6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 11:15:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88629a452e0so1304479b3a.2
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198926; x=1791803726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=;
        b=K8E4/9fSfE1tO3cFtS/WlHOgE/f2Ka8bKrfFUvnV+1As9wpZO4ZlC8YTb23HtMJd+b
         yxMOIO8TSVuf81I0fOdmCMmmOIhD6u5rQbWNv1WyT3MTE1k5bSmqNOX0Nh5m/zSWJvi9
         MnHEfitVSFttUjGCFbRPxaCqWWzHMxF//JfJcaGJjlWJvMo5uo5Fs6aXkv/cX/m8iFWy
         5Hj9/qMQM4DiAS4NNsMvw/paaD06ubUomuhnN9le8E1asCjc+jriNGabMRknw7jlwV/h
         Uq5D18XhJmbVxWN6pEsjtyt2csZHyHcEAbzFsQbvB3pfaVXfgZuhgk2xejQPg8Rnt0q6
         NIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198926; x=1791803726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5zpWD3mnv7WU7hMgVBLR/dKIG8Et/paIfsLnXHJhkU=;
        b=UWd3zS66svJhpnYekDlUeQe6MgPy0K/03J4cTE7fWmzn27/FEuNlZ3mmQRjLvpQxBC
         lCQN4L2hnhFeXKfJfIV1lQFkqiWUGV6kiVRGkjs9dTaS1MkskBsyNSyf3Qc33V7r6Dt2
         YFvcu1yxT7ULFSDiq/sCCsLUjSnxmbGFfoFx9Tqr/CFJAkSjDeXFf+qVGveA2OzZAG8r
         JnxU9i/qsfVewha7L/T72PNL24+fA8UoJK+rMdoVuROD9IMBjYtSv6fqHghM7ymV1Sgq
         l+hw4ICHswhjXJCE29b7HXnGsBqqN674GxNWewyQfstxpkcrP/QGRDqct7P1hEEAspfV
         CP0A==
X-Forwarded-Encrypted: i=1; AKwUvByAHQGMyhov8HTnu1OpqUeEszOxG02cHAuHXKN/drGjVOXMA+xaq0aOxgMNd4sR2r92rdv+FWWSjWBe@vger.kernel.org
X-Gm-Message-State: AFuF++laNlrBg0j/iPMNbY7iEacLFxo26WDVab5oboFqZoL7iCqIxEa5
	vGZJjHqDJYeQH9vhWgGdSdATgyGPZCONErj9/1YZAxA658v23/3fVgE06O0eSxz6ieSd4MhvbA3
	xsfwIRdicMy6CTHJEbT1d2qWATLnvSyjcAJmqM4MgyhCykV4LK9W/SmpQ0BW3ibnh
X-Gm-Gg: AYBFou0NtfeUTcVw6lTaOI7PaLFubPwUAg2ZxYy56G/IVhnkHBPFpItEFjMGLN65xmK
	+mdf3TZMGwOI0USxQU8kqTqx+ZBmJ2pmd4Mmpj2j9/+7cSY4wYpP8CD8ePZ7A3GYDyg9Apjt5F0
	pxW8kflxpe5aXn+USaT9BYtUXgIbo2VyX7zARbHZUYrDnjZVWBJcejq/vNgLMP7FHRl+WYPYUHn
	ggvdxXWpWptwwnIKgvGgvQTgub2cR0jKVdi1z23nmjsbR4siWhV/gM1axelqspnZus5geFhKcsA
	TLaSQsqZDYGneLhqjuJmP0aZot8o7m+DBNwdy5DKX7SuEu8yoAi4mqs3wuzGUJds30WlfOJQ5w2
	cgCxiIKdBwuIRQQ==
X-Received: by 2002:a05:6a00:816:b0:885:2a6b:1c46 with SMTP id d2e1a72fcca58-88af2689661mr10121783b3a.8.1791198925962;
        Mon, 05 Oct 2026 04:15:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:816:b0:885:2a6b:1c46 with SMTP id d2e1a72fcca58-88af2689661mr10121537b3a.8.1791198922775;
        Mon, 05 Oct 2026 04:15:22 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c59e3afsm3249852b3a.33.2026.10.05.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:22 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:44:46 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-shikra-el2-v3-2-618f7343695c@oss.qualcomm.com>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
In-Reply-To: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791198906; l=2800;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=iQptdSxIZbd6XD+am5BwvFFoB8o0BWFfJTajvQKVbRg=;
 b=YPUoiHynD+erhLO/09Ji5++tV2ctGKv9cC8wtdDWrfaFo9zK7Gqpleup7dSXecBB18xuhDAmn
 LgzK/jM9eIMCthYYb4vekTFsUfG7pEqqQLYF3dQ10EYhRMoKfKshBpg
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: hbmt1siOem8hFDEcdfrEVzwYHs0TFh83
X-Proofpoint-ORIG-GUID: hbmt1siOem8hFDEcdfrEVzwYHs0TFh83
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac386cf cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ieEIU8YVhEgz5sbSP_EA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX8rApaE9pN80+
 Wm9g5oOrgYZjUXxgryVKSiKh1VTZlQjDpTTR0cgRpGdS7i2wW/PhuE4otygf/U05ulxNWBiBeYj
 n50LfRsuM0uM73cG2qpVnPNhKQDt8peRhX2HAae2MVd3eLbvpYJrGVJr5S6fexygdPRjyuvwMG0
 6Dq6Yl6Bi8NWcoX8uTYddoDK26VK7b8v/cUko+HzX09Iq7tih1ACqTgDwyyKZwfuwc4CXdHucFn
 Y6QjKFhMaKwP9wt/q5Vn6qhI/f6jRRgOzqfS8P4L4EUwcu+wyuWpNjVnHDzg5T3EIX8qxqmOJEz
 VTSN1vHRhg2KrqEdR+giJSAeiLenuqSCYnK23XxPCxE52k2txHaus9B5ClRZCaBvMEuSBeewcSX
 P+lovPG8Eq0jIiCnH8Jkl1ECpTXTkclBWIL5lQspLVVE/YciQJgB0oUSNXKHf0+tqeVkwJqybuW
 FTetnnTbV7gpN+Y+dwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX3IVpxRsBwEkj
 8IZNelbsdsWOf5Y2WcOKo+yfW3OcNlJvVD6zDG2SyBDKwIg6HMvmWFqyz925ks3f8WIbrG6ua00
 Bfu8DNrxxxRwLEUcFniaGfHvnKz9II4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050043

Shikra boards currently boot Linux under a hypervisor, where the
remote processor firmware IOMMU streams are managed by the hypervisor.
When booting Linux directly at EL2 without the hypervisor, the IOMMU
is instead managed by the consumer of this DeviceTree, so the firmware
streams for each remote processor need to be described explicitly.

Add an EL2-specific DT overlay and apply it to all Shikra EVK variants
devices to produce an -el2.dtb alongside the "normal" dtb.

Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        | 11 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-el2.dtso | 23 +++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..296c53b82687 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -373,9 +373,20 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
+
+shikra-cqm-evk-el2-dtbs	:= shikra-cqm-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
+
+shikra-cqs-evk-el2-dtbs	:= shikra-cqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-el2.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
+shikra-iqs-evk-el2-dtbs	:= shikra-iqs-evk.dtb shikra-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-el2.dtb
+
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
new file mode 100644
index 000000000000..d2f3186bd47d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Shikra specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x0200 0x0>;
+};
+
+&remoteproc_lpaicp {
+	iommus = <&apps_smmu 0x0360 0x0005>,
+		 <&apps_smmu 0x0366 0x0000>,
+		 <&apps_smmu 0x00e7 0x0000>;
+};

-- 
2.34.1

