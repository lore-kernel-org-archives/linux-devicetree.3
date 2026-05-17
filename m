Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B3325490
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029783; cv=none; b=e1UhG4+cFq2mqGYcYwAXQL7vPH9ZI5Bdl2K+s3+ROLsYvvH1Cb94pHCgdNKWoQIU1Gxf+Z/smzbL469yLusEYhKE+JbSndy1RpwSf9DaQMel0cqodmAveLGSdue6Hff4UuQyQ631GpbmKGGhhwPu4ebLS6LmhqJlThqoClu9y7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029783; c=relaxed/simple;
	bh=1gMhEMpU1ZzUZiCqxL+XRjLDw7RJHcJPeYe+z0q0hoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rw/wil5xvSE91POxOYYmr1kiRzg0dFLSC+6jBpJYPqkWizFaHF7SMOfc2rUx8OayfX9NHbaIBfdPYESfgz6lSxcHQYcbTtN0qRQk0Cz1BO37gP/fHH44h1W1oOsnIGK51sYcQE0HnmRCFulLpHlI/8QewhCbjECekqH3lKP+Eq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MeQ0PMjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NApBtMWh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MeQ0PMjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NApBtMWh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H6r4Au2854913
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c+Qdf8Px6J1AO8okt9+jSlwhHC8Utlm+FWTg2cSh1JU=; b=MeQ0PMjWCjHDsAAd
	5oy+Gxq+S9bN2n8Cv0d0WTUyfgyHA2GfmiPtuyVgYCZEn4P4UwAVCJryP5rRlZ2q
	MeUKEFSsPtLZq5Vtgpob9gkUqun8GUIDuThLfVFGXl1ElRKJwOxM5fvT8LS6/aOS
	UrxeOUfbZR6vSogYeXkiq6i71WmWjjdzCTzFaeepv2pdqtsj2gw5lq0RtGmg2QFb
	oYcvD7Ax7xxtidJB4H+CfoRzQ+liPqmQzFsNTXcrRoW68qiZquHUqfh2jts4sx0e
	GKA3/YsGvyq3aSh0HMpJNhgKDDWmH0IRW8HnZi8utd8HB+R1rYPu8F13PIWgB0Db
	p78oyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw31a2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514cbe73d00so52257481cf.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029779; x=1779634579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+Qdf8Px6J1AO8okt9+jSlwhHC8Utlm+FWTg2cSh1JU=;
        b=NApBtMWhYLJCKBJjszskvNQUBpaAMEXnM/lWrgLw4YfBu/EQu4pRFVldAfFyQGiV2R
         63FTKrzl7JvPPYx/kkinwPspNkdNljVjzM3N+LfOO98F7k17PbF/+tN0WRgpAJAHuIz/
         z9ccrPidwNluNHnyZ25zS3W6NAuNRACA+tY2SXTrNzRNMV7rBP153/KTazdi4dzmSdld
         /025UtDOOSROd4cJ8ka1CQG9CIyOWKVFVszAGa2gBt7tnfl42IoVGte6FjjJ5R8djvLN
         LhG94SDtJiIkP2qLUve8P/6RMCmr/hLOjagIu4ds1SefzjNDk874QwfbVWlX1sZ+dBkE
         n1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029779; x=1779634579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c+Qdf8Px6J1AO8okt9+jSlwhHC8Utlm+FWTg2cSh1JU=;
        b=iyibdaMfMbi0o/T3Iad0SJKi3C274H9SDZXEh3noRd78h9+PtatRiYSlez5euarOek
         uw+T7LRRKPZbhzqCh0VFf/s9ldLagE1/cTHVvQy+m9kalgm32iq3cxHfvua2PApDPzSE
         QKwYk9mlmJG00FVm5E2ZHlym3fhy0Gaje9Dt0iqMDLoIE66l/RmH8I4LLuwDOLNEIXr7
         DunUjbwKtz9IhuprbTvA5R77UYydBonIZ2FGsWxRna6Zj9ENVSMFu7+dD4noJxXnnrJu
         d1NjJB2fDTRIzMXlOyAuql6J0xaFo2TZw088kGu9t0arkwa4jxeaiz2I8znUmxbxTo9x
         Qqog==
X-Forwarded-Encrypted: i=1; AFNElJ8RZ8ZYcQmUvbROGftv0eGfA4787GLtNyNZyns0ebXhO6rl/g+QVepGWDRB9sSP5UZygENUq5alZax5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzus8CQwJ0qs0i/5Q+uuyCQIifdGZwXWLoYaALdu3n6lX39x+bz
	qxJrsu24Us3DyNHZP/jfQoWnlYBBsw324PSTfCVpK1P8/ZosJBicWEXUt9lzsUA43kK7hSxCnc1
	HQxa5uhiXUsa1llCfbgfWobVLVS6pxUx8oLwHYaPGpnbUHQu3zxmoRzFb7tgAl4kF
X-Gm-Gg: Acq92OFnjZbHqwEsiIngA/OjpOpo3OUga3KMUjPM69HpwaQIH9UU0VuPdbiJKNuJC1l
	eFKo43JGDiFvuYNCArBo3RUlqYxEsXO+v6NTt03iXqLt125fjDccsuN7DEILgZl8gH4nuSDcWDx
	NGsH+7kqiBKKXhTyxV+xPIGVvPpVZKbkPL9GjqPYSOLr3JBLoEoEsqT0H603oOuITmaGYWhURrI
	kULNSkKlL4mVO8U6nGbZcMo6s00U0Sg6Lwnza4p8jPp5dXmlwkHRll602mArCP3NRMdsQUjsTcR
	IBHybIdR1lCTgvC9w6cWn9pVdJ+Vrz4UMw04rbasT818kvFXdGA9AEAnSt/7NNUtrAWUmpu50Oo
	CKQGCXLiQnNzbULWKa7xC5uLGI41tD+GoIKG97C/8VEOwB/5zUFAAFHRMp3+1VimU2TvVGK/r0C
	QsLwJZ7pg0e5a5htKr77/LCGJLh+Y7CS2fkeA=
X-Received: by 2002:a05:622a:4886:b0:50d:a987:89b2 with SMTP id d75a77b69052e-5165a0df3f9mr162160421cf.31.1779029779286;
        Sun, 17 May 2026 07:56:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4886:b0:50d:a987:89b2 with SMTP id d75a77b69052e-5165a0df3f9mr162160211cf.31.1779029778875;
        Sun, 17 May 2026 07:56:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:08 +0300
Subject: [PATCH 2/7] arm64: dts: qcom: sm6350: consolidate IPA properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-2-3c3764c1b4a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1gMhEMpU1ZzUZiCqxL+XRjLDw7RJHcJPeYe+z0q0hoQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcN6F5eGbMPnIKD+PuR/CWSPz1HG+5QrgjKF
 tDCY+hJZ4GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1YvHB/9KuXhtwivjypd6J6c/yKcNLT0Jsmma6nbR2cXtwPj+Z4WtK4wN2LncFM/l7rIeNJ6KMhC
 U0NdK2Nt3dbIRg+cy2ySunFpcBvmHzaOWQ+bWt9Nd8vaDRDHaoAbN3FPIz9SuFvffyIiphNW/u+
 8F0bB/EZKsDepYslfIh+BinvtVZnpvGZrBb4mimWS2WHZVeYrw2eac9dvPTzicrsln3bJKTDfTZ
 8Dd2sPe5B6vG2/o3p2QTQknIEK/OKjps8VKKxtlaIsS3FSMnNDUqWaKP4CuEVKMVYtlac2t0DML
 j9T8mVfxvTRQkcy2ji/Q9yMHIWAeLTxtOzGEQ0fBUSHT6dam
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MSBTYWx0ZWRfX83YnroOLy5wc
 4sdMaA/a4Mg5VtQoA1DZgN1NnuaiW7p3vSYpJiqYVoVu0qnOgpDW05pTNJZJ8ArW9Y1YPaGx4dI
 ZAHm/kuSD7wQdgpAFGC7YI2LBBR1dvtbo2hekONIsndcZLv8Cb+K2UQI7q92UV2RXubrj1vPHO0
 DbTeNbUkQXPCCjopbKNuNsKUZi8155Hqa18vnW2XaJhcsZzbdIBgDXg89NwQPyrmIOLyvH/Fgp9
 UmVBAhMMm0CXNr0V8pVw7m+icK5wvqmO60wS1pgSh0EFEH6MrbcIL/I0x+fkdqAcO5J9o0HFJCl
 8EI0/ol6CJO1F65wa6lsNTB8s0cy/lV6fix76t9ilAaGWWf13ygFIBH1eE50UXQLdphhjCqSEAt
 P3TGv0IOmXehgR3LBkYjuUafwtzWexCKj3IbVMrLlv4ookUHk6aXYKZpak+fIOgHTTnlwaLrIOt
 ftfCNP19XpYd0QFjnow==
X-Proofpoint-GUID: flT40RExhSJipxJX3Zq0zOIVSAWiqI5r
X-Proofpoint-ORIG-GUID: flT40RExhSJipxJX3Zq0zOIVSAWiqI5r
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a09d713 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=7cce5ovKcg5WMCfKyUgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170161

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi              | 3 +++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d6adf68563cb..5d2c1d4977b4 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1307,6 +1307,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&pil_ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 3964aae47fd4..086840f04fd1 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -711,9 +711,8 @@ vreg_l7p: ldo7 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&pil_ipa_fw_mem>;
 	firmware-name = "qcom/sm7225/fairphone4/ipa_fws.mbn";
+
 	status = "okay";
 };
 

-- 
2.47.3

