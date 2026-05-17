Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4973242A4
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029797; cv=none; b=jkcCfMUJQSGC/g9kh0EXLTKvjHpcHjKFMqxtxKx9uo/VSRgLpNW6wEQYJflWXpyaE9+DwGajYsgt9fNuyI+DnKtnn1ln8cPUrMz7LTF0ZYKl7xRMDrAy+ti6xc7vQ+HsKWRoxSsBTugostAwhqDWkdE89Pwok6LfvoEVgY27tNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029797; c=relaxed/simple;
	bh=BUo1f5Hs20+LqYYQn9CEw3PFB5xz2jMfHCuyfRgmlzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tJP4dUhzbzw818VtJHMtn2/mSz4CecIXhu4etBkQ1rEbvhKJ7EE9MBYUBajOr75otrMeVtmvPrAWaSuKeSQL9r2D7b2vz7kMM2mXwYVwnL7YtFCAXWH9b+yw8Bx7iy3PwWQNj+VAt0JqzSve5fl3a6IjLt4cSuBuzmabUQ4TXKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RY9DlthW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5vlL4zW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RY9DlthW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5vlL4zW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5Tht63835038
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	79jeazY97yejuQSnm2hDKJfC8lQNW47dhRITiA6LWcs=; b=RY9DlthWAYnYdAlN
	e4fLRbi7PSyHhc/5a2FckWO5HNUJrjUEJV1VsDzIUwLh/3OhHTNMbhKaoE08hmnv
	SkyhuWjz0wDrK7xRa/BtBbyhMKk8dmMiCgpEWRB0GW1Roi1il2x8LKnMaQijsjz3
	CQS3JV009I7TTzqsl4Nv5k90Q0bJ2keNfagyNI+5MgD4F2Fi4eQ2zYAPy786mYJV
	0D0fqzDuHNBeAJ7Z+MDUFsglpZ5ndDRVfpGE4e/iKjbvs+eMp9V5wzlmbZYDO8yr
	fCP6FyI72Yrgo5Pr/xKMxdiravoF5eFgZwiDtpqbPbY6Xn9cEjz+6IGIG+VfOSfJ
	VjyqCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcaysb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-913fcc4c164so98385285a.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029793; x=1779634593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79jeazY97yejuQSnm2hDKJfC8lQNW47dhRITiA6LWcs=;
        b=U5vlL4zWctjgNwy/EX3dlwLNqy2Iru3WNyjUAEswAPlceqPP9c0geBimsAyxme+tW4
         0ZuV+iWkXoqvB2ABmruqdsUlvoa0k++7CMVIv94rUtonxzBijvWD3F9ihtJt0dNbFZh+
         53Gh+6tp+0skNkYPSStHKZhauQOfsrqsFsj6S+Y1GiHp9/gRtkAMtPDCYvoLTZF6l8HG
         yEmDL+94OiMtm+rnhT57CB7Hz62355Ge+UROAsxrPmdptIUra1lDYwOQogahqtnMlTSo
         Pg1cM7E8Tf2bC3dg26iFGOlF9YVGhHyX84BO/cxoLdY8pNsSmhMmATLA0HbCRVuU/hCa
         zH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029793; x=1779634593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79jeazY97yejuQSnm2hDKJfC8lQNW47dhRITiA6LWcs=;
        b=UJn714M9Dune0jF3f0FJTEvoqc7HK0t4XimeKDc7ReHu50T3riCP8BjDok/4dFEbAV
         8pOk4y7d2KP8Ws0tzTCFgiMiMhigbo7aE5XVABRLLmDRcIUclZEFWY1MsXgtkTseNjv3
         D8/TiJQiQViuK8pHiRPoab3CY94vCd3zDuua/GVFnK9ho+sUm0GuqDGKSxXsxs+1jK3x
         jWjclXGzJYSguP/xH8R06xr71rKmbn/DpXcR4Ufa+oHUnbmfscC8wPfESZqweI7dft0q
         RN0Rso3JazvEFu8LwPi7OgkrfFaang2M2/bOI230Jj/OGLI7YQhm46wC63PtPrM0N0js
         V5RA==
X-Forwarded-Encrypted: i=1; AFNElJ/jSZSVC488PlugimIR9uEl7s0Gz2vqRHtiS+EzfBVwkJPdCCpMIqVrjbKfnDyMSJ+u7Gu1JmlbV6op@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hmtkQHEbtgMupYy/Yn48vNzsgwstW79pvxwNaenEIgNDeBaz
	++lTyrM7F/Zrzr39KI5BRhDFLhA3AvXPP97aSL6t7twfjVWplqL937BxiIhHS1vualPdSV/GYF8
	inPMVtmqMpb0f+gpHWPau/vBtPeGMFlaM2Gl2aZAeKj9SziHLepP1NUeHrL126Sx3
X-Gm-Gg: Acq92OGZbOgwFVzQbXVavD4gEzalU0BimGQIA/SdpPj1Ba9B+7oNpSM4YrZA+bhbJ6K
	qJaExEvdPbFdhF9jxN/vz3qyVKhmCNnSYnAdHph9l5tIu7vnNX7wK8AtBA4W7BbiSGV8OuwHeZb
	DTRLfWYsk78MjsHucm8tKq72spLEP5Yob//rUo/f3jnfw5HWbrwvqtW7LH63LnSUfkHCI4ctOqD
	JDNqCVwUkh/nMQRSQ29HvfP/uL0SwUL1TjAZagfxdavbsZGPtQPwOkNw5mOPpNyz5UuPxWfE8oV
	PP/hOrzOo1Q5yLkXc9gEwNMLmBjppdkpLnicZPY0kOzf2V2dqkss3NPZsOgmBSI7rdkYMZnr9WA
	8HyEjj4kt4CVk7o292cB6c+2I7fqSLnsrrQZlZKx+cM+/UAqGQsLZD5TQBY7i3ZuoBCEDlX1Kc0
	9eUJ9cr1lAS64tyyx3ywcFGXkOkmpmzREQiDY=
X-Received: by 2002:a05:620a:4713:b0:910:5c81:7cb3 with SMTP id af79cd13be357-911ce81230cmr1856711785a.31.1779029793169;
        Sun, 17 May 2026 07:56:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4713:b0:910:5c81:7cb3 with SMTP id af79cd13be357-911ce81230cmr1856707485a.31.1779029792561;
        Sun, 17 May 2026 07:56:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:13 +0300
Subject: [PATCH 7/7] ARM: dts: qcom: sdx55: consolidate IPA properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BUo1f5Hs20+LqYYQn9CEw3PFB5xz2jMfHCuyfRgmlzA=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGoJ1w3IBUjgC3WTwLRuVU0f7wJW+hTB33sG07MKcQPE09jG8
 IkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqCdcNAAoJEIs8ij4CKSjVttoIAJPX
 2c7C9J6du2QyqO+hNh1b0PiF4FVpujh6tsOCfh5Xxe+ovuTF+pGUQvpwGy1rc7rz9QfQj7qlSDC
 NiBIYAx0qJk7RKXolhw5ZObodhtEE1LTx+7hIo9qWGkJJEMh8p9MZwWJRkTgg0teVgJz60syEx9
 MMzev4buOtfq+RUTTspXs4U6KzZCDdfV1hQh6JctyAX1P/FZyxuqLo55kCwkCmLiMzRJZy8qjZa
 QUYWcSQAQdwk87xd3g5hqsaC8gTT1nLkpuBSpyzpppvqBpRBdFywYfaMkNzwxy8ENpkbohzYiKv
 GhZzwrsnNqXU44zFrm+MVaCBfnuMIEmzgi857vE=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a09d722 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8sTZkXN-kXGHD58140cA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfXzxInygv8nRXZ
 AMnTV7oQBVhTZ/P8vKRGbfysRyObfHMcQjghijZhs+9Sw3LXZsUZi5kIcCIPh1nfZ1ed19I+N3X
 MaGuWEC7aS81NQd0ptnnq8oGY48W4y2LiE9GSJ1/iDBLdW4zud2PqW0eAkbEjvR7Vc8VbjCH2jq
 RIt4ezGXylsYOGJlVKGqpbDNoCkQObu5RdMBr22sZDhY5lf9eqGo3zxKnpvQHyD0tNQgjG5unB9
 wx1r5lpr/IqEac7PdjSiBCRTyNGuH40EkzySCyahOX2kuukBed+LXidfYTZZaFczk9di+DVsP9L
 Zpd4S0E7OgO0AlTxDjuWQorUfgHEgs0qsh/k8AQ6TnuQI0WB19Y2GMRiZh+NKj19S4O954xgh5F
 8GITddxpnB38Yg7hE76HSQMi1TXeQrGWP37mj1/5jiVethPG1/A+KtH9xm8V2pHYE3ntSiD81BO
 i22sW41DRqfj+bDy+9Q==
X-Proofpoint-GUID: iMNNXtNdgblKAaSts27tADVx_yFSEdeC
X-Proofpoint-ORIG-GUID: iMNNXtNdgblKAaSts27tADVx_yFSEdeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170160

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts             | 2 --
 arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts | 2 --
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi                | 3 +++
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
index 082f7ed1a01f..d23b8ec08af4 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts
@@ -237,8 +237,6 @@ &blsp1_uart3 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
index e336a15b45c4..1e80ddad591e 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55-telit-fn980-tlb.dts
@@ -237,8 +237,6 @@ &blsp1_uart3 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index 05b79281df57..e9982c46bc2f 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -510,6 +510,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			status = "disabled";
 		};
 

-- 
2.47.3

