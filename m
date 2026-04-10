Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844A317715
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790575; cv=none; b=GYaWExbU4QL1DFQWZIggZ5xKsYPn7XkJy0XqiwjAHW9m/Cv6pl2oz9fgOPommqmug3hMKu9jfDJMeEcasqfH/6qCrybHs71Aux9WUFkawpAcQpw9k0IumsEIifWZnPGr++tSe1K7TxDRrgDtQ3FOaqUJL28319VlWXWQvHBAua8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790575; c=relaxed/simple;
	bh=XMWO73Zot8bioBj1vtYtNgXBcxafZXLSmfZRqOOw4to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksPtOSKd4yxwMR9Xd1RT8OkD2/pBRHZql6wTIudNErOpB5oNJta3ms4MzqQG7XESBREnr6cUEq7If2k4D9NhyQ+GyzBR0tiR4FuBGT/A8+nVRozqz+3vkhy8icIxY5+jV7gv/CZ/0DTAKT1KL7FsBHOCCg8GH4eK7NbnjwLFQGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOBY/ZxH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPz0bjXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOBY/ZxH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPz0bjXD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Kh1Rr1729917
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhaPy8hUFxkAAthFXlrA+ivrwCq5DM7Rh5QVygs4MqQ=; b=FOBY/ZxHBA3Ue9vB
	D2S8Zpa7dDbDcK3fjhMFsgsyWPIjXtwBVj0rPY/NEfDK7MLceFKLFKQoGCp8yne7
	6fYTFvQVkyHmFIHOVeSwKqlzrnJ6ALdVRUpAfinQ2mR8hpUijwqIROuXg8dFS053
	ceWmKRVH9LXa5hNv3arRn+fqMW35ctfPW3LI9lKAVZsqA7S9B65uSfMVyPL/wT2O
	t53WkjJPc57C9jw36jQ2SKn4qTDyUpKzDewXsyIhzQ/+qAV0P4Gl6C87+PVIoZ5+
	Et+9icnnt3XNevmv0ARvIWo9ejHVe9Z98ceGLnL3TOeTDzuikTprrrnIBZHK6TI+
	3m3ttg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxjfjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:09:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so762257a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790572; x=1776395372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhaPy8hUFxkAAthFXlrA+ivrwCq5DM7Rh5QVygs4MqQ=;
        b=dPz0bjXDUK5EmptjzBLiFtTesBQAyIgSbM8dYBRjxj4DUNqyB0brURODz7ctEH3Wr0
         CC2qIgFBABw5FKH1WL2Kn84xUKLs7scoSllBwUNDs1z31xoKhKJxYpy1fEFqetZ57JSX
         isuANCaOhkfx42G10gMcbmog5ybM2gjL3Ae7rleKwSF4KrxAHvwPW+HZQfpLfVYfuWFY
         0qPAKBjcbkvly/PM2Mx90v+OGZXG4mrBSWRhUKy187XgBp0JU+xinbs001L9oajF2Tuv
         QfLlghzvwPc1E2n2BsvZS6+0pmuH7h4eYOkSKc5DVaepE6ZdnQcjLfPeG7GwgYFQG6kN
         +INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790572; x=1776395372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhaPy8hUFxkAAthFXlrA+ivrwCq5DM7Rh5QVygs4MqQ=;
        b=NjW19dcb4Kd6R1MHpk6xt8joZs8fhLbpqsX3k7nKPMMtSw6dCPjmLW34/MR4GQaDe7
         tc5n9gN6jYiTFgXTeJKs6xMqYs9npo9DDRfuS6hUuUTB8brwX/Q6PfZLpFMU3ySlvXVi
         qXxImnuGSFlsT+S+wIdqP+jTRnQct+hLutGwHzRzGFuJeKlQHCjeRvcufK+I/X1ZLCRr
         9r5wjGQ5+xLUisDmhoUSKpLcdDxPlpReNwNFaQw/Y+qA2q/ab+96rAlJ7lEJL6Loqdts
         4SSKRWWXrBEaXG1bFJSQe4Jh9sH1S1sFoaobsTyWIbRaookx8Uem2iwahNU6DPaIp+VW
         krpw==
X-Forwarded-Encrypted: i=1; AJvYcCWlEuJI5UmNdba4wrWY+rPinYzxv/8B9hpILNM4UcslRGMnEwx1rP2n6Uwma0wlPcfkvbkdBUu4IyFn@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0GYL/QZkSiZg8r4UT2o8yNLImt/uoMpmOueaLM2+bn5we/As
	bZJvC9S+iKWhh3RqRvMvsY1X5OtRHO5hL4JRSdV0dKrr/OvDRRCwVN1KiF4oVIIgEkLFeTnPPoH
	qDSh9NovstKgwXFGQq8U5r+t0BF8hD+sp1JR3CgPmMQUFCsDDrI12RoTbhu0XfeHx
X-Gm-Gg: AeBDieukPE1wyUFrit7GkKSGzI1zQ1G3sWKqKcWYcbZch+V11OQ+v1IM9EuX+SKZPYh
	PJIdjwiwkLEMbqfM0CDJzrmOg7VWxn2twbkg1K/AIDMhFAmlSSPkI1OlbGWwpLC23Frp5KDdMoD
	G3UKOKNbGoXZgdadgXtYiq6WQHSWSmpLjLPI6CxyXgNEUbxRgcC1bwQTrwIqtj0nawP6timA1j/
	Atr9PxV4r3qTzJS+WTuQ2aZvQgxZ9C1Uh5EmRw6ZORgVl88hccFP9KxBBZLL3uoRPiM19DFyvzQ
	btJ/4NSA+Vpv9ycs7Js6EXJTvM955UozaeFdNQH3OBWhy1SYXygyaLflsRXfO9+WlYDzDSR/bcv
	79pYU7NsHbvtJnVVQo0VDuSUhtHp9EV52r4l/zG3GrSkkBefijJhxoE2wgN6G2mmAHULmGIhfku
	CuEST3gfLA
X-Received: by 2002:a05:6a20:918c:b0:39f:441:492f with SMTP id adf61e73a8af0-39fe440eb9bmr1217496637.1.1775790571700;
        Thu, 09 Apr 2026 20:09:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:918c:b0:39f:441:492f with SMTP id adf61e73a8af0-39fe440eb9bmr1217458637.1.1775790571168;
        Thu, 09 Apr 2026 20:09:31 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:30 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:47 +0800
Subject: [PATCH 4/7] arm64: dts: qcom: kodiak: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-4-d71a6759dbc2@oss.qualcomm.com>
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790553; l=2756;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XMWO73Zot8bioBj1vtYtNgXBcxafZXLSmfZRqOOw4to=;
 b=GTLSVG5nQ8wwWbHUc4ipSXz2ysgMMRSO5eLYdPyFmlqIBt9zHo6KTRFFzgnYmBdraoAUO+cyx
 1oqFY3mMZ9BBz5ToNx52zneM/JoXD0mIzSzyol9OGGJfesbN5TrQWWh
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: sbtwkNLz5m1udarEWfUuFYR8buaBjW0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX1VG5eaUmnrjy
 C5am27PVcjsfIc3k4/ZsGbLUXw3+VJyvE3ThiWXQsx3R37Xzfqz0sSCC/zdcdbNFLuCiFLkRLvh
 neQLHXra8xuPLid7y6EH6zMm7EbkS3bBaeRdKVlc1H2oqVxx5rLVNARK5E4AY2vC5ld6zGn7VLY
 ewLrkMe6ZA9T4xGpB3LitTVkykqo15HtWaFQicySNSpkEFc0uUxfauuda4S+6HTRvEEWzHPZc1W
 CDVdxUOoiBz9gz9ifR/ON4RSvJ27CztTLjoVX7b+fja9kMk5LLNL0iRzdlGKfArsjtj0qWqj4bs
 2cibtmx7P56uPG6wNvxYRM/M3CiMsUXQqf60qsqpjXkeiZytbmmmofJW6dvQ34KAL0HABN2MyTH
 2iSNNVZ12IHfOujeQGSKZsKH9JrSgP7Zw0IBd1+1emY9QdIx6QwTZXa8BqdgejWcuCytJpmDogk
 t2B69A4UzDOGsERzl/A==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d869ec cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Ft2vuo7JNPNZdQlk6TEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: sbtwkNLz5m1udarEWfUuFYR8buaBjW0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100026

Add label properties to TPDM and CTI nodes in the kodiak device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..3a2c28752e31 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3513,6 +3513,7 @@ tpdm@600f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3532,6 +3533,7 @@ cti@6010000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss";
 		};
 
 		funnel@6041000 {
@@ -3681,6 +3683,7 @@ cti@6b00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao";
 		};
 
 		cti@6b01000 {
@@ -3689,6 +3692,7 @@ cti@6b01000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_1";
 		};
 
 		cti@6b02000 {
@@ -3697,6 +3701,7 @@ cti@6b02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_2";
 		};
 
 		cti@6b03000 {
@@ -3705,6 +3710,7 @@ cti@6b03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_3";
 		};
 
 		funnel@6b04000 {
@@ -3859,6 +3865,7 @@ tpdm@6b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3878,6 +3885,7 @@ tpdm@6b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3897,6 +3905,7 @@ tpdm@6b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3916,6 +3925,7 @@ tpdm@6b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3935,6 +3945,7 @@ tpdm@6b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3954,6 +3965,7 @@ cti@6b11000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		etm@7040000 {

-- 
2.34.1

