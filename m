Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830796;
	b=BIFCXmkyCn2/h5oM8rAHi4cYX3ZtFoQkKhHF5zelfRaWCxpSuBRJcx+ZHSKndNF7Zalt
	 3iHuzeJzxY92Hk4ElFJ65Qrb2tmf6rqg7fgXyWLgQdEQLCuY3+2gbgu1gRrk89x18Id4w
	 2cXIWriP6uC+IbLUE1poejV0zkTizenSGUKNbFHIzwuM+9YpaHbNYxQ2IjOVhlnkz9jUY
	 NJCH0X3tJ8vz1zl70PgR8tLkygwCRCcTyl6Jmuao3uuychg9PPsrMFDriT9BWGTbSLDNB
	 C3ZzIG07OPSkXXpyWjiqogCETceRzDLNGekXTHSNFz5uUxLkp7GsUoCh+bqXyrtCgJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
	b=jDWHFlbwJlfpMqdr8Gq/7TD7CSW/J6fj2uBpWyfLT+zRDmGdx+Wu87vQfMkR17Nd9rao
	 ruEz/Wbux0AgBmoemWd1l/l7a+oy7HjCfGFMos4NeB7sTaC0YohSfnsUCr8+2Gx2+fZ6i
	 zBfAbGm0P+c0qAsODRr5TgWtknt5JvDnPMFX4pwPgbkprDn3AHDMw3HDQipnavcQboF6Y
	 k2HRnPnO4JbW/ps3eZBp0oAVYI61lhj0rioPZsDXg6MwkwLdZEEIo0WHtzXEiBPHvRGEJ
	 Z8KfkjmMexoLLyIOkk6jkFYxnst4dxdCxm56nfdJI04x1A3qjsoJaxltB6jOg6zoE5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrD260gc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IwSQvyG2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24D2606A338
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24D2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZrD260gc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IwSQvyG2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0uEb2472416
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zW2/gkGq4nm
	G+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=; b=ZrD260gctRypcdquqIhXZNM5DUL
	SVu/Z+em3Ag//0e+nCXBEM7kBImeDezWUi4mmC7MGNSl8ro2AEDBdOU1TsEUDcXS
	uiAqVmPVL+ih6YqThJgp51YtjtKzg18NP/Mw2X28V1Y2JQspLGK4SsDjeUIiSbxK
	pxk07cqCCMP53ZwA3/mropsnjcN2wZkL0mvZiT4Qg0actwgFszSSXMTDIThMpn4h
	cuNNkShpXDMzWdUS5Gt3vB6xT3egwDjwVWkzqDyhFRNwxQwcoQQu65BiGkAvOiXI
	d/heAaFuXbsJRhpwZIl6BARNPSJZ3HXDG32SIzL7zVxfyMUJHcwpxDyf5qQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdx9x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:06:35 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so4070896c88.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794830795; x=1795435595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=IwSQvyG2hq79wTr4WXg5jrJmcPxtW1yyAyEiY18p2dpGv3Wkt3KZUwVdnxbbQ5uEN/
         SFH7c/5TJGOMfOgBC89qM15442QrCZuq9C1ljdHRs0xJoWbsjl2ZzE3am8vNd9hc4jVG
         2XAsgGurZM+KDfhIEGJB2C1hcDvic9LPz+NDl2X1GWPRu2EdhnPLNG3NuTKv4XE7MS/Z
         +f1ZJArUDVxFINv3o608h12bvU8/thVhXGWKBVnGjxV9bI44BjZL+Rjk4P+/HLSlNyib
         eTOYUaohSHu11mjDoUwYtIGvJkvWVuQpfER1dK8AiE3+ta2FxvexTu3EpTonzy4Cxzn7
         VMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830795; x=1795435595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW2/gkGq4nmG+GVOGBUwZNxbaEMh5XvK4WG9k00wmcc=;
        b=yFKlYk4IXmJ71BwU/SHP7Z1mXyiRHTnq3dT7f/bdGWrDKCaLkcLKcPXtMPTR3efges
         FBVXgKvXVUpLZEuD6B/11aZeLT6Gy/7qFXRPKLyx+Aim+Ju45hpsqg2gf0q705LjdIp1
         Ud+8+89hfgBeOpaLbiFyFErvYUgABVY3uEkzaeyWLUXtbQ/V2P6E/CngB811d/96RTf4
         6yUZSVhiqvs04XEd47zp7wsRnmS65L0RGFhN+PmXONmFXsBqxwmmWuOzD6nWb1VKPbGu
         KZbpTISAE4MB6X47TQQaDpmgZS1k5XxWeG3B7V5cMtp623PG1Y6GpoiyqdIKoTAcgze1
         3UbQ==
X-Forwarded-Encrypted: i=1; AL+hErF84zk6ALdd/XgczzSTRl+J1SJ+tk75MW8X3Kb+pEwf7sOVRCvG1C0zkGJ7J1w1amZwRmTLsmu3r+LI@vger.kernel.org
X-Gm-Message-State: APuU4Z9v/JdRrChLcQ9yfbTqRFWACIyCrpiLoJprLOJwGldfXPFvJ7Wh
	EcBEDQvQuKBiwjHCcUqlEhQ78IF4Q2vTOshww9xIogIb9zKDtTweK0uwT2zg0KM+ds7gMMU1W4S
	lejlmjPykHQ4z7rc4i8BH9sXEFgQbRqk6kAnAnulkXyL2uOjPc7boII83uc93zmba
X-Gm-Gg: AYBFou3ixNlF19W1n2ovJpA3RFU7ThJtnpoIXJMyBWuCR2oKDmMpdGKxJHuSk0Fdkxc
	qvfE2EdV1VSCwtDLMHkusH4WU/VCyii+pGGKgFm9Nr9g+19jBSechwVqknsMCOj8bDZp0KUkbq+
	Beu16XJZP0DlVI9UqkCS8E7dYsAKx+6qQHdgQqNHDUPMn3uuL42n1tRaiRaULa+EmtGSyoKjqke
	la5NjDy3mKwGUoULg6HIXPdRjh2dKBWNEiEmX0I0Et3jTwsDQqqmrVIv2xp3XL6GatfmKf+H+XR
	kK0tJsBgUNcijvXMMkXzgoxzUwdldUTY4T5mLkip8Xo7nX3F4EOwU3FBLaFZ40Cs+mGcX1xk2XX
	3PIPFn8xEmEZNf6Ft5DuEw7Ln8BtnGAZCVapfYXD8u192ZnxKdWQDJ94oEZmXFmWYVQwRbfgREE
	G0Mw==
X-Received: by 2002:a05:7022:b045:20b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b50319306fmr10877410c88.45.1794830794308;
        Mon, 16 Nov 2026 04:06:34 -0800 (PST)
X-Received: by 2002:a05:7022:b045:20b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b50319306fmr10877375c88.45.1794830793583;
        Mon, 16 Nov 2026 04:06:33 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm36961530c88.5.2026.11.16.04.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:06:33 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: qcom: talos: Add graph port placeholders for USB Type-C muxing
Date: Mon, 16 Nov 2026 17:36:22 +0530
Message-ID: <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afaf1cb cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OnC3CdEk30aKpSFVcR8A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX2lgiLxKZ9RDA
 OxRYln8y8oIKGb9Tmt/nOw0j8hOmQHaGRGGAVPnUC1a5Zo/IPlPnaKPpGTUvbIS5uscIzfLn4GL
 dN1olPrPvNTUCHBPKWcjhnD8D0ZvVXY=
X-Proofpoint-ORIG-GUID: o5-eLqYG6OJNLX2c1nGa8X-3tr3fpcUE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX00CbGgbYPbmP
 i+3s2rkQ7CvFp0OsGKNLpH6R41Lg4sLrPKlc6efNv/4lid8twkuG2SyUHKzmv51zXt4j1tdWRQt
 AJ+xWh3FdoVZwdx/uobYWoHIS9fWvbnmhpYygNY+Dvt02y1wKV4aJLShdNapS3DTepm6dJxp/35
 eQqctbp2keJ0y10Ug7xvnFOwpPzDs3nbt3iBta9gwAporV+uCBZAFEqeEXTq5AKVkPscowrBFhB
 9W+h+KJ1L43adjT4EWpsePdcjXstWqIO+Yd90uKPf/TFktBebhVAXGbaawWejtcLCFATS+QEpJG
 fGsKf7w0sArkIH3ce9y6savikhHvfjAJRquo61El73wTU2TGTB9WwiNGlS/ZzUxDhdsQYq3BRrm
 BzBCqiEAQpsZZIylqNDVU0ZtdYJUMxPYc6NrGZ7ZegKBntjszTr/XJrQTUQfCpNKaO3lLT5tjDe
 WwWWdIXLzhq6HW3z+Dw==
X-Proofpoint-GUID: o5-eLqYG6OJNLX2c1nGa8X-3tr3fpcUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048

From: Akash Kumar <akakum@qti.qualcomm.com>

Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
the PHY. These placeholders let board files wire up a USB-C PD
controller's HS/SS endpoints directly via
&label { remote-endpoint = <...>; }; instead of redeclaring the
port/ports structure on the shared nodes.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892..04636fd88807 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
 
 			#phy-cells = <0>;
 
+			orientation-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_qmpphy_2: phy@88e8000 {
@@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a800000 {
@@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
 			wakeup-source;
 			dma-coherent;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tsens0: thermal-sensor@c263000 {
-- 
2.43.0

