Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B9381EA7
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384360; cv=none; b=dYLhgUXeKN9iWer36vxTWouOFXjMsPhlXtYqQbKTa9jbbnwQ/UiVhGfjJ/FMaInqOUe4u46RjUet0QhlEc4z0tfsdgawNM0761VW33kHHj9TK66u/E3qT6iyc7YXg6wfovV8m9HWY7lHujQU6YHR8q8ZR0/JFgNFb4ePnh88QyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384360; c=relaxed/simple;
	bh=bg/u58FVPNfwcE8wQ1pOFEY7AW8NMLFUq7qu9enoAyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flYOm6EilNEVB9fy0ksk0BhpoPpoIAtYK+aiaOlCIMSX28nw/zoaRwCni3xEChtH5MMlkAHhZ2emKTxn62N3Cc/ZW/xQJOkWDu/oynVL/fZUsarO7XQhkLnVkauGgRWRcOgbEsXX0UioK8xIHVu4AEpWXSxIa0cN4UubySb92VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cy3Pinti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnuDrqgN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cy3Pinti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnuDrqgN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV6P5609856
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 14:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hwrc6Fdyj3kg7apwdRECnQhAgQVLP5Jp9gBIka1O4mk=; b=Cy3PintirSGHPd89
	K2D4o+5vHgdySYaf/qVBLcfDWzZbHPkdhfA1pn0Kbv3Gu1SedWHBO0yPQYAYylCy
	LB8f1NECds9ReR/crXT9RBMehtKGMeVHgSeOYzjFTau21Gj4ahOqkMmY+fhjV7Hm
	0/Ate2+AFpNXbijo8IkLWlLoC8XsvbACw+9zkOZ5+FEYJI2e5rRLB5Q7DNFTmGbX
	gIjfPVWLWnGyKkUPTC1XkWXCd9DQKvHQyKcfz+5eHZErivq5+8LbJHN7o0sahWjI
	Hr9OwKtW+vB7ZyVp/K3aH2IBARBdvVtAnSW7/sGQdYMWs4v66CnRPNF7qoyLqw+E
	6x+IHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc59ymd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 14:45:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a8736ec262so1767813a91.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 07:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791384351; x=1791989151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwrc6Fdyj3kg7apwdRECnQhAgQVLP5Jp9gBIka1O4mk=;
        b=LnuDrqgNIEXDWuwigZkqNpHGVmwmXQ2B3rThhqeBOTwcKwnbqi6mgt0ErGPv+x7UL8
         liBepK28Tu68irYPBV79qeX3/KKshaMl2/8j8Q9yoRlWTGQWB+dzfZPo1tnVgrYJUimX
         Voj3sfQVKkFBsmEZFTA5tPQURbE3Vj0yVKPFNMsDU4NBTFh5GUPUT14vd+uFdXeFYl9+
         o+1ZY92WJrYHXThzkDpoqZrvtsydkYfxL5d8nI1m8AfxL0dRF3DEORwXXNotq+I9tTQu
         U2gNu0CwxcNj8eE4eP1dDKEUEKpgc1H1o2RcZeRYgr2SiO/9jzkha1RmDRZLugk3ZG8b
         x8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791384351; x=1791989151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hwrc6Fdyj3kg7apwdRECnQhAgQVLP5Jp9gBIka1O4mk=;
        b=UXtQSyD7knGD+sY62GZIIstAM+s0LQ4vVit+HzTJ2vn6LCqrrAVHYiJa4MEjz1pJa6
         dCUTaVMzdwoyPoTmfstMMIGIpNnx73GN8dQPOrX7VL/jsrkMHWUQM+J1lPDsv8H3s+XI
         oNvCcodlWnUUU+i8pHeUww6L/laTNn/JI3qefXCMIh/k1vpnWjqeL3CgbD52VQhABTSb
         txxxzkMKmMMpuXFKq2lOTkALCHb5n+Lq4u2wOxv9XAFEuzF2V3LLOL4mCyCob1OOQyhK
         F0DLeYe4LEDaj2TIinPNnoq4NP4ZlffU/+OZGl7qf8JuFiPuNmSZoTejH/yj9l3r1n/t
         p36Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9tdkGYxLtjIeqCPdKigW4XeswIu+fKnX22pUWmau+CZ3VFkOauDP9HXt6woOIhBEb75g0QhV+rK5d@vger.kernel.org
X-Gm-Message-State: AFq9FYJlsu+xi5cAWe9uYqsaspNAuzOxkcnEz3JXgf8F6IJ5qcYYgp4L
	9/PJq7NSwv06lVUYErtv6tcYvLz8GDZfmwHtm59l0xudwWUqqpcusiaVVHJixCKxMEWfkJ0aAZC
	etJJTLFoPOcbWyfGPkRwuRP5c6C+GlGfe3qDqcYhv8cYtKYqvD/DE4Hge1PdHnXrB
X-Gm-Gg: AYBFou3AC69F+x3uIBjN6dn3W2Fy9aH0n8aytKWZWb8WI2ZGs3zvDxxZ5iZa0sUkhc1
	JeQFirJM4bz3rOhSXsAOQe11hp5eRiygbXFJMeRFkBGXnWOBHtvjO8jXrtWwNlFmT+5Au1uho6y
	j/QyZgD7N0lI4i8eBlih6EGgCfNlivN9lgYgXsWd/UXjGBu1P7VHzfILUW9rpI/5OcbHG6i31Au
	eKXuqqWrrsQE1XRmjNZbU/ZxZ2OMAm3Ekg+6FsVggdbxKfPcwML+/uzU/EWSUNu4Q/ha923W1Eg
	hlW6KbMkuRhYXWjDwyNLtc/JZwvgnOQuLVoMrvnN5IvE9MmmpJ5Ml+fE9RqUO8gKq1+mYo+ceSQ
	ctx1PO07YjvMN4EHvYtKp5Ou43O9kTgWRg5jumtRp
X-Received: by 2002:a17:90b:4f44:b0:3a9:9f13:e960 with SMTP id 98e67ed59e1d1-3a99f13ebafmr45585a91.60.1791384350917;
        Wed, 07 Oct 2026 07:45:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4f44:b0:3a9:9f13:e960 with SMTP id 98e67ed59e1d1-3a99f13ebafmr45527a91.60.1791384350133;
        Wed, 07 Oct 2026 07:45:50 -0700 (PDT)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8987b09e2sm5347940a91.2.2026.10.07.07.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 07:45:47 -0700 (PDT)
Message-ID: <7e8ea792-2336-4252-beed-7345815b0b90@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 20:15:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261007-glymur_ufs_qcb_enablement-v3-0-84cf4f861415@oss.qualcomm.com>
 <20261007-glymur_ufs_qcb_enablement-v3-5-84cf4f861415@oss.qualcomm.com>
 <zovl7lrhlleflaewk32o4wofr4bzm2bmkdnakev47peijrnkfe@p3ixrxltdpcm>
 <f9c7bd4a-2e97-43e1-a9bf-295b841ef0a3@oss.qualcomm.com>
 <p76qp5bhijenec2ygj36dd47uxkeyk6kztccbuhblte5lqn22x@yikvkbipjbae>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <p76qp5bhijenec2ygj36dd47uxkeyk6kztccbuhblte5lqn22x@yikvkbipjbae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1OCBTYWx0ZWRfX5OWdRKCWtcUq
 kdmvuIu/vKEcpwhri/+pmSYMpPuCVY+q7I+nFTHlrIhVAFzdU9SiqWSkyuKjOUf9NvkS0/i2w+O
 6y4B1k5sn2r+nRHyp47eaES7SZ7eP9Q=
X-Proofpoint-GUID: B1Ll5O9MYGKygqiAp7CVvk0ZQYm4kheS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1OCBTYWx0ZWRfX3szoQabvB4Ie
 mrjIVckIPUWSGkK3dWK3O/mkFGp6QEmdnFV/GeqQcih8d1Va2s8ckSbI3SYvLsbWHuepRdUpzx8
 qHzI/tZY/aVOnfxfzvx0FRnHiCzXyRhgiBVkr8Mngcqt/1683aCoYQwL+kW3fm4pppyJT/vtsFo
 bym7hiVrQdEbQDc6RakaFOoUQJVUUqKo5oKDnF0SP5FkdJRvVY0y0Xpl4tjZmXHeed1z6CemIS1
 7cN1C0ftmjXv/v+p104RR7S5ovIn5foIzGV4/j55lDIPoLqq4QcGg8LizjrMlKTua5AKDoFotNM
 onZYP5CPcyMkx8NG2l29BdNnImoWAkLoyPLYKV2ziFPx+JJyupA1zMQumj/g31v5gbjqr28sjzL
 wqZx0bvX6XhmVIenzYFqthz13vQwo2H7yyDNdU6fHZtweCmgUmr8x3lh3Mw5+etLOGApWYFvIPM
 wTzDLPkNFJ2fA5FD1/w==
X-Proofpoint-ORIG-GUID: B1Ll5O9MYGKygqiAp7CVvk0ZQYm4kheS
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac65b1f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=arnyFyO8AZpeLAH_8-UA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070058



On 10/7/2026 7:13 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 05:03:02PM +0530, Pradeep Pragallapati wrote:
>>
>>
>> On 10/7/2026 1:18 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 07, 2026 at 11:59:38AM +0530, Pradeep P V K wrote:
>>>> Add the init sequence tables and config for the UFS QMP phy found in
>>>> the Glymur SoC.
>>>>
>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 99 +++++++++++++++++++++++++++++++++
>>>>  1 file changed, 99 insertions(+)
>>>>
>>>> +	.offsets		= &qmp_ufs_offsets_v6,
>>>
>>> So, is it a PHY using v6 offsets, but v7 registers inside?
>>>
>> The QSERDES RX0 register offsets on Glymur SoC are aligned with the v7 register layout offsets.
>> Therefore, the v7 QSERDES RX0 register offsets are used for Glymur (similar to SM8750).
> 
> Mention in the commit message, please.
sure, i will mention it.> 
>>
>>>> +	.max_supported_gear	= UFS_HS_G5,
>>>> +
>>>> +	.vreg_list		= glymur_ufsphy_vreg_l,
>>>> +	.num_vregs		= ARRAY_SIZE(glymur_ufsphy_vreg_l),
>>>> +	.regs			= ufsphy_v6_regs_layout,
>>>
>>> v7
> 
> This still holds.
>
Do you mean changing ufsphy_v6_regs_layout to ufsphy_v7_regs_layout?
If so, no. ufsphy_v6_regs_layout contains the PCS register offsets, and the 
PCS register offsets on Glymur are aligned with ufsphy_v6_regs_layout, similar to SM8750.
 
>>>
>>>> +};
>>>> +
>>>>  static const struct qmp_phy_cfg milos_ufsphy_cfg = {
>>>>  	.lanes			= 2,
>>>>  
>>>
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 

