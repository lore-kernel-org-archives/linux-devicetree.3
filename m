Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182208;
	b=FBxXotNHC1NLRb0Mizi62/ih1wlAOCPIsqZ8Lfgy2FjL/l8YRdfJZP8aqLSRcViqCoJ3
	 +YMjGbcEGpfRk522LWkEoBDwRqsaw5pxLbs4LhBnAdiqM2/3lLXyK6knI8tbhWH5VV0uN
	 WlT9IgOtNMbtnGk9xbrlbJYC1l3fuPOi9DRpSTDdrCtRTuWar/WrgyZYyV+stEQ9fjJCY
	 TgpmyaUbyhTFBetC8BWm7hXzDlUolV1HZ2Rj1lReAXN1s98PpCigOIBLzvv+dAXY4uqRB
	 NOCJQ+0V9gdpPRl7Jr6Ev/pAiwlToVusM1KwASN/YLfdr+Q9v0VX2EbnagEgYOFFqpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=;
	b=wz+zGw4MH80POxkm/5dnkBvdDPyMhodmrgAYxlP3T96TCUbgZINHViCvgp6kSVDPRbJG
	 zzGcYJ3rWOT5uw7FURr+OaX6oDIgS+CSouV+MVkw3nO82AZGIZKtfLvJIOUS6tuh4cnEU
	 ijH/St66F2nhXzt2kQ/uso68jlTG8FWtgv000pHmYeYlPd8n0pksk5Bb8EGm0rDHJXxO2
	 R3gB+m/PxsUr92rtQQASWlp0kihhXBRJniurWWnFiRqROiJ6iv4ipFkySKzTU983I7Ph2
	 ZHrwAgeljSfZ4WOqw44DvDieROn5V8uKeZTTK7f0G9vmpNjm2hT1JD1bz9dNoqO0q6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhRk0EOS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PWGSbobt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9920460A5BC0
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9920460A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhRk0EOS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PWGSbobt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk2n32433198
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=; b=HhRk0EOSDMm6nvZ3
	BAGnmzSLIm528Q5Si1IhHj3Tzlzrp+JyHZoLm2JmVEjVYgGMtQ4KjuDIIoaZ6xZh
	qOTJ504wX/EzA6aFbHNQvvUXGH51sDUuVgyLOrNVtUS4hyWd/C3F2nof8FkoVa7V
	LP+zkjQAXP6XnfeztLRHG8RAf8MaB6HMzEud2eSlUEl/epm5ssRgU8sGfR9u37/H
	98C94Gaa3ngMRSZBDCedHTdMIkWlbLJz3WhoVE2mj/PEyRdnQ2vuthmurKJjCJiu
	eIxymer2Qr+UZ398MC8juFurjyKcoWC0Ose6iOP/fkR02mNbNWnLKeOhsD2/cMqZ
	g1naWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjja1pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383165e9b0fso1015786eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182206; x=1795787006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=;
        b=PWGSbobtASDMCdfCBd2XSedF4uUVBV/XrkRU+zNWyeQ1NFY9Lo0iREY1lgETCqPMRO
         6G3r3iRURInZirTCkPWDsb7ujprk7I4R7bjiMsIuqiHcuZ5mY/4JCC1kv2d6cAqB11Mc
         yDg2kMWZ8aBPUsq1zSjtYfZGWo7qEqbPlTYH1XtTNJQcR7ZRL+1pRbnXZRWWOMwXJgmU
         7r756T9wxW9xPbeaXoUBcJkX+bDKviG5fGHV/i1gBz4XH04TiX9La+6Vkn5Yed9t1y2f
         DAC03CyFV3797SZw/gEkXGNpwEVkHHT/JvZhQhUcOnTdEzRghlUvr7rMIlzdFZtZF3xt
         x48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182206; x=1795787006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=;
        b=z21gDtJnXhUlRWNlSmPqJt4md4rFc9LDwm/Pkou1/4iOSQblfZ5TdxefeF7ksP/zfL
         zmnMr6nFajvHEDvY764ice6V6OehQn2nkApEp10Lez2Idy4FoNzKgTCxgG6PltQHA1Il
         EFfd85YICH5Pzva2dQownWMVBxTihQKy9jxf9KObOrxCO8cWujGX+f8lhcr7tV0smK9r
         PiDXSmTBj01oSYz0CC8vRfvjGA23J3tJZmvQZ5FOupg9kDuaR/hl/yZbEwwZAB0hSGHE
         0O3aPstx2+YATpK/RJ9kf6nV9oQ7mwTlN0Iv2h1jW+Rr92q1rudkk0pCsVH7UQJ29wju
         S39g==
X-Forwarded-Encrypted: i=1; AL+hErGeYIVD1Fsk/QM2Z7ihDYQmDESOOSb0gOFc5gNokdOiGjCv5IYkQpHb2uixjwgDH6RFrWLfFwgYQdeJ@vger.kernel.org
X-Gm-Message-State: APuU4Z9KREDF074ar37figLQfpun4IPYJfHM9G4oLiV1QVPEp2h/kX7/
	hwzRZDJ6QZICO7p/KGR21jkm61cIRS8Gwjj1q50izBbE162ic/tzijpCjYPUt5ieX7jiumdzuy1
	tFcyGCiw41iDQUEaqc8Ot4luaLVyHbAfR/j3Zv3PH/W2zqrITPixicG9JunLsh7hT
X-Gm-Gg: AZFdTZcrudES77NSCFAPVp8bTx5sQwVkTXjHWqc97NgiuX5CpJ0Q9sAYrx5mgT3ezjc
	OH67uvRvZcCzJ+bP0V7WirgPSCUp0Sui3rz6rsiKfuzwHFrWwnQJNM4Tw81ugwsv6yfPeBdVDYa
	ULFEPv5+LckOQnYFeke8R/Bg1pV1q4WnIb63wLhTtmUBrBPD1kDM+ExGq8cIVXgzopNgt2z8btM
	xagiO+4oEpYO7j+QyLaj2aqoxaW2oYxd+10BEDJ7E44kIQbW7EJjik8Eb9G9awlR/xZds4A6i1p
	tqCjM4P3oGpDi3YP6E/XKX2VG91Cor8CMxGWEdoOrqUNTW9Bni6Jm1Xx335T+Y+PYuzRfNn2Mrh
	dIgZ0SUUM17guXuHS4CJHvzkUs6PfqulTMf7F/lukAEfdMkuOJ+tsqnasfriDIAY2MTh/6rbhnJ
	UF6Bc=
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr2084209eec.37.1795182204927;
        Fri, 20 Nov 2026 05:43:24 -0800 (PST)
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr2084180eec.37.1795182204261;
        Fri, 20 Nov 2026 05:43:24 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:23 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:42 +0530
Subject: [PATCH RESEND v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
 interconnect for adreno SMMU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=PpMW0q5rEXx+xuC5PzlM9sk9j9irWo68n5zPzl2ij1E=;
 b=Pkjaoy76t19TmVXyKiraf1je5qnYdJSqZ9wPp1wouYn2rcPq2jp+UCvggSvaMM9z1JceutZzn
 GG8Y7hYOgMVCfLpH6IlRbXGGvBGWghMLIBz9aEHYzIxRKnjldYDoHOB
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b004e7e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gJkqCKp5Tu2al1pXNpwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXxHWdUzH4tJ+a
 p+87FfnHzQxK/cmeRAcifaAWdBm7IvUAjrHWzZ7wZTZlbIgJgQ5zdWaqFeA0UYQeEpv3grhRZ93
 mMzzVeaAS/1p0cjviznAwKEYnulsr0w=
X-Proofpoint-ORIG-GUID: RSqU3-9RfSMD3SvPluB4FbbY5_N-4X_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX/z94QvETXHMe
 oziy9/6zFQzV4NGeH8CyAixKjhh++LKjjFNMtda5Ea5s8nHc+BhLyt0FrJ3KtbGJ4wy3jPdIIQP
 K4bCFsJwLd8ptFZW74WR0l6N1kP6cy1vZ5hq4dbHMhSR5tI/lnOjcUznuanE5lUG6/N9MeQC+wF
 xft/h2gkZZG99JpaA4+q+AQ+x9pgqkIsWlCm76ohMv5ydRClBpPSIufZ71VrnVwJcvI/FRGw9gU
 TGIigwd2ZtI+fTxXHO91a0dfdWGYhy6cG2zNedzweNjRXBW4KuVyIPNszWrKY6Vq7vqn+DKxpgG
 58L/oPEURT0c9646zcGrs1LufzM8WdFAX2Aff/l/GGuUXtybxq7OrsZtK9wnv8ieaEorOrKgTql
 5tBmubPNLYExVaaytff8fDHm7PCcpHzuzRNA14ZbATCklsKHVnzOZ0XTTPr1t3CbjRywtbx8U0L
 YZ9hOAqu49sY4e+XFHw==
X-Proofpoint-GUID: RSqU3-9RfSMD3SvPluB4FbbY5_N-4X_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 703b4f4e2059..74c53e70f0ba 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3564,6 +3564,8 @@ gpu_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		sdc2: mmc@8804000 {

-- 
2.34.1

