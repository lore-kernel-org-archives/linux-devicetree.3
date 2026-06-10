Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63B403AF5
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090136; cv=none; b=ZPDRRuEKp9ylwUkCxChYcK5U5ry7yv+8pOnzjreOtA5eddqIyT39OfKvqlbO0gebeuLbcf518ZI9CscwMpLbB4rDllJH2wOIpoAq0sxgXIjWUEV5o0l7fUm1WtSd5DrTuxqrpjejr6q4A9gheCTt61I0dioqPYIEbR4HKDiUk10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090136; c=relaxed/simple;
	bh=Uqluud263E5brCcr2XHFpOjXh+t6eAS3H76ENv887cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a1NrJh5bG1n+ywIekg01tjKKtr50YuhKnNt0MveugOi8/34G+8V73Lp0qnjYNxddOmGcioVdT6Cm7MK5nsrNVUKlKHKoDtVtdPaRBB7s2fSfZhmlHkO/LQlvwobTOVy9gso0pHLx2FI2S7Am1RMq69aA/dBdEU7hqFsifEmDu4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSCo754+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd1og7XO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSCo754+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jd1og7XO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hrgb531016
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aZA4ZrQW69o
	qC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=; b=cSCo754+MLgEi9UnQHg4WjuzGDz
	+4zOqTJAGdnpsrO9vQkrNsNBs/4V4HduNNtNz3krlJD0/Jzc8DGtmSf0gIu59HBB
	2UfGvIoqO/ZXLblnCwhFpMbJ1y+VRSWH3mR5bnNfHIaAPC4mpsHuDaX7k+NS/xsW
	S5gsUAY7Ygk7wWr28zTyF1e26HhIEPvbngV3PTa5DUqZWJ5QEfPR0d4iBZ+w9rcP
	n/K8usoWJbWijHxGKJiZpJxxB5l4IEyaY7XE3yinL4s6xAmpGOppghNVm9bLoyBZ
	1Bco41rqY7HV+EFUufZKIgMzVKYz2hQ/VsX7Alnb4inbzwR2p1jyVX0PlKg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh27b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:15:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1845bddfso77189165ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090128; x=1781694928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZA4ZrQW69oqC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=;
        b=Jd1og7XOSWtfR/MntffNHUkTwWnMLVtFRF3tEb2vf+Ejai01EUMHVvUQTA8EyvEmfM
         1jo1MSTKfJD2CGyj5V4uZp/lQEJU9K+qE2Hi67kTikvbomV5lR8m0wMXL0+4TubCkbEL
         nHIddspKj5HYdDnVK8rNvHW85r4H6Ws4MQL465cqs2nA0HSRFwrtqzidmlB22fDqJ+gS
         JCSDk4miKuUWYXgAte8aoLb4LuxOw3YBLiKDkRvCL3uHXvAJG202nRybdMRnAe8fCGWu
         wo0LpRk7GrH8bhQ+Jk7d2/ZfMp5S0SNTB5JlwFj1niQuxglPrwQUiormsBD7PXDBTcRB
         VJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090128; x=1781694928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aZA4ZrQW69oqC6+CpeaGYgpvQV9ESaL7nyZ87hOcFP8=;
        b=Ei+qd/5RrlHMBcWsEcFtLMDb//iol4MCBObFBMySqbwax9y+KTzAzBoxVM/Ew0B1vj
         QOK5NsjYfpjMK5KIrh3rOXEkPSXMMvioWaXOiPOzYxzzYZWtHH4IVMYP8pTKHiS5kC7G
         mlF62HBt5lxOifL16WYs4lzPPHm/O+jIXJbDFTEFjt9wwsgzRuC4M5uznXCFiQWczj4c
         qQe2fCtYJsH+4VHXAAQBoGCwCCetvWP3eDCNVfc+OnzD0pVs6oP2nv2lVdR9iJP030kD
         2BJh+du6aa5dxoP0iqyDXGWCwXWQNCWGZKAmTonueJ0iKF5wPo/f5PDOf29KxNOolMda
         NGeg==
X-Forwarded-Encrypted: i=1; AFNElJ8JP9MIvthrvJG8/16/ooHQUkHkdBL2mTATSGD8uHjudeSNBemStbaMUjZ5JnUHOwnLC99msOHfhEiL@vger.kernel.org
X-Gm-Message-State: AOJu0YzRVrzQevHTFJznGZY+ckVuVufOuOmiZj0PM3u1plPNedBXBbmb
	UfXn02on1lZdB3/DgsCYYb6oRjqJ4INVi6RZ0UmUPB4mOTzYeO2RICVcoi25fTcgVxasuKlsBs2
	/1uio8QC5Y+JKtS2cEaJx3Dv9gowdduTFQrf1P6geeYN+D04Vog+ssAPcr3PZWiSZ
X-Gm-Gg: Acq92OGTxlDiaEo674/kaWDwM5S8PAPKw5gERzyPjjd765MovSpTRDFJy+mLQ32pp/+
	WfXo3ByU7Xvrius7RJvPgqpUSfT0ph3bA/xRz9PDhYV2NuEy4nOlrdNkw/mvM+J7LcbuwHzKRJQ
	ckL/KONqkxVYu3WIbwEgEmBQ5lkE4PoJ+C2fSkEyE2JIJsDgnWoAZ7jczSaTm6DTykVgzwCTakH
	CA+NeM7ziuF3LuVi8nCPRbEA7HJcNd9eIX+DwSOJf6b40Sm5CsXeNtSwQ8kqRv1Pvssaq+N+1xS
	Rif2fcmvOayqgudOVfwBf30TS1TZWw2A7B/QNd8uUm0Rg/kCVmvxxbryloCr9VFgaejQzUWBetT
	DhFYhWJtRHfJl1BR9SH2agMhPnmBe4/qgSZmf+8YHxfDSeycFj7gpjrzOt6o=
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr271259655ad.16.1781090128001;
        Wed, 10 Jun 2026 04:15:28 -0700 (PDT)
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr271259265ad.16.1781090127400;
        Wed, 10 Jun 2026 04:15:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:27 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
Date: Wed, 10 Jun 2026 16:45:06 +0530
Message-Id: <20260610111508.3941207-3-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfXxr9o/7IzPKT5
 YEdnpQ37Ht63hlvgkXKBphhjpj8eVcLNjR4a0XMFA+yAo1kKQE0BxzaLV+aECupbDap2SBRuVt1
 9IOWysYKqWqA7kMzANuxeCnUw9ryI2ZoTCvaOBxLfGd03UiQmJ25fZsiupLjIAz0mKhHAq4HBhW
 XjMYG/z7nHzUTqKKi2NEThyrOYklIYkyZqOFuyJ2UkNHoX6XxJxrNaNz2+YnUda8a8oLBAnapxi
 2LQkugzz3qKf8kop+JW88O55JvRULWNCHF0J7Etw09QU8X6sy0E88OstyOHY3ORhzN71c+JA+hN
 UAb/14be9pfv02Da7BrMhMFZccAauLgtrwS4u2a2+uIXw3xC3cBTXM8mVFhHG/x83OBHN+3pYGV
 kBD9z666ZzPJHJyAWv/WNjpHzndWosoVfYPj/gm0PD09dUdK4L5RJzovqqAYoOcIwcS3qvKwtfK
 6+O5mM3nsv/xHX0RDRQ==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a294750 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6d2A0baYHafENtA5ngIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: --OijmlgHbxDbf8RPrzx98nOPxTfjGt0
X-Proofpoint-GUID: --OijmlgHbxDbf8RPrzx98nOPxTfjGt0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Document the Glymur-specific SDHCI compatible in the sdhci-msm binding.
Use "qcom,sdhci-msm-v5" as the fallback compatible for the MSM SDHCI v5
controller used on Glymur.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index bd558a11b792..6a8ef84617a9 100644
--- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -38,6 +38,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-sdhci
+              - qcom,glymur-sdhci
               - qcom,hawi-sdhci
               - qcom,ipq5018-sdhci
               - qcom,ipq5210-sdhci
-- 
2.34.1

