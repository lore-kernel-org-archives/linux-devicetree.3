Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25937DAAE
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027294; cv=none; b=JObu8yZa0cF+JkH//8KfrNGvr1fw+F8eaKQmynfR6LPrANiP8Kf9VLHIrY/MpgeWLv6BdBmzG37xDTxPxeUktY564urghIljPvPzuvqNkdCjjlY6zs3hbIchtbLmCwrjpkfRa78RVHqun8GjDtt4XxQGo95gk1ogWBbgthMxRrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027294; c=relaxed/simple;
	bh=bVV6TOSeVditsAadk10Y1Uve5c6razlz9lN1viTKHPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4J+kO6rHpKBrNPcxAPznqJK5A+TCRqkpU1u37BdXhZcl2t8TMihMjYMlUA8su0iwF0wkpCg+TqtrGjWZy3ot7a0A5kbm/9KAvcUM0e/BxjcE0NKMXWma2yItOkAbm4H+ce0fVE2l++kBi0pF9a+M3yjD0SWc7oFDAbqaWAqGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggeB50I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ajJDDfgG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggeB50I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ajJDDfgG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6Sfaw3887612
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PE5OuGY131AHFuPRKju+KWbU+74Cuv2LHoq+g+bCrSk=; b=ggeB50I2f48RhCka
	b0iKdDnpJTJdik4DJPz+9oSS/GMoAH+G8cW9lhqBJYVrgiNkU3Mdpz7lek/Xb4+u
	RL1waEfCbPVlFklxU4U4v1n8Qk8NTAPIl7USfkXlHzLJaO7NO5pSSW08gPyQPWTo
	1dWfUWPh84KJj081AMUr9RvKQjRdCeRqxbGmwZhpb1IiPISR5ssN0ajevFTY/fLl
	6sDRtRGbtRPtdY2tTqahZJYZgd1jHS+AlPERmkGDIzp9rywE+YIt4mjhSb8MkBZV
	JH02/x8dMBqxx39KwyTW+srw9SZopamPLi+mU+f17JsvXaFBUxbsmE2wP9nnQrEE
	0y7a5A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr49wpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:08:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so6349556a12.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784027291; x=1784632091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PE5OuGY131AHFuPRKju+KWbU+74Cuv2LHoq+g+bCrSk=;
        b=ajJDDfgGcka7+BgWuXJ2JpSDTiILc/6D/V9qu808+Nh99XrLF6YK0sY3TuvmMP3ruN
         BewEIAet9x6wZZSohZIsuv4EQttso4SCmFtc4zRBOax+P+dpsqtCz7vBwHZU8s43YGd+
         Y0DnrUvN+d27tuWrYM8SXCjwPYmPSeRcwq7/cLI1um1BPMEwK7UHLWxbc7xsoXxE3792
         aZpSLSyRZF3WzZDDpMGnc7eHmY+AGJeSiErACJD7xeBX8KF7qzIJK6mxM/StdMiDCgkJ
         UTDCDnKk2g5uOXH1vDPZlcsFDSrUZiflWNF2fCBvdHyfuSV0vsB2VWKdKESA9ppacURR
         OFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027291; x=1784632091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PE5OuGY131AHFuPRKju+KWbU+74Cuv2LHoq+g+bCrSk=;
        b=dUz2A9aOsjfVSn+rvXIda9hS5Ou5yLciDWVEMME5laoAutb/W/ZkTFEHqr8JczXxJw
         y5Sazj7BOcHf5KT+wALpB0NZmLHZxeaGNeOnR3nzwbt/jVA1JDXvhva6TRIEq7bhv+DW
         SlCzLmmaXxbblXn+IDa8qBbAnpTLNYpeuYZlvlm6PTiZUcYKMQXTEqiY1Cdyb1vgoNh9
         knnnUVzyiFMPNDM1xQtz7Y4xIc6e6/QFgvvOXVnSAtoGvfWBRBDmfKKB070bEmC75lb9
         kC+V2zErYYhszY+k4fDxYVfoKkV9qP+NKtmvcTlfwcKbuAwZUrI/Utfk9U7qkSNk2FkU
         SnRw==
X-Gm-Message-State: AOJu0Yzhkt+PjOyFzepW9+3qUeel1qHD5LOWcPQXZgnnppCzRddA5euW
	ntXYY1K6R8mrDuf+CWs5Ohl6hbNgJvJIhkzIsJeKXuU52BtqS61YwlIVyA6LVDgt3Mg3yXcKEd3
	PXGKR0b5Al8oiB8XPV6sSf/g61tbY3cx8EnutmWIz0YOxHBBTY9v08SbV3BRTw1Zx
X-Gm-Gg: AfdE7ckl5ZhDfhh4ArlWDH0VRPQFpuZuVLK0IS/WJiF5IthgK3mcaLliyaQSEq4KoUA
	TDkbZXkBQah4lszWAu334qg3V8L8Rxq5GRjkF8EkwoYmG6xOr4HrsxfusF2g95RZxIsXnHQtrgn
	v55hiM5tiVi9+vphUww/mhZ6zWO91iD4exYDiMwxOKP8ozYwJPo+qFLm0YZxAe83Y06nqn5UATB
	HZRT9diKdGQdixIUoFXwZlc2uZNriLFmnSA3MdhMXhJkwYoOxULYI9Mn6AT/bng6XVnggYTNjUA
	wPtviHaLFUY2VwTdAgdiVXdWws8+PONjrZ3i1JTqzBemWFHSsdHumBgtPUPiw4MXGjAQTfFYz+b
	TSLFEemts3gc8rVKtGtbeNu7axZrTkfaFkgbCJ8Zsy1jB
X-Received: by 2002:a05:6a20:939d:b0:3c0:fab7:bee0 with SMTP id adf61e73a8af0-3c110a1dd98mr16819001637.62.1784027291181;
        Tue, 14 Jul 2026 04:08:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:939d:b0:3c0:fab7:bee0 with SMTP id adf61e73a8af0-3c110a1dd98mr16818953637.62.1784027290674;
        Tue, 14 Jul 2026 04:08:10 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ba16d46dfsm14010424c88.7.2026.07.14.04.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:08:10 -0700 (PDT)
Message-ID: <5079dc9b-8c46-4cb5-afcf-787145d24f67@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:38:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/11] arm64: dts: qcom: lemans: Move Iris IOMMUs to
 child nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-9-72bb62cb2dfd@oss.qualcomm.com>
 <20260709144453.DA5E31F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709144453.DA5E31F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OhBB2B09vI7IxJ15GNfMvlm0u2YhXulx
X-Proofpoint-ORIG-GUID: OhBB2B09vI7IxJ15GNfMvlm0u2YhXulx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX0pbFsfW2PdNL
 9BNWIY6GPNenDf/boVerVY8G3DXGAnu4NnBI01fISIDaGIcDodhkcuEtappirwyM3RQkrimcKf/
 wleFCF0BP2Fw22g6ehCuPL+n7Bzugbo6btig5OZh2kC6oHR7WuGgtfp9DTy9OnNX/RYhluhTGac
 nvOx6ICOgvFsE6zrVHAxkOvqoyIvtAMKQZ/eODOJidlMlPzO2Nh4FRzVK0mAJLKcr6NgERAwXjN
 NUr36dTj6whJVSYoasTpIqguIeNl02xvE8y4a4uu5NsJ6QyjyCB1uYoU7589MlTXcWbP+0w1tD6
 eyWa6jPntpmTp4TbxWPq2mvgKWhbgB6lA9+UhgAxghC37HBZQU+AOAM6IFQB3Or0b4H5svIrY2Q
 G4ZlbzVnRVwx7stAkILS84EzdeF8fky88tHfX6kDraYQvnW0CKTVTQOuZlW9NXeQWz5OLn53ONa
 ymjfydb7QLncWyYJ5LQ==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a56189c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vXmN6uM01wKFn2pfJ1MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX/4NKZ9kHV/+B
 gfgnS9sPwJuByuOENP5Y2mrfiiuKepR01DaOMoifE4IF3HS6YynnIc3z6xsu7sWfccEOTKiYyba
 Kxk0g/o0O7rBQv5BGqoAsl/I/jfkjK8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140115



On 7/9/2026 8:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using `iommu-addresses` in a `reserved-memory` node explicitly blacklists the 0-600 MB IOVA range instead of limiting the device to it.
> --
> 
> --- Patch [9]: [RFC PATCH 09/11] arm64: dts: qcom: lemans: Move Iris IOMMUs to child nodes ---
> commit b935406806a9ce7b7ad2277e27ed775abba4a09e
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: lemans: Move Iris IOMMUs to child nodes
> 
> This commit splits the Iris VPU into non-pixel and pixel child nodes with
> their respective IOMMUs. It attempts to restrict the non-pixel stream to
> the 0-600 MB IOVA range by adding a reserved IOVA range.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -879,6 +879,10 @@ cpucp_fw_mem: cpucp-fw@db200000 {
>>   			reg = <0x0 0xdb200000 0x0 0x100000>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
>>   	};
>>   
>>   	smp2p-adsp {
> 
> [ ... ]
> 
>>   			status = "disabled";
>>   
>> +			iris_non_pixel: non-pixel {
>> +				iommus = <&apps_smmu 0x0880 0x0400>;
>> +				memory-region = <&iris_resv>;
>> +			};
> 
> [Severity: High]
> Will this inadvertently exclude the 0-600 MB IOVA range from the available
> allocator space instead of restricting the device to it?
> 
> During domain initialization, the IOMMU subsystem parses iommu-addresses
> without a reg property as an IOMMU_RESV_RESERVED region.
> 
> It then calls reserve_iova() to remove this exact range from the IOVA
> allocator's available space. Because the non-pixel device is linked to this
> memory-region, all subsequent DMA allocations for the non-pixel stream will
> avoid the 0-600 MB range entirely.
> 
> This forces the device to use DMA allocations strictly > 600 MB, which
> seems to guarantee the exact out-of-range memory accesses and device crashes
> the patch intends to fix.
> 

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

Regards,
Vikash
