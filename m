Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731A33B8BCF
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029790; cv=none; b=uMwEYPwi/07u3YUuSjUj+kp1Ktud8gYDykGYRaUvA8vo0ZqWMCbPyHy6p9I/wJi6PInPoWDFww+hEuZLsdOVrlwK1oVvAiedMTABugzs3NK0jzLNdeiADFMmJkvwRzCCRUsKaNVvW5wYLAMbwQvsydjxAJMzTP8SfmfeGPOONt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029790; c=relaxed/simple;
	bh=lNe1bvt9AaKEtsTb46bKIiggo4KRYc6vxGn3z7RFrYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUY2Uwz8dcZJD+BobUAAXCKz0ID6TvHy0o3WTyFsTTGZVaiO0owQvltN42g+8V5o93+XbzYkEfUDKn2Pf2srNyyw+C2C503H5y7DmWU0lEfFGraoApVmQcPMs8g3sQlCGjR84V4pXvFOYpFizH8fEkldXZPQdxgMFbn2vMle3jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiIqfyFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b2aZUU0J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiIqfyFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b2aZUU0J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1xfU82730107
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhnS8LPW3BVBUeMEL7hDRQW2qshtCkWnNEHKcWrAxiU=; b=ZiIqfyFDRSlTqFSn
	AXNlqcnSZp8emJnCGbZpYJhuzAoMwa5Xs5c2INEYYfVJ6damWomZuWTVJybFtUul
	jbEwBCmPTjYomkjYw6nJ4odlTPFksRRAduB7pP36exFyCEcMX714+8c1BlAzNtdK
	k3HEDFSyPd+j2h6w6nPcy2xZ0HpkrYvXi8z0k0GomSiWqsTqJ9jGk+eFKWHt3S3o
	q/z/XHiUQ3IOH1iH4lDQ8/9WsP0irGy1CZ69pjtdZ0wIyy4yY0+AIRNP3+VxKUQi
	ExPzttkfpP1J0rgFgSg7iKBTvX6/HpoUQP0l55itFByzGjC1RPa/fHbBBKZsX2ev
	XRTF/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gy532ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so47646551cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029784; x=1779634584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhnS8LPW3BVBUeMEL7hDRQW2qshtCkWnNEHKcWrAxiU=;
        b=b2aZUU0JU23zWON9n3cB7kyR75Vj7BUJXYUYKCgaiN9BcYd/QYda18DQ4k459PGGSS
         kwhUo15lA2JgroQ/EDN76isrvZRmvxDxuaZr36Fy1NIgyHaA6HA6/7rYNFU6rgKXlBNs
         AGtgU1GzcEUUt67P3Zls5kEc3Aw8MGr/1b+XR2T1wFpgPBdxnGH3XhezStd90Ac9asOM
         8orvWjLhe9oDqFhRWQDeZ3QKbpZEykFJBjW9yirnhLKtNHsZoEOMEhU32s0d5Pq216rg
         3xt65qIzrID1H5AMnv5RsdD9tNdqvlBNMCFzdDYEGd1z9YZVgHIi4ibcJHn3Te4ao3c1
         wTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029784; x=1779634584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhnS8LPW3BVBUeMEL7hDRQW2qshtCkWnNEHKcWrAxiU=;
        b=TaTNS2O9KFYayWKxU4caOYsWH3FsobpnMo6OvmriI3AvmHvbQVAz1KYemO7EwEN01g
         ZDtMhR25K7jY7ceeHcbVPeF5qoKBmKVG4RyQa6mE1GV6M/qhzJFE4yViaNL0ZJfDUbVE
         XtONNtMX5JIqkp/d1TKnEC/Shm4usoTGAzOq514S3yCbWxVu3ttxdE9ZEbiXBYnZTNSY
         WRYm2JVwqcUh8FBwD5tbr3gt2hzYlwvpatBwU8WM/ThUZjQ/WS7Cd7pRZqGQHcJP3gcE
         HObMVARMpEJe3f4Z4vPP7w9dKCKkiEcESwLRSV0BfchdNKnjx4o15qTWZ9TKjk3FElgi
         SLVg==
X-Forwarded-Encrypted: i=1; AFNElJ+WBKdipbzAIjrEFFYzsFpu/9hlToYwcZogx61P1NnIuMkO2gRwlNBShjDPTsG4ANB8jZ2yEzOBBDlj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9JU4RJ752uG1UsIez+4wmbVdRTCig56M0BW9HMBF90xo1YGhQ
	0XnKSzNRLBEENDyMt6Su6wimLwjpexBpAR1tiB/KzR1FnPJO+ofJH1Er74E1PiDgQTqi11Qp7CY
	wOoB3teTUGeXr+wGa08OvAUewaY/2C0YSR9iMAH+xEADY8PrttECKokShOvdO4H4k
X-Gm-Gg: Acq92OEKb/mHWpgrirSp6d0FTFGfIDKglnE1fgveBhbpTXzO8ZNy20aku7E4SKzS1jk
	zF19nvlvpO0essH0eHqZa8LRI2jtar4oLoTVkXo1pJc848C4n/fY/reooqI5YbewclSUy+x325D
	Ik5yuwBhptxRywZI6igTv5Zr5TOdvvscchByRmaG5WNv+cpN2XZF12zofmohY1bebyfcUruh+Rr
	50rRkfRsQ0pETV3CK9OteBiFDbnoWDfo8/gvI2euvGsR4DrcraUEYoBJddH7RjSQFiDWpKbvZZ9
	B9ezD/HAfnaoVbRBFpEXCnu6yo4kR8831VuOfVMYIw+bkDNeXpQ5IpvjEk05snQBxklidait1pi
	pdYJ7rMeanXnLvY9pI1FSHlCeR8vIBZHyxC5Ec3IkeLxtynQSyGd/35XZKsCXefKcnR+MtxGx7J
	5L7Xw0VjTwt6IYFoMW61nlPbP5oPqy9Yo17FY=
X-Received: by 2002:ac8:5a04:0:b0:50f:e0c0:9d92 with SMTP id d75a77b69052e-5165a26bab0mr156598811cf.54.1779029784284;
        Sun, 17 May 2026 07:56:24 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:50f:e0c0:9d92 with SMTP id d75a77b69052e-5165a26bab0mr156598521cf.54.1779029783859;
        Sun, 17 May 2026 07:56:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:10 +0300
Subject: [PATCH 4/7] arm64: dts: qcom: sm8550: consolidate IPA properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-4-3c3764c1b4a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lNe1bvt9AaKEtsTb46bKIiggo4KRYc6vxGn3z7RFrYQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcNVZYxAMG6xsjp+yq4Z1BAi7k9Do+EvKZLU
 Fg7GiVr8vuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1dTdB/4vzmJ2m0iDHTkxN8YY2zaR/BOYcp4rkXhqF9dzbvpErLbg1tcTR0rP/Z2i+rr4kzGfFAg
 x1v7pYOVsqeN9E9comShYpR3V73sG3/Eth0z7aZW3vcNU0+oOUVqKpPHKKVXsxcxpfh+ltNAuTW
 gUGjyIB4BeCRhFEKO+9SONmqPt+24UxqOycF0S8WvQd+cUtu+SeSa6uEk23xifvwD+KWLstdjwP
 xO5fOEXwWuqKYsXwVb3+B37pMiJhiWWZGTQCWN9j8mOmObILBailwqRwm4hRp9yacJwphA4bc/T
 E+7GupUILKRb5mWRENd7n9j35xrxi0a93yeIGM6h+qg4bwGj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wusb99fv c=1 sm=1 tr=0 ts=6a09d718 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=oHYOqaEBOIRX3F0Q_xUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 5RfWe3fxQiL2hhBAD4QzL2GvjXzlQF6V
X-Proofpoint-ORIG-GUID: 5RfWe3fxQiL2hhBAD4QzL2GvjXzlQF6V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfX2Pd31sFKhZQe
 pFF7M+weraITdHeC2hQdttYsD2X4muopNsfndjTW9Vl2VMbazuzzHi8Rn2txTfy8hcGAisw6kxU
 HFtnECXxTUd08+DIL7yQV86pOAQc8g7NNwRsZPWAv5ril/dLUCCqB3UM82vLvfPL09mp3Gii7Up
 JI3J+P+Xoo2AEmfAidLbwT7gdwSlL8D89AOceEc/TJmUuJikx5yMrnes4ludcMAuy2NPCvKkgoU
 wmq+dz6RINHf2jd984qem+WW74WdmBAz4gfDZybvWg/NpBJG+/DN/+eNF8Dq6JOJ5Ydv4JTXbhI
 /ezMfpcpKMiwCWv8ClrR5KQ7ehH6P0Ti13Ks3eEPWfi18ewEqaSZRxcojxYckod0eGuJaH8CgWS
 1OfrpoS/gcef3iZKVHk5rCWmt0+Z+83JQ1rwnd4pekNL11byVKWqEACwbC5LA0gy6n3YyxxyRss
 RFqUeh+GYt/4hijqaxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170160

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 3 +--
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 3 +--
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 3 +++
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..06d4adc98060 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -939,9 +939,8 @@ &i2c_master_hub_0 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..a680ae649b79 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -818,9 +818,8 @@ fsa4480_sbu_mux: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index b7a7c49db077..e6a1038b497f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3075,6 +3075,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";

-- 
2.47.3

