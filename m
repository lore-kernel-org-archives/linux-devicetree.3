Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A06C3E6DD0
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282362; cv=none; b=BMpabgiKkyzDRRx5/K3hPWiHj/4VWJEaU21S/BAyqLaSaVbTuu3ISF3dK1hec5MiIrvSxcnPL8JQoLtp79FmI/oi+wgqUT48PPPPYF5ffjSCQ7O+a8quM8eapQt+1l3upihpHm3ZH6455sll5rsJXN/K6K+rB3lpCe7vD6mf4v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282362; c=relaxed/simple;
	bh=jL3mrOok8MADLcpmY7jdHUknhxvySR86Mx3M++52+aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxSJYyLkfW7M5UdSN08TMAB1/PYIzcl7HJ66t1LfibFvfmXdIqplxbLeSCbU9ZOLFjeLtddPP9FCIcizKBn0R/jcbPDHzE0vGWyCv0+DlEiq+fHB7lf8cp/9RSZ9FwYAZheVpCyAj1Jwip+N8paIKjmjIZI5HicpUjD9J/XFUBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qov3sl3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZ3Rh/Cp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qov3sl3X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZ3Rh/Cp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHOt2098529
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4m4mhHCdwe+iD4gbi28L8euNiv4IB7P2LYKO26utpc4=; b=Qov3sl3XOGvuaaS9
	FzJ64v8p+4oY/aWx3GR75C+9X6OpIO2Ur6Y/TrlskZq7xyE4qWVcdLzgAK1OkjcW
	/O1PfaH+hCukscfvU0Usf//CEk+9veVwA/G6+tNr3UL5NsUHHrdRVPTjn/Y0TlEb
	LEVvhlslkKG67+QUs0vgfT3Af3AdvBk+sINzKnG390ybx+UpMIayENdJnYE4m9q+
	c7Cr5MyXPrw54nkerytxqHoMPPoGxBTdNvngbm3R4fwW13K8hB0gqkBkCFZ1fwq/
	eESdJxByGALHzIP2JC5Y3tAe5udjJlu/OgjRhjaDv5y/gVkCUi4NqZU3eFfD3YZG
	4XXPdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6k5ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:59:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso164421185a.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282359; x=1784887159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4m4mhHCdwe+iD4gbi28L8euNiv4IB7P2LYKO26utpc4=;
        b=fZ3Rh/CpPUj9vh6SjXly3vM41IQ9OooLJqtanHPZoLTHsZHLHLkGdv3nLk+jMhjDxb
         MpVdaHmTb3+mV4L2ECs5FpwPCJ1LSPTN+d4kTWqkdzYEI95055Mp9hpaT2hD0JPvWQyx
         qVmdpFDRSwo3gJbTtXyo0RWK89i8cQBcmeJ8V1udeduLnsToDFHgnz4LRbKqN2MNC3O/
         tauyz2E/CXrJoNigs2OtQvw2K4MBMDomh01TeIALA/vbewZXTz+GtK0vTm5TV7fzuajC
         OQ3g0RfSUHiYedSly6FL5ihdUN1eX1CNKtMquAwlVImqUt4PoHtdEUhVCdOSJUdaKzB2
         ygOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282359; x=1784887159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4m4mhHCdwe+iD4gbi28L8euNiv4IB7P2LYKO26utpc4=;
        b=jc+f97uVoy+HkYy1fNneU+z9CHILFYZR56nsQ/t+PI2IWoAatn9X0mZsC/0ez0fFL1
         s5Y1FZoqCNGIXC45PXyf/tj6MmON2/959x1Lm0+E4skAC6Djq+HNKbMgsot59B/A6qk2
         QxP9n7nltJDZG66IcF7NEpDmyNURqgQ0nmuScWg+RwV8j0pfee/HBhQRu00B965Kkarh
         5MpdHIrwji2ZliQ2WOAwp6LUqRNHZa0FmYunLdri4vFByYv5ulagVGvWKQ7CNDXzvOcS
         zbkjJgFwq4Xs7W/BfU7WkqqmA7ldYQLSc7yEDZRO7nU8tHs3X9xz9BBg05ieAhS76Tt6
         STsw==
X-Forwarded-Encrypted: i=1; AHgh+RqQzOhhGmf6P3uyp0BRxMu+GlUmcNaZqUckNSkenlsJ+ZQ9oqRlNeu/479gsLwORt4fRYb+V8RJi65R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ZFOLajn5ltKx84txW2YKSrwWNTyJvWoB+qLj0j1sCIhU+CI0
	lukm7yxFKoZfdF65jzrYc5kT69hH+6j1WWQySZdZNI1wxVBBKgpfPohuGJGn1fZYGOmQy0Ey2qA
	7nkQzCM/LVBur/SvVNXQnYfc/gWOXieQjBcTdYnRYVOXFQlz1+hcXoqv+dSdVDO9X
X-Gm-Gg: AfdE7clbJywXet3fB8fvjxJTb9GgrdOFFEuk8m3w6h/O3IPs3/CFEsP5unffbhZv1C9
	r1cTlKRLd0I/ow6gJMHAtU4Kzv+ZIfFsFrEAHmkVI9Qw5rP2QcWccvRz52pB1qVPDm2gL2llNeJ
	waitMPdXL10CJXI+Ri6FCcbG22P4XG7uMQZvU+etEzxc70SGmmBLPPuxhUFpdTJryjZyO2Mf3mj
	on/smkPogTymA+oGgSl5mCgOLrxJJr69oogvAiqppUB56Prvb7mO1dUdAhejNcBF1aU9+fsYEjb
	2GOFeDZT7yvPO/zMS/V6TJ/TUQunLwqcMSBtbivu0ljG6rtWVKiqH4+bOwKaoaYiv4Gv2MmITmT
	uhC5g7UmrxjjxLvkjUkCWGLRP
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr170490385a.2.1784282359418;
        Fri, 17 Jul 2026 02:59:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4396:b0:92a:228:1bfc with SMTP id af79cd13be357-930b3e2e4famr170487485a.2.1784282359012;
        Fri, 17 Jul 2026 02:59:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf5df5sm50044466b.61.2026.07.17.02.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:59:18 -0700 (PDT)
Message-ID: <f7de5852-c255-4a17-b87d-c9a4542255f7@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:59:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
 <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
 <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
 <e8255fe2-a67c-490e-a905-ed056c6af950@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e8255fe2-a67c-490e-a905-ed056c6af950@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfXypmcnvje4l6R
 ByzyWSa0dPMU3QqDlDzv7pg3KYic8x0tQUxPBH1FcVsmZUdonhK8ImXA/Yr1j1l7PEHeJ2H0noG
 Kb2gzJZ5rcJSKRE2mYpNhVoTmnl/je2RZ3193H39HeKABrbzyNdoa4JO/XS1GKiDwOyekSjyfzs
 SB4mSQ0eqF4jQ3YeRPI1zi1fS3bhdcFZY+z8GHeSmkew8h/EDcP60/KmnD8j9KZ3WIu4oW+qlX2
 9Lig7TI5/UfixBG3o/DgWAx4Pz61Z8DTPYHm013aDLEHMaImu2WIW51GSPzseBdZBRA1kWwwMGd
 QCOFaKDkSdpXuSRbF+WloR6E7QWm9Q9i6A0hU+8+Ttv6Tt9kdyEctgMxOWiBc6ePLTwkMo95GCI
 kP2HDP7U27TYIHABiPdHi6MHe8b2BjoEhH5vK6b6VxzE3ImPbZ5nzDXQyUqsHST9bSWb2UuzkgT
 Ndg6VHMJ4vZQ2mG+3jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX6ca4QHdrStrA
 gCDeziYlOyXmefUnin4Ny0Hwbnitzletz3eyJjuMQSsNnHbJR5uvDlfjPT7UDJgMsDFCrD/APCZ
 GRiaGS1rHHVgF78UZl3SHBHHuxvP6K4=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59fcf8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hbrWYzUuUx-UyiL5C5EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6VFySvPbVe9eqdBbesvyCD6XtERiRvOx
X-Proofpoint-ORIG-GUID: 6VFySvPbVe9eqdBbesvyCD6XtERiRvOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

On 7/13/26 9:47 PM, Akhil P Oommen wrote:
> On 7/6/2026 4:38 PM, Konrad Dybcio wrote:
>> On 7/6/26 1:07 PM, Konrad Dybcio wrote:
>>> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>>>> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>
>>>> Add the nodes to describe the GPU SMMU.
>>>>
>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 38 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>>> index c5635f22e2a7..e5b8377e6c3a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>>>> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>>>>  			};
>>>>  		};
>>>>  
>>>> +		adreno_smmu: iommu@3da0000 {
>>>> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
>>>> +				     "qcom,smmu-500", "arm,mmu-500";
>>>> +			reg = <0x0 0x03da0000 0x0 0x40000>;
>>>> +			#iommu-cells = <2>;
>>>> +			#global-interrupts = <1>;
>>>> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>>>
>>> 674 is the correct globla
>>
>> (modulo the issue i explained below)
>>
>> [...]
>>
>>> This list is not quite correct. It must be sorted by the context index,
>>> to which a given interrupt corresponds to - the driver relies on that
>>> to give you information about where a context fault happens
>>>
>>> Moreover, I see that the interrupt sheet has the bug where some
>>> interrupts are offset by 32 from the base vector, and others are offset
>>> by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
>>> out which mapping is correct with the right folks
> 
> I reviewed this and looks correct to me. Also, this matches the
> downstream configuration. Did you confuse with Dest Port vs Vector ID in
> the documentation?

What I'm trying to say is that the documentation is confusing, we've had
that issue in the past on other platforms. If you see that the correct
irqs are firing, it's fine

Konrad
