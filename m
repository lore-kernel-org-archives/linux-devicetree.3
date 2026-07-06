Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B838E126
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336089; cv=none; b=StTNKl7+eaN3BUv7ei543Xt1aZMNwyaN+okw7rERDRvmRmdADN6ka/LF0EmuF/v6WMkrUDTDhKGlHjPXFR3kbpD4uVqFQVS1QvCJTeamCujsXpT/iygf6Anq0tFrBaPAXKcU0j2IUFM32EAnn5/GJ7H/U2DxwOJhjbEvRGNeMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336089; c=relaxed/simple;
	bh=lnCRP++C8hi3TQVnzk2JF8NMeYP6Qggb58ii34Am7s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PvyjPZD0Fynj1LFw5whQFefEboyw3Hf82MrZ+pjEZ+7ycue0+63+q8/8Lwu8hl6VlbFvnujz0zFBXEk41SIEcixgksdv0E06F+fhRfD8FCla/tVPMG86lJ3RNTsd9SPR5cHb8MDqHCxrl94OAkM0+Pj8JsTHYd8olNxOSj7+NjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENQWdUF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/fYGRXA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENQWdUF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/fYGRXA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxMoY316792
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 11:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=; b=ENQWdUF6x1jx8yL0
	TK34NknB8KymeARAmE8QPgyereYZDw3jnXe1q0/8g8VIFp52NHROi3RqaFudgQWB
	5zhFcvneVdsjzC4lAtz+xN4hN8soi0D0zrkeozEht9CPW4BSfkXXGS/jD9U323y1
	/ogrS24EEAoedojh9FLljIPmZiPkg3Je1RtIU/U/X9Y9YxRXjiwi5R8cE2hJs9XK
	pm9NYzofTI9ptS+Zy118aqiLUxsiF0BAVbr5c+zxiNtevKsFrT9hHyGN7ggwLDOs
	TYMKWyTD5JQoP8CysdFe+g8AbOM/w9G0UIwT4QyYEOOxbQ9xwEiHh/esOHlx+YT6
	Ywkprw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7gwyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:08:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so11420441cf.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336085; x=1783940885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=;
        b=J/fYGRXANYlQ1HpMVlCZORBi4F/OOFccPjF+EXOxQRw/b/MizcG4uRwLBEM9ErxYdF
         HPO+/cRb0ALLMDVxiIorlmaiso0qO4g3eqvubB29uspC4E+pFQy8wjNeevWNpLi0mDZg
         D+Q0A1vY2eqdCnEwDe//gzHlR1nLeBsvJYH85bSVf1hkgO2Q3G6XZ3lH/gRGZFbOVrYl
         7yDqC0VBmicERp5SSp5SXZLNARwmwdaHv9RP1K5PFawGGwNJlW2gtZxVNNfsLiO/LZ29
         wqoy5HFPNqic2Bq2yWfAfI4dPlwFfQhc0FOJ9sjPWxCTgldug3HJ8RWC/g4SaxYW53p3
         dSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336085; x=1783940885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=;
        b=kwZeg80M7/fvUKGfnr4k8d78Jef3qtt9mTsxkASukE89HhKU+SCYHXzydfUJr8kH0O
         tSUZCWB/6hrQNUhqN7brFzB3uIJ+nR8Vns2nlSpSXGWUtiVjpkXNpia4axYmB+/XR+Jn
         WZQSGYTkZxYsOfDIpJAI1KDSj/vX5cokGuTU26Hgi7icqAnwu3VrvROLtSFStfzPZ0ae
         VfQsHTT8+NuYJRNCZhiPhVCksFSL4VhTj9hUhYmm6IHQg9pEabuC9/Qns9wYuSxS75WN
         Tm734kqm42/03rn+8H/X5NS68tAm2dPgqr0AdU5K+DxEliKqHwl0OLJi//cEGyX89/nh
         oILg==
X-Forwarded-Encrypted: i=1; AHgh+RrPFbzzCAAyt4DMgbop9ErtaM1dmXODPcFuHFnQWcpBq4yUMrY9sJUchMFxjfWVEY95sdOz9USl11ai@vger.kernel.org
X-Gm-Message-State: AOJu0YySGIjgmU9Tfek2jsIZod5xA/m+5hgE1802HJRdorLE8h22/lEf
	YSTUDF7Ou0833IS7g2KnOnX6eV9jCNk2uT7pF17ZTU/ceZfyTxMtFHJ1t3PqK75wKJrR+YDQGtW
	Shy84zZV97NQKfEF/lAPQStxMzg1jW5gxOo3dAR8y2m/ZaD/K5huC+5dSU3d1Pka6
X-Gm-Gg: AfdE7ck8l/6g/qrmSZtPquq6YPJ9GE6U2GjKRfEZEnhHyNuGdd1rkf+oGWPLdFcCM20
	N/CqCda0IJY23ED8NdJNk+/3hWM2EOeQNCj1jIcLE7jVb09bYw/jgVyku3+C4gjeOXAI3amnpLC
	YcN8auSx1zZ4fGhzvIByhBtynBR4MwaHjxiZN3Ben8xH4ErhPS/vQwop/qSv9qmCuYRX1fHX68r
	txhrBbJzIZ970hhvtCxOo2Qwh4/tsHSXm9tl0KmWIs/Df8vFuYw7P6Ka0L/OrVc8r4XNj+7yaXc
	B+H+4f1uem+1erN90X2JkHqgGK7nhK7cHcKfa9XpsZ62IigPQ2AERJ7CoU5pHFmwuugOAiDlhh7
	Q+5F7uLBD6EpTA3TGcMoRkrwr4qe+1LCoNG8=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr88275301cf.8.1783336085175;
        Mon, 06 Jul 2026 04:08:05 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr88274771cf.8.1783336084718;
        Mon, 06 Jul 2026 04:08:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1c7sm723146366b.30.2026.07.06.04.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:08:03 -0700 (PDT)
Message-ID: <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:08:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
 <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX3HpvIKmXWSiI
 LOt2yFsp2MmQPnu2/X9Nm+ATdq+dPXFoRCdUJflP3QEOQ0GbqXlnZBYwQdKs/85HilNvJl5gCJi
 IvTaU0XmKU6Ovs0HkFE2XaeiTjYCjpqLJJAzJQ/2a+sz6eO5d7bA4aHNJ7cVDJg8oy9QDyVu3Ub
 MgknOacgVEEg1qL9kr4650G747Ay2Jl/H8IOtiLWBrYlWLCOToh7/Gd1CiWoevthNMhhIav5/OS
 KJ6VDp3jIR5R+F9UTfWaEdqYKBf9ALpNPol2FS9c406VSmJ/TzMqO4bNEySUFkIb5FJHjUTFHS8
 h5fwOYVhpiE1+zltAJtlICkO+XQiNSAuI6XDQ6r98Q8zLebw2c/f82AaLnHDr/+9/YTW7XeXnTV
 fY8V9sY2DM6u4aRVgXIn+/46Rk7ZZxvg6pPw50NVWIwDKhUjTltvlM2hL9lGLu0t6/fHqgFIqXX
 hmpWhL+emZgZZNg0eVg==
X-Proofpoint-ORIG-GUID: jYBRTvJfU4CqG4cW8UNYibdGKLluP2MQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX98eak2OQzA/z
 lLE0hA80pgggrbssp3PNwmvYhRmSuQcmMbrIqfRI/GZ8tzK7Z+iQDIsCwzrHiIOMV0SSk6Ykyj4
 xUFhssCyJU7/UEUIge/IhhpHMkCxIkE=
X-Proofpoint-GUID: jYBRTvJfU4CqG4cW8UNYibdGKLluP2MQ
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b8c95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rL6LpJHDE9oUo6aHBFIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060113

On 7/6/26 1:07 PM, Konrad Dybcio wrote:
> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>
>> Add the nodes to describe the GPU SMMU.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index c5635f22e2a7..e5b8377e6c3a 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>>  			};
>>  		};
>>  
>> +		adreno_smmu: iommu@3da0000 {
>> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
>> +				     "qcom,smmu-500", "arm,mmu-500";
>> +			reg = <0x0 0x03da0000 0x0 0x40000>;
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <1>;
>> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> 
> 674 is the correct globla

(modulo the issue i explained below)

[...]

> This list is not quite correct. It must be sorted by the context index,
> to which a given interrupt corresponds to - the driver relies on that
> to give you information about where a context fault happens
> 
> Moreover, I see that the interrupt sheet has the bug where some
> interrupts are offset by 32 from the base vector, and others are offset
> by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
> out which mapping is correct with the right folks

Konrad
