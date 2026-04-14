Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA73DC4C6
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166608; cv=none; b=kAohSXdpT9GmgJUob10VnhnXM3omammeHTr19cSRUmm0vTq+Jfrtj54bS7ChZhs3VXKTi0do8AByoEMh99RnXw5jKt3U+857zZdWVPbmy6VXF3lFc9hOM0k9Y/FWQ5SK05z77g55uVRqHTpzHEmeCz5ib6fZBRETg00lOujWlqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166608; c=relaxed/simple;
	bh=qr+4pMOOEjMj7xuwFJ1R8650kimAyAYP41ufVwJgTPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glGyxXbuquroyI10fM360svw4ye7tRjeTCyapTt4MlFCPmzuoa4TefB3wsKo1lFyvK7Fujm0FCbILzE1wGk2cfW/kGlNiByiHHIbRsxxJwQ5ADnbQ5UvcIg+BvlLhzLJ976uZFafIQRygWcXkvTqyARyYTDbg+nBrvp6g9awIek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0UgF9Nv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRdrgGBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0UgF9Nv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRdrgGBE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E71VJY967321
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aAjcSYs9GluFDwE1SWfEVF6TighDfcmtzjsPlxp40xY=; b=U0UgF9Nv1DMO44p9
	/kHAUpet5w+IeSvhNjv8ApzF76IwaDibVm1O5j9yEFVaKh+ijav5f97dR9VNAAqC
	Xy4g6jSucZLNLRKZXtxoqbCRsDHoYutE/x5TQEEVZZ4P6z81BogX0h5kP5b3fA04
	0FsfmsBMD2r0ffuxnc3RnocmgWbT7W1sdYVV49UKYj/Yet6UHWTZoxHd5dL6+F3h
	Poq2axMbkFo9z2+WGT/pgrgjR49cXufuC3M0xITuzD0VAJRZNzSS0PnjnGcgd3qw
	0U2cykop30YDYI+iAM9G6NImVdSHQxrsm54mcPdhLy54U1BM3d0Dg1OQ/Lx2IegV
	Z9jeIg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v2emy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 11:36:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so3725235a91.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 04:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166605; x=1776771405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAjcSYs9GluFDwE1SWfEVF6TighDfcmtzjsPlxp40xY=;
        b=LRdrgGBEqGEJDqFGkKnbmEZ68R/fRmqEaEcfA7e2p810RpvPWgB9qLic8JQIE/mytE
         zGQ4JYuMJ6MRc5ycqQ8fE7+5wUVXlmxyMaPKxFRXIjq20JPQjylhUB+Rs2I0ugAo0ku4
         O/CVCB++91sZ0MFg7xbrKdOLLuLDrBJNFUzjNjDyE03bLbJ9nLQArdlBYZPtygXP0l7t
         i3FmMQSI153QPsveY2LeEU6C/4nlBb1TtnrUWc9r0BiD2ajL5o9QwKoGemxi07M9QiPU
         MZEvzG3ocDp0AziM2eLcRA6P98bfPuzxhM7Y4J24e1ow/KWJN+cFCQUX3GEK0TMNO6H/
         wVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166605; x=1776771405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aAjcSYs9GluFDwE1SWfEVF6TighDfcmtzjsPlxp40xY=;
        b=Zjm9Bhye9MfBzKNspaFXUZOcezCllBqRzPZSS2HkfH7nszy6VmAf09ab7/NiGX1s14
         okSCrLWzJ51QyphfPBlRoltBd02MAy+DI8Dm9FxSg0LPVlSsOb1VClPw5w1GUdbxuLhK
         V5TGETzPUPDga9j3FrAjB3DUn4FMlw36pcsW34JihzVbE7mD5AHWFSj4sKcEn113KRZy
         wMKF6BXyDsOrF4a2wN5jPks9WEyzKFNp0NH9vKq61RLVkab5tCs4IYH8Jk/lFanF81kn
         255SBI7/cbSzOFp1oZ+ZnOeL9iMg3j7jnJl+WSq3I6fbRrtOzBwANqWl+aS11hN09UYx
         8QBA==
X-Forwarded-Encrypted: i=1; AFNElJ/gLnPF0e2WYl1rheYJsDm9rOA158nGT+W/0ljfAdOWGLUZn8X3U8uCSD8qNelIcBJNxprLvP3jIRBF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/SxDBKTtHq9q1KYLAT/YAhxobl29xkpU66DBnW8L8bLzAm3U
	nTCvRweI8i5dwyTzhhJzGY28sVjhbq1nQOwqm+nPw7z+uiMBf11hj4f45XHIodltDvNzc0Bd+3A
	0dPrXNdNtYuQf6X5UYDOBtUEPzMYvk38u4Y3lKxkBn67s3KwvydBBr3sPS9VcT9mF
X-Gm-Gg: AeBDietTy4iPRAZA9o+Wk0UBmAYAL/Xv872/Hx7tYJre6520+8As7m9Xsz980BGT4Qq
	vlYW71yUrXQjFJ/kdvQnGBEQrXKmB++f2SuDaF+a5hZUEsGOBZIXR07r+b27SfA0uIA5J2+LRGy
	H8rww3utQlUPl3dNFyD3n0Lt+ZBlAru5ydeNGbZVWT3bFqnz4j8fYRXJ2X8DXWhf6B0vwGfUCZV
	BjoASHvFi0Qiv1/ZS8ojlKlV8MC2UkXxWGmOwRNUva3ER3BYsup7MZH5B1Cgz2oBV9d0SOom9BT
	KKZ9M8vjJKzpzIvHE4ZR167UiBBYqYS6uUI9Qu6ADmP6Vu3tW7LqEtmh0xDOlRAWFy1CEjZgVjE
	MbiQrvTurpDfFvp6Ke3YtaqjiaQyaPuy4WtiEoM0y2zM6IADSpxoHqidS3nCar/s7UJAlgGboVZ
	WzUSI/Ajeh
X-Received: by 2002:a17:90a:d408:b0:35e:594a:5b6b with SMTP id 98e67ed59e1d1-35e594a62afmr9126598a91.24.1776166605187;
        Tue, 14 Apr 2026 04:36:45 -0700 (PDT)
X-Received: by 2002:a17:90a:d408:b0:35e:594a:5b6b with SMTP id 98e67ed59e1d1-35e594a62afmr9126579a91.24.1776166604705;
        Tue, 14 Apr 2026 04:36:44 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:44 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:03 +0800
Subject: [PATCH v2 5/7] arm64: dts: qcom: kaanapali: Add label properties
 to CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-5-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166580; l=6845;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=qr+4pMOOEjMj7xuwFJ1R8650kimAyAYP41ufVwJgTPE=;
 b=1t3KqLt4YO+WcL2yBZP+kZ1PWccvLYQ1qqyqiesUjWbLvqKmOwNfDHV1esnCc5us8GEBz+gwi
 eEt4sOEbZQeAnEcogxrjXAhH6Y2qxFTqtI+Yv/sfXupC0cYotvvjSPS
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX4HCmy9+uQy3f
 xNaaOgegVNaHco7AfJKu94anq8H/nzajqx2xQzq/aGF5znnsI9I7AYd3xY35MmbGp7A13EJO2Gg
 EUmlW3xvDvMqPBuyF4sMIkaLFiSZKDv8notce8sE7751hERgOkd6lIY4zYHy3RYRTaZdWt18Mzo
 QbD9p8BPb046MoZZEknt1OROC82+1Cs/04of4BUCPbjThcdJyUS+4OGxZSKvCf+ac1zi5/WfRYh
 yY5zvoG0rVVg6l1BHjSFcPyCHObot8UMGp7krptl2wlSRby54IXTBTROQzEY2uRZR2SfgtHcCWp
 5yUDVh5kPC5RsxJfdWhVEwNmn9+GcIUE38Tikp9mrjzcypZuplmucyX8QCoW3jD5iXnqnVApmUR
 VQaVXyv8c3cnY/eUZ37YIyryDwq8ci5KdlKqWAawLh7cgcf6emxA/ywfH+Zc3uML4DUkeAWwN9k
 l7TSp0q++o4Sps6a9PQ==
X-Proofpoint-ORIG-GUID: 8IV0d30FZIqnSKEIG5meREoVTx8DgzSO
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69de26ce cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=WU9evY1EbhuMgdOVQN0A:9 a=V7Z-W9-LB9nPp9hi:21
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 8IV0d30FZIqnSKEIG5meREoVTx8DgzSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140106

Add label properties to TPDM nodes in the kaanapali device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..0d5714ddef9d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4201,6 +4201,7 @@ tpdm@10003000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 
@@ -4256,6 +4257,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 
@@ -4319,6 +4321,7 @@ tpdm@11000000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_modem_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4407,6 +4410,7 @@ tpdm@1102c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4425,6 +4429,7 @@ tpdm@11180000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4444,6 +4449,7 @@ tpdm@11183000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_cmsr1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,cmb-element-bits = <32>;
@@ -4463,6 +4469,7 @@ tpdm@11184000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_cmsr2";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,cmb-element-bits = <32>;
@@ -4482,6 +4489,7 @@ tpdm@11185000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm1";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -4500,6 +4508,7 @@ tpdm@11186000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp_dpm2";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -4619,6 +4628,7 @@ tpdm@111a3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pmu";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4637,6 +4647,7 @@ tpdm@111a4000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qrng";
 
 			out-ports {
 				port {
@@ -4653,6 +4664,7 @@ tpdm@111a5000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlmm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4671,6 +4683,7 @@ tpdm@111a6000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_north_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4689,6 +4702,7 @@ tpdm@111a7000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4707,6 +4721,7 @@ tpdm@111a8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cx";
 
 			out-ports {
 				port {
@@ -4723,6 +4738,7 @@ tpdm@111a9000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxa";
 
 			out-ports {
 				port {
@@ -4739,6 +4755,7 @@ tpdm@111aa000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_mxc";
 
 			out-ports {
 				port {
@@ -4755,6 +4772,7 @@ tpdm@111ab000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb0";
 
 			out-ports {
 				port {
@@ -4771,6 +4789,7 @@ tpdm@111ac000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb1";
 
 			out-ports {
 				port {
@@ -4787,6 +4806,7 @@ tpdm@111ad000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb2";
 
 			out-ports {
 				port {
@@ -4803,6 +4823,7 @@ tpdm@111ae000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb3";
 
 			out-ports {
 				port {
@@ -4819,6 +4840,7 @@ tpdm@111af000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc_cmb4";
 
 			out-ports {
 				port {
@@ -4835,6 +4857,7 @@ tpdm@111b3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pcie_rscc";
 
 			out-ports {
 				port {
@@ -5024,6 +5047,7 @@ tpdm@111d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			out-ports {
 				port {
@@ -5040,6 +5064,7 @@ tpdm@11303000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_4";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5181,6 +5206,7 @@ tpdm@11309000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5199,6 +5225,7 @@ tpdm@1130a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5217,6 +5244,7 @@ tpdm@1130b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5235,6 +5263,7 @@ tpdm@1130c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 
@@ -5253,6 +5282,7 @@ tpdm@1130d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -5272,6 +5302,7 @@ tpdm@11422000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipa";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -6958,6 +6989,7 @@ timer {
 
 	tpdm-cdsp-llm {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6971,6 +7003,7 @@ tpdm_cdsp_llm_out: endpoint {
 
 	tpdm-cdsp-llm2 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm2";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6984,6 +7017,7 @@ tpdm_cdsp_llm2_out: endpoint {
 
 	tpdm-modem1 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_1";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6997,6 +7031,7 @@ tpdm_modem1_out: endpoint {
 
 	tpdm-modem2 {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_modem_2";
 		qcom,cmb-element-bits = <64>;
 
 		out-ports {

-- 
2.34.1

