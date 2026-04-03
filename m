Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11923009E2
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775198445; cv=none; b=DHVuNq77DMPUG3R6RLEKGqtDlznO9omKPhyPDaNPRRWgg+h+Ew97Ibnv0Nm/GXApiBW0zrKd8rNKSB/EYn4AEXxdRzToeOHtHXY5HykHaH7OvuIfF+nv52CxNubD7mnhHFr3Q+pNdkzRqte3OClRfhYuBHvj5Jp8NVAviMK+tqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775198445; c=relaxed/simple;
	bh=bPDhPXgl46lmDkY1ccCTPH7wpob9U0VLvsNT//3FoIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u7ISPgyQMlpVqW9/1LbHnmcoYiYqiZ/8eon6lIqpf6rWSslnD8QVpUbGcNzDAJjNgWph8HvyTg3ivaec3EyYcewrCcYIsg9U+UCdYVpoaxVqejsuT1ASBVK5tjhhCrU6q5xj3dX8JevmlUDkvWkalhf21MvgXGQzqIpV+ntspIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNcllLCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcHY313D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNcllLCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcHY313D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63344egK823333
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 06:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U0OjGPGZa4Km5KBADfSjfK
	QEn7OpNDKm4icfB6LIFmk=; b=dNcllLCW17AzZxfSvjXg0LhTReJ73ytGWjym6O
	sUQALxbddtLes8pLYCLjdUtziOdLJ3vweBvBpvyjnEcQ5z8fEQZIvXAP5XKRiHcJ
	ll7cppz7gtm0VcqFmmeFdeG2w8SnBRfFNY25gIFMu5RmTsi+3ySpXOVZK7wlnTXj
	0lsChWHTBXrSNEf6K2Lf1DNglQ4Q2Mz+k5Sgf1PtDL/aFZOgy0XkZELMq6srTdYX
	vpqQ223SNewWkBOGSugDrBoXMkL3tuG/QC78nmrW0S9BwI+aG1gJfrYWXHP7JkQb
	t86w8Tn9U7iV1dtQb5izeDRWsZ4QToUQ2wqnsADe34OXkTZQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da6738dfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:40:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c8768a704so914738b3a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 23:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775198443; x=1775803243; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U0OjGPGZa4Km5KBADfSjfKQEn7OpNDKm4icfB6LIFmk=;
        b=RcHY313DZRICpHUDcAx6SDAIHPuX7ize9Synni18R7808dxT8hsDHGMORwmowoa/Ym
         G55DGBe2pT5PymGFr9wbkZfg/k/nwCSs4/83QEY4aNVVJvNA0QeIXtal4gGqQWniUZIA
         mTNiBvJYoFr4NU5b8WHGmuQZ7BpBTcxiQ5bysI8mbyTBol6dNXB7mGvebPj9nfyE2ZkQ
         /xMNQCGj/WHIlXaULnK6S2anBP01GOD/juLzi0M6fsM+LT7gh21qr5c2E+1MrboV5n6C
         7O5eIE7DQLqCBffVEZUDRMNm4H2XSogNx1NLyh161vsO2WeEbppaDlRXlk4cD8XwkrWO
         iSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775198443; x=1775803243;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0OjGPGZa4Km5KBADfSjfKQEn7OpNDKm4icfB6LIFmk=;
        b=ozVhjbwaAKqWYrTUR7iL/jmHziDrIlTyYTa/USkBxMHNbsVCzqaS/Ronm63mu/09UV
         5VCDOw1xsXwN2HUBEKoMK0DH3uebF/Qh3fceH5d9054G/WscolL/s9me4vGgLZeMYVxC
         Df9Emdzlw9wW/QOvhLDopz0VEbvOY4pz53Bvg08lZmNU9sGS96SFHLlGk36SDg27NYM3
         5w3snAc+3HODBC8zw1RqddVRMpaCSdM29b4pNaPbS4Ee35oZ4JRPVaPFIQakfIZD2nRe
         6AaEkce/Fx3/mu6K2OXyTYVOYC9FXRb9dsZHEqpoKIlDUDrGcJNokSMXs4TyYhJOwCI1
         Qk1A==
X-Forwarded-Encrypted: i=1; AJvYcCXfHuXLAHbsnrm3bPhUHRsKuBt1NbZWC4CE76SrAXxQA5ODbT2xvoZ/0ryKOHzILDr0zGYV9qeQIDOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwVGpm62Zhtl9ph7LgDpZoG1SgLQIOrjptsarxHGQ4djAu7GRsY
	p+WZBRP6DQ+xUe5F5vE5wEN1MWldojalnw3uX29vs+6ulLBBkW8EvoJhKzPJ0stvbdnk3yEhkWq
	euO3/Ty6HWC8XyU8wtrmXircOE3zyPJI8b55CsJgd2iT5Cwf+MNkw7ZRHpovUPBCs
X-Gm-Gg: ATEYQzxYc3hDXQTeFIyxhP7Q0cAGOq6x4IOcxqEHPm9dbzsapRRjoUUPMqzXB9c1MG0
	+xsZUMUPaTGFAaJHYvByN1sBjaxi56ZVZTjDsMO7qeZRE57spOKZMizf7+1PYau4frgT91VK9iP
	YkHvKLIk4FstSCnjmjP1PP7EQ2wqWRtaGXJX/NbjGLWjPTPTEB0qZyibnAJZfYrm6pN9gh4mvsW
	XsVbyGrEJvGImdZo81XLf5y+zqJJ41YmAOvaPm//5yFg97inBWoq08TEPu00Npxr2+ghvrTdDu9
	7OammrzLZno7C2xt5fRBw+JmLX4w/t46lViitfSVkHl2vCPYuQO2UDUSJW2bP4fxxcArzqnejsj
	ebVwxWGM3YTVgd+qB87DxZbx0UCq07G6HthjN5UVhufp7Qwqpf2YBaxKThg==
X-Received: by 2002:a05:6a00:b92:b0:81f:4cf5:f252 with SMTP id d2e1a72fcca58-82d0da74df2mr2119198b3a.24.1775198442633;
        Thu, 02 Apr 2026 23:40:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:b92:b0:81f:4cf5:f252 with SMTP id d2e1a72fcca58-82d0da74df2mr2119160b3a.24.1775198442103;
        Thu, 02 Apr 2026 23:40:42 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11cd2ce2sm1015919b3a.6.2026.04.02.23.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 23:40:41 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 12:10:34 +0530
Subject: [PATCH v1] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-can-spi-kodiak-dtsi-v1-1-4055e67dd3fc@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOJgz2kC/yWMwQqDMBAFf0XeuQtJDFL6K6WHmKztVoiStVIQ/
 93YHmdgZoNyEVbcmg2FV1GZcgV7aRBfIT+ZJFWGM64z3rQUQyadhcYpSRgpLSrU+cjcD+7qW4t
 azoUH+f6ud6wWj7/TT//muJw77PsBI1sO2HsAAAA=
X-Change-ID: 20260403-can-spi-kodiak-dtsi-64ceebf28431
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775198438; l=1440;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=bPDhPXgl46lmDkY1ccCTPH7wpob9U0VLvsNT//3FoIs=;
 b=ZBVdQ4ASfsYLhOHWXMGtTMFPVisdtrjkV4abi++C17c1XY69+odW2UeTZ734QIdWwRQm1QyfJ
 yX8J/ldHnuzAx9OkA2SIVrAB/ZIa1fkk0COpmHSMpwgX0a09EZX9s3R
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cf60eb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_ikZVEo30FcIfUUojBsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: ilIKi7hIbaabq7fcvV4CwQcGsClf6zvx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA1OCBTYWx0ZWRfX/yAJMqr7AHu4
 SpCtF0sSe/ZMC6sN1Zyp4Rn4viU7rJmnGvaYGMLdAO6ggh9A/MAKJ2AMp73zNWh8khW0NHB/WqY
 V/vq6lPQah8p/aamAxNOTlerL5KwrwOZyjjVDQJrDA/Pc/2ZLdtbG/7f6l2e+wrOjo1gzeNPsUb
 J+u+bDVCEax1CtNkyCZwFYEteMd+Q2GrfAlKlbzDY2blNkt/AsTw9kc6Mj+LSuKiLcx7/wNbW0m
 lX4ankqNDkmVIu1Kn/FCQtgY57OSqRCeV+LphenpbnLF5lNyxhELfZTZZrsSKYf+q928nwduUXC
 ZD5sZTh3kqmsqCF/kSFXNwQS8H06RK8qxC52pRVdEDNsTVTSK7IeBqQwyAxzMKtr87AB9VGtgp9
 2lFhCs1vQYKj1J9KOzbee5m3tWpGykR3e6hE+hKDpUX4uIkm/oURJp82UGkOREcZT8q3CWv0UJn
 jNsomuppS5ZCuzAO5gQ==
X-Proofpoint-GUID: ilIKi7hIbaabq7fcvV4CwQcGsClf6zvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030058

Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
The controller is connected via SPI3 and uses a 40 MHz oscillator.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..ceb68a890bf4 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -44,6 +44,14 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	clocks {
+		mcp2518fd_osc: can-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	dp-connector {
 		compatible = "dp-connector";
 		label = "DP";
@@ -1208,6 +1216,20 @@ platform {
 	};
 };
 
+&spi3 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mcp2518fd_osc>;
+		spi-max-frequency = <14000000>;
+		vdd-supply = <&vreg_l11c_2p8>;
+		microchip,xstbyen;
+	};
+};
+
 &swr2 {
 	status = "okay";
 

---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260403-can-spi-kodiak-dtsi-64ceebf28431

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

