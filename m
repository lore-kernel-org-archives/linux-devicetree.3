Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220563B3C03
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787550230; cv=none; b=ZVyp7RuVAGki4igFFzpQ8M07QZbdJNzwYyGprepjjJvjmMFCsMTSB27oCuxYcEYWNnq3swvQF8TV2p6d97/uCM5L/0Qi2kOzT64buPrwdsY7+ok97csYM5h/QTDmz/hGcGFqAcWbNsvLMza36PDHHfpntd/tyjD28cFBO5JCVTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787550230; c=relaxed/simple;
	bh=7oTNqVF6WEleWtAhcz9BRLPYUrFbR1yxDAiibCRuyl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5qQv4mFWLMsujYTAzAbynmAviVc8OuO5flaqhsLLdvYfwIyg+wAnVUtw9JY5tSfM3GGMnBaANPVP5Z3rYtnWJHzRfw2yfaBk2lEYFWNT6N2jjuMceJ/AQ/YVVBtumO+bFAjnL2sxSuYuKm6jtsm+aWXgCeuXt+8ZhUXOkx4t6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9xEID2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixaq1pVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a9xEID2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ixaq1pVa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCI13066900
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbi0FbKM+Eh6oZscD4lAY4TeaBYjCKyAMiEW984jyCA=; b=a9xEID2XwKb3C+9R
	T8Jr/6PAahMGh/AxJFwKWQ6MJcbYsB+uepo0YpSPF4esB39q4hhHerXmMFnzqVDy
	RNPQNQrtHnctKIWPk39uLIwH5G74L3db2u4n5djKsB7iwWQTzJowxztCwo18BV+l
	IkogB4R2pKOyjNUpQac1Nio7keTW9q2ggwBTH5dNc9uMh/Hpuyv7m2RTve9TVn8L
	OlEpqOflEzbX2Jh27q+cm67eZ9OY5TBfaeSoUB0bdP5wNGD+kRURSQps1q6cr2J6
	Ye9uGnt7EYFSp8LVRn9vnhncAU8wXjbLUNrD6qZXE65k79I4y80Cc+Wr5bJi9IAK
	d6vPjw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jph0an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 05:43:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so4330988a91.0
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 22:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787550227; x=1788155027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbi0FbKM+Eh6oZscD4lAY4TeaBYjCKyAMiEW984jyCA=;
        b=ixaq1pVaEqNeg9EWsiZVPwebqgceZRYH8Jwy6/WHbY9k0Aa+ETkLAJX1Z/LEd/KyvQ
         oj73y002ugtsSZsk/cNEij+jCbGTue14lqUQ+M0yX5/7nYrPncv562+FpQiIeuh8XZw3
         tTNGax1vwVXaOZ9fHQL78mcKJVQpMGl0FWjIg0j1tHtvLn7OArUbiLaqFzGlhBPoxO10
         y78Y8vRuEcB44jRa1o61B7j3nZH04AwWToCheSIBTYoa7xqBDQBUqarU0rjEZQa852B8
         f75TlvUypXUOGcST+AQYUiXp6xxRompv0NLadG8s5wdiOAwf+OhR0QLcJ3XpCrwNV0dt
         zazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787550227; x=1788155027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbi0FbKM+Eh6oZscD4lAY4TeaBYjCKyAMiEW984jyCA=;
        b=D4/z2MzivBBQxdI/hZc4fN64SZocJK5HAcwvZWMwd2jhMbxeJgro2rHeiYEwCyWdzS
         A1BCAONvfOIqYwedxAvcTi5bariMytlxH9Qg9OD0Chc8BdyTYWSTXs/kVAaIsqNq73Um
         +15DU348+p2ezdfRPzi+VVIFxXTWqI6d5lOCqGvjmDcyMC21zbGsYcDPF0k7SmTtsz3D
         /tDsd/sIjhhKSocW+6sIVjG1ifBhmpUJ9XS6F2HFyALGIZtCW5vOx94YRdLQ0PC95Ph3
         pwiUiBHXH7rq+d1P4g4A49ZuObcZT4W1AKGw1cdk2lm7YBm405ZTMxlnnPk48YjHIWcO
         Cm+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpsee0B/67fRYQIZU6XRXCUtFxkvvjcm2u/7j3XDLfqy63bOFS9GCv7FFWqgZAWHoeGgKwFUIhTIgWI@vger.kernel.org
X-Gm-Message-State: AFuF++nd+Z11bh6jc4t7QDETSA2Rr3EuDk/IT94QALgsCOVxmGzIxppg
	cqzNB2fM7NWQl2r0qoMoGCOKF3cEJ7/FcuCh0oijiSVGnnnQHR2VuRgMKM37gYoTm6XWgZyOJWF
	P+OlgOo9VUt813WrsaNb6lD0+VQyjtG1rm6yfzK5z4BVRwLYAYE17wwzXWYCNAWqo
X-Gm-Gg: AR+sD11ljcZpc2xgIs5LTLV9YNhTlQm5A8lJSJNEY0yJdQl7R0ZEDJ34F4KlC/E/nhS
	S7eifFumRGitNeIY5Xj1L24ViO4qh/tg9a2ehhYqZHBTydTBv5xURTx2MH12r9JhF2ReJMf3l2q
	l/BXZ2mjVN3gMtWngf/lMc5eJtXAIzTl8tN3wYI7JDPnCw7x9mSD2/AAI6DaPIiLkelrUOTD/C7
	jfqNV43uYXLKEZenrgbv/62AtGIzhNsZOnnzL/QkPwb3ALWLI3ZFBNahRAFmvSspadii2+1V1wh
	hGI1M426KwzcppPXSlv/VQULdUjXlmBh4us3GHTecbncoKHHjj6CUlxqGErZhKa21a3J1i3VqBs
	YjSlCf1ehoHiOVH9feWHqfgmpn7SGUdu8rjgbMPfzqCzYJ/H/EnwiK/dnrVUOACbaEYZuaDrnzf
	/0JhwuhF3J6NL4C9gI+QOp
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr39216363a91.2.1787550226486;
        Sun, 23 Aug 2026 22:43:46 -0700 (PDT)
X-Received: by 2002:a17:90b:5207:b0:38e:c1ba:4f94 with SMTP id 98e67ed59e1d1-395a044f253mr39216286a91.2.1787550225974;
        Sun, 23 Aug 2026 22:43:45 -0700 (PDT)
Received: from [10.79.116.118] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a20e77sm8766395a91.15.2026.08.23.22.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:43:45 -0700 (PDT)
Message-ID: <306b2102-a7bf-4c29-b67c-df6ba5fbb7ee@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:12:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
 <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
Content-Language: en-US
From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
In-Reply-To: <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0OSBTYWx0ZWRfX3i9l9mwp2JVF
 DSWY+n+DiUdyPGXhJWyYYUN5Li2avbtmimWd6HZCgqRa5QltsK5JVrHkGWYMkOREwipf4tsBIk+
 zRX1mjraz8kMqInz2a9b+zK06iicBzsyAMaMbBVGemZPW5Yp8UtnrKkev1ySiZshvB9svzmAUan
 5QqNbuZmnq5qP2NkijlEp6BScLC2rPqS9c2dOzoaMy8MNAGOWeT3KRMJ8jfSYRuMuNdLMuAefAG
 ain5lsf35il9O/oaM3WpA2GmUi7ii+itX6/K7neJYqftqdqmKp4ZpTjlvKgdHqajGpr4Sa+wR0R
 H/7UKYibNrIup80rpDhVT+Cnw4ZBJEhXsqznD15932uT0ttmO8pFoXRL5TVT1SqfHRkSopiWUUT
 vbvmtn5SBZdfcq0HODvLk/tNkRsOOvEUlt2MrDDx/QmkA/fStZLF1ARLKeEHDfZt7QkQgd6Y9np
 Pxd+NpXCjbXL0v3vdNQ==
X-Proofpoint-GUID: oanHuUOId-P8ZLSJfR4fiAPpogzIG8gp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0OSBTYWx0ZWRfXy1WwY/EzgFwV
 WnolOgwizS+xNNk1G9589DO4Khqn5iqCrtV+S6gHqpNIbH/EYJ5g4d3/fse7y4n3B/0fnVWSfPj
 yaS8xkNHelHIaw54zZ8QarSvp2iazJk=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bda14 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F55jpGqvRUC9acNfLbcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: oanHuUOId-P8ZLSJfR4fiAPpogzIG8gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240049



On 8/21/2026 4:04 PM, Pankaj Patil wrote:
> On 8/17/2026 3:40 PM, Konrad Dybcio wrote:
>> On 8/14/26 8:30 AM, Pankaj Patil wrote:
>>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>>> The suggestion of having the CX power domain tied up to the GCC
>>>> controller started here:
>>>>
>>>> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
>>>>
>>>> and then, for Glymur, it has been brought up here as well:
>>>>
>>>> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
>>>>
>>>> These plus a discussion off-list led to this patchset being done.
>>>>
>>>
>>> This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
>>> Reproducible on latest tag next-20260813 as well
>>
>> Yes and the ""fix"" is to disable the GPU nodes because the custom
>> runtime pm dance done in the gxclkctl driver keeps a vote online
>>
>> That should be fixed instead
>>
>> FWIW ath12k is causing some issues for me in this regard too..
>>
>> Konrad
> 
> There's no need to disable gpu nodes for cx collapse on s2idle, I can reach cx
> collapse after disabling crypto, camcc and evacc nodes along with reverting
> this series, Specifically arm64: dts: qcom: glymur: Add CX power domain to GCC
> Can you share the steps to reproduce? Are you running additional steps before
> triggering suspend?

GCC clock driver on Glymur has gcc_disp_hf_axi_clk marked as
CLK_IS_CRITICAL, doesn't that mean we will always have a vote on CX
with this patch?

Taniya, do you have any insights into why this clock is critical to be
left ON always?

> 
> 

