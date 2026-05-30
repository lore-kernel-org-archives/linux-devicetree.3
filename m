Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099923C4174
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165710; cv=none; b=c9Sy9Xlci8KlQl4PeugE4E77BTxW+qxmqXtD90bZ9LOJ6KA0awgQmd9V0seYmK1BmNh7/UyYQxgmanUJX1KeizVf4onaYfKwtiBzlyWIqrl9b/x5hF2DKyAo0sFfwx85u2zKE26yo9JgFmv/keTzMAQcMKddxhbsVMvbgNS/y2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165710; c=relaxed/simple;
	bh=szx38dk7eO7FpCFIXCdeBV79GbDa6G0K3KhI7GR7yMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfJfpIxdkPyAiomLTqdKLaBIlQqPrKfNX/EtifIT8vt+Ms+Ylb7zuYCKcLKsbBD0G4HpK+Cmjdji18fgz1F10CmGkVEkukPRDDz+tfMPupn87gKOyTtqpKTNvQqDKCRNTv7HpeKUqV8bIpgJeGrYZ/DM8BA8aM16VQyq331cQrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBNXFwo6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFHIyg55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBNXFwo6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFHIyg55"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEPHWh1750544
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D+HCzmgZuzP0sZVwn+sOEAlTZUisDMNqv33YeVPjZVM=; b=YBNXFwo69NQ7hhyT
	itWqKqjTE3E74niXyVWrZJHbnHE4jQeUUOIUw599BXqXfw2+AoMj/leboxsvgfou
	UqvUxDFs826UMvOqOlVIR4BofeTtfq9wd2MTI9SAcBht+ewK+6fn0toNIXyMXC2/
	Ut4TsOieWkU5zAIp7+YInrEDxZFtg21kuEXbNSLv1je0vSzFdjCupzkgNx9DDt/H
	xo+nL22wla/8a9ltrKmJlbrvfeRf7HkAb6fJHwOSZb0prSHt5gAh7bon2DTLQzZe
	/JjVM8R5WZsxFmQqn5cQNqIEEKRMHKVuclkAR08dp5GR3AHLJimInQrsfk06hcKn
	cHcQAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr419rju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf32259e0eso14165305ad.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165708; x=1780770508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+HCzmgZuzP0sZVwn+sOEAlTZUisDMNqv33YeVPjZVM=;
        b=OFHIyg55piYopCdpL5kihM9APrW1Qfq1m2U08M4r1YaLxftmBDj+Z4y1TB3L2oackc
         3NK6pDR++wQ1tWMJcWSSei9q+c1cVyryzn26/QIu7MI6zLcDCwZ9WvOtC5l+A98GTWJM
         PO1CukXWQ4OBJW/TuRJAd4tB7AE4g85oh9n4kQOVviW1gFdXdf3qxzvcVfJ1hE66CkE9
         FwNxC1kJxHaktD/H5ikj6Tj0w0T9dIDkpjDx5SF+g3MnsAq3/tUFpomxYGG494Ti7gNJ
         N8kPn/xg4vmQd+SAe5VT2u/wRoieyuycjMUb01Ymw6db0prNg2pjVmPgOjb/zwlDd+2j
         yBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165708; x=1780770508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D+HCzmgZuzP0sZVwn+sOEAlTZUisDMNqv33YeVPjZVM=;
        b=fOJN3aMdw5FM2PQfFFPpOXuTosQZj/RCYb2Ub4xGgwdNIHVPVMB8CCbgtYPWyVUXSF
         QNiN44QkG0lOXfxUzp9o74TfSZQZ0QUsSbxGlJzUnlIVdi1qfiNWMZkNn/6VKwFbfHE2
         Vnv53pwrJyDK/yyH0B4z3JbmzwszcpPLgdq+Q21GZoCcJoqTQ3UASq/439FqKYqz0bVV
         oCeD75aEe/LpoaZQWfhqsigCzabnS0XDU/10esGXASnxZR51uuT41FsAS4MqtwrnkkvM
         umj88pp/aA+j3jVSuXtqHRknvGPP6wzNkIiDRPPesrKD6+5IvgZyAJW6egY01DB/7USy
         BeQg==
X-Forwarded-Encrypted: i=1; AFNElJ8nDKCAtLtq5jhTQHUHDftJxkAsEJqgegaMO10s9AggAM9zJX0qZ8CIGHYZ/xr5d/HxF+YWQmS+/1m6@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLAPW/+Dw5wHtYgfYWQ4XXFcLQdEOEqHoFIwpLry0OEiSeZ7s
	XVSSQ30htK+m6Bz5MOSTKRu3O0YOKG+Gry6ZbFaq1meePAdCZqbHXPHip0pgdYv/gMLmTJBKsg3
	TzBYFsqr9Z7fNQlGQLAjIsA+8q9LWqH6oFnQyhT90krvz5tUjlY2B4Qu/zmmv2ZmP
X-Gm-Gg: Acq92OGeBjV23lD6DgKaNZHJLygtDyFWFSJon4gJQP8w3s+deQBFyH6oeewNnSnob5B
	V/XaH+PyUqYh4L0N8ZYl0m7p85TFfuTJrvxgwVxO0AJe0NaXAnFBIH8lgCqy3b9zYad+FPgbtWX
	Rvw9VXxdKGOMj6bUgpiVV+mMGjRJocKGQDMEgXQjQUTqmoyGuPgoy7hQs1tTmWxoeTmV4+LHGI9
	Hokx1J1eqwO92g9xB6bpw0Aq0LA8taZRA73qFYk89IU6eGR2OZ+84f7Q+tltUekTZBzoEACsq/2
	6uTxz5MpGqNTzyHgIc/GtdIzPyfg86gawoCscWIJu4WZ8tSd1JYHJlM3pFafKB8KyxrK0Xdv2aM
	W8sgko4CR/KYBkkF8PucQdgUBXYqRH+pUq2IcTADhVIubgrY=
X-Received: by 2002:a17:902:ecca:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bf367dbbc6mr56498605ad.17.1780165707750;
        Sat, 30 May 2026 11:28:27 -0700 (PDT)
X-Received: by 2002:a17:902:ecca:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bf367dbbc6mr56498415ad.17.1780165707285;
        Sat, 30 May 2026 11:28:27 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf28973335sm51702635ad.63.2026.05.30.11.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:26 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:57:24 +0530
Subject: [PATCH v2 06/10] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-shikra-dt-m1-v2-6-6bb581035d13@oss.qualcomm.com>
References: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
In-Reply-To: <20260530-shikra-dt-m1-v2-0-6bb581035d13@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165667; l=2211;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=5A79pcddnRcu6d01V9L1rukvuSe4x6q+6eyE6jTLb9g=;
 b=r7bbRuyLvwN1pjchzJaul7Z78pPorFr8QoDVS2AY9Doxsz0i7SAi5DjpHc1SFm4uM539uvC2k
 4VRZtRUKUAuCdm8N6xAnXzBVs2q6zK+gLeLPOdJvszvxQYfqbHicGfP
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=fOEJG5ae c=1 sm=1 tr=0 ts=6a1b2c4c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lf5TueEQIH7xBdDO0cTpLyUQQ415M4n0
X-Proofpoint-GUID: lf5TueEQIH7xBdDO0cTpLyUQQ415M4n0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfXxDiTba+1kzQ7
 V1HUoUhgnk0ULmXXuDrAeKk3lCPKXqpQTTZ+XvyfuYOQC3Gb1wyMEUWpiKvoxXdZgLxXrrItVIq
 iAAkyRxq09bUs8nVLFhXq7LG/TZXzFYZ/aGC2Jq99MBisSkb57qLLTy+fAsNP/UYnbvzfftiVQS
 FR9C4eQuIqXYI9vaUYFxrj5+gdhic3qkwURPMCo7zVtH4JReNIGyWluBN8833Q/Y8WgVYB8srq9
 6apXE8Sg7tM+4kcxaSoh0Tk/INzgJeBa/4vGjvSjEqYlZnBCeE9G8Y/DakP9vLnjFRV3BNDiYo7
 3HdsRsIN2ABYfCOhGkzBLCNyIfpjYX8uaPRvnGguSgjvdHQjmizEUi79uymglP+TqM6/bB+Naks
 XkNxjM2xZ49LPPJsaKWxntGJIFCEK6mj+uPJCnDPQ9lI+/YExz+QY38TLRshRSGhjtowv+jjMQa
 lz4NhV848BZNvmjQcdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 6c0cfd73cb70..10a6e9f3b5a2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -413,6 +413,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

