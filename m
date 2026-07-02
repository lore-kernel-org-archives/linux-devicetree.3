Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40197480941
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985896; cv=none; b=u3waZJ7PuG/JxZO05hGZXrINqk3afIzr63nQ6VdVx2FJbixJc6uziCFjBqziLDDJ1sg7rdUQ0nlH4k7SQ4kR9YTqUgnAKdAlMac3By1RK4ICowG/92l/6hBaHo6KIsgLvn+je9A8YWA2WSFpJy5o7En3OOLMTmrKJMR41kHfJQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985896; c=relaxed/simple;
	bh=W+J47DLyzKHe2QopLDHxTslHmL997c14k/yofWkF6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ri5ZLNKTFrejNqHI+Mg80bzqNr2EO4su1QjZnoT27Xy+9wg4N2zgPZw7CblUSiCkNb9YNahEVJ46lLmXtOkIj0URJG8VVE9tIk0pMNuVmeNUKZAR0fnu350hMLoXow7g3zYn0i8yehOPjJa3BG9cl3W/rwujBagvU6XzwyKnAbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mt/FVJP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+dO6UBe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mt/FVJP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+dO6UBe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KK584115146
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=; b=mt/FVJP/tJ5BWdlV
	MFtSrp87h2XL4XjVlr8vGd+hkcnvXtHPGqIcL1k6a3eXrZ++8LtRL6SRaNh9vGt/
	9Jd7JO0BmAt8Lsr2ehIbSPs8tVV9R08C7E2rQx1dga+xwEtUcK8MmCOJ60wQ2ZY7
	efglepwEIW3wXOlyMWuGm4YmXVrAvyCfGVzeQX1OyeK2X5swe6aJQQqkMqXnc0a1
	8SKd86sJsX6XGVEAZ4mZ6YQzqynSLwK5Te/ZGDNPF0RnhctWixIR7m8PTT/30vAe
	6Xtr2KMHPi8tYHpJTSjCDYg4dNNvAZknosHC3ddQT88g8ho5MxTrcGaysMMSvPo3
	JSud6w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9403t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:51:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84770f89b99so2673956b3a.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985894; x=1783590694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=b+dO6UBeqvLQJZNOGMTlKmJ0T1R5bbKNmUYuTMybPKCn//pHtk7CSeRsbxpWqLEXkV
         gIJJroPjdlUAnMKErU20HTON2LhgjqWZXLA3TAC9QWdex6Aw/+7xUsNJQCL2y2qmx1T8
         48SOrXKysP292GZSiZxktlZvp5chYg71rlwtnfdWErwXQ2MlYn+lPTMC32NKdKpZZLGH
         +CEV3bitquxuf+XS4+jUkSeDgL7K5V29pHmUqJstU8Ob7rtdeadOxJHE6aaTBYQ3oMKX
         82sqJx1vea7I1LjpyPL1w4xc+IG1h3HD1e0ZYCEp4Zpn64/uaL1NuN76lIJDtNuhVeFe
         hk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985894; x=1783590694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=VodCfNqTONj4rdQUZr7mwtpsh8GlUKglOcYmRVFnHIxOMxwW54nEUTE6TNawj3XX4/
         1bFetHmbmsFUAo0nOaSztaB6CPsTKPaiSCkP4lMF4emtKRnJRL6geTC3Ew9sDFDR9d2i
         y4eh1sLSJZflb6G6hliLFEjJ9P+IMbDSg+YlTfwY3mlnrIC9vbespVd998xi10jX8JRl
         0LxI2nh3d1HYqGVqsZDOQDcCPwu3KiBmCzlJdxeNXUdzEB9O0ZRkVEXvRK957zRX4H4R
         wuHhAzXu4pEOJ93TiHaf/lAgJqouPYlyfrIYYw14krPua3xjcxhLFnWRGOqPJt5WdUff
         1wtQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro2P2jjFKlybN0d8dj3Jgb7Hfaj+J5tFZ469baUOQLEmNn/vSOzCT+rqCzDlJiRXEnAphvBYp+1jzgl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GPrx/SFkCr3unTsSls0ekZDOAlERE7MfD0XtzmZ/iVXMSPxy
	12PHkc8s1fkbFQnyI6DI5SeX9nVilbtiMxtXY3PaMnI+ofxTEHMGujilbiWffbeR2km+RZ1zX2V
	FAFaZuIqOOcuaXx1xrZ4tSi0UkslVwZdHwJMbPN5ymB7YlTzbxPygRQcWtPdWNB/F
X-Gm-Gg: AfdE7cmJIxTzgKJP1jI4GZW2ODeYck7K/bPfElYcmQ00kAtG/sf1RrikVA5BA6JnHBX
	771IEJVpTy/2d4TQVUrOK6lFZ7hC2+nc7335MeywSr3kPLyBFR7NXA5rT2QgDrjdXN3C2wqSjHF
	7trdE01GaVlMzYwEqd7q8iuBofi0nVJeQDM58RBgBfU3l2Kpt9RpTw51K5zpSEBMEFJpNtzV10y
	pH55p2TVpKSZqNLNZ2lhI/F5y+n70AYDPkBPJEZG2/ZwH/MtVLiZmL6KQ4fhbla4h1n7RQoKdC6
	HMc5sR0cLmJf2CoLjr0WNl7qT08viihljy9PQ3l68cTc2RQvHHcGsfoFCtl/YzTiJvc/ax0ngCC
	W+mOT7no20u2W8NB0f4db2RuT5g==
X-Received: by 2002:a05:6a00:4194:b0:847:87c6:486c with SMTP id d2e1a72fcca58-847c08d16a0mr5329772b3a.51.1782985893498;
        Thu, 02 Jul 2026 02:51:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4194:b0:847:87c6:486c with SMTP id d2e1a72fcca58-847c08d16a0mr5329576b3a.51.1782985892939;
        Thu, 02 Jul 2026 02:51:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb78ee2esm1110051b3a.24.2026.07.02.02.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:51:32 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 15:20:49 +0530
Subject: [PATCH v5 07/11] arm64: dts: qcom: shikra: Enable CDSP, LPAICP and
 MPSS on EVK boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-shikra-dt-m1-v5-7-f911ac92720c@oss.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
In-Reply-To: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782985846; l=2699;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B2Dpn2axDYIMHLk1wigFR9Q2p/KX8LBdfSSHhm53znE=;
 b=C01sg74303YfJrG1IZIvaMytNKmgM29upDf3ZU2cIOxelbs66nkDIIxIKa4ICb5StnUkXqH5J
 jKy0yJGGe3mCj8WKPgr/6jlJGeltSEHJm5fbGOiIOP9OloNeKbjNPVS
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX7Tfm/FOPfkPQ
 tCP42fIfti4ZurRmjH+OE9fPfDDAZbh+52EdwU0YV1N38FAlTjTeNWmIMwaB+/4tYgwGQDGml79
 LsC6M9cUedqU+DehmKHpuew1JURTu7cvXsRrHKz3qqVvN402dHe+xvdkK5TfwaGliT96ztRxUl3
 KoE7t+huHkm6qwFdxHsCmVmV0mAt1ElEsbcAqofmI05JsNK7qPH5u2W8VaCBWd4XprNj/aMMQRA
 n6IXn2cFFKVxa9dMAoNtLfk6i0rfn4J7BYh1EsgFf7UoHqg+jqv+EX+1fI092ff/a0EkngfWW1G
 OWiNoWC9V3/64QI3ut6OYepwHZMkUnZFVPMTmUvoXU984GestlNfyO0bup6jCYGYsUJToa+AAC4
 RtP3nW0OyO1Rs1XsHunu5MHCP9PjCoaLaYHpynufLdnsmXGRuwMyLtXvo1lGT2tKeoloB2ipVcL
 xn39cAgNKm4mLRlmtXQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a4634a6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: UNrzUNfcme3uPDFf3FjlItnHaKU2Lh7b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMSBTYWx0ZWRfX5plZKNPBtvMt
 00l4skowFOYDOeaWDW83Bzb+OlUQflNqlhQ7bf10YA6FnKt98FFJd5DvblKakeAH+hOnlVfOi4B
 10qmqeEZzqLUZmeK/4mrl0NuWGkKL8c=
X-Proofpoint-GUID: UNrzUNfcme3uPDFf3FjlItnHaKU2Lh7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020101

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1

