Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57A6448383
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121765; cv=none; b=bS+ikowbWa0LRsfrFzokrzcAV5S5WTAPN36/JLBlFapyCKXgzGlePrTPzUjVDvBJlao9ije/+0vO0jkdZbpNu1yd5FQtv0F0qIzKJQTvkZaEUY5DGacZjt9KPdcCScSIAKuChdbfaz9eCX93x1oFN2NvnaCwxAbN8xvDhPPiFBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121765; c=relaxed/simple;
	bh=Oz+KcnbdIAJSeNLoLv8z4R1oO2JdGJNZkGLneFnZ66g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJ0VozyDJ2gPIOvk2oq6NuQDVYRkqDOy2LCesX4cWmjEk2I0UHjIe2f4esY/A3hDZlt9L9Xhil8356+1v7KscStW7owUdGOey2XEA5AbZQ6aCfcBIl2ofop1uxW/rQ/diuoPjZqb2dNJXp4BNtM/IVBoXEInDuuqleeOkR/u7d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eb4Jsflj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5ww6f1i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eb4Jsflj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5ww6f1i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBclxP3678369
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBJsPpyNoFpjGBwiW5XjgOxicDjmq976LV5ESHz4EUs=; b=Eb4Jsflj6tPGJjEV
	TknMbpPIPkUX5UFjEUUqN81cljIhr3TFl49wLoVKRCo6eUZI41gAZtXBdNkaPrK2
	Ubc1SFbHmPSRxSLBaVOcmh+EEpLI0N0r+fcSc9/WmJD9n4drdZGVL4V38XrnM5KK
	+Gj8ZercmX8p2qQQWcB3BRlny6DZwQRMNljCl6KjZZvlwMebbn20Blu2tlE/ob05
	+ztnvw2Tv2fVmTq4rZV4aZ2vVRV/bWhmlBzZuUTkJFo1N/e1AbkyD7WT8OOSgJTZ
	pg3CRcLNY4/9tpzWMH6rXopbMM02MyZ+2d6F5t8embyEC+BnkU9l6tiBx1aKVseB
	YNoZfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe65299vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6a2f5995so884935685a.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121762; x=1784726562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBJsPpyNoFpjGBwiW5XjgOxicDjmq976LV5ESHz4EUs=;
        b=j5ww6f1iqnEN6083ob8uYp4TiOAlYZFDe0LxFt8ItpETRiHJhTKy9yoqz5tBTCfcHi
         4Czm4noMFrnl1Ql38AVyOom1f9l/XLum/32Ils4eKoi8R5ew/UGVDFHIVVqDJ4mx/Bzz
         ECYK/dadBYUWzt7GNeoJMYwwMSa5wofMaIHpXqkRnIXfFHrXRICtlukmWKZ/noq75TCD
         C37OTeUEzhEeG56t/xXg6qO6jfCmV2phRF0OWfoPcdEV/+KahkDJmAukA+VmcBtpUwFg
         BLu560lPo3O0HPEvT8iyCgxsiLHLCju93kBucO007aCNGq70EP447vE9KXN30rWYZyMi
         8Z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121762; x=1784726562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBJsPpyNoFpjGBwiW5XjgOxicDjmq976LV5ESHz4EUs=;
        b=st5Z/cMvMMm2Trx2EhGsUV2XN6WYWabCUWqheuPBPVJqj0e5IARp1ZYlz8pMk3FP+m
         6wJ58uorSCu49L28KwsRJXI8qZw/KApUOfJqLdYVhWGhHhF7tJ033yJUrK5AsJf0GEZf
         Syy7KZH28lT50jWzD3UNE/68DJdpO6uyvCXdzSPOB3TQy/qoWxxsLY5IsxwNPlRuHdvI
         Vs2M5ql/p6of9Q5WosVX38qy6ytr2jGxtVllx/3lFHLZde6KTsHn/YJfgUhFVvKBwJSt
         c/0L9xIn/FebR8MoityWe3kjVXHqld6VY+yg73po7kXViVLvOYdWgAkM37dcN5JeSj6A
         wthg==
X-Forwarded-Encrypted: i=1; AHgh+Rodzbu1SHoI4QGQ71ekrIYKUQrLWWWo+p9B5jvepIYOejzJk6ih1ByKwd+Grs0D27ifhgjH72G6BIZM@vger.kernel.org
X-Gm-Message-State: AOJu0YxrNVPPvqs0XqZ55KUT494Lphvli7Dvz1FhyQOxQhBtqmyoE8Tp
	ZD5KFZRCkd2zUMfrcK1rPAhqhh1zmD/G8gj/zAuv0/0Wb1z9i/iE1FQSiGjwmtqjXUphj6s42mR
	OSDzO5fxBPNkSBe4cvr5tfWaoFzR35wgK3l+93VhKKtDhW4L9WapDmjF0hdQzp9AEDFFYwEgB
X-Gm-Gg: AfdE7clZV0I5VihpWKPPCCYuAjMTg0Ir/hurYKvJXmW0IZljbIG012d6hr8z/eIrM0h
	2nQocSAQ4uCr8SPcmIotG2tcW2zBTMwPk5bhraU4Km1zOh494OFas2WUEg9HIRmsqFFgchAq26I
	5dR1H7r8sj4xplJkpzS91cOn63mp01KKpMgyqmL9dMnq0cVbuB33a9a80XD3+Ob+KDDyCcQSFfz
	sO1YljX2oMwNGpWii6PeVxrvXDOWp6CihsdCWJkqDF+TU2t122nRUqNv8dItmYkFGd0RkhP2eOn
	sLDmbMz1cZStqrcCFUhYpP73H08AwQSyh4jM3MxhzsgV7Pqiunl9SdNoeNciHv2GOF4wcULNreO
	3xJ/iBV4Tmg6M68uYsBPInqRlhEEOcgIIM0Io2hs=
X-Received: by 2002:a05:620a:460f:b0:914:cb07:447e with SMTP id af79cd13be357-930961b5e5amr252132585a.5.1784121762209;
        Wed, 15 Jul 2026 06:22:42 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:914:cb07:447e with SMTP id af79cd13be357-930961b5e5amr252123685a.5.1784121761345;
        Wed, 15 Jul 2026 06:22:41 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1773676985a.45.2026.07.15.06.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:40 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:52:01 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
In-Reply-To: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784121746; l=1193;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Oz+KcnbdIAJSeNLoLv8z4R1oO2JdGJNZkGLneFnZ66g=;
 b=xL6lGP4Xa82WCOnn00X+w05nvL0abQyk6xI/cAp1XOv7MPhnfZqsyrd6LZ9Op1uKJk4psHz4n
 iCkCgVX8MKbAowvZYshBqGuyqK84PUnwHsb2GREUTlCf/b1334+czG9
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX4v9F1KDwIs0o
 aIGYn8DQ8vSx3gUCPl5yQdmOspZFwn6UsJDp9SKSfE/Y92avi3o2ml4HIy3xC+Y2Q7O9iDwpmKP
 mkAXykOpmL6TtGhTjPq6HbrKUQETqm1FUGlj3oC3GU89vVTpkPyG8KAd/u4ny/+7Ps/e/Eh8A1o
 z2QUToTgUsp2I7Nxv2UK6I/Cn8FDUm0CO21Yutn8dYNXFD21dt9+I5/KLnSqEqogg/c4Y4aQmAq
 dM4UAL7U5mlaHTW+vN4bUytFbWuCoVHlqDbILYJ2XDz9lDgp/X/kHxMUjHARQgVqDGSYJ9y4Lm6
 OLYvsRfehEMVuB+sKvHoUPWibSp/mZHAY3oCZK7Y6FBVCpKZ9SNEMHVsKhHqhMGzOr9qa3bpQSv
 esHpKtZxq3jSUzV2sOC7iA9N3d4jXz5iOUnOeUnN5bxNNp3CDKC7j94LtLE1fgY9SY8GZGsj8Kl
 wNOmZuPWGadM7lwr5dQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX5XXPPoCerk9F
 yuKmILgxOLWBCOuVwL3OPTqFJDad29eWjAAGXh9BCe3u7jdXKxRNmCsiM2HrOqQoO7XPoMNW4bL
 0X7dDYS/RThHsGdkOa53gyi71UwF+G4=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a5789a3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zabltn6Id7U5cQIqitfnkKdvK6gUeozD
X-Proofpoint-GUID: zabltn6Id7U5cQIqitfnkKdvK6gUeozD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150132

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Use the X1P42100
specific compatible string for the PDC node to remove the workaround.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 3d73d1211cd0..591a89098a62 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -174,6 +174,11 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+/* X1P42100 PDC is same as X1E80100, but without hardware register bug */
+&pdc {
+	compatible = "qcom,x1p42100-pdc", "qcom,pdc";
+};
+
 &qfprom {
 	gpu_speed_bin: gpu-speed-bin@119 {
 		reg = <0x119 0x2>;

-- 
2.43.0

