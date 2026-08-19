Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83B476CF0
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147881; cv=none; b=rWwfHaUDct/8bjIkFmAIhkP2A317Lcn9ksC/4td+tJfM0/Tsirm33zEKLIgTDCIPaDOCnNAukxkyVLwkFeXVybuGBoR9T5KB6ORnM42D3atMEdbLdGUBUTm8PRKG7awPJiqYdgpicFvAkt9NityDR3El4KBKcW6yuyTjNBbVDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147881; c=relaxed/simple;
	bh=ZZlgteeDBfUzoNrVmG3yeVVsHteSnimmcH/MKcfekAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAgUokATISR5MHZCeG0oki+x5vP4QxPMnTYmZaeofAIBccbYKL+vxhxKBZMcze6ccLidKWEavS+GGUJGESc6xhQV/8X/FL9bbMk3RLgnUw9znW+eYl6dQJgN/SouLl0Qk5YKTj6c9boMAIB1d/zBibZAu8WdYtAq7ifDVHc5hsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5jMAula; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3pg/1yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5jMAula";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3pg/1yq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0FsG693500
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGFUGo1tsAWQ+W3hOgvBYRH8yAG/2nwAmt91QOb+53k=; b=j5jMAulaM7WaThI7
	Z9YW3Tmk/qSIS15w2tLJImQfG4u0rltVjc+YW9ehYw5xpwPbwvMBeDz/7RIwn2sM
	oQ0JX39rCedXG0IvZGotkjWqqG/z+ioDug79G2l1DFLIHkm6hr6wydjp71nI6nsv
	u3NXLqUAbh4kVw1GJomyz9GD3Ub0g+bzJJTUiZMwAxxfdUTMtlltzcRAWwNfj/wV
	KeuObb7NXZ1DUNJk6+kzgB6wqmK0yRZsPsbRZFtg+Lmf3QQHjskjJBch2DFiE/r7
	f0g4Hv4zNun5CYg+3tr3Hlm6YwSH7CjwDytJUpjLiJYztbhXpeGKjy4n5E1o3EaD
	XBOARg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmbh6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:57:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d371c85362so1966165ad.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787147877; x=1787752677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGFUGo1tsAWQ+W3hOgvBYRH8yAG/2nwAmt91QOb+53k=;
        b=L3pg/1yqh6jWrW5lxsQDy81I1RpvQn1CIF2GA1k2Jsx7dTogZtO2MSIPwEV19RZ2nj
         pkhEUuKalm/yyoUnmMEjvsY3qDVCMRzRv+RtALIJYLgEuqaP1D3FoxEAbvx1kLcCSde0
         8RevQG6uR/Zbjmwnz9LzX5fso5dIRt7H+S48WpxPjB465eOnFG6VUSEwdUtv+wQvC9rr
         4OeOBshitksA0LfgBtJRxC0yDt++SWRJVyKsWb3Av/u8ZSqvUb1OgHKPagSYTGvYEWvM
         VYavNviP53S6p74Y2T+4YYK1SpmcmWa1jCAgD8gHy2+i0Jb5N3QUCZ24pwFq5y9rfwKF
         IaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787147877; x=1787752677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGFUGo1tsAWQ+W3hOgvBYRH8yAG/2nwAmt91QOb+53k=;
        b=PwOOHuh7/1SmiOZZgQ7O7HtLjAv3lpYtgobbOhETXf/L2/dP62oBkcIPrtscjOXrkS
         LVARy9oZGMrA9S++oWj/fua6nU6njt3vNnqoCUUZAEurxq858qSpYAOQCvjQ4vbnRoW3
         nehSHvz3TSpSumpUbmuYJhjgZHk7Ci+K1HJzOGQ3kBdeNHWGj2NlO2zDwGHpN9SzKlhH
         4EWJBi8XjV8ejLKKNYtjFrZAurbcGGKpGsAVMFXN7gbeiX8qF3uPEfeh4Q6XkqpMoz7R
         movQpZLAs38z1vioMG/w0hkpqdyk+sfKrBShcqNoTpRWwYpYHLfcGUZjAbJuL3Kz449L
         4BXg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1d2V6T03vRpW4eZisLWz38hTrF3FzU9KW76MbEMz4XcGYmXpW4ANx6KTceakttRpPnLVMuy499Wue@vger.kernel.org
X-Gm-Message-State: AFuF++mQneUAMaOKu7jbRrS7HtPpAIqqijY/eJ9IYGIt4VYsKiLwzpBc
	oaJLFKnF6jCK/feaKXWWV4Q5JB0GZ2s8vzBM9dI9DOKRUucrAbvpnHDykCGOgn0aDsc7jTUP3jq
	Llq3Mh/kz84cw6qkj2nRpS0O66r6frm2iR7G1qljVSmC+Gz2JzaBTrhEW+XP+sX42
X-Gm-Gg: AR+sD10SeuwV2nEIAM7bVZjW1IMLOrJLahKSJ5Y85SaS4OauHrXVnNOiA1yJ5mV2ySn
	h5kYvoFo/UA2gXNahuupFGgn3497rjMDR8spViU4ZaZsjdLrzCtp2se2bBotI0nF94zDMX28LEv
	TOtV1Sxwt60LUtqP9hNHdXQgS6jEZUgt1ZSCkO1Wf13FliKPnifj1Yh8k4qAiFqv8yL2IALn6QY
	pRnNPI9Z6gisDu2PNdxVUc1IdcFnG45a+JuwIo8xy+BnZ8EqtgwfMO9/t/pxrUbq8XrKzQuC/BG
	kShavJmysIQ/zPlDR++RAsDuYuixF2BAjM8q0evEABJgZptnmzb0NiqAiDbJqDNYX4knn815pPQ
	N1vJm6COlTcnwmEHvnK308xw3P07Znj7HjPZW1l7LMzbD++fYLmM=
X-Received: by 2002:a17:902:f68e:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d5fd491cbbmr46771055ad.0.1787147876491;
        Wed, 19 Aug 2026 06:57:56 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c9:ed4a:c3a4 with SMTP id d9443c01a7336-2d5fd491cbbmr46770495ad.0.1787147875882;
        Wed, 19 Aug 2026 06:57:55 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e550dbsm25318255ad.42.2026.08.19.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 06:57:55 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 19:27:35 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: monaco{,-evk}: Move graph
 port/endpoint anchors to board file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-b4-monaco-evk-m2-v1-v3-4-988145ef65cd@oss.qualcomm.com>
References: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
In-Reply-To: <20260819-b4-monaco-evk-m2-v1-v3-0-988145ef65cd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 9TDWmOq8oXhnJIXS8uLgmiJULkK1wcY2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX1FnNuMsnDEN/
 4hNbjY9JpW+f+hujEm6RayCcIUThZdNGQukU1dIgYnOrtIuxr9wk54kk1Yh+/YMKNKu1854esxK
 46GNFp8bNIVvkekCbs29+A+GXgVU6EE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwOSBTYWx0ZWRfX5hP+HJYigFrR
 Qsv1hTka6Jt5DEAnVYxJ08clJdxCfaseegEP2Q04XrthpGmNx1bGZpLMOXdl4Wl04Ze/J2ZiKD0
 5M3xhIVdGbArq6rjt746HJuJ1XwFdb6RjqcEbJCTghO6EH3c69ezPXP4uUwpMq7nZwnj6WAN0xV
 yYvqSP3FFlBThnXOSnqrS2NOYfB5wJwryS5TZ5ZbumFTySBjMl8eYnmUtFRDsePIr17E9jVI1OI
 Z+AvPg5QUR13Kdgs9NVjMfZ7DE8aw2dD7NXoAaQ1+I1XD08T23gp66r1PrKgKYDmHlUDQCF3RZ7
 d7TuxgTstjzqija5F/c2TtjvJfcA+oFLZSja/60nk74lDXgy0sqAG7ubdwOAKwwV/dYDTI7rfPx
 7tAZmt2qk1Kal5jK2/Oa/16+EdfBVeWOpP0VNNl1PJnfRGy12Eq+wAVEtUVDekSfbIAiOZbr9rN
 +gEdPmo1uOig7++05Fg==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85b665 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=S8xJJWJrMX1scVWJMSUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9TDWmOq8oXhnJIXS8uLgmiJULkK1wcY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190109

of_graph_is_present() only checks for the presence of a 'port' child
node, not whether remote-endpoint is actually connected. Adding empty
port anchor nodes to monaco.dtsi caused hci_qca to enter the M.2
pwrseq probe path on all monaco-based boards, including qcs8300-ride
which has a soldered WCN6855 and no M.2 Key E connector. This broke
BT initialization on qcs8300-ride.

Fix this by moving the port/endpoint nodes from monaco.dtsi into the
monaco-evk.dts board file where the M.2 connector is actually present,
so that of_graph_is_present() only returns true for boards that have
an M.2 Key E connector described.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  8 --------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 5930ddb3b4b1..5aae3d8c66a1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -688,10 +688,12 @@ &pcie1_phy {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
-};
 
-&pcieport0_ep {
-	remote-endpoint = <&m2_e_pcie_ep>;
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcieport1 {
@@ -974,8 +976,10 @@ &usb_2_hsphy {
 
 &uart2 {
 	status = "okay";
-};
 
-&uart2_ep {
-	remote-endpoint = <&m2_e_uart_ep>;
+	port {
+		uart2_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index b17d41059e7c..438ccf6eba64 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -1184,10 +1184,6 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 				power-domains = <&rpmhpd RPMHPD_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				status = "disabled";
-
-				port {
-					uart2_ep: endpoint {};
-				};
 			};
 
 			i2c3: i2c@98c000 {
@@ -2406,10 +2402,6 @@ pcieport0: pcie@0 {
 				#size-cells = <2>;
 				ranges;
 				phys = <&pcie0_phy>;
-
-				port {
-					pcieport0_ep: endpoint {};
-				};
 			};
 		};
 

-- 
2.34.1

