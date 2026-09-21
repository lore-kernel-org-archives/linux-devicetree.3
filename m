Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602A146C844
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991256; cv=none; b=EUCOxCER8BNTuoubTLi9Vd1eDghz8a5veRyZvdvsZnvYv84lYC9zsSvDm5qXTYz91lDdcG9Xty27Q9BMvKrJPIljrytXmK6YwlQS4txA9VV5xBikYOlWxY7AlrYfqRqdVmdIfL230tGSoGLD0x8gK8G9O9mydNQ0hNkVPKrCTyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991256; c=relaxed/simple;
	bh=OkWVP978AHDjCopobqmugeMjaSrrcUyZCtkMeO7a0LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gFWvkzURy7mDcEM8nQFeZJ915JpzHiHgSUAeKw7MsffvtD7hVmdtHEBfwHmAkmzhzvN77gOQH40gYJsGbC6K2TXmAARdyDo5nABQS/Kv5aEhPLJM7exAoSH++dCOxDu0H9BtjfL3MgAqkhaU/cbklyDefuWyRrR/I3hcaUOmlnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMjgU/VW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gwt8/9K6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMjgU/VW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gwt8/9K6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4nDx1129800
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+/F22/2dv8UjNg0KAfcNvpXQQPamBpsBmK9dAFECfE=; b=JMjgU/VWZtODXirr
	iJXNcuic+P82OxdlOQgOJ6nimC/8nbLvoMo/tbWGD7TM+15zb3TvS1H4BuYp9Bu0
	dz2OC5C7IUg4vJqx836oAB/NUY0U6EVYQb4dURdZ554nYpOGrUWLOd56TDEmUapO
	EPVKPADjY+kEGK2QwQpLkF1Pp+ZNJ4/utB50zw1iO7620b31OgdFV9D20kL5I3QY
	ZFTd7AosTSEizpFhMjtZp0wRtIaM392TtfWUe0HaI1YLfGDZqlMe8bkm0ROj6NPV
	5N5RaStzCk1FCMutA+rKXZW+YoTDunA2apRKNb1sE5ZEWWk2cdhsmHVlrDUDcpGv
	pCypyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg592-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:47:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f925ba4eso411305285a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991251; x=1790596051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+/F22/2dv8UjNg0KAfcNvpXQQPamBpsBmK9dAFECfE=;
        b=Gwt8/9K6X8MydqqJP48dp1t/fTPO23geSdgkV1fPps+fPKOnUCam2aFUTBY0Yu+4yJ
         SrRbmRJ3OVB52sV5CAd8+VbRtUTcuAGoEuiA3kv2kYPi/gyi9N4IoCZW4y6/KXQWta5K
         EY04eImaYkBNADKnqPm0yntQOh7iMmtJ/qHmNPsmSL6i/0oQBKgG66BzVPw9ZG+HPcrf
         pWrlDCVLHRuygP/9wZrBUGU2eCSwRbgQpg5jS+PnayFwbOTfE8v0rvHr5PK2AaFl6Y0C
         Hz+rx0s/Y/nekUCs0WeQqk9oVcKu93/13ZNoYiJ0g1aS5+0z02CyHyyovOGci/L1aboC
         P7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991251; x=1790596051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+/F22/2dv8UjNg0KAfcNvpXQQPamBpsBmK9dAFECfE=;
        b=biA+i7pHRNGc/JL09c7wzTm4ZW5BFjWSDk5NCTF6JrB+81H/FTE9Gs1zk0NZSTQ3Fg
         zeL6pYnADVENnma0p3xdXRlOmcg2BmLXLlDZcPianXyazP4VwzX7b6CwOsMmaILif2UI
         gz2QVuzuNtgQoQYLFr5VLaQAPg+aJvJiSIL2ojdIIMqu7XQu3pnXtyb5ujoGPV6o26oP
         CbdknhldKaw9Wr0zUijWPfLqvr0Gcsysi1hfF40O39T34029ucFssd6W8iIfMzp3rjce
         56VLQOUTk4S1TxgKbllrZWG3zNnVveYYCQSgDDXX9/ZghHrXinSWiwt/aXJD6gMS5oBb
         6Htg==
X-Forwarded-Encrypted: i=1; AKwUvByoZCXMfy42wvw6if7wYDmOaXbU8pnTADslc58DweArnN0QQUXQkXxypz2ohA3uHux2NBI/oly92SH6@vger.kernel.org
X-Gm-Message-State: AFuF++ktxIFrOs8aSvnSoxxScq/An1jhQNdH9Pt68Udw3m+cT/mBm3N/
	ChZdO+usHT1EdPvhkPi9E2qcGhC/zHF19zhJnW3FqXJwEH+ZpeI7xplwlQxMqr73VmBdoimK3MS
	yXvNCLMLqUUXTHwTioM3ltDC035W+8Ztuo4lEVniYoduC3vwwWZUPaZZ2LXxhdTGX
X-Gm-Gg: AYBFou0Us9n/2Z//lQr0fRGJJk1g7C0buzYl+V6OkIT//ZA8bu+nTaxrBQ95BxAy/dH
	+T+/khJjJn8deIwVt745/jglm8lOf0uAJk2m/pANA4maXZbe1Gs01OaTyRUqprIlgLbBtiyiQfr
	VFZhe2b5VRDT3RAFK9Yf+5DfADfr+2jW0c8Ccq3/1rE84sr8eY91XDR3W91zMgvUBAxGOTlfYIx
	LY2wwBTmAX0oBFyjrQhI5bUQC1zSbkNlPS7bRypLbY1e1hwiq+QbSKfI0HdEbavP2G0QTTDeESq
	9GJZRN+Mx1LHDH3sYNcTfU5Ek//lDmrsaqSKCuER63R0ZOUfPMMX3KEudrwy3PuepN7Wd1IncKC
	/B0PkwzmC0ntUDGWsD2z7MqSEzLc=
X-Received: by 2002:a05:620a:1b9a:b0:93b:d7a1:ba0a with SMTP id af79cd13be357-93c15ea192emr14625085a.53.1789991251450;
        Mon, 21 Sep 2026 04:47:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1b9a:b0:93b:d7a1:ba0a with SMTP id af79cd13be357-93c15ea192emr14622585a.53.1789991251103;
        Mon, 21 Sep 2026 04:47:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd10273fsm227980625e9.7.2026.09.21.04.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:47:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:47:05 +0200
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,snps-eusb2-phy: Document the
 Nord eUSB2 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-usb-phy-v3-1-68aa02b12b96@oss.qualcomm.com>
References: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
In-Reply-To: <20260921-nord-usb-phy-v3-0-68aa02b12b96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OkWVP978AHDjCopobqmugeMjaSrrcUyZCtkMeO7a0LY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsRlKX/NX522+fz5o8SXg0j/kZd218m9x1CLn7
 rV/Ov2sLrSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEZSgAKCRAFnS7L/zaE
 w+C5D/9WAHNDSkD9yY+JwRqT8xagfRKG4okubXjOtWuc0cRBlijLz8PvKoANz3GQr1V6Yh0lihs
 dmv+tSCfu8UOyzgoTU1diLC3FtErAWCF0hffb5SfXIx65ioYccG4rdk9CdjrioP56vtJ7VZvzK2
 pGVFS1IK64MgxrOqdN2VyAGxvIRmecnyz5tpMD0I6DSRm4HHo0nLI3daHPdfv63zYvMaaGN2fa2
 a4pLgAtfKqmkTEaTmehjEq7RJYNKTjzFPwRuy0w3hjyBnW4Nsc1vMkxhuTVZej2UCZhJW/XRxM5
 xKVLNlazBsC0xWX40qmDrmojXQg7FGf9qj38qaFZBVr1bHojFqXIiUWqECsPKI7pHMNRWFvoI8U
 jERdnl+sDo0J/C0oVwQzp1GeHLAsUfX9T/vrhBHxwQj64WU3aidQfsDauwz+LiSqmLibUCzbalV
 IUF10RWuinPnqbL740KYkl8JtdJ/iNwUK/4O97/UK9y/QLL/OcqVehI2gg4otZRMUUuc9nIUmho
 Iacsm5+4/uoiqqccp7FOesB8JLxPGguuL6qNO2cwa8hc1b5r8wYZFl3d6U187BhiW9pPUklixEf
 pOu5oVBA+/BlVjGG8KCOUoVvw+jZbf5agP0nJrBB3Q4bDZM27RhZJITew0HIY37SL/k4cLKsq7/
 cwKHYc1wvBjXqCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX0LrQSixRg8tq
 Gms72Gn3FJCy79ABpaIKzd5no0WArREbgJ44TP1uiq8HADQF44JFr30XMcNSBsX5xPd/WHyQmHa
 1N/iw4jJmQD1jXguHx/DVkZzp26gIZQ=
X-Proofpoint-GUID: dgBXs23XYiSbLndlf0giHeuuPC9kpqC5
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab11954 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M4M-QYXtbn0wZdemrtAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfXzFAFZmu9eaJK
 3JTiQKJBka8Tc7T+OwllG2kNZfPH8hl28NPU8e9pa32V+hSSHFTsewAfqHIL1aksFBbE7X+X0n/
 vdocGcNkvWMEpcmk6tVj+BG5ikn8/k3hCZtfMhuRtqsz2XPWlqhPiC5cV57vcWyM+7xUUYajoNg
 YbIzroitg+GkpE7sYopcnpvHChYtOhJ2+NLfRJ8wjgApDGhAw2+niFiwPTzHcT+WAwtwcAOAZo3
 SQD08+sGO+2+SimhOhrMKp8nEuZFRHAxXxmw1bwGnButp3sMcrjZyMJTdb4rpC3CJ74b+ZWQNvC
 HLcB/UM9IT+wYCt0fhqCDWaYIBaH3TDY/FIpcNNlgtqOonm+/qy04XkYOGTOGzIFz7nlkqU0PJ5
 A+a4QBunE5k97uYCYoYzGrlATJglN92Sx1k1YQ4674NDfRiCjMmSOpLyQNmF9+Vnlde93fqACbV
 LKcRf/g8kqAac7SsHcQ==
X-Proofpoint-ORIG-GUID: dgBXs23XYiSbLndlf0giHeuuPC9kpqC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210170

Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC.
It is compatible with the sm8550 eUSB2 PHY.

While at it: On Nord SoC there are three eUSB2 PHYs but only two QUSB2PHY
block resets: the HS-only USB20 tile has no dedicated PHY reset and is
instead reset as a whole through the controller's own USB20_PRIM_BCR.

Make the 'resets' property optional for qcom,nord-snps-eusb2-phy only,
keeping it required for all the other compatibles.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml        | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 096f6b546632..931cd0e7d297 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
+              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
@@ -64,7 +65,17 @@ required:
   - clock-names
   - vdd-supply
   - vdda12-supply
-  - resets
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: qcom,nord-snps-eusb2-phy
+    then:
+      required:
+        - resets
 
 additionalProperties: false
 

-- 
2.47.3

