Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED361DC9B5
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776926114; cv=none; b=iP16j63K7KEbcIG8j/f/hx3PV1KJlTnpJ7lSNbpp1nTSmJibj6hLbu2c5JY1n3KQSGy394x1asgXKYYOpKpEI86orPugpE65z8PRLRSysYGEkG6XHUvS6C4auYgih0csEWi6f1OCGBGhn954WRQ87P4/MkyedTzRY1G2HZpaUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776926114; c=relaxed/simple;
	bh=nor4Bbqmi2Z8ZEkeot8YUwkfmCFOQzce0MXZ+rEjO2k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L5ppwh/M8dn63EHRdIX3H7Vkx1hlle7kko1xlZfu952ItdmvnA0XQ3dgWTTxInMSQ1uwN7rOfqJsSL9eXaCS6N+LwxrhgXQnN4sJJwelYKOV9u/zvkvYUqxo5IgSM6A94cO7A5DGNY39EstaY4fuF+t0VDXIl8jFHRGlAJY6IFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZuDwnpA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ad7QS1b0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZuDwnpA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ad7QS1b0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3KR9V2012178
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cLxVlSRHct7ocEsa3Rk4hcmRSf9qjRQUIwA
	pOvZPJc4=; b=EZuDwnpAj6nA7cEwcd9PywFQafnLL9pL6RpQRTRQB9R0sLdohcy
	MEEfpQlWjKH75bbUYMgZoMeNspNuIYaHPUZW53JE//h8E/gkKvembEVZURltcyaB
	3hVil9vi0y8+iFeRhIcLVXypki+0h6wrCoJhq8bPFIB51g9OnNCJ/9t5ZXkoLVLo
	MJ5x5LB5TWOd+Wf1/2meBuzvO6GXiCJmlAdQP9zda8FabwOwuqOOnQd8zujfWusz
	+qRJeVfdBHVIctIfzRaPQxWYayRtJfyoZLu9SFH0H/NEpd7slPOBrVlWyzjVp0rm
	KCv7OYkQCfrJjKXqiA4EPCCK+cFY0uD68/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h7ahec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 06:35:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76c6280732so6976715a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 23:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776926111; x=1777530911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cLxVlSRHct7ocEsa3Rk4hcmRSf9qjRQUIwApOvZPJc4=;
        b=ad7QS1b0x3u+R7fqnVrML+lXa7CkJ14o5NhBOWSCEihSNCwtAWic8izq6gF676IKuC
         Jyxsjf56TRUfFmwpoDdgSd4MXmEuxTlEmYWo2qvRi155SoMZaXQKGCfwDL1SgVyjMWWR
         iBA4NaVNfKCgADcYuN0pihxY/WnVLy1WuG4VxPuvnL3Ej1iLuKUI+8i71NxGmidHhm9I
         zkuO1cWAQ283q5k0+qR6KatnWp+yOTjUPfj/e6hmQyXmCkN8DxKqrFtS6F7cJr4Glu+z
         OHyhpflVRIynXcVPOO2Qwi/OI8Ef99APVVW2W8hOmkZmI2cSOWIJ25LnXf7DWsELuQ6u
         8YCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776926111; x=1777530911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLxVlSRHct7ocEsa3Rk4hcmRSf9qjRQUIwApOvZPJc4=;
        b=fO/gwNWsNarVvKO8q8HlsxcaC9MsAR2J9RWbnDyv5SkWqRDOelEg7ESL/SZPnnpIMJ
         EP1unUtwJ7yH7sHBvzm/z6HiNNO4BvtJcVlylkHR6YcJ4t3WsmJ6/2DW8GTb/kDHbxpD
         4qIi0rmAIORU1iKf5UDtoYXW3qBW6CaokQClsjudgaAHevefZEW1owRispReu4hcI9Fq
         1tMYugY+toW98H3FCUkDQ8jYnvyWESBMqEss+s0RUMsyi/NmTMD53jq7/LgyhezYWKSZ
         2ivgSAw0El12YD6AG58/X3uyL02NDPrKLDHPgfn+ZdMLcJnP9aAUeJJ9rFHfF5DL6a1X
         OPOA==
X-Forwarded-Encrypted: i=1; AFNElJ/o5K7+qobiGFXLuuqxhRAPs5A79CkxEUjP5mhvkx/9FY8tJYuMJL8lK5sFvOFNDJAlonMcmh+CQZRK@vger.kernel.org
X-Gm-Message-State: AOJu0YwR6PboKud7PvgfRu6Q1uboqgMvRUbKAJPSDgaLGfWv91TTYh/J
	L7g2+cPd+MXm9ckQZdE2rwrwJ9yqCR8jXnj5SKrmUWWorIoRSLIVjxRU3QfADiOc2irH2zGTwqG
	fc06kF3Ht/ncdXTd0YZjSab/YclkSwU5nZIlu6XEofY58k6HBoQwPG0Ok0LqH76uf
X-Gm-Gg: AeBDiesC13xCqznxu6jd8VAGmaDO0F82cvA/CxLg4LKHfttTjptv2DWgiYPSH4HsGAj
	TN4iLNaOxlOoXsmic89OZK60UKa/iVY/CkfMG1X6L4aGvXpr5CiAcnAwh7duAuWL6UJEkmGuYbF
	gNJzZsvmXl0cQns4Bk9pmGEqhItYECkqbETqZ92VOUTy3Lvrl8cRIK8I89QkkkMx9RPd44Rn4Jm
	d9HT1Loxz0VA5dqFQiaUmMjISqcvCWknFe8HIseUqfuo/qZ2Y6wHR1l/ovaWL/zDtFf7xeUQr5n
	UUypYvvKKjdh8gYtX4DEY15W2bN7x6J7Dc2zDU1PdFrH4Qs6JErULC8vqEIWCMloU2X5MWJVmSh
	09CMoXZakHZIZwEl7asv3c8QvDH3MWCBEoNoP+lIdGeIj75l1YpB9V32wX7+oU0eqgQXLLpvt30
	YLkFQ0umwiSF5FLt44L47wIlaHZXi2yQ==
X-Received: by 2002:a05:6a00:3cc6:b0:82f:111:61d3 with SMTP id d2e1a72fcca58-82f8c970802mr28606625b3a.44.1776926111320;
        Wed, 22 Apr 2026 23:35:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cc6:b0:82f:111:61d3 with SMTP id d2e1a72fcca58-82f8c970802mr28606581b3a.44.1776926110853;
        Wed, 22 Apr 2026 23:35:10 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm20896201b3a.14.2026.04.22.23.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:35:09 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap
Date: Thu, 23 Apr 2026 14:35:02 +0800
Message-Id: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D1T1yAM87Oubgk42zAEo9xT01GzbxSku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA1OSBTYWx0ZWRfX898wlkB9Qd70
 ABr58lvt03/Kh/n5DbwM3hq7vApHNck9JTYXjgF3QEzYAlSf9sD2GffAUkTyIl3wcXI6GoDCSE5
 7GvAWGYb/zXmauchYrarTn5JBY5mYVWz+LVgeaAZVo3hK0BDG7Leae0W0BELgVF4KMBH3Vb0BZL
 QsObD3YfchwCMAAlgzJn6xKVZ010llwXig9ZHKVovw7okGl9h73rJEnKqIMPN8L0bYaKZp060Ur
 189gU+vBUca6oxiYFyLPwxqH/DuReMqLuOr1GySA3MKloy8RzycLX2xaUBcJkIxjPKEEIzZApJ9
 euIF5cpCQfpyntwXIWcgZXT0MHlXwb78Qt+FJW9W87xx4MsYN1MxwyYqdvSOWsaYXCx+Sn5PbTQ
 Pws5VwSqa+o6YVanXVxVsrIsfUA+8/fOxLy7FEhPFcFNPUgvdi8RzJfirWgiuRK0ludJR+4U1O7
 5L3kmI1F66c6VLoU6xg==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e9bda0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iXbblyws4aYpK_2pIfUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: D1T1yAM87Oubgk42zAEo9xT01GzbxSku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230059

On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
reserved-memory region overlaps with firmware allocations (UEFI/EFI
runtime). The kernel then reports failure to reserve the region and
subsequent EFI runtime activity may trigger aborts.

The remote heap node was described as a fixed "no-map" region, which
turns it into a hard carveout. Replace it with a "shared-dma-pool"
reserved memory region with reusable CMA-backed allocation, specifying
alignment and size.

This avoids hard carveouts and reduces the chance of conflicting with
firmware memory maps while keeping an explicit pool for ADSP remote
heap usage.

Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
Cc: stable@kernel.org
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..420219823496 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
 
-		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
-			reg = <0x0 0x9cb80000 0x0 0x800000>;
-			no-map;
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
 		};
 	};
 
-- 
2.43.0

