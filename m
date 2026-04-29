Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B786B38B12A
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436583; cv=none; b=eZZvWsW48Cb9IQnfwF9gQ9cbdShU4Tr0qAGQKfLZ7GQFJcc8B+9jOadyytFrOe56yzb5HeZ9iQS2RiRhGWQbNjwtB7E0yZJBsWJJS+JCcdREtTGndihFG/kG7ebPlA/g3Wm2zbdUpQuWN+1ECNFFMCOL0hcadYe89A1v/zMTt84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436583; c=relaxed/simple;
	bh=5t4du17pW2GAwFsQZwduJ825MCN2mRlucu8HnAoe+JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HkF0HKn2A7n+LmqPn8zdS4OD7Uz8cjeAgqcVAM5MCII/3Rq68zIGIoE0lMO5vRpz1z8s4sNegtyfIqf9t/JQ6vVVv4S3GZ5cFNDbmtDQjgu5NLeE6be9wJmN1ZVeoLcKYWAKYBSYY4yrTrsIrWaYIyLeIG0siQn/kZ0+BrIcnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnOAGdwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D0Ox7Xri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnOAGdwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D0Ox7Xri"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3Z8bj1015336
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=; b=UnOAGdwmUEPtLtZb
	GewWXlNg0zKUzI+UrW8lrkqPSM5hRjIADX3+nokWGhxctmcpHnEkmETrpo9M8hef
	8N0m2Y8JGvPPr+5bHhxKx7y88P1ckdh3RsdbiyRZn6HIIQMzB19gcPOEhi6qQw18
	fYqMx+8Zaj2Db7+6p6KGZBNRfmm5BsUoqQ7HCtH3TuB56X7hD/BwYd8rZjRrIpcI
	vIPyR9tz54gfm7p6eXXE01PepdF6P2i2HZDI7Ga8o5tYCLzKsoX7qOUQG8qdQTqB
	DQaWQlS7fWxO34ye9FxO3GWJJLXljL1y9TZFGBt8q6MAXxSxWtZjNMjzdZDOwX5/
	ACbesA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7304ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:22:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so12792322b3a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436579; x=1778041379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=;
        b=D0Ox7XriuSeBLN4eOOsmpsBWQX9FamrueOcJipSjW+0fsuzVSqyYYoOLGAD3T/s9wu
         wv/CWaBtOLYPcecszAKzuVNxV6n+vcDIBOhh4qdkCS2wLV6PRXy4Iz80YYKcjXX8pWDA
         76OnVv2E3qXZIIwPhrHUDOLtpuxrS/W2Lq8Bmxttqrl12Iu9YFDgguMoFhBnWYCzH0IL
         meTEILknO/E3srRO7hwpGf4ctVY1nRfBSzxWHgaYFdqZz74ZgYRap8DtSClKMWTq9TQV
         hpnZV4jT0vWipnhzMr98oAfkDlQAODdBZNk1y4n8RcZP8ToFTR02bx1o3pp6DdT08AUr
         XE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436579; x=1778041379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=;
        b=ipb1UrR4JqlPgK54FmmW7/oVMALfBxUg4HAcMkptnvqFkYCtTwu/sWYl/tXHJSd++N
         2Y88siuzsp3OIYNUf8Blf044pOvcGRqwzFinr9d9W1AHrrx9kAb8SDKCSx3P+wzK7UBk
         BGQl9FrwY9s6rxpSTyi/9ydL3BuuLYiN4xpxx5/LxpkqkyGLTi4ep6uXNA3BGyuNmIYD
         0RwCU6LeT05D6+6yEaK+qoRHYjqA78JIBHIkop/4xUvFCcQnRU2E6HfYVFWbPERr23wu
         ULCBgevDusFeWoD0z+Ekql3Gp30alRLUERPOjlJvJvSVuvEsOW/VZvNCU0TANl3AZ/D1
         ZemQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OxTmEgD36QDVEd/b8HhJL/VYJrrICaxRxv/ARBh01KTafqmgYonWmR/QPeqUCEekpczC7GfFkvAxz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo/cnGV7UVeEcVbgZhsr09bKDc2VbfJSROF8k5jYT1lLFuJxmo
	Tz+hIEYdha1Nzn6oghMp8B2ads/+JBvg1MOzegjv5XHvK52Hj0R6IrmBb0Kh6UOurnn993zUVjt
	f1asemn7T68956hY+xvdvsdVTVdLZkzDCf2ClJa18qb7wQkyTY8sNBpqVM9sfXaCW
X-Gm-Gg: AeBDiesdq5Ht4QEm5m4uYAN8E36pXosCl6evALzWLFJFUpQG7Beu2DwvvSI1UWlp7Nu
	x5xoee4tIB207q7EIEdgOoy6VxbQi5RavwqU+wFGCGcIK2hAzHXCcPavctxt2Valbi/Ahl2gXN8
	l4PTMQEaWKxdnFrda99pcjDZFP1kZLiBooFAv7Yu9vfBjFD3XP5P+ZjD2ChIkpyYzx24HcQKnH5
	ZmF7wliinuXBxvKJUXtUvCmM+eBPYuo+unlLFrtpkr7p4TkMVx8IjUocZXGhrxeMmaRx+lrju0d
	xYhwz7Cq3rFRfOl8Q6EqtGoJ0HjWx0Qj9bMRmf7aa6hDYuKxbn5JHnQPZle/h375O+j9BBbtyir
	39saU4kZLu2cvAScMEO7NKKToe0bBqx4tlwHgtRih+tYRjFvvXE3xUKd1UF9OnFbLx2eI
X-Received: by 2002:a05:6a00:90a8:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-834ea66f266mr2042969b3a.32.1777436579328;
        Tue, 28 Apr 2026 21:22:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a8:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-834ea66f266mr2042934b3a.32.1777436578824;
        Tue, 28 Apr 2026 21:22:58 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:22:58 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:52:40 +0530
Subject: [PATCH v4 1/7] spi: dt-bindings: qcom,spi-qcom-qspi: Add
 qcom,qcs615-qspi compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v4-1-73fb1bab03ba@oss.qualcomm.com>
References: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=1728;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=5t4du17pW2GAwFsQZwduJ825MCN2mRlucu8HnAoe+JI=;
 b=pzUZDzbK9A5SfNK0sbCQUoKCfOCWnIT1mt2zm8vCLmE0YLlAgvpVQ9eeoVLngHEzQEXJuDmHS
 pn+mqQw4DaNBbn6DZZKFUWaq7gkxifOtM6vrd4hs+GRR+7JdHBQ5kqw
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f187a3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kPckM-BePm1yi5if5TYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfXwTcpPsKFFFhz
 /K0NoX/TmM8WPu9Ui7wYJ3CMHYtP0ehP/IiX3nf5cHbynzkQWiERNbBEX+EyaErbyCrGvfP/FLE
 PenWyb7x4IcK7uxB/cxZOlCoLoVGhfrlUGGJTlY5VsOqgjJF0AV8zhViUun0+FJrcbckp9yeySO
 pvYzE62zKlh1r5Q+9OgN8gBwE3Q+ukpGXPoAtFRqNBFhlTxdXKotdveb5a6WrMSFjqK52h7RlaI
 APUraT+hriBPHCETkd8TUVcvBQF8fRIh76ciwJ1Poe7TPu5MH6yyWOgmn6ckL1ngonwv1cjoTaG
 9xbezbihmeOY6zb7/ml+VdNvncMx3NZYuN7qgszd4dZkxzoaDnMDc6DYVXm6Rq15EQHt1u5V291
 Sp6fxPycqIa2TwZ20YtEt1KwMB0m8dJ5+k6XOC74VxHc16fp2ACpSh71JoQxN5bHRS7hXIOeiHV
 UfjoJJPEswSnHKMxxZQ==
X-Proofpoint-GUID: ojHMIFEyNFQsrLzL-sl25qEzUNS5DRdf
X-Proofpoint-ORIG-GUID: ojHMIFEyNFQsrLzL-sl25qEzUNS5DRdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038

Add support for the QSPI controller on QCS615 SoC.

Move allOf section after required properties and add if:then constraint
to require minimum 2 interconnects for qcs615 variant.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

