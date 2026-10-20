Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533775;
	b=GjwNAVT9BXZRviiszsDSeNNWwDQ6G48Id/0KdvoXWAPJgZvxOJ7QD7y+bL/T0XViJYNC
	 hogY+4BxDo0j/1DifJ3jtDj5kjKOY1ja53wi+zIWcMxBnkpDaWxQy726oIqwqagTE6iRj
	 P9PpW9ZXSVTO2MZOfbuFbXBoRX7UN3uIB5Tfu+o4MmYOS6Xc4+rzTU57kFuu0Xx8vrD6O
	 vrZsnqBHNaFomWowaV+iMoWoL6Eprj9ELOFE5gYTa6zX3gOcs2IM8GSP9ai2YzWCZc6qc
	 ah6XQDN8ApxfYpblLgO4nxttg2Cd5qpwJ0qL/YF3Ox2DcB+FEzH/9KvkAFKc0+kS5UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
	b=WdwbYV9StJ15AqjxdaOO0yhly0tLN1D6myV8YJuoZ/8IEBiyG0IkSFtT4zlfcqfhbi/6
	 mJwv0/svUFDuSOVAB49wQVfiD4QuRDiAwpXMfjfRr98osQOga5adAcXJO1v47TnMRcAWe
	 pwcphAEYAmfPIlx7EOKcl4Rkvh1QhKBwlCkAs0jCN5oV7gByk8L6mOTRCKmnN5jsGQQCH
	 kBAEUArrfgV+SI+wct7+Hvi/DP5vewwP6NluwT6Ox4P/wNp7UpmTZazpe9IFHLoV7QDni
	 /e5mVLfJMy2Gsnk64bEQ/qlwdfnbUfOWVNahCCpT1x8m2oZPbyLA2+WerzIdX0csqUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LDY8IEa6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DyNbKyS/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D58606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LDY8IEa6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DyNbKyS/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtu0u3229741
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=; b=LDY8IEa6lDdsm2w3
	HqtUZtENLlOIbAWt9TMOBbwBYjuyYuMzwXJcCMlkh3d83vFKabVZ8W8dYsTlVByf
	Py7MKdIn1jF8WDtiFvYClIe1mV52trAeKPhynKB+8BaJEV/9K/ux1LZsveN4dYPW
	C+MeI/jO3lsS2tX9V6aWJUEfD9MkFM8TKTsoyFf1ImdgWS+LB3oM9JyYEgBL5JR/
	rS4xkfen0ATt8J2DUpPAOIIIgF+ufvgRt9PkHCkpT8kpePGDgE/9/s6QwMK/Z15f
	s8CgWWRZvZ0rYkCsE3Z4PYN813MWb8bL/vneGvk0vIm52NWoxo3diBEbm1+1kh5w
	a5Hdyg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nvjx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:02:53 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1663fb7e005so155369c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792533772; x=1793138572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
        b=DyNbKyS/YQjoXyGKTttNzYfPc0lR6OGeBsuCTfbUrnhnX26AHyymskivASaJrky1ph
         sEtfTolhx9ZBuMuxr16pTFsoVTDRM6p2fccGJ8HuQ/0o4jUFdoo1lZ5oAP487/NCTc1g
         Ajz76KT4k7nNsIqXmsHncNleufp7PxbVGeD8EAkjtlDAircbstoKzDsXwErjkWkIqi4y
         Go3nzPPzLwtbg9B7zfKqDjtmG0nqbvhNcCteWhDVrM7CaHo8I+vXLIIL3j5jbtnLsG+0
         XRRT+9XJgTu4KPC6bA5Zkgl1TZeiNYQJ59Dx3gxtvTSn7nMxYDhl5QOBnnxDQHZsXT7Z
         8bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533772; x=1793138572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
        b=vBZ7b2EV9kPtizIlO6/+03HvrstxbGG0g6hPYBbBehqTk1lHhKO9ZtMIL+c+P4aKTT
         4K55t5ktOBk08ee1kzobH575N+QfySUI3ftMadBnoYiKtPkvx3vRMvu3GB8ky7gp+bdp
         HYIMuIsymHjgpY0evNN3JFfE+DYaphdZ9fF47LI2bYkksXCAjdNua9pW3M+A5RVkY7AY
         e5rGQlpG57LZTb0nsHe6xalZT6sGRmd8qhWdusfFfwzlKE/VvPwwaQ+7sESOYitw9QPx
         fa1PfH/XiyV48TAfFBTWoGRfnuQVz7EpSP7Qr3NAVg4JQvizKyeuOrvd83z3Tb5pkZBW
         MzNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4s8jjB+a4DUF8ujnceGPm2uLVcpRlwUOFrIJeXER4PDQS/NO2NRiOz3BJUbUDQX/sMuw4UXHQPzLV@vger.kernel.org
X-Gm-Message-State: AFq9FYInfYCYYwBQqDp0Av4QHoulCuy7sblhwzA0xBE19ikiUrklfwR6
	TI9finEOiD8qolM1Ml15Ilhox7YdbxuH4oELQh/Ay1OlqJzQWgOTyGLLEdmh6uSW9ein2N/eLbI
	bwyH+dA2VKPgIAAsk1Nc+kRlyiI44/AihSShXp5n/rV5+4LyFB0tRw9Ip2iKBlcFx
X-Gm-Gg: AYBFou2x0vzwUABpWi7MulPextsVLaEV+mdZn4txE3HAC1J3/PXIGS/xURtn9hFhjNa
	fs1222W5YxU+OaUP3eZ8dTjRJi3iSOVTrfzuVJbGnCRr6vTxgL72Gr8WUw6jlcA7mBHBBfjI1oU
	B5bcewVV9U4XutcePbYxNRWgURalF8nczXQre4GGVM1i7wzxVt9lE4HZLrN2b17/Atv9trxYwnb
	c79wMW/7Cgk2TaZHb/qmCtcSbwXcijzGI/KiQeKAhiKUWCpcS5lsm90Hv+Az83Hvrrgnj8pvJBR
	fPT+zRso39TleIsVm8B8CDIzSeX7m77FJUMFuu1Ywl2SeuHZ0+FhHq5Z3S370zyzh73O3JdZDsA
	p3acXL8/NRMKNshpp6oG+R9R6l4Hwls8K1XSoTOhladYHvLWFvMOLYxQD
X-Received: by 2002:a05:701b:4286:10b0:16c:6459:35b1 with SMTP id a92af1059eb24-190a599b411mr185234c88.28.1792533772130;
        Tue, 20 Oct 2026 15:02:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4286:10b0:16c:6459:35b1 with SMTP id a92af1059eb24-190a599b411mr185196c88.28.1792533771462;
        Tue, 20 Oct 2026 15:02:51 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm1154475c88.6.2026.10.20.15.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 15:02:50 -0700 (PDT)
Message-ID: <8ae43c5b-b99b-43ff-a56f-19f4d5dbe176@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:02:49 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] phy: qcom-mipi-csi2: Add sa8775p D-PHY support
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <EKfYfLCfqnEg_PLe_TsBkAGryJgP_tA140u-0ZYSL9q5kInrAtoRCiugYV3C2PDDvYjxaeejuYK3gqzAT4FMXQ==@protonmail.internalid>
 <20261016235502.2274268-5-anusha.nandi@oss.qualcomm.com>
 <392642ad-3bac-48bc-9199-8c3923c588c2@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <392642ad-3bac-48bc-9199-8c3923c588c2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NyBTYWx0ZWRfX5PfJYgco3h+i
 RKoE59giUfUT59cWwl0TD6rCgUlFljGhtdSTia0OFihnztJ4HLzyuUPzbGrjk1YqdnK/xfDNphS
 Syqxnb1zLLnH+ctPJJwish+Skh3gpu4=
X-Proofpoint-GUID: XSg599X5ybB_qczsRD2bvQmKUg5a7E2j
X-Proofpoint-ORIG-GUID: XSg599X5ybB_qczsRD2bvQmKUg5a7E2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NyBTYWx0ZWRfX5X0lyg2P2h3j
 LdQr6M2g1yBRGY1KauOUwdtzEwTCG8zuKMuH+S7yHqrEynr5gISlr/lRgkWEKadLrvWFUuq9xYI
 V+TCvVA+7sxLROsurtk2UA6PsgzjdXFHMdNHKo1CcuCgfcdrbiDs2fUSuxmRbEYyvEoJROH3f7T
 3gu9+EeNw8oeYQAZzW+CwTPhlFQ+Mz2Inm2HGaXm/xoOVOCCt5io7LOx5fdiRnYS9WvH8JsZcFs
 mZy9N65M+E/4YU29tThkuGpdoujyELMQ378WjytwGKqCMrlqYgiF5jeAyeqTY5ICK9gZtXlJWNi
 2klILd3fDhJMviKiMAyvNzCXcTisNtlCFvdC62pbjYbP8Cuv2Lvo7M7XFjaxwuNR7cGjhZIRtqE
 6Qt2k4XJtB32pqgbrcNskMHGq5ZGSu4SragOels1cSI+z+F6yiCkw1RfiEtVHyVM2eSWn3H5Fug
 OUHisYU4Y8T7xMg697g==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7e50d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VjktAE_kRdQNXcrMly4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200087

Hi Bryan,

Thank you for the comments. Let me make the patches specific to the
functionality and make it more granular in the next version of the
patchset.
I agree opp_clk is supposed to be optional, I will make a patch for it
as well.

Best Regards,
Anusha

On 10/19/2026 3:01 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> The timer-clock lookup in phy_qcom_mipi_csi2_probe() and the OPP
>> clkname passed to devm_pm_opp_set_clkname() were both hardcoded
>> string literals sized to x1e80100 ("timer"/"core"). Add
>> timer_clk_name/opp_clk_name to struct mipi_csi2phy_soc_cfg so each
>> SoC can declare its own clock-name strings; x1e80100's soc_cfg now
>> declares "timer"/"core" explicitly, with no behaviour change.
>> SA8775P reuses the same "timer"/"core" names as x1e80100 for this
>> pair of clocks.
> 
> LoL I had that in the last design and review said "hard code it" happy
> to agree with myself in the past, however this change should be
> standalone and precede the Lemans work.
> 
>> SA8775P's CSIPHY has a single power-domain, the Titan Top GDSC,
>> matching the legacy in-tree CAMSS driver's sa8775p_resources.pd_name
>> = "top" and the existing lemans.dtsi camss node. Like x1e80100's own
>> "top" domain, it is not OPP-scaled, only kept enabled.
>>
>> Signed-off-by: Anusha Arun Nandi<anusha.nandi@oss.qualcomm.com>
>> ---
>>   .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 112 ++++++++++++++++++
>>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   5 +-
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   4 +
>>   3 files changed, 119 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 966d79c98f9b..85e89235f7c9 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -380,6 +380,118 @@ const struct mipi_csi2phy_soc_cfg
>> mipi_csi2_dphy_4nm_x1e = {
>>       .num_supplies = ARRAY_SIZE(x1e_supplies),
>>       .clk_names = (const char **)x1e_clks,
>>       .num_clk = ARRAY_SIZE(x1e_clks),
>> +    .timer_clk_name = "timer",
>> +    .opp_clk_name = "core",
>>       .genpds = x1e_genpds,
>>       .num_genpds = ARRAY_SIZE(x1e_genpds),
>>   };
> 
> Yes but split it up - "remove hard coded timer and opp names" - actually
> you want to make the OPP optional no ? In which case you'd expect to see
> a patch to make OPPs optional - instead of folding that into a
> functionality drop.
> 
> Because say we want to revert or re-order the addition of Lemans in the
> git log - we then have the problem of mixed functionality.
> 
> Or say I want to cherry-pick a backport - I don't necessarily want to
> include lots of SoC specific stuff that doesn't affect my part.
> 
> => More granular patches.
> 
> ---
> bod

