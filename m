Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD07C32A3D7
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017923; cv=none; b=FHQbxM5OaobS4ZQ86wSxRIEsUXEwpTjVHv3rFt6SGSupsebeW0BbXIE2QvY33+jhcu2mgyHv7IfpkEYvwcpxHtTesD2/W616QDC8o3NIkBCaZ+i0BwpI3FoaENceNt+/yNTt4KK9nwvBwwflrma2mRSeQzH81oGJDjr3rSLB1qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017923; c=relaxed/simple;
	bh=GuozTu4iKelbzrX4UB0Wz5NEYvlygReZmrmon6DC3Eo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q6Cbu1LEBFyCTA4hQmuSmr1E6vOTRsZ89jfopzJGfi5Nl/v3LSYAnCx20twg7Vrc686ubT6GRe+FctrGmS0fBr6vSCWr2Lp4cW8xvkHckbpPLAj8++jwSjk8LikXquA/oVMo58a7kxVmpnaXmh2A4zB68p+1xKeUYaXmGRnRzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cl/CBsuA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ge1JLyDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cl/CBsuA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ge1JLyDY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3G9V645097
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hzzoxlnxHfkJrok1DuaQwZg5yncgWl7H7sn
	GUfRF8+M=; b=cl/CBsuAufkrZ5fdC2RhXlUVq655BYBSycb0laGnKg5EZAeZZ3O
	pGU2ArI9LuOxWO3MQflk6wq5e6qqFgJjCfMBKECV7KX4dALTY94uSG553OnwWwAZ
	C3X/QHTfEkj7s4d54V2FP+WL2QAxM8Q3rNz9iDC2xGXnU1LQt5zQBnmCLTgJ0Oii
	o7ui80Dyk9VbZ92FT9Plb2oAh9aLBHTOUq3HiOKx8Jlrg+kjL8lSCO3e8WccFBdh
	OIF7ounQ6YN2lSNDebFYc99WHhjf3/wJVoKOPIFtR/bbtvqZ6TiJnSE3PWGWmOkK
	1PpL8zoNG1n4Hze1tAStMPk1YK9D3tWZDSA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb3f68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:45:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8478e603285so1145606b3a.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017920; x=1783622720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzzoxlnxHfkJrok1DuaQwZg5yncgWl7H7snGUfRF8+M=;
        b=Ge1JLyDYh2wNbwsA7A3SKLDUzcxrqRA8woBg0sepHNAa3drz+NUgrWG8rRbUwGhyIr
         XKWFxEkTqpof3OktgVLbNZ2wN75ucAQP1DBF3MJSODdW1XItkQHekSPgx79MIZykrtEv
         GaWMan6FJkcQ6vCjVLnGJ+1YPw3Jfss+seb96Pgkjwq5Bz7vBz2Jxkbk7hmpbGL4HjQU
         Xqkmmut9xMMZoS90txGs4Cb44BAaujt+SXgPryyvVMgAgmksvhrreSM0rKfKHVk7zJtr
         jCJJsWs/B4S1a6oTqQve+vRBQmWivik+DW/sG0SIjsTM3LsUUZDt0vIK9SonxGYy7Cu0
         STtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017920; x=1783622720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzzoxlnxHfkJrok1DuaQwZg5yncgWl7H7snGUfRF8+M=;
        b=DEdQF37NWZTxjKLp7rhdpRq9qXIpXYufcespbpA4aXBQ56HR/fKSJ+70SHzuJkcnQm
         DglrgdfaPdXTE2v28/FlAugZNo5/N6t0yc5FKmoCLKKnHhEfhSPoq/tsMFFojuHzWzZ/
         UQbwqJe58AVSa8mDTHPEylQf/pY/8RDEKBt5QjRnmDP63j3tdKs2DtL2uDQwpF/oXIbk
         RrU21hT1nrubXOr8DvsyKCk/r0KTT6D0YI98znfye+5ZY/GCkN7Jq49cDl/IX7yArPGL
         tIoe/afcMUf2mPUdHonaLQT8fCU9p+8w6FIGSJOt+giXXJYKrabLE1a3jnjjEm+IIOVn
         d4NA==
X-Forwarded-Encrypted: i=1; AHgh+RoFCClPR+l1odKwYl1FS9q8tU0kxfMmfN3pn038hQ9HdXgDblPIAlUSNtYlzRb8QXRCQEtZ8OOvOOol@vger.kernel.org
X-Gm-Message-State: AOJu0YxRv6UM0ulND7MnbAFtV0Ek8zfaulV59gsHGj6KjYAGoOFI1dp6
	jwbs8LzEbFCPc5NTAkeGE/8JMBmB1jtM7cOxt0zaBpuUttvXNooMUXMwbDiHQNXSlEeVg9ekI7f
	k3HWKBHk6S6vbRzWsNpRBCUWoirsnr6sDwKb2gq7NorLthR7z2DRvX3Cr2biomAn/
X-Gm-Gg: AfdE7cn2FY1WEKyc3OcKFM1QO0Kbe1jj6qV4Z3gnuMk743IXd/4VIdSoJH+x3gb7rm+
	TWp/oZqmiZHHteECtJog0Bo/Rg0rkSuytrYMyIfYbvYP8R2OLCA6Fh9pE8jCK+0b1k6bKVvW/YE
	/+LHQIxvyw1D8qnbOMttKKrE5Hf7Q+Kxm23oNdr4IDIKT63GRNmH5JT0GablO3GAZACcjZVazNp
	bo4SrV8rixjGNz1b4tvLpWujfo4M/XjOMOpUNxO3eE/5aayGsTI14l8Hw+BMU34JIK/yZlF9g5o
	iC1zSxW5FOAyx6qQH6rfWVKFmgu/8AEUhLO99rupITkvbe87H3jP3SIk9gR/Frf59b7QhSmAIDj
	Cyq5qDZXjb6sVlSZKLpUsNeOhWBdbSTLxM7aKlIIaI79GygTvocGK1GVBNd8HG8duCBogxlIn7R
	Fv5Seg
X-Received: by 2002:a05:6a00:3c90:b0:847:87d7:ac64 with SMTP id d2e1a72fcca58-847e18bb2abmr878078b3a.23.1783017919748;
        Thu, 02 Jul 2026 11:45:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c90:b0:847:87d7:ac64 with SMTP id d2e1a72fcca58-847e18bb2abmr878042b3a.23.1783017919293;
        Thu, 02 Jul 2026 11:45:19 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dba0asm1745547b3a.7.2026.07.02.11.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:45:18 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sm8750: Add wakeup-source property to usb controller
Date: Fri,  3 Jul 2026 00:15:11 +0530
Message-Id: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZCDQHuBXUvp39tZbv2B7CEKlEhPjXdWT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfXwIq+/h+3Z9Lv
 posYiBIEJB/CCmYK6KcKAnngzIxYwYZ9eX5VR2IQ422UhPTvOrH9v2cPFkhpu9YF1RhbUFjt+aG
 1CtncwrMw0Eanu8qPmMkKtarF+IQujU=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a46b1c0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=U7BYSfXuTy1Osme1jwwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NyBTYWx0ZWRfX0yCWB9dvSqa1
 P3M9QvpH0QNg5Q1RVd9u9stUsT0q1zARn5eW530iWb+Nrsaxa1NJpZ6SLgB6WKqKT0WfX83RtPn
 9ck2H3ziJyyhce1E8ZSCKIuAgX360ENNRVwT0XxYjVWtdcxYtMau2p4LZFMH0+AERHJiCtivoHB
 Lig1jxrHdMQRr9ueVzaYAaQL4FFSsTDq3IYkMhd0Iky7ORqmPZUKpBEJcpAcsxMoPACbrO4V8Ar
 8Znfi9vA3rErdGXk087IkoWUvus7u2ztkgE3XhJAEwLYsMPxg3wFiAx6cmuHINAPoeQpapp/QDf
 Ct3UZSw6nEPAi6mzcYCFfAOvjTjGaibnoMfD0Gqxp+agqMCAScHv9xkKwDZCN6Pc4UdcF9yt7cw
 3yoXA+vUgMTaGLkG6uD0TufrrNfE+cLoTMDvd3NQslNQXMLUXqFnaJy/IHG8O98tga9iUzI9Kbe
 gm4P8LzMlfqxBwrhD1w==
X-Proofpoint-ORIG-GUID: ZCDQHuBXUvp39tZbv2B7CEKlEhPjXdWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020197

USB controller on SM8750 can be configured as a wakeup capable device.
Add wakeup-source property indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..88a7c9ac05ef 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2893,6 +2893,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			dma-coherent;
 			usb-role-switch;
+			wakeup-source;
 
 			status = "disabled";
 
-- 
2.34.1

