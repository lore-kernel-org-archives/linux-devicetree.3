Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ABE3E4C6E
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935978; cv=none; b=k0J8zoZc+fDPrCu1S8k2dpWqqPcHwyzUAZqn5GEhatncs78+YLc2UkZgNYl+MKMWBWPGE08nMSaLDXmFmHFbsPFepHTf2qZazdKwkznqHZ1nGMc+OLo2Orpp3ihQkSw1mKhHMTgjsdpE4cAQNlqATcpgNNbvEqcEDxJQ8uU4dS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935978; c=relaxed/simple;
	bh=3/bqvRZ8gHm78dMBJuuMnLOpRfzMQhb4Upi3jL7tjzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qq9lWcb2FG98gDIjRb5fBBTnMW5YGdXdirsGwtDuTZB1mftXxjnOWvANPgvHYdX0TJ+NKjGw10vYvoTV9xYM+D6Onj2TBae0qJmqxNOhX8puN1gCkKMsgjX4jy7HvF+p19rWIUvrUn+QP8w7imQW3JoBwfAqY+xZ3dycrsMkddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0Z3idkG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkQhyTj8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g0Z3idkG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkQhyTj8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8twps028926
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byqeoFNsRlujly7/5qPZhFJ72dvLN+O5/4E4qLu/5+w=; b=g0Z3idkGEercl/jh
	Mp3ubY0VeWCQHAKorCBt1kBMMkN7obmd2EcioPDTvDKQs2FZ295fOjvm9994WHto
	ubmzx4xsLuB6kaqC6Ov5EO6qT6mdhBjLFyqrshdUPYJPKUEKwdoIGpVVDom8OnHS
	ByDca94SQ5hqeI3zGAccjwyYFxGo6cNOeKp2Vukqg4FYU2GZ3igjEhhQZzv3vkHl
	39nSMrwIdb1F/XSJcprJf/v9nkGUpg2nfwZo74A990fte0RS4Maz7Ca970Y4dsAL
	wlEsJslKrE+jb2KzcRLJYonKaNI/Gn8noCDlTM6fQkg16pn9WrnR3yr+LDFk/5X6
	FeO+rw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm0rkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:19:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so7398183a91.1
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776935974; x=1777540774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=byqeoFNsRlujly7/5qPZhFJ72dvLN+O5/4E4qLu/5+w=;
        b=WkQhyTj8ILE+qzCjWr7a/5dZ/a5KVIFIm8Hcr1Cd5++U3r1Po1JDhQuGpArZVLRsvk
         ngcTnpPusl1QYOv8agdl+FA90l2cmVWSqsP204cyJsg3vemxtmOQU3wGjQB62eu/Pgkm
         boR5xPfIxkDEMPa9dskJjyLwN1MOiCq1pqgrhwcR9R9U0pD0gqfUGfV0I0kXPnDHGC28
         Z1Rub3INkNl9JBLspZBHsyurXL0phuciyefuffNkEYm+LdwwClkV/1dNOw22h3TcUISJ
         oWjRYw3u/tilQLga22z2+1TqsJhQIzYUm2JoCThGHkYJ/EbFwJhREEht0fmXRGkA8W+0
         UE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935974; x=1777540774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byqeoFNsRlujly7/5qPZhFJ72dvLN+O5/4E4qLu/5+w=;
        b=dSswH7Ia0tzYu+KyQNt+Zc0y4OUFiOPK7Eho6QtZDUtwvnxZn///q5FS60LF0GPDQs
         iVXuUVwtmTTvqqcwixfjFExdKLFWrFoe2OujccwcjC9imV1tD4y9Fm861HRq58cGQJ8C
         SkgpWllA9ss61lyYS5F/OXc4gdbBD9YF/R/KI6bNYMcGPe60UcljJxFxmtAojzAekr5s
         qOG5gK7E0/cVbN8Y4g1OTCIpRr1lm2k6JMiqnvirA2agGN7wjx28l+Tea6DzSW1SPYln
         /ZPv5Idz/a9uzQRFMlu3qEDQJmH6aphX4Wr8s/zyantACTrVKVXOTYSGvp3a+2tIobiE
         mtdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+WzRv3cn/yqb6xg1KYuOK/IwkBNTqVyHEjBWmeJ0ZtSfRD6qY2JEnn35v8UBPq45dvfqwuAGTpTTU@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDjQMoA8/w7LfbngwEFZhn8EPrH/znhR7iQogfmGJUXm+naeI
	4xbQU+eNInvxVKMaVIEYVv+cP7QZU4bMB1bQYesR3GxnSB3rX7yoAAgEwDIPleIbdtxeBb/zQVQ
	EYcQRz5ds/hJapRo09WNBZ97Nu5YZX2YORzxG/cRyNPfbjODp2hWjxeO/9ZjV3/1p
X-Gm-Gg: AeBDiesJ9jS7g7nzwIMjps4J4hljtOB2U30LnTNu/hMyMkcKFjUjbg/f9TGjqcZoz9j
	b7scdX/YDZoHpsuzZXaHD4aKkQ28JlyRh5OUKDcPY2pbLiTQDeOLDH5AQ5LaCEWtP4JhMlLbTh6
	OvPktzY8cGOXcZKv4ntg7lQAInxmr80YmJI7k9ryk5fv90Yzu50GFNyI5TbFZ8Z4u/4q2jnWtzb
	RoZsM2+D9DvC+fGIaMCU0XOO17cp55nMbXQ0rmE/hDFiPJqXzjXbMvg6hoSuz+aPzAVwQ4BGnxc
	3pFNqG0geejdkllO4UjK7g0SqI+uebTZgJF9UaOdKPJ3Bfcjslv0vcDmFYIwJJ1RC8EJmWNnoFC
	1XCjUGPm33sCdXKMI4SlUOsXN2kzkjoMdN5u4S7sshzspHH3oCF287mbgZcOK
X-Received: by 2002:a17:90b:17c5:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-361402fd6bcmr24806266a91.14.1776935974028;
        Thu, 23 Apr 2026 02:19:34 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-361402fd6bcmr24806229a91.14.1776935973530;
        Thu, 23 Apr 2026 02:19:33 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9dfc8sm16450651a12.12.2026.04.23.02.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:19:32 -0700 (PDT)
Message-ID: <49a3cee4-fcdf-4653-bd54-72db73f80bf0@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:49:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP
 remote heap
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jianping Li <jianping.li@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20260423063502.484-1-jianping.li@oss.qualcomm.com>
 <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e3b38ded-a323-48aa-b0c2-a9a3d5d364c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69e9e426 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hjYmQKKNbgHO1xYbCvYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: G-w67RJv7RFxy05sxFVnFvoicQ1VGk_7
X-Proofpoint-ORIG-GUID: G-w67RJv7RFxy05sxFVnFvoicQ1VGk_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5MCBTYWx0ZWRfX+4gd4eAJbGJQ
 63aWXXF05FHagz5fmGArLnHotZ2dcCJdUNghXOzDWNThvmPhvIwhpNVhY8nlD89oZweHxUfITnd
 dyDbvo+B5ZM6m3h0++MiBS47djiz0PNah6iPMQY8U0Ef+G56fws0aH2508gLqMsuxKpSkdvgSGd
 iSdpJDtnRePGiL9wKsFzzwllNyTnwCabvcgWV8dm0VqWvrRr3SMp+cDumjVsKm/XaBBtmuh+c9e
 IluVcbskyDIcwxiZuPPOrPsBD7ZgZDiUSQIxCy6XBfknO66Ts6z8J51RXWwjwdBzCuR8DUznPzH
 YuwlGnKYSP4BfGr6B4McA/5SlZwjLoMP/wswhi3mosxxQl2KM8U/yBkuOoPDyV092wtcsQIJu+w
 SIO3CRZzcvxX8AmAYsAcF/R0xG/i+kNkYdg5gJj03Ku+/N/arYsM/E5f9Fv0iRmihPr+wOD7t1L
 Ngl68RFERDixkzngmvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230090

On 23-04-2026 14:20, Konrad Dybcio wrote:
> On 4/23/26 8:35 AM, Jianping Li wrote:
>> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
>> reserved-memory region overlaps with firmware allocations (UEFI/EFI
>> runtime). The kernel then reports failure to reserve the region and
>> subsequent EFI runtime activity may trigger aborts.
>>
>> The remote heap node was described as a fixed "no-map" region, which
>> turns it into a hard carveout. Replace it with a "shared-dma-pool"
>> reserved memory region with reusable CMA-backed allocation, specifying
>> alignment and size.
>>
>> This avoids hard carveouts and reduces the chance of conflicting with
>> firmware memory maps while keeping an explicit pool for ADSP remote
>> heap usage.
>>
>> Fixes: 90a58ffa9c55 ("arm64: dts: qcom: kodiak: Add memory region for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 988ca5f7c8a0..420219823496 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -191,9 +191,12 @@ rmtfs_mem: rmtfs@9c900000 {
>>  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
>>  		};
>>  
>> -		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
>> -			reg = <0x0 0x9cb80000 0x0 0x800000>;
>> -			no-map;
>> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>> +			compatible = "shared-dma-pool";
>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> 
> Since DRAM starts at 0x8000_0000, is it intended to only allow this
> region to be in the lower 2 gigs?
> 
> (it may very well be for some historical reasons)
yes, this is intentional. ADSP supports 32-bit address.
> 
> Konrad
> 

