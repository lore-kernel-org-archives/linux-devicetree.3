Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03938F954
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029783; cv=none; b=M/xC5Kt7WgeBQqRQDG3Q9SdNhm+lyFmGoEQV4b0EIdeBRX01RGBl11zUcO3j4B0GR5NbVLJ4yiE3H7IV0tNCi6GodCn3/3sraOtZ664IWoyO+PoH1zJC2CYw7EZEp87FLZMNKmckjHxrYtkUCuGjZDtFAwoxL8pZgAhJpAUhGjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029783; c=relaxed/simple;
	bh=jjAIzuTBWj3EOyOz+zkSGV2fGsKmUzVqbAMHbZ41s1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N8f/DfZz8sSkkrzOIA4bYCqHky7Xdd7Eznnl+HF6Ujy6qJJez8sYj3Ezdl0aKHGxx+bu6+CAqxvrF69xonD/kTfJZ8hvRYL9/rW9/fxqOGsVaR8+ARt3rEbZoZkO+CLAJMoVjo+KeKo4UsbUUbcdcjlUPAtZy/4ApHCRaqPSEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZ5I25Je; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsVkpBoL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZ5I25Je";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsVkpBoL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H9DXWa2077474
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSSwY8yp//EBI53P5ryiQ+nr5VJlPABaxN9+h10gwe8=; b=EZ5I25JehHR4yPnY
	rJ3Yu4ick6bvW+fmPNZhzYG1/TQ2p0pH3B11M0Q8y+lrCmTZohpv9kNYF0YAPzIX
	hWwyVP1PKeBWjqGLeFglXs9nauL+u57CbnrflEIMgZAfIfxWOGyfcXU2Q5MD/Nx8
	Y/ZP09CL3/mcGhOREAaLg6qQD0AoreT2zplBdEPn+gNbeGiwK/m2PtAcQ9zqVcFb
	E4f1cA6krE/Kuh5JPARSoTHqL4/8JAO+aPMPH3rg7VgWO65CLIS3zRzXEMfdYtsM
	MRL+dSllsoZ6P9Yb5/UpPoZAxhNHOwDp0jMZemirqqDsKFXVptce0ZFgdEUQ2hzx
	xKtv/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7txq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 14:56:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so47645481cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029778; x=1779634578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSSwY8yp//EBI53P5ryiQ+nr5VJlPABaxN9+h10gwe8=;
        b=LsVkpBoLK4R6utervkH5krEMy1yIozDUVmM5elBVCjLvIRL+rNuH3P07LMWgr2u7Pb
         fzq5YEkKBhTdKrQAvy2e/jVrofMGxIteWy+sRN/ZN7hob1IZUAEn8iqdMaNXzcNbbUA7
         fkschDGJwh13JANuOrB5d8wsvQkwXb3hhAHFs7cf8Tv3KNPdMxcUQAa0LH/yw5WXkX6x
         UpgXXwlBYrps/8XNW77BjWGWLCiLa71hs7jaglu7GopD82rRtXundonYPWRtAPOBHjlj
         JZoimatUX10nAe9SwH5TgFZqWnayqtsXHg2g5N0iHAjUTB8m0Cj/dPNTGkGNYdbzDg7H
         YScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029778; x=1779634578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mSSwY8yp//EBI53P5ryiQ+nr5VJlPABaxN9+h10gwe8=;
        b=SMeFRZMNXUp3Cedzjj/iIcewQsHJcT64aGhBKjDKayKdX8J9kdcvg6/+SuRtl4H3RQ
         7h7WifpPoCFP2p1t83j/M91UyEjGQ5TYwJogn1yS46lsnkhIMUMhxLDq+7m/wBPo3Gqm
         X4wcczOQqh+Ul31JnS++oi53F8LgRoxVpY1Plo2iU2t8B7dplFbOOo5TmWKWBE7CbDE9
         UGV/mdL7VMfN5ObflUPJH/bWUwz1aoMVFzXUpV1eprOWCgeBC9diyf1WoKF74be0h2ua
         b/2UTecsrwXIvuA6L618ZegOnS63Wf2dYd82KugIZ/J+Z7uQiGcy+byJEeATras+3o+3
         Ib2g==
X-Forwarded-Encrypted: i=1; AFNElJ/3cJzojUOpkXbx/Llk3Whh4Y/UMcy/Xi57vRebz7R2rHUc4RoSbRsnXV2im349jCMkZ6NDMAsN5Aye@vger.kernel.org
X-Gm-Message-State: AOJu0YyBBN80tBDdSsZTBY79a3ZCTqNPwOjSdOiKp9OslFylKo8+IKd0
	xMutfI5PO3Qj40SDvrvVXYTdsC2G3eaGW1B+i1lR3mkRKMhV0Wi4Vt7ChAP+fHLw/0wM3cslHcS
	r/1IRANsH7Z622qorMNTRCu0FhSASw3XA10TiQgDuiLTdwAwqJElcz+urnoSjIm4F
X-Gm-Gg: Acq92OErLnowJuPWuGC7zHIJ7I+4FxM9ijqQP3EwqzzSHhYXJLcrJz1BsUuzbvlO5I9
	mSmHyR5e9d3yvY97uLH8HdkRtJqSjxDSTrqrEy0sLlzvAuMvizKZl89z00aRYGbjUKyIcIuSWmH
	zG/gsEYFBa0E2+3mofz/UJo5kb70lHUi9XjhsWlLrZchT7j53VKCK98wFb1qTpNgxowouCY0YMm
	VVlEt5n2UHMnHaWpdUwUPXhjDZ1ZcZHYBywT4I0O+TAmI4o+jV/BJLxt+Kdk1HLd7rS8r89rcwT
	Ni7HVIqcR3AZezhTtchgGxv0m7FY0y9qeDfkfnJc4AYaVWwJh53l58aQ/nfi/GqXaNkzQTjmSLl
	tE2vxaJNH8m6ckSYmX6EitqAu0/Zssj1798wUet+6C3PkzlHupFzw5XDDANEiKof9+BbmuUCwsl
	66yg2y341mA252kB7zo+03dNuZvddUan8gJYs=
X-Received: by 2002:a05:622a:5910:b0:50e:5aed:caea with SMTP id d75a77b69052e-5165a01ff56mr160437611cf.14.1779029777639;
        Sun, 17 May 2026 07:56:17 -0700 (PDT)
X-Received: by 2002:a05:622a:5910:b0:50e:5aed:caea with SMTP id d75a77b69052e-5165a01ff56mr160437351cf.14.1779029777194;
        Sun, 17 May 2026 07:56:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:07 +0300
Subject: [PATCH 1/7] arm64: dts: qcom: sdm845: consolidate IPA properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-1-3c3764c1b4a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6123;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjAIzuTBWj3EOyOz+zkSGV2fGsKmUzVqbAMHbZ41s1o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcMQiE510ydpp4A9/H8fMSdFpP6DQ6NYePFO
 CKHgmQTv4eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDAAKCRCLPIo+Aiko
 1cFAB/9A7UgiV4A7spEtO/KHNa5i5tK7fXpXO4uk1Ntdg8BdfNEvcI3P9hSwrdhDF/tYJXV6Cmm
 0tD1P072OS1X4ywRjzz5gOkbH1kWXyL32gcIPzdNdPI3zIGB1pG/mTLHOLftnUHao20nAJZynLo
 7OMBU1DrdGiuNIgw8NR1iptMxRu2h+q8BnNO6WsQj4HHPba3nWZ4jH536RC3R8qJD3zonsi1SaY
 imRxUjRAWQVdsYzOLpQ+LJiojLAzehrB4h47bE47cm0XLpr+H/XKRWyHagMQnI7nhkUSYCMcZsx
 O4fs6pLu/MC1Fcf1HcwBVkunImCSvmFVq5OuluaZWgbbqywj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfX8BccA2zNQdao
 uAQMFNrcSZlp9hlCmDJoiXeVLo8yYsQSc7m5doUOE94qTVbdYK7rnTh88Wg7nXNA9YkFNlIHj6p
 QgH6DFCDvvxgo81/ho6gR6F5unFLvIHLmirxa6O1sKzusuQ18ihrl93lZb9mcjUqfUBGuWZpIaN
 FjsRBOQebCDfiA3Y1ys6+Sx0CS1oCitE8nROr29smINXDZ/NOs5EiJWJFHbbabo5WgzAvpWBXXs
 646jpIfV9+xVdbXMSHjbyJq28XgQ1FCJD3UT3EZU/daUR8UmAkJhLEFppCjgNajEvIDdAeQb0el
 4ER5FRnJJDYHyaIxCfIq/1D0heL08frUfoWkW+b74GCfsICQkOFb3RcdDesuSVZwyYxNiFCVcCk
 wWb3WlHQp/XwGhEWBUh/hR4EuhfkQp950ZLvBuZSkbMOcxHrXRZAx5RTqLDEWeJUefkQEcNkW9T
 RNqbr1dgEJFPyXWWJCQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a09d712 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=XiFT-Wcv0oYtBlDdk_UA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: s3S03OsFRFyxRM3tJqaVuoOs9NjpoeBX
X-Proofpoint-GUID: s3S03OsFRFyxRM3tJqaVuoOs9NjpoeBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170160

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi               | 3 ---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts                      | 2 --
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 2 --
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 2 --
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 2 --
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 --
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 2 --
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         | 3 +++
 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts   | 2 --
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts         | 2 --
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts             | 3 +--
 11 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index e0c3566761bf..5ac2e058827c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -472,9 +472,6 @@ &gpu {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
-
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 091568642faa..97c79b51ff42 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -428,8 +428,6 @@ &i2c10 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index a6c2519a418d..90136a9b7ea3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -551,8 +551,6 @@ rmi4_f12: rmi4-f12@12 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 0d915ecb0444..a404a23086d4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -913,8 +913,6 @@ &mss_pil {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/Samsung/starqltechn/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 14a683ee3823..590dd9352ee8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -493,8 +493,6 @@ audio-codec@34 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 9b7fdbca9e1c..7f0dda5204ce 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -285,8 +285,6 @@ &ibb {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/beryllium/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index a44d6e776c82..96d4f7496f2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -409,8 +409,6 @@ &ibb {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm845/Xiaomi/polaris/ipa_fws.mbn";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4ae8627d6dbc..13b85624c186 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2780,6 +2780,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
index f04865381870..e38b768d16a1 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
@@ -565,8 +565,6 @@ panel_in_edp: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm850/HUAWEI/AL09/ipa_fws.elf";
 
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index e41200839dbe..981074a40e38 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -584,8 +584,6 @@ ecsh: hid@5c {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm850/LENOVO/81JL/ipa_fws.elf";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
index a676d3ea01b9..1dab0582eae6 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
@@ -384,9 +384,8 @@ digitizer@9 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sdm850/samsung/w737/ipa_fws.elf";
+
 	status = "okay";
 };
 

-- 
2.47.3

