Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC4A3BF68F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235357; cv=none; b=Jg4jcfqmJ4Gu5jfV2m5JkJFQFr48xxq5LjAgloQ+zgg/hAsySWOLw7F2Jkxl7vlA4pEIp0unZ8Z6FG8G2Yst/LZP3A8+gRVkopK/Y7NFM+uusp+D8vErBg1G70VfCenPEuKcK8YLtfYFBMEhmJ1xl1k9UNU3fzNXytmglgGCuyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235357; c=relaxed/simple;
	bh=d52kYPY7riwcxCdOUNif6NfCC7DvyhFIgjNFOTmZb4k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QG8+ZQHpLqawD7nuPrQcT1d39io1OScPaBH1o49NmQIID5eUNwylIfrTHTB/CBC60YFoqju7b8GErKXQardn9bP1BNDAXcbWg4zD0vcEV+r91ihjV1GNtlYQSR6AOTltVDWjCrvfGssBKVimu4/7ce7Q38Zif0PSfT/xyPhswQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhymcf1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmKqHm28; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhymcf1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmKqHm28"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487ftnW2384154
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y1RWpNCQojSnmNVIho5cFZodOfF1qEz2h52
	lqG2MqTI=; b=Rhymcf1I2bk3qWMSQUG0ZS0Vi9s8T/wxC0wrqhrjSTM+Z+qkU3L
	YpbwLmjq7E3qS3vfJJQCvHx2pvYFr3a1y0HBURH5BlBBiTsR+HDS6Xvchy7ONqK3
	VtcFSXV3wI6w91wANaTmWZuB/w7B1yura5ZmrbrgylHvpVT5AQop5vjaHIGn2Agl
	efLT7PUsuE5bjg0LegE9qLoc8XbnNS5yyH4FDtcVRsPnU6KWtXXmsqpq2mpJiCiC
	+5Yiw0b3SrCRCP0PMriy3+AA05GKIClyLowImI3t7bKMpd3jjG40Q1OF3/dYhivI
	h+x5FWabNkJXru/na7pFSNkH3NjOTZvQgEw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukkmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:15:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba115ab6bbso18518415ad.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778235354; x=1778840154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1RWpNCQojSnmNVIho5cFZodOfF1qEz2h52lqG2MqTI=;
        b=gmKqHm28dq+HkFslPg1DcKu2cqGgpzyzNAzidumbb7nhgDnNyZ2vUAuGJQvmlvewuz
         bJZoVV7POXYUZzY6NdRcFw6VvqerZrCJli0jxgTYg3SK8TFM5vnQG0GuPde6h/0QEIpu
         4bDd36X4Mh9WcsurBFjtiiPIoAQrsF7Nu67G96hP6uSH0g2om0JVkwDt+THmyij07K2C
         6TSVC50/YkCRFhP2GLGtiWJW76mlJrMSxBmvDHATeN70/gLB5Tdg24E5NBLDSwalowBy
         yuV2r+OXjIKMi+pVeSY1gkw+W156nU//h67SzEujTNeOELG7Ge0WcmYKXsK+0XaUzNNZ
         GNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778235354; x=1778840154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1RWpNCQojSnmNVIho5cFZodOfF1qEz2h52lqG2MqTI=;
        b=X1nUAMXQh+W0BgwSVTXOCuvnvrl7z3qfJKK4Iif2iTUdS1sZnWfHTU5yOzoVe9n6z+
         KedeYnsoKdbA8mzfxITk2YHOJNAJi+sCib7VLYAGQzsyZ55X0j01+NOp4FIGxcPw0+RL
         UpzmZglLkfTFUKNwtLxrzemvIwUQnp+TBOf0w87TaInIQK6tFayC+TLuFV4UqJSMLRoi
         3Ryj53/y04BlexeF3ew+6jwosQRHCqjW7csq6o9GXNq6ppcW1OeA3ivux7WcXmzM9Nf3
         OWEPF7QgDFw/Uo1b/YSXem7s+Jd/Nxk1o0wlkfvSAVV4bqDSJHoJ6rVWPKi+YRDkreTo
         J1sQ==
X-Forwarded-Encrypted: i=1; AFNElJ/G3bL8zWT7NJRwPXX96U6GaBDW5RZR5hFgbmFwOLXX26IywO3sSIbZjxlJDwlKWzmhg+oVT+XkMvvn@vger.kernel.org
X-Gm-Message-State: AOJu0YxHZeosgBPY2Hi/7aKBpIknlL/Oe0q1O7lueoE94gW7hRZEaeJ3
	1q1RZGssIUJhiyShuTM0zWsORuop8cEBreljxrC52v7TX5vTLS+LeJiE/qLYiIV+TT54x/m2eNQ
	onGLMH/mCFCjiuh1AZnMEwGpF6JOC/QquhU6RFxH9pONYumMqVD4O7eU6CvIduuke
X-Gm-Gg: Acq92OEMXKuPvTq6FR7wTjIID+8IX7Y0mPVSJbr7PuXIpAqREgv08e09roelBjFfFcm
	FghWzOe/hGRoRDcZ3gLxhWczx5KvCoTCcAqR7DSsRZWLbgyORKlMWKNbTyaTJA83mFpzm/bXkHL
	VdeXyJAYJqFxyZ1kguOart2Vxt+60Rbaz/IILqcdwCLjNw1zphZ7XzV/hafVXmyRTXkuI7KtgxN
	Gtn30rsWehsVz2WVvXfCdyuFMPB8LJ3qyw+QLMmu6X9XYPjWSv/9e+Tlmj+Bu+AWgk75FvwHpbt
	a37cUDgegD9OhL4qgIH8MNh/E0bj064yiUEU0fDu4aZXIpOwlN2LsyyinfFInE98lAKmewJcNmR
	TwG76rCEQFhqjuwIvgCBg6mY0hkBUwXRVpuFDbVyRfdMQLqsIcP15J/bV
X-Received: by 2002:a17:903:32ce:b0:2ba:307:4577 with SMTP id d9443c01a7336-2ba79285e29mr127190215ad.2.1778235353628;
        Fri, 08 May 2026 03:15:53 -0700 (PDT)
X-Received: by 2002:a17:903:32ce:b0:2ba:307:4577 with SMTP id d9443c01a7336-2ba79285e29mr127189535ad.2.1778235352646;
        Fri, 08 May 2026 03:15:52 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e75fffsm16374185ad.59.2026.05.08.03.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:15:52 -0700 (PDT)
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
Subject: [PATCH V2] dt-bindings: mmc: sdhci-msm: Document the Shikra compatible
Date: Fri,  8 May 2026 15:45:44 +0530
Message-Id: <20260508101544.736317-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: olxjbTYWZWWJci2TQLjqGrx7z3FJT0Jy
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdb7da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qygL5ZPXpCHcVOvnN3UA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwNiBTYWx0ZWRfXy+pO1eeqZ5VY
 4hC5mdPBqKFX3GmThm2t6m4GltT+JK9rZdC8dUFlZ86/Lk03bwMQNKQIF+EmO44P10+Cr0oyzk0
 qOtoF1IFx+XFsPiaGUxYbl3cK+tR0C9OnBLd9NUCfJxjgDBQemiwE2kB1LW9gn9DIr/O3GJtEZR
 p34X845G9w8bAPZlF3r7O6Y2E0FNi8KPcR80HoO0vT4DNvYl0vbzEcHrFPVe1BMBxg1j3eSiIuj
 8GOdxKRLoQSdgik1FMZTFNL5JUMFW/h2Lq84yegF2IBfaL2UUGrPEvlrP0m69e0XcH9/cz01fRc
 VebtCvli7bTvwg4cuUSeNJliu/biGd4Ka0Pwt/I+kAUhpx6E6hAG/MFHwbBcq6DhrzHyrG5RT+2
 Th81ONXHvcgojST9EyLNMGy5ldgGmCakuqEEfGMqfDNzcyerCQpTTnqise9aLn2J8k7XMt+Pc+a
 W0WBPnJw98aVy3z1BgA==
X-Proofpoint-GUID: olxjbTYWZWWJci2TQLjqGrx7z3FJT0Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080106

Document the Shikra-specific SDHCI compatible in the sdhci-msm binding.
Use "qcom,sdhci-msm-v5" as the fallback compatible for the MSM SDHCI v5
controller used on Shikra.

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

