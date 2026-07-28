Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9B52C15AC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785205228; cv=none; b=oF25a3ihIvetnIVsGz9PhjhmJWZ1rBb+jDZJx4oxSgpQ52F6tlJ17KHBVkNMVSUriTtqml5PfVMs6aTiHZ2BQN1/F2FGDYVocta7bjuiZI15bIT/gg915YkU+D/sKHwtu+pyrQ2IUbPFYmmVv4o1kVOa1PsK6lEqg22MCTr1pm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785205228; c=relaxed/simple;
	bh=dyay5f0mLFWdR33p9X89+nx9+9xAzz6YoEh9yFD9SV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFx5O+c4kho9r2pYDI9/tOvgbaNfJESvEg/9uiOfjdLjrXMH9YcrqQPC95yekY5LqjVWt910yTbiv4ocP1p5v6BcjHm2KnNWnwg+jrvrwiEI1TwzXj34D2tWGlMSPIvnT+FxyhYFuhoLAPjFu7AEVSdY4W9I7JbwJOTcX5Qj0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSinCYV3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmMtgsE4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSinCYV3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmMtgsE4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0ka3u1297667
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=; b=VSinCYV3WGdviCXC
	4T6ZAl5h3UHaJ1/rFoB9KRL9x67o9R+07SmjlGAEVU5/DAv7RnIYlFIEG2qMwsBz
	mt9erWBDiExTAb/wf5Kv6uxF8Oaztu/BYr/MG3bQLfeAPj+DdoDXJy97l8ZVIven
	EJIU9ErSQeBLuT8QItASdZvsrAddMnp8P1L3XDh+80lPhJBSd4MAucpyM/8KGVyT
	ALa6Pkw30AS1r+Bh3x+hS7Zh6mtJ7ZBikLl0LwDkHbRfFArfgDyVK6G7TUTmwPOj
	+JbUHY+dQAOOHYt9vLS1F7fy5js4ME2MxW07suwxRwTdlt3FzSpBujhES37xQu2A
	5xoFJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsswew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:20:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso91386145ad.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785205225; x=1785810025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=;
        b=hmMtgsE4oyNQhwzNCZFyyjHkuImEgU9mlwA5IIQzoOV2TJZqvBvvM//Wc38TxmJSan
         Z3bsWaS3lvWQJY2KeoCR3yuLUjNvSQloP8F3xWGy05qUskHVY+vQzOPrZ+QmkWbNW+nF
         kQfUZUcmE5X2f04w2nOupaSA5R18QPwxRNn803veZSc7B0GeWJ/1c5q3idWRN+AsyOBm
         bn0cdarePw8qGkQ78WCUg/CAb1pIH6wdRAREax0b9gyQM6u5HVUjwu5tQQ3YAXbwPIZe
         Iu6C0clBo2nSN0gTXYPJDL9VgfhzG3Eg5rgvDrJ/ogyslLXeDdu6KbQJpDPXxAeLmT35
         NBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785205225; x=1785810025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=;
        b=NsMPxn0y9qhub7TrpaOCNvXPuyDb3jB45trmc5/q5DSo73By8cH7/6NbXJ5IKkMn48
         dRwyuIMAI+Wbi15msBvmdMJLBR1gzaJn7AwO0rJxImsjv+C/tpBEFrB/j4KKL4x9EVrw
         E0+F3BwWiOWG1yDj2fHgP91HfD9QHg6hGwktaJ8ZJysRDgz1Y4laavWUURMoIy6UZ8bL
         hpnki1SFByP/8hCPTSWejL7MaKj682oxxJ1KbxNMalEMlqNN+72oa8yt65m+IsaxJxui
         SpOmT5rS6R6zVupwB2JPxVK72IZBHKQX5focEBBtbkXd/AAQe1jH6MnG3TBhBPq7uRIL
         /85w==
X-Forwarded-Encrypted: i=1; AHgh+Rqcv2HGytjZF4qbZ9RMlWJCv/vRDThrZdT6KDifuBdJpWFVPBvQhvVbx3uxmehummgu6wcIu9tN85/H@vger.kernel.org
X-Gm-Message-State: AOJu0YzN6bjYyge3Bhke32vv3W1MuIMxqn+TOP+kbwphMTdsKIF81624
	jTm8qm/10M4sp/rJBVhm9b2H518kuLlHDh+tLAPVkBLYzVVp/7wLwRMyvbehuBw6WnflJriEKGt
	tGMssmh7fphS/XvBAzIeWOs5ID07i/pEbsxibDB1/8Oe2lk/Lwrl+XOj8Vmzkotv6
X-Gm-Gg: AR+sD12WVd+pT7Uo1VTUxjZk04htitxaOeOrT09Skj6HQALizUx7WGIZHPacHm3Qgxr
	SzlceSawCHthW8FKgaFF0lLuOv9jRYKIKwdIcrj84jFRnNqXUd6w75Lj/icztDm6i3axD5AGRpS
	OtJWmiWY35llFVcrEIlPi33MOcvoIt5JhoHkuSLPPABJkRa2O7kIrsUAoxLqoiqHJtnnQaBPwiv
	rpb6SAFMAKlpxk027Nm5vGKRPCMMl2gbc/eFamN+q8VAaYeNyROFi4lkGtXOgcX8rXyJQ6tuZpI
	sPIqGFlv5a4d3QSrUsqpy3rNKrruKDwK3z3fpyj/sbqxw0CZjg2JsdrYFyeMZUuuHtJji0NrPhc
	snwYFu8xuktn1aaoNuY2FfR4v8kBkjeW/J+7NpNhJxFzdBm+NS/M2zbifflMHkAc2ZQ==
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr4178605ad.34.1785205224843;
        Mon, 27 Jul 2026 19:20:24 -0700 (PDT)
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr4178315ad.34.1785205224408;
        Mon, 27 Jul 2026 19:20:24 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdcdsm43957695ad.49.2026.07.27.19.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 19:20:23 -0700 (PDT)
Message-ID: <603ce64b-374a-4d69-83d2-6387b55a5991@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:20:17 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
 <amOMPmn1fBE1gGoe@redhat.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <amOMPmn1fBE1gGoe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAxOCBTYWx0ZWRfX0sJgOgf836wa
 Ze45Wp1bNbmH135AlEyHgzkizizhuducPSbmJN0f4/cP5GKXqMYXOuKIZSyQ+R504HhPsAFti2P
 DTFG779LjaOpAiyRVWSIWuL4wUjnK0FRRvuv3C8dnuObYqwygS3eko6ahooroNVbvgnH7LHi7nb
 /p7DKG3DZMZUKRcdbl2Bjo3gQbedm2cPMgxLW19wzIMPz68SFfu+b09idiN7nQz1dVT/6kWUM8W
 /5Ja2p9siXydRaGsmdEUc+3e7OyrZKdvBfX6TS8VD637Yx5vG1d34WLQFEyFTeyCN8zngB2918d
 hopiK6Xhq8lFmffRYv5+/bZKHM1zIX2LtdvrMLkG3Cus/C9x3PFFnTxxqCiIklh9UfX39NjxOaF
 H5scZCb1mhEd8DGcvDjR2pJZk9Spdjf7R405mYLPNRcrWmvSC4s96qFfrCFwbo0f1X1v5fq7uJM
 n2ElyQsYbb4vGeZdCRA==
X-Proofpoint-ORIG-GUID: SKtIfWBL_TeTcBOKKZSNa-ZBWrsRS_VG
X-Proofpoint-GUID: SKtIfWBL_TeTcBOKKZSNa-ZBWrsRS_VG
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a6811e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=Y8BVQNzp0A0Au5e0V84A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAxOCBTYWx0ZWRfX0ap840Imow57
 qmLD/LZ69c42p/zETta7N2iDrQPHofXgZ+i96x4T3hIpRdLIPuf/9cWgbdZv7mVZy20dQGu0VjK
 CBia+Wo9vcp3NeNZoGsiRouelznOd7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280018



On 7/25/2026 12:01 AM, Brian Masney wrote:
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> FYI there's a separate series for the UltraRISC DP1000 SoC to export
> this same symbol. It depends on which series Stephen merges first gets
> in.

Thanks for the review, Brian!

Noted on the UltraRISC DP1000 series. I'll keep an eye on it. If that
series gets merged first, I'll rebase and update this patch.
