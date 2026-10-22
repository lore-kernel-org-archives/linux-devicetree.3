Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656422;
	b=cXuEEZ95eLKh0nsk8PGIfs1EiOrvpKNyWkrMOub6j7RgJ+4zLSVm/hgU+2U7LBtxp7HY
	 MxswMgsKhq2Sywnhsv5WiGipcD1jgMQ2kFg5NwELV2cDass7FzaqZn0/d+RTA312IYIg2
	 j6uF5PalHbkLSaQgS7ehTlobPpCOrGFAIt8K+zWxnCAJOmLe3UkZ19ikE1Wig937Sh1xb
	 tR/CT/nqj6eSM8TZf44HOjly/d2HbB+F+XY/wD8JcrNYmJYmsVA0LrKDbm+N9WsunaUIt
	 vP0XwKEwJUPRUFn7tqaZtBMLp1dtudFO4uFgNUOG5KoOEGy0YEtf+izw7XaOR7BPXzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
	b=PUCQpOLsDSARf6ZYy3czWGJaMQXNrH2WnCLpocVNzYuUEDOfJ4X0owAgyvsjLEJC5eko
	 nlTI/LHq1uB5UPUzLG6AZfoNYGZyuSKLhZURk/ijcK9q6sc8fe3/00amuU9olbH0uvvrn
	 m0oPEgEzuI1jPvNXXJjmlxfFBZ/cAQgQdpnxRBFvmzf8ANA7aovi+zgUj3QqeMkp40Ozd
	 7DHU+iXuHWTvFD6jIocOd3XQTP/QNjNx2/FvWv1fH6Tg46G/n4OdXx8yThokWQw26r5do
	 qUvILCKesmb0FvHoLRbWKoQ/icEvA4P8rCfstGCT4HaGK5UFEax17JrkP4qCFC/7dxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KSoBzz/v";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVQNk9ic;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F22C606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F22C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KSoBzz/v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DVQNk9ic
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xv7s1560112
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=; b=KSoBzz/vOnEAcmUR
	NE6MOuz4yfbn8o0Cg0oqrDxDbFHNIf47o9B19dlfrRAtxJF0Cj2afROVAAlXLC3Q
	Edl+nwOeTVEm+h+0YuZgEk+TnJVp/jSthZwtSR+VRHbw2l7/MRJEMg3YC59U2nlC
	9xLyJ68E0sLepg7YeeIggd3O9+zQeFEqLu1sytKEwW5nGw7p5/Bqwub9MHynFBvT
	yjczSTOAvx5krExocE4+DjrOS42RRJOpZpr63xMCGS6dB11mSid32pLt2bNgg0Ag
	UGP82t2ubSDBY/gGGnXp/sWuznB4vn2n2AS7rKs7j5yDOCCcmaGmMd0oing/kaIG
	QVzd9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 08:07:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so42662285a.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 01:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656421; x=1793261221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
        b=DVQNk9ic6Flw/hmULVWsSbjiJqhBL3zTrNt8pJnrM4pqWJb5JcfPbIxkdWGx/AyxIB
         X+zaEOWTpESuZnaA42a6or79U3OQMTRI74xYnR0eDxhWixFvgRbC4Zl50y3YZU0odiNl
         VhNM5CxNp8ldKe/Gw9XzNyyjSFWo/AqA6Renj1p50s10SfLvtyxWwUX4eeNogHqRTP28
         69MKKStFWNqgr80Hx1Yzamrt2vAtvi/QhJr+F28u4Zgbq0X5KAqBYy8EQuIjR6QhaZeD
         jKSR73KSOKGHR+Z9eEUPOUBmtTgmDFOUaK7bFIQUWMCXjf3qSpQOnL80cy5ee/Tu877r
         fvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656421; x=1793261221;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4eCA8YPZ2VGeC4kEKs5I2z/8P4K2g05RGR/AR/7EPo=;
        b=h3dFCKy5FoDS0ixombrqlVJenvItBWRY7o4HugqQDa+/3vJu9l7/f3rJGbFxQ9ddnt
         KA24S38airDsHtCWfPFcJrTDYlFAvKn3/dK/rKghoro4bKfpEfDwBu4gsiu7JA4YyY5g
         mmumGveMUrIDdgEN8k9ouYRjmmwJvkwVt3KwNy3xFzj44jD9Fsy1yXeL1PYEZydeeClR
         v1GEILKPQU2q/GsYTYRPWPE2eyGidV5VQ+jf9ayaeJTa+nuVOOZacst1Ao/cVjEjW2lr
         NX08Eg2OFXwmB/FHbaC8/QTYKo8CSO6zTJn1UaAeY58HDUhwIbNaiA0raR4LDYz3nFbk
         mI7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQqOthVJ3u+Fm+F+gMzDW5XKMOsNuZGsQypuSDcs/Gj4YEijZQZYyjo2XOQYXkFIiKe55U5hiWGJf6@vger.kernel.org
X-Gm-Message-State: AFq9FYLxkFVrb/vk3Nc/UmkpgyoZKDx/MhtMpqBuI/JiPbWm5CLmKWUw
	IP+xBfoXqXv8LSUgFMt3Js3C5L5rdSr1t5iGpvlZzIfTyNQBvSaNRpLKXEKXIB4mPTRev6BIv2a
	lGzEAp4LIT9r4+9+B42PO4KA4y0sokjG+XcDLlaLy4vZUPVcTdtFB/hiAXB9CM4P9
X-Gm-Gg: AYBFou3juYaqw5/gRRF4jjm7Qi9DD0nDCiMWt6rhwK9kkC4bB+muGsIxnLrJbo0pY5X
	mWUnimFK4uWVw9xjuSqk7ZDbs0SkDcOYPLW/YO7VKGquTnkYC+o/9BIFfCNWPc8rOoMmXJlankq
	/+FTWpuZQORRyNGk3qHZznO0UbFfp4ql9EgGqw/hcnox2TCiymhMJCDvfcj/Ce2onoKbFFteal8
	sSytFLGXUc+CLxMjeNMZXXIs3WAnlBpIHTE1aJs404kzm3VW4NlM9RKcNp2iVBN/eLPbKOgM8nv
	mFBLW3HSEri4+TjdA0iRP62WzQfGOpvb7E7TD1QwllwTvkiw0Ir6kAUf3XODReWzUQdOlyds2Bm
	Rth8/eSziMAlLq8Hwue2V6g==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr969073785a.2.1792656420667;
        Thu, 22 Oct 2026 01:07:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr969070485a.2.1792656420159;
        Thu, 22 Oct 2026 01:07:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffd13sm77789966b.20.2026.10.22.01.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:58 -0700 (PDT)
Message-ID: <1064a495-cec7-4a0e-a007-3b434576ebe0@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:56 +0200
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
Subject: Re: [PATCH 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-4-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX49LBIjaVXrQC
 udOa9mR0dvWRVjxR4LEfmzvyk0c0eWHGYsxee4uU+1Uyfn4j/ITRbTy8YTJmCJHCbcmIjcKChbV
 bXpQGoi/U9AmT/jXG+lhKktwIl+Pe0GZdtjQ9/W9wK4QvcWLopZz8G8Nce1PXD5LtLwf6BB8Hle
 mGsxVZFl4kLa31HmMl0Byqs5aMRduaQSXKca4VZAvS6faP8h1lOZJgQS2cTyy6RNJxPweGCihg9
 JHWq3a47FCygO/RXN9RpKYpzLk+hr7DgeBXY9HRpdVOORGqYD+hU96W8A9iSVmo8h1HVHFSMLJI
 WCYjICKlEQlUTRg9JYbSVXbkypnVRH2o4a3Nhk68EES9HbolZU/wRw6tVQeaJb3XOV0c9bzsK8r
 vEWHlwnM25XBn4dthypIn+pFcTpIOOnWMsKnjcdWL7qX4CNLWfq8AGL2Y9/LdYCeKnZmRkPigQv
 W7uRHyZyhv4CQD6gfyQ==
X-Proofpoint-GUID: tM0EnkBTzSh5de0CkIjt1Du_RMZIxDkA
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9c425 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tM0EnkBTzSh5de0CkIjt1Du_RMZIxDkA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfXz0YlV263B3OU
 pCawrdUDbQgRxtfbC9eoacEmZpkumyvropkbfbysy0eprkDObnpO37brzBFTDY1jSq+wNrYrPNj
 Jj7r+xbqjBLJ3SYm3LS4QYl3HvzpHgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
> DSI 22pin on the carrier card.
> 
> DSI0 from SOC is routed through MUX which can be selected by DIP
> switch S1016.5 ON, for enabling this 22pin connector.
> 
> Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
> panel power, reset and backlight, and the Goodix GT9271 touch
> controller.
> 
> Disable the default HDMI bridge and connector in favour of the
> Waveshare DSI panel.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
