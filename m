Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766C470114
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658658; cv=none; b=G7OvehxYHM4IguizvTcVo1GUB3FXSnVIJmzC0iOZ9rJ/wxcZKRSmaJfFkCME0iLFBOR/feY6Q/KkWEwkX6XPh7arnn1YqBu+xA7IPD93kPBzWAmn06nM9n+7+WnR9pAe53bpZkc9DMlNoQuj8406z1ibceWvDGv21yDObkfCoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658658; c=relaxed/simple;
	bh=7mS7lsEAHqFL7+IZtJeoFPHZbb0Bx/qkjaqa79ydQ1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYSusmh2XZWfxuWIr3gl4IXIfqmP9dAb8TisATvFJ76tjRe+l1TNE8BPo4fOMdxUGAinR/No/709ODTJX8YQ3dlaLfIwvn9Vi57K3TvKl7F9LUqJunaen8jI2b1Wdwj+Ptge9SEycsld9zvOuueJqQyEkR8Ax4mND14hpGCR3k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XibZ5Ilf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWKsLdU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XibZ5Ilf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWKsLdU+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRelw1927755
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=; b=XibZ5Ilf7EbsLcok
	0RLsYgWFwopUkXEGVi1uPEEiqPJSDsLkAUwH3NT5miq+y6KWOZj64Znwp5bsmWuY
	0D32ZSsarCq/9m+VxMoyGbsfGI7dmoedbbZ6AA/8689vBNLkJoBx+atc2Eaqa7sM
	lg38S1Ma9ledBrlJv0YsZEKTo9FsWvB5vqBM17oBzHnfLg64YtJ1m0ClF60jcSzc
	0kWOjBhX+UtHZpI1TeVqtZ4tGjr45GteqV+CduEslEbWF0vtKczRSsz1Ip4EPa55
	S80yZaNIlELpvBHrEFDeHRiVf8gVXryYgHkPVy3t3fyb5Q/JrRzeAmX/D4s9/vVG
	iJzFnA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fra5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:30:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso7556418a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784658655; x=1785263455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=;
        b=MWKsLdU+K/SWDCCrQIUynu+6RHKZUDRzNvgxZddH2X5jVaPt6zH4BuGJ7sV35MfsKX
         Lwr9Jif2fZrg01XTTb5Bc53bQyqerRuoEuKu+4K7df6Sk9ysX3I2erMv5eohnVEihFAZ
         HrjvHmheuZY3U9DuMkc9+9EyAVq8MnuQ5FxJ6QW0QMr1+rzEGgmJO5BODvDsdyVPsYxd
         31k5U314T5fYyTUcDRtgk50cPrbGvKyXfuSqtSFs8XiGgs/9l4amUCyHAojA1yy7OjXL
         e1CEzgVeWXUmdgEMJ7zo1kfLsHuLxq8zYE2/NDRKmSG3EYy9K5l1tuePmSE/XEOWJiZA
         7OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784658655; x=1785263455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWGNaK/DcWcKX/rPec68iOYxUG/FFNenWvTctE5gMGI=;
        b=o2abEsyimnwkHMEIkfFZ5+uqKzbqnBKzx+g9oJpv8xcXLsyH/spYaoeW/VtZ+FDFrW
         cvWm5/wV6iLYR/570MZT6uI1ePQEHC+1U/yT1MZ6MB/2gN1N02NOtBvuH+K0CK073iHt
         ld77uM5dkLYV+Gltb0Ze6UJJKK2E1BDyqTKNDHZhZrInCss18HkEnLiMtC0GcOJpd2Pl
         OS40/GFkHK/nTVy/DWRg5wFkUQHk2RRjqNG3V+0WvBYGYuEWlqxCdAyEEcRALA+TcyxV
         EeQnp+bLQrMthU1CEDZ6QasqUt4JRWIPi0HLJjLxU7s+fYlz6y20/Ie6hz4VdQWtavQ8
         R1Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqiOUWJWZbVFPunfOIa+tupD898r0UcbgNi+q4rg8psbQUSFg4U0oKl5oru6csFmtWiKxK2hiRUbuiB@vger.kernel.org
X-Gm-Message-State: AOJu0YxcacFYpUEI3htxpFeA2EXZT1hpac1ujRddH2Gr2dHyR/ieNRqL
	lUxsT4CIgdxHuy4PGqgwl92TD9n5mNYNHqMwwTnCX5Hl3h4pXj46s9kG4Qmc8WC5zxNTleAnIUy
	+i6o+Aop+sQI91UpKVFwWbYIIFrX9vh3GWzSDry+F6BxaSRAIrTwjtDcLvKeXEJBA
X-Gm-Gg: AR+sD11wUbFlkTg/062+8fBlzBwrqq18yPl9jyF6xBmL+V0JWDQrm28JqrcEskxy+6n
	+PHLDmJhXf0/kwmlOVlmrT3IXBrzrjlNU++ZOoVL+y699tgHV+qT1FQvKHoHDdnwyrZ9AspmhAl
	1wxklgWfOOg2/9GyvRxMFeCccSpsqmDzRrMLXDqmulkoqaJilpLX7Ei/y1jhwOunjkDyrdQOkOE
	uEqL1plGrk6Jn+2a5M4DJ7DS7VJIhXsnTxO2GJe51GsaFLlhLRn1Hm4kwuTGg7W3/Jsq/AzvUEC
	eZUPygZdLKTkvMJlfQVSwJY3JRH7rAiJQiSz1Omuqv5/4/se8CZcBa1Cfz+9JznHcXrpkKlUErl
	AhjcuCm1lT9V+OH43Yk5fUd7jJ8lYQJuNbZw=
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr21842240637.53.1784658655186;
        Tue, 21 Jul 2026 11:30:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:511:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c3ad9dfdf7mr21842196637.53.1784658654677;
        Tue, 21 Jul 2026 11:30:54 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm1185298eec.30.2026.07.21.11.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:30:54 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 00:00:12 +0530
Subject: [PATCH v2 07/10] arm64: dts: qcom: pm8550: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-bcl-hwmon-v2-7-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784658614; l=1062;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=7mS7lsEAHqFL7+IZtJeoFPHZbb0Bx/qkjaqa79ydQ1o=;
 b=dMndhaEFYas0/kwSaCAKkN09WtXxauLKLYvg+8oE/BPW1hbU2rRwetEt5qn0UWLN844wlk0YB
 nf+QTtBzMtODxTlIzv4T6He1xQuynZ3RtiPiWnQE9NeJHC6v54gDFZS
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: QPtEkRqC3zWjOnzs0Pg41_qLk-1ifg02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX+oCKwsMDy1rY
 xRpjIyaZUg4dwQrXJitRUMcKSBGc3y30fP0GjtjCLwWTyi6YaYDk2Bgwn/v1Q31Pkeytng28YhI
 8a1w5JzKK3CGE/63nE656WaL1Rv4cOQKbp7BuIpcPV3FtuTMOCMTQuwN2AmiVK0nM5OhCjKAYTY
 C07QpSUEHgRylQX7nNh8Q0PXH5r3F8/Pnqq9TfdgesQq5ml975F0FNZLXYSbF17JPKJaFXxUTvh
 BT9TP4mWWA1UdQpTDPazjyCAL1CujthyaNEvjDP8JBpPwVNbU0K8wv4uh3/fk0rCpSav1C8ec85
 Lqd4gUxdB2Rhz0GMR9WxFsUPHp05An4pL//YfIghqQEZMp5+KyNJP33RRjmkSJgGD5cFmRrhnPW
 k3BghBPQbjTBEI+abSqtKdftkLxBL+MuN417A7mAJDaw232DQv6s37/sqBJpHQCHCCiVa7B1s8X
 FWkoXwseBiQIDiCNIvA==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a5fbae0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: QPtEkRqC3zWjOnzs0Pg41_qLk-1ifg02
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NCBTYWx0ZWRfX8QWjmcyEUkK9
 eRueq9QuL66esT0mF/64ltZAdkvA7R+mmBvjtQHzvXpT2uKOuixyIzjMtHdVIGYHDdx6TXmE1Y2
 yIc5woABlAfNcdHNL+z1nekT5T+R7oQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210194

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..fde76da37bac 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,15 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

