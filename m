Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172832;
	b=sffMtN8Yeb68iLN4tIvVGyWC4kbdOisK51RdYVySydCYXw2syRXqFJz2t9LQSLtW4Sez
	 Wwc1dK65IpTgX3KMsKjKedfqsOfzNuLHRauHBoCY2pXgao6asNT/hbWjnI5cGepKKswAQ
	 0U+AEC7nEbRs9vUUMqhyOaWxYkZLuhV9cIgyviMZogXTUMo3jbT/cMMj8vGC59tpI20yC
	 nGWRvPE+Lxr82fWXN9a3x2VK7Iw9SVNZlKi+Xlg8sk7lFfuiChTA6FXGZN13DW+X6VsF7
	 gZURdmU42FcU/Pt3ZYXaVXOAE5pMfNwPuGFhoa5dUfNxJtBTmwlXyFHQ0a/Nww0Yg3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
	b=2hWnVAvhlZjl46DwWRuEGxt9/LfDV8AE9TamzmS6muMrsshdNTJt+JMnU4BqDZnUYiQ4
	 zQZ+O3btqo1uGf8CSlqS3qis0tXYED8XB72AQRBejuTGLE0f1x39lIpNUjFQCIRhNxUts
	 8hg/proGgwXWH7h35drIuOeV2Ag0UJ53wGj4DQWnIa30AeIVwyWSpxBtn+q3eMGjNd3aK
	 RTeXtvUqICAm7gTHymY+EVUeX0YPXpDl2tz+LeXOoJxMTX0YgBPsgKVMmjIliCAMm6nYJ
	 3PhQaMJtL3/7AtnrH30TkqbA6qUu8v8zWminEFCYTaLAAgRa34o9av6liGHG5e1Zqfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzZ29Kkb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANEKq0j5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4615260A262C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4615260A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzZ29Kkb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ANEKq0j5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6P13987224
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=QzZ29Kkb8jPUNzaL
	tD9uX3Jh4A0ugKkJgKV0cOt7CS6/HnNa3uJ5E+jyN9Dtxf8glUCo9FqtbCgZ1G8H
	tkGSfdvmi53szEDW+MUHncxhTmQ87jA3+jSV/oJrSsmtu7GobAK2epjTWWox3jSe
	YAeAPTcc9r/oGhmno4VqMycNoL42okck5BzwpnIY/Z6orYaU12MCMyp1PkDb/nRi
	MngcPQxZgIWnFMCQCbxcH/VLT25578C9TaZznRFPZhEiu6DwQU9r16K8YfNShLlo
	Tiaw+TyF5Rv6XTs8OomFaEsNjUCiO6VL2u5ocGR3mSGfyRzdLInBgqxhNMpqoiG5
	sFlgVw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu8140b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so2192784eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172831; x=1795777631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=ANEKq0j5pyfqYLozx5vuFbm2y3QufakoTm3ZVN2KxFI7dMOHnaQJOfrX4dhjAKyWlP
         rn18HAG0qOIu6e8iaxhFHJARRFxLV9N1LrOPPlmDfrFNpDvmPqSkGAUTyvcn9W2Xf5g0
         8D2JVvJlkDfWNuNZ3/unxV8URCcF+J0MGT12p2ATJo/IddfTLBfnR0VJKN2y1kH9jN1Z
         BEmK88Fe3uEa1tjmOzQyX3Gw6gaJJFCYagCAI98BzJMOXSuMr8FYzPpZnq2XBqil784U
         EyW2AssjC4KbSbUsNHpnsJibT/UXo+2qXt9iToxy8/y9ewX1bDzsuuyVrrILpr2Zin/P
         JE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172831; x=1795777631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=L+Qp1pGGu4LjwVLkMTaN0QtcD9Uin92bWoysEc/ivKQgvVScNqGWuaVkpPxmDYf0MT
         L0jT59wFo4tp9Sz598P/fjAutCKOpECAN61cFZERVxM2EcIStgu86WVUlmH8vomIYId/
         myQ7TBjR6d9dEg1wAW4ZkvLnDbXe5SHfpcu4nHq1OOIwVaOaG83ZWkaVF5RInVMGpqui
         odmPqTNUKTq+I+KBg29yoiP48BCEeIMLyu+zN1+mXOqPDVsMIJ/RPHyeua6RYTRdH0hK
         uFQYBsyHIrzVyz57hsMFFHxK0+CRjA6MzvKVntpx/Xds/GpWOxaQn+WhBr5GCJSHcxyR
         8EUA==
X-Forwarded-Encrypted: i=1; AL+hErFApEtgOnuuY0oGSFFYIOOsn4vodcIuzr2mKiRz6LNIFNGLRzd5pwpxMlIRvrilKBOb5IAOF5Vh3idc@vger.kernel.org
X-Gm-Message-State: APuU4Z/wq3JzCbMMqcpZnDqTwwoYl0qv385JAsFsnu91APfVwypU2QXP
	GAYxOCuTjxZHnCeBQdCYVYcMPK+jSMeBeJVG8qBbCfRIghMF8a178PfgwT+wqB7RIU0tcu4e7Fm
	vh2sw1+a2y93BuN7D9qP3MCFioWBjaLxUi+WvKOxZSGTcIUw8BxGVsmGEDVcGnIaW
X-Gm-Gg: AZFdTZcuFo/Hifs2BqGdSY9iGtfKoQz+KgLDuoW0k0NoUp4IkOSARzAp1Z/rf5D7Gsb
	oMarwJfUCWa4Ubmt/H0o61mpTUOnXupJoEKk8OSj4vxE+kid0rndbiG7J7pTMuu/WfM9A/eVUHs
	E9Bc7+q1AFUUaK7kDRMkI/zxpBLezXSLtcy91ra9UPPR97gbCaZ2mnnEtcSeKcJXuQt9RLNlGpV
	9e6lnXEp8Z1QUcQ3ZhmqCob/x+DOJ3G1ONFlSR8gjsF3gXp2d6x+2Jj1patscBxaxO8D7yNoE/w
	JMFMR+wC2oxOc/uawyJ1pnwsSnXQjqaZijlCauhBDYZXuejyT2bSlc+mzB4kJ8B2lsraKf2Mx1f
	R71cdUTCyBKyfmtYmXkRulj9/bts4IZuYxb0zOUW0iCdqEVc2a6um8qUWe72nqGvKHvTvuuIr5n
	tn+LHY
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr3380283eec.7.1795172830919;
        Fri, 20 Nov 2026 03:07:10 -0800 (PST)
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr3380234eec.7.1795172830267;
        Fri, 20 Nov 2026 03:07:10 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:09 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:45 +0530
Subject: [PATCH v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-4-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1069;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=J9MtDhNBRc3o2KPFtx8zuqYMoIVGqmO1gPFbpzrqgQo=;
 b=CxzlhjeUr8VvYUtjmp7JKW6HknNkVY9G9NNb994Oy2SYh/r7FFm1+OnmSzS9taDYET68xu9f6
 qG++w8LB6UOBPYBepaj5kOZ56dOvRRtQdRwSI+9scxEhST270OTcHXu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8FtY9rcCtDQp
 l7FwZu7E7eaTuC7Gh0eHMhZiRf7/CTBGno1rICABLlv704jBLD3oIXL8MNsEhKxnXYbaL2fw/2k
 Ey8l5TD7ZTLKs9VNidKDoCzwLC7Rsxa7Cixu2cZK3xTOqRm/fj/XuiJAQz5XDzqzaqyvahSq5xH
 DnlAhD5ur9M+hE3plRUkIciaf48XIufUsF+jnTkJxn3O5W6Ok4UZVChW968csvhy5B+2ejGbXbm
 9pn6U61XZiF0G3UXHawPBXPTsKRqMiT3AgJt/+PbrWIEy+i/4wUi9fzwMvAnRgPjLNDW0H3KmUY
 tHM2PLy1AEmDEaauvW+7RfVjo7m4TG4mGEiORmGFPhygX5uyGR7tlHY+vtoGn0C04TnDCL9su6o
 wTf36rataDIOy+0XWuqenELwkCIYvPrTp2UB9ZSQ5rk4zGx4mSEIIdK735qIanwsTt3dwICxCY8
 zGUEnKIPLe2SDlljjUg==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0029df cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 58id4_f7pJemdf5aJDzuT52yKXtCxw33
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX57tXnPRwlwpH
 nnA1oGw9uVthNUkx0OjqF/jeZhrkaxzqC89MU9kBWhpyT+LBqNwjTlgMK19dztM8+9VTWYn1SMw
 AmNuWHX2ed9rPwRzujqheDSl0KKV18c=
X-Proofpoint-GUID: 58id4_f7pJemdf5aJDzuT52yKXtCxw33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..be71eb30f997 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		llcc_bwmon: pmu@9091000 {

-- 
2.34.1

