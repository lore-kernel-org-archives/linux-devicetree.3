Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3927313558
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439636; cv=none; b=a2vsWNWdIEyP4JX7iewKF8eZLU9Jrprc0UFIrGCZWEc1y7FmdC0MLczxABms7035BGWOdHsIMPdF5gJiS/lDqqe6pDSFh/43/vlNywlNbHYZ3jJ3O6BUDv53DVx3z57F80WwgEhdJ7SlfM7LnQBmGn3SvupeU2GKkiLMydW/v1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439636; c=relaxed/simple;
	bh=8xUoq/FcQMwK95XsLEn5fWvjT6G37wtVq/UJvhQw2aE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iPIhWUNdQAxpEE8a8YxKo4NwTMeD9oEwuB5jq3QAmqijgnJnBNUBJAmSNL8O3NL81JGdlq+x38DqttmGlZy4pfAs8FUalieAbGHrz2BfXprGHd6C+mnkYfLr4KL/00vLASoA3bNHSNw9sCp8u//i9w+ifVPDiKsZdqmMLAi3x10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSv0OfTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7I1ge1i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSv0OfTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7I1ge1i"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8tbTQ1971771
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nGgbgd9dtTM4zTNUJr6OpLpNRnt6f6nmr9bUgf0LEuw=; b=oSv0OfTzab2KnkrI
	CDH9iorgZionOmjok19ij0EUUe7WR70gJNlEHE0ZLpHgRmGxNloBb9KaP6m7Wv7p
	mSdCKTMl5Ugo7VvtIVYBokiuvr6UUffjSKLBdLITsWZ+nzVjBRcaM0pOcPVJf9Qn
	3cu0nPFvjYeOc2FKWmJNL9dCqdPKneZSnqEPY3MsrR7IwnylKJwal8DpB47R+scH
	m8Ou5QrnUM/bsdOJonfyhcAsjN81hp7D7a5DTd/ZCSnzhK/4Ff//aeos5pwRPaZI
	0l6hsj8O3x/4aw7Il+ogAdESllfc5ljMWq2dIsyFPPukw5T493xVlSDro36zK+iZ
	GjbD8A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhsh9ctb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:27:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da97f6a6dso840712a91.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439633; x=1777044433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nGgbgd9dtTM4zTNUJr6OpLpNRnt6f6nmr9bUgf0LEuw=;
        b=J7I1ge1i3gThtc/q2pZgpm5igO+ZJGsmtQMVubtC9tPlrLbGQZ+R7nqN0/4alAtd2u
         Z1VMNQfYjpNQzYljToflLzwErjBNX9oF7oVi85yVgt9CyFGMzPjSqTRr30QX9wnpZ1QO
         Yxk5QB4Wsh+VRJ1U6wKHJGhfMnkdUFgOX/W8WhKCgBPGqWpOy0DiC1v2X230fzzB4yt6
         SR4IR9R09+Zxd4EowvJBiGXIORxZyV4UcI96kcWu8Z21TrxhWdT+o4ONLAV4Uyul8QY9
         Ius67F7G0tngl5UKU2q4WSXMYzXR2BQztCnSx9MRSYJIdc3a14KQeTICsju1ZyaE0Fti
         865g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439633; x=1777044433;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGgbgd9dtTM4zTNUJr6OpLpNRnt6f6nmr9bUgf0LEuw=;
        b=SLf3/0LbfnE0ML13km//ZqbqlyGq2kuX+5NbUqd+6LyvAuy8CBvJ71c2K5L3OlcJrf
         xwfYocBDywQywU+XWbqXWuLK0+1auLv/Upi/GpN7W5oXEvGKSVKkHClUcVi51FOlw/2n
         oSRwvWCyj3lgowsJf8ciMcp6vpPzGrDE8PeE/QF0uKq/cbGvL3PFUkyDJcPixGJPesz6
         xPLDW0JP9uoCqR3Wb3kNp87UuQa6p0CyGlTtnqmauUUfU75j1+P6BiI0w55YLacVTHwb
         /ND6ITdqmq2ruqEN/L8CZ2AldyFlTmXp4yA09R5eFoLy9gIJW/iBEXuIoBnVv5IZdfZA
         JG7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8kJCrXj/DozpNi4/w7Omf5bNqEmcTZXY88sswblrtwD/w+W0uvBI/Z754RPYsoJXcn4mXExBPLX01G@vger.kernel.org
X-Gm-Message-State: AOJu0YxvUGB6PS3zUG93COxIFDjzuxOKQuKtwinndmSMysYKdCEDuIqq
	42R+Xtp3TGUwnD0YaUZ8L/v8c2ESlPLdDLBnQfMnA7aBVmty5pATBjoT25qUo93vZaCXqxsfB8z
	U8jFbiLVrDaCjkX2tA4h+5a2JWtNdtnsvOr10q6wVxOOHQxaxNhDXJ3oFN39AOA1r
X-Gm-Gg: AeBDiev4qWabL42l1jor76IU9Lb9AokRL6AKLLZbRBKyczzY93j+trvP+ZaQ79m3dhS
	BPRIHNTWYzcc5c9c+sWmzgyNQI/a/uR9qKZB6WZc8/ey3Nm7J/W4pW79BL/cOwjgScr/rl/eMWM
	etelp7HIzzQ+JMNgrMfuC1qBqTWf69e06UWQP3CWojC/gw0r17NdtwY84G1r5IJTjAEnX9PbNvV
	i1NdkeouVPPoEjW0IF/sOYd4QtctGQ4vo0MDMIMmK+ToEozkvZsAnQ5oJxRvGwms8RgGZhkXX2G
	g5m+6Tgfv0HiVxex9EJc6URIkYgKQshTRhQW6cf0+jm2ABqUPQH38S4DJQSoN5OEEqYHet51I+E
	VFv00WE25tAJrEBPsfG6B+fjoTI9hp8/cUj9Jn+NBYU3u5OGtumAq02MM4gFv3KY7
X-Received: by 2002:a17:90a:d0f:b0:361:45df:114 with SMTP id 98e67ed59e1d1-36145df0462mr906258a91.19.1776439633287;
        Fri, 17 Apr 2026 08:27:13 -0700 (PDT)
X-Received: by 2002:a17:90a:d0f:b0:361:45df:114 with SMTP id 98e67ed59e1d1-36145df0462mr906229a91.19.1776439632683;
        Fri, 17 Apr 2026 08:27:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140fc575bsm2478649a91.4.2026.04.17.08.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:27:12 -0700 (PDT)
Message-ID: <987f1ac3-1725-11d6-d257-9bc7192b2fb4@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:57:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
 <809e2ad6-258c-49ac-9f3b-4ced32807203@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <809e2ad6-258c-49ac-9f3b-4ced32807203@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d6/FDxjE c=1 sm=1 tr=0 ts=69e25152 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=0AyAw_TJNaHdl9VPQ8YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: NHYeXcQkLzMtUlP-H6-CRPZKcV7T_q01
X-Proofpoint-ORIG-GUID: NHYeXcQkLzMtUlP-H6-CRPZKcV7T_q01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NSBTYWx0ZWRfX4j7tq72D+sC6
 p3HsZeuj2EyPT2DT5PGNGnt1gJ6rtJu/KGto5+ng7DQrjKqZ8+x0PIFfe0OHUuGoNpPWx6N6ez9
 YnlXGAB8V94BL/2HEMTaBaIaNsVfof5sOb9gg/EjarKhcpLToxZKUvN1j9ameC86p79oXGAJMS1
 FDWEdkDnREIUiODF38dHqduiOu7G9WVOFwfvcc6MLTPOjPqXqD49HvICvWWcSixJaJXwMJxzJPK
 1Ory+qkiRD6r/jYol4CgHg4MzExKUAVpOeM/kA5ZAhpL4+rUlEsS1xBdRq963mm+kjXhm5MUXuS
 MzshblFmbiaX3HnRwPUqAIgcj12/LkJ2I1o4psESbVUtvcJ8lLt+x/6ayeu+cJvpezKPQraRSE6
 R92Eq8P91iMbuxsXJ9zGD4kymiE6HEazk3DZ6TO9b4CrPm/J7Wy4YU+LsPmSBG25ihROOFZdJpY
 xxHM4GHNAt5sdiQykXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170155


On 4/14/2026 7:39 PM, Konrad Dybcio wrote:
> On 4/14/26 7:00 AM, Vishnu Reddy wrote:
>> From: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
>>
>> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
>> or QHEE), which typically handles IOMMU configuration. This includes
>> mapping memory regions and device memory resources for remote processors
>> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
>> later removed during teardown. Additionally, SHM bridge setup is required
>> to enable memory protection for both remoteproc metadata and its memory
>> regions.
>>
>> When the hypervisor is absent, the operating system must perform these
>> configurations instead.
>>
>> Support for handling IOMMU and SHM setup in the absence of a hypervisor
>> is now in place. Extend the Iris driver to enable this functionality on
>> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
>>
>> Additionally, the Iris driver must map the firmware and its required
>> resources to the firmware SID, which is now specified via iommu-map in
>> the device tree.
>>
>> Co-developed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
> [...]
>
>>   static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>   {
>> +	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;
> Maybe:
>
> struct device *fw_dev = core->dev_fw ?: core->dev;
>
> and preserve *dev to be the main Iris device?

That's better, ack.

Thanks,
Vishnu Reddy.

> Konrad
