Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585038;
	b=0ujeJ4+gAb059nkcMhM3NrCrDnAX1GQM6onfUtBCSNX8EEpwl0Asg9/uQ9wzF5E57XnJ
	 j5CGj2Hc0Ml0ZORcQXPpPoWKp5861AfM+QJecz5Lzo0Rj8pi6tD6KNoOyx/lS0UEeWlUl
	 +TWpCe8YNGNL+OfFRjBADN5ICcBqfKdfLzQ9taCAxvKsqVjDmF3B4co6QnqDTzFfJYVyq
	 SWpCCd65EYouVyM/8q8H8hcXsMnuTerE9/qAxaPuxVeOQHXWwCDmLThwwPRNHwEvNR8F6
	 VIsdZ4tAEWwD/6L2DUUH11ClMjSslr16Uc83tD6RcXTvjr0r572bnMXLxFgvVrfIClA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
	b=EOWIxotDjvFRCETgWe/lHzxGIn9dTwg6sjWQpx488HuHKMJTkPP06rgxwu89NOBiFRF7
	 EVtryHBVDT1gED/KMW/i89LX/YpLnM8AyxTT1//y2g4zr7p+EFFO9eQlkzvZEPhwYGaKd
	 DedAcVwfMnBWueTUoApRtmWyv/Jy71scUmGjCP2zf2kkMr/M2hg9rlxjTJ9ZOS6N524sd
	 BqGs1yrM5ZaOWZkewVbfZRapwziXKnbidISwrc4ZHv7JhZGAHsDWRSx77HyR6HjB2eyLl
	 9mIV95TsxwUsZ3VM9Az13zjFdMM5kbgoBKLLQfF96oXDDRhHdOALVKlrOBoz7gjp2Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDGEkuej;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF7OHOZX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9295606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9295606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDGEkuej;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF7OHOZX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg3pU1599904
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=; b=VDGEkuej7SpcZ/Z7
	6mt3tjOhU2/wQB+7cvJ9tIplO4hG1w2wpWHH+doQCrVTjZk8M+t4oEtYcsFABUQ4
	oQgtj/moZY34KoHzck8DyWbP7Cdn20nkBmX4sLUpEBMfX37bM9KK0ndDEAQfFi1m
	plrxvk7na+nJ/1nSaLR7/lIfcNZW7U+gRayTt0bce8S6X8c/6JLn68klftcPI0xc
	HHBNuC7c/xu9A1F3EPIwBtxNa82kQlCtdUOZ2ap2zL7M1eIEFKqUerUdLAwyNnrZ
	SbdkORJhD2Fd2dqnjVA4WuVww3BuTISTENgBhG/GIAfTvNLFwTSPTLJhrIVYocZj
	Ebo7yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugc4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:17:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso10632085a.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585036; x=1793189836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
        b=FF7OHOZX+VnMjUc86Jh5Sxc6tBHYOVWZm9/CHe3ZLgdZYKXwT5ChxMxOE+y3PB0rfP
         /q8uAeUTkZG/Qe8zjee9gahRG54cuayhFLboaj+Ccz9LIl7yVIBJf7SKt6O7qkQZ9MV0
         CrbHS2gaFaDyXGB9g1v+bYYI8snzX34vEsFwyRkCbcpmSgq9s+i8uLQ4+mcHSBoizwhz
         NOiWBD94xQWIbE75jAaBsry3Q9lKCrjkkRx/KtvMa2r1y7nWcZMDr4LYU4YNC/1VqNcy
         9H7lG7LkleCYsLVzWSrastiildGqd2C3EavonBGGpID9zw5FGJmvKDrmnYEV7QMZ200k
         +UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585036; x=1793189836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
        b=H6vTkwjJCKLfXraH3K99Nfh1vxJkixoEyrlJt5AhbHgAI4q3gweIMPyHzPl/PHlCdV
         R1YHv3KJKYu3SaA/CJfwl83aSncl3vMr/h7lYJF5UFviUOlUqCqut6aG/Pgs5vMejlMw
         cH3qge/Hn6KD1OM80Qs/I6ThkJj+sEvV/2I+owS1Uub6NpDRmf0pc5V2y2KKlmxXOp/I
         Pq9oUHcJh0Nd+8n+fA4sjejgZy3Pg5T6Vk+39DybHfE/WdjPlLP7N9s6IQcupGIHuNUy
         dNi5PoezmKxkxf6vOK7ltOgJME6buc3YmU3p1QSXcoWC3NqElnNIHglbEAPPlrAEdpmY
         HfLA==
X-Forwarded-Encrypted: i=1; AKwUvBwqzrqL/JQXMnxSk8IGnowQ91k4U29ycMsfK5iAuTS71PKT0EKl+pD4eKFDYNj0FnZo7A7BMScGquiB@vger.kernel.org
X-Gm-Message-State: AFq9FYLCGsfSWmOWZhLkqm2YtPuioYenh6LVKdC6qEJq7MaQ7YLOoPq9
	89ch9EYBRGC5nLkrsAzazNryuenUwvhojT1rU0r53PAbF0kDPOOMnFS7Iiqa9smk7/A3FK5rpuz
	bJy+iEj96Yud5Z/IU26SW5zeWMZ5aul7ERp/Mb6FbXnGilhB9RKzzwDxckLZXKEG/
X-Gm-Gg: AYBFou0CMGXXbGKYZ5b1mugpR54wb4sssaEWSOh6pu1ribIq9DwV3G2ZW5CJ1hfmZQ5
	K2km6uEcNZdT4X4N+7kBgOcwLl9ANBmCN0icYYVcwnRCyqLNYO3ss72EgF6yXpI7b7dX6hvvk6h
	qJiPFmNUKvDAF71olhrdKI7W2O/oGEpapPj0bGVQgKCAfCMRFLpE/R0vDa0MJ9HWK9RQMGZQICp
	rfnb6jPEOas2o8/hdJfqhwtPBtbfkvXnUFNu/ABqK4WZVeo6/ooOgRT/xE2DV4t6UKJC1xg6sFn
	8m+8uqulVD9nFReewv/vA95LkYgwuyEhqk9WD/2ZTXo/Dv6vXHmvQEmClg8/ck5NZpMJskaePPd
	L45QHyAflO6bZPu2DmxlxDA==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr469813185a.1.1792585035934;
        Wed, 21 Oct 2026 05:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr469805785a.1.1792585035047;
        Wed, 21 Oct 2026 05:17:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm789326a12.27.2026.10.21.05.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:17:14 -0700 (PDT)
Message-ID: <bf792247-69f8-40c1-bbdb-c02c5a56fa46@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:17:12 +0200
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
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add more clock controller
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8ad4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sJXE05e3qEaUFtzxEIoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX8PB9Mbrc/CSZ
 l/uEaoPMcVcYubx74Q1v7dVkwkP9hyzRgP6+V3c3mvn2PVcqjjRfZnrTwK/47FrnQBh0JhFbtJD
 jhsxIc4kP9D/PtsbvMmhK5fqcW5qDCM=
X-Proofpoint-GUID: pSLgoemXo0zUsjfydc0A7EqnyQus9qP_
X-Proofpoint-ORIG-GUID: pSLgoemXo0zUsjfydc0A7EqnyQus9qP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX+ExFzv0VAAHd
 L2bxDeIVdbMoaPeifemocCuAcRrc235zJml1DFnmIh+hPn2ggnzAmYRrgAzE4YBB8QCs1OkDgIQ
 bgQbqRH0dLPKDQjs3vBEfy3onOB2LUsBq7tGMjqesFVIkr6x4l9e6oUse8MB7bZdRU3O4GflAMX
 pdJj00/PMnXoiFqDZ9+dBID605/6jQxIZy7njP2mErZYBg+3W2EWaTcP4YvG+8Fs8+43r1Crqls
 UZGyzAYyVL2xEsoOQeZ93ss/uF02oU5mH8WGRo6NI89QmE4f5nm/L5eKaTxESxb7rTXnYfISkW8
 EW5kkB+DP7LSdnJWeWvooP6luGOP3rp0ZSUKer9c68ulaojGORAVclQPO/Vr3SeyHZAZksjvVRl
 3DZ6wp26FOdSLtYYWODJ5rTyNYLbYNXXiTjmo4gHUE4x3NDQZf78/eKY54eveXxA17HNhrm9hE+
 ZrtNM76Iq+DT6W8u8EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 9/24/26 11:44 AM, Shawn Guo wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
