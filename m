Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CADE390205
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415385; cv=none; b=reuOm2QQ2QFQwQty/SaoOauQX+VQjTvy2DKPoesj9ajJwYI2wr9XCiIiM59DAZcfJNdr8MW1ywiE2fnklVPliZ0H2WKmWuILox5On6e7Y9y94+RRN4akU4Q1Betn4I02DleRai8xhpJwqZfHXNJo+/NiuNH0GEJnz35juh442sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415385; c=relaxed/simple;
	bh=YJ2uuXHSIbJZT0Fdwh5wizqsLop2xEM6VasKhhh4eMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOD0uJhd/4WKSPNHx2Yq6rKXQ5h4eOQgP/Ch6Tlldb0qddx3vR81JeCCRA0xqxmQLdbuBC5QTXYiLZ3VbjmHPXDwWTwt48YMJnLrU75Pb5D9b9QPGm2LqNnSCZOJOdkgY9rDpkWq8U8O0dcKHolBJPhqbUbNgzU2fLgGIYQBAdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJXnNfZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aml3BvHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJXnNfZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aml3BvHj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dk0v3138642
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=; b=EJXnNfZe7oNzsWqw
	w/80DsVkc+biROTiGFwVObI+Fhw7ibQo2u64eSz5IYMLYhVYy0kRtGARQfd8amLV
	7piH/woUbrH7F2OOuKbFP6nxq4kvzlw41e6+OBsGXqUnxfESO5wVflpWDfI/JLir
	xlsZZuP46nh1h3I2LYmYfilWKETR7PiZJLWlT+fKqMMFu9Js1xfGF6T4NknRh/sf
	otjsMomessu+GqLucLjsLNJ/jfZ05aR70R/7yinm/3fPGJvLO2VXZ/qy731iwKdU
	ctInXv8BtMLs0Kx6SSSM5X9sxvUusrPWraW1MKlRCLRcxTdQHfL4+cMNhQBoQ5RI
	xGwX3A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t1595sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:09:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so5828529a12.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415382; x=1784020182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=;
        b=aml3BvHj9+1HWpchw7g/OcSlK8ftDSJ7HbkzXVDxSPug4WaplNx+tw15E/shgNZvNn
         gD4yX43L+FB4XWJWNVFXjzmvrg97Hs32/Ayy75FOm5o6aweEfGiFSwsWwrIQN6EXQoVr
         NjqOkOLVBNJQakmy5e+AYF8OXzy9WI+nTzHBcu5liPmWQoTPzvhhBay5v649u43McxmO
         8XlqWpmq0wDDD5UU8ThwAKYlgTghS0y9qBiXbnnS2NUflQNmGj+wRjgVcyEZ7vv+ixnM
         e08QbnrTCBnyqnPqU08DKZo2fumDPxxXiVqoaXzu/5solKMr2+c0+XaklDYK5gRpog5H
         QjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415382; x=1784020182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJFzVZRNsEx1QAq2bEiIjcUhzr6tCVbNb8eblvXA20k=;
        b=HXti72HaliTAZrXVrZWnU2tBotaO1GXbqMhc3JbBZizkLPDIO03uHRqtAQJQ0mG6No
         aVCwZsaT4lpfZJSwK1JtkrvfQfPO9t74gfmGcL5rfiWOqGTJwYgJ4OnwHvnFfEkF1NfR
         xebSK50wXdUlDgZxL6i1HzdDK/9rfAgW2gliGN+GgEWKx4MiPxJWvgOj5iLLQ2p+UZ20
         LFASjAFD0CkpSc4CYnN+obLqECm0HtOtBMLoGnrK/cA/mHs2gn+hhnGF/Tu37vYCITJ6
         +nRMLaUbM7PjpA6AtsAEfiF11pxya9lSQaCG4UXVduthK9dcc0oThQ0Evh5xelzzQRuL
         cBEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWMsW5yUENAKQ2771ehUG8MbN6c6HCbslM0vfGaydYqTI/B6sm13zJlLv9/f4OrbBu8F1FHPjSl/SB@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRfe1KF+e480PMEM9n/92dl3U1chbybsd9qXsWyF6CRd59F3n
	0YJpNKQDDL0X2jTiaVQWBCL4Sho9OL7l4fI7rQ2yCfkJdJ3sZeaRtRNI4/FPrSe9I6WsIYgVvY/
	y/1juqlixxN4gHuIvHY6CfB07z3KYtNKOD7iCd0AbSSdznjviYToNnapC7m+kPJFW
X-Gm-Gg: AfdE7cnYU0V16vOASWKAGl9raKuawh9yhkSqJmRCnQPaxk6Nl04R2xl5W8hd60dZUJE
	tX1x9JG+K/DUS7znkLxLC0PD1siLZc0ENcwgij37McobkFCDd2dWqph8pEhJeOlWrEW5T9M6m0I
	wB44PGUVBEJa3VUp3IyAT60juaYV6MOU7rkoSoQOVO3Xeb7A8ddP4pPSYsfdukr06avsKeg5GJI
	vw/iruTnkjpL2Ol62Futg7yteXZbIitNxVyGX+1AV7DGE1w6vUTWAizeM/ADk0F2dFpBK36OOIk
	ikEyhzMyncwxUyakpj15w2eD+3e95nBaI4M9rIA+7u5AuC1oKIEsAQPv9ZRsh8E4nOq6L2lzxXg
	qrcSlmAR9IEwDOOlosEj/LTZa1GtyJ9Prg8ymgD2OgYUM8S8zEcvUr7ID1F6y2IcPp7wrSpc5SA
	==
X-Received: by 2002:a05:6a00:398f:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84826f0d90cmr3933161b3a.48.1783415382136;
        Tue, 07 Jul 2026 02:09:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:398f:b0:847:86b0:888c with SMTP id d2e1a72fcca58-84826f0d90cmr3933112b3a.48.1783415381543;
        Tue, 07 Jul 2026 02:09:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:41 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:49 +0800
Subject: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415365; l=2032;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=YJ2uuXHSIbJZT0Fdwh5wizqsLop2xEM6VasKhhh4eMo=;
 b=DWkEQ5zuB1N8gnk/SVlIwaWzOxZO5tN6x4SbsmlNNyndgb831OiRn4rmGyDmHgdHeX1CLWViI
 bortK6pu/vUDWY5vwK4pkrR/zWayyKNqNdKX19/++DABsLon/MS6B1E
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: vTyHxivZWZbiS0XrYmU6K30Z3qa1tZye
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cc257 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PCdWZNGgF4fqn8E18fcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: vTyHxivZWZbiS0XrYmU6K30Z3qa1tZye
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXxAdE2MhdcfJn
 oTMfOqcifSFsO9Kfd4ghjMALcTxkLiTKUlZNmGico7LDLLk3p84MDpRj9AgRqc7f/oNE2v164S4
 S2pre3zpcUvGhGVn/j+Z7KqU9G9Tq9Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX81DHf5YigzT8
 62Eb1b4jjSOKOdYKoXRP1uP+p5uffuuO3idJBu5TKYEcPzF3qU2ee/wUr5h3DMj9e7UDmqoRcLM
 5hypHiu+MtHk8V3Fk1Bko6II7+50zPGtT4tiByO5oyUcZK2rOgFuXd2AolXBYTtuG3Asg12AC8F
 qT2fBbhE/gqwlYfvRKk6+gVqpNA65anGgDYxGoowM6Ev0B3jjt0b9hLDACvYqgswgTKGo9tq9oq
 4ManqdQHYi0TCZm5kuD63WivN+WMfSd3ALnI3vHGIEx+bbH1BkfCnSo8oYzXnalgLVgKTdp2FVT
 DPOgUfGO8Vxapl1Gpj6L/gauLCnTvZx6tU+YvBo5d8mxj9Q3KgQWHdTVBszGTOM1SJjXqKwhPuM
 tvI4sQUOX6P7Ma7wWd/H/x6J96YjAuT7yMfi4O1lgWS/zKOlLJdPRaH8PLQ4Bodx+FG5iEsHsZN
 1fJ9+jnj9P2/ukkDiOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088

The TNOC compatible previously required the two-string AMBA form
"qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
AMBA bus.

Change the compatible to a single "qcom,coresight-tnoc" string with no
"arm,primecell" entry, so the device is created on the platform bus and
bound by the platform driver through its compatible string.

Drop the custom select block as well. It was only needed to avoid
matching the "arm,primecell" string on unrelated nodes; with the single
"qcom,coresight-tnoc" compatible the schema's auto-generated select
already matches the right nodes.

Update the example node to use the standalone compatible form.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
index ef648a15b806..72fb1210e22e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -22,24 +22,12 @@ description: >
 
   Note this binding is specifically intended for Aggregator TNOC instances.
 
-# Need a custom select here or 'arm,primecell' will match on lots of nodes
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - qcom,coresight-tnoc
-  required:
-    - compatible
-
 properties:
   $nodename:
     pattern: "^tn(@[0-9a-f]+)$"
 
   compatible:
-    items:
-      - const: qcom,coresight-tnoc
-      - const: arm,primecell
+    const: qcom,coresight-tnoc
 
   reg:
     maxItems: 1
@@ -83,7 +71,7 @@ additionalProperties: false
 examples:
   - |
     tn@109ab000  {
-      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      compatible = "qcom,coresight-tnoc";
       reg = <0x109ab000 0x4200>;
 
       clocks = <&aoss_qmp>;

-- 
2.34.1

