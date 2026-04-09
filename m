Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D193A4536
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723533; cv=none; b=qMid9aWV1SMErn0nxhmCHMybA6LOEsk5uCtutKUvTYfn8bFYShAu6fMZ2gguBtGsi+/BsuGkCeIwprcc6P6rdn1cRW0UV8euEa3nqWOjqPioIPMedLhm2c3zatymXEQw9Sw94J8Dxcnsgf63NxTRl20mfw578GYkKjqoffsq270=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723533; c=relaxed/simple;
	bh=xrtaMAHyGzx1nbWuDQHRLPPXAplXgH9ayKrZccGTiEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ol5CbjRMMZ87dWaWmQdsOsDhh7Z07Wirg0yu8v0g+sKY79Hxq5g4IGj7eeHvoK0pg2DPxYR8TcHFZgH611eT5LCqs6scoYgbP0D3AScwz9fsQ/yXMfAI2uju4hcTRRYOStmz96eXQmaEKoqG7KK9APuoo25DS0YBe+ip+ljwyhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=egGhx2Le; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyoREaPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="egGhx2Le";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyoREaPI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6396v5p8674881
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 08:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zu2dd5IWxy6lICGCUaJMagqjHJpowlfczfRVORxcnas=; b=egGhx2LenclaLQXC
	gRqNtFVYFQ0Zbyys512KWXluMSyhxqmCgI7f54oruShU0Pgvx9gFoXyqQnj9Tna9
	DhJt0CnkYQQtlu4CWadLHFYT+LX4mGNZsVL4ikWUEFfq8gTAOPjNTZ46m0UB2Mvc
	+drDVF+groOSb5L4x7iWP2MP6+0WhbeXFgMNtGhVnXqJZrFjA8JHiQl0cLRcYrmZ
	8rDqCydCQ2H1HoVYJqiyXQB5j5oQQ+Mz9991vAV6HltUKlgl5Q1pG7Xi18a3Ftj5
	2UiKoH39q4pbR0hKrLyQGL+8olo+5CzvwzYIBCZVhqBJlG/szxr9oVXHkApDM4Jn
	OgHp2g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtbmu5jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 08:32:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso549785b3a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723529; x=1776328329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zu2dd5IWxy6lICGCUaJMagqjHJpowlfczfRVORxcnas=;
        b=MyoREaPIM1XALL+qBZRid2muyvo8WIDt9hLgksMUWlKpCnZst+2+OfbDSoeOn6mf99
         cOD5sb+4v5jJz0JjZWQBcuyWYzbi1xeJpYz+TMPQEq2iFVJbWg4YgSk6uapVZ+KvNIjN
         jTlp4WK/GYW7DaT96Mf8EcQlI46jO1XeZ4OMvNk6qgllm2t/CnNgbGlzvc1DC002yZjF
         ophYoBAaZHpGd/1VEaCgHljrea4r4K+vvTZRUd4d0i3ln9Eu396eRRAsWjLle4B7FMm6
         kizMjTRDZpeK3bliCBQNWmu1QLtkc3tjZIsWJEc7VFmO0svWAsKcXy2DrwmwBbeL1KVY
         O+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723529; x=1776328329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zu2dd5IWxy6lICGCUaJMagqjHJpowlfczfRVORxcnas=;
        b=Np6TG/z9Oq/kWU8nHXY+p+sCWLfTeW0no8onN4Ik4BlJ+YxKj/y0/Wmh3+L87ySFQx
         igoj5Y4n5KBMo9CtCFiXFzIuTwM4v+6sl0TpldWUNC6+j54RvPhYO59OO65x0uoFi6Y/
         W8EEpPlpQj5DSet1eVEkCU4bU9SMBjiN3kOhqOWK3awxMzgoa2oWKdaZhYdQ+r4hBeso
         k52ksRWlQ6tXFL8EergV8FSMgNVb1+JpTRd7+4mH2bBIF3O3KlFEen7l+0pVUff4RwUU
         sag4icpREYP1M0P7svPw4b5ux33ERSnyv4tYXAy8TNwP1pk7pcz0aoH/k0EZgFLcQHyr
         F70A==
X-Forwarded-Encrypted: i=1; AJvYcCUXBbMv2uk0AdBE4iyKnvU7xCY+jHTn5umXr1ZOYAxuMjTb5KcfBSeYB8WtxoTJhR7+DTBpQ5F2q+lC@vger.kernel.org
X-Gm-Message-State: AOJu0YxaI8mRy2uRSR39rt4iwuyGxBfdYWIth+9zfgRqYrv5aTb/aWv9
	aRyuXZvs2esCRhIbTVckFji3qaiZvaUzPf9TeP5ngxeA2ccgg+v+TrBv0WH8m955/TLPB+5AunJ
	mE9/Ljopyu4x5MksQalUcWt6ZufGmJDMpUZENH6zsdVr+l7wW1a40OTNIKyDXvYiM
X-Gm-Gg: AeBDievruMERvBE3kN0EK5AkXTUqRhUs5RuLfRvsQBz66C6hA5yM7Fwt81VmISImbcv
	x8mty7urZD26Oa0d6bw0swiBMnXcun6T6cHr1z1THusrLiSJZWwo/LnKkuwO6iG2pWcEGviDOiu
	QMjOBbWgyWLpB5sfqlov4Bx+3jPNixzYX1Z58330xj31OqIdTDhEAivlSmwW6+g54xqDBZGSm1R
	GPoMt+Is6qEcBARVxD6GR/lwVQPg94qJT91UQ5s7eh/Nbn9/Bbv4KdfLf9cCwSlGMp7b4gLQ+mP
	5jbEFHatmSvXty0Pbc03t2OlUBOHwxrKu0GAPV9bGjyRVUlRcl91SWb1EBqfEtFKUExBgW/36t7
	AG+DbOOEgk5eoseoI0/6tL7wPoFvq8KyJjx0+ibHkaFWr20wOPeix7EM=
X-Received: by 2002:a05:6a00:3e12:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82dd89da5e7mr3214347b3a.24.1775723529007;
        Thu, 09 Apr 2026 01:32:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e12:b0:801:eee2:45b6 with SMTP id d2e1a72fcca58-82dd89da5e7mr3214311b3a.24.1775723528461;
        Thu, 09 Apr 2026 01:32:08 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b5fb22sm29741277b3a.26.2026.04.09.01.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:32:08 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 14:01:51 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: monaco: Add iface clock and power
 domain for ice sdhc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-ice_emmc_clock_addition-v2-2-90bbcc057361@oss.qualcomm.com>
References: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
In-Reply-To: <20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: V4NaU_HF4MCFsQJdRX6eURTjPQjD_53u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfX7G2gSfbMI5ps
 qMhaVpz6IwGd1YvlKCuqmjz2SzlgHJTO8L7QrNbMnMfia6CTguw3mrLeBVDZC1rd1NldEsP12tr
 hwDqyRVsWgBlNxXdzniD1XXMpVlbJnoYmGCblPQEEeJv9FE6nQ3YKIA8rZOG6Rq61xD5VTetHmx
 6+kU4L0Ij16ig/d57aJVGmUFOCeT1xGzl4jWyv1oBvQHP7yWNSTRYBaJWInJn31b/I3FalCDaZH
 ONhLcvqUBsywa0TKdMrNwQye2bpZLhsuzG0sVUn6JkIg1P1MEYI5rVvqC9eYg59OuMn1i8Pk+s8
 aTgkhzdKWeXmXCZzpbVu6ZB5xld5TJHgZRki8X+YrdZ8gPP14y154QqaFG17RCqN52geipWn35J
 Qu2lonCuQvHQ8g2XQ6m+fRw+tkXRYUwNpaV/R9N9yAlNZ9eQ3V8NspIygj0y8Gv881m4AjQh7GC
 /mJV3pLVlcZqme3Ehzg==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69d76409 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zChIi_bjjUXeECqr7xMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: V4NaU_HF4MCFsQJdRX6eURTjPQjD_53u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090075

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core'
clock the 'iface' clock should also be turned on by the driver. This can
only be done if power domain is enabled.

Specify both power domain and the iface clock.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5fd289669353..8192d6b94305 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4873,7 +4873,11 @@ sdhc_ice: crypto@87c8000 {
 			compatible = "qcom,qcs8300-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x087c8000 0x0 0x18000>;
-			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1

