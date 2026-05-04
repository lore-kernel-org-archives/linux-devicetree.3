Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E02DC344
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 07:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777878826; cv=none; b=MjpRs/jzXK1eUOZpVmawEsSrQA8XY0k3IbjCGf5arQIxqg9Jq6k56lSxeWitIyYaiWA234oH40jxpNm1ufQBee+I3kNDHirrd/rWf+OuwMhJbU12Y5sQlE5AH0LyLwPHgnge6xuEtSN6dyFrZFdhjD+8PDmv9dCFhfcYW1q1qWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777878826; c=relaxed/simple;
	bh=mgDoBSAakO9qDXsL2/r9FFZEdsZsiOoecAZxo6z85zA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QAAZddPfaIrzzquZ/f5gdkROoDEhPRGOXAOxEU62dA16RRknXqULJT4cEVx/ZdNqYQ6bfh9zuZbjhUk3ZJ/Uxng6q8wUkJzKKfuxdbSkAH90s6rBb+ZCD2KsNztGkvDJMdGtTdsiXsCYrd5Qw4Q6TIXgr/61ByfKHpo8QDY+WG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4/Q91Lk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSo4CbXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4/Q91Lk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSo4CbXu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DDeK3505090
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 07:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uhCXwzdwT3yWeiBLgjZNG1h99Opv1nJwQpv
	6j8pehy8=; b=o4/Q91LkPvsSEOePrTanCCr/SFdDOcFQqQh4TnlR+keBerlQYV5
	BTDcx5njSqnpo/kKJBGBuksiZtDQMWreeHqtvHpbJuJuvJundJ2km+EEdd+9xUKo
	/TKwsg+fITw33YG2qcq1FxYCna9/4EWKLmPckbgzwYAdlvucAqUlCiacjD9mB24U
	+cpGLDXi815BXzmuCDPsH/1CcIYo4vhq4wfaxmJ4aOaW5bdgxS0LP7wwH+hZdXy+
	g1tVMw2ogRFZa+1nvgN1u0RENPf2r+X8VGzv2uJ0ufjjbcxSr9KYS9vH4OnqEgbx
	4Rb9gBdmK3eNu5qrgAvvsC70sraDfTLxH+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6yfd0p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 07:13:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e06219cbso32585365ad.3
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777878824; x=1778483624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhCXwzdwT3yWeiBLgjZNG1h99Opv1nJwQpv6j8pehy8=;
        b=YSo4CbXu4qzhmQfjw0iDn6IQoe3D52LXujWE4KTpuKLkpP0s5xAmFqTbng4AL9TKnO
         LHpQUsHl2+NS2hddBA770M/hdk97EL9W9Jf0tfoVuaXzXMG60E0QIFL48nCHnd9rEOWx
         7U5sbUUvxt4f2jyDZUVT7NR2CFEL0Wah6ug45WfC8vbsI9E5q9l0BfcJgQZYB9ktr9q/
         KMyVbCirK7K789WeZq/usqDN9tFd+4NcS8TaOOqTfsd2O0UdzavqIYU1rZTEe18Mp5mL
         QOM+JuP4KhjDMOGF0HhHzCqmEmLQBIZ3zp6ifaZcCDeWwtJRe88/Kv89k0vyOjKPhO+6
         5wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777878824; x=1778483624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhCXwzdwT3yWeiBLgjZNG1h99Opv1nJwQpv6j8pehy8=;
        b=InKiSPekeL3Z4XyI27nTzabQxADVAm0l7tChBDoAl46IEc9tfSKBZkSBJILAvKM17P
         fHC8OYMZ9INQSZTn1tw0wRRB+BNk9PvHmUps/iPV/rEO0Ynfwp1pdik5jnuS7bKSkjKZ
         xKMCYMxSfFf0rOJddn/RJwENiV6UZvMnBDrK3uyP9LUaBGXd5MkflAZa+VxxUWx0Kj3r
         Wc7BSy4q0zaZUOTZSgj/LvR94Ues49PNJJIo/xE3hAYCnhawhM4SoTOUF/vngvkngSew
         2V26wsO1z3PLyPsI9r6NjUnWHTpkY3MJzx8O4uvr4DQfucC+HHUYFJuv42FLq+guSgK/
         pRUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AsS9svQxvoo08KSHHQm9wmEUfUPOisESW8J60CjHlWI570MeF3nwLiWp77DFKrW5JD7pNqyrmm0nQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxDQfuu4kLEwankxSZPU/2BcwYwcchiYXojDs70Mg8wsgZ+EwrZ
	y0T3SlEHX3YhPfSrHAtWilzlG3wnyDXehR87d/+DI9fcOWLwAu2udIw0Ge/PrLZPXt81+8c7q4S
	Ahwuqk4P3edunBg/2FJVn/ZENOKXGKcNQeDUEEkk/q4J0fIyj5MaVYL7nZhLx2AMT
X-Gm-Gg: AeBDieumajn7JKWFEZyFkudnVGZuUxNdPLVrkpCxi1tPA9bCekfYg43PEnxUv9msHU+
	QlD1oU0klE6PQRMaut5xpS4BLgnWQin53yjoDoAziUC7h1wLyWjxeVv83nxB74mqRhdWyYDTbAu
	FVOyc4uIavVXwJJEPVzBhEIF4XyIz/Ax58lIjx/8QBCRvDQtDXBTT5QNWYVlYt7TjPZ2zK7Jrcf
	zI2ZrboyiYa9wN5dEcBzs/5ZPswJgQe/UcgzkRhX2mGQybnsBpY+zZggS0ARPsNt2uIO2FogEf2
	JY11UepDeIBmCzw6TBB+DWTEAAjN9MiovpkgDqjgoKRT6du8j2Fp0dFBtTvD1mut76qwAteepbT
	334Tbde2FMlRx+FIrXnCdspDNtEnHarUdAOhM1Z92UOv7LdCXRGCmSIjbu5wAcFts89s=
X-Received: by 2002:a17:903:17ce:b0:2ba:60a:3108 with SMTP id d9443c01a7336-2ba060a3334mr57979145ad.34.1777878824222;
        Mon, 04 May 2026 00:13:44 -0700 (PDT)
X-Received: by 2002:a17:903:17ce:b0:2ba:60a:3108 with SMTP id d9443c01a7336-2ba060a3334mr57978955ad.34.1777878823761;
        Mon, 04 May 2026 00:13:43 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae6ac32sm96876715ad.83.2026.05.04.00.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 00:13:43 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V1] dt-bindings: mmc: sdhci-msm: Document the Shikra compatible
Date: Mon,  4 May 2026 12:43:34 +0530
Message-Id: <20260504071334.1061325-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C0bW2J0v_DDXPIa0svEjFN9yBoNvfmAO
X-Proofpoint-GUID: C0bW2J0v_DDXPIa0svEjFN9yBoNvfmAO
X-Authority-Analysis: v=2.4 cv=QY5WeMbv c=1 sm=1 tr=0 ts=69f84728 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=qygL5ZPXpCHcVOvnN3UA:9 a=zgiPjhLxNE0A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3NSBTYWx0ZWRfX42ud+9ghUJ+B
 LMeAQH7mUDgp83rWQvQsWiS/4gMnuuj1HgwKO+fwWK07XLM4i9Q3BNlC2wyrg0maYn0WBahl++6
 ldOoqgvUzurSz9b1gQ18cx08ky6y/HOXc7Ivw5S6J3nTZeA8Wojq+mUPVf05QpX+MoqzO3rhhhH
 EtJM0RutFZNJTc4eFGggTqP1rUwelrA5QFKxcaPTeRKXAXOBg5v1VXRY+7f7C7FwnD61pW+QO4l
 QUvnP3KZi6rfZ4TZdHPd88R33I3S7C2TiC7uuG5sZCUNBX0LCVc1udum7Lm/VwRRdgq5wHK+5L7
 GgIzc8JdYQO+WDXHklc9MkPWu4Zi06AgKF6DePhw6l0zO0mzNSearf8ASCTIqDoNfR3MOQyaC7R
 xvyXynWPk8GhOgaiH1YahQuABAZ4Lm54NUqPVl0QRq1WlogqToNFw1Wtz0fCwJszMSzCCM9lQj0
 JC6QX8fQB9/1X/Qo68Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040075

Add the MSM SDHCI compatible name to support both eMMC and SD card for
Shikra, which uses 'shikra' as the fallback SoC.

The SDHCI controller on Shikra is based on MSM SDHCI v5 IP. Hence,
document the compatible with "qcom,sdhci-msm-v5" as the fallback.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 695a95e8f35d..60dc6b0caa21 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -62,6 +62,7 @@ properties:
               - qcom,sdx55-sdhci
               - qcom,sdx65-sdhci
               - qcom,sdx75-sdhci
+              - qcom,shikra-sdhci
               - qcom,sm6115-sdhci
               - qcom,sm6125-sdhci
               - qcom,sm6350-sdhci
-- 
2.34.1

