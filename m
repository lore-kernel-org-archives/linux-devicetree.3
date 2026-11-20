Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172848;
	b=oFjw31sd2F703Vxr6pXJQth2COCfaFASGibdcVzaFtJ+A+3xhYHzX1ebeS+AP/0RcsbB
	 50fnf9eo2USBDdPvi8Fnd9cFVvTza02OaufOe1L3pO8NfHtCJhyhhsmckoVVpqlQWeyXZ
	 GVRIstjNcA2CFAV8RGY5lPtcoaw5MEYtN05bxz2FJo9A0he2qOnvgLFZQK++yAfZxHAQp
	 zicQPsdAvHpffxRB3fDSp6UhGYV67WKN71Ofm1nUvGeODMgTXaZNATNdfBqBYYUmUFgcI
	 eYs+gR8wab7akvQLF6VbLlxZb3DzwKiIL9oJlu4GnmWC1+GSbI7s79vOjvBBQw3lP9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
	b=ne9oJL42+SMIUAtzRCEju5bUh7VBSDTm+h6vkQpjoPbURUbPkECyNqzXU4OqGeAgt5Rq
	 srHLCVt0LaQGXTVQIpPSXYp5D4VamvJqIJBvL6oc3+G0c9l/VUzUBBGNZiTKX48m7Ejfk
	 Uh0FcFceOBWZDHMt9yhUPJ8v74VW/8NoyH27BiIwkN/nyBemvB8M9NaFmGQIsIq3Yta4e
	 6FC0Q9maYegkg5fJfKiVo/YQD2M93uMksI1IX9Enqu2PtaUzi2lbH6RW3nkNPzxwC5z4o
	 J7VAllzd7JKIWGuVFSUq+tTenweQwxc4BA7KbzWQIg9NYZwcatrJdC03jb3MjYFtq0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nn7w0tce;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/uYeFtT";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC7E60A2624
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBC7E60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nn7w0tce;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/uYeFtT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkQ8g1017513
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=nn7w0tcezkDvJ+TY
	YjfSksKFS0SWd13TFzlra4358qzIdfzFHpyCV/vMizicEBW6nYs03wF5hYszYvEs
	5ZPhZLoXnfqhdEKfXn0yNdi6u0iG1qxcomJmCi89w3JOY41K/MmGGkKTQSuF8DK0
	n1aR8iZQB7C/WFHXw5NUgB3gFbm8JNTi0AnBWppd2QxS8oDk25qmUMcdVCxM15x2
	8KNTpfDLCGWsemvkJO6PVVtCreXtDZ6MxoJbi/ExBAPU/kF84EF0oJfcCDbDNdrX
	ZIInop1LiA9xtiWdFXANogVzEb07z+13yGvg+6bqd7YmbzGHy4afdu1kDHMYb3nO
	6g8Dng==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1147386eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172847; x=1795777647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=R/uYeFtTweUY1CQ22GeU2D4pNu/ZktofAdLF9zW05BDG1w8ww4g/vnUeJmuulWDuLS
         40bPvG5Jnw515yzQIhdBxhtqRBBFkbPgmFTo9AXtdKU45+uKrDL2b44VxLXQ2UkN5yxC
         EUe9MoHVpw0fyif1KB4eUYayMjZdzO0TujbGLmkWRgcND3yzcTT0XAFTCD8fcMRe/R1J
         jtyMbNDyN3WGUGfxygQpAzbMu2ngISIX6VKx6Adzq9l6QOMCr87wdloVBbeaVXReXRXt
         N8d2Y6Zm2qJD7CZ++I9P9Kv9sAibR8uJyB0UmA/+QDxQULI3yYFKVtx8I8elHmLhUyIx
         05HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172847; x=1795777647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=jD69XAX0pPjxWJIctAiyK6cMu89fsrwS1qBrtt83Ru7Gbu1Y+UstOaI9v7Hqawn622
         b6B9xNiiGb7kTHySHPuw7MxXUfZelYh4yqtYtCDrEpOkk8WFZyEJr/Euwkpd5gSkltSY
         KMRa7ADLs6pc3lnNl5ifJ6WL4fdL7ZR4Z0szySA+y1KpNYX+adbYTj7bL1nsFJwVXF6D
         8x2g69EhIvnZbOqU7B/qdTUZTj67r+r6cdXLLHexH79784ksJBYaH0NhUNkieaGX12Wc
         nuiw5WHNZcoNgLfTszVlqZ/TXlZuN3YxvVwsLDPO2wD0sdu0ytZxY/lL1dgYqXmDn8jS
         5Vzg==
X-Forwarded-Encrypted: i=1; AL+hErGRCYWHhG1l8zwjjEsmgeSTmNOTAgRH23eVruiEpiGe8+wTcfj2YwXxmb8fghfR5un+E+9JlP5AZwgW@vger.kernel.org
X-Gm-Message-State: APuU4Z+mdjgx6wkpZfbeUAy/iFNyTtxUxEirkEQqa0lNDiwWIWXpUnkT
	eZk6kguqPlDPkkpyZJTn4FQoIi7gdShaYiW3FHmZ8UMoLQ64orKtLEeZRa56DwydObayuUbPo5X
	XZl0MC+RdyY+t27qOltxnpHUKCBikCRIPMfnRpGbuWYaZCg/9xfudzY0w8wf9pFaU
X-Gm-Gg: AZFdTZfm/XyPAf3GC5v+ODFu3aiHXO8RXcvKCUR4szyFAVoY4+9jsCnryW0vdRK/GDl
	8RB5ts7saaefkuVyq5CEMREyZ2HQbUZbGwomzFL/RD/vj2riIuXWpq6/1E7oOKiaG+WgcwJMVDp
	UBzQ2NwMSSv1/eoG/KViyPd7HHmMps6lYOGiIAKEyCarFjkZaj7pqpKdW+e/EbH/wdAKFHSzIyi
	ATpGpca30NSMFHg3PhfuSVfkP/gEt+X9956P6sTvgpyYUbPmYcI7xJb71LQpen6KqKcI2D0uss7
	MtUe1iU/1e0ZTMb3oqxHU9HrAjaxqj8Fx1qVs1o0hzwT2+/ynIbb5YrXGmo7HcuMxdCB2lufSUE
	frjb/Caep3DjjhtTo8CtMRqDBgzH1MjmZpIRB5QCJzg03fmGs74xtcu6Ci56NayGvoqJygfpQmD
	J1gYJO
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr2428868eec.16.1795172846499;
        Fri, 20 Nov 2026 03:07:26 -0800 (PST)
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr2428825eec.16.1795172845799;
        Fri, 20 Nov 2026 03:07:25 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:25 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:48 +0530
Subject: [PATCH v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-7-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1053;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=9j6IWx76cjPCAQZYybv4iXqHVebU//kZAlxNICMxwEI=;
 b=Y/oksJyJN6vOeMPpNN+xuZE9wT6hWllCqRyWsZ3CEZE7TaASQPRSC4ChsqkoGOgosYBHuX5FY
 UxlVzoJUcvDBx0MHv4SU3wTUjNViJjEt0woasGqy7g2RY7FnPEEWu4j
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1Pm9Z+9mK6ET
 t1JYsuYNUIBUtr+DczYhi45kBGnYWHN0EnX+Rt7/hQlGokyUBgMLtYMgrzwwbRq4TScmtUXnDoD
 X2HHbj37urCd4Rhb4Xf2/qGngqlTV9i945l3k39LYvU/FepsyDiM3xTroNGIbJda9K0yK7byFJw
 9S5gKurJTCDXVKpzjOmAMf+VOArY6p/i8/jTzPwZC1qFKEdArx+KJPfEpy48/jwVjF82Gb0rMZv
 f3G/d1kYvbdpSumTm0z63WiHoTXLv9tzDtZGxSLfmmC7mFoMYmWP4baaulS30gP5thAMK3ChqXu
 FKliPIJRJl/rmsr286JRLFx6B16vszPtGgCU/Hn/r91WCdvmG0hW/TS3jeuNHCU1FqmBOt5q6SF
 5IbZde1uHKoo83dGbjtKzEKAB1+8SO9xWZX7V164xdkOXREyOfx9DIaEwQ2VuU8qDWfDkTuNlOW
 4w7NmqG97gzZinxF0Eg==
X-Proofpoint-GUID: sT86kzUluCdgFqW-HNskGh_ZwnsB4nAu
X-Proofpoint-ORIG-GUID: sT86kzUluCdgFqW-HNskGh_ZwnsB4nAu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1WnDQLLtONIa
 642fA4DCfkAir7frFo3M+lrTnVY8j8RfjD3DP29k10Ic3+q7TwsFRlNX11zKork3fzs9XdgaK0u
 VGov+b94W+7eeH3FK2X9lXZOqMhHR7U=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029ef cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2mEde68aHbpXMYUSS8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b9846b424a93..4b2ff316db72 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2396,6 +2396,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

