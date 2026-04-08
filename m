Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09A39C003
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642331; cv=none; b=f9KFPoKK1pyOeVaSRd32k4h6EazvZ8g0wATofO0AiAsvYgzAhh2zxqN57H+oyJywO1iK9ahBAUvahceUzoVwuSoDhlzWlGw6pmpgiphX/uUS5K2x+8HUu0fysLNftyEaw8wyTCl+K4ZybDKL0WAv8yFPu06deeYMfYfds5uHfUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642331; c=relaxed/simple;
	bh=HdDvtn19+g07S2ZeODC0qA6hNHqqCE2Olch3JOf0xdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hTYxiRTfLc44ourOTkFQNFnNtmQulMlrhLw/B+ydtYwpzzte4iyJ4EyWDuV11MM9Jl8ieNhubxRDU7NMRmDcAmDEqqkSKCNy2w5xTaKpDgnc++U8CIrRdQs1k8nSH1W4uJpW1JU8w3wcw5h28o1Eu8YTPo5256YaKqWthWmUr4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxoUxSFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQxZSKnr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxoUxSFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQxZSKnr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385wcSt071710
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aUY6Zyvi5XUAqPvNpDpsoj
	jZctQ9CzCDJGHbfUL9eyM=; b=QxoUxSFfO/pOXSbpWAXGrYK7xK61zmjMPFTCiC
	XVDze5/Hc3qPmlWBZUHTfjdwQfCEtyibEqkrm+akCPyZMu2EuqH2XsZZF9ktk32F
	oVpzgzZNhIcjLmj6foxyz8lTlcKwKNEk3GlLq/sGjwQ+bniHAqVE1HKtjPIDMhuq
	/gnXi3aXDXgiMfBA/EwvBLs918pKF2vYIhyaYPlZcICjzw59n3nVXUJJgjS1gHsU
	JzwRYM0G8nWmLig3I2Fc1rNv4cOg1oGPX7UeRGf3YjI4SpwybyRZ0yjaKuANrod4
	uhf5JUj1oP926tA2YR/QCusY0mhvFE3saPNBDGwvwUECetmQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sxanyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:58:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e425c261so6572756a91.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642322; x=1776247122; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUY6Zyvi5XUAqPvNpDpsojjZctQ9CzCDJGHbfUL9eyM=;
        b=NQxZSKnrLFCoBFUh2BdnZxCaozF32GVSBafIqgm4e/JpwxpkN8AvsqHaE94hXqcInS
         6cXFiOekWT6fQ7tXnHI9pqwP1Gkl/VFrwo3IW1SezGP4sVodg8okK0b/8sa7Z2sGp9a7
         259MgTW0FTwwu+K2W1mDt35ZKEHra+GZ8grimS3iEF5lv8hoNuofngSDQp+JT3k/ZxXN
         TVimT28T8Jq2JOjGRtgqRkZqa09zl4MPzbfx3VfQWGIR7RT/FPvfeNG3R9FyU7gD9mAd
         QLH4zwU+ojTao1rPZ8bpS7KyeCenoKQApsuXt97IyExUQeUU0iegeazG130250Jm3bVP
         xb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642322; x=1776247122;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUY6Zyvi5XUAqPvNpDpsojjZctQ9CzCDJGHbfUL9eyM=;
        b=Ugr0pIvZKiQK7SJuKZVwU8wR62+tStvpkgCnpXFOx+UD8EFPIY5G4zvPXVpUPiPjoY
         mIwSbO/IBZdLuuGJ+jWtaQ+iu6pEHd3Zg2Dai6JEMCxTJdsvjfCl/RbOke+a1aTH1NXn
         cok+A9JZfSMZuE7QPh7jt5+jKlGD+N6Yrq71PHWjoDU6KGY6gc8ZGY9TtnbczultFI6G
         LxaeiP307W5y+rsu9bmtSaNSL8uyQt5NZkL5ynhb63GIBSdadVJeW1waMzQL1dUnDgHI
         fUwluLS1V/z/YOGYnMZ7DdGbfW83+kUnEowK86MRuRsP0SJe2Urug926ONNprlmABovN
         8/xw==
X-Forwarded-Encrypted: i=1; AJvYcCXQOxTpdvnkpEuYm4APWANRKS1FcAXVuspc+JZpztgHmMebh98tOzplCSSnsGnqQc+nbrpCTnnacu7n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1TuHjOH+4BGnkXBTujituc5fdiivh/T9An/0d6mBKr/IigPbg
	QOYM8NT/AWHI9hhJZ/DU+lDNugHVTjgDeJf8Kq5z9JxLK+jt5zzgU/O5P6KoeCehTYKMaq3xNAV
	KsrxAiQHAwWJhegTNo2LufLB5HDLdBxEt+xTmDRNpKBF107QPFkjufmKe5ImE/q+L16wKw/C4
X-Gm-Gg: AeBDieuXtpbyjBcPMqNBr9qWaGbrehMPYLyQgomLNTEcIaAuli720D5U4FYTPrLtMl8
	r5NJe7XcaMPRyLtE5+DLJpD8cyfUg+RsEze4DvYSltLeTrjo7aT2abI8PAfiNE3VNl/dYNDNTtY
	SnnIdyR62g1PRABtYpfKln7Gu23EfdyeWPmFmk5NiGbb69rMgsVvRilOqGjCFwZOz2t8gVPOQcq
	Yu7Hez1BIhlyQ0qYN0G8wiLNZX+32R9g4cgYhFrEzYZG0qj9lvBwz6EHZecBEfRnfGfy/VgPJ8r
	hhmR3D+klpYGgg853wHn+yXIbe9ZJV0w4ubXy/y6DtiOL/swc+UY9Ihx32OBsnDqLEV9xdSyf9w
	/cpGn4YRMJQFyuyyPO6MGY1PC7zwBQ7MGHy0gse91Q2GblKQ4hlUGu2vLDS9jEsTMfC2Ps77f3B
	8/DP1SNCSBJ5gfBs6mWR0/dZDB9+k6PPIOQdgrxmGLVCnKNDMZMzOxGBMe
X-Received: by 2002:a17:90b:5585:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35de69a6545mr19325291a91.27.1775642321686;
        Wed, 08 Apr 2026 02:58:41 -0700 (PDT)
X-Received: by 2002:a17:90b:5585:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35de69a6545mr19325260a91.27.1775642321188;
        Wed, 08 Apr 2026 02:58:41 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm25445663a91.8.2026.04.08.02.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:58:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Add the SoC ID for the Qualcomm's IPQ9650 family
Date: Wed, 08 Apr 2026 15:28:33 +0530
Message-Id: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkm1mkC/yXMTQ5EQBBA4atIrXXSLX7GXEWkQ6mmZoHpQiTi7
 hrLb/HeAUKeSeAbHeBpY+FpDDBxBDg0Y0+Ku2BIdJLrVH8Uz/8yz7SVCS13orKyIETTkDMOQjV
 7crw/x6p+LWv7I1zuDZznBUCL98xzAAAA
X-Change-ID: 20260408-ipq9650_soc_ids-597ecc1aef1f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642317; l=576;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=HdDvtn19+g07S2ZeODC0qA6hNHqqCE2Olch3JOf0xdQ=;
 b=Q2WekfT6KZUysnM0AeBr+4PKj+oGuW2dUXwDuJIaOwYVpgM6t6ipn4gPBKejjsBuXBvULvk3B
 MJ0f5kzF4UYCIJAvZhjLXF1k04Ff/xBNeobDvDhjWjvqWZR2rpK9rOb
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d626d2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=N01T9IvMyzn-mJD6WhwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Qum97BnR-31Wwl_ROSfvDG2bojcUx37c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX1FxJX8xim5AP
 isHpj+R7HudbOwiaSbBsEbAIXWlAt/lqXj17gTj+w89ag7YlRESkZHlvt4+ufF4KPQkB1wnjyMt
 rDzHVitNMKiVEH5Q6PJV+77zS5bBJDS0R5HY/xH3CBvz2GMd/2e27yYoO3No2Xdyv+tY4siL2oY
 NTXw5iXk1r5ZhIN7MhtLSrrFl+ethdYGY8pjPCzJE5KD/pr2+INw5Qx17j7ZHr5b/Lqb8TQdSUA
 AFW763FyFCDC5NREFe5k7KXgH+Q17O5Hs1s4zcLFppxLIp0wK6YbOIUXdesPs1XlyFUi4fEiwAh
 Fo3UwykOS3l7Wr7MeCMMgYRnirsT4QO7bhXHq3xlr1DqmvnEz4uWOpqFz3VzsMeXwNVIHya8zg0
 lHyPnnFOtbyV/bVsNFrsJnbUZrkbMH9XLWX+1RcgoNGFGGbJNoKvYbd1p8BWdfwFREPO4/gWHdC
 oF2YmxjvBuEVULucNzQ==
X-Proofpoint-GUID: Qum97BnR-31Wwl_ROSfvDG2bojcUx37c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080090

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: arm: qcom,ids: add SOC IDs for IPQ9650 family
      soc: qcom: socinfo: add SoC ID for IPQ9650 family

 drivers/soc/qcom/socinfo.c         | 6 ++++++
 include/dt-bindings/arm/qcom,ids.h | 6 ++++++
 2 files changed, 12 insertions(+)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-ipq9650_soc_ids-597ecc1aef1f

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

