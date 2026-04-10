Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C3E3E8C78
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846632; cv=none; b=fG0BnnI0YTFC8YBmllkOQulw37CAHZrGcr1Z0VZUBhUChZYC5mjkBXTrcMFvfn9/+xI6YzWNOylZ/dMhHhWgoNrDvJUiRMvUpN9t6vnIj1srsc8F2FzFTnIj0upwzkfNcaNchODLV8Gkv1T0L6uG8JQ1D2lz7yoF8lsWmJdM9zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846632; c=relaxed/simple;
	bh=4ftT7KserMFkhX9BF0C8VG8BJnK92Mvr41UGRSzsZNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQh4Jnmk5hHXM7EJoBK9qIP8nfWEXXaYzzAK94yc93qWwxmRzSocO7SIG0ZKhP/9SHcCp0TbmNq+1cuvlvfXB97zqHrwfdoGOr/qpZccCygJyU5LjTeLJ+mkOzpuJrshorKMIi4E1NU0GEk/E2VpKbWI6Reclgxz3UC2WZql46Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATE4SgXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jy0oF6A+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATE4SgXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jy0oF6A+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHvADo438809
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bFa6hl6JLjo
	KXbtuntiSmjC1r0xvIggQc/6m77la7C0=; b=ATE4SgXQ2aCHt60PZubvHwvrWmf
	WOFjTGYJp4oK5fBEiej3CX+aj0nVLWD5btc73Io5QmlRK6MT7aAQNA5BOAfIaes4
	4zA6X3Lfw9Ixi7h/DJ4OnDGy4pqaz78oCUk+ng86PiDDYnb8/SDuxQz0Aqfb6XBF
	CWkfqka8jnyoJ+R0krepE1uyJv8RQFFSx/2fKXtHVvBnEXENby7sz5jBHoLAZW0x
	IEiWqyV1glGe+L5FVK+1mOEfzP1ZD3I1lrlT3cdXnLArPAkKxauz0BTI+nQT4Hr5
	VhfFmlzxDFZJFzXipDyUz7MaSEuPJgY5xTQikGJyOvXHzuUt+xUFvUCKguA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9sehp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a855dc82aso1643080b3a.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846630; x=1776451430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFa6hl6JLjoKXbtuntiSmjC1r0xvIggQc/6m77la7C0=;
        b=Jy0oF6A+GxwCgRsX1iatxaBIalgKcHepyXNO9dR5onaZ72VthpSxwt9fdzYBAnqeCm
         7L6WiG/Byv3XKrW/u8TrRBaVHdCWs8ce6UOZWBVW3q4xUguJCR+DVGoDb3yvZiUy9GgU
         4lsbSNJk0x3wKdfzNBsZN6lu/ctuLLkmbHIQXSMFF3C+rfD+OW6okib1vth0+XAEOYNw
         wGLLcLkbQKSNKfQciusG5MhBeWeI8Lr7ySH2/hPb3n47GN6auDHGCPktcaC8oqzBp1nP
         UNmYTVb+eiLenhBfn6JAP+Nd5zTT1hSqcIHMk/FGo836/MHSD8eRrcBu6QKYM7ZopiyT
         KIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846630; x=1776451430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bFa6hl6JLjoKXbtuntiSmjC1r0xvIggQc/6m77la7C0=;
        b=adryMepcZK77G4ZNKMK65f0Dwu4FSo9Si8hAkDv/dgSsrKXZ5ojguo0KZXDYKXC/su
         ahLl+qrWTzfQkWNr4jT7cgun4/0ku7ZO+jAD7k9Tv7cZOnOlS0oWJnV2SZ2E71g6GekU
         pfojKuyhFGFYbg66iCh65ROWVZBYISRy+GjnfsKmM7nxJNYypQxh+YN80YZMCAFBsHms
         bURiCPEVrleZg5RyznnEs974EJWcAAEHF2SUWB0yTZotAH1Pmq8kMN0llf9n27j31vY2
         ByUZJiK4L/zd9wwmoyKqyTdM2oHDjNshilMt6rW0mRioQjQGk+QnohI189cGTErr/yXz
         /nGA==
X-Forwarded-Encrypted: i=1; AJvYcCUuIfbLXmfkhmS9Hqn0nwqu0KllPuLPFwNbfQf6UszgxZTOdojwekoScTu/m6B6iSOTV2cG1mFuDUjV@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyBTrDSpmoxClFu+TX6ejxCnNKmXC0sh/4zDnFhHI7b+8Qgwh
	8RXMZtYB57S7E3u+ShkVSkIwM9GwBJ9gK/CRwCs6AXRL7kG4QuTD7lZmg2c52Ypif3+yFHNI0UZ
	GF/66OBJmYcKRXUjsgvz6DJD6vaM5NEg3jp7kVsZyhu5TpYxpjxAyw40eqaAp8RUr
X-Gm-Gg: AeBDies0Hw8PCTpgceSvJFFPZiX7TO2hSONqrmhmfeoviAgmvjO+4LcpiO3XQ1hXHkr
	WZuKXyqxgX+quTjePH/DAN8jxJIbB4WWNMpGyI8OVkdywfEDqG3pfTgz2d9dT4PaUC5FdpsV4Ew
	BilLed6gntjkFVhF2TBmtDDRJIZySmmklMp2hBMm0k/feLqLNb2fHOr4vx0kzYcstE+BJvORRSL
	myi5uVNdFhUWG0OexaczHSGQpMz8furp8JS3BOpgaG/RMtl9h2d4say/BOyUPz68sj3eWKEEx5J
	9l67NsIwnPiK9xpbP13/+1FsFmTNBGVKRlVDAyIbsLpwg/jLL5Hh6e1ZtXFNhI/rIHYyWegoH54
	ElBvmk43c35HFzDNF8j9jJNz/52X9O6iYnkZYKhIOmbQSFaPB
X-Received: by 2002:a05:6a00:398d:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-82f0c187fa6mr4925433b3a.24.1775846630099;
        Fri, 10 Apr 2026 11:43:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:398d:b0:82c:eb46:acb9 with SMTP id d2e1a72fcca58-82f0c187fa6mr4925392b3a.24.1775846629472;
        Fri, 10 Apr 2026 11:43:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 27/35] arm64: dts: qcom: milos: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:04 +0530
Message-ID: <20260410184124.1068210-28-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfXyszDBkqntCpB
 oTX3eDEt7+AUJIAwH0KD6OpHF27UAQOsm0CTeP2N4uOfB/eMZhKLnU04CLLWSJ2EY792Y4wadqq
 XSkr1RO0iEhk2Vrr/BeyYvFJ5Y3lcSsFKsTN1LDhjvFv5ZfR5pORUlNL7aYebyyoCD0HNZT4rxN
 YtZ2rMLSRCNIWn48ZbgEARdDHytwi/aowwTn8h7hAgVbRCXOh+t+gRJfNfqYZDXZO2kYBPN83ZM
 Y5+kvTK0JwUDNRuvMMdvljXNXYoA0OxJfDpTFwqKSCCJ93UynszxBarpoTcpxDqXT7CEzU9cSkr
 uBh4SAOQOt32SVCK4QiCPlMe2FMlLUkc8bMAoYc7m6WVa4mWdHN6ZSz60sdknK622L05PoRuF9N
 HNbhxBqfbL4I9kYeF2+JCIdgsiTS+zPWlsIKbYbo2EHB59ZsZwdjqcrgmA7U10oKn1J7S5F/cR6
 1UzIPvI/PoClnhuSsWQ==
X-Proofpoint-GUID: CHTbUJ7t8B-BydQxWu1ehGtz-m1TKf18
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d944e6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: CHTbUJ7t8B-BydQxWu1ehGtz-m1TKf18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..71941e6f49bf 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1564,7 +1564,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,milos-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x174000f0 0x0 0x64>;
 			interrupt-parent = <&intc>;
 
-- 
2.53.0

