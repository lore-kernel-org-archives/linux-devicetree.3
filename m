Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA423AF667
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079104; cv=none; b=lLmDPdGUYGgODWXmC//oG35vCfCSqxXiaHKoBgjwvvhLNIjb1pGkoLkogGJEkSrT6L2TaoHdhY2T01K7NccS3f3x+qL2F5X2G2Q/1DDcWO2L30Z0koz3pH/FpZfAUiW3y9BNIRHbPm+UxzKNBQY4/6o+BdvZVxReKtPp0UlhHAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079104; c=relaxed/simple;
	bh=eH8jzy/3275qHq8UWVm0QvGRDLmZWwo/AC55TjS47JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SvLSgoAsiq3Q9SaD1muzmxpfiqFOjbEElpSEe69GpeGxx5acHriVpexp7XrVlpiKhzb8ZTSmfEe8poC5rJxCySq/HsBWlGZpkgnb9l2MRviH+7YNXveYT0AGF/ltYar4FaEOOigpbcXKpvPn7U9vnruSBQ4imopgg88RePbCW18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMcKBObn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqW4ZCiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMcKBObn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqW4ZCiF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7H3W74068497
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jk3X4v8HgxegViSZYWAtqUOG4jcrWQNEUqyBoBn/fnE=; b=hMcKBObndxAouxNz
	g02IgvAcySRvKWlRUMnPuJTgDZYeRDSDy+8C372Ea9oBt3xMjdV5WG0l28e9q1Hf
	L7egosE/YliOAUrIUwf90I3k4Vbpgsd12MjpWeZaY49nnSRU9pTBKBXgucTugnoB
	OIlkS8Z3X2SShVuWIA+26Jxig9k/X3vF/UkfCsHCLLwsreJX/JYGjI8u3DTrVaaq
	8qL6xY/2M/KWql+/IVibGOOku+K+alnoawTlr8GTaFE36hRXMWIVE908NFovcHMJ
	oh/5ZmhQEnocj/LjwulDNmRqhJEZL9/u1llzUuwQhPJzV5tSf6i7M+3oMVwJz4i+
	k6+7eA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkw3hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 11:18:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50db373cf13so6371711cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 04:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776079101; x=1776683901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jk3X4v8HgxegViSZYWAtqUOG4jcrWQNEUqyBoBn/fnE=;
        b=FqW4ZCiF3aR/YrS3dr6IEG02Lnnqh59bmXP+OPOzCT1MYbXHOFjaTtA2VD1PlOEjf9
         PYMdNaT4tx7li60NnrzkzDcKIzOAY2ce+TTgU3pekj0LByyVxVs+owAtJLtwMJ+WCR18
         LU4ivorJ3Db3+Flr+C+XeXfEYNNl/2sK947L0/8VlPcIXfReiH2591Hnb2/rRIwdy23L
         2qV6qIKmWIfNO1/n9nuUoYaGlX7ePgZRxKR9G0xYEXh5CeEtTKOlF1iHXLNz8hupbbZx
         CpStC0wpTu+oC/4kptz6Cl1FtZfaNDfziLH85q+Uk86B7pOKvayS1a71x2QKEeOjHUxc
         ddPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776079101; x=1776683901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jk3X4v8HgxegViSZYWAtqUOG4jcrWQNEUqyBoBn/fnE=;
        b=k9lNq4I/q4HKKiM4p15ut8QW80TDm7qRKi0rbVqaMye0Gb7Q/sriRk9JUrqZ6Zm3Ww
         F4tDyRdcwUViXzUAzAyBRS5kPHmlA+SW8Sh83B0shuNt7xFKA8hTxnYpHoSE2lXCsIuZ
         OIdn2RxCj6/qhfoBuXV4IS8C0zj30yOhK6BsJtKq4c9imm4PKG7eBABc8ZhogsVx0rJ5
         7yy9G/ITHHJYgQWL1mz1t29zS4OnEUPxbGRJFMcnGgekGrdpvVgc0m53xjlSKYbHvE7l
         lC8VqVxb36DxUGcijHmI8FsU/f1EE1aVk+4ajzuVfF2iZogbvF0QL8CWnq/pjtR17JS3
         85rA==
X-Forwarded-Encrypted: i=1; AFNElJ/pwbg1WlIGDs+KyC9B7xgpamtSg+bQo+2IyrLNnJfeZP48d6Fr0y4PwcxxVELphrcFHPO9ze4EnlLL@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTtI1MoHH5eivgL2zepxi3iyHQtMcl20Lkytc1uumdsRNscKO
	jIW5y1hZN8khRU7P6IEOFOsxTbFlkIyiNUN2TVDeorfYa2V32nLbqMRphheYOzc3+vB7NAyK5LS
	KJtJWkbx+36z5T89tZPfbzRqIvn9d1J3vB7p0WRrgtYwkO5sieOaMN3oGI30q4XoP
X-Gm-Gg: AeBDievyLO1umu/MxtwIxOZ964HmOjR39GJd5U4yMyyGuEvhT7yzqimD7R/1ynfUt6M
	hMLwrsIz6dELXzwpu6G3I9ZvkzxlgQ1cyeCsd9ZeHED4r0jjRQNiZi0GHFv0jNfH+znD/1hLoNz
	EYcWPgbcagTVsNECZNgDw7Ek1wLR4MFld1lFsgTsObCSe1RXHLgTHERKsyl9QkRpfeIIXUs1kKJ
	Z1QrVhWKH5JJ4HNUZ6wx0ML5R4C5yqjj6Hy+dgRMpMgapLu1fz2Xh6fg3xgM/4BT2JaRhVTYNYr
	T5mg2ENIolURtZORJy12sE8jWqGXgXcFWcn1t+3DeGUzECJ8iBP8wiJ9qaLfxEIfRtswaw+C12t
	y1HTSm7Zm8dldkeo1nYFb1QF/FI322kdchG5fMdsabLxqVSVI8Rh/X/WN0y9zMl1XB/jh1d8U7e
	XgDyc=
X-Received: by 2002:a05:622a:1c0f:b0:50d:5af1:65bb with SMTP id d75a77b69052e-50dd82879c6mr123727481cf.5.1776079100995;
        Mon, 13 Apr 2026 04:18:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0f:b0:50d:5af1:65bb with SMTP id d75a77b69052e-50dd82879c6mr123727081cf.5.1776079100591;
        Mon, 13 Apr 2026 04:18:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm302144866b.38.2026.04.13.04.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:18:19 -0700 (PDT)
Message-ID: <3d4a12f1-a9ba-4955-b018-f1c271aab766@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:18:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
 <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com> <adem2WKh2B-Leivq@baldur>
 <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcd0fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=lt5JZrjwga_6XPCI6XsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMCBTYWx0ZWRfX8m7zS1+cE0iY
 EKxPnPn9NT2nP1cF2KvlSpzjCa+IFbenipK0f2OzmLcP4J+J05EHrfR9KEEmDw8s97h0TN8E5ws
 XM2GmyZU12KaS/XwSRP9bPzGn6ZBck6FUe6FKbvnizXoQw4HPxQzbVC9POtsM2fgbQxvk8Zv5dh
 RiFvuHP5B8Aq+aHiGxhsuj5JpjGAT3nRgR5gSW/71ypCkerrDAS8rxG/J5trNL3UmmKl3U9EIgZ
 jqUpOQ/Umw2v1vo1Q9vqlsLyCJnL7duqaNKnhyQanFIZW6NkERk1uyA3ZBh/mh5BIGg36l+cNr5
 OjulUODJFkpez6TrmxFe0yk+nXTLcBsHzM1QDsitsw0NdoNh6D32HrpUQeB7wQc2Uuru8qz4xVb
 YBDP9LmwcWB1MLkxItDKTn8xAl7iCVNB0OE/cz9RcQMM0llEZz09puJW5vGs/uMx/LtjW6E7Tf9
 Ng7992/onJw/e7ffWmQ==
X-Proofpoint-ORIG-GUID: 2YIzckcBOHeZpgvINGJOyTF2LAjkikhk
X-Proofpoint-GUID: 2YIzckcBOHeZpgvINGJOyTF2LAjkikhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130110

On 4/13/26 9:06 AM, Qiang Yu wrote:
> On Thu, Apr 09, 2026 at 08:19:41AM -0500, Bjorn Andersson wrote:
>> On Wed, Apr 01, 2026 at 09:47:38PM -0700, Qiang Yu wrote:
>>> On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
>>>> On 4/1/2026 12:05 PM, Qiang Yu wrote:
>>>>> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
>> [..]
>>>>> +static const char * const tcsr_pcie_4_regulators[] = {
>>>>> +	"vdda-refgen-0p9",
>>>>> +	"vdda-refgen-1p2",
>>>>> +	"vdda-qreftx1-0p9",
>>>>> +	"vdda-qrefrpt0-0p9",
>>>>> +	"vdda-qrefrpt1-0p9",
>>>>> +	"vdda-qrefrpt2-0p9",
>>>>> +	"vdda-qrefrx2-0p9",
>>>>> +};
>>>>> +
>>>>
>>>> TCSR clock refs are just not for PCIe alone, they would have supplies
>>>> for all the ref clocks. These supplies can also be shared across other
>>>> clock refs. I think it is not the correct way to handle the supplies, as
>>>> TCSR does not have the complete supplies map.
>>>>
>>> We have complete supplies map. You can get it on ipcatlog. Here is example
>>> for other instances eg USB and EDP:
>>> - Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
>>> - Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
>>> - Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3
>>>
>>> I only add supplies for PCIe in this series because USB and EDP vote these
>>> LDO in their PHY driver. They can remove them in PHY dts node and add same
>>> regulator list here.
>>>
>>
>> The regulators are reference counted. Can't we add the USB and eDP
>> handling here as well now, and then after they are voted here we remove
>> them from the PHY?
>>
> 
> For USB, I’m not yet sure which tcsr_*_clkref_en each USB instance in the
> QREF diagram is tied to. I need to confirm that mapping first, I'm
> checking with Wesley Cheng.

I think on at least some platforms the reference clock for the primary
USB controller is not sw-controllable (so we wouldn't get a handle to
toggle the regulator this way).. please check that

Konrad
