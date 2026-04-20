Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996213815E2
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665594; cv=none; b=n4LMb0osZhuD0O8nUe6Mvu7cZYQzp8Wb+QZsg6h+AQCy2/EnjpbEA1RRV5Y3lTsTTmf6hAb7al/4ZQ+BcD98o4iwHWOaV9jW7zOGBkCKORp9xlXzRmeuJkRMy+RCm9jsRB4bkzzhVIjcCxXnJVJx1tyQR0NRL139CH6AUY5y5V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665594; c=relaxed/simple;
	bh=Idc0crK3CaBNzqCaGF35zyJOnPET3eLD/IBMOgMxq/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss85/QspLRAUHGBAKi863nZjJ1QwXV9yx/dvNsSWIMWv7pTB+NVK9zHuAO+yRLZ01pANuNyf/wZoFQ6WSG6nFo5mMyBP2SLA153gkfvGhTnlUMHPHqMo90INzn0o7PxJotrj/Rcd2KYMFVTvNRDe5Qn0zva39XZ4Vt+fsNYdDvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmWTXGgU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hajSFiCa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmWTXGgU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hajSFiCa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JLqYHl282762
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYJlmovUTj0wPnKcRUu1RZcd8Gv1/6ze8sOz6CUrMa4=; b=bmWTXGgUODJ4x3Nd
	pwUEhRoGOP/zRzn8dZqqajgyBI1U3jiB7lPJlTO7JOhZOTcUB/2lSx9DxKy0jczO
	tbFRaLHHnFji4ZCbWX97SdJNVgekE5CIkerwd4NY+ayYmDbxY6Y24gQizmQJ+uUf
	322BFi68gxEUWQGVtK9QB3kdBUrFzk8mFsWwbvZfUxrGu476//O3mh0tSaQS7y0f
	MYi/yx6eiDwC1PGLSnUdKbbHFKGkRs9bfvEM3TSdb5rQm4UdtTCF89IXj0S8blwu
	4KndFDsJsmdeBRa6PhMpHqu3+NaexHSGgFvLpxflAfEIAnE7rUxC1J7yCHdPZbqv
	UPIbCg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkynecn9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7977177675so1073317a12.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665591; x=1777270391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYJlmovUTj0wPnKcRUu1RZcd8Gv1/6ze8sOz6CUrMa4=;
        b=hajSFiCa0EItH0ikauUsOeWh4U4M+L8pYQ5h3xGnZiOzwdr0h66Cif+QeyEM+be0Ce
         7UXiAf/mED1AsKMgLq7ICyvB3lhXt+DLru+pBZqCLIDLPQyzxu3v5K/1F+rqS0kniUs7
         KHDt2sGmnNdY1t9kGnSgwSGbFt47CxRiQVZLUIUkJzd4r2GzSC0s8CR41fApbIgs+kG+
         W/mtLK1G90PAz5vN+/dXPo/M7Rdpb5Tm6G/2IzuhKmxZb+E8r+oxRyQuaKDyLzN0gSRj
         pGjryzDXUusxyZdGFMD9pNeY3DjH14L4MH1DCgNF1ns6QGQAa7sJV8qqBcoyfv2/ytH1
         3UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665591; x=1777270391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GYJlmovUTj0wPnKcRUu1RZcd8Gv1/6ze8sOz6CUrMa4=;
        b=Wg8gQNxYsheVAcNaWtb/XgwZ0lwbq4EH/ekzRm6iL3dkZY2s3j+nSXzIiR8UwTC9dR
         Fv4xgEka4H3PJKbDaScgohhC8oaUNvyqXZS9X1DqYwJuQf8AsoR+BcG4gWdmGy98WkPs
         P77ylmlrjA7+LW2Zi1geIOwGhCgrIIpZE5QmeTwz/bjsFUT7SvEa1GJtUhqi5EdwsTYu
         lcAJKrLU82InCexhY7sBZX++KmsoJHNm4JBEkxTNu0GJGiblhrUeQnKMZG9lfvbgtWNe
         +wOIbOicyiChVCsAjG3b3bFNOlNDTZVYE1K/4cFkxN669BJaNdcWu5bKUMm5zsqjmR7U
         l+eQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QnKoNbZGVToG/wvNLk8/lLRdkUPRoP83f3uIPD+/PdT2zXxFOhVSaHpJ5LeWmW/5dUdpSNwp1hDgy@vger.kernel.org
X-Gm-Message-State: AOJu0YyrAKdhvWvW2GK5ynzQJJlepDwM41ue3FzBiAHTuB0mAh3q6f/M
	hISDdV7F18z/BY0E5uNYeIuFANp2G8rbhASUpMkyKq9/27/w7WhWJP4MJd2P9j0+eIaw665euFu
	FvR37wF1c99XHd9cgDNVU4uTlpeIm5SbB6PJmS+yfjFHqW3lOad51BrKKFLyGGZXj
X-Gm-Gg: AeBDies3zZrnywCf1S7ICRyZvcWylAm51Tb+kcAsqE/JGQ5hBTuhfAfimaROHnb/Nbx
	qz0QfKoWSDeA+uA4I/V6DJOFrq+/0wu0dmsjFOrjitgCxB7Spkkv8Xaq+U+t+MFDmCRwgPgqjJd
	IAWRy07nBunVRBAsrySJCktzOqXr05c5vJwznD6gXzlgSIZJbQfxV/VaBOCgGk10jqiRhKwjOS8
	DzZ1rJXcRS1NXct6tllR7lN8kH5l1K5RfCgn2cStDg71JFFrfPv8OgqgisoNn8t4Pm2e+vGvhzM
	4o6Zxu7j8sBE9GB78IknQFkpwMEPMr+LS5yuwLJtxOyESVVJgdQP8c8aZMVMunGoY+w6L8ZDwte
	G0ytZQLjCCuCUeiMW2eK5KnOu8LWJUXJQyRGSUdqazdqIVsKE+lno27c8Iu1o7lNlRUk1
X-Received: by 2002:a05:6a00:1a0b:b0:82f:b519:a5d0 with SMTP id d2e1a72fcca58-82fb519a776mr2253196b3a.39.1776665591375;
        Sun, 19 Apr 2026 23:13:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a0b:b0:82f:b519:a5d0 with SMTP id d2e1a72fcca58-82fb519a776mr2253178b3a.39.1776665590911;
        Sun, 19 Apr 2026 23:13:10 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:10 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:48 +0530
Subject: [PATCH v3 1/7] dt-bindings: spi: qcom,spi-qcom-qspi: Add
 qcom,qcs615-qspi compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-1-7de325a29010@oss.qualcomm.com>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665581; l=1655;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Idc0crK3CaBNzqCaGF35zyJOnPET3eLD/IBMOgMxq/4=;
 b=VuKvMlyIg6jswwyjJqBo6XxKesteJBuHhqgnBnGFG+XqP02omvYwHLib0H+CNtBFzRzqPvJkb
 hBDY1rOpVHQC8risM7iOffdxpH94S7WNsMlon8C2H8eTWE8lBdRR+4E
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=HbokiCE8 c=1 sm=1 tr=0 ts=69e5c3f8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kPckM-BePm1yi5if5TYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 0djVkaMO88Viv7Uyuen5Tcw1vYgYaWfK
X-Proofpoint-ORIG-GUID: 0djVkaMO88Viv7Uyuen5Tcw1vYgYaWfK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfX6My11X3+lasT
 lJGyXsHYM/CC8YNkVrwHLhDKf3n767UTW0ZWD+CFEd8WIO8U8NuJkhVFLgJ2S91sG5hjzCLjso2
 RMAbs1EVJ+pV/bcwmNgnRICzSB6bru54Vc2XScEX4z5rJnXmrr0cyXnQucLomfPb0p/2pcCsA5s
 pxEF0P3aV/Pp9ooxVVWdPtgiE1U9uWAzmrrBebeJDoQVezhJavys5FRYLg0gyyM3NF6z2VEXAj2
 Cx+CzFtZMsCZAVoSacraIHzAtMyoDtggMLWBZQtUyZwOMAkraU6eKxdd5eT2wuuadNQT0RW4oBc
 RswG4ziPcA04+Mc1+wsGM3OT9vmyhl90Mt4c9GrshZr4QYLxg2lBRdna4EABEKVcq9ZCn9keP4T
 EFZnWj283XdspC7p2UVUJ9uiYxcfaYafa+A/kBdpVw0hGJ5+GTjdF4+/uRh3G/0kI7gMVOh6cRb
 dW9rHZ1Fbim39qusTcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058

Add support for the QSPI controller on QCS615 SoC.

Move allOf section after required properties and add if:then constraint
to require minimum 2 interconnects for qcs615 variant.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 1696ac46a660..ee2199027e89 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -13,13 +13,11 @@ description: The QSPI controller allows SPI protocol communication in single,
   dual, or quad wire transmission modes for read/write access to slaves such
   as NOR flash.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
-
 properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-qspi
           - qcom,sc7180-qspi
           - qcom,sc7280-qspi
           - qcom,sdm845-qspi
@@ -67,6 +65,23 @@ required:
   - clock-names
   - clocks
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcs615-qspi
+    then:
+      properties:
+        interconnects:
+          minItems: 2
+        interconnect-names:
+          minItems: 2
+      required:
+        - interconnects
+        - interconnect-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

