Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC963290AD
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652214; cv=none; b=jeJa2SGHGkNePOr0tvlp3CwLKXzzYPHSO0FKOIHqfqtVYYpKNlSAlTkvg3Z6NFXAg0eypNfLaK3EfU6a5w9VDVkbYuUlM3r+SQYxW//03KtiEq+IJPYdRFct7dt2K08KDaXWuGM/MISM7ccWHFLU74GiN+faF/BxonBMGqFi7eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652214; c=relaxed/simple;
	bh=eQGr0nkxcoWjn7QIUaXrY1By7FGE9D1ix6Kr/LwIqbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boGscfs6OWNq8Ifhf/0eiWR7pWtY4zDH007WtWcHB61IfH4iEKGOjhDFPQD6SKoosfr10cmU4PxlgQAbv8HkyiiyvZL+u/ckv8JDdyiP6ySrJuCgPxHfkhcZe/HOxg+Yv9VDDbBmADQoHJfwGMtWQ9PNziVyd9d3b8wRqh9JbKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQlsBWBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dU4GDoG1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQlsBWBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dU4GDoG1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O1UB5q3593925
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3jR+GwNOETbRU/kpT6QGFXH73c8UZDoHdb7nEPtqQ4=; b=bQlsBWBL6lf9jRFh
	NpgOXp3ErGLyyp113rnoPJ9T5TgpkawPDVgEZePtRussoLXPG9RisWQpjZdPYfDb
	nMKTzXhJDI6fQMXmsOsY9Itu456O9U36V7Ow75tw2yy7cABWM1vdbWK3yTqFEuqI
	aLEJjcbYkHjKsIN4jSneP674FQRAZsVni+M6tjSg+petDOAB5hdyraCYrkhvzuOw
	PiRJHJKcRxCa0Zg4pTkm6zKlmAqwVl/Va5mIf/SKawpOr0tqT/7V4BxBA2TJYN35
	y7WsCzj4zXQ8qcXGKxQ0I+3mqxlwTFKS7875hrVl5rHrbz4TOqns2ksLKURvANEX
	2B8Utw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0u48t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so9737476a91.0
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652211; x=1780257011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3jR+GwNOETbRU/kpT6QGFXH73c8UZDoHdb7nEPtqQ4=;
        b=dU4GDoG1SvrV4xEDcM9i/7a91saxCnksqiCyB5ZgqY7cbPB98tCrMvcgHGKJwJ0fSq
         2x7WhgeT5+2X36KbHn+p9MeRV9JVUEyBk4Rg8nltrzDqpMgOzksdmEpgUElzaw58fwtL
         kcCu41IbidE2y1r3djonYj/F51dAf3MdMaI0fywqqZPKdDs8IpqX/X58jSlGAkEJCobx
         TBGwmdMC4JoHtYKfoIjEkJxYSP6LqG2quIqfLpxfD1ZwLqe3S0t9snnMSGPPjOeEt2Iw
         9aAqiYFY0IoXXIy0aOlpyMI/y6NHzLVBQuEM5OAqsU8OrZkGpBtkkZAcgaYsci3ba/QS
         3S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652211; x=1780257011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3jR+GwNOETbRU/kpT6QGFXH73c8UZDoHdb7nEPtqQ4=;
        b=m67cc+5LOFl3e1VnyNTmN2+5nVPDFobNefGg5cq7YEmYrmQtCYMl5qj1V5Ng4dnEbR
         0ZNzC3OYqbH2S/SbgDTH2X6ajWNQynVKba1FuYItvI4PEtcpp4MYCp2T9ZuopMbqeVmL
         JQUoKn7XFiSBecHSWkJMrGNd5TwNghqY37K0ua6YzeSuQpDDGolGBagZa2BIUNzbI0kK
         iMhp2k29zYtLzKpxqamRhRph3nnZGV3WCj1sSBjjs/DDvpgjVcAbvZ703CT6isknf4+R
         7P+ZbQ31vaVycmaIuofVF8VBuJqGFGsrCirnwbw8U2kypVygNrCu7eQVCJB3TSaVLSSy
         7M1g==
X-Forwarded-Encrypted: i=1; AFNElJ9OiVo0J+wFPFIXLLrO+MyQnB3xcExqUOxCc8fzFUhjvjKb1YHjJyLJWXKlEbJ12j7gdkqEPpkHnGp1@vger.kernel.org
X-Gm-Message-State: AOJu0YzIRWzHK+xqUgFRewe3SwAtQAVOwUXkkHJPJWImrscU6/SUkJ0x
	CkPwxUHqD+/MtV8wNGOwB9o8p3rYxY5iH/fr0Uro2q8Y9xOFdM1geLuTHdqeIq+4jFUfyXZmwqZ
	n49q9PydotmjV2arRdPsUTwJovy7OgkohAZHlwZL8iAt6m9OgI77nLlFK3irAQVKO
X-Gm-Gg: Acq92OFe7VFXnG6X17ri9dbOKBsvm/sarmfUP+LMlqrBv7mxHveB63yxVUC3bIdlvkx
	k6OBR8bOgWhuRrlcO2EguEWskVCSUAqwEPfEaxGsMq3uj/pfDsAkYbDG4HCXVLnAZle3jL3YamN
	KrD/2QSIYGcAexxnGoriVZKv6hKHDW069/I9+aNa9FgmTU97rCT4mP3zL+lQjcmy7T28SHNGHX5
	ubpLPiJ7RADDxvGmsrH8mYn7H3k5kD3VxE2J15JaOdIYww+0bl7osflnjuuTb4kx7INvF8UTght
	Lz2SBeYsUIYi7q2PKU3j8EsYLiDnfzhtKEaRNinlWVfiBgVhszWqqECy9pmi+gYeG+DHRNeWbzY
	XwCEKjWJvQqeo+inEWRT5fwFKQlmWxoOP2BEE
X-Received: by 2002:a17:90a:d886:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-36a676f061fmr11575584a91.6.1779652211027;
        Sun, 24 May 2026 12:50:11 -0700 (PDT)
X-Received: by 2002:a17:90a:d886:b0:36a:4074:9aa6 with SMTP id 98e67ed59e1d1-36a676f061fmr11575568a91.6.1779652210422;
        Sun, 24 May 2026 12:50:10 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:09 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:12 +0530
Subject: [PATCH 08/16] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-8-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=2211;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=a1F9RbX56fPOp9nyo4wHXXAYQfLg2aWQ/NsEbswCS6w=;
 b=HgxBQkgSNaAg0p/OjKCxSjohsKWoLpkpFORRD6Z1A402t9dXxxfeErjc9p5S4wOD2yqqBKcIk
 1jrSPPL4M2ID3/2kFAP40bZVC3z+xcVwcoopmWtv0joEQd7X/OphVs2
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: V0UU_5TZssy52rZiieZaQ1jsS6n3-_qN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX4w+VX/IO1ZNX
 uzY81CPtv8I4Z7nlU9cjwdsrAp5ZeQJ+8Q6+s1uPnAl/ZWxKfwpq32DS9gtIEocMgVKQ62xBEHM
 Jg5jMfZ5TfShQQVxmWNeQZXxy/aBc8nSkaQEHazNDuoPZwxX5ULlxl3QxJdcjYEhyvZ2CvL6PHz
 DIprZThExe/E20b1QH9Lv6CKLbzBF8lhRdjOFbYhyqZKRZdDC5ZFTnIqkpo1qIcWKn8itNqzYWS
 u9mcGqO2JOf/xzkZwPAD0+3Sr7gI7uxk/sCN2zZ7O/VvgKzAqs/b8IhaTUHtd3/x7ThOTsblhiN
 V+HwVdH7KmT7OF2zOwmHtn+sRA0n3Olx7S0OLFTAWEE9aMpbIYtt2bnZcHQjRXOT5Rn+ljx1P5d
 B8vA7XjS+OMDdqGd68a7AFoTemGgOz1t1Nh9b4vTelbbXU5YUHtGH6wxbw0Bq10eBSaPEUmG5cx
 m7nMLdDI23mmyb7SVgQ==
X-Proofpoint-GUID: V0UU_5TZssy52rZiieZaQ1jsS6n3-_qN
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a135673 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bb1821e95248..2ea35e4442ef 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -412,6 +412,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
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

