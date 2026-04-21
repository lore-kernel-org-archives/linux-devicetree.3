Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1553BE631
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769013; cv=none; b=i4WmjyyfKfrd2k0kNzMhZpXIyu8jktmDMbKsoJxBbpLLhJaJDbrqB1xS25J+zWCTopwRezYHYLcIdGcF0/Siln4+bXBgLf8bXD0cjb1R36iE9DrtLz5j6iRSXomqZAVUg4bbsj+2QmnadxPwxzCZgSu123uDxBJl6HHctHmGPYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769013; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mdGnkVkFlH518+l2Y5V54CuywsNr+QAPAkkjwX369YtQPgkbBzmS+IhPF6W4uICPw6ykRUdvt3Ukvvtn7iXsz2dYgINGPbJ0DE51LZQdZ+3iS0p27H5yqMD8fg4AcdfTlkEp3f/KQB2kHLcZ9/JLWryAJ4QEb63v35wiqb0x0N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2Vicl+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2XaGInN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2Vicl+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2XaGInN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9J2UE046050
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=T2Vicl+PjCLK69W5
	feWHLqGAh88oSlaRwtcu129JfQ34X1Uus7xOIsAgZ3rBUQWQXU77/Etiun81dP5b
	uR1plywNmeoACsmJV+16Zx31Lmj35IoWLRXNeyg/wBXp11kyIhrS9YoMDq1JLLuv
	5i1E7NQjJi9TrrLRbIPRbWYqU+t3CzjGZG3LYS2onqw88HrsahflCt1yw1G9LiC1
	gS2eMHfOVLWuFFyKkGjKzVbqba14Wr68dC60GE6uc0j+Y0Fk2d0Qml5ExyN9bT6Y
	L9kF7AnGXOmhOCg8Imp+uugIMDYXoH3xTZy+pwOJdkgXsSm/2YxsK0fJG0BcySQ/
	QGM5VA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp0y1smpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 10:56:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so2167568a12.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 03:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769009; x=1777373809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=X2XaGInNpJpK5R8qFMKe4UET08poabkMDOwGDn5KOcjEXy/uDyUZ76BF+J6fUTa8xt
         rqZfiZRkCbIGWXB1CsJZqYrIzZ1LF0k9oyS4l9UZqdXJcBV659xOogC5nTHXkXLXxVA6
         I25aACwGqGXq4h7kjD+heHiTbgAEvFyCW1UYuWPGz0oDj7p0jA4vN80ycZBZoXYCOkTF
         2AOSVans5W6mKssEZs4PJ0tcIUnIi9qkgtDIuMuMhh3fNvSTqURQPyc/KMNVp/07h8ty
         KfLqnJJ3OdYQTcEm4AyjI28KXC8q2MGR7S6oHpHVQ63Kmf7UPINSbZpWATbjs1b/dYOn
         7Atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769009; x=1777373809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=Lv2JCQ3ftyDBXnEtXqDrz+IWp4zoNQZ2fpnPdfHJ0A7ry78gNfbinr2Q6VN2s0W2Uh
         zk2DgP1EOzPtD8o8pEl/v88gykFimXB3mukF5piJzBZMszNNpsIrsD6g7I8t/X7WRysV
         jO8cNq8qzAXDaeAcGXkIS45QOWmbnnSLOk7/rSVNkItTiXMX2Pk+WW1KsKsQI1puNIO0
         49lHcd6csd6YGJrVMO+qwdReJEWJ0eisOAVbuWXxvEODu4L3QOuT93vmRB/QRGJ2rKJ8
         rgf+510QKC6NrfzQ4+0XusJY3f/R4P+HEzC5Zq6Sb6otiAJY5OPKR+hwxz787T6G6BPD
         zQqQ==
X-Forwarded-Encrypted: i=1; AFNElJ92Y42s+oKMRfJ/Z9Sp/DDpMS3eK2daik+cwFLGoyY5HhK5Po+qfcKF9WYXNz6ZZSZRUhGrXNCEHSOF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5tpRerSXP2XpQdoTBJqQEck50yp/0Ed0jayLl/gfvVzUIjQ22
	5kVF333fOOTOZje41XZw/rOUsFbdQo7ubQEKn9D05Oaihj6QeMuxXFPmSM0ATZLB6GWu8SWI6ZZ
	f/DznTnY904ThiJTVhbwMDC4EUYdro00y94Eq1YuIJ7clzjTzsgYgj985SYtOT5Jo
X-Gm-Gg: AeBDievHls9Z0PfYdTkSCR6Gct0Sl/yuOcc1i/NxTRGjm62C4yB9VgX+Y4moXuZOkD2
	slCVEXNPotmKeOl7RtUyXNDAAheWOPx+G7SJC2uOGOEjLLmqNKiatetI6VUO72ey66M36QnQsKa
	ZpDKPpOiQVBOSJSnl874ij5vw9qAwJI6akSFHrDiDgxy4yGhKY0Mfi9FiSelmXmlkTx8YmQ+b93
	ATksC6QshtyuGnIzJWkM/q+od9Lip1L5XmGxp8SP002NJsKxlxw9Xv4Bm96fsAbPxWMD58sKawI
	lsYUJwJT2/stS7D8/bYDZgliH+MLeT7C0UbGsvOPQ3bC1yQTiG6dKAYGLSmMGTtBnp+xuwja8Ci
	vpbqSAkbSBwP28StDNw75qMvGLCiILef4SUFyIh/+KmGSUyPAneAYTXrG7j6hWl6Qj++h8dkYk8
	1n246LUg3Aag+3UBtIojY=
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr17372802b3a.26.1776769008703;
        Tue, 21 Apr 2026 03:56:48 -0700 (PDT)
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr17372763b3a.26.1776769008211;
        Tue, 21 Apr 2026 03:56:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:54 +0800
Subject: [PATCH v17 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-5-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=dCtlo03cBs3X5l1VhW746PQdMKk5Nr7hUDLc99rGvodxoulubJqgxT9IZaYBrHvYb0ocFDLYx
 jtbUug2pvSqBPRpenK555AWYnohpryTyhmMRtz/Ln1hrMNdRzzJgraE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=69e757f2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX8E6ZhGwCO6t/
 Tsi8VX9XM2Y7Lfd+ND2TekdkZIWJCRnGVe7dhQiUcjibn1jNQRbvbEmrVryqCDGcztsKzHi0DoX
 Xf0jzsfCne5hm85/bJxeRKfKprziZSrQTHVpr9d3Cm3JATiLjz40SeVjAT9XK36nz3leoti/J02
 oYvXy5ZqepY6wLOzSQpDyuyiJ21r8yFiocb8bvBcoFhEhlkqsQotNO7Rq2NFIaaMgFGzwd1R6lf
 Q+uPiTOfgmDlCb2uQyhwp2aXYHlZ2xM9jHc969VcZss23qBo5GPkvpvIfc67Um8YvfjQNVz8uKv
 cjZ7HSuD/z3bYS6KAJlm0+K0Hk1cyhrv0/7dnbD+bjCwY48DtwPPDuGOnhsU5UfQinlcF+bOSc3
 5DyH4f6+hBy56ex9PnpubEpYQy07Hanh8wAz9/RDc8iNqc7RDc4BSilgsunJaXbY1mnsBCYIWfg
 kHKe0uVVP6pR8+sIumA==
X-Proofpoint-ORIG-GUID: J5jdaHFqCyAs1LmgqmLLIk7eM-570Zpo
X-Proofpoint-GUID: J5jdaHFqCyAs1LmgqmLLIk7eM-570Zpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210108

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

