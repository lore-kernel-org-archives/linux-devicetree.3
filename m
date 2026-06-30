Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A640BCB3
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817463; cv=none; b=teDqjJtDeWISd5+1NgWh9ObELloPYDz7AqvF0p7iYH7A2Z8D+oGIEyj5lGv+zODmZaHiG3xIP2KG+ycvVNqYGp69BTs8KFHlscqaTzBTk6D+oiKyajK7diquW3xWvsNYC095KbcVoFL+G5Wweui5PPj73pOArqEVVCJintSoyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817463; c=relaxed/simple;
	bh=fQUPmhPxNjKZEYwfuVKBirrd16g/+0UoJsbRG4kPGas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O3imYj5lYWWZTggs6moEQI7ZRjReeDdhDk9UMgYh6V6PNhFEunaFl+NqF3rXvPwY6eQVNDSUgftX2OLSR+LG00/yXGBbY3dxqXZx5R+vaTbUKE4tQ8eqZ4+AQSBgX5Vo2AlpHn9QJIsF+un8OEyStxFF3ZUz+XC6oSBfzGys2tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgMoQ/+p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWyMIZ2p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgMoQ/+p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWyMIZ2p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4261508630
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tnwQYIB2oMxdOusb1j01rB
	DKSnAHELsMv3JRvufhtNM=; b=PgMoQ/+pt8ADDDPWEl9/YisqHsHHMkvC/evk0h
	Npiakhp1bfUfC9cO/hbnoWPJitmBcU1vzVxMpqbhlnjBSxGB2K7AxPaBLLjgV4bd
	byfmx7G6sYjqazDwlLtLFK5TpeTShr8GGSoRnprsKFjqcAiCfvdcnFbYU6Qu1eHb
	rXln4YIi/SLSb9yx+AwUpBt82pePF5wyOpxd/quLLXbUnIVGA6BEaPmH7Elf1idG
	FEnOKgZTCvAcVn1goHTAPFHxUF1+J439Mn1ieEDYUAU+J6YZ4qE8+0tHd39QEedi
	lqqEds67uuvn8iQQ16iTWJT0wGMtbk9zDuMgrBhnUbRaevDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j34sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:04:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e53b8a302so371667285a.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817460; x=1783422260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnwQYIB2oMxdOusb1j01rBDKSnAHELsMv3JRvufhtNM=;
        b=SWyMIZ2pn7gmFB+GBW+ABsQPWN43Dk1+2vF5VUzhqFYdclJdDK4XEx52MN18rTAk+K
         luBmnL+06q37GqLSW87Gpa/Bluc0gDPSpisbTWS5GJSlNQnIArYiP0zTRzdLTo0a6L4Z
         sUapLHJ7QBsGN6DOLZqTJ8xIDs36RQzs30e1d97Z69Z3u5StykcPrsHZlgMqORaMKmxb
         YodZ2HELtavIUYn8saeuZuP6pa6wEcxtEj1QXkDEebQzodUkR6Gr1gBxWOog8qkV1Am+
         Nq84Q0QjKHC05LD1t6wXscJXJrTtGYCkNLLFmDtqYFjXHCg4ANEDCcJJwCtU38ydZwy5
         fZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817460; x=1783422260;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnwQYIB2oMxdOusb1j01rBDKSnAHELsMv3JRvufhtNM=;
        b=nqmY7BKf63BEuwNTqD0dzL5fI4QBKi+neELZrYpuuwWtmAWZiSDNN4gDwdyHuGw5cv
         J8jRsH2jggRkxLo0ayHyZF5VzYJHUGHHx60kTpqYGeRjNvMcmzH83Yg91yusV3ytpR/O
         TRD3ohrfTRN/J6tnAQXS6dgHuhIWkSDh74ZtT7reUjl0Y4Q3fE67MCstSKJPc4Xt/hFJ
         hW4NYoFiD/4+JnbfWQ9YXbRNc6NBd+ANHox0HLR0QAGwnEMYctgDiaG7ZHVxNA74qRuy
         2K4tIQ2U4SU00oYj4p9nolK5TBC75REDJpGkdWiZgIWd9lhrnKLJCCBUFe8XsC5yUTT6
         8F1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Zt0Uo/Fv+aDEZZs2Q4JkfZ2lwXchlGH0ucQ8QPzoDR8nkaxYqIKnuSEEbZOtrHDSC7IhztZfPQegr@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm3Kymb2+MLAXwfK2DWDFmCxj/IjvgbJwbjr875tp6EJkLriGi
	+/LIBRZgJFa31cZjLC0V+CY5HLjW+FNcijtAZ14opShndXegMCzA3qIap8memlHaEcap3wdxe98
	MIos+tHMsPKsrzMXOB0qISpfAa2BvU+PG1XpRrlSqB4oC0inH7Uk5VOOvKKWXoVDC
X-Gm-Gg: AfdE7ckOiUnA5Ns6oj1iGcIKKT0sDz1L95t4qZRxrCQj9a0lSBeA7MmGwZ+9MXbrWH3
	JO6hXxFG4FtDScTKumdg7KoqESRUneH5d/OYp5eYZ8U7269h7Ny9x05jady9iwX033HmrGuO/RH
	y+tfmmYoKnzUyoq+llUuTdXBPlYb2e1uJDL8QE8e+RnDSbIj3KcXFjBAPhbzn3E6asHCnWWziHJ
	P4kfnMqmNj2e6/n0Jl9rU6wqjdO2KN51v+UgaVIkhFKUEdbsCPv3S0RE4tKZT14Kb49RRhY3X1v
	zEzri2zRKj8LyMCxMjK9RaAiPOv5dIL4zdO5McQCGOQ454DJP3iRtgV5iH8GMlwhZcmkLDGo7vO
	t7JVgCZvgD9qbwp8=
X-Received: by 2002:a05:620a:601a:b0:92e:6430:3c68 with SMTP id af79cd13be357-92e6d80809bmr31276085a.18.1782817459986;
        Tue, 30 Jun 2026 04:04:19 -0700 (PDT)
X-Received: by 2002:a05:620a:601a:b0:92e:6430:3c68 with SMTP id af79cd13be357-92e6d80809bmr31266785a.18.1782817459304;
        Tue, 30 Jun 2026 04:04:19 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636ce7esm7137226f8f.23.2026.06.30.04.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:04:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:04:12 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-evk: Add support for USB and SD
 card
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v1-1-146264625095@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKuiQ2oC/02Oyw6CMBBFf4XM2klo5SH8imHRx6D1AdIphGj8d
 yt14fLc3Nx7XsDkHTG02Qs8LY7dOEQQuwzMWQ0nQmcjg8xllVf7HG1gnMx4R7q5p0IzMdJyRRq
 UvhHOrJGtUd4i1XVhhSRdigri3MNT79bt6tgl5llfyITv/q/haZqjQ0g10IoJ49ndhTYbaA2YP
 GQD/4JttsWlKH5WSTKZ1b0oRHMQsiqbdimge78/HS6WMfYAAAA=
X-Change-ID: 20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-e774d12eb516
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fQUPmhPxNjKZEYwfuVKBirrd16g/+0UoJsbRG4kPGas=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ6KtffGqJVAEiaWmdcDS0eIO1bvNo+PdT3Z/c
 9tdbpSnQsuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakOirQAKCRAbX0TJAJUV
 VgZpD/9iXJ/7vN1RgM5AB3zqPaNIjfJt6ikcBa6ioUzd/k+RWbX3HYRG3Xv5nnml2h8Ytm3KtWC
 GLB25SKDt9IINMzS1J0BLRKMTUCwZ9M0Cj0RxDPWLFIigaFGc7KQn8q8qJwLQLLA+1z1ADcyAV0
 3/IsqyraWCbHnub7JtyS2Efub+wm6TiXnzg/KqKsKMKeMFnDwCJCeuorGQ3KiqSA4o95Rku5ezr
 bUIwqut9eJilPDWRHuJ7NF/DZzY++bSUVtq6EsB3TOS6neKTutdZAaZbigiRDneKzp9Lzz37tqR
 lJfwBvrnZSM7bqGgP7K3wfxLOUWSMP0BKfhVo6sL4c5T0GB+c9BlvdxfDDqxtwOtD2ay1XpgPjh
 xvBnC41O/MNuHAFcFYbiUZzacKkGpJK8Lm9vT0TG6Iw/cWoXWaD/RLbgl0YWbWKydDL0oGqmA87
 vX23GJonS6QRK82sYEXcpVIAuduXYVauqhegFNOLdyCA3hHoXiuUPRGKqlmk9gzKcf9ddKllkT9
 kakumhVJK15eYe9mkqPXwiKJ8YAkVQQN17eoyVaMxmSXpjYsSAGnzuQEUKHhjCLf2Z0BceHCRu3
 DL/uaEY/nZZhgq5+crIJ0tP7PdwILnNil44xWgELXfV1BeLiCGkQLrEZ4D3kI5v8I/b2b1Uz5fW
 jGs6WNqKeYLqHSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: B9aDi5if08OVTVT8brlr9mF61Mm4bYBn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfX+YzU0qddWzXE
 1s4HAwo3pbbFRVdSBx2YrBYTYT7UY+DC90jgHrFrO5fCvsW0DANMTbm3Ge7Kana7Rt5+F7tIKHr
 i3WsxHQee/eQewZ1+E2/4XI5SlgQa1wui3hyzRtuXtT77Q9h4fNi5zzDZrgT3fBBUHmtEYTr0av
 NAzzxc6L3XslfhDxywkyZ5QM7+jlrVTcrcczJiz9Fo1Cd4yCs6Z74BEMiIMg8T4F0oJO9LZNZAG
 lMP7m1ZrZmpi9PQProK6azlc+mNIyu0B/g4deQxvrReA79ASz26N0hQEwuyEECRgrmTTWTp/9f2
 2BvrS6SOvA9jqTWHjqwa/pVF2YXH0DGU/RMLzdSoZW/Qk7qGI7vevIBsuuXXCy7Nd3/CMSBC3sY
 5Vj9AW9Np1Rw45eXqKdTh4qNAr59gCJeKOllIfSPDys+1fipL4AxR8hCfMvupas8CL+leNQHJYF
 tZFPnpESwQe92GR3w7g==
X-Proofpoint-GUID: B9aDi5if08OVTVT8brlr9mF61Mm4bYBn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfX3tVDl22Dmftl
 PGX7+ptx+X0fXMkVnWYcGOLubPvxxA+UdVB2et1IYzisIeg0w0eUcGoOSCMpEZpi1VKTZzjB245
 7rdG+4O5Qk5dU/5APGOfh5XKoiYJkIc=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43a2b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ly97nd3JUEkQhviyxlMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300101

Even though the EVK comes with 3 Type-C ports, the Eliza EVK only has
one USB controller and a single set of PHYs, which are connected to
the port marked as JUSB.

Also, the EVK comes with an SD card slot.

So describe the PMIC GLINK node, the connector graph, the PHYs and repeater
supplies and enable the USB controller.

Also enable the second SD host controller, describe the card detect GPIO
and the board specific supplies.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 92 +++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index e47b24f8b827..2fc945658300 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -11,6 +11,70 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	pmic-glink {
+		compatible = "qcom,eliza-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 122 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&vreg_l13b>;
+	vqmmc-supply = <&vreg_l23b>;
+
+	cd-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	sd_cd: sd-cd-state {
+		pins = "gpio58";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart13 {
@@ -18,3 +82,31 @@ &uart13 {
 
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g>;
+	vdda-pll-supply = <&vreg_l7k>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_hsphy {
+	vdd-supply = <&vreg_l7k>;
+	vdda12-supply = <&vreg_l4b>;
+
+	phys = <&pm7550ba_eusb2_repeater>;
+
+	status = "okay";
+};

---
base-commit: 758ee0279ff3463f564cbb36687f4faa035b7878
change-id: 20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-e774d12eb516
prerequisite-change-id: 20260514-eliza-dts-qcs-evk-7f1419812659:v4
prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

