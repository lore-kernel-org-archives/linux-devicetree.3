Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963714;
	b=RoJw9szBQIpPtokroM9NpfU8rC296LVjJAt2LaccFVknHUrEBv5St/T6SasHgl9qHW/G
	 SPMGURJuUBNAVZhNrx/9Jwz8YN3Nqm/WXryhVpts2KNn1v6PDYuFUrAUa6fo3nDFI/g6v
	 7GolBoQxE1kdBHCLARgEjODvkDdfJ2iIricQuevZm1n+qNZey77djRuYFFeAtFafUavh7
	 OZxPptxVFtnK2NWe3CzOfSdWabaNhV17xNwzkXFi1W+4qwBHpP0dhKprj5VIfUyTAcuHP
	 oT+TyjY47vyNeEh/Sh82j9ofeD0dSDRtXM9w6w2EeJ9voiBCQeOxR2YHosLi/pmXgEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
	b=LoIZr4EJfX/zXC89HB6qe1y9yxroyV9KyVfhIzRw/9KvEF3WUi7Bb2GubRn2htvNBq1s
	 AD3UUOzVglb/HykSGbSxh29yh+8J3UL5hg2+3HzefdRWDbjVlZkUiAkkKY02n1bWfk9oH
	 20RNUdccT0yxTL3cHLeXf3tYRkjdisqdd8+7QH2mJ+/64PmBvUq4uN5RLJrR+i9u9Ifsb
	 8OU1iX4pYDkKmt3BMjqkzYTdY7NyWveRIAlyMcVIXhAjIWxLutWmCAYyFzCXN6Vk3koLk
	 cCUXNtbcv8vNLYMpzm2TM3jKNHnhuDwTIcr1ASRv3cgDpjz0gCp7VGsAzpnmDBpj32A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0YFG1cB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEDNrDHv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B6606D80B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 182B6606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0YFG1cB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CEDNrDHv
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APAlf3129334
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 11:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=; b=G0YFG1cB8BD0M8Eg
	KJam0otrK0ilvJFSoOBlFeo7fX9Q+rvSsp47ugNN2pn6pKgiGXoIhiKYCxINNrN0
	O3aUHcttAkRZiKlFKZoM8k+Jnjz4pRqDOYh9eRtN/sD65dh/RzEhmkavRONjp9ka
	aqF+yEdehdLbBSJTBmoJgxb+e36i8CtKSd4BMUWJ7TkNZbHJGOAR209GX8FxqG4r
	tMxP/kMhnFsWJQgdeHPZFmLPMrcsr41Jl1sm89oCE8almyAMCPnbZ/c3JLQ67F9A
	xtnikCQFFmxfq5lBf3tFeBFK2yO5y7Ldx8cxpXtj7SppWWGPC3032R8AZQhIlkZw
	T3LLRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9jfu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 11:15:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530cd3dff25so1024431cf.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 03:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793963712; x=1794568512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
        b=CEDNrDHvgPLPyhz5kxDuIe+vbg7wZZ9wIyi1k1fehTdLVzeZyClATl2Zly/CwGZEB+
         5BxxXslItcTFCqgfd0gtFu8S1tz5TuP0Z+YPAiUgMSM9UZGv7b5cTwho6H2YKPiFGYM0
         6HwTQmYH5E1qs6COdJsBV3PPlGJVRwSfx9WIHeDr8JGww5QdmNRCucfGpTQvtDA6nR0P
         I1zkvPRhgEu+1NKXDpIyZOL/U3lCMYkezC1FIMnD+FGumIceYRYIIi6/aZAjiOMdASXU
         v/+QLZZi+p2hS+AqjbKzTyYtazBp2xkzv3HpSr5cCbhwVxSeqPU6xZqQW9oY40KW1o81
         B3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963712; x=1794568512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcEImZ1lu343mk/5thA88bO3nGwk7HP4kw6Zdtry6KM=;
        b=Ewy1rJ+ds1UVgDICRs9CbynWmH6PpQBqLB9nh5+nxfatlKn/P1Vkwrr+6UMf3gqaLW
         0kqGCNziyaV8UeFJ43JYZqvuRx9HZMNxpOYvEDZWUUrpi2c5rV+3g2Y/BxwyLFiEQCVT
         cZNkVUrgobafl+4THYVG+o1+hPoW/VuYotJKP/hRKIB9iExKZ6+2IPvsUgzQp513LBy5
         zUmZgPBcTX+VuJG8PJk+Tv5MbvvdKAtRpSKfcwKprMVxev78pfcWKRWIjPblxrRA9gYK
         xe0XWdDW+Lrg9hL0MSu3xw/X0ThgZqqXArxvSSUj5TK4FXjNWKJalrpwwEWRF0GNNPld
         fz+g==
X-Forwarded-Encrypted: i=1; AKwUvBzC54G6RUbJgV8rmphkjXVKhvpEFNG2S3KAzr5V7c3UCoI0k5ni1bceuTTsmbkK8llaNndEOYznTmAA@vger.kernel.org
X-Gm-Message-State: APuU4Z9Svh/tHsURSEqINIJZrj3pjqwdS2ljgtEWUEmAFI4ps9OVR37v
	GquvCOyKvJEPYmoZxqHEuH2nnscssFk+w/DQ6gHikW2Ue8o8e9NEpsTQbHzCXGmWE0KznlJo+DU
	Cxy9HgDMm0VNP8wdIS8+dscFzb40HW0jU6vQpONwpoFTJI2jI0o9UyZHEbCVAErea
X-Gm-Gg: AYBFou3nhciIop+6Ca1yo9Z2xWYun1YTPKgvB2cNeKABrztu1j+6pmaBeivA4VUzlPi
	8w9FJ/zMAanQFRBqWvvaaI7bDjWi1UrstFAB1mRlG76T+JtsILoS3bbJOwWX4jlVdHJuhTb/5Jo
	dSj8lstCZBem9WGEV0OiSiLE8X9D9QpP1JMfoQgZUxFg7eueOFkEo7NOqVKP30YlahC8TB0JAot
	mwR0DrjnA5DRoq1yaPSkEl9Fvq8CxX1I2GDtTO3NQvZXxYqAyd7EfkX0RKansICo4a8x30EMZyq
	xr+VNW8vl7H6Alup94gTe6uXhdZdNxi3m7grFQzxPS5gAUgxOuAJtJmisQXHuT5Rfwxo2Iw7BVV
	bh83rOPnxTyq5ySmWlabJUz0C/nM5W9LahYVHNnrve3d7X0HNtm70Jo09ZqfoKIyVu8HYbw==
X-Received: by 2002:ac8:7249:0:b0:54c:db46:fb37 with SMTP id d75a77b69052e-54e102effb3mr35476381cf.2.1793963712284;
        Fri, 06 Nov 2026 03:15:12 -0800 (PST)
X-Received: by 2002:ac8:7249:0:b0:54c:db46:fb37 with SMTP id d75a77b69052e-54e102effb3mr35475771cf.2.1793963711544;
        Fri, 06 Nov 2026 03:15:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ac7ddsm72549966b.8.2026.11.06.03.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:15:10 -0800 (PST)
Message-ID: <0749eb20-7cd7-4a55-ac45-fc2c616ff21d@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 12:15:06 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add RPMh sleep stats
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103-stats-v1-1-3dc062db66b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: s5jQl8jesQUXwa-N0w00HhNT1JJv9vBu
X-Proofpoint-GUID: s5jQl8jesQUXwa-N0w00HhNT1JJv9vBu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfX/Eg3z6/ZQIlJ
 Y1GKbsbsJMBOoaWoO1HwS/i6zhHM4lD8DGnM8FsMMG8RFRaT4BTZKUwFQNAqC7o8g3HHV56rzYW
 iSI2gJ8W5HLnRAn3zgFH4vMBseucxm4=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedb6c1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pdLQg-RyuLVsQZ1OIswA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0NCBTYWx0ZWRfXyBd9Y2u9ZxyX
 KxC8p42kYdl9+aENydQPvytL3HAAHa8H6nQibp4l4qKygsS1CRdqHl+YnymSL3fk9UYeLEvhQEA
 VzAJlAOkS3uLkIkKWKqKidN01gYAKyoXH5sBGMaeBMm0qXjo+kWq1Ef3lTPN1+9u3ToCQypfEQU
 ekraaobaN55QFfU6+gz4lrL6W8HUSCXGJaLYbHVQlb++JWdi9U1J1/VJVZa/qAHFkBQdWmg2YkO
 IuwacCuCszuos4F7jDq9j1p4YB8NvDFnyM2rn5ZpF2gj3bo0qtBW4DGNlmgak5ZxOkF45jNLvc7
 4WZlZX68Eu/JqWR4JFtHsINaEKYyvb+vKoRxhU1VuxhGl8tdQ1Jd3g1LG0y8gAZW62oF/MUiq25
 NJ3L0Hx2f+D39BP/ToyrHNXxW+m+ZfuCAhdM5TcR7DpgffE4HAo5uTy/ZOqw7dFi3LhqbCt9PSX
 NY+FHZj3/+Puhm508UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060044

On 11/3/26 1:51 PM, Navya Malempati wrote:
> Add RPMh stats to read low power statistics for various subsystem
> and SoC sleep modes.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
