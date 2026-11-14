Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663214;
	b=JD0QGGG72FdikhOzVyHgWYRH7c06ApBvdTU21Ve9zG5LLFiKAcSzCc1+uvZmXAn8LhXj
	 IKF7V6Uzhj+PemXxCex4/9ecUwWkViK/afzDzRvQFDWwdaV7vIr9ndH87hIJ0WD2U8Ejl
	 WTi9a8/9AcNd7UV7lcdWhRA7yxidoi2cjeGE6u6tmp44cL4EgfdTjeTQt2Gc+6U8jGTWq
	 p6bKwVRE+v8Qwn/ZvH92KDoosa0tvne6dahuFJ0Ga/Tcfdht6p8uop6AlhwK5LAoU2XaH
	 obczsPQ//yCwopFHKS2zbvsNfL5vIWxV89Xd4kkwNFiS555GFMaLFEw1yXn08V8ZKxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
	b=uNd3yJF5xbNUb9G3JG2vy/bM+4LG9PJX/ZWZsNeHnBPvCaygY+ck6yQRdwhpyFUusATr
	 vZ5kR660CXVh05HQV2hmiGk/Zj4Uu4ISG7Ji4aPccXSzxqbSMnT2ljLibTouYUnZXL9Ul
	 Pk1MjbSGppOAmJo9Jl3ZG7nUqzArB/AcUViZi5H8cZrQA9Z2tj9MH0ePrgTuSxhR6yPCx
	 6AoGkktb1+nbq9YDbpw4hL1H+b0036UBcNTz5YGUoShROe8mlxJc/aoOY6SZOK36GyATW
	 1+rUE9mIYAuQWfUapL6xiBvNABje87nw6hAQuHQBJAKKGfDZegFrrH+reID+0SscRtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=El4lRT80;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2xEWrJf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18032606A330
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18032606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=El4lRT80;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2xEWrJf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wCvc3716210
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA
	/Y0oEdxM=; b=El4lRT8095Mo5J3La78QG4E3nlPd0YUTMqCKJRdbXljA459Op83
	2U2sQom7Z8g7rFDrVK6rErqzfIpGf8HLVxyaGkqeGOLJMJNov9JPmSIpdV1N2HFK
	INypKZWsWao5G+2zRyVseJeIcSlq9Xelr1ptkY1m80YHxN1qupLsNvLxeXj5GX4Q
	N/zIgMvrlPPntK72Gc15Dod+z7o4g+U4TOiC+c0R4DAsi5RTpaLLrXSZzTOY4kmW
	yJvP17tlScrdccxYWwv6qrEqn8z0xc2zgZ2CEe+ko4I7lca2QZg8CQA9nYZKMiSZ
	4CiiqTee2acs23lBBLunLIJyqciUC9KXGWw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk20u90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea71803effso16952145ad.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663211; x=1795268011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
        b=T2xEWrJfOyCZd2gFHE9W/S6aXLnCiG62Av+8WNyJJRgdI1a/BOP+XTU4QOeMv6j8AW
         1I33cNnv/mNQeQUG0Oi2qIexRqKSQ2Xh7CjxZwQHO9lHYBhgp0x2pvazQ8S5d1rAUT/J
         qxFWhBY0KXskWCg/9M7k9gJmwmo19ft2HBpVnz65apl9HSdmZ9tmrsOMpPnvKIMXZMuS
         P5OsMvRBhtjqPUWs0k2v7Io+RFigfq+OT61s+5OKG/3MhUWuCwPA39t+MPQQbXh4Hss2
         YjVdjfL14IXjLgELqsRaG1cwF25QtxfV13zwIv6ZsHKCtyeBsc1KBY3dDb0AxtSt4Gf3
         /k0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663211; x=1795268011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJsWmeSos7IaKrHFXU4bluzQsu4GddWDFWA/Y0oEdxM=;
        b=jMM9gUYqPevfKiNbQ/MM53eVe0rl5q1ceR4mqQpIhqLPMvcTyUYprzYi8adfYdkiIH
         Z8Zvuh87lVzzPnZ4ULJDOg8s0xlGHowPiPNQsgi6DLOavwxsA0dAr1dZvVLRIw0pEk76
         5sO8QaadV50xZevw0JpeU31VIVdAwGrlUql5cDgWgnTMlJkpUcwB67e+mJF4OaeL6WeH
         NsMZew1d7/LE2cCnD1LFkoL13qHpgvcdJVPMHxvpWi6DzQQO22ACGL2xm4U6MSyUHmIK
         iwslC6Y16mY9FfNPjLKtsJrQw9Vf1D8pE9uAhmUdnYcxTya6btUFhrvtADmE8JDxkoFR
         7Axw==
X-Forwarded-Encrypted: i=1; AL+hErEtFRdjhf+bHfhzUilJ1vNuiX61U3PL5/3OU71dSagb3EvDUuXYyN1aYiVsOvUywveYi32WXFlZp7yu@vger.kernel.org
X-Gm-Message-State: APuU4Z/jUz5pfWKO9Ui03p/1CuecIjnCVkuN+uUwSVpy8p4C4eHj3Dtn
	AUsGhejw6/X4Nx5y80sqd1/s27sGeQ80NwxacpsS7cgTL2P5hZyJ7Qs9qCCuao0xReX25LrSSHO
	0bf18vfaLtkM4M9QpOlSxEzmoWQ2Xv0HB8a/LKxTyIOcC9F6pwBeSVW4mETkA63X+
X-Gm-Gg: AYBFou3jrbxSm9rukBmKVRkcExChB1GHQe/slsIZKYkqQhmZrP5cyXhFyQ7jxSrCfBq
	wDDfQSkDMqd8knCGbOyrfgajUbc5sUktMNlEcuWZuaYFpEQAwrnIlEgCUEVwMzcsdaaPlI5Hj0l
	Uqxi+9zWTqRJaQSBZuBI/3Lf4knkIW0i76DabdYyr2xy1FNHzVIMeweFL1KI243vCyE+JxcyKdB
	2wIkgSNP1PFMFCsMrIMV83/pMVNTkL1a4Q92gC4jSUyuggk37vixpVphYeoQ4F7/bJ7c/Cu92FM
	G6+XmtUiyvR1eeDwEeFfjoDLa85WKgOhRxuXR/ysBgh3SroeJX/afidt+i5dBiUlr73XIlwLfVd
	4MnH991u0C2PC69+GWtDGX/iFke2Wl2zSkWGF5Xbcf3TYCJlsJ0dADdd1Z9YuZFmJnQCkoCEM7Q
	zqQwiw7Jf9NN0gdq0QV7kWtPHUxmz4PefdVFaO
X-Received: by 2002:a17:902:d4c2:b0:2ed:ff4a:6d07 with SMTP id d9443c01a7336-2ee0de075cfmr50771165ad.70.1794663210888;
        Sat, 14 Nov 2026 05:33:30 -0800 (PST)
X-Received: by 2002:a17:902:d4c2:b0:2ed:ff4a:6d07 with SMTP id d9443c01a7336-2ee0de075cfmr50770825ad.70.1794663210383;
        Sat, 14 Nov 2026 05:33:30 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:29 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] soc: qcom: socinfo: Fix SA8797P and add IQ10800MD SoC IDs
Date: Sat, 14 Nov 2026 21:33:00 +0800
Message-ID: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6J_e0MTbmPBsN8CrR6PdQZgLeePSx7CI
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af8632b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=i9xxBTrTDdKVDmfy5nMA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX8u23ZqivJ9e4
 +awgKlQbOzFrxfQnIUUMixKefjwc+5ORzJH8E0Ak7Umsgc/2RTHUKT/dLtXyRTBojUH7hlaVHIt
 4JpzQgkbMZ1vcraPM7IRsXpcenB0AkTYeiFKphnDSlOeBFbO2NHBDWy5XI6VGGNai8tGP6DBOJ5
 i80Zuckzp05FGhyRlJijAom/XO+jLOquW2gmrMxAjaicxnEPoJ+vAyfNkcZgKBLQQbWrAiNayrR
 lSSY1otC/dWjLG/GJYShf/kEOnkXlQb4/BVGkc0huAJiNh1e1dP2tcyG1kBQQFx73NcxIO5p482
 OPCINxmSxoJIGJu0+Knh6H927+krL018SAFJUsZRxxssWsyOSZ3LEtYmKhQkUlnYQFetsW6UCkm
 C1xAK9e+JWjTzU8gj9ZPFho5jHK8H4n5iaEW1qlKEVysr6IOoA43umqU7o/kaR/Zpd+3Y4rS3Vi
 AHfKmibspVATvREPNmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfXxnSmx7zohUIn
 ZpQVySxG+QWyG6Rdi7mTDpX60kUys4o+R37sAo8bJosWNs3A6Nn0gpYncL+atYDuC9XVZPvvU3E
 JI8UWZ3KbjI4usLXwXnIojHXZFa6nfs=
X-Proofpoint-GUID: 6J_e0MTbmPBsN8CrR6PdQZgLeePSx7CI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

The Qualcomm Nord (NordAU) SoC ships in several SKUs, each reporting
its own SoC ID through SMEM:

  - SA8797P    648  default chip info variant of the family
  - QAM8x97P   690  Snapdragon Ride modules (QAM8797P/QAM8397P)
  - IQ10800MD  798  Dragonwing Robotics module, e.g. on IQ10 RRD

SoC ID 690 was added as SA8797P, but that ID actually belongs to the
QAM8797P/QAM8397P modules, while SA8797P is 648. As a result, boards
with these modules report a misleading "SA8797P" as machine in
/sys/devices/soc0.

Patches 1-2 correct QCOM_ID_SA8797P to 648 and add QCOM_ID_QAM8797P
for 690. As 690 is shared by QAM8797P and QAM8397P, socinfo names it
"QAM8x97P" to cover both. Note this changes the value of an existing
dt-bindings define; the socinfo driver is its only in-tree user.

Patches 3-4 add SoC ID for IQ10800MD.

Shawn Guo (4):
  dt-bindings: arm: qcom,ids: Correct SoC ID for Nord SA8797P
  soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
  dt-bindings: arm: qcom,ids: Add SoC ID for IQ10800MD
  soc: qcom: socinfo: Add SoC ID for IQ10800MD

 drivers/soc/qcom/socinfo.c         | 4 +++-
 include/dt-bindings/arm/qcom,ids.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.43.0

