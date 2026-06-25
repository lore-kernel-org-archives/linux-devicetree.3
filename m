Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280B32B10B
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782383540; cv=none; b=mZ9njFfPC++6Z9aOilsL+FEREcOgyKz9zHgaS0CZiZI2GNR3d503T4SU7jhUUSgCh3HRyazWYdD9buAY4RbI0JNCuSy38m5q1tByCBJkCTAEcL8oHMuP0YZIVuZebfxre3ZUQefQHtQ1butLqikWnUW1uWXL2ACh5YjFeMj2EIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782383540; c=relaxed/simple;
	bh=C2j8ymWNMP4cWbdNoG5bAn7jN+qA/hasUEd/DfyZ4uM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cYr+p6ZVBh/RtiZNTO74tDv3i2D9vQpZcOaDc0fQ+vpknlUV90i3T3+1t+0ADkMwForswe1eI00YYiKyM8OvtCeobHkb7ZCV2PYx+oDPHr1N2IauyqUiMWtNYx5XNz+CnYNOFe+s7dAKmJkD/Z4to1U3rUm4ZIScFMDmYOBMSIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfSTYFJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jw6+pIfa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfSTYFJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jw6+pIfa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9kJBr2048736
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LSsvOSKf+JaBPPv2gz2jGn
	0kx8lV0K+uiQpfF+s3krY=; b=VfSTYFJ7pC0uxUeuEmj1+Md6jz2QgE8AiuLdI4
	CAJzcQt6SP5RTCqp+hL5u4rg3rUZgBThynR2Mnt7AwmC8yCwzbGm61/9fpSFa2Jl
	60pyexo/SgcLWP5GVW9ZxTte1EW76y2WpYJZuP5pa6yTIbd2/3w0uGR18QrMflfl
	pNRjOUl5wAeURlR2EcxEb6W3/2OoxT2nc7kpQ5J4lXCL1iiM1ij7OLt7re05orWQ
	fgB4HcPkWiO+KOtJhAmaj2yXecmSawBwMWTJGR25+O5D+8kBYf8cxKREDjFfL9kW
	OUqAEMNANaVmoNUchQNVt5PtQOrKaJZWdwbx7tE2QjHLH/rw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhmrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 10:32:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139c6673856so4024613c88.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782383537; x=1782988337; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSsvOSKf+JaBPPv2gz2jGn0kx8lV0K+uiQpfF+s3krY=;
        b=Jw6+pIfarNbBQSgkCvFHEoTrvI4dqsS34Xme4kIjm122SK9uRJ3ZTGblnTukR+71eY
         f2Tgm9eG2Ur2W8YQz6J+nCbWEPIJ8JaBCqJQnKJo2q8zykUq824c0d3gmPhutZAABXmS
         pM9WyNYQwZQn2cspSzqs3QWFHHv8+i1mlmXhYsXz6xqYIwWe4Ucvpwqn9fXl/+ZwZRrl
         7CNo41Nr7BbaJnLyO6LtYpdF63wKw6WJBTeHDCUm/G0NXgNIIDxLkuhBZi/ysavzasNz
         4oO06CGEoHQaPUgZoM+3X1rD4aTGsgFeMSe7gwLSj27PvF6ThJ4Ev7jMwIxny9Qr6Qva
         nyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782383537; x=1782988337;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSsvOSKf+JaBPPv2gz2jGn0kx8lV0K+uiQpfF+s3krY=;
        b=U2NDla9/mGAhNZLSmzjfr+6exhxlUV/f55byL52zVWWP1L1lHpgSj1cPjgObdN09oq
         vx7lx4QhyazpyOjBGsGTgf7+I2Uw5/j4YYPFG2Lh0xuVuT/r41Lg6deKSWNV0xyzcr/d
         hp/xBRbjc4c1SCF0S4CsTDacNDK3aylrWjxiwGo1+KYdMf1zG1QzLQl29kK/CMUUhHUG
         rePZGz6YAhexaBdjO+BzxagC5bBhCnLuNYl9FGN/FMAGp59VuOgaG8+1eWlOKDbc6B/3
         7j05o0D72qxa9/PU97bXvVqOK7l1CGVmNvv3yXcBH15bwNUENq7azTSUZzGOZZYDbhoP
         TRKw==
X-Forwarded-Encrypted: i=1; AFNElJ8t/Q8yAbUqze5eV8qRJSTcf/FjNXKpwrzeGfGcpP0PiqsZaDPixxCEzYDZT+yVL/EsA1eJNd+D0TB7@vger.kernel.org
X-Gm-Message-State: AOJu0YzyGpm9IO1Y7mzOWCcx0ezBdj+e3/u3oA9gY89rpYitD2eKlzjB
	R1W8DGnbTVFMxqNGlnFPjjcVoMpYkfySZHsSEO1NC5q3yt8jh2YTdm5nf4kJSD0F99lZSSxNI6w
	1AGOICt/slfADrrMDZU8nUXUeNHasjBpqHGV2nHDE+yqbvtWMDUDxf7GAiuR1300EVodF2mmF
X-Gm-Gg: AfdE7cnYxlrBXBZwjAfuZzTzeCq9HaW3GUYsfIk6ALi+a5bMXqBAox0j/rHsow3jl9B
	TNAK0uegZMzxTll+K7EFAaDux7aXyx/A3HI6rY2kofJeX8JlrHCR7rRgZQMGKiH6TTcMi+aQDZU
	6FX6aOusyARS7JD+Wmbm5UBD0fJ5EMYepVTCiZAsFB1lFUBV1Hp8kSK5BsGdk4vPhyh8yXJOgzt
	qKqDTcSZrK4qmLGNdDnHwe+kPRCD2ggMsGOW7HehKjwEYkxD+WP7svLHdPnKzCXJS+3SPmv4I3b
	RlRN8lR/VjgvkFylJFs0MbIQADHG+haR0qUmWYDANSWcdOs5WlA0oRZWOiv8/9dNVOQjtT+bWaf
	jn9/b7P6oXXbuxUZVdOO+HBZtEdi1d6TqYYP4ZHiEZsD2JWoHkYpNuxWweoqyew6Xxvxo3AU7BQ
	15+GPPGK1qWw1t/SOBRHeAlta1o1+/UeWkgMnRQ3ca1krRow==
X-Received: by 2002:a05:7022:69e:b0:136:b67e:93e6 with SMTP id a92af1059eb24-139dbac9d7amr1897061c88.37.1782383536601;
        Thu, 25 Jun 2026 03:32:16 -0700 (PDT)
X-Received: by 2002:a05:7022:69e:b0:136:b67e:93e6 with SMTP id a92af1059eb24-139dbac9d7amr1897032c88.37.1782383535947;
        Thu, 25 Jun 2026 03:32:15 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f55b04sm7282265c88.4.2026.06.25.03.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:32:14 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 16:02:02 +0530
Subject: [PATCH] dt-bindings: arm: qcom: sort compatibles alphabetically by
 base SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-reorg_qcom_binding-v1-1-f2c6501f7401@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKEDPWoC/yXMQQqDMBBA0avIrBuIqYTQq4iIScY4QhM70SKId
 ze2y7f4/4CMTJjhVR3A+KVMKRbUjwrcNMSAgnwxKKm01OopGBOH/uPSu7cUPcUgpG6M9Tgabw2
 UcGEcaf9N2+7vvNkZ3Xqf4DwvwuE15XYAAAA=
X-Change-ID: 20260623-reorg_qcom_binding-0648bdef8db8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 1iY04Gr4KIjGhlmTl2R_tZVFcVc_npZ8
X-Proofpoint-ORIG-GUID: 1iY04Gr4KIjGhlmTl2R_tZVFcVc_npZ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MCBTYWx0ZWRfXyXjm0hoRunYc
 +5q6zwnpUpCyiFar7W0HZ3lTXj4xu+yUZTyZ1TbS06JN2ZnwzbIn4CfMdO7mccd0txt9OQn3gA/
 xbr5sLQFZTFI/7bABgGK+kJ/AlNBTh0=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3d03b1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iYw7bn2tY6KM8CvLDdUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MCBTYWx0ZWRfX/WfT3IieB7G8
 J2IO5Qlm+DW7D7jHOONrawLp5oh+aUgKoe27o+y5HxltjohTSqHj86enXBcbxqc0GmpwVAGJ1Jh
 J1C/b9T1X5zsTMbregSM5ThkB5AbeBBsbN1XjpU4BK7MZXvLEeErb/SoXp4r6Ptsl+ydbqURy7R
 1lVGmYDM35V+dwRDkz4r0yHWqyh26taSheSSxsCnlhxRzG3c2hZH7VgnFTbNtI0yLFHBWy8R6ow
 ZB2n7j+9Uw59xpvw1USYrIAb03/yr2M+WkBfsc26JZJUvMtENEOtjkw+950ERjXPPUHg9DpkfKl
 88fdM+HEhcsm+9RmqnyamUg0iHK6kKtK1Nni5ZUpmIiSj962NNuF/ypGGU+2O08gUT1Flg6jwjU
 a8wb/a61xPrKhFgFmTIJXncWHCdmgIJS8S+/dZ8hJ8j75W5usFBfF/68PamQm/CHoyLK+jg6+ZB
 kNl7FG8u9uF/UcglIfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250090

The compatible entries in qcom.yaml were not in alphabetical order by
their base SoC compatible string (the last const: qcom,* in each block),
making the file harder to audit and maintain. Sort the entries for
better maintenance.

No functional change; reordering only.

Assisted-by: Claude:claude-sonnet-4-6
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 490 ++++++++++++------------
 1 file changed, 245 insertions(+), 245 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..dfbc82377fcf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -49,18 +49,31 @@ properties:
               - qcom,apq8074-dragonboard
           - const: qcom,apq8074
 
-      - items:
-          - enum:
-              - qcom,apq8060-dragonboard
-              - qcom,msm8660-surf
-          - const: qcom,msm8660
-
       - items:
           - enum:
               - qcom,apq8084-mtp
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - sony,karin_windy
+          - const: qcom,apq8094
+
+      - items:
+          - enum:
+              - arrow,apq8096-db820c
+              - inforce,ifc6640
+          - const: qcom,apq8096-sbc
+          - const: qcom,apq8096
+
+      - items:
+          - const: arrow,apq8096sg-db820c
+          - const: arrow,apq8096-db820c
+          - const: qcom,apq8096-sbc
+          - const: qcom,apq8096sg
+          - const: qcom,apq8096
+
       - items:
           - enum:
               - qcom,eliza-mtp
@@ -73,102 +86,126 @@ properties:
 
       - items:
           - enum:
-              - qcom,mahua-crd
-          - const: qcom,mahua
+              - 8dev,jalapeno
+              - alfa-network,ap120c-ac
+          - const: qcom,ipq4018
 
       - items:
           - enum:
-              - fairphone,fp6
-              - nothing,asteroids
-          - const: qcom,milos
+              - qcom,ipq4019-ap-dk01.1-c1
+              - qcom,ipq4019-ap-dk04.1-c3
+              - qcom,ipq4019-ap-dk07.1-c1
+              - qcom,ipq4019-ap-dk07.1-c2
+              - qcom,ipq4019-dk04.1-c1
+          - const: qcom,ipq4019
 
       - items:
           - enum:
-              - microsoft,dempsey
-              - microsoft,makepeace
-              - microsoft,moneypenny
-              - motorola,falcon
-              - samsung,ms013g
-              - samsung,s3ve3g
-          - const: qcom,msm8226
+              - qcom,ipq5018-rdp432-c2
+              - tplink,archer-ax55-v1
+          - const: qcom,ipq5018
 
       - items:
           - enum:
-              - htc,memul
-              - microsoft,superman-lte
-              - microsoft,tesla
-              - motorola,peregrine
-              - samsung,matisselte
-          - const: qcom,msm8926
-          - const: qcom,msm8226
+              - qcom,ipq5210-rdp504
+          - const: qcom,ipq5210
 
       - items:
           - enum:
-              - wingtech,wt82918hd
-          - const: qcom,msm8929
+              - qcom,ipq5332-ap-mi01.2
+              - qcom,ipq5332-ap-mi01.3
+              - qcom,ipq5332-ap-mi01.6
+              - qcom,ipq5332-ap-mi01.9
+          - const: qcom,ipq5332
 
       - items:
           - enum:
-              - asus,z00t
-              - huawei,kiwi
-              - longcheer,l9100
-              - samsung,a7
-              - sony,kanuti-tulip
-              - square,apq8039-t2
-              - wingtech,wt82918
-              - wingtech,wt82918hdhw39
-          - const: qcom,msm8939
+              - qcom,ipq5424-rdp466
+          - const: qcom,ipq5424
 
       - items:
           - enum:
-              - sony,kugo-row
-              - sony,suzu-row
-          - const: qcom,msm8956
+              - qcom,ipq6018-cp01
+              - qcom,ipq6018-cp01-c1
+          - const: qcom,ipq6018
 
       - items:
           - enum:
-              - qcom,msm8960-cdp
-              - samsung,expressatt
-          - const: qcom,msm8960
+              - mikrotik,rb3011
+              - qcom,ipq8064-ap148
+          - const: qcom,ipq8064
 
       - items:
           - enum:
-              - sony,huashan
-          - const: qcom,msm8960t
-          - const: qcom,msm8960
+              - qcom,ipq8074-hk01
+              - qcom,ipq8074-hk10-c1
+              - qcom,ipq8074-hk10-c2
+          - const: qcom,ipq8074
 
       - items:
           - enum:
-              - lge,hammerhead
-              - samsung,hlte
-              - sony,xperia-amami
-              - sony,xperia-honami
-              - sony,xperia-togari
-          - const: qcom,msm8974
+              - qcom,ipq9574-ap-al02-c2
+              - qcom,ipq9574-ap-al02-c2-emmc
+              - qcom,ipq9574-ap-al02-c6
+              - qcom,ipq9574-ap-al02-c7
+              - qcom,ipq9574-ap-al02-c7-emmc
+              - qcom,ipq9574-ap-al02-c8
+              - qcom,ipq9574-ap-al02-c9
+          - const: qcom,ipq9574
 
       - items:
           - enum:
-              - fairphone,fp2
-              - htc,m8
-              - oneplus,bacon
-              - samsung,klte
-              - sony,xperia-aries
-              - sony,xperia-castor
-              - sony,xperia-leo
-          - const: qcom,msm8974pro
-          - const: qcom,msm8974
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
 
       - items:
           - enum:
-              - samsung,kltechn
-          - const: samsung,klte
-          - const: qcom,msm8974pro
-          - const: qcom,msm8974
+              - qcom,kaanapali-mtp
+              - qcom,kaanapali-qrd
+          - const: qcom,kaanapali
 
       - items:
           - enum:
-              - longcheer,l9360
-          - const: qcom,msm8976
+              - qcom,mahua-crd
+          - const: qcom,mahua
+
+      - description: Sierra Wireless MangOH Green with WP8548 Module
+        items:
+          - const: swir,mangoh-green-wp8548
+          - const: swir,wp8548
+          - const: qcom,mdm9615
+
+      - items:
+          - enum:
+              - fairphone,fp6
+              - nothing,asteroids
+          - const: qcom,milos
+
+      - items:
+          - enum:
+              - microsoft,dempsey
+              - microsoft,makepeace
+              - microsoft,moneypenny
+              - motorola,falcon
+              - samsung,ms013g
+              - samsung,s3ve3g
+          - const: qcom,msm8226
+
+      - items:
+          - enum:
+              - htc,memul
+              - microsoft,superman-lte
+              - microsoft,tesla
+              - motorola,peregrine
+              - samsung,matisselte
+          - const: qcom,msm8926
+          - const: qcom,msm8226
+
+      - items:
+          - enum:
+              - qcom,apq8060-dragonboard
+              - qcom,msm8660-surf
+          - const: qcom,msm8660
 
       - items:
           - enum:
@@ -217,11 +254,28 @@ properties:
               - xiaomi,tiare
           - const: qcom,msm8917
 
+      - items:
+          - enum:
+              - wingtech,wt82918hd
+          - const: qcom,msm8929
+
       - items:
           - enum:
               - xiaomi,land
           - const: qcom,msm8937
 
+      - items:
+          - enum:
+              - asus,z00t
+              - huawei,kiwi
+              - longcheer,l9100
+              - samsung,a7
+              - sony,kanuti-tulip
+              - square,apq8039-t2
+              - wingtech,wt82918
+              - wingtech,wt82918hdhw39
+          - const: qcom,msm8939
+
       - items:
           - enum:
               - flipkart,rimob
@@ -232,6 +286,57 @@ properties:
               - xiaomi,vince
           - const: qcom,msm8953
 
+      - items:
+          - enum:
+              - sony,kugo-row
+              - sony,suzu-row
+          - const: qcom,msm8956
+
+      - items:
+          - enum:
+              - qcom,msm8960-cdp
+              - samsung,expressatt
+          - const: qcom,msm8960
+
+      - items:
+          - enum:
+              - sony,huashan
+          - const: qcom,msm8960t
+          - const: qcom,msm8960
+
+      - items:
+          - enum:
+              - lge,hammerhead
+              - samsung,hlte
+              - sony,xperia-amami
+              - sony,xperia-honami
+              - sony,xperia-togari
+          - const: qcom,msm8974
+
+      - items:
+          - enum:
+              - fairphone,fp2
+              - htc,m8
+              - oneplus,bacon
+              - samsung,klte
+              - sony,xperia-aries
+              - sony,xperia-castor
+              - sony,xperia-leo
+          - const: qcom,msm8974pro
+          - const: qcom,msm8974
+
+      - items:
+          - enum:
+              - samsung,kltechn
+          - const: samsung,klte
+          - const: qcom,msm8974pro
+          - const: qcom,msm8974
+
+      - items:
+          - enum:
+              - longcheer,l9360
+          - const: qcom,msm8976
+
       - items:
           - enum:
               - lg,bullhead
@@ -240,11 +345,6 @@ properties:
               - xiaomi,libra
           - const: qcom,msm8992
 
-      - items:
-          - enum:
-              - sony,karin_windy
-          - const: qcom,apq8094
-
       - items:
           - enum:
               - huawei,angler
@@ -256,20 +356,6 @@ properties:
               - sony,suzuran-row
           - const: qcom,msm8994
 
-      - items:
-          - enum:
-              - arrow,apq8096-db820c
-              - inforce,ifc6640
-          - const: qcom,apq8096-sbc
-          - const: qcom,apq8096
-
-      - items:
-          - const: arrow,apq8096sg-db820c
-          - const: arrow,apq8096-db820c
-          - const: qcom,apq8096-sbc
-          - const: qcom,apq8096sg
-          - const: qcom,apq8096
-
       - items:
           - enum:
               - oneplus,oneplus3
@@ -303,86 +389,6 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
-      - items:
-          - enum:
-              - 8dev,jalapeno
-              - alfa-network,ap120c-ac
-          - const: qcom,ipq4018
-
-      - items:
-          - enum:
-              - qcom,ipq4019-ap-dk01.1-c1
-              - qcom,ipq4019-ap-dk04.1-c3
-              - qcom,ipq4019-ap-dk07.1-c1
-              - qcom,ipq4019-ap-dk07.1-c2
-              - qcom,ipq4019-dk04.1-c1
-          - const: qcom,ipq4019
-
-      - items:
-          - enum:
-              - qcom,ipq5018-rdp432-c2
-              - tplink,archer-ax55-v1
-          - const: qcom,ipq5018
-
-      - items:
-          - enum:
-              - qcom,ipq5210-rdp504
-          - const: qcom,ipq5210
-
-      - items:
-          - enum:
-              - qcom,ipq5332-ap-mi01.2
-              - qcom,ipq5332-ap-mi01.3
-              - qcom,ipq5332-ap-mi01.6
-              - qcom,ipq5332-ap-mi01.9
-          - const: qcom,ipq5332
-
-      - items:
-          - enum:
-              - qcom,ipq5424-rdp466
-          - const: qcom,ipq5424
-
-      - items:
-          - enum:
-              - mikrotik,rb3011
-              - qcom,ipq8064-ap148
-          - const: qcom,ipq8064
-
-      - items:
-          - enum:
-              - qcom,ipq8074-hk01
-              - qcom,ipq8074-hk10-c1
-              - qcom,ipq8074-hk10-c2
-          - const: qcom,ipq8074
-
-      - items:
-          - enum:
-              - qcom,ipq9574-ap-al02-c2
-              - qcom,ipq9574-ap-al02-c2-emmc
-              - qcom,ipq9574-ap-al02-c6
-              - qcom,ipq9574-ap-al02-c7
-              - qcom,ipq9574-ap-al02-c7-emmc
-              - qcom,ipq9574-ap-al02-c8
-              - qcom,ipq9574-ap-al02-c9
-          - const: qcom,ipq9574
-
-      - items:
-          - enum:
-              - qcom,ipq9650-rdp488
-          - const: qcom,ipq9650
-
-      - items:
-          - enum:
-              - qcom,kaanapali-mtp
-              - qcom,kaanapali-qrd
-          - const: qcom,kaanapali
-
-      - description: Sierra Wireless MangOH Green with WP8548 Module
-        items:
-          - const: swir,mangoh-green-wp8548
-          - const: swir,wp8548
-          - const: qcom,mdm9615
-
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
@@ -403,6 +409,20 @@ properties:
               - thundercomm,rubikpi3
           - const: qcom,qcm6490
 
+      - items:
+          - enum:
+              - qcom,qcs404-evb-1000
+              - qcom,qcs404-evb-4000
+          - const: qcom,qcs404-evb
+          - const: qcom,qcs404
+
+      - items:
+          - enum:
+              - arduino,monza
+              - qcom,monaco-evk
+              - qcom,qcs8300-ride
+          - const: qcom,qcs8300
+
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
         items:
           - enum:
@@ -416,6 +436,31 @@ properties:
               - qcom,qru1000-idp
           - const: qcom,qru1000
 
+      - items:
+          - enum:
+              - qcom,sa8155p-adp
+          - const: qcom,sa8155p
+
+      - items:
+          - enum:
+              - qcom,sa8295p-adp
+              - qcom,sa8540p-ride
+          - const: qcom,sa8540p
+
+      - items:
+          - enum:
+              - qcom,sa8775p-ride
+              - qcom,sa8775p-ride-r3
+          - const: qcom,sa8775p
+
+      - items:
+          - enum:
+              - qcom,lemans-evk
+              - qcom,qcs9100-ride
+              - qcom,qcs9100-ride-r3
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:
@@ -828,14 +873,6 @@ properties:
           - const: google,zombie-sku514
           - const: qcom,sc7280
 
-      - description: Xiaomi Poco F1
-        items:
-          - enum:
-              - xiaomi,beryllium-ebbg
-              - xiaomi,beryllium-tianma
-          - const: xiaomi,beryllium
-          - const: qcom,sdm845
-
       - items:
           - enum:
               - lenovo,flex-5g
@@ -853,6 +890,11 @@ properties:
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp
 
+      - items:
+          - enum:
+              - inforce,ifc6560
+          - const: qcom,sda660
+
       - items:
           - enum:
               - lenovo,tbx605f
@@ -867,11 +909,6 @@ properties:
               - sony,voyager-row
           - const: qcom,sdm630
 
-      - items:
-          - enum:
-              - inforce,ifc6560
-          - const: qcom,sda660
-
       - items:
           - enum:
               - fairphone,fp3
@@ -899,74 +936,13 @@ properties:
           - const: google,bonito
           - const: qcom,sdm670
 
-      - items:
-          - enum:
-              - qcom,sdx55-mtp
-              - qcom,sdx55-telit-fn980-tlb
-              - qcom,sdx55-t55
-          - const: qcom,sdx55
-
-      - items:
-          - enum:
-              - qcom,sdx65-mtp
-          - const: qcom,sdx65
-
-      - items:
-          - enum:
-              - qcom,sdx75-idp
-          - const: qcom,sdx75
-
-      - items:
-          - enum:
-              - qcom,ipq6018-cp01
-              - qcom,ipq6018-cp01-c1
-          - const: qcom,ipq6018
-
-      - items:
-          - enum:
-              - qcom,qcs404-evb-1000
-              - qcom,qcs404-evb-4000
-          - const: qcom,qcs404-evb
-          - const: qcom,qcs404
-
-      - items:
-          - enum:
-              - arduino,monza
-              - qcom,monaco-evk
-              - qcom,qcs8300-ride
-          - const: qcom,qcs8300
-
-      - items:
-          - enum:
-              - qcom,qcs615-ride
-              - qcom,talos-evk
-          - const: qcom,qcs615
-          - const: qcom,sm6150
-
-      - items:
-          - enum:
-              - qcom,sa8155p-adp
-          - const: qcom,sa8155p
-
-      - items:
-          - enum:
-              - qcom,sa8295p-adp
-              - qcom,sa8540p-ride
-          - const: qcom,sa8540p
-
-      - items:
-          - enum:
-              - qcom,sa8775p-ride
-              - qcom,sa8775p-ride-r3
-          - const: qcom,sa8775p
-
-      - items:
+      - description: Xiaomi Poco F1
+        items:
           - enum:
-              - qcom,lemans-evk
-              - qcom,qcs9100-ride
-              - qcom,qcs9100-ride-r3
-          - const: qcom,qcs9100
-          - const: qcom,sa8775p
+              - xiaomi,beryllium-ebbg
+              - xiaomi,beryllium-tianma
+          - const: xiaomi,beryllium
+          - const: qcom,sdm845
 
       - items:
           - enum:
@@ -989,6 +965,23 @@ properties:
               - xiaomi,polaris
           - const: qcom,sdm845
 
+      - items:
+          - enum:
+              - qcom,sdx55-mtp
+              - qcom,sdx55-telit-fn980-tlb
+              - qcom,sdx55-t55
+          - const: qcom,sdx55
+
+      - items:
+          - enum:
+              - qcom,sdx65-mtp
+          - const: qcom,sdx65
+
+      - items:
+          - enum:
+              - qcom,sdx75-idp
+          - const: qcom,sdx75
+
       - items:
           - enum:
               - oneplus,billie2
@@ -1024,6 +1017,13 @@ properties:
               - xiaomi,willow
           - const: qcom,sm6125
 
+      - items:
+          - enum:
+              - qcom,qcs615-ride
+              - qcom,talos-evk
+          - const: qcom,qcs615
+          - const: qcom,sm6150
+
       - items:
           - enum:
               - sony,pdx213

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260623-reorg_qcom_binding-0648bdef8db8

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

