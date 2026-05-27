Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261053EDAAD
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875053; cv=none; b=MjZJko/k09IxW2lVpV/1TmVIPIRfBN9vq1LDkfK69g5eyP9V7VrWAm/QObRvg1FAxO599kQwYIHaZcsWmdNWwIt6LY6MbZ7qYlJZ9Up+7/vdZJRe14W9QvQ84qJ5MCuOqd4uBrdMdX0tpgFjkVCvGQ1c3eHMz9TNnhlHUGpHcwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875053; c=relaxed/simple;
	bh=kFCU7wZmYZ9Np8EmFIbv9QlGD0jyuZZ4tyZs0R4l6u4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecI+AZCgP7QFfEOThnqhmzgtu6egd/J+YKeDiH6ssOjhg/B4m5BNcxCHrRo8W6ssp3iEwQVqeiyVM7S3C/X3/daqSKRmlq+w0FJ32eB54IybV0iT4Fm+YRqI9Zn7gHSapnHT3mwf91u3p8othA7w1ysIZMX2qqI4sW0lv4mIQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVU6hOT4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPDb6wAC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVU6hOT4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPDb6wAC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mS0k2282530
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Cm2chPtn0YZ
	UA3NYLBlCdKuo/PMsL7ChQI3cYNPp+S0=; b=NVU6hOT4/VbGvmLgb7F2damCXKs
	EdL1X7Ixb/YmBtDYtFnTgzYHCktUGHiyMFbwobJDPy5WmJAN9hq1hI4EsqkdUFIY
	Ng7gIe6hK9U+Q9OlC0t5kmUvP725zrmm0xe/MjaYhebSdZzZnLuxY0LY7YxEZRBq
	XL0dZiLYf4l6VOGnwMirC5mLAg2l8OiCq4a6svJtfsI56n+M7V2G9v98mQ+PNNl7
	/5qbNNogG38+XQJjF8aqji9oi/5APhci9A/7YWOuD6nOdo26Zet3ijYOcgmphemu
	pMDGXEDCUEb+mWtLwUXz+XGe6dT93l4weQYItc891CSiuu+jBD5Gjv9Kklg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcruxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b99eb06178so20742595ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875051; x=1780479851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cm2chPtn0YZUA3NYLBlCdKuo/PMsL7ChQI3cYNPp+S0=;
        b=BPDb6wAChZwYWx9GFrO8yn1aKWNBtEHC4lCmprP/fVWEvUrgoMkRA12yaxJljf2m54
         HBCFwYR8EWhOgCXuvFzIGRnWfZrah9DgGlAitX25jjufPko5FbXDD3CPI1PuYM1BqvD/
         CEjsOn1nI9TNUXMksgmt4h5gSOcqDwxG9HnXnBOD9079GlDrSs40mNKRQeczsXEADwSX
         y+xvYM/PUD1Y2ab7dUQxTFnjbvO4fKhdhsZIdVT4ewg48cCoK/sZDm6zbBE5YGAYKkoD
         RO3B2UBWkl2b5CAUFzbjlqaBgU2M+on8QM8E42wqpIuij1GkEjkRDYsum4xt4qtCzolj
         j54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875051; x=1780479851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cm2chPtn0YZUA3NYLBlCdKuo/PMsL7ChQI3cYNPp+S0=;
        b=cYMvhu+EA+YJZgdOaCvyMvaQynAItut3zQv4pjfVGWNwmtTlWaZSX57Wb5z9bUsMYb
         ZczX/9MbKQwcGl7hmSeT5S8aTLt1U02WLBRgxnJFIiXwMfY21Ah2ud1LwJ0YpDKBnljm
         MKWG3HxkLWbzjyVGRlvN1ia2bJ0kjIMaFFKIqrxzoMCZuytP/31qrenbSJ38P4w8DfWF
         HsK/Frt22VBR/5GHt/NwQu/QULQYcpcc2q5LdWTEAzmgr+ML7kjPeAUQGqlvAlAdYvVY
         JgY0Rq507mqOem2eT9DDKA7RZQe7kSz+PBJvKoci1pGhKws82CF9IinT5NRfTcAdG+M/
         LKfw==
X-Forwarded-Encrypted: i=1; AFNElJ9/ai7aQgzay3for7Hxso2Ir8GPJmNdTQhF1k0R/HN5cW7ZjVvvIGrQSYgamTM8YoVQd6Bni5Mo+pIb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3cODnehdDGXQ/yubk6lXpo2gbRQPWUp438wpUzRcJ1Iw2PUCD
	fNzytzruvEame7EYdULx3xumuisgjJtkCP9yrZlr7fEQDvlQ27N06aFtUzEqG3vp+oFzKT7J1QL
	zQpkY0QIf9kqXBFlXi9VtcKBNBhIFfsEfgHpLBO34iEfkH4NqAw+L761Ptk/Q5hOf
X-Gm-Gg: Acq92OGmARbqGhKjB3JLMAhJ/7IT2WDXWVekcfcE9RIZ1rlo2/VFGEJ0C+Jd4/NiFDB
	Oxs+fdIj7eJ44FDV9rO9aFEGuc8clS0/5dBvPcwDD6hJ/BMvLh1eNRrSudKjSajPZwdTyThlCpE
	2tgivSgZLtj9jCrMcPh6RueYoQtuWe9JxFTNCtOmTGuQcfU+CJbc0oW6QhhynQOEsuOJlUHwIdh
	2DT7xdQrIUEbPVHUWQJOAyfIm4fICcbU2nZiyyR4jJGdPBrb3jIAbKVYAOIxe3rqvXzd+l1lb1n
	IQN6ycAVd9A9UZSxHtGeICwgPEUpg4wj7jmKv3aHipD6DxQz2evHgI6FsXMtkkTouGo4/zR70A+
	LOyBxG7WOoxfJzSu9NtUyNO3djrdB2o/hFlG07FxdIGGtHiAzpx2xRC5E7c4=
X-Received: by 2002:a17:902:d4c3:b0:2bd:646b:2ddc with SMTP id d9443c01a7336-2beb0375f34mr247630525ad.12.1779875050551;
        Wed, 27 May 2026 02:44:10 -0700 (PDT)
X-Received: by 2002:a17:902:d4c3:b0:2bd:646b:2ddc with SMTP id d9443c01a7336-2beb0375f34mr247630145ad.12.1779875049984;
        Wed, 27 May 2026 02:44:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 07/24] arm64: dts: qcom: sm8150: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:12 +0530
Message-ID: <20260527094333.2311731-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NQgbNCC9Oy4hPR79LQqJA5g8kaLIn9zP
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16bceb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=8Zx1J0xfV8yXs1-eAZIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfXwYTRmng1NoiC
 h0ZsyO51XuWMFqOiRLKooocELGI9pw+F54wb/y6QmR56ykXGNkCl6MlGPrLXuo5Sj88Is9oaz66
 pFiZJkBnvGVQV4MfzojnfBzAHdMNwcyAKDbPe+6Y/tgjvVpOCHLpD41Uk18yCM2mwfCUk7Rq/JB
 ZVeOt1QFsLG3LbGkvA6B0XCR7ZlddtXuJvbHZ+QxTssRc1bkAq3z9a6tE8Rc4GaZrk6cASyb8qw
 yvnK94Yu4DECwHD2am1Lwtcbj2BzPR95H7lkZ5KmFJraJt8BxBzepfm7b4hJsmxr1yWUBzBBtfs
 tiplFuiKsUpYMFA5EG5hEenc+oyOSj/lTpa+G7emlFP7QdxtGNepHmhjONoTn9A/vojzGXGPugN
 zC4VlAKzfEoqv2TrTqkVtB7IGWHhRKpELaCFVmOr/It/UaATFjVJ3ajafZtVJ9k0ctjzrrXN4sB
 YvfhWYk4VNZUcBE7xxQ==
X-Proofpoint-ORIG-GUID: NQgbNCC9Oy4hPR79LQqJA5g8kaLIn9zP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sm8150 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 0e101096209a..661848ef5eee 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4174,7 +4174,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
+			reg = <0 0x0b220000 0 0x10000>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>;
 			#interrupt-cells = <2>;
-- 
2.53.0

