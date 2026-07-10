Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F2B2DF12F
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692166; cv=none; b=jUGPY//TEVfhxVeSxVn6JjVipHxl86OOsk8e3M303hTiKGrJhPOrGCeDLqws5Cy7IiZtDVeH0Q5UvswM7LgwPdZF+WYRTr6iO60DryGrcpY00p8prlADHZKN3bMA5zWwOIgjMCjeTpEpikeY1iEqos07iWCdvwuXFu+iy3A43hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692166; c=relaxed/simple;
	bh=hr3pBawVbAwf5wvAAi3Q2A6W7S2tjhBPGqeAR4FmgDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEGQGqG1MEpucRBR4RS48bRTbf4DHBnR7DDJ+HOLZ4zxOTnwaOL7aZZ6nBcZcJ1wdvc7m69T8BY6lOVDia9AZ2aRZiA0JoZK3LG3q26QmISUm155vR//VPHn9Vf+U05ErDlm8zeoRCzWvsft8IyilcAil9bDWqfuJdKIyr4AqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZKh6dLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OGHkcqbc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZKh6dLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OGHkcqbc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6M3x871506
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1X1J8ZyXkRHKdEq2wBt4VP7r5zv/sVg/7OA6+cgIoDw=; b=dZKh6dLFqeWo0jIk
	PRhEfsXansJ/wg9bcxXj3Qvlz56hSSKAQ5IWq1SgXs2v4iFayIOCLwTPRWzOHeQ5
	Ro0BxumPoC34ZZ298FNcmGYhasjQaCh82zljw5zPRiINSVzQMC9vub2HSC72f99U
	ymd65SOyJ8TATtxM+CKpkD+XLhsZd8Az1sUzc0WXqTLGMwx2JTHI1zWhkgo7MKOo
	+Wop0VNZVZAUs0f0rAZ+cR/LjcmktPcU8vQZC2bzNb1RU4m/Du9cFUSgCegvmjjG
	7TKOvnMk2QmLm1BIsUMlsPuLmba7Brtpp2JYlcM4mCXZ5vlKxDze1qQ+em6tV6b/
	W0NFzA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8rde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:02:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so2016118a12.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783692163; x=1784296963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1X1J8ZyXkRHKdEq2wBt4VP7r5zv/sVg/7OA6+cgIoDw=;
        b=OGHkcqbcrImYti8ym4+OZwQvBtisXpsVcTMtnPuM3+pH6zDWfHh2CR7Udjk0YWxrLz
         SbcqT2LvlbZFanRPOQVszgGwbo8wnQTSwkj+J1dV81jVlGgNqbHua0ovLkMa/4xjmvpa
         hbM5ZElGrJ40E7aUtmnMnMHG6HKhpV0TB6Dv4/KyM/3xmpoOTm8ItPpxwvBxHQaW68TF
         L6vZIUlgqNOps1fl8MUriNq0HrorAixJNzSQ9is6Dncg+Yn019lmdx/02+t8H4tL1RgV
         ATSjsfzkGmp/10WgoZ54hEScsdVJyx8HRGbPoKWp/kGtJZgFKv1fXIV2uY2z7PCYXb8Y
         X4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692163; x=1784296963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1X1J8ZyXkRHKdEq2wBt4VP7r5zv/sVg/7OA6+cgIoDw=;
        b=O7bvvIx7ctLc7FKOBU9AUJTIBV+WFyl1FB5IVyJIEtv328eOeiVjbi04+9wMpko2Qr
         5E2LcyA/lvBocom6KoqvDzis795Qss5r/TSRl9hHBl62zk5nbtzVNKoXCn7N+u9gqAxN
         U0STDJ+bIV20yP3it861I/yw8qHYxAlSAJQqGvp8QgdbXsU+9gYGfO3VqOpd/bv2Z/th
         aNCvTK1oB2yLorxwU+kWqR2H42fmf09PA4lnuo7CqMqafzb3U2eHUJrXRn659dQHOAMt
         +E/GfF8iBL06y+hCPcTOQbPaErPt1rjjSF8TcN+GWgpW/IIRSy+dtfKCqJqursB7/weR
         w3mw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4iwPQYeNmZFfQUMwf0KI5+nxXoc7qB2lOMAh/GvSxfY7OWFhlMR0aT5KIyRb1F4R++yaoBZRUPK+X@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg93fdzWfDGY4FRNyNL6ddyI+63yxgnPpBNfvfaNorSgfh3WYk
	0JRfnjihrgYtvq+4la//S5lgPGn3c6yECcPUM76ukoX+qzJm49QxNebvwMr2wK4VMdoVIsW6ahY
	rJGCZhl4QZScbj2sTmc2efOWyhoI0ioJ9ued9+Hf0/MWxI/2sfga1jMIi8A8wiKZE
X-Gm-Gg: AfdE7cmjxmpK6dz+E7n+z2H7CJbvOqxJwxQwjXcPROXLK5r/DHGUkkKQ2hqP4TT5V3N
	vqB7AyzoKEncwQ6cUV//OjNArNcCWN0XUWOhU1NC5MqmgrqBbIE7/lFQCchmujkjby1X+lSEydx
	qBYllHZL6m4+Cvaj2lFI7tyn1mEF5LNjs6zwh0dschFKnA7GNO47YZD60fo5IjYmKu/ZPF0XIHi
	YTsF9y1KoobMrhvjD4yACdsvYmsCnEv7fVtzacSHggyFftXgExkNbxZ7Jw8gl7vRrD5mY6hcBNj
	yC6/lQ+NMZfdxogIgZSQhioG9NfzL8X0GLBfsrAYEwTY/4fpQLPUCJ+mP+8Sez8CbHDdCTzXhW9
	InByPRYS5dXn4QGCjFi/yAVv5TrxF85iDC2amaH43TDZF
X-Received: by 2002:a05:6a21:a95:b0:3bf:6c08:fb9d with SMTP id adf61e73a8af0-3c0bcead1b1mr14744750637.49.1783692163381;
        Fri, 10 Jul 2026 07:02:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:a95:b0:3bf:6c08:fb9d with SMTP id adf61e73a8af0-3c0bcead1b1mr14744716637.49.1783692162913;
        Fri, 10 Jul 2026 07:02:42 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm74944468c88.14.2026.07.10.07.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:02:41 -0700 (PDT)
Message-ID: <95a091d8-1b6b-4510-838f-2cd26ad54eff@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 19:32:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <7GAZnP6jPoRrcDnaVzeaB98cONLhtvbiEXV1yD5MJJrA9pCnC9lmlSiCGA8vlDezSXADjmFiqo3ZdClO5SxCFA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <c5d190dc-1ba8-4cdf-ad8d-2f86fef4c93f@kernel.org>
 <JSezSF-U8ovzmiyYmssD6k5kLWpRmD9rhrVrKPD1NLY5xKvjkGwoNBtuKpc8t8LhkFj4TSb9T8-gUiOXny-VWw==@protonmail.internalid>
 <f0fa6acb-2d70-4154-96e0-09e88af129e3@oss.qualcomm.com>
 <1c652464-32b7-4411-8ed2-2885234513cc@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <1c652464-32b7-4411-8ed2-2885234513cc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QZ7BpjYeVjQ670Soq1jAELvRpXnwqZZZ
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50fb84 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=BWZkUK8neK37NLIOuVAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzOSBTYWx0ZWRfX0DGF8XMTR6FJ
 Z+zt0iQPYTSm52oOOl5kkKUDj07aMmsIbhixkKargNYNXl5CYyxojM8GWVfckkhyDSX8MLXjVqg
 MYz3qHvoE/8Yafyrvf8M81D85pzxYpY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzOSBTYWx0ZWRfX1+t/TV75cfDX
 sQMkD36Qd8UVk0ksXP/l6nXttCj8AP7UbSn4N6e1hchLUjtmNdooHIFC6F5N2LnINBbBhon+VaI
 yH3vortjgYIii7m+Q7OOzCtDOpbEXB8P46glzMgdfls/orKIJSmGXbJGBRcDg8H9CXmr7wDe5l6
 /SPG15eDWZIIBN/HK6HIr/+ogwFpJHvU/7q4t4nGEO7LbopgORP7Zi5nt1AYQctrCa4z3qJyCKc
 4By+MVxe1xLbqf9mJuHcvoEkPVzT1MxolbsAsdhTdJQrwyBc419ljIyuo1dvbtNnqScoXUHcsyz
 wwcTktD/ibM0pl+0TL9qIxAuir67NIxlrYGzr/TtfQKp/ENDmuW4TtaaA2oHjFfmSKe0jGnVbv7
 sVuGsZEq08vmcztFBc6chuu3r2HSHwAJKLx78xHl6M6r5poRtlWCiT8gru8B6GHx2252vWfFsep
 8phfSph0DtXDpWQFbfQ==
X-Proofpoint-GUID: QZ7BpjYeVjQ670Soq1jAELvRpXnwqZZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100139


On 7/10/2026 7:08 PM, Bryan O'Donoghue wrote:
> On 10/07/2026 14:36, Vikash Garodia wrote:
>>> What's the addressable range with sub-nodes ?
>>>
>>> The original problem you were trying to solve was the total addressable
>>> size - this other problem here segmenting the linear allocation space is
>>> adjacent but not the same thing.
>>>
>>> Without digging through all of the patches here - my question is does
>>> the original sub-node addressable space problem get resolved in your
>>> proposal here ?
>> The proposal solves both the problem we have so far - total addressable
>> size as well as which segment (or range) in that is_not_ addressable.
> 
> So if I can distill this.
> 
> You're proposing two objects in the DT one for each relevant IOMMU SID 
> and then the driver will register two different devices to get the full 
> range addresses ?

yes, alongwith the _non_ addressable range specific to that object, to 
avoid the device crash.
> 
> ---
> bod

