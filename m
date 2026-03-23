Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470BF390989
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262756; cv=none; b=rmgAjgse9ip3M1391FZPpOklROeTrr3DwzQOuqaAuMpwPD/czdACYYkSUSuDxVHyvILeJLiqEpspRVQCWP2jxGQsBX8nkjiCJl5yaUb+/G7dDhxMqapV84kqzjbgZbteroPzxUFbADGk/ycWITFbmuUpjz5rqFWmwSUzZjpAkd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262756; c=relaxed/simple;
	bh=WeA/Wy9c5MKU2UD2GwOeQhDQz66ME3bEbXly4eAnD0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SinD4x2DbDQymAjuGDoV/7qHx2KFj/ZaqJ47Od+mTQE9ISIIxZrtKuIz71WMlCdjmQOxSMZXLb68AfTRmcWuLPRfFW4XcirZjTXq1E8r4Ulo1VInHTs0VpWf4bo+6eBj2EW4f0xIiV/6l7UjRNkuUXS9o8VbfeUUdNwfy9ElpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTd/gwOO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGQPDJFG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTd/gwOO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGQPDJFG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NADsrF3539883
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=; b=KTd/gwOOf/EbbgJo
	KxFuHjd/VrzWTBrgK8XsL2VryXdmHIbzRosiY8lLFhGaVBdMZsqgNev+0Tkw3Hek
	9j9aAUZNnXxPR9H5XkEvnNeKmNwMhrug9nZ8LYwVc3CQaDFWpbfB9EoVETmaMTJ5
	ntWzCoHUp+5IqgXCCuZMj3wEsLC98tTHY87DmgfwhD+IO5Ec+QEj6E2LGI7OdDFv
	bnyPLSfPSQsBWnFWwb/8GBOFs+KcGv3anOEXpYc35Tui5Q+nYLT4kC7E9+GHIhZP
	wct3scZPldZx0s4hQZnTYJsSBP1dKoLhQvDKkU6xSUMan2PpRcsJNXT/kTPynRCD
	ERooyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k303p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:45:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b06b68783dso8454675ad.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 03:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262753; x=1774867553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=;
        b=KGQPDJFGyWEZmrjNV/sZ+sVX7h6BoCPR8V73Ui/ndfnPIKFacG3qlOyVNUh0JRA/ID
         B85r20/A8BU7epeLw2FIl0JvYLAB4JAhl287OKc6cT3jRWCao18JpHbzEbh2VFfpaXXg
         fZJ9OrCTyceDq6danJMsuxBSHJJuHnsyVYdJW65FzE3A7thieCO7ZCELJ8UwDCNt72R6
         Rnwv2jOy0veCFaaNbbP06L5r97V0BgdwGzuk7LwV61eHf/4TZ6Xqhnigc0UK/22TNI9e
         8crgAYQ89bI5y513xmAMB3sTJipiATkqyhgBW0Pmle/wKnvdLlhCv5Agfifyn7ChhI5w
         L1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262753; x=1774867553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5iJieZ8EQcjhAmKwiUQKT3yTUvEdnOkURgGJjmiy/Gk=;
        b=lxTCLjpwqidfuWLWOd7cFthrR9lFECI9zsKr45Ap1yDY/VmOR8k0f5MbCjz7KmFMBG
         HqZgZXazjphw/Uy8nvqgYG4vkq6NPTrUgU418uO6BJTovahsv7VVqtzz2TRAUvQlOuqA
         BjczXsfix2OH6xAXadvCRMwbkKM+BEYcJY7kdIgB8XxzggiDhabqSO6gMLrvpnUSbcmK
         YG8hdrq82nCmAXpBfRPGTn9g4OeFjkeSHkh1yiwpCGUZYmDTIs5e2ppyalzEq5X0Dsjx
         IOTC9kOeY8soiGMN03ESWVR8jIduZRHVSKaJqoWhuAWrmsCgcuwWUh6Fm44CfOecstY6
         91wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD0hOAmyU5HeDkDLU5czju1S0c779moGW2UfN05DpxHVBCbkgdEaPNDeLPgDgoWpRebWiMgW6ZnlG1@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJW+PcmZRsVYTv4vSPpQGOzTLptd+W6zCJd54O+2nF+7XdWzq
	XlTYLmW1G7oE8kU45chNSuc7OJXALLUcsgU1WO+0jkOl1qtBccpqCFVc33j8YDsnrLHGGMlu2Kj
	KsaDEcjeeKIJG9L0PFlX6Wgx65u9F2a3irG1a6KawOCWr5yVBuwtmhKmb6l9NlyY=
X-Gm-Gg: ATEYQzyHBLk9DFQMAofw0/BVHf0BXEDdbN/E85pEjjpLkZnR14psNXD337OUjMZoAsL
	fZiF2C5qXCy8opAb4uVoFpqEuzrG5+2ERB6xcWjsoiySUg1O8KCQ26KbT8LtiWStWkFN5idtOzW
	hK7z+hEDk8Uw6VRkUNvFeFX20YJd3iBaV9cPuCAd8Wyl4AfnvWz2yyZ1oZ0WKO6xJ6O4+veHLHz
	Z8H8op/QZMOm1zH+kS3GoCA2Z1mb4HR1Vxbr+KEMMOM9KYT+VFduDorkE6eGaAD2viS8g/DQA52
	r68eHXDdqSqmFUpSQeUl8Q0TEqcjIhc1RzmbMdZYn5GIop/nWjl2+5vCoI7Omxqenl+dxKkx6Ne
	r60+CrPL4tq1YbCBGbc0gx8r6tHd5yq5VOjwKyszhHB2IOneDfE8=
X-Received: by 2002:a17:903:191:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b0826ffc53mr106427735ad.9.1774262753171;
        Mon, 23 Mar 2026 03:45:53 -0700 (PDT)
X-Received: by 2002:a17:903:191:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b0826ffc53mr106427395ad.9.1774262752623;
        Mon, 23 Mar 2026 03:45:52 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08340c2edsm123454225ad.0.2026.03.23.03.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:45:52 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:15:16 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-b4-add_pwrkey_and_resin-v4-2-abef4e4dcc3d@oss.qualcomm.com>
References: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
In-Reply-To: <20260323-b4-add_pwrkey_and_resin-v4-0-abef4e4dcc3d@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774262738; l=1670;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=WeA/Wy9c5MKU2UD2GwOeQhDQz66ME3bEbXly4eAnD0s=;
 b=Svn6C5I/dHV9C4ehkYF7aQh8OUHsKtYahZmSzLguhV9MsNFMH2T4+nmhaTRLEo+Sj0SCRDHiH
 LdWDSKM+tamDfjCSFmmsmLEUwxub/1iaEfJ6RSIRWZCNGhUtriOqFQa
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c119e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=f3aK1VMAgMfWcFvZUCoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MyBTYWx0ZWRfXwfusRrpste+j
 Ot/hcy6gz931QkktwItrPCBoXgdLmTQLLgJzyXBXlinTT6GOqA9rh+NP0qx1SlZkXhnGY0uD1Iv
 tmIluxeG3+reTGtpbK3Aqgk4eZuP5/H2h9FnHE0PJPFUKqkBkbDUJFgt/xcxeghoDCLjw1on3Vh
 gOcp9+Iy9DgXHFrYDRKKsbKSBjfcblPfyxzrEd74NW+kwPvQN3VDj+QlTKYsSYhZfOz6balXswD
 jfNTqEy3CZKwijTH2tI0k1IDIqH3/64jyh9raWYa2jJfYtvUMu1to4jRC0P5QhMN3YJDgrgI9wL
 7qxi9x4s1l1p1Df2McpFSYzHw413lh9il2LhXlcevzFUgFy8kLa6DG3Q0o4iGZ3tt3kcC279B90
 u/1v0udh3D3nMlD/qH5y8sFqiOvlqZMTBpTzKEzpYy1uep5uL3hNT1mISe7+DTHrsSbs8o2jPUN
 tnZ3uQC7JVbtUi+Ex0A==
X-Proofpoint-GUID: yXWpNq6fFbVESdtvgRF26a0FCqS6x9tJ
X-Proofpoint-ORIG-GUID: yXWpNq6fFbVESdtvgRF26a0FCqS6x9tJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230083

Add the Power On (PON) peripheral with power key and reset input
support for the PMM8654AU PMIC on Monaco platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
 - Disable the resin as suggested by the Konrad.

Changes in v2:
 - Add new PMM8654AU compatible strings as suggested by the Konrad.
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..af4c38309efae89479f9a11fcb970a4c18f03a91 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1

