Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7547C0F0
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531352; cv=none; b=PzijW39AbD0rjIzH75H5ETHwI9L1FYaMVN99LAQIqn1EKwM3lH7ZgAkv2557CPYg5ZwcCiWTrk01tfwr7d52RO+FoaXfns8gY+t8rkNw27tVXJhQc/ugyUB/dZk5l0YqUgXc2JgtOdkg+j7D3QnNsEhVHsoNUmehMc34vrvUiGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531352; c=relaxed/simple;
	bh=Pvv537cteRJa8ONribBapnslw73PT1p0fjousE548mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HX5na/hqkZETh+xO5wKwKQdwRjrwuDhCqvIb5GUGK/TQZkYPqQYCdCtJKpVT8iJ1lM1ILhuEEWTwqDoRdWqyEMlM38afWA8O1PyghqBFuwETvo35Iq4oq3cfjS8ZlxyQ59VKIEFE/npDjJ/IqjgrSy4pDOwka5YWRVZy/EAoZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ern8Sl93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qd50RT6A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ern8Sl93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qd50RT6A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HKlK4178448
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 07:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=; b=ern8Sl93TSHXvs07
	o+mVK6R2yHtcmwrxoRR5boRB+XaaPj1CaapFpBQBzWcA9sQvDXAIl7PhbmXUGFWb
	eQKXlfBF03raT5mkzD/WED5TOBb5lS5mKwrdUYmyETHw22kPD1TJTY5edJEkPJ1H
	kP8SIN/NIX+l/D2uarAz5ltdWuadZlO80AibJKRXswKRCdiXq6r1FTsIT8SKYHrN
	6PteTXq7mF1/8DjL9vJ32jwtQqfM2mG7hhQ9S7lUM+CCSI+AEmdyRud38eEXXb4m
	1mEVzrrXT5+mgVYJeGZ9Bum2ABgDqJefGIhaNBweGVt0mkOZ4MG+7DNiVplWuwJV
	QhmXOQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrtgpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:35:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso7419375eec.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531350; x=1792136150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=;
        b=Qd50RT6AK/oXf/E1YGF1p0piav5XVY0m0mx6jW9eRbopIyzOLHcYa3b/2BVDZ02gMe
         hNXyxvNJ30rGOmkGMPwI92pWIuaCHoj475J9RNQ82GjVs9yBZhjv7dLL3DSNWuQLydxy
         KhpepIOsXb2RYVTNxP/zBwfICpmgZxYWzmWo4n+zG8Vp8uJta524El4f2cy1+57zBOWr
         FuaNJyBjE4s04jZQHMRgnyTm8tGWOx9syFIuL/weVq6euorM87LAv4UJcQ3Z0k/qhS6g
         xlm1R4JXDOk+I5ZtECWQnUPlLxXTKh4MVKiohrgzhyxQE5VmGQ73ZvHzXJpSfhQxTlPW
         murg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531350; x=1792136150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=;
        b=X2RBtFdFxI/DyliQgoXcoWjYllBJUh1BFBa7/z4Gz4ti/3lMZMFa4akcbKeYIlEYsc
         i4XnMKIk9Ijibt3q/2RtL0yQZCTBD+wg70OuSeH6IIUF6O8xRpJPqT92mbniETctjbdf
         OG27zuo1U2KZ/WRZdv0MYI8w2gUjGnlpn99JuQWJw1dNJGEB8j8pO0yxafdldQQaDuwM
         kHj9MtxM4giZDbPIpEOlCTeNIBB1i2VblanNtVU9Q50k3fwBTFBA+dDmYl4upTw3nHKM
         oHIJgU3RzI4cf4W92AsOtI8Pdmt3WOWSGsvAmj1Q2V3V+/hyYaPDyPmTO6O4JJV+GTkI
         Zx9w==
X-Forwarded-Encrypted: i=1; AKwUvBxSGSDqmCkTcOrRE4ulf1eYAM32I9TW5siJO3yf2PTrziAtMoSJ6jUNAe/EWAXi5fFDh8KJdU3cOn5s@vger.kernel.org
X-Gm-Message-State: AFq9FYIV024stD9q7C3A2aYKQTIOE+d5ACsCFfg/TN+6zJLRwOv8pUCa
	2bkF9jIBv5IWVRF87BoulSbvTLIaFGDGPsmMRYdjjUzngFNveE84b6TdYbVEc/5DaMD4L/o/XoW
	MVx3/GA3XC1LArMyH8wrU6U3oWO8R436WP+PeW6rtCwUAu82qXOBp2ppKIdNXOnurb8vd7V4Dr5
	Y=
X-Gm-Gg: AYBFou3acHayJW/gg+V+C93OIhcbU+MGqlYPWyMIfi026fi3j9whdrA+NcWLuTc30Va
	ixruu1euCevyK5wUMdvyPT+evB9shgfYURhSaUay4uznNA3cO77yKpdT9iW+oa0f7Okor4zvdT3
	QUPltM28uNpprf9iWLDtteBTs0syj9iOCKzjkkaqawMn7lWzgN7UdHulg2pTHGVMGWDEhQuNCGH
	3mY1yNM7MjTMaDacIULfXDo7jvDWsGLZEhYW9C0R1ITNdS2ne/OFYjxwoFqO7ZYwIckikKRpXiM
	piNjoDy6mCMQivNeVKL3y0qHeOFV7FrZCxL7YuBLP2qQMNJmCbmEQYS0ABp6t70S7T50g9FASFe
	f4WLvSw9SzAV2OuUqecKo/mmksFsKK8g/ahNf
X-Received: by 2002:a05:7300:cc98:b0:353:5871:25a3 with SMTP id 5a478bee46e88-3537e0ce10amr1735478eec.22.1791531349482;
        Fri, 09 Oct 2026 00:35:49 -0700 (PDT)
X-Received: by 2002:a05:7300:cc98:b0:353:5871:25a3 with SMTP id 5a478bee46e88-3537e0ce10amr1735450eec.22.1791531348885;
        Fri, 09 Oct 2026 00:35:48 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm5658974eec.14.2026.10.09.00.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:35:48 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 13:05:39 +0530
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Add
 Nord SoCCP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac89956 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CHE7YESx92GpoR9PaLAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ey_RoBKQGHv4jQzMNoZaEii1dn-BAwPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX0T4gpOByGLGy
 4KF1IouA1yHf5LWhVpspRHApPJNE45e1zpYa91nRqMGqd3c6YGeP6XF98EK+HLMspNwyIOlhPe/
 icog6R9smHQBKqmonDw5u0xzQRw75ivC2FZbIqokHlDGVfqXOFrsnDjoJFPtS2W0wL+S0QbeEse
 Q6KjCgtJL5skJdLF8n727/6herLxz42uSnLQy/PgLhAGh2W1U29dm7/Db59ZfCl1kYHrjva3q2A
 2/yAosS1nZ3z+5blZAWSiX5B/VCqNCRqj9OcZoD/Q+cUix5RDcXXQs47QCGGdbz/XVb62Sy9GPh
 L9ENyGRW52pA5hI1bPxiJFe/9CJmHoc6V5KwhSgJeRHXxWAKYVqMLd/m3iVtkUVHnD9TyXnhd7T
 ffSZTXmG/kz7g4FYr7Pyi4WD9bdO2eV8xjVOZ6DufEVfXKwCZLH+T1kZ6JTZ9UM2Q3H8NwPlpae
 eIFRtIsCPaGK2UoVn9Q==
X-Proofpoint-ORIG-GUID: ey_RoBKQGHv4jQzMNoZaEii1dn-BAwPF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX6pOFSBxoWy+1
 OGLX+XVewRyeFT/CQe4r+FuSXHNi/SpjoRoQuWk6+sZL18VtoW2qDOQ5d1gFoKJSI3E67pdxs1g
 QCWT+YTxq1KqMxO4WTxBYT+ZgcsTV58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090030

The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
display and other use cases. It shares interrupts, SMP2P states, power
domains, and clock with Kaanapali SoCCP, except that it ships firmware
without a separate devicetree image, so it cannot use the Kaanapali
compatible as fallback.

Add qcom,nord-soccp-pas as a standalone compatible with a single
firmware-name/memory-region pair, while existing SoCs keep requiring two.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index e6c78d621d17..c1911124e073 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - qcom,glymur-soccp-pas
           - qcom,kaanapali-soccp-pas
+          - qcom,nord-soccp-pas
 
   reg:
     maxItems: 1
@@ -49,11 +50,13 @@ properties:
       - const: mx
 
   firmware-name:
+    minItems: 1
     items:
       - description: Firmware name of the SoC Control Processor
       - description: Firmware name of the SoCCP Devicetree
 
   memory-region:
+    minItems: 1
     items:
       - description: Memory region for main Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
@@ -93,6 +96,23 @@ required:
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-soccp-pas
+    then:
+      properties:
+        firmware-name:
+          maxItems: 1
+        memory-region:
+          maxItems: 1
+    else:
+      properties:
+        firmware-name:
+          minItems: 2
+        memory-region:
+          minItems: 2
 
 unevaluatedProperties: false
 

-- 
2.43.0

