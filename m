Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCDE4B1CF0
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405683; cv=none; b=ctMmhrpukoWThpl+G++NKCAIQOocc/YRq/6LGvXWXESJVqb/tx4CgYjRvc5S3RY5wUyvBkfi1zxTDm/zt22UQbkoZjB2/UGa9m+yiSTQRX2bTvFDtX4QqQSsNfJ+SHK932tfIKVQ7r/5DY7Dj1EmXWtY32qgvEy0wCUAGfMNJCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405683; c=relaxed/simple;
	bh=kh9tVQY45GrFiUF1ke5Gy15WoD3EZQssJNTVFnwj+Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8RKIc1Anmllci5SswUHj3a7sNZO0u1qAMgBrgH8bS6Chyxfygjyv7b6jKSQV/Pbv5fXF+IibGtrGBXNISRHS/IXqfZTw7wbn4Pj4/mO1nE8012KoytG8ICboekePZtLlv8cfJaxkbzgI5PYXsSOgA7UCKLXtIgkOkFl1N3W8uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnDWjQ4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXEn/Bxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnDWjQ4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXEn/Bxs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PCnA2193374
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=; b=JnDWjQ4kO6XUsV/v
	5kM1gqbSRdE+yDtqxpwEk5PDtcGB87T7XauBrx5qwzkB74yNaAZGtBPgWu46gaBL
	yrX9dN+EVXy2UxDFzwCmnF3BDFXaPtk1amqrbtmgAYyPvSiAQW3Ub1Jr+jXcYHzO
	Z1QAZLp/fVbMvXw4xASG98RoQ54x7QwrhZakug22CD6RHsWSESrBbwZY943E27PL
	gUno98tIJtj3x2HMM5Gl3oSmara2n3xMsPMt+vJ03LH7b8qtYfkZ7v3A0cfu93Os
	2rbUvHYxTIQZ91vejt2WFFAhezTZtXDUIdRWS9WvJc4vXZRD1geKwO7a/qMpRfv0
	QCyGNQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1a9a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:28:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so15586775ad.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405680; x=1793010480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=;
        b=aXEn/BxskgHNgTuOU6EflywR9ImI/H9dW9RbN5tL8mq6m0xfJJyq3jo/WTcjtwI2Hq
         aW86YCzJ/MEDvGw6wGLsAF2MZ+JH9i52br48zlsUJFc/gPdvyH+qh6rZecCNI+5ja/FC
         dmvoBFRLOOn8T3LTQsAmOeYFpIYSBhnSYn0AhKj6N2FPeVW4aLiYex/ZMY8Z2CeOOjEY
         pdYNgdZRa7aoDoN3OB6IfogA/aYbZsJCnvyNWuBlO44RnoowsOlsHaaebPlaqbMNIxiU
         7NXvwFIAqiIQ/SBHqdcC0EH1nAiNR9RfwmcMbg/cG6negvoOUYLumLCLjFfCMoRGo+Kx
         2B5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405680; x=1793010480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=;
        b=QP8zyTHhZ0UkyLVq3aAudButaA+Pvnch+aNVfogut+5eQYT9anip3Q68Pgd6nt+Roo
         dyj+lKlP9RdZxukq0Sb2+n+Nv+NLXggN4zrYWsStvzATRSNdvAx1/TD95squbiKZtYMV
         Ac/IA10XDjNYb9iPKSnY2gIWMYClhaaWUvK9eO8p9L19Caoqdni5DmYNTPNzmG+hUF4R
         C4axtb7zI2O5HnfUeoWZ1AVJkVUmIo0yAeN4lGsjPekTWVI3e3kFCsQNinR1bbRJi7j6
         ZRtenQ23XdEcG2PzU2cQJY+etQEX9sYMnECPNiBcw/d8Kdw+88cbyNmA1+2dBPXicq45
         XDwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIjVmkGyYXcpcNJgOW4uGUd0ntT8uVCmhN9835okeHfq74G9lASHFCqf1dWkGucpxz9wfkiDP3nnUb@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9kTLAQ45rRWpR6sa/5DqlBtj3yzTA5NfVyxQfDZv8DTwskyKF
	/+moHor9e9hmkAREitGhnEC30fGKW7h97gmXcumrMPESBoM9FXpkfDiWYXywUJHwdlxG9c+cu13
	LNzbFdRi+NpjrQwUSFPxrRQJnlLmGpy+GaUOys+ErMLZjFbXCO9bL2NcDquma4CT9
X-Gm-Gg: AYBFou1MGBAoYr6exV49OHbnFvYKWqmKiw24ySP9aygdCgxfXX+I6IpCF+CP6LFt/mH
	5zuwrXGp0lzKDmduuUqBmltPECSj7ghDkICap3LUnAvRaTMid70B3iQMXUCUWKEbKLEmlDgtrj7
	cQCj2Xdias11JG5EYk9TE+Z50VbM3g1YZCrOQjf5dabZti4J+XegfEvGPZaOJvWM61Pk51/Xg/E
	VoKJBmg32siZCtb/en1U4nN+OnsH5DuMzmb7vbeyFH4Ww4g+5p5/QkmGrZSDG5laJYkEZ8Ksc0y
	bSDV9HKr5bizF3d7YuS0tIETQlacqLn1Xvji8h2VeqMV6/O3kzVSITawkhxzIeyD45xXtMjECtv
	X2aP/6zpnXFFfTIyt81++DenNcKBphbBq5ml28A==
X-Received: by 2002:a17:902:e948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2e9a70585cfmr51669265ad.51.1792405680207;
        Mon, 19 Oct 2026 03:28:00 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2e9a70585cfmr51669195ad.51.1792405679717;
        Mon, 19 Oct 2026 03:27:59 -0700 (PDT)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d7ef1sm36359785ad.3.2026.10.19.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:59 -0700 (PDT)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:57:32 +0530
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-lemans-draco-final-changes-bringup-v1-1-dcabe94f1074@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405669; l=848;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=kh9tVQY45GrFiUF1ke5Gy15WoD3EZQssJNTVFnwj+Lo=;
 b=DwTof/h1vzH5Akmys70qASYAZ6TGtPsc+jfUBRIrmZF6EmdnbAhzunQNEldstBP86IJA/fEpf
 gLV3DFxYCH/CsQkwWG/EvQXeY93qQPg0Cjxf408hyXpWlzb+KXXWg1/
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX5Z0zhR1bIqUe
 HLRxZpPUlu6NUONlvXqXb+hOLXR062m52Nee/ALpSb293KqryZ5TMGZ8z2nLGgJpIjrLcUVOAN2
 reUOZ/cZmSO2Ao0uRiUI2QFpK5J54rc=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5f0b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ghiYM7v6OCwGtqAZdvUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXzTErY4NFijCl
 dNgcIoxVAouDr8r+L7RANmQV7Yw5fE53PBrleonJQnyNfEorpCctlW1jAF4cQ5sITkg5QikR50D
 X1PooDcMPhhjOW+1vtTTaq01+wLtaASC6mCy9RaErKNZJK1rm90p7eAM8kJIdO4zTB49WLqmNn0
 jpJ0A4q/a24zk8BJSqjqYppt00GWnwM3JPgfeVE2DqhHuUhxHUVNeGhsELw/BaIHFrUGfFIkK4L
 tWU4mWAuPK8Pkj4CAqxxXylxCnSrBKOeeeCHILZJTkJx/pbjvDvyDqFkZ7UJ2U3O7ABhTd2JSy5
 grab9tpLBlBdzq0kDWx4IJqg8lXBJpGZQT8VkuWmecrwbWdL95uZBPJurHk6OZLKxqchFN8fuez
 cRz2GFKy7Vo23ue+KY1E2zwkyCyLejHDwIQaDAPsnPsl7jFlAKtrsFiY/cFNIMvd8vXf7K2tPzj
 oDejdkR0bnhhMZCNMOA==
X-Proofpoint-ORIG-GUID: AmT--Px6Vh90N94eS77oSObk-oSSd0Pl
X-Proofpoint-GUID: AmT--Px6Vh90N94eS77oSObk-oSSd0Pl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

Add the qcom,lemans-draco-evk compatible string for the LeMans Draco EVK
board, which pairs the LeMans Draco EVK SoM with a common carrier board.

Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..1efd6ea34c3f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -498,6 +498,7 @@ properties:
       - items:
           - enum:
               - qcom,lemans-evk
+              - qcom,lemans-draco-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
           - const: qcom,qcs9100

-- 
2.43.0

