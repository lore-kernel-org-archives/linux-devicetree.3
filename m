Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABA423B638
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929436; cv=none; b=NClxQ0KLca+0OeysHFJ9no39L0yFnK9rSzOrGFTQI8dGGzaKhWDatQKxgJulvkorz9l3teFoWDrP2nJyHXxbLweHqOfFwXSI1RGBEqNYj+3qxb5Ul5pmAZkPO+ixB1Wx/bOTtmFvZABylRtbA7alvIYSYM8wCoftEgJ3iBTQQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929436; c=relaxed/simple;
	bh=GhxPscyjTdRqvnuHsPORS2ylxlI4B7zrF6GCR8tfbkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeE3U0YbZ+oDHoeyJ1aG1XSrq2WzzcCdPCN/2E8SU/g/sQ075TFAN4r+F7x5Na4un8PqDjU8ktNCtfa3cmvBh6aOPUfvqmdSplkWQRXyDgSsqVQ/alkMjj8N/7jG0UkFEbm+R7owQ0mntj+AJMyQhh3xK6z8GZQIoZKBF0dMYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvp+drH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+l5qBOF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvp+drH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+l5qBOF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658EXm423489999
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 14:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=; b=kvp+drH3ktQlQkD5
	z97b6zFqqntjW16AtiJ6RlbqmRsNm2oc9usjfGX/TYZaEdbQ+Gw/k7ooh2n4YgOK
	TfUcrcjE/IRF0xVJrv8Sj3BtU7m2PZjQU88LLht8airbemCq9Dmgg0PF6uojBTg7
	JNfIGUSndCF6U+cRcHUJj2SPKkmG08vT6TGTNixBz9KDn3VyjPCDo/DehY12l+E8
	Q+on8JjHKEXqp3jgsezBzXIicBCmSYWlU0YxBM0EgfTehFcapN0lX6PujEI31n2Z
	jtH+Q4+YMZtfQDbxt+ApCFsvzjy5xzFh3EBtbiaCdgF3oUUUuc730yquXHZrJssw
	h5gODg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun416k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:37:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-842278a630dso5776337b3a.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780929434; x=1781534234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=;
        b=L+l5qBOFP8ZcpOVKEUWqyI4YGTLLzfmC6ihI4i/cV+NKWhGIo8Nr+cA/c4W8b8OfPe
         k4cPsi0gqWVJKRebTIczE21iJ9sM4+2g+IErZ+Wslg+yAGy/Kp0RftrWzowyjeRdfnln
         joM96Dd4GuNQnwklmE1YU/gnO5cyacvLgU8A8QpI2ARjV17XS1M748CczSirefmJkCEx
         WIprhiNjhWY6VBbt29ZnQNEctgBJqAApW5qqHMqMpY/kjOPfNOQWVfWQkIcTWe85/ipY
         nsGUouUoe2jxgUAPVsBSrD8frbJDx2hwDobaG0GFUGjGqqPZXMR2nfR19ecUxWvlEXCw
         lhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929434; x=1781534234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phyB/f/MmGVDBTTZHnGaVeW2BAL985CqIC01PeAdgi8=;
        b=WAFXscLEa/0DJ0iYKlSJgsJcWRQuIYRWUgqKniTMoCP5X1qiVBrxz9F/nOgq3+8pMZ
         TSF73CfmPoH4dmRPr2jbbfeqhOcNxL8pR+mAdPK2TnxfcOQAndjJQollQuas4HD3sqkK
         59+2kyEBUWtKb6fxrZuvdzEP9f+1D67wBvdS3ZsxKzoU98e2HAz7GuITP+enAM0sunvF
         8DUdR9nclHaIgRffqv59nSscr/R3WflIwid8vVnXksRpDAcwd8jRryyALNPBiEZqm/jb
         KoWbKnUs5vwL2uyCRkhjxBJ36mZ+oz4AA1NnfloyrH5OwGQpLxS6XiAXXZhXi4Ky7nv6
         RjKQ==
X-Forwarded-Encrypted: i=1; AFNElJ97suwBu8Jq5epe/LfW3OWw4sRCNjEXX+FHHG2MIHD0NBNNJX9ipkjpcTUDNjamICsNh4+bUK94r5KE@vger.kernel.org
X-Gm-Message-State: AOJu0YwXGlMkHsA5HxWHDlxWntk/ld3Sy8/LD328XHqPr0jhelwTQ0aF
	bvGSU6nMxfT26RbBJqKWtgZWe0YR9Bd1g5AhW2C/E2LET3gaSM5bZhHTYnEmK8ylGjiJwziAddS
	rg05NLTEv/V2UwAdesnL23jlHxWUXns9Zx88oSU5IRXs1ex2rjYNheCmN9w+caeNV
X-Gm-Gg: Acq92OFArwRtWMwZW8DyvQVIvC05IdW/eyjPGa6XTsN5BHzho9nmiqwCiZb4yPmxlKG
	4BsZVCMZlcxTlU17CTqd44xaBhY+enex4Ew3DgF27vqj4llzkmr0CnAzv2ZWztbeCJzJz/2AG/y
	LPjvb0SJuLMCV7ZT6I6y5tL+C/yy19jX/ofU+9No2bbg463X4rRfEolVYvVzexGtPtwGmycNZKZ
	bg7ODYl9dfM2XJ98slD5u4ZCtVynYeK+2mIbhcoe3g3VEz++gMFgy2gL1wvinzGNgksPv9eEAan
	Yy5154efMuGsrRiaOgLKdm6s4XiLXYC+C4GZnHTSNc0dvoKzFVOmUBYL5uFTOxBNUOmS7S1qvGH
	XZLrnqPgsyl4+ep4RkWKZIP+BbyZL1mFT3oZdlR8cTBEjCB+Ke+w9hKIfgFfD
X-Received: by 2002:a05:6a00:4c0a:b0:842:708f:39a6 with SMTP id d2e1a72fcca58-842b0e1e208mr15671456b3a.10.1780929433668;
        Mon, 08 Jun 2026 07:37:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0a:b0:842:708f:39a6 with SMTP id d2e1a72fcca58-842b0e1e208mr15671413b3a.10.1780929433126;
        Mon, 08 Jun 2026 07:37:13 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221470sm19692216b3a.6.2026.06.08.07.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:37:12 -0700 (PDT)
Message-ID: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 20:07:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzOCBTYWx0ZWRfX6oHDDao/4dx5
 KnPNXSMZYocjU3/cNS7LJZuCM2C+iOe9F14K1sqTUiD2PckkzqzZcvrxH15YtlgFTl9u9ythVp9
 v5U86oOs9X1i1RlenUhnd9sbibVRhY3RokAjG+fIL9Ht8CBWKb7B0WCUk2Uh6ktQ6gfrz2zrvOK
 gEm02dI2Ryedu+7ZZDIt+fv6YXCNn/B4d4CmVQO6MPyLZBWyxNDS5p1zD9EJ3Rzy9XEyTXy87pP
 jle1GkkKpVxH0Gr6dowqYIx1tRCVjmdxkD35QCJuO/jiQrwOOgNc2CFHXyom+DmJPvXQUT41FJm
 uJhERBTAlRgnqfGyhyjO6bFtbbI5+lyOIRAaZv4bTb5kq6dwKCsEE/uC7yLCUbA2WiMWn67BDcp
 MVYs4NRHHKQNIOazzDV+3l+eBhbqNE3rSNL6IswHAkieDWKhXS+7MfEGCWJQd0YUfKSex2RdoNu
 eIl3ktuqyH37gBthDIA==
X-Proofpoint-ORIG-GUID: 7R1SjSG342qRl4mlcUETmsBHqUdQatbC
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26d39a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5xEeDdGLKqE-Cjx_tAgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 7R1SjSG342qRl4mlcUETmsBHqUdQatbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080138



On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>> are accessible. Without this vote, the SMMU may become unreachable,
>> leading to intermittent probe failures and runtime issues.
>>
>> Add the required interconnect to ensure reliable register access.
> 
> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
> be voting on other interconnects too? I guess so, because currently I
> see that TBUs vote for various interconnects. BTW: should apps_smmu also
> vote on the power domains?
> 

This race mainly occurs in GPU SMMU, where the GDSC can have an
independent vote on the Adreno SMMU. However, the GEM_NOC vote may
already have been removed by the GPU (or any consumer of adreno_smmu,
e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
errors.

Mostly this race reported in suspend/resume cycle (when gpu/gmu devices 
moves to slumber/suspend state before adreno_smmu powers down
and the later doesn't have explicit interconnect voting).

In the case of APPS SMMU, such a race is not expected for any known
use case. APPS SMMU is part of a shared infrastructure block, and its
power is typically kept enabled as long as attached master devices are
active. Therefore, explicit power-domain voting from APPS SMMU may not
be required.

Thanks,
Bibek


>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>   
>>   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>   			dma-coherent;
>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>   		};
>>   
>>   		gfx_0_tbu: tbu@3dd9000 {
>>
>> -- 
>> 2.34.1
>>
> 

