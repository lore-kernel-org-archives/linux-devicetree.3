Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F47A3ADBA5
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786988607; cv=none; b=gMrsF2K9GeHaMuGN6rY9KFAwXKkaxuSpbegwndhsLkMvDBDXYeYxhzi7EUm6nfZoFkAoIQDIeSoPAKl5ymTAj9sZLundyVYEw0P8sSBfhebXI4I5Rctgdx7yPSy6bTs82axf/nxkx/wZjhmflgU+WQ8JIZLhAbWsB1NwOqROuAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786988607; c=relaxed/simple;
	bh=q8htZKQfqDE/H65M5Dr/6N9CbKrggkq/UqTDMoakUJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rN9LBF5Aem6sjN9ORTZkjGM19ms8DHUxy0NfCe8xgis180m5nbJsPC8ak9WXU8obqs81H30LZweitSSb+jTG4/yy75nhoeRaFc3PdV1kfFZvNZ0Vt0bKoGXfv1xkrOyP6b++USCclyhVP2ZsnfhgRA86Xoxkjv1+gojb2SCh9fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZ95tZ/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BpBEW5OI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZ95tZ/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BpBEW5OI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYseZ1840275
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 17:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9M91F8ik4b4OsC2PAZnpCBSh900aFVtQaA3816ZPpU=; b=UZ95tZ/ntjpGX/em
	gcGL/NLYCHXrA+EqH3PEkeALdKf/a2d+yU8T4Cx1eIFcDwViWdnQWtjBaOKX/v3m
	s4eqg90J5TYaQ2JC7G3knMfStJGFTPSvP4byCgJF69JRVrESPiGygCM0FWHFHPO+
	STIGk/HM58HfvMVejrnXQUAcKHgbRGWwQYFVoCXJmmmYqlENlOoNgy2DmV0n/HNp
	YzCpyXur/ZP+jhzJJA/hlU5GHmqrb5/VLpHR7iErFXIOU+4VEt/PSxgA5LlB5M2q
	hS/197+UqlPQa0vgy7G0f5u9Y0LfwWkZ9ONFi/X2+XxaGQLcDslaamw7N8zB47Kg
	zm2dpg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30jchf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 17:43:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dff6253so1181155ad.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786988605; x=1787593405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9M91F8ik4b4OsC2PAZnpCBSh900aFVtQaA3816ZPpU=;
        b=BpBEW5OI/G3mUqKCW2qX3sVNZ5uLg0obDwlqfyjpo0isN44c/YjmRzKX/kXVVXHcVv
         Szbur7FqQjP1bM32C2vv4ipCir1oUYNV8gkuX0X/4UfqRizONTUbMIs1MCvOUwmmCPBN
         T778/m/xaCqmUz4+GXi5beM6p2bDXEdsGkyN4ob7aXFlt8MxNDi4ig9Zp6tCvDEte7zM
         AeFzbxdP1PmIDSURjk9Hct8ODgPVl7PFGo/mURnwxCH4qexe+FqjfaNLkllTsRWQkRDc
         31GcGvB1y/jpTP32u8qBRtUg8o6KGT2pKVfEeuXZvJsooA0wFu9abMauZTgIYV6yborc
         M32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786988605; x=1787593405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9M91F8ik4b4OsC2PAZnpCBSh900aFVtQaA3816ZPpU=;
        b=X3ZRlXqrgLkU2PtrtiUJELb5LjgisH7q9fWp6IowMIotpGCQMDKn1kHydiJ6eXN1KO
         UR46DrG39lukZmPpHC4xkWmIvMpy+m4x7XbsXqG0Muagiy+6vKuLpCveGBGswRQD7d1S
         xN1yjnXi403tp8MhShgW9UQ1FQ8kt2I/A9RJK3/XAxnyV5B9818IWRWbBUHA/vw6val8
         KIB440MEvIYNLstKBxCPcLyljW06bw/+srnDX7A0Hjn5oyIOwExssk8vOgYGwbyggvoP
         6qzvaLOnb9VfhfGoUau4HUUZiHzXlGVqZ5KClJzWrXs8vBXU90Iz3wECXL8wyUOUDeoz
         rXZA==
X-Forwarded-Encrypted: i=1; AHgh+RrC3tuh/vU9sZL5S69BQZrdJyEm1ttdelCxuaFqMAyrwTOIHuZg7DnRBMOKBZAPheeyhXmPcdJQpert@vger.kernel.org
X-Gm-Message-State: AOJu0Yymdiw4gsKtkeMuzw7+6yyvtNx1IY7QnuA0NXfYBL8CrYgs43mU
	rllo0cqZnJ84cbXrV9lGHy80s3jZsrnRLuWHAuhjoPmKNw3Ygv79iU7rVc9uwlReNBU5upHKXAq
	kA5UFmiNeC70O6kS5kKhQHAi5xIH3zUb/9zGUTAo3Z8FcO+FFYDDCphwm4dq2f0GB
X-Gm-Gg: AR+sD11apym2BkenvMgtlLIvARRPBc5fViFSwIH5HCh0LfK8V++NI6ueTbiepf5wS5V
	Ec7DHiPr2Rs1RdrbPegUIKKsixKgd+lvYpQI210X3Mc2BCmoiP4Et7JPEMY44oLtMCll/bS6guS
	8FZTe2EVgGZCJ1FVkxSEHGN0pZJ8Eq32Vk72w4Tshf0cXqFvkUHMR3jK6PBV3oufsKSboPoX87K
	AK247IWjbVFbF0gyyU7CAfMsBLsWeKeghzdAB2ia4moR0wcVSDyEJCxIJ4oL0lIZLNhi51QLlti
	0MFsPoe3FUkeqWWuaUFSCUHF+wg+BrYCTbiE/403ACLcfNkBHQ/0FHk8eH1d3zUfP/SguUPPWz0
	9SWpLZTn/8WIi29Ep9dT+rkN7mlv1xqqVjw==
X-Received: by 2002:a17:902:d490:b0:2c9:97a7:3283 with SMTP id d9443c01a7336-2d5cad94334mr4231835ad.23.1786988605113;
        Mon, 17 Aug 2026 10:43:25 -0700 (PDT)
X-Received: by 2002:a17:902:d490:b0:2c9:97a7:3283 with SMTP id d9443c01a7336-2d5cad94334mr4231465ad.23.1786988604481;
        Mon, 17 Aug 2026 10:43:24 -0700 (PDT)
Received: from [192.168.1.11] ([122.179.38.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ef0147sm6510425ad.77.2026.08.17.10.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 10:43:23 -0700 (PDT)
Message-ID: <e9da1e84-a7a5-44ba-b392-ce098f781dfa@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 23:13:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: Add memory-region for audio
 PD
To: Chris Obbard <chris.obbard@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260807-agatti-audio-v2-1-3959b1ab8059@oss.qualcomm.com>
 <CAPnEM6b49hbfaXKd1y+JmF2FXSv8CAxau4JuUmJRZbX0YTpdpA@mail.gmail.com>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <CAPnEM6b49hbfaXKd1y+JmF2FXSv8CAxau4JuUmJRZbX0YTpdpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEzNiBTYWx0ZWRfX6qrEif+BszG6
 QKTiuc5h2Rg751DGHduujLgLYy1KUck+rVoDqKSsa5UjmeJOBoePDf93wRaf5QfzNQMstmkeCeN
 LzxVDySSx9atcXADzFOKnHRtHX48Lt2yKDIF5BPX+qlhu5OugejUAuuJkbAIXVHm+9/kqfomLjK
 1xgkKDDaKyatLEJ4v9eBAQJsaihzUYmiM2OmJ/JYqaglXY2cSqtZY7/Ex7lH11dRkOjla7lh6Q8
 15Ma4Q9TCbDqXTWbXWhequmD6ryTTodfynz/50VdCF0VXx/rKBKRO5E80qIsGinYRZJzubSLKT/
 DJw980aWSeacKhCh+ELTsVo9AzkzSgFmjlvQ0vshLkMDaO9oC5vTuOO1v1iYKZM+b+qPTamdeqY
 y7J8M83HF7Xr1GmIkNKEJ4YL/QyB+tBkMsP1ViFGr9AIKgjE7JRz5Oe+aFasQ+5AUJ3/HcnKZD/
 S9HsMVEl+dSCaI0moGQ==
X-Proofpoint-GUID: 5VRwMMoE6oNQt4VWfGR9Vw2M5JfDvsFi
X-Proofpoint-ORIG-GUID: 5VRwMMoE6oNQt4VWfGR9Vw2M5JfDvsFi
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a83483d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=TVPr0HEZzowgGefiBlzExg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=lVFznFW_EhjhjjrtoAIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEzNiBTYWx0ZWRfX1MCXOnt2/r5M
 PcKF4cNUtAAkBzWOei/apvtkR6rHMDy/77EdT2Xkk0h3j7whHVb4sM0i3/Ceuu8jXJNRD1a5fOv
 jgze/BpinL5BwknH59uQe+1ga2zefgc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170136



On 8/15/2026 2:56 AM, Chris Obbard wrote:
> Hi Vinayak,
> 
> On Fri, Aug 7, 2026 at 6:51 AM Vinayak Katoch
> <vinayak.katoch@oss.qualcomm.com> wrote:
>>
>> Reserve memory region for audio PD dynamic loading and remote heap
>> requirements. Add the required VMID list for memory ownership
>> transfers.
>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Fixed VMID list alignment.
>> - Link to v1: https://lore.kernel.org/r/20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com
>> ---
>>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
> 
> Thanks for the patch!
> 
> This fixes a boot loop on Qualcomm QRB2210 RB1 and Arduino UNO Q, I
> wonder if we could add a suitable Fixes tag ?
> 
> Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
>

Thanks for testing!

This patch is a feature addition rather than a bug fix, so a Fixes tag
would not be appropriate here.

The boot loop on QRB2210 RB1 and Arduino UNO Q was caused by the
userspace audiopd service file, not a kernel regression. That issue has
already been addressed in the userspace FastRPC repository:
https://github.com/qualcomm/fastrpc/commit/cd0c0dbbfef8ae950f9ebb4483a9b0192d8fb6a6


>> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
>> index 590bd2432d85..2064eed01327 100644
>> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
>> @@ -381,6 +381,14 @@ rmtfs_mem: memory@89b01000 {
>>                         qcom,client-id = <1>;
>>                         qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
>>                 };
>> +
>> +               adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>> +                       compatible = "shared-dma-pool";
>> +                       alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
>> +                       reusable;
>> +                       alignment = <0x0 0x400000>;
>> +                       size = <0x0 0x800000>;
>> +               };
>>         };
>>
>>         smp2p-adsp {
>> @@ -2348,6 +2356,9 @@ fastrpc {
>>                                         compatible = "qcom,fastrpc";
>>                                         qcom,glink-channels = "fastrpcglink-apps-dsp";
>>                                         label = "adsp";
>> +                                       memory-region = <&adsp_rpc_remote_heap_mem>;
>> +                                       qcom,vmids = <QCOM_SCM_VMID_LPASS
>> +                                                     QCOM_SCM_VMID_ADSP_HEAP>;
>>
>>                                         qcom,non-secure-domain;
>>
>>
>> ---
>> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
>> change-id: 20260806-agatti-audio-357bcd74ae9c
>>
>> Best regards,
>> --
>> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>>
>>

