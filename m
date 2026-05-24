Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3A3346A6
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652235; cv=none; b=SZ4KsB2uLuqH0LtRj1zbP/r4YMw+ID5TpEgUC8ekaLSPI21eMlNusIoiRAocxRJT6pBZvWU1Bjkg8TsLCdE4ucG9yUp8SibTMPXQfs1/0cGQvXpXGAJ7v9eGj8RNuLAdIkIx/IsVmgPTaMVKDLHvpmt3SEWSmADB741Nr8gXAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652235; c=relaxed/simple;
	bh=HZ7/7IjeZoPhuLN/esuvDjyXVaXxhOuhe52lN9ZMwac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBsz66BJUfvIAVt3aqdfinjoUs/nn6WcQJXGzqQipVbB3eixKngoqgQkpA5+GXfsGgtXSIvrs8FCB+fMgaZAfz726SgUOoGx1qya+eR1ROnVzdz2vnr8nv5M8YMPBM2lROmhAD5Yail3q7UwklevW2xl9bXjKKn96f1jJZtfEvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGsLT25h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brtmXI/M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGsLT25h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brtmXI/M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OFPn5w2028624
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QjPFT0emV6C2WElXznwvtli7ABAsS8Isx5jqdt400LQ=; b=VGsLT25hOjHPVj+q
	99Ha/BwlM3UQP5OnOnUuBTkh6fYdcG7eeTN/peYQdg61tWLzHwmrjLhLOanIz7OY
	9/mdNZmYRy5ifXtJfV521+oo6794cdn6M/3EAOeqxidVDovpSNsXD62o+L9V0cT1
	8b7Pxfa19qB77fpZcD+G+ZSzSvQ+6j9XGhJrVUOLl+Kuw9ZT+4ZoFMh/6WggzQEt
	ewhJfdOtJT8N5UDfLWnKXhMcJoQTVrZatYzudB5UB6rYLWPWXatNo1mNTX1JMyGu
	Zoo6qIsvhk+Sz5Tn6lzG5GJbhd0qK0Q9M9IFid5FCKymHZRZaMseZySplCOtF+2r
	xWiEWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb50fut5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 19:50:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36603ad6709so7395643a91.2
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 12:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652233; x=1780257033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjPFT0emV6C2WElXznwvtli7ABAsS8Isx5jqdt400LQ=;
        b=brtmXI/Mv3egUhAXroXJ2TxGnttUkuZ6h3dViXCp4GUMw5ojhbyclbmVJaspJusPmo
         Qs4c+Rea6xp4Ev0rHJi3gzJmKF9S2s/UIMXHSBVQB7iXdJ3X8aCDdwrlh5jqLwZXlwdb
         EkYQEVPZ7YXikafCgvzDr3yPoR3ahO7a6PvEcl+wg1BK+FEjLL0NvHtGsQvMjunuWQvT
         32SXuSJ3zrBOaJq0Ks0PaX/muMSBwqbDFFwp7xsQr3xOVItj/jLZu9UH83Vm/4bLHWb5
         VK7NEtFDcRQQHZWsQKvQbPIblknic/sFJVPBKU3nyGk+77dJpZuuIU8FCe0w/3avbuMK
         o/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652233; x=1780257033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QjPFT0emV6C2WElXznwvtli7ABAsS8Isx5jqdt400LQ=;
        b=K/5+VNYXcqBfY/Kw4PZ2t3d8x1WKUKJHV7Kzlm5fv01HzOQJChAOno7nXMYbyRU5+9
         HJpCIRwjPltfoe9eEG9pRxT7sW3wK9R26kWkEPCZuRXFf0cDSP1N1P8uml0J5U7cL3yo
         opET3Nv9sMHDy9ZT+ImMsTY4NVNt8+8SP5frhZx9LCj4NJp0qg8z8O91jxwsNPzQEfow
         IV563MbSNeK29Bp2jRTNjceAnN6U6Z0MNNAcbVhONVvud8HqQgrk2IPxKaooWv07p+hD
         f3dT5cj1CLXCCFuxbwueD6mpaoa7Gs2tnwpyIXSve+vsxHN/ZyqkJfnzZaQ6E5kCdPUp
         1fWg==
X-Forwarded-Encrypted: i=1; AFNElJ8O5LdNTxFbXBB/KvubPU3QoRGgDiTCKtY5ZqK+T5rxwih7tTmWo9XhyrjfjE7jF3uG2aocRdzbaH/n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9kfJpobKehusmYk+sGoFQH6P5d9/B4Yg6ApDQED3pF+leUr1o
	MQSfCe0CM7Tn0CAnii+ttMCLt7lWP+gbRjyw3ZTtAIGove2LOsxqN+nt47n4xGZrtYy4EwyGpWO
	Zn+UMgps6TB7xRC6O+Cl+KZrgK2fDy4wa5WQ3/poIKIwBZAdL25Xnwcdl7jGhuT/X
X-Gm-Gg: Acq92OGQvunGs6t6Exn+hG1OUsoFZsn8sjPouWjgEkj14B/VQDjqjb9U4wT+FI1z94Q
	rBvnFBLNUzJ+p4nBpGeZgihVt9kXhLgH4sderlX7gJArGZ9MacBNZwexili/FYhzBK10YbVU5Rv
	Z+IN3kmE10XvqenI3O7MTL9IyxJfl7PlvikKjltpOLRQqPb75H1yNcczFnuGiXzW1znh/GFwBSZ
	q/ID3ItfEtKQnQwEatHe7Wx8uFZ0BvAPsWjDmsScnGkO+WcTVgFvGLB7ZwvZ9vPThsy4aiFkHXo
	FzhQg0RimpnzlzJCLdWNguDvEL9HObv3L+kPsiRGI1VQuxTvZYhh2fRFt/h91CsTtoSH/5/dB0h
	h/MlcGBV3cRoG5OJv6iAEfb5N59iW2ig0eGio
X-Received: by 2002:a17:90b:2b4e:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-36a67719220mr12526938a91.7.1779652232909;
        Sun, 24 May 2026 12:50:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4e:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-36a67719220mr12526916a91.7.1779652232445;
        Sun, 24 May 2026 12:50:32 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:16 +0530
Subject: [PATCH 12/16] arm64: dts: qcom: shikra-iqs: Enable CDSP, LPAICP
 and MPSS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-12-f51a9838dbaa@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=1018;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3Lftxp5wY6kDco3NZNja7NALjN725ANWhNeWOYYhkAM=;
 b=VrlMrPDl3C+ezrF9VyKFMopuk63KiuZBmykDz1gHiy8/Xii3Syr0n/6ETHr3lm44J6ffV2Mk2
 Vpstd7HuwODCUZdQlaTB1cwRi31DZ6GYbrvzsJUoaEw/5kjiysAkIkL
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX8wN7f49/Vdyj
 kgyHCSivCM9w5t2VZoVTkAse8LbBoCc1Ne3Uo4BmsPuc7mC7y+EuTwL/ZFX9lWiYn4VVonYQ4Vz
 0f+lqnfjW2wVUKUCW6MLXrXAyBkS7pMGRWc6qC/Y7nzK7yq+y5RvKcjBnwtDFP72f7tqr1AaVCl
 wdP9PWe6vXuj1B6uEa6AgazBEZ+TNis2lBc+Pm49LBlbZ0yLy5NBbP6G21UKsERpLHeirtcZz3K
 RrXyOt/VvbkHPOnykBwwGvQ2jF4U9XdkHo3YPvdCmWBpYBADAsd/LixgXWOIfQTpKPsDkacOwDR
 WSv5QYIdIySRf8qNliq2yp+W2dHfnyOFCU0mLXqz55Pj68Chf593IV1zz3uP99md+B74MdJne6P
 bTUq+7Yh9vaMUP+9tcXdSr8XqXOaP0rF1hSTEoX3EQW1GzCvwMBGCvbpBB57Z9kGDU/nbNxa7Wi
 irZxwE04kCWh+W+/nww==
X-Proofpoint-ORIG-GUID: t8NCbelrw5Rv1Ca1p2cCggEjm57YzFo3
X-Authority-Analysis: v=2.4 cv=UdBhjqSN c=1 sm=1 tr=0 ts=6a135689 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=O3QOSsIWTsd9q-9u8mAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: t8NCbelrw5Rv1Ca1p2cCggEjm57YzFo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

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

