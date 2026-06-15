Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77583CE088
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512462; cv=none; b=gXzl3CwVgX3ZLvLWh5KVHM0hQkoHbfwivCFyYQRMuXHJbMP1uYHpTq5WKFqcx7VhxYWcm8DeptFpFP0QbcWcgrA6iighKM3MVwoMN/FpoNNBWZm0Un7+mM2Zgm17++dehfhWSjJN+1qvH52CrQWfeCgcIUUKuabQzd5Aklm4HXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512462; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nOpnVTUNr1TLO2Wmu88Lr553gSvVZX9meZ0wKI1945TGr51bpGF1xjpL2bv13diDzlsAjyKdKQEYjZMhqgjh9J0d6pDLG5+oMS5D1gk3RKShNqJZEtI1KvwaVEA4LDYGlUF/5xX7iywR4zIolZ97anDOn1XsIUPRDLI3oiL4FPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ch+9CQTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GstRVw+S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ch+9CQTZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GstRVw+S"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IuV63332556
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=ch+9CQTZ/dXxcWhn
	OEHiPEEmnnGXuY9ZBEOXxs1yBK4bC7sD3QyyAVyGlJXximYY70c+C2DwnmyaKDki
	jRZGPz8CBCx7610QAYu9M9cDfiGqtcfE/TWbda5aLx1LDGjEOSUgj5jitg+rmbAx
	zdrOBY1YSGYhkW4U2foax8PEYTLQUiK7lwHmC80fwf57L9YdCOirbBQ5TvHJH6Uv
	+2OSoPxJVZS9POJWNlIM2OkR6KDxQX3aywJkoU1rlVKK0ek84R5xH8WJrMuS5Xm9
	rGZTem/cNKIM5hOjKUgJbjB20G0YIa8Qi3QJqStRd6WF2nKP8rsq8ukNq3Zcy5UM
	pVz0uw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye16g5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:34:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0b35fa876so36379705ad.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512455; x=1782117255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=GstRVw+SNLa3Rk59jLwr0jSCPhj646xrEkckCG3mZrFpVm8UYEu8gecgMa7S6fJ2If
         vjidMrivqwzDZf4GYKmYQSgUiBKZ7udHwNAZ0f7a5h+hW/pCEtIcGuTgebyzcC8w2UGo
         iXo1gx8V1IfZ2z0W3Sia5oMXrHMTVce3Qc4p553iR3N89j4+6Oytub4NAEFOgzzPHXk+
         GHo8WYyYtJI1z74RfvR7KGE2eSyQiVyqB6FhoU6n+hP4s5g4II+qYWb87tBql2JP6me5
         vocedhmv2sUAz4Sde/RiFTEbTdiY+CaeHrBRDuHKNel1ms1xckjASShDAGTMs14dYggX
         yLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512455; x=1782117255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=I0r6f+FAxMSbCzdYFmQruSt4k2+UAN7nCX6C3pSVKGCayGgUZMoQo61NCGid+XHd35
         TzKJET38HI3wg2DvocFT69cGd1i0LG1yM/b3nXX9rkONp0lqgjioZ6qfROePfpPFLBkZ
         hfogSu8Eqqy+rF2WUfceQc9nVc8815MALtaJ3p5gK2gItvsOb6FMsTVqTbbPPR3Va2od
         qrqznFwwvU7inrADf20Niu0xixmlIvfG+c7mzRFuKZ+jPTkaRs4C2PwLS54pUR1OOzmb
         9QHBDfH8vPoaPeuGxxOpWkxOdsiZ6H+ura3Bo3xOKiOzfxUPPzFfsNfk9Cux2rAdUnbj
         8MPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8KTkdKIHnv/dtj5pjsQyDPGM2YelCZdiW0IN8zJ9Pzv8Zgrlbvc3We6INXWKyabaiLyKVM9YuuWuz9@vger.kernel.org
X-Gm-Message-State: AOJu0YyMuuboJoevpeT6YYBuFz8JLp4y6Y3thtB146VNjNsGJms4hE+D
	1XY6IMBbyAGwGAmNXDrXiTyM6aCc1IJyd5KoNEX+ZPmW3q54Ff6NWJTMk3NxyAiqxuWZiIbKNCy
	fUeUbsfsvPLjt09hYcBfbDLIMIhkC+Sw23jZNMEo4eVSGm0oyeVq0edotNZlQXmsB
X-Gm-Gg: Acq92OF09HOA48K42njKu4mxf9zzhdAN4wR2+bomQvRGwItTVska28434SD9V05vzmF
	l4PJ+4wwaux6sLX3nZC6+vcSNDgsJugNQX0TkVK28XmmCDP51S9vwqUSgiKwrAwzJKlO1p98k2q
	vtyLLXFG50045FQPG7TdYPJGRSDHMCP92+Oyge0Rqq9MHKD3L89rVCMhg9EQ+ozymjZQ5XV3zSj
	r0L+3K9nj19XiJpmCgXgq2LHVQVhIyFSgmTq9G8LljH01eoYUjhJx5kfybuYCiso2EwNY+dcTs2
	dYUEhj4b55dk0MolINm/TeY2Z0rPKu2AJJFRlXvnvoQlJ3T6BfCJwtudgNf6U6qnXqNzFsQFB12
	h/1ExlFYuFYR8oTjk/RLBzsvEwtauy32PTlZXHTYbfZ1RCMQby9Fq
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr160951015ad.34.1781512455230;
        Mon, 15 Jun 2026 01:34:15 -0700 (PDT)
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c413eb775cmr160950555ad.34.1781512454746;
        Mon, 15 Jun 2026 01:34:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:14 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:54 +0530
Subject: [PATCH v4 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-1-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=15Up0J+FbwJVIGRY9JiOD8U4yeRHLJFpCKpZF7hc/+3ZGfnZWARaRaYWZU3DWtZwSxjPeU/aQ
 xdOt8iCMATcCF3QAkYKbQzM+Zsx3S4HetByuuecNdzg5Enl55/MbJmF
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: WjyGw2-_aul1pzDuqg3zbV1C3otjiCgW
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2fb907 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX+ghMB65okRXA
 JCzHNr7luV+3FuSCjHI0uWET+qYCZlKF7yJke9PanImNKzRbXCekogRvJ4eOzpdAg3SxvTV1trZ
 LkyTE37cbOmraynofD4HybvDSNdqVuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX8RgCJvT/R8kp
 FN7POeaXPNwCAkmZ5lr+aw/ooWXfpUqLRjpDEhst9UXCkI4YDBlGH+vHvQzH+QVCKditRkMQ2bi
 xFMxIuzNlyG/oAaFW8oHGpa2X0dnJuMA9HJaYJhxdoab1GY2cmPGodFcj5yoUvlu/XE0byBU4/l
 AFAm69yeHuBpep48fX6W1V2GxN8HR2yryiSDn6VfCfIg4ICqivxynztR2QoQtIx2iBno46gtlwe
 zJcIaVF+urb6orV/eNAXW3QMTVUCoJaahNcebvTRtOA5VP+QQnQoR+7wPPYyNJKKwF0W39da7mw
 eiNXpgoSQ0WRxeyWpCd0ryx2AAto5e5DMlBPzeCHtxoFSemu8ECys/8SrPC+HnlZMuv9Xv5kz5+
 24QwS5uIKAazfSPBuryabZzOAs2fKzw0Rmtd8v1rZRhtdYmbCgK7git2fh0eDL4pLllfXvW8PbS
 2aT5yn21dTPSp+DLOOw==
X-Proofpoint-ORIG-GUID: WjyGw2-_aul1pzDuqg3zbV1C3otjiCgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1

