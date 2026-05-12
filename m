Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D8191F91
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557080; cv=none; b=IRRpUJJsPYPu3V5GbJ3YX8fQzFTXBrFs3R6GQ4MFY/6KIn5n3BLXQl5qy37DI52mMotdMLht0tIg2D4kw+OxNtcdokA6lF4okjUpazkPaPaPGnTr83bLgoQyyQE83kFGapvx38G1mhhgei/toir1CWU0gHNG3iMTnDXEsC/FAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557080; c=relaxed/simple;
	bh=evVlV5QhwdsHRVHassrrlpvsT6O77VZkUS8aHmvhG8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jpgCHooaUv8ccYatlx0xS4geuC7r/zaMFHEYPdfrYNLMdLrsZuvbh4ZO2kG+tkROTjhvvk+PinsxjQoqnK5G0nVb2wM5VXIWXyOy87kMLtOoPvIsXYBUV7SKqc2jv6tKNzt74GSOHLSXkspDupDLQ+Ag6KjL+hfhmPP4JQrGbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMnT+jYK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWrni0l5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMnT+jYK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWrni0l5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6qO32803828
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gE84wqweCwZ
	bNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=; b=MMnT+jYK5WvHqsQkin17MDBUQMj
	O2oIxpngC+mo8NmtcbC+CZz+74Dvn80gwIsVW61q15Fwc9Jgaqptv/b7l9yNZSAV
	jupPuw1hTY6eCgvBW0efAVR7hk7qbkG73kvqBviASKAh6H7MaXLpMwAsFn86UK+2
	LBZQUvYi9+q1aPp1AWkEuYZpe0j64iSksT95oRzKqwgR1xn9aKIS6aS6WMwpy98i
	2ulzYT1HJIee3YKf4uoQ3lilC6BihjN5hRj7h37S3M3CfIB24Q2ykj+Vyv9BXiU0
	3+PHhiIXtjsVpMdqwOMWjAj4YqKeGkT/8MXr+lR+5Y9fbLq48bL9NdQtd3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv39abx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ef62078ee7so6697178eec.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557076; x=1779161876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE84wqweCwZbNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=;
        b=iWrni0l551chCD1MiNmWuUXjLvCsYpCzV1VZiDZhFfqVEdzxGaLdTtcakkPQjk4d/0
         rvI6Hnk1IA9LVs73Snb3RYk5jHccVCzpMAnMXURLL7qeZ61cEHVB/vQlSRVjfX/sPDI4
         bq1E7Cw69iRDC5K/w+G793SBNG6vD/Pm9YU2XQ/u6g8t/XleebO9lRi7BhyGqWho3qge
         B0Y8JqhwGrv0Mel7Ey89sZWdu++/XyUTMfzp+fdwkzHdjXZlz6piXb6PGEw76k5FAGSM
         sQ9jTSRSkDMIUpApy9N/v6SpBhU7EetLhkdyvqRT9CAeKtO+dTuSmfI6tfrCSE5RspwX
         ZqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557076; x=1779161876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gE84wqweCwZbNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=;
        b=q2BZuBVUxL5320mOBetf7aKy2X7jsSA5baK7QQ0j0BUQXJQ4n0q9KPkpxoDZUPTim5
         Cds4F8fE6w22JJD/9vzl6Y75GaSKhSSs1kBafmTKvcVBHvl/fcIz3WyEdpEWOv89AEB3
         PZJCvmsftwjfq/PdtBAP1vgellZlWDUpnOOPkyNaMXC55gA2NiH+rQVO0tym4SLcg49B
         cGAJ/nVWAn3DdQMwCkaGKvefzBVmzRABcFsE6uEBkMEpAuKkHQ9lwU4FG6Bj4kQULRYA
         yMoEGnAgahU721SgXbDjBER9Mn5vGdI9tIcWjgcvC8/Jqe565LB69VxszJqv5MJsXgm3
         HvuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9b/sQUx/d6TlQHvLg5VyeLi7WU+YS1jZgSkf3NXyEwuOZQTda7zYnnMarit0QkRfWrdg8ZVxq8gQ8u@vger.kernel.org
X-Gm-Message-State: AOJu0YzjD+8P25/eHHPJCiptyOkJNzSpNvRJsdx3xqXeKA+EVsgBSX+3
	YxOTEdUcF3WIk1C8Qc3W0FPNPpiDQpTKBMJrZRRq9kNAM3PWuivPYoPlyGyHfMXn8IX5wtRsqJm
	VIdHb9JFpbqSXoz8Iq0fvwWVIIL0hpntSnSGTxrop/t6OVMyN1pTPZ+wL4uKSTZeM
X-Gm-Gg: Acq92OGL0Tq3fkli5DaYhXAbON2MA1+a3bttvVYHV+aEtbvoGsFrbuvizKFNNlyFwMk
	z1CZN0j2PiRflRWjfNjFrFsdHF8nJGmEqmgxqXBMrDqGDyM/lD5QBBAlFoHU1j7l2oiDZq7xTFh
	2Nf3ftKYNPHuNm0jxkZVOB9YIXEdjTeL3Fir3I+7KTcVgwuInBaD20T/R9+fO7YUXbcK4JREhWn
	Muj2gqg2HOqR1fjZ77C1ifvEZdKNiuwHwm0fbSDY2wGJVnYHT8gc4EKQXbF1ljWE8wGAIln2Fgv
	vU6BL3rTzrbtMrk4iQSWwev1Iz6OIBH1qH2PWYgkgwH0aoqByLQwCWnuX9uiy2XXcvNpMMbK3t+
	+dMdwmevG2xQnSHo1K+EWLq9rn0YecyS6LAuIobPqzgnn5RZ64zelIaiZ3p4GUA8knLmy9VDeha
	TsySnt
X-Received: by 2002:a05:7300:7244:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2ffd5cbbb6emr765291eec.13.1778557076497;
        Mon, 11 May 2026 20:37:56 -0700 (PDT)
X-Received: by 2002:a05:7300:7244:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2ffd5cbbb6emr765277eec.13.1778557075905;
        Mon, 11 May 2026 20:37:55 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm16730109eec.2.2026.05.11.20.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:37:55 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
Date: Mon, 11 May 2026 20:37:48 -0700
Message-Id: <20260512033750.3393050-2-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMCBTYWx0ZWRfX4KP+zmz/MGgs
 DflLMk9fOADEcBH0/XgSSX3sSagXXsJJQimvvX6g5Trq7D7MJ1HnRop+FrDpFdtcPYUDfAsip24
 QA3vdPfiCy9PmI6jRo+YYwpuWe1YPvCfjv5kdU6UgzjBzkDt9AbpmG7ArQT3+5Ll12OU7zhUD6f
 dYi9OhHwVx/k6OKhfOd/Wc18YmFd4zfBuMb/F3CEZS4svKrPb+QpBdpiRmeApCmgOFv5ncDJaUI
 gDCrVSdClN+XprkJJKY2USguAAi53br+wWLkSQ3MfzZqdfnCzNUcHGjrMaANIjGFIKdCAxCw+VV
 1jpBsNh8UWev88FJBSV7O0s09aMouOY8Fwp3+lxNdHn2DtTb2+F9xQoVQ989NQWCSfIypxDF8ww
 6efjToW5f3vpuCIMwbcSf1E83r3XGjijB557ue0+LPw5VFP5WWN1wj4uJlyJNDMHqK+UCVAJbUt
 qjd+I1DwfEJJvWBVBqw==
X-Authority-Analysis: v=2.4 cv=Kvp9H2WN c=1 sm=1 tr=0 ts=6a02a095 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UuHxjPGgWbCNvu6MkpoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Sy6S57fdfzvE6KGffFD8M3YeTx6TmlDs
X-Proofpoint-GUID: Sy6S57fdfzvE6KGffFD8M3YeTx6TmlDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120030

On sa8255p, resources such as PHY, clocks, regulators, and resets are
managed by remote firmware via the SCMI power protocol. As a result, the
ICE driver cannot directly access clocks and must instead use power-domains
to request resource configuration.

Add the qcom,sa8255p-inline-crypto-engine compatible string and make clocks
optional for platforms that use power-domains instead.

Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 .../crypto/qcom,inline-crypto-engine.yaml     | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..4e7d9111d0eb 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
+          - qcom,sa8255p-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
@@ -32,6 +33,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   operating-points-v2: true
 
   opp-table:
@@ -40,7 +44,20 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8255p-inline-crypto-engine
+    then:
+      required:
+        - power-domains
+    else:
+      required:
+        - clocks
 
 additionalProperties: false
 
@@ -75,4 +92,12 @@ examples:
         };
       };
     };
+
+  - |
+    crypto@1d88000 {
+      compatible = "qcom,sa8255p-inline-crypto-engine",
+                   "qcom,inline-crypto-engine";
+      reg = <0x01d88000 0x8000>;
+      power-domains = <&scmi26_pd 0>;
+    };
 ...
-- 
2.34.1

