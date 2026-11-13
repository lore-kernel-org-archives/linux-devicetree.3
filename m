Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569353;
	b=D7LVSQBpca9BSonHUNlrQmnrrwwDEdUa9w/feBtjAaOQzL6inlQUx36eTJRHjHUluUsb
	 Lw27d+WvEqlNuehsER3y1LIC4GeFSjfkIKKxzOdTL8kVLkjPmT2Zznzx3CGV+IpqO+kgD
	 tUyBkH1QrQzBR+Q1EZ5G4sLcomtwHHGbonTrPmb/l2VPgCaBkpRcBLccy2LDKAcuCMLYH
	 /hbLf+tA4aKgYsQ4NOfXFMonw/uOD3c9fBVgEKgKgmJrk2r4gD/GOrwQxWFSFW1HuxBVR
	 iIe9xgrS3cphTjWMgfwceo/cNYevhL59VrL9oY1GrUQTF68tZYDxU7Yjd29jc3wQsaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
	b=yLgIZExhH3XL70HhwHTdFXk1hWDTjT/gbUYNpHpNk5PipML5ODHKIFOmZ5e4+YAT+Tz9
	 9Btmu1t9im/8STg104/ehVQq0qtY0GAW1XMh/jLYVWtiwjzYqMYRyPe0dWNJLok6AZQVj
	 Ywbt8NmpyqNs91YqX3vI4/9MdSRLCRZz7vtKXMFsVzjsrslNsy3BESWcvxQaQbqVzEn2Z
	 GGSuMUVp7cIau0S1TYLgatRQWXRGp77fqiME4/97//Qd+4xjxoEcdOpIYoZj76Dc5PXQJ
	 cJjIjtMJ++VMCuA/MRsAmgyEKk5AB3rwySQd3FXJKXGNvTb7fxr4N7SOpZtsPbH7vCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of89bIrr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQWqqHYs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A21606A88A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A21606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Of89bIrr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RQWqqHYs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V0D74101628
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=; b=Of89bIrrlsR8brhi
	xNAe+TFPRCIQIYnNTaUaweKZ8zsj8nfy3lyhWatEEdhd1Txt9wikq3jq8Yh+nD64
	oR2Oi4GVJzcrecjUkPo9HpDCngNQpNkqtwwUuVsSgaF9ioJMELgDR+N8VGRe0JiA
	iNUTjE2D4GMI+J5mcN6Rwd4vkESaRYnlzfCZylKUgkOOKSw8MA3GOJGeqv4Dfhlb
	CBEGHaG7UklB/SfqoYUzdpsHtTUQX1E5Wyz+fQngc6paUgNxe5jy8d4iMCGC4MOW
	+pp35vv+4IUZKV2eqSSBIEGmrqPqfZY4tO9Ef7ucAf1xheVk85l32vGqdc+2NpH+
	9Vk55g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdjw72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:29:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1074204eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794569352; x=1795174152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
        b=RQWqqHYsKoMt8SOPgGKvCGr4tHTrvsZ8DqcI7/1P+/QzKkGhvm9Yp0RuMfp/tYB5Ih
         VAonQcWrsd7EmzHJbiRb3PY/ZyrjImVts8zjOILb07sfmfjNqbKHT7EO7nKh+nLaEwJK
         ViS/uCdJbpjaFMY6tWasvXd/O534fUqqVjHySh+p8+aXQ8u2nw82mEMLtgqqVD0bRHh0
         o6gQH3wkO1cmEzFqUiHCj/+BLNEiAYEdmvvCyrkfvoPoi5EgFZuGhTYhtKyIP1BzTlwJ
         /jgaDrb78E0NLan2+Pbrlk5Ho3Hr/vZeJC5pAOsWW8q2Yb5KvjjZ/ovf9V5sGmZJVJHM
         vIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569352; x=1795174152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPacS5uKz5JBbuz3gbxJw12erSXij4kzMnxn038/KzM=;
        b=2fP81SGoo64FTxTeURSqRBwGabcY2OAh3fUdaZRKiV/58t9+gwz8FANqbgSuX8pVBt
         meBu/YwRsLL/4VJ84nln4v0ujLVRbC5fkh/tA8Di107u9yadReGkTaeEB0u+f/1yeJx+
         qdSJLyBsnjK2SIT2tbPy9Q+BgqZ0+5zg6QSncjeHQqghXe7A/o7z0vY10E/CZHPFr+Y2
         zCGdc/N6jX6y/RWc9Sefkxkwzu4jBT9PJRIraphfLLvQ3uXEVtAJZxzcBBbQm+qEwL+k
         HCm7nmVN6/3ydIWpxgi9oLR4D8c1uv8lFt+x7ih1i6x5/erLDgBtqKsFb3fheqaO++H2
         yLXw==
X-Forwarded-Encrypted: i=1; AL+hErGhEolsUF6dFo3l4iYl/JtAnML87JN8DHJgbJ3kv4FbXS6urAkqPJaeT4piqTHDoso1O2dsVpnweDkb@vger.kernel.org
X-Gm-Message-State: APuU4Z+tIgOulDpPhWsazV3SnsyKCVECvafmJs35CJakmC9uAnD8ztnK
	Yz8k4OjJCLDbm/5jEErE2LSvBX8o354O5Zgz3pg1tgp3IYMcdUne3+Tcz/JjHpbAQpvD8LPGwQn
	0fFs+DIaP7U+lxj+x/gMhb2NZHAtYQcUqvUWexm3p7qQ2FGTnrDU5qN5ezz7ImyQH
X-Gm-Gg: AYBFou30eoJ1xOZliIruSUF7Jp+LhV+NFvVDIwN7tHlBu1fQcSXI97yTg39mSNr2961
	UcrlA//8gLZqv2LkZY9pcSZdQ4Qo8QAVlbKvFZUGJHwbsUZlq+2yiyX47OyaNJJzrIgUHGQPGhm
	ls/R0kJqWeZWaRB4P05gRKllAWzpWxM4tm8h3K0Seaa4BUYL4SxAh3h95D5rdofib/qLMu1fPxi
	NEJvfpHob98oxMMvDDploukk0aWC2IYxv0BwOtMp4jtgJ2nWYcIUKyDzVteJ/tgfLs4W63EZAbL
	/0ETXlFb3kiYgCXBV/nU9q5qFMbfdwH+koRyiUc31sB6gbwdr99cOVvuFXMth2x9IH1seBaFC28
	o9NFkofShE3a8HPJlgcp8ITlo4l9ddVqrqBeZlitQiIC7llG+DIBXQOkuuBRo3KF3ah2nAckXUy
	FIXyIGJBwQqg==
X-Received: by 2002:a05:7300:c386:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37967506f25mr2157620eec.17.1794569351750;
        Fri, 13 Nov 2026 03:29:11 -0800 (PST)
X-Received: by 2002:a05:7300:c386:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37967506f25mr2157604eec.17.1794569351198;
        Fri, 13 Nov 2026 03:29:11 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm7342924eec.2.2026.11.13.03.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:29:10 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:58:57 +0530
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-lemans-draco-final-changes-bringup-v2-1-3ae8cd1c9932@oss.qualcomm.com>
References: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
In-Reply-To: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794569340; l=1436;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=7rKXgq1NKJQpUYaFuu5Z+2iP4kdS+cscX2k+ha48s8Q=;
 b=m+NC7zNqcRvbwVTdgWAyA9AI+iJ7VY1OaPtEx2KM3BqndbnV8kJ9tLtyyN9MUG54CA8GMfvPa
 BYiL7Xgn6vUB/beXsS12D/P4SrBbSQVEp1AeSmlhBfv7lS3YFaBMbXB
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX48usQcMzooHE
 pCzC7/pn46OygzAQFKVtObtBMEtoGKmcGWIKEKTyvJWWrTtk1ez5zYHmEdI6Q2rtQ7nnUGivmSi
 vqR15jqH4ZPR2XZf2x4FgPSx6SPGcT0=
X-Proofpoint-ORIG-GUID: 6QT5hjIGdxlAsUioEY8tKeMwNn1hrO5n
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af6f488 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1iP3MDFSonxPIfbD6BcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX0zDhO4w+7hUx
 LLt+Oo/17Nmdg66xRIP7nicX/UvYXvtgRL4B643f1H2EemiPMcZUkq4hG9PkANpqnYenuTFVzyT
 /gGTy3RkKNgs/6zsC7O43Pt6ljBR+y5MolIWQ6O/wUIHpv/V8B/5TK1KlVmO0K8F26CIdR/qjYg
 XSUZ0wWfnsWJIId8qCGmxABNDZIb4HFQc1wEH1Od9Lp+qjx+8il1XgSs9sagu22q2NJAf3UPKZf
 PEaUbW+9vQ8W1TdE8OfRn3ezafrJSPKtzwSqhgKjCpYZ5Iww/4BbEih8i9Ym7mpRIbZL1rxKZyj
 Gc0zjh7Z5N0a9G7kcf9IYJvkkkBDx1CdaIFl4O7LwHEevDAuxEEJk8JqsZRfVBCDGSRr89fRK6C
 4qqMRptvM/Y85cgD+i0SMsFcjtvYnMt007NRMSWOQqbP5tfcP3fURPxYY019SeWFbWWqnJLfLuj
 xbY3jyG0mCvw0fD7TIA==
X-Proofpoint-GUID: 6QT5hjIGdxlAsUioEY8tKeMwNn1hrO5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130045

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Add two compatibles to model this hierarchy:
  - qcom,lemans-draco-som: identifies the SoM layer, allowing the
    SoM device tree to be shared with a common carrier board.
  - qcom,lemans-draco-evk: identifies the complete board (SoM + Draco
    carrier), used in the board DTS.

Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..86edf4df2d96 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -503,6 +503,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

