Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637516;
	b=RX4zMyleOODMGnTJDsNl/Dq4yrra2LJxT95XrZLV4n4YGGChYOT/AgRNXkJQD74dEjli
	 sm+i5O/U5yGljvFK8I7Z4kirK8rpNE5FDp7IwEejJNX/6oR5Kcws6fURS1XqmSZ/PTGRo
	 CenfcVvfYbyxpovyYkgE/R8K+Gyp2yd7NdKM/IU1u73EIdbIa2KY2DXXUep58EiOZC2JP
	 jN8Qz8qNOLqC/t5zm7q5AP9pixI8wsMxb+UqmXsNR8oEHOpNMR1+oGJwDkNihS8kfSPRF
	 Hua6PzJdLWJ0LcIjuTFOKQBmkr6GX0+suyqeQHZJ44K4x3mkj+H9vNFMhG9iX7hoJSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
	b=hdPE8PDllhC95WjUBvPLKQcnUuTrK7NJvIcpvZH9RkKMAc6zsAQuGDub9MFOXEJUnfk0
	 ELhT3eR1/KzMcVSk6B2U8DOzcroCUKy5n0nI9/zXZa64h905T8vihaO2n1vaZ+K/6QIjT
	 HuzN+PkmkeLYJhOZv6RBRMY/nbaOzV08rdFVHOYU6UE0V8ZeZSxO1kQtAZ1plPMIQRgat
	 4QrmSTrJPx7dB4KPFnB6JhuDRcmB/a6GWICbCY8bRCmxXfAp52AB6HCHxettN7EY3/Y3r
	 wPX/zxcuysnYeIDyJbVdASqWqlHS1XRgeBZin/PCPpfurdwcQS32hDvLmEXyKUZLbkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CNJXcpTA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNwbPXru;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD74606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD74606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CNJXcpTA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNwbPXru
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1j55G1477734
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=; b=CNJXcpTA2NqGIjg8
	DsF6XL5RmacyN91f/g5iMEcJjRP9UzMQz1s1gxJpNOt7Ncx6gpgj1tbHST2S3d9n
	4tMii8WolkF8tV/Px5C5S2L21+gk8PSVvSuEEks9VruAKFb9hYsR2cJh8VpNvfUF
	emFOiFpiSV7dFtoaPs++kEL2gi6ozsS6F7fF+svNdIa7g4x/PZfB5d0UrtGEWtH1
	hNECfQS7QN+NFVxtR201pKjF2Dk6VaK06GrmIdyR+tkjY35OGFc2Za23BZhchuvG
	3Vr+Pcy+h/7C+eF92362gAsIV7wMh2WbXd1NkA3NWs7Av+JvEykTqghNc6f2QF1Z
	2R4ZEA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93agbuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:51:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e941532594so13818505ad.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 19:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792637514; x=1793242314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
        b=dNwbPXruhGc/r24tp5UBqqV+GU5qX77/qPStdXvSW6jx0bqFmmAGVEBdwaG5xuMN7M
         5y/SkuuQKfYH/r1szjIZapFyufmdsyMMHWIibl5dPxI/b9/oFZbtSSx4ioEOKy9E6Rmc
         Vt9sMTUQ+sfXnin28tMY6SA2tnYEO18pI84bAxOkDBul03jKaH60kTtNdjKYGbtHc8gX
         4A4Geac7YQaNNxAQcmEVdHioiXNGr50IDrGeRWZA/Wp17nxjf8bVRJzjOAxjmEU8VE5P
         /J8r5f9BegJ8HMu0V5+sGDPTUeYCuYepU/ocmtQYlajvSFgp6PokD+cnsq8CuGKku8V+
         VhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637514; x=1793242314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYH59DRywd2tcO8Con8trQ/dK8KHQ//hYqQ0KcwUeG4=;
        b=JD2eZCor/Mg1I/weIWyS5ZlqJ5PjzEmSIhfFNy36WS53+oHw24+r1wg0RuiI9nwmOL
         9pq72lQRnV67DVJNbyUdBXdXd0+ulso6JGmCJ7ACjqhu7hVBPHKj5ydsh7t05bFvKMNs
         L9GQzanb1w2roKTJ9tA7+wKXCU5cLQoUOc7xZzRrpyWXmrmm9MgfohwWVxeXHK5qiwOn
         4HI/FmMHRcCJhhEEHCSmQkPvxTC0ZYKLM8fX2w2k2ze8rFcG6lufZlOjzm3Jb1Yh+S1o
         1VVh+2h5WMhOkzCoyJ31OGH9OlgMVsaAFtusGFUrVnfeqP2vNPKY6Gm+4OKYDRpRBpyG
         S8Fg==
X-Forwarded-Encrypted: i=1; AKwUvByckRzeuDqmVseDGhvUCYzYYr16QCQiRoEAFZATXSGsckLE7sP+PkBmCgBwer7ESVdqbLmGDhn0CHP9@vger.kernel.org
X-Gm-Message-State: AFq9FYJvnmr3eibv7zazDLlZ5FT5CEMTi2XhYGQfPFs569MHDVnqlIIX
	avzaZaKj+EumxnW1DdNgY2aCIO36Q1jT4FP33kbxl4Z9Ct6KNKDmUd0yE9e6EgVPsUca4kkXTtl
	I6xs1EXDlSXKw2Jo4l/g8BB9QPeZzJ2CCo0+CC4khxv14wCJu/pdq+NSgmI6V8aZX
X-Gm-Gg: AYBFou0Q+T0sjE9YXJL6DDYDw34kCRZD+Sk13k/3kNXMebqKdshoKFANyog5ytdMiC+
	bwAXg/oQyPi2jefNFBq33dTWqX2OI1CZrO6afd66XCrOw/zBAt40G/zENQHb4nZHLLAEHN3vs5P
	8PWefh7PDxAtmYO8ZAYu/jQa6WenyzkKWliVsfcJUgNndksyIUD2c7zqKpViUlNErh8XgFCVT8V
	WKZXwQz2IWHdZffrLGUZ+lvIxZi6H8nl7ovkECTRNep1dnshCUw+QjPuRhVZuFMUDaLyVar3kyA
	/eZmsnv7KVVmCX8Bp4glYjKderhpXCs0h6/umB0oiH3KiO2WQwGAKX0P+f4UQSOi6NwyGkUGH/Q
	dxZAd6r2PKkelauW0P9mJp3YP0M06r8UNb+7CDKiMdlTw4w7EFK6I+/Q2TntT
X-Received: by 2002:a17:902:ce83:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2ea439fbc95mr34017495ad.20.1792637514106;
        Wed, 21 Oct 2026 19:51:54 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2e9:3d65:22f1 with SMTP id d9443c01a7336-2ea439fbc95mr34017315ad.20.1792637513713;
        Wed, 21 Oct 2026 19:51:53 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4113b6sm17063935ad.19.2026.10.21.19.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:51:53 -0700 (PDT)
Message-ID: <4bfbd19a-5fda-4859-89d9-60e40950dac5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:51:46 +0800
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
Subject: Re: [PATCH v21 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-11-04fd28d815c6@oss.qualcomm.com>
 <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f275d9de-a51b-400b-83ad-298d0fc9eda8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z2EHwbWd1tv6JWqyemymeh905C4d0sKk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfX6AKOFPWgetiS
 hihJO9iPENKNGnrA4Ry/w52Fvii3PVPD4uVrNPaXs0/4xFVXkGsOZ/N2CZJUn1oatzy3If/XmTa
 DDr4t5a3DfY9DP3BTr9xDMcuZFjtcqk=
X-Proofpoint-ORIG-GUID: Z2EHwbWd1tv6JWqyemymeh905C4d0sKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMSBTYWx0ZWRfXw94tYRTw0yM6
 zDdfSuv1gSICxbqLyk7pET0fEAuDcyqbRBLFOKKOj1JU4nBYNo5/2RMH2/VFjJGPStP1pBEipdW
 R99h09PH2OTozhQgG92Cs+kxOwVk4CdnB0KKazdusgucGBzkLDir5ZZTGW4km06IpW5H5xYtuz1
 aM66ds2p2iYxXz9xIiFlJaL3z09saSou2NerFruRm1nI9rDOpoC40rP3dJvP0xSSbAhAQPz4gtY
 r6Vw6UvoM+HiWhQTwMGIipjtj4KKANfWQPs4Yt1A/5OMxMVy/eDGszYQw5w6fyQJYCcACuwFcqU
 mnjuvOXzjqnQWOWVWPtKqWJyn59fACeS613si+iEVHPtXGjpzcg1jbTUegxPfuBMiFZpx9LoIKn
 F2PKHAIUKcpaYWJAARp5mFFjCQUcg9/E0u2hSjfQRv6Xxh5Q5mMIpwYBdMvHmFaFbRAk+vedNCv
 ZkaY76mw9XQXwhT5t4g==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad97a4a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GmJ2lDigl4HxMnUU5kcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220011

On 10/21/2026 9:59 PM, Konrad Dybcio wrote:
> On 10/12/26 8:45 AM, Hangxiang Ma wrote:
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
>> can be enabled by board device trees.
> 
> [...]
> 
>> +			      <0x0 0x09191000 0x0 0x20000>,
>> +			      <0x0 0x092dc000 0x0 0x1300>,
>> +			      <0x0 0x092f0000 0x0 0x1300>;
>> +
>> +			reg-names = "csid0",
> 
> Please remove the stray \ns between each pair of xxx and
> xxx-names
> 
> otherwise
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Ack. Thanks!

---
Best Regards,
Hangxiang
