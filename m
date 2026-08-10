Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430723C2BAF
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362166; cv=none; b=DsBn6DYdmtLmyrykCgSwuwLFp72DGH4fFlUidYS987FFn8kcyzsPhV9pX7ldxov3xdYWfALSDKzIFGfele6n/Gz3wqd02fmsUAmHx/hWv2QY6/Tasu9nBMg4qWC6I5FFT+umjyREu6YgBNch7EsFFnMHUMusBUZthBY2yB5zG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362166; c=relaxed/simple;
	bh=ITMy3XXDdoRhBPGbOVQrXlucI2/W45zsUXuZZWnavdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXC70Z2+snl7QzXQVMLsI0y20eqQdjA+tm+4Xz5gavW3Bka9aYi4tivKIlVE69tm+ColZsTNbPkgI68Z37s0ZPxIDw3JsPg6OJ8w1omY8S5cCcqgBCeE3Zt+lPxdB/Uq7WRXjZszB0P98eLF/zGd/jeLp32bZU9R2UW0TrtePBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osfTvwyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOwVj44y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osfTvwyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOwVj44y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9RsXa1231792
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=; b=osfTvwyzBKQMAJZq
	2G6Uavflj0vVcaJppNiLaLPlmqLbJWPyBu1GITbU1//8ffyPy19exZWFJ+iKKfqj
	Z+dIqZsWeQTDU/Bde8nKs9gNowFTOLO2XwIzJSRiJDdbNMvMbiE2342P6LV2LwsS
	mWRMnQolW2wM/3mqNTYNbnzIKLkhbKplD8ZlVN4RpqpSiKov8oT1AjM2Yj4JNUzX
	f6FVIjmHk4Hkt6891SFqaAybrjoCXo3XRz3+uCiJPKPFsFY87KMcZVnGkdwBpKOt
	MGAfkvIfj393DhlDv0i0O6YjDRbImRCglh4vlQDCebUsSi4D0wrEfl1/5tSYhsFI
	inGl5w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh58pkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:42:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso22417991cf.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786362162; x=1786966962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=;
        b=SOwVj44ynqc5FOVp0k4FGCvYER1X8JMj8Wrn5/fYBE3xcXa0Sj/64gbWThcYIsxcUx
         L1EFNHrBT9TOc+Kkyxlu8WXMgLYJJSxHChVse7LGdHLWgPKsPqt7BSdvlL+AADHOmMe4
         z7FNJVMKn+lTrNHW67xpH3XpKQ6YxzX5BeoIDBKUD4sQ5wY+0J9gpVJPcHjP8tcrv+0j
         9rhwV0sbifai4WQUfat28nluPsZRk0fpl3UwpF6lN+jH6a4ZPmdcytMdgwnqHD3BFUtf
         uSXEZ+Cpe3++oZgPhI7A5Qp5DCwagqMTGCCezgAd02eM+ET7rfV7i2Lo0hcwG0uL9RK+
         ojjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786362162; x=1786966962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDHhYWHx3GJro2jJt4Vqu4DzWH4xZAmWrvNNJ7vmnk4=;
        b=GyDOPBHYb3HPhwJTh9y8eFn/U9vJVdiB5JijKUMCMYyCYDu57dKfj26roI9oRxjrP/
         li38OnZsafWJO4hTigZgYGFV7peB+K+QpVfKPTT48TSIptZsycZ36ksJKHio3oFPxmsR
         FOXV972YVxHi/7bxHFQ8RYDS/EOUcN5oK5jYiQclKop0+qm8RIsyr52h5Snq6wHF0gTd
         HAqVlPdEMOxDdiVzi7u1tbt9dj/9iBX0JVxUkS+aaCEDGtEJXJZjQavxqtYkBtPvazdb
         4+4hWG9zAo/Bne5vc5qX2CcZFJAj7el+LZXSjOygNBFTAV4yoIRwikAtXNTl3rArdQVa
         0atQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZ4fNNjrNqb4ScJ+SRoDOpk88vszcv56/Mu73IsrKhWO3PCcIS9o7fXNGnH3b88O4ax8CuJS0i+AlV@vger.kernel.org
X-Gm-Message-State: AOJu0YwdjNkP3PBDDJ9gCvYuRrjP2qDWlroUk7rHU9xqp1e4ifzAWJHW
	ZlF2zMRkt1sDlZKoq1Lx8svgXSET1vCzKt+bz6yH2BBQORSSR7PR3ycsR0Wc0NFRjT6no0wYwYL
	o9FfMgl8Bt6+4g4CxgUn2DyAyt/VNj/1Yi/mKZHl+lvKmV397Ib/C2VzbNeMoBvdO5yASxRJB
X-Gm-Gg: AR+sD10bSFvowpdhUTgKPCWtIgDrClvvUHI3v2utCgAE0ZhJg/4+HKXTEKVX1yaEhMv
	g26GRE1Q6lhRONSAn8zqVGsYY6hPI59UT31jWXjz8xEe1jVFpmjP/lCiCfqjwbyBzNPoGSf5+sg
	AZqDLrEP2A/O8C2ps/GGvFslkb7TZg6lmMI+/QZ6mz18Py+xUFQB2GhQoj0XQE1P+TcdcnG96LR
	MlqldYYaz+qB9sr+qS+Nu3A3c3fcfI4rOKNdRgHKZ2Pkk0fwasDXHMDGq7BKyH1J5MWSw4hwdCP
	igWMzafehc3fywZfqlT6pp0KuZHH8gI5iF8fCZw3t5Bnh1ettbi6IFM2z7mqYTs26qjx2iJSA0p
	klTuVouhKiQAIqoyc+hHnzB8/gDAypxQl9rfqCx3ACK96R/G6ngrhfv4mPdf3OVFh7qsmj4eo/A
	RNBgNFMwz5x90nqA==
X-Received: by 2002:a05:622a:53c5:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52d4be1a6fdmr9801091cf.7.1786362161959;
        Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:53c5:b0:50d:900e:c1c1 with SMTP id d75a77b69052e-52d4be1a6fdmr9800561cf.7.1786362161461;
        Mon, 10 Aug 2026 04:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd67ea8sm21201671fa.28.2026.08.10.04.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:42:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 14:42:33 +0300
Subject: [PATCH 03/10] dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add
 MSM8974 SS PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ITMy3XXDdoRhBPGbOVQrXlucI2/W45zsUXuZZWnavdw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqebkomTnjHcCd6nz3fUS6RNEbpdeJ0MAPF/iz0
 1xmLLF66LGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanm5KAAKCRCLPIo+Aiko
 1YVBB/4sjxT6n2+RmwKxwbuq5vt2IrhORlwfQDmH6ba16857DNUAleyku2Hlaei/nxogyF8/S6C
 Tm1c+5JNCIEczvSmTzEgEBrkGDkZ4ThAP7bdKl7Um5zJRXivVsT2nlLEWeBA07S47nd0OmXMYnd
 /F6VnUiiwsd2OsIz8LnxNAzTVl2fHaQELdFykdueLilDczls+ROpmrUnfh3tUCIX/n+KRerK1Yc
 SppNhyOFPDOk88RdhraI5fFG+1NKXo1MHd6Xrw8mrQTXfLWFF6J5BrKjPFNZNtCtSreiqWr51vY
 EcqwjbADMNbEKmKeRENcfedQNz6ZnWbUgTW4sHIyGDXHyyv8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79b933 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=kaDxNF_GQ7L6msPqR2MA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BXwtmzebiHw8wmozS8PjykjCZq9pL_TF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX1X6HVLtesx/s
 6pOToyoE+RXZjgWGlSwCCerdD9nWIhq33BCFurrucUwxNgH+xqfAQcS/WDxLRJkkVCuArg9nK/v
 76aoiZCRv6guDKpPb57fuo00/xsF9pc=
X-Proofpoint-GUID: BXwtmzebiHw8wmozS8PjykjCZq9pL_TF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX+2gSloVKIDGR
 uOkc0Kfmio9xNYGHKPn9rgW/R3gY2crVhc3H6+8AQFkIP4OzVFoNTCr9qavUOBLmb7VYy+9mTOW
 jXM+o0RBn5UzDAiNQ5td0CUDtmG6XvfTkvcgiQSUF+Az9tL6vfvYvoGsziMUwHFX83/7rj0kNLL
 /UrfAMSPf6ov2Wf+c8YI49hMeLiZfiVZEYfu6d2iE+wJ+JCcQa+ERsbPLRjXUgJw1rG0aKitEQ4
 8snEhjjjb4J5DtKNmFtJGh7q1HG16/7yekMQJgq45PgMpYmt94Gl5YBXRUOlAHu/whOefi0uF0K
 LaoA7iT/CQu7u3qh9n16/QRPWqdhHCZk8eRZn4Grm1awwfCDur9AZ2h0EUUZ7lqgPE3E979IewA
 awpV8POVre25JCNcPZsycwqM4L2OlLsUHaCjnKWqf++aG+Bw7cyQ5R1rOhz2HbAeQ9U39HwIzgJ
 N/bJa4A40EY+g2hsIfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100102

The MSM8974 DWC3 wrapper contains the same QSCRATCH-controlled
SuperSpeed PHY as IPQ806x (SS_PHY_CTRL at qscratch + 0x30 with an
identical bit layout, CR protocol port for the lane registers). The
SoC-specific params differ from those specified for IPQ806x, so add new
compatible for the PHY on MSM8974.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
index 6cf5c6c06072..29cb43cf7348 100644
--- a/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,ipq806x-usb-phy-ss
+    oneOf:
+      - const: qcom,ipq806x-usb-phy-ss
+      - const: qcom,msm8974-usb-phy-ss
 
   "#phy-cells":
     const: 0

-- 
2.47.3

