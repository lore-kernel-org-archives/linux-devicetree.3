Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2A53C3F67
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285270; cv=none; b=PNlG5W2Vm1DlavmDhYlRrKje225BAzvVtDtN7iZSBFjidgkrMt1+bvjd15LKIO3vCJGSNbxKim6PFRpTIA5JpX/9GkIshw6AlRez22L1CmCnYuRPTo05KdhCyjFfGymC1C9ZsefegLIhAjtOQQMUY7TpW2aBSqaNOMAl1Bd601U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285270; c=relaxed/simple;
	bh=zGHk3MfhmiAb4EiIwnRAES6AmHNoERAFk9ME9WyBloM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ujk7teO6h4C15PddLNWUmHeJ6IwqWxab3OiDODThmll2CcU32iHi/nOkzOAXIAeYcUAE7kyMqOnglvSfudQgRbAJoR0nWMKvvuZvAhqLSPZp1fCJdRO/F8QCQ1vxXGdQsDsSlZp5MCfKfiL5MyvpOVKQKkRskoylBHk71w8NZ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Air0l3m1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgvpcKMc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Air0l3m1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgvpcKMc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARL46555675
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 11:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=; b=Air0l3m1Fb/GFS56
	4WfyxfDAyQRfD0pxrCNoTiecMzvTGATiFX94hFDntblThnpkxDUD5DDzNcsK8lOX
	ogzHKB9AaU6Ty3BzML5dzw3BESoWxv29qVv1LsRfajMSDHx1nx2Xy0TY8S1EFvpr
	mfUNdQ4sV6KgeWq5N7EFGquOn476B+DgCxWFAdsHiR5OjO9SLPcopiKpUK3SC+bW
	61KLv+poburXs6u3vUunbZSgyxQbEvN1sS7M8/sukWfpPw8fc8Qob4rpU89xLmkJ
	/CqV5Wtqzzml5SeWFzuyVl/W7yNBqW3MAlq2NMjLyadtEfU8Z47pxq3GAEnXV6LE
	KthVqw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9rb64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 11:14:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4f7eb79f2so2785162a91.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791285267; x=1791890067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=;
        b=HgvpcKMcz1/2kBSuSqPO4FDGVhh5eG/Heb2t2tewh4WW86VVA9IUfNupimTGaWbTY6
         y4us1EHY7qkOhugKMGgluQY0+HbSgd0ty1AUHUP/Wio9W8s+R3vM2LY7LScRoSGI+MXa
         D6eo4UJ8px7aLQnMvLQz9qmiamjHmQsquZSeKLhsIRs/VQ8YhdPYRXdRwu/8KD5Y2WZn
         NXQkRIor7wczLRSbhaXOlS3zE4EghWz+xURvuZJANVpVOy5mW9nyL0jiiVzDHn+iiCx4
         BmeHoVlW+jGEJ/hzHYwGiqWxod2tRZOEyATFTQuwDGxzMqFE8bY1qWJM6kjjfGBKM0HN
         FhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285267; x=1791890067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mKE8/aG6YFx0Rzm0N6mZ6wjhkusQUNFNvey825JE78=;
        b=IlOvslc5zyt3te1IOq5YUsOtPYW1KCPOohJhImboeJNVcm2SGIuK40N3alVP1lHGsi
         jQMix9DanAd04t347Ed0VpGvjGdpx9fvclTsTxMNEn2eigFqvfMIEI/L9o5J3nrSBJ+B
         6X3mKgfF2K2jo27GIhT3Jy0ATs/W4omUY4B52DctxRNd/k3mjcitY2wYKdi0KFzWRGyi
         hRFK+mwh3PMSrnM9TcyAe4otv+s3t4TbgQrU/lg016FKfJEilbrBSAzrF+v/oI3rWMPR
         /bRSLpArSgqIcGzRvoiYVpUSj5wk5cPF/Gb3s1M1fbRSn7tewATF2EDuFqwWJv6viMps
         wdnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpF1U9NzbSnsH7TDlurqBMBZrxSD2nQreRUJMaZYIxIzRJAyyEb4OkZdJaFitA6JXoulTeAI32sqDq@vger.kernel.org
X-Gm-Message-State: AFq9FYJLWe6pm100UCP04NpFW/kjWqpZ/rTsdgEarTTHap0ausXa5vbN
	96XwURum90AofR5ByATfYBfwfal99Xy9VRL3d99hJWPScGPLOXEMKqo3As+R1PGk05EiTx9Cwm/
	EqPbsMmaNPlOVDGHys7t5tVef2VBLzAyR3yW9Woixiw/SkX4PJDLEjFGBfCQrESgB
X-Gm-Gg: AYBFou32OFZ9aKAMVNP34Wq4cACKey18sY7wFiB/b01dO5pbPLwjfSa+mnlC50N+VkW
	e2ZMb4gDJ8cNoTH7iFl88MVfNKv5s4K3hjXOfaZfEFrA3ONlB/eiyelh18n9p56GhsElDAylZJE
	llMD471TaWQl5FLY0wYbQbeckC1Jw1Z85A8JUB3+BHTHjEYZmk4mPYCtSmVRJXfSbFgbrYA2TYz
	vhJydmw+/G+rKSy5shgB4RvdOG5Mxp9JhI0nDdiNPiH0zBpnLbQdZYaeK9Za9AaH2EXtb8hGl7e
	2TaE49QJrXQUp/SKTfP0+Sal8relHxI/UDMUROjYWR1ZQ2h6JwTKJW43iiCp866VmruVaJtL9rP
	HDS82KToGcQRjenWSZaipLB/Iq17kN4QBaw==
X-Received: by 2002:a17:90a:e7cf:b0:3a8:181a:2bfb with SMTP id 98e67ed59e1d1-3a873546726mr394128a91.23.1791285267120;
        Tue, 06 Oct 2026 04:14:27 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cf:b0:3a8:181a:2bfb with SMTP id 98e67ed59e1d1-3a873546726mr394102a91.23.1791285266258;
        Tue, 06 Oct 2026 04:14:26 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4306838a91.13.2026.10.06.04.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:14:25 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:44:03 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-shikra_qce_fix-v1-1-8ac54d81edb4@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
In-Reply-To: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac4d814 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DcSQVDPtFCqqlbpqkFgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX5+u7mIxXMpQD
 qDY7QmSMiV0o1wVF6kSjsWnfvLO2PffPXJRcKtkJ7yQ1fa79IHte0tt/UBuyIw6uVrVOojL1rGt
 3u0en9W+SxUn3HlcaKQi21cCgMBTAhY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX6y8+LYgKPJwt
 uBtssyteAgDfJY6MSDPmDA8ztAYW0En8L2DcsOI6MErIYQcbcUjtVFkHGA2V8uz0VHyLqqSH5rA
 bfYi3/u50TtoWFOOQrHBw8fFNogAAsCgy1AgswRqDaQ9J9L2BGQk25T2D44pkQ8LMxwZVrcJDz6
 Aa4PC6YiBc8NzMeKmerfaso6Ons/BQDBnxfoIfvp3cVIIQbUJac6inoN9ZeqMi+P5GSbCBEMBTE
 AX6/SqTrhQ62rDaa1NZEXL6VzHwD5dB+Vug3ovRYjyjuSGqZbah/+z9+VvkTr6lg3cre428STRm
 y2FSwfvSbPZ9BJhT1UEGHvLwFJy2tYMlUKJ8/0AgXylS/BQ1F+3L83eaBzOMZnEAnSj30G88zuN
 8Pgb58RsbI/xNTVCN93d+qoncCLrWJER0bfWf+z1T9uvFmD9BZZeFAuQ0ejoLNAKb7aeSDvSdcq
 kzAc8GNDDhgej8STXTg==
X-Proofpoint-ORIG-GUID: a-6clfWOCU_7bAgCLZJe9ckoXoTDhJuK
X-Proofpoint-GUID: a-6clfWOCU_7bAgCLZJe9ckoXoTDhJuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060044

Shikra reuses the same QCE integration as Agatti and should follow the
corresponding binding requirements too.

Move the Shikra compatible to the appropriate binding hierarchy
(matching qcom,qcm2290-qce) to reflect the underlying hardware
description.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

