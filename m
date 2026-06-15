Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07D03BB685
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507570; cv=none; b=ls/62AXsqPeiVERuKTRlvOYRF8s8AWBz45Bxu2COodtO7TwbmqkclzlXpUfNhsVjGAxVqx5UGd8uXrwmGRH/bGQLekZ4ITYWqeSPBVZXk6airH0x+8XZf5UJHz1y/plMRpP9EMTsN+GvEpT9iHH/98ljbORs7Du1MF6gBqZS8Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507570; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=khV+txVZ4Rd7EIeloGp+7TqgIZuH0CYju+i7+aoqqHlPgaYZUWkJajqSwv/pUQLQyQL3iBZ5gi7ZvDR5gnFllhBurGKW0UUzYCXFYU0UfCIskZYeqCI5HWVem0KL4V5KyuoRsaQoaXennve21WtY5Dn73bisnpekRI7ZSSxWUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPYp/7V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/z/f2Sp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DPYp/7V1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/z/f2Sp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LSG83889547
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=DPYp/7V1v0KJTR6k
	Pb2ikbRoKdm7tBCZIv7ExGns2q6zkh5AJzlF7prfQqdeCXtF6nXkST++T4QmHZ/9
	9iDGAoGPbWSpSQG4+IqdWrM17ShIojeDAzNB+8Bc0wE2+y0q59oEExuxqKCdaG2v
	5v928V9ykaIk+BIz5pfyBpeiIUSs+lcGYbV2eafCMOMJcmTA0bCcLt0VVIzWR9i/
	gbgWMKmY1Lk4ZDTL08fhBI77CCWP6e1iENUwerWdCIXk8pk03H1mSIuSDYRsndci
	EP+9iZke4E05gj9Hg4jM8fkirUaW8MttHrUH7yCMT/OxDIl9l29x0dLAdgaWjVOf
	qd0O/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wx4qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:12:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b9d265308so2200263a91.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507567; x=1782112367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=S/z/f2SpfvI0u4OOeCFbWnUi5v6qF02YijMWXA3TpQ0S7MUsDqltOYas1XYWrQTy3b
         eSBHF9y5HDZcPkZRukeaDlnAyajKXb7s+NjMi3DyrbXSi74c4ixdLxopxkujdVmWjp8C
         D/8A/jLqF61X6tP97UntE5eeJjE1AnIqJlHZgkA3m03JVhOloU77AbwScqvmHNySF6ie
         lQgXPCA8GO/sQo9R5/x0Kvh60jTG/G/bsktRU7Kgwl0xkgdPdgrMCLpVAxCiUa0P69gz
         ZIGhZevyxsHBptD8PzeuuPIomQJnnCbpT8Azr1JyTMRaGEKNo0YeoPHfHwdOMGuUAjLl
         8QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507567; x=1782112367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=IfPBgaBWAWnvBoDtAtWl3TdoIK14ipKrZuZrTa/YPq3EXUOYF7ECQ60ty+aR1XNBmB
         sY1BTJL4zWFFgmDshO0tulRL4HcRtlClYSw41z6rTN0PyRRjFMIieWYAATjLXJjJqnlh
         U+Il1IZOtS7GEFhAvn2jMEguBqzC+XM8u35mvK7NkhBZ4h8hvKvjWci/DFCn16ZR80PZ
         vfFDUJtR6Xm0UUNPQVU35qsOa6X89V89XC8VF08cJGyuPUT8D1cg7AiNQ8TcYAMKRj0V
         FooY7tp10ex4WDvLL4/uM/mjabXMDNm4hZ5RTPpFsS+5xVQDPiCXY+VqGDOb7XP2RXEe
         u2mw==
X-Forwarded-Encrypted: i=1; AFNElJ/0QXD2GPX4lc3VgRw5XfteghQC7UgbtFaxn9MLZZtZWjxcencuLLDfv40DtQZkO/O3/BJgwlBh4/M3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvo/d5kzp+9xR1Av4Oew4/fTtTKxEh/bfeS9KxeTyXJW0bvwDC
	cbyZ7pr1IJD+vT8ikOY8nl+6pt8MiBA4EhCSZHyojgs5siomq51WZhiYvKUSkujcZ/wOmrDY/zb
	Mta6mKt9k3HkGzjlp5SpXEnzA/VPKvPD4UHUtHb+6/KHTkjqmNMY5eIH1s7PFvcbN4lPOXxEh
X-Gm-Gg: Acq92OFpjcv5ph+e5Xf2/Ws98xqNVKnROXrVsQ6ohoW+3cjUeDOyHwc2e39wlfBgtAF
	9xYeelwTO9eB8XQCO4dXrtiI3UHhD2zgAWjzCm89BCjoGhiEsXsi4en5paSL/Ldp29h0cpIZBnS
	gSMa2/S11eN8sXaRYYPhYET4c+VlMjJQaQPXZl0WOON70fL8F9QksS+SvreRmgHx2+67MhqrYGe
	oZczfhlS8E3HQgERjuRWre/eqex9yQSUqfVHoVITBjk5bBzbltg7fIoo70YotWVqXbq/9WwPLhN
	mk13P1me4AK2tO46Scqkiaf0U6LVr2LQJIsiwBJi7gnrkZl5dKK/tR5w3VEpo1HY9wxR1DTFoGs
	fk1n2DEMr/sPOwSxH1wB2OMyIrN6chprZ8YBf+NJ3qj3QVdvLWS7Z
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907994a91.16.1781507566654;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907946a91.16.1781507566199;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:12 +0530
Subject: [PATCH v3 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-1-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=f6wJE4CawInMX9KIDvKJViD6Wlt5Tb8NHLZYnQ3WetCaKjTUaanZjZR6mQRiCRIVFywgsCQa2
 swTrlMBOBRpDRRcvKXIC37+gh3lI9mSmlKbAJyP4d8IYj/e0sooWdzj
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: YVq3LgIG0D_2-Mv_gRhhb0NraXBULwU3
X-Proofpoint-GUID: YVq3LgIG0D_2-Mv_gRhhb0NraXBULwU3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX4Z32xmwKjufw
 cEI8XL9ZA0WHfYMM2ND/kg0ENpuV0am4faPcWNI1InOINSMeX0fU39XNEletjy0kurT1TZaF0SI
 vgeItB2dGoFXR3eb/liAwoVwmOrbvfE=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fa5ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX16dcu7EAMlaW
 BSYyg63VUzeyAAYQPWEK+ioLPZrOO+QQxjNYBsbCTQSTVYcZAqcEqCX8/LdYiQc4SmIpG9UPnQS
 XVwZ++k5QVYQPJGypMzjvCrkOcJiHjhTF9XCatcPYtSxU41wFVhNnleDl0mg4svaYE8zg+vVXQb
 S7T90nu6OxisAVQyA3gB68K0iiybZo736J4zKOscVZ/kayj9mC2PF9UaTgWFLUMVaaYJ7Sxs3u1
 FVEql06jtFtAy3ZU8I4ZWTItCI64JkOAymcMNAZKRRPXWRJ/tOa9G3s7vLiHfnaJOnRfkP0ZUvH
 vpWpswIZQ4xnSPG8Q7VtSzD1gJ/MtkeWx3w8zzCwKW1NvHGJgGitotxL95Z7MnNLejtaNKYrq4C
 M6ARYKETRtZAMIdHOhMyqyZ8WN0b89O+fpGNwZeJZjiceabTBY2L9p7uSNe8aQ2H9xLXjeoqnUy
 d4ShgIcNtR/96A9guog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073

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

