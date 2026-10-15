Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EFF4EB867
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055478; cv=none; b=T/MkGzsZlRltv3b8zZdgQVbD4o40mkhTCG2zMkvsh3OrlfAG557Bqfv+Owyvomoexd3oqORrKSSrpunXo4DlHlxGjYw6rbC3Beg9QmFggCLI2uu7GQRl1SuOxoBeWczsZNykHOGGJ91oFzuP5UazT+h5nG7tOFZL9ZJ5EeX/Owg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055478; c=relaxed/simple;
	bh=ZP/V+XVDi3VU7pwiGc5G664R30B243PanFs9BryZBGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fvrn6x8MDLflwW7T+2b+9ZkDRh/mOwRl5BZrjJ9iJoAgiCHHYWkMOy+cl0ZVnTzOMgIY4NnITdQUx7Dd+8KnjMbaicE0I/9XavSyQ1ku6WiwWdhwm6EIvfuOdeAUhpa7jWynWpKapDRffYS2OyIyc5JwW7POZzkaVOTP0CbMZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AogNQwqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Giwaak3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AogNQwqA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Giwaak3Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7f7jf1707226
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=; b=AogNQwqAZL9D8O1C
	72ugis4zGLSjwVmVlHqQ1Uw00SWq+/uokvuCnwPJ4aB8NypSYZHZeJDIwBmctMpu
	6lNEHwWc0Fj/+qoWLhn0wuiomkYXSJ9ZyzwaAqB73hR4kFiUyjwavYrhCRtcfwdh
	bXQ2km1dFQID02/+ouh+RwxshawH7jPobd+xw+LD+/tLOx9l71J5cLA9NcXaS6JG
	E3fOykxNof2Ai+Jx//OIEpucs3aQpydwLi6seB2vSX+y9P1y3lNLc8JsYbnZdU8Q
	Fm4sRaxUSfXOeEqHd+WLyF8xXWXbrIRLpk5WStKRD0i2/7dFhMnccPSAV0z8q2go
	P0JDrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sq5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:11:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53568f05f8bso14690761cf.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055474; x=1792660274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=;
        b=Giwaak3ZIwgCXsYAfg/Ypvhw+degn4csvsFTBl+9EYACH4u7W+Xh7heljRST6/mWsb
         jh3ptVnOkwSC6dir1M2TfTdlLMZh/wjzGRVmbcwVSwnDgSEVcOZ82wsWemIGmMKv63N0
         /gNyDmyn1TyaPd69cogGjkGkiR9ij4hH1EBKQ4b4gS1hUmidj4nGT7X9Q9KRlRRKqKvA
         wpSx9zeuUyML+sYFO6zkYy9ILweKjH0kdodqd1E7Pe9iX/PvaOx1o9naTdXfwKVaOrlN
         cZ7Vopg0nkNMCopWhraNTd8qvM7dMIV2JhAVesj0jLL+UOCKgXlwNr0VusO+u3s/wo00
         tQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055474; x=1792660274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdtX+dyyVh6BP1HakGebp1o99ElPTtIZjQj7vLhLhyg=;
        b=P7c2CSYnlQ4LVxati37Q1aA+MkA9zo+5UTkvbQg3aPV0hNtqIhm6NXn8bIVLGioen0
         WQvCqlenOMZ8YmF/nycLRsOGG1hmbhZOfFVvVupL/xgN8ortlLRtoQ3ax5xSGqdL8h7u
         Qg3BGJJ61W00LOyLFnWbiRdGHFwkEceaWP10ncmeyTdCnTSGQj2Se1/RKb+7tHv37DZo
         NjoXNcKEr7DLp4xg8VdeBuIeg7g1ziFmkYOkRU7MZ1gzD5LX13tHeyuxx05zdC/xWnOJ
         n8gl8VPfq1S66aQzng1RRxr92rVrh/O2XwqWE/wLiA50y0BP8H0oBakq30vAXav/BIt4
         eWGg==
X-Forwarded-Encrypted: i=1; AKwUvBxcd3xtCiJcHKQBXDTiqfxQihmkSizJAbecntnErHocBCmY9GmTuviKLV27UB9ctp2QnoGIXJWX5zSC@vger.kernel.org
X-Gm-Message-State: AFq9FYIdmShoJ71g8hgXC6xUUpck59RdVOihNvxID1NkvO08PuSisph9
	GJ4TZPWxcF2+wLV1ZLBEqe1zMtgalWvos6wvSJ/kt0AV4doBB6sjDlm0GszoqbnE79OPejCIgPm
	u5+gwsjrLZYUEAb8SMhkQ8WI6wq6B05yIJkrF0NoADNiZ4OON+33Iz0kmx9jZiaYh
X-Gm-Gg: AYBFou13atxSDf7o6PzyltxhQdrqMb+zRKG0aVIB1zXtpqrGgoYBF8ZReV1Hm1+5/Vj
	3QzX56T8bdbrrAsdK9Pnby/Z4aiyC53rvcsQChAoYgEl7/vJUiGNniqfWCWJY1U1Hcsa/5HRLr+
	mbym4B65sFs0vXDb+1UKtvjFkwdb2rS7C9pD6lAM/0NAOJd97k6wJ+OJ3USmgv5LCIosE4zPfkz
	gkL6eWgnVzYPIUwK+AEYYrKyM2mj5a4lUvjarMH7JIZs/zT+OAtM164JFE2ffJWd09QQvxtpDFg
	MDi8Xaexd8XILa3VRX706iwwx38hXkhTjW9+u1zApquCiplI3OZQEZ9mC3hnHCld7/rzFMbyAt5
	YkcE/e3BXfXFPoB85SCGdEA==
X-Received: by 2002:ac8:5f87:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-535fd164be8mr94188071cf.5.1792055474093;
        Thu, 15 Oct 2026 02:11:14 -0700 (PDT)
X-Received: by 2002:ac8:5f87:0:b0:535:fd16:4393 with SMTP id d75a77b69052e-535fd164be8mr94187711cf.5.1792055473655;
        Thu, 15 Oct 2026 02:11:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab11d7bsm101289466b.83.2026.10.15.02.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:11:12 -0700 (PDT)
Message-ID: <36e8a372-3a4b-4466-831a-2445313dae51@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:11:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sm8150-hdk: fix FSA4480 address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-8-5c14928cef29@oss.qualcomm.com>
 <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddbb547a-f59f-4ad2-8c99-4436bdae84c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad098b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mAFRzXhWWU4R2_A-WnwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX90yR9Qp4pXU6
 tTCIrdhnGwKAswIEfrVfGTvRAHsPsha7czr3UBSPdXSNbUEQlOeQZPcIsqm5n0Gh/bKAaelAamq
 TvTMyvy5VRyUQgbzx18pjPnIN8MwcL6RUVH7S1Osa+5egmHr4+yMPc4trL2gYoFC5IbF10+DeeH
 EWK/QUQf7oPYvsNTE1y60vc+RcI/kgYvUti/KxTbeVa6HIxZ3anvXdznrpv2XW457Ie5U0S48SJ
 u+nr2m81WQBnMAq8oJ98+s39emmm9EEWLtj5rOeIh9iZx48E7M+XOdTmdgwGuyUu7lrkN5kZ6d0
 HkwTylfAamIKrkj6+7FsV1dvEl9r+UDa5b3BcktUgFcjCMjxRrcEbY1YdGcvEI/bGutnxRKam60
 btgf7XK59wukQE7y6SIU5V+huFQX1byRq8kTt4CmJGvsdbJbfmMzSZ+0DkhnvMq56YyO7xJ6HVN
 W4o5/E9ibsQxOjpbm1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX1aV4DwhKm79M
 7DDkYt7eTYeeTLppYs+Xd1rUe7e6AynL2rMKccHGK/2OoWW54kFl7j0V11c5cbebI2Zxlrxh/Ld
 CuVsDTAiXT8KbnQ6qBlEZ6RYKNnkCoQ=
X-Proofpoint-GUID: CvFlmiStKEp89PmCAjV-6RiKPta4ErGo
X-Proofpoint-ORIG-GUID: CvFlmiStKEp89PmCAjV-6RiKPta4ErGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150036

On 10/15/26 11:10 AM, Konrad Dybcio wrote:
> On 10/15/26 10:58 AM, Dmitry Baryshkov wrote:
>> The FSA4480 on the SM8150 HDK responds at 0x43 rather than 0x42. With
>> the wrong address the mux driver fails to probe, the Type-C controller
>> and the DisplayPort controller keep waiting for it and the display
>> subsystem never binds.
>>
>> Fixes: ba712fd55c7b ("arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode")
>> Assisted-by: LLM
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> Hm, there's an ADDR pin on the FSA. I wonder if the previous guy had
> an earlier revision of the board which routed that differently or
> something.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

oh wait.. the previous guy (author of the Fixes commit is you.. :D

Konrad
