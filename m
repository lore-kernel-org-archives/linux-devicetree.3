Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9280D47F3C0
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168663; cv=none; b=VXaQFT5H1bYRRD1Y3IeYzGvq4VPLFoinFOBBrny5bmdH3T5mb14YswZS9Teev+ft5PAsFE8KyJV9BIYW9xzkniOak0xRKUmn6y+R0HCmBK90H0wlKKQobMaR/NS9IpxPVazhPZiP7jtAZyUIIBQw0zYLOx5fwnp2e1r7acW7X4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168663; c=relaxed/simple;
	bh=jAtUvHOL+UcHTw/1yuGYltepxe1MNq2D2AIdAMygYQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndMjMPg5SEpbklFkU3vL+we7W5zD++Pz0slyeVcDNpXDJzUh/9anzBlg80eBPIr7ivKN3kZlT4W7zWyyUeQnVvgi7i4++InBRYmQGe3vMDTlJzD7eEU0p3uc5LaGIy2CrMRdtE8E/wwXRhIqhx6r/rOAkaZsTEdJ5hRc12iZqxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7z4xXkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEWjqfy2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7z4xXkA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEWjqfy2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbrx82638870
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=; b=k7z4xXkA/SZHfuhi
	vn9NYJh5Ahaxe+BXAwR8yjRZxLP4fJO9sswA51eQ1aMyN+KVgWKNMCTe9cfipXJG
	47EY/ccDUuzZ3MMae9a9+i1GRZS2jCa2UuGzOFaTEbKdusyM7JRGBiw78iQkBXrI
	Pj8hu5w1nBwa8GbTiBG0JBFKT3vDC4O0f1lQediXz8QuH8yUMXe/ZkDfyn+Pzzy0
	n/KZk7UWuwkQ0pwQ4PJMqJ25CL1sxzflSMYIQokDuC2W0cCLyn45pZGZs0QdKASh
	oV2Je+ZQvUeM6I+bo6xZ+NOQB+tJByfXS2u/YXRewmqRno/S5O11x+NSHRZJPZeI
	6AHVtA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhp3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:04:20 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4bb82497a04so99352b6e.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168660; x=1790773460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=;
        b=kEWjqfy2G6PvHxPaetag+A1fHiHfnVsS2QSSlwbx0N2I4THTv/wBirtJDvRMuIBICA
         ldABZBPPamygRBT4sGsAEfJBc91IFpGHJ6RENSb1DtaPoP3TIi94mm5bNUr+dcnT5NNm
         1C7/NjyVYIWKCdVkTOH3Q2kACIsfX+p94mHi9pj2gEORLwLV2MzsrRrpJMK+KA20u3U1
         lP1fF6Ry4Wqhj90dU7kZZ/CGO39Fcbm044hQslITRjZJ5K1tyHyEK52bs7sC+Zip0LLZ
         r6O8im6jmd+DsZyJLMmSUKx0Pt448DvVPV0aHeRK8q8I9ODN9PtkcNtASqo10Qpjl/2n
         zjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168660; x=1790773460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvBLCJ2t9221TW4KYx3Wqjeb6+sRVpVtJ6KavLSqfA0=;
        b=BLmmzFPgVkzvtuo8DTzSe/wsIk0lA+gam5BMYBf0tvcfGDFpqJyOjf+4BmxrHGTfT9
         ZRl76pHaDPNG94S0TUVNVba30xa6bSzSxbWbLCaDR4J8KZru6Q+IHDbygJYVwZhKW3zk
         OBvAAd+2NF9n9HQ5B+PvcdK1mj5SOIZH5bYxguDRr12Bm3L4DokTb12N0Iwg8tdBLycQ
         /cxToVHxwlPj+UD/3zRDrz95UrJtIJ+lwvNOXuvaSy4EGlYfLOEiibhbpfBDAqPn61hZ
         huLRNO+mUtgQfSiuufoUh1CQjzj4hUQOaZ+kK7tkhUDHddZJ6IQEdx56Xp8KSKxrKtJw
         J2vw==
X-Forwarded-Encrypted: i=1; AKwUvByTO5KwIi/NzPpnYTgZhcRGz4KQtG3LDIpkX3ozyIhEnQHl3LdJzpbdSoGuR+VqEV5KlmsqoZgkhJX/@vger.kernel.org
X-Gm-Message-State: AFuF++lPoccgTEDLeHM2Q03LSkyKGesGf7r3fJ/oqQZ4bCmfbOU2HuOU
	HguKAdtKad12SN9QlEBJDKGpr+m+R5I4iCVQLpQBG4EDfxvY3p4A2PzpHISCA5EST2vMkQ0dusN
	PiycStxj5IpI6VPyfQgOHly+edGF+YosrKdLQvPqfhOYJVeBjHQfMobZ2RY1oCRhH
X-Gm-Gg: AYBFou0vM/Z8wv9DVMsTCgB/t32mKhT/M14SJ4iWvNhYRNmAXiP1m1e+fHc5Zg7nx/7
	pTtI19StHUY3RIGwQnMdiHbo6ssRZUbj7AfMwTd97vItbVBoTXrijSPO2MaUs9s68XcV0NF/gJw
	0mO7tnKWwfIR+mGtrlx2eV1g9RIyHkDJ2D9mufcOu7ZjHuFnEKoEh0mSoObo5mJVw78AYTgq9U+
	U6dTvrDbx9OqwLLAgjknTTzg4Itqrz8iFCNcQbSX0qPQS2jSAm7VanShdGjOO+xRyoWhKI6oM32
	AzLUE07K5AVlmmavHxwfHqk8+YxLLxnnWogy72ekFxTocr1d9A9m90PHUbDnCzUkKusSD1nrXI7
	3jKRlHd0srHBRWrQils8i7n1SQ+XeWiXW
X-Received: by 2002:a05:6808:10cc:b0:495:d9fc:238a with SMTP id 5614622812f47-4d5b8ddabeamr3350295b6e.3.1790168659775;
        Wed, 23 Sep 2026 06:04:19 -0700 (PDT)
X-Received: by 2002:a05:6808:10cc:b0:495:d9fc:238a with SMTP id 5614622812f47-4d5b8ddabeamr3350248b6e.3.1790168659264;
        Wed, 23 Sep 2026 06:04:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae62dabcsm115627866b.31.2026.09.23.06.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:04:18 -0700 (PDT)
Message-ID: <ab94b4e8-7de5-40ba-9306-03c4fb18fcea@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:04:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <71e04eae-7826-4f51-bd6a-318ea1108c08@oss.qualcomm.com>
 <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e4b32a40-4432-40c0-8e57-f5602c98f096@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q1kRAZSHppq9YVwEmxGimU8h3ec5dR9S
X-Proofpoint-ORIG-GUID: q1kRAZSHppq9YVwEmxGimU8h3ec5dR9S
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3ce54 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=80cRBlfBHqb0UARuMZ4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX68MmBnX9Th3t
 m/3brAzWBxHEFoHEeb2Z4DZGJikxNI9P2Bjo6Emi0ValqPBbgwfvH0Yapsv/NDrPmXqbDa+VcDb
 5da+yghJHARcfnRojrQPmInJ3Y4m9gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfXxVm7GfT555G6
 vYfYutt2ui/s8AFT3w5Rg81EZhHhnTHpUfNjgqGXYDl0RwiSKXcrw2yBdqK3oe3CdxqdRb/9sDA
 92M1566+vZ8U/F2T7LPTUQT9vO3vcmj3BJs+y5rvj/tDzeOlWPfsp//cCZPo/9P4hrxphSDxsdb
 5r0QY90D0b8HO+pTO0Fo5dIgGZ/KgB7KjGyx4TPGi1zJvjWyr/0+HmctC/PXGdzKh22lsgA6px/
 2zYB2WFK+eJvD2acDTuBP0qcqRlJj7Z2u8SVzTrp/CuA+DoIL1qPQRvIlLhixYSfdsGZnvifdFX
 b4ThV2oAK5PRCu94rX0JEdVzM44g4p8IIPwR8aSeuwyGZQ4g0Ue2H5iOJjkQyiAmOvb6PbtwYFa
 fESd58yDX3pKdF93EtCZqcCQQanzL3r0VhhHqqe1jGzha0lHZ+2TrIYHvfM4KPLDzGcfpOdGyP4
 yqjRb65ZgieCNdFrTGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On 9/3/26 7:02 PM, David Heidelberg wrote:
> On 06/07/2026 14:00, Konrad Dybcio wrote:
>> On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Introduce support for sound card and wire two CS35L36 audio codecs for
>>> top and bottom speakers.

[...]

>> nit: 'co'dec < 'cp'u < 'p'latform
>>
>> also 'c's35l36-dai-link < `m`m1-dai-link
> 
> ... aaaand **sorting nodes** broke audio.
> 
> Moving `mm1-dai-link` behind `cs35l36-dai-link` broke the audio.
> 
> For now I'm keeping m1-dai-link at the begging and added the comment why is it there, but I guess would be nice to have this solved properly.

OK. But please take a look at what GPT told you below (I'm in no
position to suggest what is best) since the automatic style checker
will probably be deployed at some point and may mess with this..

Konrad
