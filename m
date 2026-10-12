Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FC4746A9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818929; cv=none; b=DuIinCvDv8/sgUuYECrvhJwmP5JRL5W9TZdcy+XiX5PsigceqlGZeaqawt36XeTmLWaRvq9GKYsLgiDtMt1WOxN8IJFkfVhHjfUMnTl+TgdzxjF6kwiexvnrPuEKJschLoCraZHhJVMxVhZ78RMmFPUXc16fyxPiMtRtXe4uKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818929; c=relaxed/simple;
	bh=xRoJhJ1AvQpHt61hi2ZYmyap1RubXShFWJ+UOKcfqj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzNFGBK8e+1LYiYemD19DGfFfe7yqq1kRvuZg4Akmx3Sbr1HijacuWxVy92auLdzvPxykpPmSfB96V0WmFo/7cNd+UT1axdhZg2nCEdSXICR6vK7070p7KsFPMGremeGC9aiL9SkAPSgxV57XA+Wj3VfbIg6BUTTdbCIfU2/x9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mkmsDk3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAFSokU3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mkmsDk3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAFSokU3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Gvv1236392
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=; b=mkmsDk3t7JXGj9NW
	GiiirFEh6sLpZ5gc3S+7IJ8NPIXF7YyQLdsRlp/yFZbXjrKkujjcGq3+2/kyjBVl
	yEDSjYUtfOi1k0bxlssUJ5w3tclmYpDgG8WosdL6Xul+tvBrBDjqpe/0CTnJ1Qra
	goGtzMyQ/BG/SGXhtczwg6cdCGmTxrL1qZOPw9lzVXLXEZElbfq9sZdohMKSA54w
	b6Bj6WRDOZO7L5Q426uwxD+EvPtFMjwlB89tBBAc6re7Qy4jHRjiIl1WnegB10LX
	WVjlWiaRFCLXbPsUgEBPl+n/Fb77p9g/9cPLQ/Rxd7MIfbgDeS3KGQfbCpHE0XsF
	+vpSOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkpx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:28:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc19d8e59so14403185a.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818925; x=1792423725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=GAFSokU3ptguN7d3ejsXqWFWVMvNPsQ94rU/VEwBy15LnT+ILm9KjJM7+1dC8qxRpU
         TNsm+hqmUgx6lLI1iit7XiEpJ0bn/yuoExRQ9zoOeMYcnVqIi6Ki7DfN2YtBwdIutzoQ
         AE9nlLW9glet+m38cJlwbT0xRyTRsvlDd0fWvq5wcbo508OO0IaybgeWbEg+m0DoW6A/
         XZFM9x5mZsnRo4nGleZbKFx8RRUV8q7Ld4tt3mvNwvs/M/Am9zsg4LZ86MTjqjhM9TxC
         6AhYYQPoIat0vvtOcA/tvqhwn0dMOOYsGbH7zr0Vi/Rrn5vKx+657KkBFuFRP26G3Ip/
         jPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818925; x=1792423725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=WgCfzjNzUmfAf/4HTMWB8ENbSdDuVnv+ZzmLgdmSgWBKZ9urgjHNwhPOnYmZROXKPu
         qhlxU73zQIblWT18mexIHBSpnhpzTaHTSCjUwXzZPLYIm4FbDuA3AEYHhihGqDtBamNg
         P3SRZbLOXlM/EUP2x+j1cCpExzeGzOmXjxQGUpU4sJzOp+wyCtw4K816QbILJR/BuTUb
         Ro+dx3P55brbyl0d2YySr4KFx9ufFpL4gmnC6cyMRWYZGY62x1B/H8a3ZVgbv+PRcqXc
         v51D1rN9AEWdAYHiuF6DaeP0I824DP8yxGMqVtWtbO7Kq/JohpNDQZmqzCOKih8Yn768
         s4xw==
X-Forwarded-Encrypted: i=1; AKwUvBw56SEUJDVHltNvT/COZCkEVX+8mdnaUe7xW2CeQe3qSHESXE172z0Xw644RjByyFCc0fwMPMg8ryQV@vger.kernel.org
X-Gm-Message-State: AFq9FYJtfWPC8crmpvmN3l5LQ86JUa9iP+CV8bIqU/eo8aj1korErcWK
	BgADVQQFO2hnc7O17Np/DAMsadWMa5/T2IIJLKSUZZPwKauBo5AIC4+gJ7WDvfdIxW9PxGbN5/U
	rGQJcxfEsqNXSsKmHmLh69Hj+QAQwfGJQ/0RlgWZBMoTfDxDqGsR7iPdVFEsN4smz
X-Gm-Gg: AYBFou1pJ7y8SEHVG4aD5sJTkS18iPqNKMGHdqFYVWS10yQH113O0uumHpUgmpJMt+l
	7IZCiVu0ucDd6ECZbdEgoWK/quf1epbTuY2SQhxzX6x4QEt/g4nfrDLqhJ+HM5ng24JucqkXNPz
	/NI0gro4T7GetT1gUZB94tU5qj3FY1B/nlyPQzTRhmOj1owulhUIOg3u+U2DL5jADbjffdMl+ZK
	8hTDENuBYwigZqMtMmDHBLSAMJ86ZyvdcyD2yD0hxKzr4yzOUOue3ZmGSVWNZMS+74NQCKdPnqJ
	kCdclBmsQF0vDBu9nX0yKFMsYcI52MRm/SSYcn4Q/zX83ad/qysFchmbkEbW71mjk3wGIqf4faE
	AIIPfwbDpym9ZUkcSI+y4DA==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr1934178985a.6.1791818925159;
        Mon, 12 Oct 2026 08:28:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr1934173285a.6.1791818924627;
        Mon, 12 Oct 2026 08:28:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm475916266b.65.2026.10.12.08.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:28:43 -0700 (PDT)
Message-ID: <fb6f9a49-e9da-4650-9b28-06932034aabd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:28:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/38] arm: dts: qcom: msm8226: Add space between
 OR-operator
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <9be1ad0392168b91389ce8d6a896d8be6173aea0.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9be1ad0392168b91389ce8d6a896d8be6173aea0.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX3Zce/UNdf7qw
 uESz5Ecqk8t4DsU09R8Kh5OtzEJmBzvG8UTGO046aRIBjEM6xsq77I1sDbP8Cl9RMhVR1Olsrcj
 Qgs1zIQfFiF6zd70RTM+1SpM+U7oR/Ke4Au/nZCYgvEgx+p8uK22d9+rRM5bRL+ZWq0TeWtIObJ
 JDvY7nWcVUSZDrAaqPtSuJ31qDIhOJoIfcrin3J5zwFQHDD2Sb6DThZnUepSgJOZAWUamfyMav5
 EYT3XlNy4Mzhyvhal2aDYzlNWC1EorB7AD4b/FVlbQiFRnSKrYEBdNvBoyv1iscS+mDdGOSybHD
 +C4y5GiI7lrVOIBHcWcm8rhyF6ZiZBpRQUo2anTpZw/aIn3GFDEKCWrtqM/lKdFskJZRtQCrZAw
 B5jQXPOo/ZXCU33WWmb9XRI1nPgc12KBN3nQr63gkLot3GZd7C440FPjmuQOjQpK8gNrAlIGHTK
 2BeS10LlEhT2v2yG4dA==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accfcad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Ae01CA2AY_RmMo-c5YcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: 4-NsSHPPaDhm7ngjMDa-hC_bSuCQgIxu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX/OREF+6XuIFc
 fzJvoy8w9xLHy0WnIyG+Qwo0pznorOCI31CMRo0KridVuYIe/0NJsEtMBHrNC9WKuo3ASDyEkcE
 ZDePmf6apjMCOh7e6C20wmSluGuFdIQ=
X-Proofpoint-ORIG-GUID: 4-NsSHPPaDhm7ngjMDa-hC_bSuCQgIxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a space between binary operators. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
