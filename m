Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783046;
	b=TFsgpuK0USFGmfRXL8qHW2gc5SfkGCsqXX2IJw4wHbEEd85E19KUZR8CuusH9Lwi1NDA
	 QbSvHCov2iHboaki/7zZ+hH9zrseMCVkxZGBP/f0LOoYWCKgrRIVfMJQRSG8BRoMi03fV
	 W7BH9yyh4FfKMGPAEthfHKiKCO3hYLRnLj/jfLJ4XCzROgJCQOjWR/7MBNJgwOgnGxR9c
	 F/5Y29VwBQf98QWR6UHE2K6MMUlq4MVV8+F3wCPJKg1157oTAGli0AldcDHJSqjDS6kNt
	 gIxZy470nZ2To1GU/QrHlJS3bigJulekVAbPqubgNwbN0+jEgiApIEuppDNm9H5AIFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
	b=rvJPWLnXqlT5w9/Um2YEd/z0u27+PPGa8vTSwaz2WVAF4zDypX0FNrj8L3Pm0O15Diq5
	 GJwszYOML5FFDaFAh0Iz2RIsWf+ZL0WJHIJ55B93ViBRGPFGa7qUKNW/La4BzgaEPchQy
	 1Jl2lnvQppNa3+32lI2nzgs76NdIEzUo/Aql6GPgG15o09cZ3NS1h2nzm2K9rY9Yzl7CL
	 hGbgp3zb1qPUEoMiR0xlT0ApNjG6e7bv16ducf1WQ/yKX2EffLmua/VSJ2bi6R9+4p6w1
	 BN5+5kb8P4VwJHWR+3YIx8IcwYdI4viCPgeS2RWLitCJzvwrfien/RDa04n7sbynyzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fdr+95ZZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5VaYGCt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9D606A333
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 09:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC9D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fdr+95ZZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5VaYGCt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KLfY918413
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 09:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=; b=Fdr+95ZZqnMfP/IH
	BnG2c1HLLaVV+UjNfyYVQdNDDJVIVuHSP8kHyTAdWV1dvmQm64sBl0+QeCq/KitV
	iGfAmKluAP0UAj8XlFq6Bq1UAYlDVgVwYnqe+bG8ftzd8A4ekcnV6y1tTYoBuVBV
	jptT0/f5+tNbkf4M/Cru+n9/0Tjj3k4igPUr1AZhnVTB4oEkXWQbe+fgzIll6E65
	DdWgqD9XajqIG/Zk2eEO4K98VDh81zksl8+aCMSi7AzWbbNXUxX7+37F/gB4Bm54
	zTdTv8Xnhl3sanaRKg0DkwUfiw9Qrqlh5X5OP3nwCjmRpwUyEfI3pPpRNkJnGEtO
	aVIIDA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg997r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 09:04:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91ca23ede8fso1092406d6.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793783044; x=1794387844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
        b=M5VaYGCttqDhVKRGgRw/IRPBFvazkbGGI76EqZ4frYuDVGpMVcv4LHbgzHBdttmHgE
         5PIuATMJmW0X3jVKATHZLDWyqfAfZK4ke7xNAxCuBlbBZyqdT2eMB7nn1v6Vy3xkx4NW
         0N+nvZB1LrvqsD3L+ICzlIqQNmIx23+hZN4L5ZIiWj8vM3n5bOCcN7qK2ccfpv9D+9v5
         yrbceO+QGtmtaSughcXkxLSpPamjmT85Ebmmd+pJhi7ijPaGepCyGBd/b2gTKf47QRmI
         V97c2LeRxX1JFr55DWgSigvf/+MsGh3Q/V4t49wh3aSPnZESEn3stmlvI0ogiCnREOH7
         KO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783044; x=1794387844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuQ+B9JkfUcZtLPB3R7ZhcX8YyKLeKZy/lDXJDIS0fs=;
        b=gWaYuDtdmCAE5vmLZsR3assypzuTAF8zJutuViNzLaDVq6A4OjKBrxSYUbop4F2TIX
         ngbL2z7McprgLn0NyZ5aBusMUyqNbNKF66Ugj+tqT8qVRu6GMBkQqGvyeMCvoLJTWBhW
         4kQ7ZduqFcJVW7sgKKjmK48xiSsvlb9E/5WMVjqDxoSBwR4K76hTwe4xrBtBY0oBWz4L
         /66Cz3bCN2gfVAm2ib43XvE4xh2J839od4k1pJREaeweoOkmhHatxHYKFBMMh+Xi1zS7
         2z+XZV0UTzBXt9DX3i33tP9C/ivjlOgmZgUWKyF5GZBhcXQjqI+D7zaSw07TWImi5vmP
         s2QQ==
X-Forwarded-Encrypted: i=1; AKwUvBywZ3sKnAZQbrdvr0+nK0MiLdTVF5AR1AjDAOrs2LeHNEAsK29jTKyivZkDe1gejvbEjUhDEqLYtr91@vger.kernel.org
X-Gm-Message-State: APuU4Z/26gVnmH48801ZqQ4Fr5tWjIfkSqLhgyzRUK15mVWYDKKSWiN7
	sN27yeqsuFCjMNQABgYZk5795kL0kXMfuFQwAIWlwlhH9uVkgB0ajezLs/7aux68cb0cIz11Ruh
	pj5SUN8pt9s6zWiPJgSSC9n1qmtbgcY+3xt5yrKXtLMcXdePr8wIAFPa7m9CIHpxg
X-Gm-Gg: AYBFou10qfIviPVrlUhi6CITi3vTSiZo5gP0itJWEJmcCRmxAls9RtkHNwaFesP9R05
	KRjUtvQO0z4sUkMjfx3qCVRXFTQpjg31voVV4UyGzAJB+mvjQcnTIq2Px/qXbj3RPl5E2zBWiWl
	zgo6u9n9bVMpL/W6dXVLinWD2WLEoK8MigVTtydwnKT1VGAscs9m18qECuY4/jw2kP+GzPXSnGN
	EcMovl67hUT+/JrqCarjy5G6m4Ri84h5paEbXvNMkavimUtTFDs2j9T1s+atahsERSnpRTz1mbg
	E9CrqBboIUR5+o3A5DO4bsx4yAx/Gv4SIaN7zpwNNcHbkIrYfyAS9oDI/jokNQEOMHI5X4TUhR1
	9VirS15Xu8gzaeRgq//7m9ZXYS1rRm2Or4RQGttt58anm2QJG/iJA9VJ/Ts+Yinaxo/4T
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr2582231185a.1.1793783044355;
        Wed, 04 Nov 2026 01:04:04 -0800 (PST)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr2582225285a.1.1793783043660;
        Wed, 04 Nov 2026 01:04:03 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac80752sm505660a12.31.2026.11.04.01.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:04:02 -0800 (PST)
Message-ID: <26bef7c3-3c5f-4f9d-a9fe-bde9607e532c@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:04:00 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
 <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeaf505 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SrN3rVSTMKwwy_TTx0UA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ju_cHO-zZyD3CZOgT0HGV7s-LEcl-Ova
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX3GyRIUNfX2Z2
 LLQuZ+AyWc7E0dJuh+WsuFKnpFCDBzRViaMKukKLsVEMdw4b2Leu3EFX3NY9Y1/bc2yvufUjxNl
 bEIYAnhXP7yVD6SOXDKNbjJCDXkpyVAn9Cw7DloXzmqYpexb8AChzTfL3wfa78vChCAtILVMoir
 UHm4j3olFeemKoFVJBfIYUsnPQApEMGtnl4IWRPtj1Ng+hoD0f02r2jLjvCAEAw6elQj8QKiMK2
 //Q8HCieU1RzGy0a5IkltpX8jiWbuoj5m+QJQtq3PpGvcHR1X9l5uadBufNC1kpDryIMfxPsQ/R
 cH5LNW+IuUTp3Oz0RHXB7T8KpfG6MdZwBxtvvLI6wG4k+fb9cUSVYhfuVoutm/IK9F50xWhOUkI
 zwW9kK0QXor+xRkRRG6krW6y9SOjKXIAvydvN7R/rt5ObBli8Ku01SEgdWyZ+yyTHDt8P5rEh1Z
 o3F80ot8/BV5ZMjP2kw==
X-Proofpoint-GUID: ju_cHO-zZyD3CZOgT0HGV7s-LEcl-Ova
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX3ZAD54/i4z4l
 85onvCfQ170m1dqOmJNNHJKIufYADaUBNu1WeRmZd15pQ2OIZwX39yJVPDpnzfxZcrVlfRoqXED
 UgPQjEFIXcQPmBj5QAMY5AARm7QPQSo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040035

On 11/4/26 9:42 AM, Shawn Guo wrote:
> On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
>> On 11/4/26 8:59 AM, Shawn Guo wrote:
>>> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
>>>> On 11/1/26 9:04 AM, Shawn Guo wrote:
>>>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>>>
>>>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
>>>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
>>>>> and DMA queues.
>>>>>
>>>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +	phys = <&serdes0>;
>>>>> +	phy-names = "serdes";
>>>>
>>>> I believe this holds for both GearVM and embedded, so you can move
>>>> it to the common DTSI
>>>
>>> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
>>> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
>>> PLL/RX/TX programming driven by an SCMI perf domain whose level is
>>> the link speed.
>>
>> Right, but I meant the assignment to the EMACs specifically
> 
> The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
> variants. But the serdes nodes only exist in nord-embedded.dtsi, since
> GearVM doesn't expose the PHY to Linux. Or am I missing your point
> completely?

No, I was just completely sure that the nodes exist in the gvm one too
because it seems like they do on lemans:

https://lore.kernel.org/linux-arm-msm/20261103-sa8255p-eth-phy-v18-1-b00cc2fa0404@oss.qualcomm.com/

Konrad
