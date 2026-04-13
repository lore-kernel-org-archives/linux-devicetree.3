Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0013AF644
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071251; cv=none; b=sbSkajrdIVTisOcJJqAvvS+7A57gE+8qksTSSeu/RQOat+g1OaVU6CmRDTbQrySORN/Hjr5w5ddnSoEiKwJAFZ7ib3NdEaMbbKI0fdHy9MusLFA5TYDa7SZ83mOVt0sjHuI4QGQNJUWKnAO5hc+FnVq2eOZ1XXvime8N0Mo/sqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071251; c=relaxed/simple;
	bh=b1tENQvXY+F8W/xm3g4+DZZXahca+UgV07xvDpCrdHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zf480GpPuf9LPNt+m2N6nIGEIjy7ZWvGRgQjIq6VT0V0zTe3JUTqwl93ALvxT8vKExdoz913Nahh51DZyznQoag5qW/1ATF8u7MSqul5RDuSp1L9qcvJFM4Y10G5Vh0Qam9bl8AwULVNzZN9z0SvV0U81qW6cadMrJoF4nduB9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9KXiMLD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E31H4kFO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9KXiMLD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E31H4kFO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D755dI557577
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P
	+f8uMLn8=; b=G9KXiMLD3IsO13FTdHHxr3afEcV3tesQP4+fGLFzwnK79WLH9TJ
	z6d0QgIjp2YiUG9vjG0v2mS17+o1toCL2c9Yy2iWZ75RG78lPOQ+/PdvjKxdqeib
	uAwHmBmPbaAhs9N76sZmVJMWmvALWHvgLIzrKquunVScEC//lIrWlk0qveE7zLpI
	XPPB3ILykMeMEP/BD+Ju4Tkk9sBJt1CuPslXvz6RWzTu5gwvrHQSXmm4ThJqIFvZ
	W2Xit5OEKWxt0lUgAodvPSXPszPQwST3DIpDiQD2Sw5k/eTIBMlRyA6PUXgfZ/+c
	60ha2IjnkZfABmIZrfVPc1dpTaod7ruEu5Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhvj07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:07:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d84b5f73bso44999461cf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071249; x=1776676049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P+f8uMLn8=;
        b=E31H4kFOnrWI8O02JLY0dntjWQS2LJ9bE7XbV+dTNW8SChjHf7FQBzJJhvjQ1qZhGr
         DgQdb/HcWELx6+M48kY7Qopn5oJWi3NnjCenrOk3PKEVlHfyGgfm66/2LETthDXhpbP1
         KAo2/WXuS3uNZQ/YvpSnFDoMKd8FbJOAO0NA7bM06VO+ZE9nZ/jer4yL/Gde6nIfzwVj
         WeYIWGOCPgzrvlMLL0VBH+6P7ZN6bLosQS8oG/cHX2xDxd2NoUTU+s73evqTemmWNFP3
         vqiHuZJc4EnlqU5wvUzb7BQlSpedLrRVjNlzsrszQ57DLn4TF19GxCwK4lDSql05kPc4
         2vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071249; x=1776676049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS4CAqLyyN3vhcD+LdVe9Ic1o3rAepHQ07P+f8uMLn8=;
        b=N9hluGkw3N67SKFWN4ddN11Cf6sPF6pdJvqN/AbHwjnXPvDj7XmsljKF8HiDMek6e5
         RpVHWQBaCAskn5ckKxgOcImjJeKVqJvQqpW4m4MykQ5NoxIQj1GBrsgeADIlemJ2Gaoo
         uj6L7B7KF1EGebSv05DJWuySTS+vIgr3YMDJVeb8GWH2jgU5S33PSQEcKAL4pn8rttLf
         suie6/LjmmTmlZb68tkapj9O1rhpNxNxKL7VtTr8zCQ2vljhGeWTtH3wfNgqMRj8tBtZ
         iQsU89R3v8rFDL2cVLIIH+MSM4JerpNWWr7uWtvNJTdNHgHwZPVrGLJyukInjvGeEfZ7
         yhQQ==
X-Forwarded-Encrypted: i=1; AFNElJ89YULSnBhPAG5jPvPpFi8e8cKWmG8yvpUdqatM5d1Rbx/S79wvlMH81suyjd/UShgnZNeXv/vsHeKE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj79WRIA85+NgJ65LEjn/8oK8uxRNY0N4W+q/H9x+XhLLd0oGU
	/NRRt0QeCsEeaB/LCnIeapmo3FeXNnys5rJVEHFIB9lwGKJyh0tgWzGNpvg365afKX/IFDkPUk/
	HWC1ZoCcnnSBV8cZzXz+4ZqjzmgqlQ3dPLrzJrHi3d20qa7gus0rbdnv6fPFZqFEw
X-Gm-Gg: AeBDiesjqX3ACN0I7NgfUhtnGKPI8wErxYldb21sHv+HzT7ki5vjsWksEw5+BagLuLV
	Ja7nFXYNXLRCbeGc/T4LbnUoUFwEeRPoGbmGy549ccuOvFP79TNj1/SXbPOde7ognuBO/hoYlF+
	qtyh4Xw6h35ND6MxFtlAjxwTopY36t/jyBin12wcCj8XottVo1WmsuekX6Z+3/lPLo/oxrcAkvJ
	g3GsPzYggry34/g0fPbk4Ubv68DMuMrgB8qUvagDsoG3D4iqrk9Quah0amO6xXCZZoLmLkaZ6cn
	kKyY9ZsX+Ti1MEVAfMM+tjTwdV9qK4GC9bDSNtiV3SZc6NyfgrqouheZmdiZ4Gg7FrmRcxh1UOX
	FXoOTbZCDTa6LzwxhEBlDn5nLjUP/pwPzusnX
X-Received: by 2002:ac8:5944:0:b0:509:211e:3624 with SMTP id d75a77b69052e-50dd5b15e8amr185842631cf.4.1776071248768;
        Mon, 13 Apr 2026 02:07:28 -0700 (PDT)
X-Received: by 2002:ac8:5944:0:b0:509:211e:3624 with SMTP id d75a77b69052e-50dd5b15e8amr185842301cf.4.1776071248352;
        Mon, 13 Apr 2026 02:07:28 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c98fsm30759347f8f.35.2026.04.13.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:07:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Xu Yang <xu.yang_2@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8ulp-evk: Correct Type-C int GPIO flags
Date: Mon, 13 Apr 2026 11:07:24 +0200
Message-ID: <20260413090723.53277-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=b1tENQvXY+F8W/xm3g4+DZZXahca+UgV07xvDpCrdHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3LJLy1g4Z3wLsTX9TEjDy5k3oRMGgxKGR72pO
 vd4nUJlFOaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyySwAKCRDBN2bmhouD
 11ufD/9ZfBbErQA0qwmvgVga1ZWnncoEdQfgPmQ5Atvcd8AjusNJNHwI3JxEtW4603nVn215Wat
 sFBZ5kd/GbFG/fQy6AIBQjANCQKaCd7Iv54odcNpyoW3SDFeTDDImTfP8TNQZE/acMLO+yxVrdJ
 mppQKhxN9bUvlN0tvBA1xLoF1unBTLUONg5gRj9LA0N8TKaghrtY5sesJrLaqAj0INi2PurPF4Y
 Py7Czn7wu2B9CMUUN+UUnKVsh38kguO3FAgWrVZ0m0bah3VlXQQEbbbpsmvp1/BA7ioMZp4VY51
 yg7rYiMy0cdhO/52ohzD3odmMaTCYMLeH9vxogDPUAf0HsDLnyNQDZm8EMe9lOFQhdQdj136rIf
 b2YZQYEtt4QBjPUNOS2KucLApABH8lbbEC+jecObhc9vGanpi7oXlJQi/2bIOEauFyxCYEvSWGK
 LNgfXXMMO0dsnQyouIR3LZJLEZ13StW/7GWs1+lsuoQDpdQeJm69e0Bly/VJyRoX5KiRK04Pc4t
 UnA4SyICpw1YXR/7a+jFA1O7wWgvufkIBSrLEmYBzrAviVxEIVQuFmSHvHAmP9OLjlIAR/+j8cl
 zRFc7DV99va+L8jJZWfncZ8tkznxc6FCjf74hhFRensYTBrFHQS9d6N3JOD5kOkZredA3CkyFgA pPZvVLJdACruOkw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfXxo5ay+BwWVug
 ACOFmzQNSxNtYeW/qUWr1rx0ugDKfjrk6Nur74FZjbkC2TNF7fwTaBOXrd6gYI1/8M3w2H68CKM
 eUntHkBp2OuHVth5gC9ETn3rrCku5T9q7FQxKdtPOZzVTTFm7wfINp5wkNr3ehASEaMVn/h8zmA
 dfALn0iyDPeoAXkwfPzXCc8k7YT+z68qB2JbFs9tD6+puKgHzVtFrbj2VWe+nMsSr3jIei8eXIH
 1nqQ85QrgplGdj1GEBTp35c6SporjoL8eERZ1tiRHMkhp/M2UGezo+FUKtEy+LH2Yb06RbjGE+l
 qN2RWsfuSYQBc0Lyu5LiMs7z5dnWCQPHTckDOU4s5bQk1tee4MqaQp/je3NZsTANrrcVxZVJeKA
 v/uIX3eABV59xESuM3cZHEuJtYSbj+tcadGNlotqB9m3ixyW5SS2zJ0pWfI3LsMuSk8M8dGpQ7C
 iGpZw3+9PvlnnQLVvlg==
X-Proofpoint-ORIG-GUID: 7gh1U_nnoL30nPIl-VoZdAVGR7kwY6FN
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dcb251 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7SNBkYlbXATC84MHoTAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 7gh1U_nnoL30nPIl-VoZdAVGR7kwY6FN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088

IRQ_TYPE_xxx flags are not correct in the context of GPIO flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: IRQ_TYPE_EDGE_FALLING = 2 = GPIO_SINGLE_ENDED.

Correct the Type-C int-gpios to use proper flags, assuming the author of
the code wanted similar logical behavior:

  IRQ_TYPE_EDGE_FALLING => GPIO_ACTIVE_LOW

Fixes: c4b4593ecb0b ("arm64: dts: imx8ulp-evk: enable usb nodes and add ptn5150 nodes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..5dea66c1e7aa 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -166,7 +166,7 @@ &lpi2c7 {
 	ptn5150_1: typec@1d {
 		compatible = "nxp,ptn5150";
 		reg = <0x1d>;
-		int-gpios = <&gpiof 3 IRQ_TYPE_EDGE_FALLING>;
+		int-gpios = <&gpiof 3 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_typec1>;
 		status = "disabled";
@@ -182,7 +182,7 @@ pcal6408: gpio@21 {
 	ptn5150_2: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
-		int-gpios = <&gpiof 5 IRQ_TYPE_EDGE_FALLING>;
+		int-gpios = <&gpiof 5 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_typec2>;
 		status = "disabled";
-- 
2.51.0

