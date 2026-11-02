Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618197;
	b=oc1CAMOlhB2WWFJrxbhVI1qcBTEcXD0SkPR/w+k9/V39fzsRN4Iq5plhNXLaB+lo9Ym7
	 3ahndW3bzgElqELXlEiRkO6nHG2YjV0gTXLmVcvD8LRMIkrkCmYizlml2o/bShwUJt/LO
	 +/E/UpFB+rnK5Rri+yAhXGBt5bMympkOXuh9rXITXHx07BTExvdqqxq9MYjjs675QA4fs
	 CJr3RB/Q6hlFHbr8uFgey2OACltTWU9a0QxTNja4RJBRz/VOXwShzvFeRSA442Nv5zXia
	 IIqFaTs6tzRk7ATG3L9Vf2wCBnQIR1wtdnWr+ZM7WzFyNEzPz4ucZJjTMS9ahnWmJDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
	b=XR1qkH0Od8rHaFQSSnlG3WzUs93/m+yrIW+Hq43IOJRIk6URwG2V8v79ixpiLTFj3nNB
	 T+TtXpwdrQ7VlaKH5oNas7H2ysQnGHwNS0ryh/+gXneStXOkOKk3DodIhei4yWS0jR6n+
	 NWuY+QSPnIxnQ0klnQKLoRacjs6EWIgDSfcgTZw7IGiNzDwtQsYgX1CTEbUqcVCz90euR
	 g0MVFkdSsxUFOcrX/hzj8lEe8jHHlrp13KDIbQrPgRr94bRJ/MGLSu4+yy7NVYf/AY1PF
	 +hZxpc5fr5Mzzelnw/cdAuCc3wc7kNSPG9P55Snq+y3C2bi6gMe1ZbUxesPg2FAfTfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfB6cH48;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DM/NTXyd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9D3606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9D3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VfB6cH48;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DM/NTXyd
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6hi213988
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=; b=VfB6cH48K3B5IvTq
	+XRFUyPBDigK0aptjzC3ndp5eKTujZRVXxpHBmzVdXDV7iV3w3p6US018rzwyx6m
	YPMF5XfXSWyvTn26lz3MhKKomDUJDxNF7Q2cu+Neu5+EozAaf+xLzi9cj7k62/GQ
	78uGHXGcWEEH1K+mlWPMipRHFLPjKxJt0UqAPSoJzAXCnCdQy4ugBT6xVcHi6vll
	rafoBkIWq+Qjt6hkYiGCW1C/kXzuuhPHXNqguuW0/IvhrDybSFQSS3LsYWOaclOT
	JubDL+JqFisvDri7ANHRxq6EJjrcxzDD7LyDEqZAR/1YnMBg3FaSNJyHO+baHirT
	bxWG6g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1sak8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:16:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ca23ede8fso7049146d6.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618194; x=1794222994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
        b=DM/NTXydrLTX81DBI9cj8SB2PFrWSw2rXsKA5QPGPW53o1iwj0dl50gHIhChHrjRzL
         RewYKhXJZEnikdnkWxLZQtaIM9vWFUEgyvCj1Idb7KB9X5DY39WHI80yNj6vTO1FNPCI
         GRC6HXHcvcimTqVtV/TEqL7rLECvqVt3UR7bCdvN5G3GtGSN6PbL6P7n4I9VwweDd+hs
         u3HE0YhCnkzaovDIKagG81HNFcKl6ubhnDxP9L9CG50BaaZK30URdZfSvPoYFx29khCh
         otXctL9B+XIwcUW+4w66vbSi1eOYh4zKHcbt/S/Yyk2TyziULlumk/1IoCey1RBS6XBk
         qgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618194; x=1794222994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8NNYeoqY3f0iLF0uVCsWM1ZsSvLIKqA637hrJnqz3I=;
        b=fE6C4sc8q9PzhpxpY+tMJR5s6ExqDr7zAVe8D2FNJFa8Z4cqErNUlLTzA3VFg9sL/E
         EU08HkUvH4RBNZMTSklvGJq3B28vHaESQz6VwLYLP5Vrt1ArlJg5K5pASZDI34ImSEVx
         SVTSYbJjoC0lxS0IBs9c9vmw7JIiRU5bYujRUFjavFUsF4TvpLutXZ52hxf0bgMVY/Up
         8rUTpdJ5CpzNG0pOmRsFsvmrgmQ3G0hprkDGk9IR0JTMtGHmsoezZ3hronF5CIEPeZDP
         DsovRoyy7HjvapInTUqdjZgi9cVFLFuCjNEMHhCCeXnMXUq9G6gYvEk1DzNk5/9PBVPE
         glbg==
X-Forwarded-Encrypted: i=1; AKwUvBwX51ZhbQ0I7I7ApBaCQlJEIleNMJYd4Ugk6GDPq6ZeGG3+J+iGROX4gtl1bSucIuQ6l93oWKZMJm6B@vger.kernel.org
X-Gm-Message-State: AFq9FYIVKCIDb1E70woea+gHTw2dbR6QPUfv16/Bb8T5b0o21FuIxo4X
	yhJvVmAl5d7lf1AqPLttD+uBBckQ/2IJJS2nFZoj2c3eDETtoCEr04qkqNF7iTPP4QoQeoT2lgU
	QCp08lr8kw3YqUuDg8W00zD/Aw1/pwpJKV3g4mRXxI211E6l8wBR+kKbs93ihVuOW
X-Gm-Gg: AYBFou1EImhbtVA1hencRmhrVcvqLwkqMBLnOFyLBk3vBVfAct9BnhgmoVTNgCuYeEn
	UkS5YpaPWidByJY0SFdBiTwxmfcSQFoKboGfdMxlI72hSTUcdceM9CvYWyJvGX7lp7FQzMjZTl/
	IdZdlxhsekv1UvqvFjmvTA1lpS+tX+uqkJDm76pi3yvN4vwPtJ+NY0SODiInUKlA5HrXG3cs2Jc
	xXd5Dqw3/9+Y+jl5FjnLCDuaxB3LfB8Bsh3SzKPKfK8qksJ4G31oYTcm0P4twTWSd/7plh8ZBWb
	EHTWdXg3KqOc2pVOrkFh9SQyX/T3AUSXIJpcHjzUJT6SOv8wQS/txKyatDr/kni66rT5zCBFNhZ
	IgHeAudIs/vWceIDMPZETZweIW/hK40FUEEusz2wL13ByFgFpRLxzpvoBxg0+4totaBwQHuI=
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1581226185a.2.1793618194544;
        Mon, 02 Nov 2026 03:16:34 -0800 (PST)
X-Received: by 2002:a05:620a:a7d3:10b0:939:8bc:8826 with SMTP id af79cd13be357-94421529babmr1581221885a.2.1793618194032;
        Mon, 02 Nov 2026 03:16:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a8908sm3146238a12.1.2026.11.02.03.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:16:33 -0800 (PST)
Message-ID: <b6c9ec8b-6169-4080-ab50-8c3a2e81b98b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:16:30 +0100
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: milos: consolidate IPA
 properties
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-1-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HEquUB5drLCfct_ebjn28klAa14CSh3b
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae87113 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4a6cFKT3k8WqcdDSgRAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXxRN4pyBBBHjO
 zB9ttwQN5izUFKBcRVc2MgJn45kYY0+sSS57PbM052cn8oEvyB4HI6IwO9jcgOzRNiVm1Q6FHvN
 sROOY0uws9C/6r0EdEuPRt8lkTm3va5Zg/pRuR8dMjpIN+hkEsYu+hIA0GWQz2G4cCkfr4HQq24
 6XdyTDLNd+kToJdtgnYZQt2YcGcu7cQ2cbj2/GSd5Uoc1wC9K+nfeaAwxjb7Q1IVQ6tESL3CP/I
 Rw2+hyH6V/JvogKJgRhFoTUbrYsLG1oheGwaQNazIgWe9DDBR6ee0jfN+4c4wY3BGlb5QNVSPc2
 /uvJcoj8m2HQ2fQozU7yZgWknm1pyM+b4q0H813lkpxazLD9geG3RxCzxTA18Q4krsTg2LrL8hE
 D6qaBEF4HBPyWHNENnUILptuZMmjrykBCrBJLq+SKJM/LYn8keUS4DZtSRDoUOCGHShFmnmIY07
 ng9pRJ7PXXSueV4LNxw==
X-Proofpoint-GUID: HEquUB5drLCfct_ebjn28klAa14CSh3b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXy1wO0eSabxkc
 R5QX50Pby9jVmDOMu8YwDnylFgFROspK71ItA/Al/QUEOjXi6C+GhwMjTm/bsqF9xoUL5gMBHSM
 NeAD2KArVVhojWGysefthotmuzYmKbo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
