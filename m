Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616EB4014B2
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373362; cv=none; b=VrIHvI3zVoF8i4moVyb6iw5tjAq96Ye4CggB6vsMN7EVK/Noi6DwiP7+z/fFtUhH/LpBr7jzXcf7fGtQmxUEStzhqsp4wNuDgYo4qx5NuqY1cG28O3mUgJBxQSA7PdYmmz/c87UTlzM6iKjm7Ze+oL+SKqVKw2A1GAECxta7LRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373362; c=relaxed/simple;
	bh=jlii2RygDaFVp8G49dINP80ysQ2dlD4nKr+KCOo0HR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pIU77aC091R2mXc2zqboYfJ0tM8L6ARJwtOc9SCP6PYEKS85tD6ZUDVg1w3aXysKhxeKW3OUIoN75jg5P7RXE6PY/bwcK12hikWCcZ4dhsxO4pMhWnZLP4oCYg4pXA1cRGtw77HfxVmS1hfgGTjs57DQRtGkn8ShrOvqGJnIGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BY4Jc6Y6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MkV3Ej4w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BY4Jc6Y6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MkV3Ej4w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OG0JmR3039644
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IUAC+jjtSBO9goSoQoI4bJkMKCkl8ii9RN0NmZSrvUk=; b=BY4Jc6Y60hbRyG2f
	yYhv46RgKsLE46qP/CU9vt8iGSOgOWIUznthOq6XaDfEM29CAhP0GSkPi9mGFTZo
	fpO4ESoLXDVmj9XUEqt3sekjpE81GyP6NMHrfC0Ai5nqYnCGsVOGufKfhlwn4OP4
	Tlwnug9lNFHRxNVQleMi4Z/F8I8a+jFirQleU3upLC3OxMkh4sOCmDnQMRVgiUcA
	VaRtwzL1pOqnNNe3ApO16bksg+pCAHIiDx9RoceIa1SPqAjorlfMZisFSkML++OQ
	Tf/cOFp7eE0wLpzprbu6BGbsA32kvmk2CsQ/WnT8u+jQVFqHO1Dw9SV/BGfYdYwI
	/uUcDg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0hruk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 17:29:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so4006907eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774373360; x=1774978160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUAC+jjtSBO9goSoQoI4bJkMKCkl8ii9RN0NmZSrvUk=;
        b=MkV3Ej4wlStleDaoPIC/DTZd5GQRZMmabhXmri49DTzTK025+dHS7lFQ7B65SUnvqx
         v3R98/j0olCmOIdkLAPT0jUrXaaBDftrG1G+kDjS4hUEGfXDAbKdIpAp1NdFgIrIGM+b
         w/urCR584JIIqTyej5Uk5qApPTjnHEdXwWOBaruLMk+/AXsQB7q5zC5l7VXqYUjxruIS
         S3G3EuS5bIuIzs3ukak4ijZkBLa8g2CGdBRBvPN9yLRdj2BIaEOjJSNlW8yFABdJLatx
         ppNmJEtWD2xsPmGh9ax2XSoL5F4JxqYOcLPX39i7qia2PTbhFMesGvmS7TatOfplFa1a
         Mgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373360; x=1774978160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUAC+jjtSBO9goSoQoI4bJkMKCkl8ii9RN0NmZSrvUk=;
        b=L2iiiCinN/IMUD3K+YLBxdIJPPDXKI6UlYfedB22LyG2f42XIclg/fSA6XYKl+8YE1
         Qs9g1gp2xPCY2OX7KmLnpzYzRsEOY7B3yG9NIBS9E9bIiMf17dr3k3g8drcGDQn+SC7v
         NlFlJOfqOglsASCS1NT8wFeVl4oGzHyVc+xS6kudxlP2ztZryGLEU9FIIgstAi3dcXpw
         4iaMC9Fhm1/fkaaRTMG0eV1jHj88v67OI04WMBsXd41yX8eeoG+sCfrXt/OLgQjI0R7N
         rdP5u1030Cn9qW0Cksp9TPRSNsvPXVHLC/KvOYcnsSJcS/gI3gEmsbkPWgLcK/DXy4ae
         AmOA==
X-Gm-Message-State: AOJu0Yw/s+3XCdJmeChHRa5t1soAYhbizA3jQesOQSC/851kfP25w/WI
	UDt/TpWnf7VLdXYZw/ev4iFTZIp1UeAMSfMMLgkbckw848ijSKi1O7EGvB2nM7wwuhUPxqt/M1v
	o9Z+rQpSsi6KTgzwDWXzVSHkwo9dc4/SwPTfpdsKUp4oKnnKoD+crpXKWB+sQv0OM
X-Gm-Gg: ATEYQzy2Z1iszRs9QB4FgYVxRg+BjyVL+zbogwlW+cwjGbxtANc6nEmngSvz5GldIYc
	jw3NEyVZI/z+pgDDswFxzhy0ZuZh0mU4wPOU43WoiompGeGhUnWrKtJV9DDjIX9JzM9MazA2+dj
	WGGdAOuHBNj/QU03Nf9O/A+3FmldD8uWtuRUuBIM44BOFOhxbYFlg+zX4nfGnBGAMLqxmNbe3Kz
	yZUqgkSl6yYKpqvPvcRqyLlHUqGMzC5LGdVnfWVlwYpHDXr9wLxQCpjRz3SDJRp3qCqtN8JcnLY
	PIQHg4KSrC8QmGssA//O5p8/moHCOA27lddhSYvYOw8sv9JN//l/9tYbU1nW3eWdkgS8aNVR6ob
	Eu8LvV+MHNJVBrlWtEpC9T+PRUzndSnfN4gKLbTDVu/9Tre3O7tOJfXJ1ijyR4wsAa+KJuAYtp+
	I=
X-Received: by 2002:a05:7301:6794:b0:2ba:6c66:1f0d with SMTP id 5a478bee46e88-2c15d2a1f45mr129254eec.14.1774373359366;
        Tue, 24 Mar 2026 10:29:19 -0700 (PDT)
X-Received: by 2002:a05:7301:6794:b0:2ba:6c66:1f0d with SMTP id 5a478bee46e88-2c15d2a1f45mr129230eec.14.1774373358688;
        Tue, 24 Mar 2026 10:29:18 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm21275664eec.5.2026.03.24.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:29:18 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] =?UTF-8?q?dt-bindings:=20connector:=20Add=20role?= =?UTF-8?q?=E2=80=91switch=20provider=20phandle?=
Date: Tue, 24 Mar 2026 10:29:16 -0700
Message-Id: <20260324172916.804229-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEzNSBTYWx0ZWRfXyUZHmzqvF+XY
 hBWeBXm5XgZoGYcRtIKX8pGZFVilwhCqnoyuqZoWJIoQGr5OIjjkMIBwnJ13TQgDvcGrvYm4meH
 B/alvSiToqKCd27ZWX7SNcWDpLtWfvZtuuVMudBD4OaYqajmXvTk5UkBYzY4DzQYzwLCfskI2OW
 nIZalNhcLWh0LiX5YMUGivfdC4UkbKFjQuYbqY1tYVJfGx3ndnCvF35Sw95rU2jitfU1Cl9pqvH
 xiK2ccuukm6hipX3eeRP9uYrZpIkOkmcpcXloO0DYL9fzJclnXWXHM2VDdohguNO6WZMhLbLsBB
 laIPmX2FUWFZ75LvnuLKgy967pgC1lXxpunkz4A6/sQ1WOr+mxl6ZpFoDrg8MEZmK/MgxQzQwWL
 mL+G8VGHTKcPJhIo8xobeXAlqs8tIZSwhwg3iHQfIHDwujkQwqF7xgBayZ27omSP6pybyRu/CQE
 GGW9J8ZSleHO/P/1WFA==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c2c9f0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sZN-TDlxro2n473FCN0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: AwT1cbToZkGrjhY2iuj5qjsj9Q-07u-p
X-Proofpoint-GUID: AwT1cbToZkGrjhY2iuj5qjsj9Q-07u-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240135

Add an optional consumer→provider phandle on USB connectors to reference
the USB role-switch provider when no direct graph link exists. The DRD
controller remains the provider via its 'usb-role-switch' property.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/usb-connector.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 11e40d225b9f..ef8d3d26461b 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -95,6 +95,14 @@ properties:
       - device
       - dual
 
+  usb-role-switch:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the USB role-switch provider. The provider is typically
+      a dual-role (DRD) USB controller node that declares the boolean
+      'usb-role-switch' property. Use this when the connector is not
+      directly linked to the provider in the OF graph.
+
   typec-power-opmode:
     description: Determines the power operation mode that the Type C connector
       will support and will advertise through CC pins when it has no power
-- 
2.34.1

