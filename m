Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9542548986B
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807917; cv=none; b=sd9zFKSpKfdxg497rpVPLcCQJUFbEubHLMDuy5Jc326+VcCF719wIQyI0M8DW4KsyrLnFaasNVfywsuqELtuI6nnEHIMfFKIw28gMQlItCJ1FM4JhaV3aVMOHEvlsBi072knRmhHV2CRXSv3mpHlbPwivGN6OACNw0Du8ZFQh1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807917; c=relaxed/simple;
	bh=qMvLDhfMyDqTMFA/K6jBCmjnjVPhaYDWKb58UQvbTb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejCg+p8h1t/6Fv1F8DIFLpT5DDIi+vjGDaQit1IepGqk4iYKPPcqLexVpbeiQITCNefu74Csn7Cw4oEGMrGB7i7l7/wGkr7oHoUfO+aWhxmdDNkwifv/Wwq6WhWfHADbwpBXc8mcoLaVJuT9qPygWNDraN+tkMhBrZ47KZgacUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqjrS4a6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPKdU3H9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqjrS4a6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPKdU3H9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08Xk3292287
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ggny4io8/GeqFlUGakMUNa6HAK/BLw1aG1aVueMu+rk=; b=KqjrS4a6XTWcaK9p
	ThKpAvUEhhRc7wtxbcIMmetVLCAYcKbWlmGERBgmDnuh0KkMsDLSaW0Q3/xCceZd
	RBE7w5Hi2JuQ3hO5nnrepr0ohwZPCZMU3W327L7ZTW4u/yzkAWAENrjMbH3h75gt
	c0WX16OkztfudvY2ypZHykNrFp44Ck39ZkR5wG21lEc0jdQDY5fnfPbXKDfjII3W
	3/UI1DRa4fVnp4aUlO86n6xWx6kkmg5jwc8in3eRQvjPILKyAqyI5Yi0XeO/C+aR
	cYrv1jVJtDUuGkz0LS7Nz+lQU4xIxN0ckpg7BgeEdFvaRBTR/HEUhyBXeDn0upm0
	JfO48Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3h9ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:25:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53391022d8fso4191741cf.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807914; x=1792412714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggny4io8/GeqFlUGakMUNa6HAK/BLw1aG1aVueMu+rk=;
        b=WPKdU3H9JqYoMKGaGxztQqphmvxKOIXnCWS9KDOgUm3GMhhM/TjcMtMjHycDaL1Z3T
         KoGznHR4/KrFSQpcYmN8FsFoAQEAnZSbdQHE5eIjVei2uKdmLZIuMEqPiNA1xN+dQZBM
         SCOI/BEYBjM1tFzYfzgXoXjOR6RBcIyWXzwlmhq/FiuuY0MFkIwZ9RP3o2RRyXbKgLbf
         LxKHQ3WWoFzKuh658WHWQVJM3wuckZ7lwvvkkqUclOwBx+9jAg28IjY4XBcJ+QJWwMZ4
         Tt42gtDq49lsYhRNlRiIdD66hFJG1WU0dxkKj7CyNAIzH1Wn8Si1Z7g2uG3X/UPT7cvg
         Fuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807914; x=1792412714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggny4io8/GeqFlUGakMUNa6HAK/BLw1aG1aVueMu+rk=;
        b=lBrXJAE7/I0cGT/U9ZoZOQC/hfylqYUOnIdzVRfqFaQ4Pg14njDNFxd1eUWzacJXj7
         ALoqX6P+EJcjDB1JPiZreBsgLM9lBn1Qbjhy/jBWWqjRR20SGffybOspSWX3ODJ6B9jN
         WX6qooF4HcaSMbLmBYoqdRF8a7I06/854a+dqWEsU3ExMJIviqQI5gZO05HmyH18WvVS
         Y/Nlj2kCIkgOXQwykdDH7vOIFqPwAJJskjlM3BVdwBRLNI0Z0xkfg3m30kj1QEKkmdb8
         oCF/cVc23FzfV/aCZgZFXp0crH05OkaBN4N0FXJXqJapRCHcsYU+WcaSzw79jgL+d0WZ
         kEDw==
X-Forwarded-Encrypted: i=1; AKwUvByCOuRC0Cx/966kh1TwlHLfBfMSp0ddr3Ug5/c8G4VcjcVhcXlpTim6obPlsco0IZ7pqpynZvuO5gn9@vger.kernel.org
X-Gm-Message-State: AFq9FYLAAlFpiB3CSZK9E8BLVwgmCqrmIT1ZSxKiTafZs+hkwloNbmNS
	QvB0DkX0DhJ0l4Jq3uGkwdrx2uoDhmltW1REcDvtX137eoP8Hyh1fYxae9hk7Otzk2sQe/csCV1
	F63iEyvKf/pBvJc6LPjBGLhLP7W5OK9rqJH2x51hSISWJ2u/jor3wx7qQ0E/Y+c3h
X-Gm-Gg: AYBFou1HEyQCrOJHfszjsVjYsukNg6oHTR7lFREESuZNwn0UTRXPbDBHuWzg+ZlDZ2g
	PsVR0Q7mBs9+5hpNCKVpFptCMgk8GZbWyHEY1mDOdA9GpKq3dJf4fJoXPvQA8oppQamfa5W8bA4
	/zKytlqWGMDVe+lWZGsTGd50PGQXHGZz4Es8y2VErE2N6hkQyYPOpRRPu0MyCEuugT8SYdxsts/
	QjWZBxPqiAQLSPtdluleuoMlcgztI2MtwNCfXSo/VmID3ryrZ8hnI1VqYqlZqDN28ayUEK4Z282
	DbgCnmMaHVri/8IHAGOhMdB8zAmqbLpX/SUSbKMfrmEKDmmzGNXSKYdWumKqqePLkrSSNkQIMyR
	yOclMrGQW1TXe4TwOrGKQXg==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr183745151cf.0.1791807913748;
        Mon, 12 Oct 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr183744571cf.0.1791807913317;
        Mon, 12 Oct 2026 05:25:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c32a4954a3bsm320996066b.64.2026.10.12.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 05:25:12 -0700 (PDT)
Message-ID: <85e1c0ba-2c73-4860-b615-59fbe7745f22@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:25:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU
 nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX7Iic1Lyd4MnD
 UBvky6hnsWatqB/WSsa7tfAE0958E7+EE+Je+8kT+fCQgAeDxzDVsS0fUww/B0xU/Ow80PzlBCM
 T9Mr0rBX4ve4jDwE+DZ9FB2LxkADQG8mpnwHcU8nTEmEHM1L8ZS7sORR6Q6bX1KeHZ2tm1++r4T
 o/VZk3WdaeOFU9FJ1pPXZfARm8/SDbhDXhaJ61SkrH79tAm0Qvoi9owD/W1eJkIctUq8iRCnz6y
 a6ekTCHLizwzBiD2mCEM3h9vHjbOZOeT7UvwVc/vQZBVUDkzfZRBpp+BZQ3YPQeXTaG7jKruv7C
 i08DTMKnRe/tregV5LMgBfl0AA9+rmP9e1k++1Z+qoGzq/Fga3G7zVY94ryp+Z5D9yzL/kFk2Oa
 nrGlXHNf1wK/l08igARIgULpyc8aOLsfMsrqpRELsLwoUIJlHkgun7vev4KgEOzYWJUt5TcO1wa
 YFL2VuGHvQYQ0YohZQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX7R9PrNWNfdxc
 TbIdy1P7v5AUCOpFIX/+g10nBbi7WqcU3yKxgR9aXTwXNWmMdR9OdZE9pQsum6Zt2jXVuuATrwR
 EEpH1A2HkG2UNjR2N69GZH/teCjYe/A=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accd1aa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aFZ6yv5HFTEQG_DnIlwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: HwmosxpgRktx7sF1ePPXcf4ELA-uUkWd
X-Proofpoint-GUID: HwmosxpgRktx7sF1ePPXcf4ELA-uUkWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On 10/8/26 11:06 PM, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
> the A7xx Gen3 family, along with its Graphics Management Unit (GMU).
> 
> Add the GPU and GMU nodes together with their OPP tables. The GPU sits
> behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
> clocked and powered from GPUCC.
> 
> Unlike previous Adreno SoCs, where the GMU AXI clock comes from the
> single global clock controller, Nord splits its GCC into four blocks
> (GCC, SE_GCC, NE_GCC and NW_GCC). The GPU's AXI clock,
> NW_GCC_HSCNOC_GPU_AXI_CLK, is provided by NW_GCC, so the GMU node
> references nwgcc directly.

This is a very mildly interesting detail

[...]

> +		gpu_opp_table_0: opp-table {
> +			compatible = "operating-points-v2-adreno",
> +				     "operating-points-v2";
> +
> +			opp-468000000 {
> +				opp-hz = /bits/ 64 <468000000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +				opp-peak-kBps = <781250>;
> +			};

This table seems mismatched with the clock plan

[...]

> +		operating-points-v2 = <&gmu_opp_table_0>;
> +
> +		gmu_opp_table_0: opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-416666000 {
> +				opp-hz = /bits/ 64 <416666000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +			};

The clock plan says that should be 500 MHz

Konrad
