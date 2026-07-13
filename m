Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCEA3AA9F4
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930637; cv=none; b=QMYoA8Z6m4QR7yUjDosElJ4eedJ2sJwxQtoMCe1Avqzh7VBcs/Tu5SK+9rAWhTVNtWM2V9yDxQbONP6I5UeISDbgw8SfnZyOoaa5lyLllmxOssOwJ3qYVbJdWKotsba7bKB+NPbiuK1pcSUevJANh5ed9lr4uR9SrtQ6+o4cj/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930637; c=relaxed/simple;
	bh=jcihse7XknEeHdBahZIOmT1iE81AjYNGrMrlfd6oH1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oMZMy0dWxdm5qby8O68A1TtMr7q8IesAMXj2IPDkevp2LTZYzZmVSijXvrOpEw3FACLdzogWW5wIi6mhXbIsOVHCe+os4Ty5ZXj2fX1RuE43E6w7kwlXgaVnQXiPW2oIBCG97YJCdGFYIoQqW2cOzO7BLfn2Ngjz062H/FH2XZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9mlEDSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9SssQgy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9mlEDSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9SssQgy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nw1E390873
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=; b=a9mlEDSRik9plQR3
	9Klj4DEoBPqTfLiVx4TYQDKtZNknYkcQVFOHQK1vpZXa1UzpNWHx6BrHttuLO3gU
	b4PloGw4orUz/eOAyvmYmDwddpEDgYyBnpodOLyTzHE2UA6S3KpGWWLDP0xJCiQG
	BQsgo9vlSxCfjXCsYDHtlKVjtM2kuFfhIUCt/57suVQIP+WvJbaoMPB/WJwX2+57
	mfjHsREb2R3aTIp3INuCVzoNizVWrtO8hnBzBk2R2qgyu5HBF3/ZnkhX6Frb9YaO
	CJJCfMAgcDo6nuIGSloy/8Ays58QjwPWJv8YMLoTLwIqheoiqAN1YwbzIlZcYG0T
	ni5eaA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gn166-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:17:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482fd61e83so5874518b3a.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783930634; x=1784535434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=;
        b=L9SssQgy+0kn8rZYM0kur2DR9cVZstfuKVkQR8oZRLGJ+Z4baEMTPowzwQN41pnXvm
         zBR0G/3a5HIbNdq3ZhQP4n25owiZ392G1nThIjYYU3UJv3ByLsGuJdkqw1k2G0/2D8+C
         ANp1IjAUX/aS052fwrypdeaUkvMHy+Muyo/qFCQR9xMwjnbcly0rOTbJgYy9sb46sQ/3
         IzNFCejb6kg7JfOnUaRTcMvgDynGeAE+Za0anmM2HzXMf1by1DeYJIVzyy786hdseVi0
         krYj59qjwIjaEiIfQ3/MpilATzVRFWCP+qrJh9uD/tek85A8tTXQ1cuIY2RMmoZU4puX
         GbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930634; x=1784535434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E9wnYtQkQUVdlCALiZYvZk0M2bJge/N2ttVKzg1N0s=;
        b=sYrI90WFHu7LiDrnyoR1UutV8+y951BFQ3cbta1bX00ChBlOD5ZT9xY5aDV5iosuNr
         3V7sU4SE1fWQBTei+Qe9z34FDiRzIXLK9VqQ7S4JDCAS7hM5mszIwrCtkFABvJBEZVms
         J/S6RrWN/JfdjYQAW1khrqv/TGjQAQGH9j0B3kmwtsQ5c5sBFT0hcI5MwNUgqEFlsKTx
         X8r6OzVNLwadcTf3mF/gWkOIXTBlGDrbkCC9sv557oWC3jH1zXEAhQNreUv5zTH+B7l1
         Op+z04LtzUOm+yJ6z7Qvdd1/wwBuYEucMtocOwiXAIxQ9A+AzT8v/Bz/BOMuBZfUGc6i
         pgUw==
X-Forwarded-Encrypted: i=1; AHgh+Rq48ua0+TbbTy3Z1D8O45AIG20GzwKymwjTtb5BFlnGXvVcSnaZw0uUU8Jt+rbjQve02ATxrT3H3gv4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx16brmeu47II4Oryo05oZL88koodUIcq4Z7JOWM7TH2p8i9Lr+
	v0E4yMjhxrp6KxgcFQm/Zm+3xajsft7kVdOjYVS4I+2Zn3snekuu2Pov0FMn4ShFemKAz3zGLfj
	Hbq+ywqNbwrs1ypdfiTkSqsM6LXdz39jPRUGPAS3CmaEL9fzHUQS/D4BuqOyX5M4s
X-Gm-Gg: AfdE7cko7O7+L4VO+gRICM0raIuIfuuChv1K3q1/A8LcWT1BSP/Gf86KmeVNYjUzqww
	IQtGx3RuCjM0TxntGznuYkE/qBs6Fy5aJ0NgDZg4UnoYjSRhVF57r80UhU0x0VJC12anG3T6RYn
	rDSQJ7GEWsgAwUBDW9jNMbtehuIcg+Y4je3OAry62Mdy7sP0mM524meh49Eg/p9muYWIZkr9Nh7
	KVrXyyItSoQX9cPupI5u1RJPVifoZtKV0q8A5bXj6pD+QUfOWKu4Q/dYQVhFTGANo1obFLPjTxW
	E5TbtGEaBqiOZ3GBgEZwaObGgp5SjPQ/jeodDDr3az4CebN6PNIQDChBYfpqZSG3HAxS1AnktPR
	IiKxjmcJ8b5NfQpD0iEoSxScuvwDrZeWWC6ICWriE
X-Received: by 2002:a05:6a00:230a:b0:847:9367:e054 with SMTP id d2e1a72fcca58-8488976fd39mr6896233b3a.57.1783930634420;
        Mon, 13 Jul 2026 01:17:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:230a:b0:847:9367:e054 with SMTP id d2e1a72fcca58-8488976fd39mr6896208b3a.57.1783930633998;
        Mon, 13 Jul 2026 01:17:13 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm6283954a12.6.2026.07.13.01.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:17:13 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:46:54 +0530
Subject: [PATCH v3 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra_stats-v3-1-4be17121729d@oss.qualcomm.com>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
In-Reply-To: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783930626; l=1073;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=jcihse7XknEeHdBahZIOmT1iE81AjYNGrMrlfd6oH1A=;
 b=7jbz6NAlnIoVq22AYyzn7HPIw9lwBkkGm1ytbi12FTx92EOSqLamP6V4ue/8+LPNWwdAvx0Qa
 28tBx6T7eBDAZvmneS8MnT+pe/9uIQdZeoogfqjFDVkIcV10lYXRwQt
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a549f0b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ejYHyDfMZPm78Zg7qAUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 6-pHTd1BLTkwLq7j_IRHf_cYjYZpmSak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX8qU47E42OeWs
 uLzQPsn1Z+EGG0o/+ML4gL+x1aICeMaJ3GhBa6MYgW7PY/cUae6ZzjS7Caz02Fc2KhfmeUPrOe0
 2gnmcJtfhuNQqUY0GtF5qjJgvEkafTDFs/nvEjeygWqeeHHxalH4t9Tp4t90oG2orWmE7APYWcS
 TMeLf0Sbj4pE28ZSSO1VzJyahKKCvcHjK4qKeg2zIoQZ+lgn9LFiWqj0xTvaquGGNSAGKuISghs
 HbExIqtowu2gBqL/7TpPCKhjU7OxvPOXW8vf2IaYpcyuEdN90xrsaIG7pPm3l5xAOstkJmybOdx
 j+e9MrAwJq2cV+lcZz0mLI1eodxCYpTEcKrQBbi2BvHmXxKt7eGSZGXx6CpKp5sG7q/rh97pweu
 BEyO1CBZJ0PziWwG7+JTOiFZEve8RILSTq1qr0v6mk+0uKMvNer+TbKSRbvm8OkiMwOnN87x08/
 igJkxp/PBBF+bUqHdeA==
X-Proofpoint-GUID: 6-pHTd1BLTkwLq7j_IRHf_cYjYZpmSak
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4NSBTYWx0ZWRfX2vDy6SVBhVi6
 P8i5FR1TCY06dlhtyYe8ShhrfmUdICHHE5wj6lcdJ/hvr+EmBb0ivjy1DZeMZSKclejetCT4zCP
 S13r4dJfdpjqO7nhGUgOik3xesp/P3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130085

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are present
in SMEM for Shikra.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats
like vmin and vlow.

Document shikra rpm compatible to read subsystem LPM stats too
along with SoC LPM stats.

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48af11a0e63904ff979e40d7538de65..43751115c5b4e2943c93d37d3e27c839b4057529 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,msm8226-rpm-stats
       - qcom,msm8916-rpm-stats
       - qcom,msm8974-rpm-stats
+      - qcom,shikra-rpm-stats
 
   reg:
     maxItems: 1

-- 
2.34.1

