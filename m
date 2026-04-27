Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7083B5308
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284350; cv=none; b=stqiujGfsA1KJPMq9jdiR988dV+PflI5NiiZWx9LtRZyOSBoj2Ax88Z+UR1jWjdkQksJQ8sSZLDON/1z70To1KQMMcEKK8/pbdGQJzmdu4VzwtWzaaDcNQnEwHYBaheTjDg7CqvVQlTAmIEi1mxU9cR0JTMGy0yg78DbTAJsjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284350; c=relaxed/simple;
	bh=nfUlgRiZuBNEE478C2TaHpdYARSv0jZSyoCpVTzZyeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=McbAM/Tobx5LlzeLgX+uGWpsbWWblIfIeUGnHCUkJfDXhAj2iNxxtiK/Y8zPEqqsGkXsXcYSrhVWrTfTOgkdmCKYFmE/hSrTxxL6cQ6xMSNq7JMwbVS1WTT0kErwVEsjuA+VnueGyBpkWeizjYWUvSQM3z7aBvYmXZTW/JSgWU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NokANQ8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wb+wm/cL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NokANQ8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wb+wm/cL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TJ9Z2914115
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=; b=NokANQ8/mpSaPPra
	UmzkjeatozBpjPsLhWEMh+cfAm0RZFOmxKPGAWoLdjhWYcTULJDzo4mueDVXIqOu
	988dQNd1lTkxaitlQ3tbFVrH/B4wRcJpRnuQ6kCMeDhVVEAQJR8+HlI66UmgQ/s4
	enB4xQNyofMAu5HekIb92oQEQMMSfRKNbizOlK6eLwFMo8o3c+p/nb8B28L7ko2K
	/O8Eh03sr5XdlAyhvpwE+KxWP5yY11KYmIz6EsYNvAUND3UXiauEsxfW/ko1Qk6v
	OQfexkwu2I4hjn7s093nL7rnRbPg3H7UmeXxPEnRalGLh+I8YVwe6ysIJ1HK6Ei8
	j+DWvQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xgy63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:05:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f460260cfso10111730b3a.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284347; x=1777889147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=Wb+wm/cLwP/WBqYx2Nf6KkKRUt/3+Z4N4ijVUgwR4bXHAoAl/geKofdrtsnaoleMbJ
         Fr6dV6yyFmJ64XQoBm61LNNhdGjvwgFc+ovq59TALN3ZXQbfozilwhg5e4gfEXQw/TDr
         ALaFml11BILOAHHzoA88letLAwYzzW45zkDRAV2oyDtZELJ30bpt4Jw1Dj0neBeKEq1G
         C0lOPeUiGA1ab35uiku/iPkLTa/7C1PvDxfTabOuhZ7HT3xvYRdc3VzhZdHhm9HARsS0
         TzZAoH/FhItxkotjQ3RpJXNva+ohRdmZYsiIb0oWqNhSJum5jYhldhLQ/Am2/IwWP5jy
         3+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284347; x=1777889147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=OfVyE2cKZkHNd8+YAI/7Do90AtWwbrHnk8gsvEGJhZ60AmlUw5zotxVxDTlvxdberm
         7dU02PBTwrmZIMJC7E8Nb57N5pqoDSNBirxv6cOaW4zf75N+M5Pr/arkKLhD4dzRJs+P
         K0Ut1XGnQNmqte/RUirwJkOtTlBFcEv+0FM/jCzdaIWxzJW/eI/up5mx6645Z1mUMhp2
         xhX3di1mpBIFSJIyno76XT9fLseD+HO7YV4SwxUhoe082KWVPs0nWM5bOAfEc0HL05L+
         Bp9h6ZX8UiMs53+5NKBb18SrqkU1VqN/xGoIaiHBCsK3aRTfnMQsK2RONMfM+OuhhECd
         UaLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+uRh4djUI9b5FEz0gR00zh1QsRWd/CJgIgzeUeUc6Rgm9oFCB9kfoCiQ5iMkGq2LDKdBdLxk5Gt/Er@vger.kernel.org
X-Gm-Message-State: AOJu0YzNssdch3sp26N/TQq8t/5wFM8uv5lP8zLZ+FY19eGuisd4na6l
	dME7uUilUvgYojozrQDRCorru0by7fexwOrq9ms1yOFHjI3hXH4L3rXIwRQ0g533+Vo8ELzoC1y
	6rK+HAkA4oC+kiBkkZj6jx7/ALZXna8cr+yHaHNxmUxAl048o/iLQ8xvHwjmYC1gI
X-Gm-Gg: AeBDieuCoXWYrKeSDR1h8c1q3Fu/ZU8/HhjIC+UrptZIOxv0orI4Jnd3Ab2o0oRbHHU
	sudcf8XEv1lhY/syDAwVULfZsI+4NgMSIfTEWMBpm6ZqrLxTeUiIk3lTHv3ED4HL3tgGxNG5qHU
	1m9xXWSIbbFTYh2AeRazyf9LFHCC/2TNsmiWa3bzwtQtM1dyJcQZeqV+MeD5rSRx2oX6eY4Kq1+
	zMUMMQe3HEuBH1gGXdw5P5O6hPNSQqvGlfkabt05cRzwwMzp3a3+jfgaSpZNKkbyjXDRqqp2pF6
	rbbuohgX13TH4ji0Ls/sPiK78qbw1Gm5PeDk+vD1Qu7geiv0XgU3IUtWaZ1eTCYEYFjuuPP/vP2
	SnYVkmf02NpFLPddHUnPF0uZ99MsYlEjo2sWGmDZTmI4tIhnXEGikHWCAZk+jkV2EQPf27LSibm
	XCkecKi9939tJGPizhdE8cGt7SXdYnVorxzjqifZK8KrKv
X-Received: by 2002:a05:6a00:bb84:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-82f8c8c29b7mr43178191b3a.30.1777284346978;
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:bb84:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-82f8c8c29b7mr43178137b3a.30.1777284346499;
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:55 +0530
Subject: [PATCH v8 4/6] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-4-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=eCeG46QNcGH6Tou/jfnrUot8SRLcYov2KTKbb+oU9wQ=;
 b=R4pmf9MfiwAHnwpHq4Nh2RqUo50xBcnNU0DaN0m+FpJphfpbIE4Pa095E2cFbOQge2DxKYPt+
 y66GYgeeuUxCYdPOomFmHI3WNimbhwS6xixfKHMlyGyvX5pyeRAE+aM
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: esUvrpQ3Ywarwj7atL6zkAHOVps5S2o3
X-Proofpoint-ORIG-GUID: esUvrpQ3Ywarwj7atL6zkAHOVps5S2o3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX5Mo3m+6WxeyV
 BhAaJivFB44Yet/8AxWV4RjG6wQzj6J57aPcBemagIZI9gTmxVYWGkicPo5U1ITiC6HN00yF3Pr
 NFgEo7jpzefl48ibmcJgIh/CJUSKXZrVSiJdwjtG068QQj/YIXge4LSRKp4IR7YsSVioigEybLI
 DH72/SYWvyDYznGmnCLfNcNPXkB778qc8oOJFfWsTXE82iIp0qOYhEj+s7i39hzZNEhUjRjiKa8
 a+mBR6vAop3RS0fKtO94tU3d4sdUx7taDSZAWO9jRRIoxZC0Z2S2yl+HhpyE69fKtkttT53yPqx
 XEVrVjVcDoxGqIo+O8XjlKgdG2YzAov/HoN1k5zU1K7B41+YF1MNQ5LxQK9r6ZEIVH8sVpXVtF8
 BQ0mUt2xhivRcBnQjDmDPTpKz9yXVHihXLlY2zIzOI44uepaU4uCiUwSc5yKw+FDVaaea/BCq1i
 vyFVpYfju2aNC1q9Ulg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef34fb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575e..9602d65c8b3d 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1523,6 +1533,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

