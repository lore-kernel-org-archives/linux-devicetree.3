Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8593769F0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119214; cv=none; b=A6pkhjhD0yw9cGJcd6WhN2MLaWUL6yjAcbBgKsBvNZ9jSdOvUyaECsP1NSiBb65UOoYDPi9gFPaG0pxPpLG3EaHweWoszs5MRzPTz0EfElZM3ySy1lAY6YhJM3cTjyfK4+DIO2KKeE+Jd+PU8CF1LMmqgBnr/HcUh2m/mX3eLgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119214; c=relaxed/simple;
	bh=mdZEiXnEcF1Ehzi2mtklDaI5cuB2rt2/NDVg1wust1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0PqN7NRrJsQnqzwMuNf6QkUgZcB8iJvxoP0nXN9szr5HrtbQGiTtYIAHEanDr75g5TA4/LwORMcJYMXfmxAzrXYuSSpRcfa42TWGpITOOH5nF8KOfqnwqKnN506D1gkfphtGStpVPkztCHc5ucckR1FNdM26365DsDKCmhnQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QwThuBpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FB//dDT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QwThuBpa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FB//dDT9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN7DQH1529675
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=; b=QwThuBpaOj94wxfP
	aGZvMYv/hCPyvB5M1d6W3rBWSjnm6tClUxS6U/Aj1TxZru85Vw19y6eJGuM70y8c
	ysu+Du5MD2KjfllDMmPZ87ZbNPdU2yD3lxq2saQ92WiSjbmGw/vZBYHScOgxo/Ld
	h33sfb6P/dqUP502/+zpZx4iuzrx2VkuvvV4fimeqqNFdO6c39t7FKMUfYKbdMwa
	+yYvZYKuoJZd34N4YxeYCcg0Yj2wlmUn1DsHv0PntE7yjFp58FDn3PKwYzzadqlD
	KWXpQ+LAiBLNCuymUkk5Y8nLqqfwO+RSJHhD6XCKLGSpLDsDyZXy5yejiAs+Nx1a
	NjCHEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qr13h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 23:20:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso332942eec.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119210; x=1790724010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=FB//dDT9gLh6szvYaFpRvJG8R3sCBG4ldRvasOeqbiTidiRjXlNQN2QwMkI5oam6MG
         XAXzmfCeA6sKMv3ms3skyCwl3WlcN+P4PbesFPfiWJEqmz7ukb3emHoi8txC6EKxnVt/
         O+qf2NCUbuTFcjait53jImst5fs3clmXPdHGXb5Fbnd5wDFudJtSs0BLTwXC1HulMXcy
         3p8bCZAtvsa4jAgBJLduS/rgMZ9CfFcgn9M4lNtfLD+A4ujOs1vBdGnsGF5oVkuu+L/L
         tijBYxP2AUPkfwm7IovMvI/UN6NR+tdOb0I3uqkkTs9jKggQy48kcElFA8TlBjsMeums
         COoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119210; x=1790724010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56S6xjjOIsKE3JOw69e7WaPGTcKzNDtGbh91vAplCs4=;
        b=E70AwYiS2IKC9ac/9ozYtwTGJiL9KBvq/LdwN79lvZLjDeAJCBqURlUAY8EygkW+lT
         Bp5Tvudatn26roDUhgMh6TxR7ySSG45sq5My8CCl9JjPaoHJ0dssSHcsm1Rz6t/LTTc6
         igk4t1tTV2pvFwFQsiJzL/KozxssxLFSy5KZETZtak5WFusvA3bO3QJXL8Q/qVHf5U4P
         /9QlCab6TFzIFiuOzxYB4m3Sm0PS1MDi99zEQ3UiLh9MgjDnuYAtED/l+5Uos8w8OCKN
         +dHYxudo/XVOmz3zdkGN/las0789NOeXwVaeYMrnCPIXmUeKtDbSHmx53radwzXFBvBS
         dp2A==
X-Forwarded-Encrypted: i=1; AKwUvBwscWsFZPf3vY0QVSbiICRoazxdoit4Ak47FVSrAVp7ZGwSKAaWhDIEkgJ56ISWaPTXREhuKYWw6i62@vger.kernel.org
X-Gm-Message-State: AFuF++mr88BlGnO5Hy8Ye+WDn33dje62C6+2UQnoWVdi8hwNPlAiqZaa
	phzXHZ3xM6Lj5O8tRgCcj86uluo26Z2g6aixHm/my8qxmL8+mv0QY5BIwiUBKN6u3eT1F3YY/7i
	C3qv3rbvSBcbPSfLyUxeBcY+EhP8e2tq0v5w8JoTx106aWCvudJOJBUriaDhgu+3r
X-Gm-Gg: AYBFou031pae1nQLI3dE+iLFL6zKMrQKWKpSp9i7GmLdb2He8H6NHnE18q7BfKFO/6Y
	nV4faFHs+qPMv/rXV7kDSbfRKTVaxeoREGkFUgDdjQGwQc0lMU37+JLabnsHbnh1PR1+nW7PCSu
	mUkEtLHQGrDJNantK2KFAysyVSFKeDgW33poa34AxcR4VmRvsp235/8IXgksoGTbrrhbznhUV/z
	F1t/RfWFtOBpF72ISK7oM7zRTlAra4qucooetiP+cDEWfFr+GeEvVyFqhYmixtziG4ub7vVRXpK
	RVcEpv8f6FS+mBtKzZTzc5/1x9nab/ZxoKaMs+cB2D06RaoyD9x7eX1sAYFViB2wXUPdheqHjSh
	r74uJx2OZGtNIP94958N3s7hJi7Kc7d/WC9qgH3ksPzLKf7vXPQ==
X-Received: by 2002:a05:7300:8c:b0:33c:12b0:88ef with SMTP id 5a478bee46e88-33e5ca9fd9cmr913551eec.17.1790119210002;
        Tue, 22 Sep 2026 16:20:10 -0700 (PDT)
X-Received: by 2002:a05:7300:8c:b0:33c:12b0:88ef with SMTP id 5a478bee46e88-33e5ca9fd9cmr913509eec.17.1790119209363;
        Tue, 22 Sep 2026 16:20:09 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm1412845eec.28.2026.09.22.16.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:20:08 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:19:59 -0700
Subject: [PATCH 2/5] arm64: dts: qcom: Add header file for IPCC physical
 client IDs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-dts-v1-2-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790119205; l=2377;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yWrLgn4BhUP2Li9oQYTGa5Fv7Hp9QVFrMuhqbxh5MWU=;
 b=9hCgJgTcb3Aqpk4xPVAfRrJsZvuOTzllMy+LI/xgdJOsgbfTus4pBx9JIVwRM93WCUJh167Og
 pEpEN1CcVncC2/wMBF6ggXLXop7z1e6K1kLOSqbObktIuYrDg9QmiRr
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab30d2b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KM9v1C0ZMMhQZhCIbx4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: IkVVCV__8uT1wtDpiVlQcEcgWEzsGQQg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfXwXY1k07Lh+m/
 IUA/x5hqMliJJ6qcBQ4sAgGYLxFvugi+n2ViyQ6V/BhQDfB5nnIe4FdH0+EPTTWLfsuykwEz5h9
 wBYyQ82ihmvkNqjU6lg4W+/v2zHiIM0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX1LTK8v2xCcn3
 yz+8ZSO5UTgQkBTnmRQS+0009cvA+xNkdHORX6voG7sIqN4rZTTyxwoBx76PUbPvWRGIGYlo+Hj
 vUCLIEMloBaVZbTp6z6/ABjUzppjvyg+/8SpXCff40vYERWKmewyqjLFVAlvIyftoTSJCzGV9eK
 yliOfgkV5+54ttSn8Rp8klgBCJqU2iyDkGAxPw6T3QJ4GO6Ygn/nvIJO5PwsMeLABHfjsLQOPcg
 RtGlpPV88zvL0UUqunQxwjMiSfY23acOwVZUuf7pjYChmkKewoCcq6xuBnU9LcV+JUWCDVVYj+W
 xLcuGs78htnJ4cSAyshyqNYv9UsZh9IZ5jGDUV0hq6nB1jtLEKSt3ji2aFPtQBJEwuwSaMUqOaB
 yZ1R94/h4R0f8EOlnSdWo4t8dSVPNsVueg+lFABZz+87qCZmAuihVw+06Es0kl8petkGJdI5cTa
 85zfIWFNM55AHe/LLUQ==
X-Proofpoint-ORIG-GUID: IkVVCV__8uT1wtDpiVlQcEcgWEzsGQQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Physical client IDs are used on Maili Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-ipcc.h | 62 +++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-ipcc.h b/arch/arm64/boot/dts/qcom/maili-ipcc.h
new file mode 100644
index 000000000000..7cf66d20e9c1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/maili-ipcc.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_MAILI_MAILBOX_IPCC_H
+#define __DTS_MAILI_MAILBOX_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SDC			4
+#define IPCC_MPROC_CDSP			5
+#define IPCC_MPROC_APSS			6
+#define IPCC_MPROC_SOCCP		12
+#define IPCC_MPROC_DCP			13
+#define IPCC_MPROC_QECP			14
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
+#define IPCC_MPROC_WPSS			17
+
+#define IPCC_COMPUTE_L0_LPASS		1
+#define IPCC_COMPUTE_L0_CDSP		2
+#define IPCC_COMPUTE_L0_APSS		3
+#define IPCC_COMPUTE_L0_GPU		4
+#define IPCC_COMPUTE_L0_CVP		8
+#define IPCC_COMPUTE_L0_CAM		9
+#define IPCC_COMPUTE_L0_CAM1		10
+#define IPCC_COMPUTE_L0_DCP		11
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
+
+#define IPCC_COMPUTE_L1_LPASS		1
+#define IPCC_COMPUTE_L1_CDSP		2
+#define IPCC_COMPUTE_L1_APSS		3
+#define IPCC_COMPUTE_L1_GPU		4
+#define IPCC_COMPUTE_L1_CVP		8
+#define IPCC_COMPUTE_L1_CAM		9
+#define IPCC_COMPUTE_L1_CAM1		10
+#define IPCC_COMPUTE_L1_DCP		11
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
+
+#define IPCC_PERIPH_CDSP		2
+#define IPCC_PERIPH_APSS		3
+#define IPCC_PERIPH_PCIE0		4
+#define IPCC_PERIPH_PCIE1		15
+
+#define IPCC_FENCE_LPASS		1
+#define IPCC_FENCE_CDSP			2
+#define IPCC_FENCE_APSS			3
+#define IPCC_FENCE_GPU			4
+#define IPCC_FENCE_CVP			8
+#define IPCC_FENCE_CAM			9
+#define IPCC_FENCE_CAM1			10
+#define IPCC_FENCE_DCP			11
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
+
+#endif

-- 
2.34.1

