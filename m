Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDB438BF61
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669715; cv=none; b=tHM7hcthBr0ZsJx8HRfpDtOWCinf9gqu+C6DhqbwhRbfBhBqnVF7dq1qS4Sb8FpAByUonIXz5XZEg1FJg7miys8iEcJuKKwv6Nq2iS8EPParY+kLnf1QK1Hj/kF+wxrC2BSTWqlCbSa5kKI/xkFBLl0ZhyJu/WMsKetEHzlGNh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669715; c=relaxed/simple;
	bh=ooZnQn6F2NRSSZn70qIovRKblRULNZ/w/cxqvktf8Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZHWD0+OlX4C7OVNO1+z+4BoTUKBTniklNH2lo2oG7RDjiTLn/kmLToCjCTaqE9ErKv23XtREVfBYTaRsPoje7X3/R+JxGyVfVt5C0ltjb6pWa5C2nBHzrIlUnCKZVKQIomyjDcuodDC3oe/xCGcF/uEQsr5Vay77nth2tc5fAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AciS6BQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jk5MOYGY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AciS6BQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jk5MOYGY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DANTr62338816
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t+OfduLNHK+8RSPR+aMZoM
	7GpGt94ax1KW/1H3TVI9s=; b=AciS6BQGoPSj1RJ7ZDpUA38oiapDebGUnKmCrz
	2OMUEHTviwc2d6NY2TPDUxSo9yPSvkPPq/Nx+oSI3eN4qPvm4l/rvopAgsR9QKQu
	rE/EKED0jCK/hFzPr3+TTXEbj9izNV8NW6mnwt083v/4V/2fVphWHnapSs5vIwhv
	JF7IMHqZEuKC3CkqYZ0qC01+Cd7XFwSGyRGYWD1O9ZWDKpVrtQxzQB0Wavm84hzc
	viSpvVViCUAPVS3c4HhejFNGG6q1IjBMhefvXSQAZ7dc1QAXvXmvkbG722E0AQpi
	moBjX0ZrqUrwUvRoLjgHUEtFkxm4Agv/pQWNtDNWHZrK+EBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxb2hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:55:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36641fe4aedso10270551a91.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669712; x=1779274512; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+OfduLNHK+8RSPR+aMZoM7GpGt94ax1KW/1H3TVI9s=;
        b=Jk5MOYGYK1PO6FpIkDQm2tv2tMpBWb7RoHUVSIbnrRIPdZjtUZRIT4WA1NxtmJ6/pN
         s2l+2bdTSSWvFS6xruX6qgnCJdaYcMmGiqhaenNEJDLOOTnstuQdyd1woeMQLnlkZ1Ig
         xXP+TJtKZTA5fE4qXFigBMlLbpSUNTt4FeabxdzfSMWlsNZr7OhCqyv3JE2ZUmQfqBiU
         vs+B+J0Ki0oTbX+IsXmuUql5GwDU3oBYo756/gPcZZySDMgCHUoIZozw5GdlN/cf/cO4
         G12ul22xo8nuYE+MU57PXth0SveJjvAH0ZZc7okvlvWfGd82QjNWVwx6Q445EDU22xkQ
         lLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669712; x=1779274512;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+OfduLNHK+8RSPR+aMZoM7GpGt94ax1KW/1H3TVI9s=;
        b=pAT6+d2JyWRNrbuwoBLH4aoTnWtoxiFJQxoSB3MTT6NrRlPYFsfCfkWik56TppxqH8
         bLAP7uXwghmuFhMcE8snHQXshErCdfJQ2jm78dmKet3OUe22rV61O50tD0OQbBcCl/Ms
         Nyujcf6/SnChf62JJZ0JugSS9umK0M4UA55m+la7WJmWOHZywet1yY+6GndPG19iflhB
         5czPu+9OuckmMJpSSe9dVUy1jpNKxE4F0blZQ67Ralf+SzKIACC0EvsgzkijqtMdfVzA
         lOeBzOdnny0BtH97iorRx2U6VXg4fnsect9n4HffMRJuTY/2neKXSmNhnwWA3zciUZ4O
         WLbA==
X-Forwarded-Encrypted: i=1; AFNElJ+bZkipDS6cbI5xlHrM1VAlxRTpQD2vHf97EU2GkHCEDODRryQPwA48aGoMUJHGzn9Vmz8S6bHVLBbs@vger.kernel.org
X-Gm-Message-State: AOJu0YxkLaLKZbwayEcMrS7wPBbmRVACvFDigJ6fTGEufyJCEB/5fdfH
	0PTQackfg6vnni3tA+fE54Z19vHFBAcmsDqCFdYeZUsyj5UjUEYAtsbNbKlqG+vDrhCxPvW0yHT
	f+W0INIM2OaWjZeHGZAqeXeaA1EaR85EX99FIinYB1T3fspB+/b/+vDLx9/YSTCRb
X-Gm-Gg: Acq92OH9PpWH72Qb76CsBxcMhP+MJyymWLD+ekKfbUSJ57b8KEG49tDgPwGMAWcSbTv
	T3opMQvRGrxHLKEKxrcuM7pXCAiWD8Rli0hsFTCBVgStEmJQPTH+0bTKcvVkjVJs1MT1+aoxY8L
	paZ+h+qVMTHtouxu7BJ1A8gQCUOIul7QeXhyg1AOJPUqQrYOdSPNugQnvHWm/nNI4H/eJEaUswm
	uudXQEaj5R2oeJxmdGK0dfPc4d68H9Hiaq+gbDw5VALDPj2G23YDTefFvZZr9QPPZLQsqLXdmK6
	J4/Ycad0+OdYTOqtbZAF026B59XkB9MmI3uawKZ4+sqqP4r92sbDVEEOBH46J56nUoBlaOPbCjA
	GDOS/uGGe6sZ+q9WlP7EuPCZMFGXDoJZnrORuBhmn3hEXfXvR805z0ic14Q==
X-Received: by 2002:a17:90a:f946:b0:364:e97f:64e7 with SMTP id 98e67ed59e1d1-368f3e69a23mr3313487a91.27.1778669711892;
        Wed, 13 May 2026 03:55:11 -0700 (PDT)
X-Received: by 2002:a17:90a:f946:b0:364:e97f:64e7 with SMTP id 98e67ed59e1d1-368f3e69a23mr3313462a91.27.1778669711457;
        Wed, 13 May 2026 03:55:11 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ed962120sm2677492a91.0.2026.05.13.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:55:11 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:25:04 +0530
Subject: [PATCH v1] arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on
 spi18
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260513-hamoa-spi-can-devicetree-v1-1-554a671a3789@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIdYBGoC/yWMQQ6CQAwAv0J6tgm7IIhfMR5Kt0BNXMgWiQnh7
 656nElmdjBJKgbXYockm5rOMYM7FcATxVFQQ2bwpW/Ks6twoudMaIsiU8SQE5Y1iWDN3Hbh4ru
 KPOR8STLo+7e+webg/nf26h/C6/cJx/EBJ/5IwIAAAAA=
X-Change-ID: 20260513-hamoa-spi-can-devicetree-4cc79d8293a2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778669708; l=1394;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=ooZnQn6F2NRSSZn70qIovRKblRULNZ/w/cxqvktf8Kk=;
 b=yBNhfwfodeQE9spmKtl+p5HeCSAPCfTSwJaOB385b1Z5ii7cQr86DPZ8KVoVkU997lw0I+sbv
 zEfNFnqiWDgB4ZJaNkBUGFW5MDf6Ky3GW9arXB8Qnxh/5CnH1VZ5KcM
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: ciAuju-xKvDSdmKkfQEICAY8g7_amtSL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNCBTYWx0ZWRfX6Onw/PCapwof
 RarItk0+ZPD7O4VbjPIZkBqUdxwvfWVA5yZ+Nuk++hTAY0nLhUGMrOKsdQs+yHRXg2A/hqAgaec
 B3BaeNNxEkm8xW6mD1HqeYvWeXUxA1qoOYdO8UpWlOvrqQrMRRwUT7+EthBN0pB5BfRxGsFgub8
 es5JqE7q12IYRn+dn5BZHpIIWKjExI64oe7nVGtKtsZTp8frzb7S33/Z44xoSE02TYXG/WdRWr4
 26zgNxecdBGrsp7kz0u8Oau5WzwEN7nYB1A+IOBveczx/y4uaUAdVT5gQv7j21gf2zyK5Fd+xOL
 3FWT6IZvET+3DlQcBLipCUzIbG24MDxS2n6IHCnmIWrw89D2mMzkZO71zLTPHwK9N2u9R8CrjJ1
 ynPi4YuXRRMkFgHyDRgJYcjSpuNZJ/00VOMlVwkMbJSWsSrKjKFfocnsvBXIoGCcT11O0NkzY8Z
 /1navSvP7iwcjVB5i/A==
X-Proofpoint-GUID: ciAuju-xKvDSdmKkfQEICAY8g7_amtSL
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a045890 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TpTkcx8jwH4tlQ9npv0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130114

Enable the Microchip MCP2518FD CAN-FD controller on hamoa. The controller
is connected via SPI18 and uses a 40 MHz oscillator.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..f260f23d2597 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -29,6 +29,14 @@ backlight: backlight {
 		pinctrl-names = "default";
 	};
 
+	clocks {
+		mcp2518fd_osc: can-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <40000000>;
+			#clock-cells = <0>;
+		};
+	};
+
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -1227,6 +1235,19 @@ tpm@0 {
 	};
 };
 
+&spi18 {
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		interrupts-extended = <&tlmm 68 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mcp2518fd_osc>;
+		spi-max-frequency = <14000000>;
+		microchip,xstbyen;
+	};
+};
+
 &swr0 {
 	status = "okay";
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-hamoa-spi-can-devicetree-4cc79d8293a2

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

