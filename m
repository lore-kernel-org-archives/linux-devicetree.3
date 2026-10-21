Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590802;
	b=hAK6jk4W65JvkFPMrx+atZiCUovS2wH5Y+QJEp6C4bw+fLwoRcP1xAdUgC2Opc3p/pKX
	 ofQIWMzN/59opnyomwl2uGdd+dPLDPXiECcYAQZjkP1Hl6kvm9qbOnRl6lmRE4uqlBdA4
	 3BW6/4i2RRDY0re2x/fuyFIU8/81BHfDHzVu32j2YXHVzyQHNt6J6CG6SH63BXvw/FIGF
	 pjVnu+uNlEf1Co3yJMIoL8vMTTSHrTJ2u8OdHHcfe8nDF6g1igJal4t1kdW8FfAQzWib0
	 ZR8Ckjpb8IUlKX1rc6s9lv4LXHecMChyF8XaiJ/vDZvSwANwZoYjORIxm23LfiwYi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
	b=eIyPN2JKBslxYhF7+saoVXYviItVYZcgtQrrfh+y6g8xWwzIDHpzN/R91vkJJMT9DydF
	 qyoqf6lwDIqQOlIXi8zKNZMryTNYib859t7KUuYeV2NW/ptJHDP0wHPGg2bwIGSPmPX/C
	 e4eGXEe44yuaUky/ymZm/JlHppIWF4+FmCB+LYpkGhjVD/+sWYBHjO6YkEkCyO8vWa9Nt
	 lNVaT5b+Kgswc83IY3yHK/bC126RLOICZiuCU80LpKp5I+XJNyXW28Leq0EeL2KFrb5IM
	 QGviwCYGTueyt9cMTowBGpkES/HKSBg+biz75lnWmC5ce/oLlQPzXPmH587cbw6++pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPkk6EX1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDEzQwaK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DEE606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31DEE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPkk6EX1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDEzQwaK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDN3f4402576
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=; b=TPkk6EX1WQGaj/YI
	C7L0wtDsRhlQPHtZU3CG/xkovzlHbC6Ksv5GcfSlRi/BfKoCgvPSYCOAojzuqxh0
	TYrSHKquaaq8ZwAj4kiRkG68picR23UuJOchkMRHOAbpoqOtvlchOd+j70jURc1w
	z5NSVpq+x9XF0/GyHzXxO4bfCguOM+FWMYEXkVoDeZCy5GkAgsZpCaZ3/baiROXM
	ujA4rApF6Y0c0ZYUpRRyz0UZbTKxuNY/BtjZvNyqfAaXm/+KWnDQ/ASlLhV1OQeJ
	P2WT1WuCI+GgcJGQrm2TOGTu1+g4urBlE5bLl1lk5SGlGW9hdBm7EUyB4nTWCE16
	WIFWQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr45x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:53:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so17795085a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590795; x=1793195595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
        b=LDEzQwaK03Z4D3OYk1JHT+i07SnUOmrqE5i0ljGOeTiqkSf01v23RVNqGRHC/IZsGA
         1J/0Nhfu9ZPSTAKiBIpFq32nyRxTNdSJkyZy/s4e+oaanX/5TcTUEs55dfHHy1jVvqze
         1GVvhVYK0Yh95C0UkaT6Ds0sjzA9yIw+kS6KjYpy3lPA1Cb/MexEUkgvj3jzmbx/ICxj
         7rhTbiy2nqg18X1tYpIPgjAkzS31YMcNdldx3TBCeNS2Ib9Ic7NVQCWTGTKB2gNS1iMF
         9r2MBlxnw6Cy7f3NRV3RRAg2hqrbwvyPEqnSwVNbS1agk9kT9fGFOBuTAWLjV5JLahfm
         DzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590795; x=1793195595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cA3qliSiZOiduXdaWhA7g69m50PQzr3b+HkLCh/HevA=;
        b=QOzj4Bu9n/hdLIeB/tk6gqgCr9nxs8H2I94FCpe5DLZZrHTkrCdBcuFDzVYElLsA4B
         7yh/Yll7GxlCjgXR0DyMHFKdInlCkKl7B8JLUSG7yR7N6WT0Kdh68A03j5lZ10TEdCfv
         8P+BlYFrAR4xJyQ4SW2JxGqrs5RW/gAk4bnDSvJZg+XG4ArWeMhAFFOYzPM8GxDvhiug
         TLDvmyGgvnsHle8aiXMScTWJDrXT/7+QBBQk1HUbTKXoZ6kTecJx3xCuAzWHEe67g7eK
         uiq9FIgmWzsfiuC3EmNuxKsGU/rbzpoOA74em+Nwo2D0glDAgPd+yaw760EL3Ece0DJ2
         sU0g==
X-Forwarded-Encrypted: i=1; AKwUvBy4elx9yR3D74OTTDxPvAzBcaAZn+R/YCUPrRsuHLWluTEwkuPCuPLa5xnGg/KepRDcts+z1/cJVM+u@vger.kernel.org
X-Gm-Message-State: AFq9FYIYrffaZkrJRsLsiDW4uBvq5kWzOl229Rq2CmD+i1xMSafoEJao
	YlYGC4RuutNz9GqKV3uZY9Q2GKXgZ1uomWcnt5nNZWbmL1hZwuAZZl4cwXo8HQLmrmt1cKGR59G
	T/+NbvvhuRkGI/Wce2AwP1pk30S7nouCJWCkRoKhqkdqe9boWekYeI7AZ4SRncjqA
X-Gm-Gg: AYBFou0AIYPkNLOt3ndarp8aKoF6jHQCsbx1W2q1MGglFn/xpfIpTsFHy/Unv6iP/qs
	wN6Uu5nwtRG2fYv6iDfSB5itnkLG81Iqpq28Lx225ACvhq8qIncsnVoy4fKm2YkgeAXLpjE6PlT
	1vxuzHAwzFBVTmtnDVCII8GoTG5ypx1RsZiPGvDX8OrIUpe3nzgAqnXyzDiU4r6UG74Ix9smXvV
	CAKAlmletCduwi1xZm5ZcUYUs1hm0OxsiBzwIgkHftgb1Z1DbWyAEDvczFcldhb2iHTioj80oFI
	SYWtuAhZnxjP2duDy6GqvgunrX6dXuAg8YQSEDdDWqIIXhn1qwtQA5H6yJ3xmaAPn59LbPZOhea
	G3lEqZG8WLAxS1Jpl18Y0Cw==
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr527537385a.3.1792590795184;
        Wed, 21 Oct 2026 06:53:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr527528085a.3.1792590794286;
        Wed, 21 Oct 2026 06:53:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm884023a12.27.2026.10.21.06.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:53:13 -0700 (PDT)
Message-ID: <b667b008-2d2c-4da8-8b1c-3b24b351ea64@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:53:11 +0200
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
Subject: Re: [PATCH 14/38] arm: dts: qcom: apq8064: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@axis.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c1886d808858a195ec78425b293b2ccd3756cfaf.1790892852.git.waqar.hameed@axis.com>
 <f2bde571-89d2-40c7-9ff6-c23a56b3dacd@oss.qualcomm.com>
 <pndo6ctn350.a.out@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pndo6ctn350.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Lmnl8MkO-edNMJ51UMC-Ue6bEJQi1YEw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX62JFGy02Ivc5
 mpRBTeihgFXPSbg84JySOxGhrRoyAIeyvMTeKcT5g8ipVRKlcuekZuTPeN/bJRqFDyozy1m3/vD
 8Hv0VmTdcYtzIKfvtcYTvVIDxSzi0Z8=
X-Proofpoint-GUID: Lmnl8MkO-edNMJ51UMC-Ue6bEJQi1YEw
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8c3cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8 a=DkxrGzj7WmFQ9Z13Ee8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX70STgL77sjTE
 75qcYIx4MHJpHuj2uF2D98Yt7LQm7GXmtKXGAGY+8JpyoOwnr+hRJMaSaqV6VVMZpQ/ZjzSYNmZ
 aP3U2J+fQMG2cUqrkNsgte/3o6l2zgiazzj6giSu6z9bji4MoxGzw9ZppMNTeiyTKUohhhBEhZe
 fNhp66BMKzVaKJ0DoEnWMhSISrjzQYRUBUZgHdsjfOBcW+sccym/E5LDSJJU682qrnCH4hmF6JN
 gizivfQWLtGIzpYaQbOP9F6K+78M4d14OXnzuKqvBTm05Uqgv/sDGMDcn43OIT/fKVtExfeUzcY
 XnM06p9Ii7sPFKC4TjblSJ3pxG3ZhF6Sptn9z4V2L+Z+C57VDLU1e3Lll7NAnee72dxMuqOjQfI
 5xVvPyfroELPh+MaiLf8EEL4YQruhGyH3oD28QfHEWVsgVyJ0Ghi6DFHJ6tW4GK0vVjam87MoDe
 m7aPkRN9Kf94CwGOGUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/16/26 4:14 PM, Waqar Hameed wrote:
> On Mon, Oct 12, 2026 at 17:52 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>>> Multiple property data on a newline should be aligned with the first one
>>> or properly indented with tabs. Found/fixed with dtfmt (Devicetree
>>> Source formatter).
>>>
>>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>>> ---

[...]

> Which maybe is more clean than allowing the first string to overflow 100
> chars and aligning others to that one:
> 
> 	clock-names = "corecorecorecorecorecorecorecorecorecorecorecorecorecorecore",
> 		      "iface",
> 		      "mem",
> 		      "mem_iface";
> 
> So the question is if we should either "try to fit within 100 chars, by
> adding newline after `=`" or "don't care about property data longer that
> 100 chars, always start first one after `=` on the same line". The
> latter one is of course much easier to implement :)

I have an ultrawide monitor so we can overflow waaay above 100 :D

But more seriously, between the low likelihood of this happening and
the presumed disadvantage of having to scroll sideways but still
being able to read without jumping to a different (line, col) with
your eyesight, letting super long properties overflow seems OK to
me.

Let's see if others agree

Konrad
