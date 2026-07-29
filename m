Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A58D3B4EAF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316973; cv=none; b=tJHPn7SPydQuKWaf1djRMV9QfWkkhoqIske7RSBNoJJRscwCaIBx7xoWT55eMMvUSrvqHZCDgWNB8hx7gJjTdq0icGhtCwsmC0wtWrP5F1CQe/qVHgy3SZHVckVXcXjNleHzh2MeRq0nrRAnEC5mf7FLPxCp4k5sd51uiibNTl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316973; c=relaxed/simple;
	bh=0GXSPUWVfNA3cXUSIt16XU806pOthrADsXRrjIqiXNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNnGahtuVQlOeMC7py0LtJbIPOOtkwFUtrXR7vT7B9/MI2nc/ZSTEdjsQa3REURemRC0GxCn9NDVAeuIq3Mbf2PIDV6X4hoOdAEvtWFN+6nxzSPIvufrILJeh24+QPHn4W9XPJwkzuYvvqog6uEWxT9wyjIR8NvcZBE9OORxoH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNSC7E8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGG0PjrY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNSC7E8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGG0PjrY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f9Fl1569251
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5Qvae2kNU+ivL5Nm8P6mevBBXRqOaNXaPm9IqHOU8U=; b=dNSC7E8UP8sGJ+YN
	Q2lL7qEnNQ8JcVbTATsd79Cp8vSsb0Fm9FoRVfSAb2Bm4tac+239j9TSzGcIdsBG
	Zy7hqXFcAeZlXmZa4y7w5x9lvERHOKGoIyYrfzmXPurPDSt6hi6JhsiM7CgBEbHI
	Ol7Iwfdgk81Z/pO/wwsxx0NOvyGj7ENKcu/cmuS+kt/yZATX0HBKGYEMatyAZVl5
	f/tPpT0LqZB/WZ9BCF2OV5Rp7SoNKN4T16s89BMALu85rNwhR1A843dxpBEql/jl
	u4NeLwLG0J3JvSyA8VqLlmuWKzvFC5SOpE32NZKyoG/bEudnXSH1mFIrVNn4upd1
	oSfFfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108u78c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:22:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52845bd815bso1318981cf.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785316970; x=1785921770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5Qvae2kNU+ivL5Nm8P6mevBBXRqOaNXaPm9IqHOU8U=;
        b=bGG0PjrYqSmc5o7NwkThgSS5mnomWBap4Zj/699eHTZ9z4YqlVjpu9UgiMcrbZ50wS
         esqJ/vSDgpYJ8iy68nDu3VqFKOpjEKMzHJdtLTGOH+epjRWor9hOZ75R44bjBLZUAGa+
         t9OPRHjg96jtZPsKZEOi/OUOjIukOwvIdd9VBZNHTj7HMk/WY7VSlHLycehTVzoz81UO
         QIvpP8qMLGjZN+tm5/Nn1E2J0/WzXOG08gkL+KhU2ES3ZaxqSuA6RA3D19tWLlEbHTnP
         F2nNpNPEopTyS0fGrvWCvY6LODKQqw5IAVQ9Bo2mr3U586rQEC03y8i6pR4vsnJNsnCz
         h7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785316970; x=1785921770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5Qvae2kNU+ivL5Nm8P6mevBBXRqOaNXaPm9IqHOU8U=;
        b=DJ9gu1vfPa4+kOnOvBZ/0RO6uC8zUo84LtdYDangEtVcyUh/wsKweAafbNektNPsrF
         z4Po/UQB6S3o0OCgwt0mqnuRqxqf6IWM9P0ok68cqsicK43RZYTHW/OI3Kmc3q9qZCzy
         2eHVrwKbYTB8OVDTFnJfNnjj2cs+vdIqyOQvAsCBJNb+4EgNlklo9nqzXcvHLiEY/NXw
         BSRouCTL2NKw1XwsYxhoUNGjIbNcTaV1dDcrxiRPBKdA1lS82l1CcrFDQUTyCRkMjRK6
         LrsmgY33tSvRt3/iG68OYEKMa8YVx4/2i9R7iLTJ0M7qDjJAqGO5aflh8vmAO9mPjIxp
         MPGg==
X-Forwarded-Encrypted: i=1; AHgh+RqHduqmqvUOTjJ5xSp0QsPJ0zIxiMYNTSzLv2aW2TZDlymx86wuJJ5ItY5ou+D/w1sxhppTB7MX1dB+@vger.kernel.org
X-Gm-Message-State: AOJu0YxX6xymLH+1ebB/r2WDHSCa96xsmXHNz7fxefEANnOACDIpKmJv
	0OrxQlzdpKq/ekh6UXvmlQ3oUcBtp/u7Pt5VF4wvhHPeTaxlzG8lo8rRkQmLCe+TPHSl59onOwL
	Tqx3aJ88A9i5xbVBHqZjNJOBGG+GTNhsDMrwUeZkH+PLC4GtnfxUkp7USQt41JEqW
X-Gm-Gg: AR+sD11E0oK8886ivInRhTW+QIbCWnco11tDJzJegDMbiXWR9Tfg6UPnZurUrhM85p3
	oFq8X62yfa7DYF9/O75HJPZD6fSgEm67vGkVRTaa/UyVGFgnE0EhZNkelZm6292/OLay9pCrt9g
	kdwHYTF1o9D/lowFkjxRz0bsKUNrDesIYVnCC2poNgcSGwRJNzOf1qn1LvoRlTbEmN0/3ZhMGeA
	e1XRgFSjZ6UNx8ZUwTiMfQG0LQeQhcZS8hSgrap6e7FlANJwqz8mZRxeWp1tfUrOu8XDqT8cuLy
	A5I+yFNnjbM2ykOtD92D3FMsVpEXcNZwsXwe6K0bpYvGg7p03/Y5bkYqBzL08YVfUGKISwtzwcw
	+Ge6C4WRlk9AuvuP3QQ/WmK2V
X-Received: by 2002:a05:620a:2729:b0:92b:55d5:ba3 with SMTP id af79cd13be357-93302493325mr555429885a.0.1785316969796;
        Wed, 29 Jul 2026 02:22:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:92b:55d5:ba3 with SMTP id af79cd13be357-93302493325mr555427085a.0.1785316969379;
        Wed, 29 Jul 2026 02:22:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c60154sm586218a12.24.2026.07.29.02.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:22:48 -0700 (PDT)
Message-ID: <cc185dfa-4271-4c63-89a9-05b8990db242@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 11:22:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
 <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
 <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
 <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
 <amnDqhTpMffP9M1w@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <amnDqhTpMffP9M1w@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hb_TZ99oZjkt7kecfaYx08BD6YyOmqW4
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a69c66a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EFN1Nc5OCtOC5hJ9hqwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Hb_TZ99oZjkt7kecfaYx08BD6YyOmqW4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfXwqhG0a/3XtA8
 y83JyJ3dQAN+L5JktF+oyxmc5WhLC+Cw8jMtLZ8yZbPlpcVp1p7+T48lBWzeUEAt0DwJQPdizi3
 +veiH51P1WwiPbv1onc+pCKSOAUm43A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA3NiBTYWx0ZWRfX1P4vLbX7NNya
 TYWzhgSX5N0ZHswZjHlWLosxyM6HLDNp72nE7AfO3pI6uKy6FwtsKwh4NZ5TNZhQsdXT7u8n6CG
 HL7FGAJM/4bojM0GM6Qw7FwzLPHZlLdZqXgZ+MbSYHiz2t+71rkpFlNPpejRUKDChNJmUmg/pjd
 qJBGyaJ0YMBmYayPtlYpg1pQ5uX4Gzn/HQvYRCW2VfGNn1aMLukOlSCRRJT8y+/dtrPo2+ODy16
 s14TmgllOs+vJEhvKIbRxSidutXNrgOUF59CDjXC5k5X7eIORgzoU06aUt1K42tqSpRNmJdinu2
 ev4iTVCFo4044cONWqinDdQZluelXSEj6sEWhmRq6lx7qr3546oRImc7/dFlTbm/Ll3JAz24ywQ
 p1Si+63SzaqKsfKVWx+qRPn/sNn1YwByLX+k+UcbhuLf+ARmQ2abud1PCPNgxNwE1JX2Mxc+xdm
 mwU6TpXnHgXx4Gm/6UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290076

On 7/29/26 11:11 AM, Qiang Yu wrote:
> On Wed, Jul 29, 2026 at 10:30:27AM +0200, Konrad Dybcio wrote:
>> On 7/29/26 8:45 AM, Qiang Yu wrote:
>>> On Mon, Jul 27, 2026 at 04:47:15PM +0200, Konrad Dybcio wrote:
>>>> On 7/24/26 12:01 PM, Qiang Yu wrote:
>>>>> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
>>>>> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
>>>>> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> index 6125617de82a..0aae613a33ad 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>>>> @@ -28,3 +28,11 @@ &mdss_dp1 {
>>>>>  &mdss_dp1_out {
>>>>>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>>>>>  };
>>>>> +
>>>>> +&pcie3_phy {
>>>>> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
>>>>> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
>>>>> +
>>>>> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
>>>>> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
>>>>
>>>> I'm guessing you also meant to enable it here
>>>
>>> No, we need to keep it as disabled because pcie3b is not enabled by
>>> default on glymur crd.
>>>
>>> See the fake pcie3b_phy be dropped, it is disabled
>>> https://lore.kernel.org/all/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com/
>>
>> I think there are SKUs with dual-NVMe that use it
> 
> But the pcie3b controller node is also disabled, should I enable it in
> this series?

Do we know what happens if UEFI sets this to x8-mode? (is that even
a concern on CRDs specifically though?) Will the second controller fail
to probe and become a sync_state hog?

Konrad
