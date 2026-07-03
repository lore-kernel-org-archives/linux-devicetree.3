Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE92B37DE89
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072458; cv=none; b=q39oO2vQGYjE6lNF43VmgcZN2Y7pddjk17LWIsW8gaMnfsF/IBmQT+ncit8OpmjgsEcsrvyOK+NwOXUPojYJfryhu5AInjcj/AlVpm+eNlGt1RLTUC73ltCipd0AoaaS/SeV5Nwb70TWx7Dx+bBbiB6JZoUgJI/F5IXoEP5lEd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072458; c=relaxed/simple;
	bh=RBigZqSD2Lucd1Ffeq4Dp/8N1Gy2Ye66tj8Ngrx8NU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDhGgBCb6zIgaZbvgfAR/Y5UAi8L0WI6puIB6inhu11PQZ6bC0VREJcU524Z/H13HGnYMN8M/dTRN7jv6LfZlUmaIfSuCw27mLxgeBUGqe5zX/Xlf+Byd4p+NPoTm6I5fnOhqry2tJYUnIaDoae5vBfSwOc49InGgWGT3NuhXj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQSzdkec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CnUYcxCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQSzdkec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CnUYcxCo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rlLv3134767
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 09:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	84tIQsO+bpww4xyAgTar+uWLZiJjvR9HhiTz7wnfd0c=; b=UQSzdkecz+F/U2gM
	Yqbg1vLaVd/TgJcsDoFPmDamfNPOY47R0/inE2sPOgAa0/eawM5QestwWT8Xnn+M
	t3pfJqTRcq7E0TwkIp4oPuNU129hLIYZy3Oxc1qtfETzPDIEdPjmXMwKrDKCJANJ
	23S6C17Z68bippoxAe3onJig9CJ0utrHxS0GeQ0P2UzGSZSn8JNGLOSXiAKQD9BY
	3sXLzj9AZmLDcgrOlOxIfOZmirBzmEEuVgL0ztOXP10rJ+xTW6r4mBk2tUzkV0zA
	qpWjtzt2zCEzJOy6pJaSaUFrlDygLQ0H/LSILjzPNHV1aajFC5ZFu+vt9bEZZzCK
	DuPBcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qchfp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:54:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9d8549d55so3634625ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783072453; x=1783677253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84tIQsO+bpww4xyAgTar+uWLZiJjvR9HhiTz7wnfd0c=;
        b=CnUYcxCoKttSLMftjp6U87P63+dEU1rstp+hPH5w0/BM+NJq9m1r8keNNHj/MFYUpM
         TjZT70tY1Evq9TEjIvgP3/MSCrA311mbBSOOBdmKuLQgICsngfU+DJQINIO8nIsoUjEj
         DZNlNXsR6j1QYkRTx9PwwZGbEh/HYgzy5GjVNmg6XyfN8aLuoZS1nyWiqegPriD+l3+s
         ymEWnY1lFz7Et83JD05KsEJ+gaHyXaAqt0lvWy5A6RXGas+wN9q2iv6JbQ1JrLKMihhv
         WIZa5MGQHJMAD2KV8CLrXPw/cXu1jTkUD27A1JqJ5YemQJT7eEO7r3TkBIdbbKrLLRtJ
         leGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072453; x=1783677253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=84tIQsO+bpww4xyAgTar+uWLZiJjvR9HhiTz7wnfd0c=;
        b=BNprjCh+wucMgn6uRtCdDaD3U9PgZTugkHdS9g7TPopq64br8Zo1QRv+3QiC/8RGsd
         vhQE87OiFKkgfvurH/VcoOPMPE+KSpOYmHV2oEL73Ihw+AYgbC3HmhbgSy679RqmPTWe
         mW8lhmZiAT5Cv5agl/KwHCFuzqnVeMKh4xrYKch/Td/l8JJv3+pfcjd/LAvIV9AKLSyI
         ZE1VR0EN4eoUT9TC+w1Q4houJ4JPPYg0iyf9nqqPXcY2G6Ne5GzytbvNapJWCjnSTVjX
         g9z/xbWzF2lTDket4ErxtIC8XSAjV9i9vRLsL8OYWgM2noF0xhdqQHdtolgXt2jMUb2F
         CBvw==
X-Forwarded-Encrypted: i=1; AHgh+RrUGsslGEtHpccfBzeufolWCfX114732Z2d8N/WVuQyEy/NgGKjsXt0zys6JmUb+TA7eGHZKd89nEsV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa7cN6MnyiCBcWwBZvKSYkwmmbISfWR8IiBQcj8aa3mCBopPhk
	dUPEb9xzmr5QTWqp2LoCJS4DyVXxVKiHBHGxGir37Kgj0QwgM+f9Jfw3Ml1eGoKLGWKORsmMEl8
	5RPCVAk8TYAVIyIOxs8aasKe4NQ5Bjws30yIr5suHHhXtRjiv4CzzAL8QWmqz+GpYRH6l/JgA
X-Gm-Gg: AfdE7ck8azR0lWEyBQYkkZ8ipsSjUINhdxGs2Fgbo7uEVGXAJYQKN0vOhdwaAWlgNEp
	o6qxtsKoN4Vg6yxZU5+AejekWdtGs0CM+omeFZj/Q0valc7T1qcRNcZIo1q2AQtgUK+xbYNNbBR
	KJm+BcS+9hISueCIy16oDI2jmGVFoN9SW9+UXz6OPIJ4DNPl4iSzldKyT9SjRMNlKHTm3rb9dfB
	ZWkVkdWgWw1Sv5iDjOxerx4Lo+OmSqdR+4vcPVo9sT2eggnV5AxryI4+sY6TDLhHqTTplXyk+wI
	1uDb4fKl5GUS8senC0rc5BrlghKdF53u/yCFQmAqN5rPb52i57WkwUxk5HkG0IWnbGS1uOjn4o6
	ufyA4sYFVUvka1zjLpK+m48C0Vv9xc/lW+VfumZC+Iv9wwg5ELq0sG269vXY/Lz8wtmZAkTkqkD
	JqJAkfBdKqjank4QINqW86HU0=
X-Received: by 2002:a17:903:8d0:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2cabf682f99mr51384145ad.22.1783072453245;
        Fri, 03 Jul 2026 02:54:13 -0700 (PDT)
X-Received: by 2002:a17:903:8d0:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2cabf682f99mr51383825ad.22.1783072452783;
        Fri, 03 Jul 2026 02:54:12 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7146914sm7034515ad.35.2026.07.03.02.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:54:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:23:41 +0530
Subject: [PATCH v2 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: Add Purwa IOT EVK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-ec_support_for_purwa_evk-v2-1-c59aac5c6aac@oss.qualcomm.com>
References: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
In-Reply-To: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783072444; l=1321;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=RBigZqSD2Lucd1Ffeq4Dp/8N1Gy2Ye66tj8Ngrx8NU4=;
 b=FYVJucEVhlOTP4cRQ2zGY48mtDpsOYgmxb9OPl+ZA21rcFq1ntRuTF/tP7PovCrmYDK5nxaPQ
 CvW+EkLjY/mAJQbhNYgHL0f8Mk1O+gmtqVfXyRa705qwHCxtw8tjCkv
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: rV1eeNeR3OBd9TLms_klxnd18iIrELcC
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a4786c6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Y1ZMbBkP95eM7aff42kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: rV1eeNeR3OBd9TLms_klxnd18iIrELcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NSBTYWx0ZWRfX961jAgY+zSUR
 lEUZFoLIVp6yDAfNAW2i8KJWEAKlbUMbQuC+v6/o9bNT64crHtEyAFD6wSuCUH0U1rtv/fPdUZj
 OJXyUIURxrJJxQGwoQE4z7kQk483Kfn6GtXWS7cdBHQZzKjKZaVGR22QnZOTo2u7gPNaaijDUX/
 T9JUYF2kY4sEQ89QYCcvO2EAjJQibSnuJHVV00k5sTMfqzQQIFIf9OM+90W4KTeF4kGmdLzGKQr
 9QWvaJR6Im+MgRR54lsaiVB6A8318n+YzARXArgo01NXaDUVordQHRBxb0tbJ70VRCt3e6NnrLN
 3pHQehB24avCdsU4pDVZSqW6Jxs3CrvjcWJbA73EoDYT1QkkvXxCl8Z9SD/ugAugI1Xa+ekymiY
 gXJMZKtejgh4ndNPxqwDuAIdRl6f357WsJMcNXPhWlAhOGbVtAj85vGEID1zfz5qg1KUixMPnPT
 yAVybHNjDQ8Zva24LfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NSBTYWx0ZWRfX12jlTLdjFqMJ
 0hLHNVaziLszl/iXWcBNEw6r6OLc3qO9vUnilr5TfYk+98pbJJNCLqL8A90GG8C8Gz6juqUoExo
 6T2ZMHWiWAe4AYhbGPFDwXdEdGw4klg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030095

Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
found on Purwa IOT EVK boards.

Like the CRD, the Purwa IOT EVK carries an on-board embedded controller,
provided by ITE and running on a separate MCU, which handles fan control,
temperature sensors and EC state-change/suspend notifications. The existing
Hamoa IOT EVK documents the same EC via qcom,hamoa-iot-evk-ec.

Like the other reference designs, it uses qcom,hamoa-crd-ec as its fallback
compatible.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..c07483aa5937 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,glymur-crd-ec
               - qcom,hamoa-iot-evk-ec
+              - qcom,purwa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:
           - qcom,hamoa-crd-ec

-- 
2.34.1

