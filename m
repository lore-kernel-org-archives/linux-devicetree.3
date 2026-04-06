Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C538B7AC
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493060; cv=none; b=sejqRJHnUzo/2eoFJh5cTLH7XVDi9LIE0ugoP9ECMUL2RVFkMaffZxyldjhFDAhj1u3FQ7S+3WcHd+GmAhLwGrIK0yGZsMjiQdlUo5FqdAfaY73qujgTp7r5uLT2daDq+704OX+5wd8aiqZoCrWk0daV5N7I2/QKAiMXED8dMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493060; c=relaxed/simple;
	bh=0O4aepyP6ITVXhCI2AvhxaG+mr4dh+c5BNy3TUrWQ/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORPReesTmjNVKwmlny8JgBNVvaKnMYHL7+pwN/QPBhEsQo/kPqOxm+tiuOnMnc4mJOvaJMVZuZFJJkf4GGmuwqWZSDdDAl+K/bKwzfeOxqBzyGLTZsZbEH973q/o+H0jC1xgdJEsI2zUNxXjkhjwL1SG7tDbWXonpiAzqtJDDoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lkjqwO2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fchLS1qG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkjqwO2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fchLS1qG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636DuVb92420587
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 16:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WNsJdwOeAQU09bnlt62Zl9zkqT9N3yBl3pCySz9UtI=; b=lkjqwO2swO0TmwAT
	5RAAzzhXaOTZ563CGQNdkUkXqPPDKfcmvP749V0utvbHaPNHiHtcAxUtg8B0jJjp
	GRmrGYkqCu6rhW/QimMyTcqvN0j1f8puK+sr/kdBKCz48/puQ9LiWmxRZXVnH0SP
	gaiEfqI3ZxFpkKzj5nDv3PWKpWv4pGvn01R7a7mSKsrkJ1Tqq5dGyOR633VtwwR+
	7/BrvuCTE+TbYvpQF4xbYRgKnrCAEKT//o8jWM4F0s+UNUsndVdLnGdPVv3llgz0
	CrvjXvBv0qXPMguO9UxpLKCfDx9FvfA6L9JpY1Pt4TVuJ/z4Xt8LMiMHBbEY+IPL
	Yslb/g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dce5jrh5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 16:30:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da86144daso4058402a91.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775493057; x=1776097857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WNsJdwOeAQU09bnlt62Zl9zkqT9N3yBl3pCySz9UtI=;
        b=fchLS1qGNmJZsKpZVU0mrHFSrbzaAz6WErE4bqqFhBD0oXwSP56oBgzfrdD9Vpi1Xq
         NHYiFIFf9whdVmMudL+AHVr+ZojS45CjusUnYyfaVef0GwVsUmvl+sRpHv4gGiNhiYaI
         wzVgwbJJxau7XMd+1ThmjE0rwL2MGSo9zc2/g6P+856iqAHN3DV9dYP0uw32hRPVZLCG
         qKBpzz4jbM4WgFpVvjzM08ETXZf+XY+QAyGZfaNoog8crxtCNIzmpTZCCG0DP6xYyCcR
         VFBrnZ+xrxjPglCNrSfK0ijtOliFkuhpAUIQ0fhUEBJttMXiDFDUnUWyCABjvH/OSfWm
         yzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493057; x=1776097857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WNsJdwOeAQU09bnlt62Zl9zkqT9N3yBl3pCySz9UtI=;
        b=WPvorfsgLCyGoM5/lvhpGM4XRK7BSrz7pJckL53dsoeBnAL1wzW+ZZTU0DHTaMxi6r
         mGEdjhcOo/2zXZpdiKkhsRTRO3LlHwpIjApfXiPaemEi2NakbMwG9w3EWKbPm3xncAX9
         nS5uvlUL65x+vmv5SZZkzENmzPJ3u0Zx8xVlkGULbRXr6KdaZuyv70UfUXcnsoxg7xy7
         1OA6QkK29cFEa8GHm7scXmi6jIT3Nm+TJnA5OHri4Vi+jvP+WGysbpBItDbloAx1srRD
         0vT7beGUmjX4HA4Z/3Y6FN8KzD8n7vU0ErvMwh0oP1vcQWVh4XHZw5fVTN73ejVMbxiC
         MuIg==
X-Forwarded-Encrypted: i=1; AJvYcCXoUAIHkAJhEcMQEkJj1K2KXIZaVHWE9a9wysJT6+iDF5Mp4oJ3X8YH6ySYPjbdqbJjlxp4+Y9GelF2@vger.kernel.org
X-Gm-Message-State: AOJu0YwCM8dE4+RiSeiReE2VEEsCpCMiTQLgrpOMGVDul5J5tSVnWEbV
	/DegoB7y7Z1hol0aQR+/EGr7O3Remm6Qvd7uzXnoSn7QrKFw9NyNeTMdQKc9fST3foElEF6ujO5
	bvBopRfGcH97FA/+BnsNoxSIU6VQPebH3gMapnHPxUFuRXT84zgJG1Y8HA9v+D3JR
X-Gm-Gg: AeBDiesIqrkdYnU4M2bv8kEgH7uXYKSsS1I6aoAKLpS9qREie9Xqg5ON0TRD95PEdRn
	kCARyGXypfpSUr/OUx15n91RQKPd4MRMuu/iq5h40ZoqoPBkAX6C6uNVthdGMChlz55H8NuzmFW
	9jMXCuJuwcQXE3DqT+Y4e/ME1DGA/WUmwSL3TgJLL70iLwLNfP1illLyEzFvwDmPomy386h2yXi
	iG7AMXHhdnzxREEw6mfFqD+XUnKoiRaPHbOByMhrwA9mjLzA8c7pQsukjhkcRIj4BRpzoz8LQbc
	s4OS1dG1Ywd3sTVeqn7oQsbkst9QroGbetrWG4Nu6iTH5kuUrbUYPb8fChy2ICrqpcLXvj9ELP1
	ow3z/izhoC55MpdLL8HjU5aaZkFUj5cOzrZSxU+pn5k4zpNYSnYsutcg=
X-Received: by 2002:a17:902:c40f:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2b2817f957amr145952985ad.11.1775493056950;
        Mon, 06 Apr 2026 09:30:56 -0700 (PDT)
X-Received: by 2002:a17:902:c40f:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2b2817f957amr145952525ad.11.1775493056439;
        Mon, 06 Apr 2026 09:30:56 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cdc61sm145144455ad.80.2026.04.06.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:30:56 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Apr 2026 22:00:36 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice sdhc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
In-Reply-To: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=R9AO2NRX c=1 sm=1 tr=0 ts=69d3dfc1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VpYg6FisGcu3jhjwBKwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 00R6uE7qdWOdGAuvGDeboCaQCRyUrztm
X-Proofpoint-GUID: 00R6uE7qdWOdGAuvGDeboCaQCRyUrztm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE2MiBTYWx0ZWRfX1i/2tYIQnytZ
 g2H41U6Y9HuwHgVm/we6VNvwvF43SlbH6NCR4GWxdVpRtvtsUDxOEQLL50iXtVJr1b+r3vkmWi5
 MkcQOgdT4KA3OD00PpEFyeSafIQXukBoQdRLSWFV2MfEaPi8iQDO4JGPfrVhRt962H6Hhk65xzT
 L0l3pSwMoPm3ywv3QGolxHnQ/XF/Doy8SS3qAEkA/NFfTxhxBQInJK6dw5kNl2/P2lbY7oMQxC3
 l4/jexE/FHhEOfQojOlOvYNglGumxRqflGPk436WiRwS9ppeKei6HGapAdnykbozjCOHTTG6hvI
 u/nUcdZPh+TIaQ5Zpu7M9XvvC1xHWj4/xk/06vqc/jyMIPR9829ljo7nOVCSbd/1DaFL01kr5sJ
 s4IcgSBYWkEFh+8dk5ktNZtIkYNP2gSzsszqwDFgOsIjbzDe+Mx/puJfwit64xCU/b/KWkRBHee
 pFbjtqPIbfwd/JE6cZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060162

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core'
clock the 'iface' clock should also be turned on by the driver.

As bindings allow to specify 2 clocks, add iface clock now.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index dda4697a61b7..5e6b659e8719 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x007c8000 0x0 0x18000>;
-			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core", "iface";
 		};
 
 		gpi_dma0: dma-controller@900000 {

-- 
2.34.1

