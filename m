Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413132;
	b=oiZ/+K4fW9l3wYWikBeDm5HtWazh8GiRquILvRpiSOYTKsD9Kn6/I+77+mHCf6P7TZ8+
	 OqNhytstaNzK1UjaQeaZdf920kv17MR3DwvgPawxkuD3nZn4z5OTSTXVtyrmII9slSaxq
	 /Ai+4k8xFIKIDk6w9gh1pFTCh1uzKpW7zslxinu3WIP/WN/Zq+aMpTFkHoiu76tdzyrkq
	 HaScWn+X8ygmk7gYOiWdplKnCUVrD/UH9cEpo6hkyvkZz/c0+zPongIWzaEpZTXcOUyhh
	 HsvA9ty348vr10tzJ7e5xZYO9Sv/2hJ2nn+Pqe1wXc5aOUwPcGSs03/T122LtXZiGQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
	b=iCTyYTvZLn3Hu1ZN6dFOdmsi0NyxlsVnL4UKp+6DkrrcOEGozkXw9W+tar+y9EwDVOkd
	 K23v/QFPo3Qd2Ja40RkqI6ZnGKrfttowelDI865VzFrWmAcsXoww1AHhYSFrAeBA8YfeN
	 rvfbNCyyAlAk603J/iFUj7juTpFdt8UtmzF/g7tCYGE/4wHElkxO6MOn6f8WD0t662mMt
	 DAeeRLl5IDjy3dCJoWmK1rB6wao5gUMCt+UqYJ/ogmxeJdkMVqm7IqGK85t0K4RPoM9HB
	 d9kubBzKC8qeG/B18NBemJDTKAfPdtM+ViDUXbY2vuD8Un7GePrYOMvhV6OBBF/keAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGSEUnFN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvyUHcWB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0770606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0770606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGSEUnFN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvyUHcWB
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN519PM3780378
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=; b=CGSEUnFN6ASWTf9j
	nhtenKl5ijDt/bsnl8gO1DErbLN89LpxWx0xpUGioyMcAoOcdwiP8eeS+cUMUvbF
	xoaBzXrV/Ux4+MMITjae8hZo+DMTbj2qqg5fjCjzq2Lmh56wpch83Uusv3k8Z0AH
	NkJ3Tfo79Z9e0lzOoeHcoHdQKotkJdllFnNVrto9hEVS7zwgzx/0VyWq5UOOauy2
	ntZeB0a9EaOLevFYlBUDnzxVxQV/MiqWSCjozV9jzl+jKs2al5lsnSVDPsPB/6Y/
	Goc1OU1edWcwxlCCneCyEY5556Xvih3YruPtARxuWQZLZMxde6TRUNeq8SY+8PfY
	ZX5Y9g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk578e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:52:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f022026e60so31878055ad.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413130; x=1796017930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
        b=fvyUHcWB/hIXRmwdDlGYN4BcvmODhXyg3xGKSanJvSbfZPhS02HtvMXVsHWX5RX4w5
         ggSwoJlvKsiWm37eHD9W/uTIDQWKKdpEM3w4x8ZY2nZ1cfD3yKvTqiiy2nBlOeoodguM
         l/D9L9Dc+LFQ3M9RMI/uVIVQFagHvigTi6W/PQYTbWhIgAWLotQ/TAYZMx03fMwHrMbu
         W12md+ybsoKAulHq80Sqd4q/jNKkv/X+UHkSYGuJALwXU04ivJDPcvbDZiLcs9qnL3iL
         QX9tj2Wk79QEBIFtQQgeugsp+SkTF5hlhixMSbEvvHQqhFi/YX+13D9FtgyIZlGRdrSW
         BpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413130; x=1796017930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hm43OtswkK288yIc7y7a6niTTQ/DMHsEoXPRykDlWk=;
        b=AzG+GmMvqmrg0GDNm1cDO056Do3ipr+eFRZG0yJCzK1lB/XonbV74ZTA1RMieBxiUe
         cwvWnH6UUavZkdnHWbZ4p2K1oCzLvfZ0Zq7UUQhghaHB+544JPBhs/gQ296EWsxoUhkL
         Hh6g0lTzaeGACkb4LceTVP6alUepZENS9tvggFJZzTAjBM1N6TQSd1PQWHYoN3c/W50X
         4EuUh9V7Sxu9VjSGLVG7U8CMdPCYk3n6jTBmvnU9vC6uFnVuBCFFPhULxyNQRVTYjMdl
         bmJ4+oFDM7c4uMuNzDNCy/yHoJdV70v7asYQsQL+s63/WnEomJK7OEt1tpFaooRvkxyb
         jvvw==
X-Forwarded-Encrypted: i=1; AL+hErFADlHczkAeSH/2S5JLfCQg3EeG47YF7YP1Do/GdaOFgFg23lf6mwPBzBcOBchhs8CTLHwo4Q6zEMK5@vger.kernel.org
X-Gm-Message-State: APuU4Z+4JQUbiDAnvHRCSXXdmxTBOjm2dPHwBr1h8DUCwYNYuY71BErW
	ILYURSy46X36kD/KkM3bYCRKcDWIygmGjPsQyo3kPKG7auUkskYDbQKzXTPjPpPxAuCkb0HaqfV
	iJHgpY4qj+lCO1Rs7radKxr8QuAQpQ8mkI0cIeepCm9l8KC4C8mb92cXzTJn16axl
X-Gm-Gg: AZFdTZdagdH6AxdGb2UklRGhokPagdH3J+9b/kzsaoaPiZeajReLNZN6tGFvIKojqSR
	rqv6A8mbCdDxIw99aZROT4iq/1NgFHcxQwrWqtW7hr+HRz2C1aDkG5G1RGIFr6vHainVbKApUHg
	XmgtNsLKnOpBiNe6QHXgnNlW8p7LXnrVyk4xHCusqNZ3MHPgqu+zsaY7OWf1bKi+Zh0Sjy59uUS
	37WLWhp1DzViqj3UMiFx4LlA0yYVlffSU0k1yfwi2oJ9+u4Rhqw26GFERwsgPcxBlzsZl+YATAF
	fPOgSe0Z78YiR5g2gDIyqg5ZRenURo3I2Qej6/bK2HL1mo5nnXMlV49W5lIw07Z/NyoTSrbhu9P
	nZauYq9UtnllUUyfGOVAvOXmVYKSARynWxiCK+CY2Q7XiLQObtg4o60dKA55eid4l9wgJDgZZJZ
	CqyA==
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr91827485ad.28.1795413130417;
        Sun, 22 Nov 2026 21:52:10 -0800 (PST)
X-Received: by 2002:a17:902:db01:b0:2e9:57bb:72df with SMTP id d9443c01a7336-2f031fc3478mr91827355ad.28.1795413129945;
        Sun, 22 Nov 2026 21:52:09 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm45065075ad.18.2026.11.22.21.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:52:09 -0800 (PST)
Message-ID: <0c289a75-8625-4b9c-81ce-7714ce9eccc9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:22:04 +0530
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
Subject: Re: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
 <20261122-jumping-slim-wolf-aa3e9f@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261122-jumping-slim-wolf-aa3e9f@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pqMFPJdhsbeQX1YiobB4DzKow9avjW4y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX2Bs8n3zhysw+
 vmNNz/xWaJ3yRbogbYGe864mSRZob6bOK+iRWXSjqkL0a0DmAGB2uquuKp3nnktu7bp/AeAk+aj
 yEDyrZX5GiREpNiI8V7myP7narJc1JNuY4s4wXxvDPTegAB4eKY+BsEq/C1/Y5O8x82EKJQ+ByC
 4gz3EIWi5gEHF/mCd8ioM9enWXq8Ploay82/iHo4c479ACSm9soU37alXMB77Jk8zs2yr8aj7/O
 wcwE2eDLQu3F/lBlsiNGLD0/LPPf+nRsuq2XoLKNZc7YaHPOVmd4RaCAg+fx/RTr7Uv6QwP3mHq
 neWwZbC5VXGdc//CkRhmiSGzdKGbsXcCx6YAkbaFbwll/4n7buT9wSm3wZwnvggZZmM+v4KFrZK
 eIo8Wfd/eRbOmtEn3Lrc1Tm7B2MoZB1tunfBNQit3+tf2hGkSir740wQTpxxUEjRASdP3WMH8vO
 OQu1Z/7uecvEy3m1rCg==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03d48b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ceModZNawzzamKazbfEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfXyH9lBw9DME0E
 /RpQgJudXHt/TcLaSzowCVGzcK6EQK9O+lwGlvELgaFRTTvL98IStBcHffb2MUc6cW+JLw5Ka6d
 WkaMvnemMi6SoQYbomJ5YQzOquPwv88=
X-Proofpoint-GUID: pqMFPJdhsbeQX1YiobB4DzKow9avjW4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 22-11-2026 22:36, Krzysztof Kozlowski wrote:
>> Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
>> CSI2 PHY connection. The matching Glymur driver data maps port@2 to
>> hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
>> yet.
> There is in-tree user - I clearly see camss.c. Your next patch even
> changes that user!
> 
There are no in-tree DTS users, but camss.c is already an in-tree
consumer of the documented ABI. I will drop that wording.

> This is just not correct :/
> 
> Anyway, mark it as fixes and be explicit that you target CURRENT RC. Or
> was this already a released ABI?
The binding entered in the v7.4 cycle and is present in v7.4-rc1/rc2,
but not in v7.3.

I will mark this as a current v7.4-rc fix and add the Fixes tags.

-- 
Regards,
Nihal Kumar Gupta

