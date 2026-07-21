Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B237BE74
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642696; cv=none; b=uK/WxSgAFgCWyYdXMcB6uOOuSr5atHKSlcX0uPyUbxu/t0ESZDqZJeL02dTCsJ3yn5FgMGaru6lTfHrTUEhU5HHECkyJlZSxdWSsqP5mIFFq8VBYPZuZibFNlGhffaluENwGLAIVt8pSRC8FSjrejvZs0+U5KehDjSdrpZPYiuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642696; c=relaxed/simple;
	bh=pRHM1I7lUzJT+3N0s27iw9xmGfYqNB1ayCPmfWgjoxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDqo/9WTjT5+E2yR1X1aupT3/XYgyh3djBU0AxZ6lPRffn7lcXycLXQitSa0Jta1myJS3zAvV3BS89XiYN6cLEUwhzIIG06dlSsFCmT+j1zPpuWHA4zvJ0nOHBuIYlh/qHF6zn1LcL+PhhxGgb45fGUacs4PRYrVD1366eHNeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HkI9qN5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6Shyt75; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HkI9qN5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6Shyt75"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpCf1590944
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/DUjlFCrYmAy09aQhK13n7bsuLPJelDtM7or5scax4=; b=HkI9qN5nGZ77MmYz
	mLbv4P/vnbFmTCSauPSqpNO61cAJ5cW29RctxnC04Je4w8LPq8XEz2UY8AuqhGnM
	yd9iTtO6Z231rmNSe0kU3yxMg2WtkNOwZxQ5+laNAF5AAfhM8pibt9yCxWPKVVhw
	p878D6RhidzWIOa9ZjNNGzWQy9nD+8MerTDyycQ8bXAg4uE0DykD2GSXNEUcbn5v
	vt42wXy1Q9O6bCKgWqFSfbDLB5gKXbOVpg3iRrWk8bFdCeEcckIhLiMGPuRsrWf6
	lDryGgl57g4nUAPj6jPyRUuZ1gMLhaodMLKlyvbsKSaA824wD4mdb3CeWttxN5zc
	bEGMzg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as346b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:04:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7359eba94f2so298841137.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784642693; x=1785247493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/DUjlFCrYmAy09aQhK13n7bsuLPJelDtM7or5scax4=;
        b=A6Shyt75XqsE3T3mxiL3JXXhWzO/lceoAI+siuYPDOniHTz2Iqqq3viLJtdIRMWwzz
         w4wMccaFZyhdFf7S4Kqdv7dEM0ZlzXkZDcbNt/+PsgWamndc4p3RImZ0SiiGroCvJB/A
         XZVY8M9MB2T05n7bpQ3e8WNtWmBw1DpgwTzvWXc221UneYIxBrjM40La38wbduUCofyg
         Nxz6WTUGKT1Co8uAYv5oNp2OkQNQ+yXf2PlNKpBL6SMxQ+U3B/pNWtdgJ6TAJKlFRwjZ
         gbQrbqkXu6+/ZpJs9Oza8rJG9WNoQQhcPI+/aUgfh3c83N8TU5mwUCqm3EEP3XxF2J5C
         pYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642693; x=1785247493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/DUjlFCrYmAy09aQhK13n7bsuLPJelDtM7or5scax4=;
        b=i3yIBVOE18m7/Ey/smthO6D3SIeHDYS2IuQyXdZH+YeezKwKFZZOLjdCVD/F0hKYsm
         r1u1D4dVhH5ZeBN+vPj9nhhT24rhdgdNGr5LUdO8tPZmUvyDXAH8JlX0HeF/Ks17InAl
         3efb/lHsEC8fGMAmvWJjJaajTywDCY+CPtU8CW2uyIE18Fh+hhE3CcJrN8nsAShvuxzw
         MF9ENSgGWe+aZWZPS9RuBKXt6FP0Mo+jwhf2H34ZOdQRCTh/kzl94WcaR8/3E2ti7QHs
         2erpJt6ujWogHz7Ci97Kh+Qzj9k++QE/UaGqESK3U+nf55s6k7TY3IvZo5kjkdvlmoJ2
         oS+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp90/HNkudbK1CGBGA5IVaZ8KvD9/PBYT8+rZhQFTjDWAd2kSJcLKAjOPV39XW1swhZjdu6HoyL5elA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2AH6BOK4AumFO10uCr8MaEmV9OnPVR0FXcls+ek33iFYJI0n
	4BO0g3JwzK4sK1bJ0bxXQ6MesStU8OZ5F6CAvXpPRWmgpOPwo2nKiWrPG+xZM5JK7e54xinJor1
	7Qw2f2OYdARbNZSewDhf5i4xfpPblqEUq3Mc79ztZsz8uVgwWVStszDn7QwiQmw4GO2l5qKvS
X-Gm-Gg: AR+sD13wpJfSIhBFKAYVs0DVQYxuL01QHawyU16AURDu95UsoN5lKMkvbtgQ5z1p2H+
	LvtLEta5jG72/XMuTucqNw+eyu1j5czWpDEn7f6DcZzWbt+Fp15OMEValub07/IuNGf29yCLv2R
	idnTUYgbEyODBaKg8ZKygPHmr4IGhXCEyet7cpQ60SoIp0UwSXQL3s6YeZHWYgSiJVLfIYlfH+m
	S8K4WVsuunzPOPjdwKWBj8Z3hybOnxAeKSG9gpo4ifOmImQNo4d+kXsxLDGfMCaL4PBjjPGxMEV
	GyWY+IBWLYdcSz+wUfxYkrIqnCuIOuk2DFoFBsw/ok5Db7TiJlg1narjs0ZJVRzo7K4AblhHR0Y
	3tKVNBMgoYsgc6zuTGyEWE0kS
X-Received: by 2002:a05:6102:41a1:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-74abc282498mr514235137.3.1784642692983;
        Tue, 21 Jul 2026 07:04:52 -0700 (PDT)
X-Received: by 2002:a05:6102:41a1:b0:6c1:6ef9:db9d with SMTP id ada2fe7eead31-74abc282498mr514224137.3.1784642692498;
        Tue, 21 Jul 2026 07:04:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a08476sm609204966b.17.2026.07.21.07.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:04:51 -0700 (PDT)
Message-ID: <de0f46ff-f6c5-4853-83c6-1a93a8aaadc9@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:04:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
 <c7b576b5-57cb-49fd-a09d-8d1ffdc2d0bf@oss.qualcomm.com>
 <fe34a27f-2a54-46ce-a363-fb45a3d6c32f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fe34a27f-2a54-46ce-a363-fb45a3d6c32f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0OSBTYWx0ZWRfX4ayhLj3Ck0Sv
 yz/PG31g9AKKNeYg/Gypo8rQg1kq/AyQR3w3x7EekHLja2kFKjQgughc1jg3q2HHtAH+fyV/VQd
 XpjzaxWXLQwGqQnfuKzik+CsKsMk2rmAd2kElvp8Ad9r8MY3mveyAB60nHnn5IW+hrrOnbPYNaH
 rCZ/qw2jUQySMreYeuBQI+uNXoNT8f+Ov+HVa+s7tkZLnWpGPD4S9fVR57gyrFxDt+G+H4ealaO
 oudKg/fVQ6KG8ARTIyHKEPOlraeaZW7yXcaFQgL1pqHNuiGVax0Yzt/BSgx7k4CTCegTGB9o5he
 IAkaKYpSrjQf13zg6kNW1H8JQfRrynJxDXhqKm3nrvB9oW6zBfgJi8AeAbC6wYBy9JQ8ZChsN23
 Z8UNbFtxSFH+WaxM6SuLLq2Q5y/iilPsDCbKrH8Um05/ucBF4k1F+mjT8Yt0dt6YOIaGlN+vvJC
 Xlc4Ni9ETvTBsc3gnKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0OSBTYWx0ZWRfXyZTodQrESAs6
 o2YXJFYiayTn55dHoYTs5DCWmRjJ1s6VZ83qObaON2MT9k4AB6xOusOEqiG1v4x3imQ4RSMc0Rk
 BSmMsmLITKeM6/UTdvh8yzMoe1NHw/Q=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f7c86 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tlyJ-ANMDxGhsohFwE4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: RLSV6ishCnYSmX-wjvNWkEwZdRQM8ege
X-Proofpoint-ORIG-GUID: RLSV6ishCnYSmX-wjvNWkEwZdRQM8ege
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210149

On 7/21/26 3:54 PM, Monish Chunara wrote:
> 
> 
> On 7/15/2026 3:44 PM, Konrad Dybcio wrote:
>> On 7/6/26 4:13 PM, Monish Chunara wrote:
>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>
>>> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
>>> regulators and gpio-based card detection for the platform.
>>>
>>> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
>>> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index c98dfb3941fa..48407e47aaca 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>
>> glymur-crd.dts is the Glymur CRD strictly. glymur-crd.dts*i* is also
>> included for Mahua CRD. Does the SD Card slot exist on both?
>>
>> Konrad
> 
> Yes, Mahua CRD also supports SD cards, so these enablement changes are 
> applicable to Mahua platform as well.
> 
> I'll move these common changes from glymur-crd.dts to glymur-crd.dtsi
> (as is) to better align with the DT structure and allow them to be 
> shared by Mahua CRD. I'll retain the Reviewed-by tag while making this 
> update, if that's acceptable.

Yeah

Konrad
