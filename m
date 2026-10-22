Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676791;
	b=TNccDUYtKmOfP6JcDjl2M5p7U6qS/sVwvWEppfGhTgCEeAufI2F/eSGB/o6RWQ+bqFX3
	 WZ6JZx99/gJXHnfzlNrwvRLdFSBa0D0DpDQLNPt0TTpy0Yuxfhr9hRBo+ZUsAdY6IlSHl
	 jkb9+tVi1fE/LT5NZAJsnPbY6adWc+a0a4BB0YZ3041KGrAXEdZZXRYIYLlW2XVh01xGS
	 DGdHA9RfLyaE63T2EPQBliitHMkzJn9vM7O4GfDRnmK4UQLJEwfWPqSfMt+xjszoaKEmC
	 XM4QajONQtwzIVaXjodmVP+szgBSm9Md7CyKlYXyR7iQ6Mpynfq+d8fo4bSzCpvPWvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
	b=xLT16dhj4KYKAyfF4faLbI1OddCVfyThi2dJbBt3WVIzXyyBUZ3+IYPrSwbbTOHw7C+N
	 NQaYE3faO5/Fza5onh5u5SDGrlp98bNfd54/AG6fSoUv1k1bKvqsTVeFDm4Lkifpzpeag
	 OaXMhNjxtqAwXX82bf+HCp/07vXy7ajitjCKJTuxBSZehD+eZwAXLEStQyS9a6MohheKU
	 qvQ2157akn0u+qaX/yzAtBalbZg40pp5hCBGvg6mJ+iRwXyhnZcyDQN0p2FV6MxIdR9nf
	 twmKkaK0m9EKPJKuUh7gTnktcLZAW3R2Fv8i4hLuflnKxgTwhJxt5zq9AKNmdATPJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TnHyVIPb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlIU8GpW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB213606AF40
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB213606AF40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TnHyVIPb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlIU8GpW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MCmiDN235627
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=; b=TnHyVIPbHvd9bZx9
	pBvv263KXsQOS18ga59I/Jz5ZtK3f5TMDysjv3rvSWUl+HE6SsMciXn1Nv+sFP3V
	7D2eHHujZhMNyt2ymsESg5STQO7tSsTFWGgN64quCzc5uYDQ93kJczMFRppyReth
	Wa6Hcb1EqoSoosP31bU9p/SyQM4S7d8vz1y6FOyHPDmE8cvJyYZfbH1lsJzvA5aR
	ei83ABHUOK0qKVyerIVaZ7hP+Zs/ccB2eW/pGsuZAoja6q7iEIJ7eqjqjqpyicet
	Qfln1gaAoSb6+EdWUTNmMgfQ9bLKgFfnkVOcYmjV9lOpAV7bNpnJmrGBcVrJwG/E
	hohGxw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cbx2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:46:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so55137885a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676789; x=1793281589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
        b=QlIU8GpWYU7VsTIhBIZLgldpB20lZjm3hmu81j1hvA/N0L26HADj077t/y0hKVQc6w
         t8j9sBR4sP19Z3Uv3QwJ7nFEtHZ5Sb+8mZKy5pGNtffBNoTw3hoCTES5zgczvLeXam5c
         bO0Kn51ZFD715Qh7/XbVO1XAMZa5/a4rinpTmtqRLW96+iiNw+51T4dKgDduVgrHPMFt
         1TvntNThYW5Bh7wDGfkRhCt8+piDca8s8fCMUDkYsd1GKr6BYvkIK7SZ1sIrPSDCOFqE
         SIkPBfGd6mOYN2fjs7owQFmpjZn3j6bbzbO5fFKJadJdgcUjG+KgUjKbVqdJ4+Fdxh70
         Ltbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676789; x=1793281589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
        b=JiB1dNK339nz4+5hPiDgekiF/kEmeaCR0YShfVK5i0kaRczN+Z6mRopauzWbo2fNMG
         pgzSvi1lz+6O4ZeD5vaBYe2j9A8NanQQtt+gIIgmTyJZdrUkNEI2Q/jI/JENaKMgPzIS
         sC6krElD76Y9woUnlTZKeOvYTiTXtmXP/KaScuZ/Fs23Ll9hk0HJLo4KMFLltsQdWW0s
         Bb75ZwY9wuc89S77eqnOg80JoL8GOYpNq7p6n4ta+NjtMdOobqYEfqyqqDTulL1niRLC
         4dqW8qOxzihQSNwNwigGP6eE/DOxU/sFIAHbpOAwrpYZHEWi5wF+exgWRWoiCP0uO/wq
         0ZNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZJw1weUVPLb/p9RgWkzW1lwp/tRTyQ6DwIAjWTruPsxaGB9CnjzuriXTHs/5cXJ2qdFVNuG7GVnBT@vger.kernel.org
X-Gm-Message-State: AFq9FYIcWYZqeEuxjyaDq+k8VQjQwBvnW1X0gdleeEWNMDVxeo02rNpq
	mkMAlPpCnoXqqsvZCNriNyqlbJruH4QCT0eQvQYevZ3ykY6B06bFWXCXNpnLj4Kvc7o10wFJUJN
	Zm5V7hcuDvYJ5VQabq/kjsOhZYVMUcmIrQQiCTYkv2vuYAc5Zn+JLRp0nct9L4JDOKmAwhg10
X-Gm-Gg: AYBFou0ZGviniVQUE5s44JDunFZM03mocOm2hS1+zm6ia2OZ6VrFGDecpTy650afhfE
	yAauvKDs0J1cFVwYRDWnfaaa2ZSAJBwLsr3YJzait1eBS2pf0eYimJVwvzHbEist2yS12AAhkEd
	QZ7Kb3xvo3vJCmVFgLs3C/VxoMqGXYkaTKWtvZPZ2vEDZTgX47D2rcukidSwDLmfg6K46/N4IU1
	qUC4VTVoMuTPEHdoGzG23oFKkHhB+x0zKi8MXoCkUxtt4QVG05B4CuKCKUHH/f0i0ntdul6teSD
	eiTOPsh6Q7IZbsAtQKkWf8SRULscyAXPsiHNil3k/NxDz5tmAd0eAGPSYlxAuZogzDUxoWgTNTE
	IKHJ4pQnKPP1M4cw17MO4kg==
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr1113274485a.5.1792676788736;
        Thu, 22 Oct 2026 06:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr1113270585a.5.1792676788371;
        Thu, 22 Oct 2026 06:46:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a56082csm106605366b.40.2026.10.22.06.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:46:27 -0700 (PDT)
Message-ID: <a7114c6a-2ce4-4e16-8911-d5459d4bb362@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:46:19 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add proximity
 sensor
To: "chr[]" <chris@rudorff.com>, Linus Walleij <linusw@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261016-iio-light-gp2ap002-v1-0-7c93312fa8d5@rudorff.com>
 <20261016-iio-light-gp2ap002-v1-3-7c93312fa8d5@rudorff.com>
 <5531e454-0d84-48f2-af0d-1ab34c149760@oss.qualcomm.com>
 <2b091dc3-9588-4042-8908-2fc3adba6cf5@rudorff.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b091dc3-9588-4042-8908-2fc3adba6cf5@rudorff.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX1PUQxwdWV7Ak
 Zj5bkMzIxI5IWaKrY/vDndUfryU4JvYbW0wcBvPkL+U0oFd41+RAtM10Pr1IGgYff1chu9txsvo
 Wa6TYaxEZfqyqKjXyzqKSgQRGApuVfo=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada13b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qfT2Yf8mAAAA:8 a=WbbDG5xgrYMa7k-JMu8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=nKa2voRIl820JbUdVH2x:22
X-Proofpoint-GUID: Nh5HEqm-YB9efrcuNt7cjrBNXZSs9RXi
X-Proofpoint-ORIG-GUID: Nh5HEqm-YB9efrcuNt7cjrBNXZSs9RXi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX9GLRIc4HItQi
 6Kn/jtUCn025TxYeRkpjxo9i+clbwvOkfEbLHydozvmOeqYyN7aM+pejqS0OU6MUb0paABv+nxd
 a5lfBErkqTdTfNeuwY0U+zs6/FyuUiDr96DXmTiaLffkz3DTL0RfeWP+Wy9nbix3e3th0I28ytl
 AhrzuZRTl3v7JLB09hvMzz3Mya9gxkIX07xNWGqCTUKQBHzYUyZlIaEUZoWM6kBuZR+mT+OhTcR
 r1LuE3TboKN0QzLJllxhFO4pbnqqN+ErkhMl4oIa4QO0WnlKAxqGzaGTsNT89HBr0fo+gpvR5rn
 Ov+JSxGtK8r3VV68Lh+jQKptxN2m8JVJuX+3a3LdL85hTZVN4fhlo0BMGKGZvvQ/duFvDZzFYnt
 WhyUiv21vyPmqfp/b1NfWMuY4q5bq1XcFkWviIwZW8eWxm2vbDsGxHi8ggOQ5dphLvfKlbxzq+j
 RDsopnzeeC0SFZZoaDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220054

On 10/22/26 3:35 PM, chr[] wrote:
> Am 16.10.26 um 17:11 schrieb Konrad Dybcio:
>> On 10/16/26 4:43 PM, Christoph Rudorff wrote:
>>> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
>>>
>>> Signed-off-by: Christoph Rudorff <chris@rudorff.com>
>>> ---
>>>   .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   | 19 ++++++++++
>>>   arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    | 40 ++++++++++++++++++++++
>>
>> It's odd for the regulator and pin setting to be common, but the
>> sensor to only be there for one of these devices
>>
>> Konrad
> 
> Hi Konrad,
> 
> in patchv3 I removed the settings from common
> and renamed some labels.
> 
> Is that ok?

I guess we'll see when you send it?

Konrad
