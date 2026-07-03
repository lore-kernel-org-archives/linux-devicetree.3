Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4DD344D9F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055044; cv=none; b=Bz7AC2FGiyz3kE/mcyiUQb0gexDDfkIrvokh0xkY8HATrQDuaYXkvMwya57nynxtzaH1/w76a/GE5eBLZ+bvXTKqpdFAv5BRWMx6JnsengKpAIOQViAQwI7dtram5aJizUrjo9ZVW6RPHB/RXtcmUoAVI5q7s8HYZPcFhvVfPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055044; c=relaxed/simple;
	bh=Z/WKNegsFatsDkLsxVMEZ3HsqNDu3wLrVIGJkYC/vDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHIdNra4ZHyRDFnlKoRyPrZN3hMqHNILfXvHk0kLwbrdE+ug8x942JKAAJ16mJm9t5a2ik63MAmLUDU/d3KK7XCUPr6bX6wdcelQalJnWPSmokwlJyLUcAS8sjsylW9Gfnsvcp3PezHssF2Qjs0XXOplGvcSJDn/4rYvQ7exI/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tfu0MG8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsROdTFK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tfu0MG8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsROdTFK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342h1d2777648
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 05:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FZk/vWN/O5F/ZDLqPE8QMw1fE1YoVN9Nf7DQqyExBlM=; b=Tfu0MG8ETJE7D4iT
	uEJssPb+iZky/iJo7Quo0oveYgdgvaMU08mTQfgH8FmVX0OdTrKudsKIPK3OXMMr
	xHXP4kFO5O92LGX7YEQJAaLCVFGdpej2o7MWjmpvQXcxLTudZGh7omqo6HZb0RkQ
	ZpTscgnmX0NxD0Gi7lTYgJ5SdR1pbTNLBgwLqoyXvXE2ZiofeX1P8gONhrMVGH/O
	L3Qvv0rE6ERxjHF7V4OwZjDJ+4kfO0xdyhDHq4wrSDt1MhpFg7Q522RV+R9uq7Tc
	6ruzztQn0zOz/30W/fAjAxnqci4zuJ6D2orYD+Z0suEMNxUtfZC72J75Qf/e1xbk
	u3gt9w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2536q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:03:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88da04b719so164008a12.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 22:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055029; x=1783659829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZk/vWN/O5F/ZDLqPE8QMw1fE1YoVN9Nf7DQqyExBlM=;
        b=LsROdTFKp2alb6Zt5orjcg4a2SbRtYbHKKTQ2yc+f1ZzIkdaJ3ogfDrFfeeZLpZIRq
         m4kN2CJJC06elcwbg+BRj3rcNvA6BPMW/Kj+dxFzgLGIwdz8VsZA2wwwTdIMSJ3WZF8I
         w7+QtZkMgNzW4I52YCYdPr7ekonxL/MPiNW7mL+i/Rd8gCqDL7YC7etGk5Vm545L2Z+l
         kUItNuSju+snavAe4mOmH9oqSn90ue0ahOzDOl61aRLcsglfwjuWX5m1O0U6wAJZjxuG
         aOsMqduQ1wtwMO9lWZIc4P06j1lxrU7EO0qKlM4/ctusUXqE2dlXZQVe3DcqCefzVw3w
         A/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055029; x=1783659829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZk/vWN/O5F/ZDLqPE8QMw1fE1YoVN9Nf7DQqyExBlM=;
        b=RTUuclAPeIykpX1ljaJgRbY5kvN8qeGekK1x8rJAxlIRL/fraPXgqZvkDauAOU+R0b
         eyZGF6pQHGNvlqinrX1UdKTjc3gr5HMBEgm5/miFTKYp2JEi6rhys8v03GpwK3XdMs4d
         4FMouCydZ8dqREVvYATyDEHE+iuk+wqNvZDRltuRXeH7MB9+XkAC3y6ak3W1+LbcKDts
         6ZwqPPtd9UUmBcP6JayPQVYyCib1Zv2pCqBhE8MDzR+zJR0C/nVR1NSZ2ezIEXOg43wv
         KNvNgzE0nzXvS2cWDZ5Eo0BZpLJPfVMC19MrNc4Jinb2LHAx3a/cTcXFXCQvuMthAB2H
         gH/w==
X-Forwarded-Encrypted: i=1; AFNElJ+ToanzkPCF80mlZKb1Rb/p9OodW0Gi2eD+VVMjn4s/W/67Tfc8LIQDW7GiBBIVSY4m2VZiRXq9Rvb0@vger.kernel.org
X-Gm-Message-State: AOJu0YyAvgv7NUMjEhPray+k6RqcZvyushouUpUoI1KA+ixmj4IYfuXa
	HWioawh3wRL6pdFPlbR0Y3Lb2xEo0WK/YLkiLtWMeK/MjakZMLRSxEBf6xN8YHhaT2NtMB3wAAN
	o0AVz+/urMOvS72LBobfOZmOyHTfRMrjugBYVwq7hMfc1WcIeF8IYCaYy3LHt39+7
X-Gm-Gg: AfdE7ckQX2mO4nw9WpCN+jJv6lDXdtRdekXHDUwGGZ4E2js67Gmt1uFjLoxx6aFK4BX
	Ipd3THbmkl4VqsUKaIXzcgzQIeqt0MIb1VuJmwwF3Z4BoQrhjSCYRm9A2fxVGlrq8TAogVgNZTW
	JLs8WNVuP9ubx1D3SGkl8ZWVeB+3DiCRIMJ5UX4F6r8EpcJnGu0+2rpQvEk5jZMHMPiraGD9OkP
	gZbMifnifnmT8VsYnv7Uy2idvYx4sfaocV9f9BuDZUpF9bjs/ROU6t1f2VpbTI6v0H841A/waSm
	sDMhRjxowraJ2Qwg8cJ4il278X1s5c2HPkAbjpnLaTt9Ne6GbCy0/TI3rq5G5/BTJlfq+ToX6CK
	hLhK1G0AUpZlVxArDv1pHKvJJVWBmlKMTjXuH0LQU
X-Received: by 2002:a05:6300:6715:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3bff422d1d6mr9767399637.36.1783055029085;
        Thu, 02 Jul 2026 22:03:49 -0700 (PDT)
X-Received: by 2002:a05:6300:6715:b0:3bf:b0b8:58b5 with SMTP id adf61e73a8af0-3bff422d1d6mr9767367637.36.1783055028571;
        Thu, 02 Jul 2026 22:03:48 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:48 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:04 +0530
Subject: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=2444;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=Z/WKNegsFatsDkLsxVMEZ3HsqNDu3wLrVIGJkYC/vDQ=;
 b=4rAKxVmboxTEsxT7HFUBnFpo6MQMdbnmWvyZUSL6xjXKCseXH82IXoJP7DNAKZwcClya1CWVA
 a/S+elRIqK6B9a3GaJd8IrCbMsNhTm75h0rXG2Xf0nt9X2cyTRbxdFd
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4742b6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=aPnvGIK-T0NEGnooipsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 9aCR5OoYDHw_HcoULySjO80SyumuQpmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX9UDBeVT27EYU
 wEZhU8fyYpfN0tSRgJ1HN5/vFf70RTAFklHSzYs3HTkr6YvNMfaJl7XKSou1CFP19nCdSKMlbAL
 V9/B7TpfKmQ/5TT2WvrwMfEIBCzV8A5byN2fRwUGDagdihA4TNoTWx+IWpi8DLzHo0OGCUBDiO7
 1Bp/N5qRRaDyGRq2Lnx2TwcJQnwr7MSFUoRnrQ/+Rvuyd9hS5BZxmmbs9mkTjlkcnoVAbVdFfTl
 BRZQCXG13FIS10aTm5BNiYK3By/zMybnepicmh/pg9o8j0Njv4WFEpDeaCWw+ntFDE6KR9Kg+Mj
 joA9alvoh2ahR7Ezr5nh0yAYY334zgWm1F4+BPIFwiQi4PuS88ArhTefAfOkryKpj2KrwcEUdxP
 JaUl/Oz80KOjBzVj1hP54rLebLmxlvDOb4+EEqN3ZslTS0nVMoU/8DWlbNiyax77FDuII1sKfKM
 cDkT1kTDYZsVBK52UMg==
X-Proofpoint-GUID: 9aCR5OoYDHw_HcoULySjO80SyumuQpmJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX91183/TDQY+7
 FBwDYE9sREiLDxN2dpNLRsKh/FMUqU539nB6izwxXgRmuoch4hhdeCHCLC//X+QV6Ge6usOH/fA
 Wt3oy5xDa9OBsFc5mxYZ/qnAp68pJL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045

Add Device Tree binding constants for Qualcomm Thermal Mitigation
Device (TMD) types used by remoteproc-backed thermal cooling devices.

Qualcomm remote processors expose thermal mitigation endpoints
through QMI. These endpoints can be registered with the thermal
framework via the `#cooling-cells` property on the remoteproc node.

The QMI TMD protocol identifies devices using string names (for example,
"pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
`#cooling-cells = <3>` requires numeric device id in the form:

  <&phandle device_id min_state max_state>

Define common TMD device index constants shared across currently
supported platforms. If a future target requires a different mapping,
additional target-specific constants can be introduced while preserving
existing DT ABI.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 MAINTAINERS                                 |  1 +
 include/dt-bindings/firmware/qcom,qmi-tmd.h | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57656ec0e9d5..ffd85fd1dd80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3410,6 +3410,7 @@ F:	drivers/firmware/qcom/
 F:	drivers/soc/qcom/
 F:	drivers/watchdog/gunyah_wdt.c
 F:	include/dt-bindings/arm/qcom,ids.h
+F:	include/dt-bindings/firmware/qcom,qmi-tmd.h
 F:	include/dt-bindings/firmware/qcom,scm.h
 F:	include/dt-bindings/soc/qcom*
 F:	include/linux/firmware/qcom
diff --git a/include/dt-bindings/firmware/qcom,qmi-tmd.h b/include/dt-bindings/firmware/qcom,qmi-tmd.h
new file mode 100644
index 000000000000..73efecef0f3c
--- /dev/null
+++ b/include/dt-bindings/firmware/qcom,qmi-tmd.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Qualcomm QMI TMD (Thermal Mitigation Device) cooling device indices
+ *
+ * These indices are used in device tree cooling-maps to reference
+ * specific TMD devices provided by remote processors via QMI.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
+#define _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H
+
+/* CDSP thermal mitigation device id */
+#define QCOM_CDSP_TMD_CDSP_SW	0
+
+/* Modem thermal mitigation device id */
+#define QCOM_MODEM_TMD_PA	0
+#define QCOM_MODEM_TMD_MODEM	1
+
+#endif /* _DT_BINDINGS_FIRMWARE_QCOM_QMI_TMD_H */

-- 
2.34.1

