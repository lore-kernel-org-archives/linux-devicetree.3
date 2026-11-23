Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446966;
	b=IKfgQPL2cy/Lf8GcrO2qeYaPIv6QEgNvedNQZMSvIOO6JmS3j8esuUpZ9ufCVoUygqvh
	 zyqC0aCxwOfzT6tDy8T3mWcbc8P4oIEWZYhvX76nxcaijNVxLLm0BROCn9DJXRM4IaT2Z
	 if65lceFIut2DYGmKWV8KaAaoV4hmb2z0ekrXw+tsAtYloAyPSe/qiTs1tJfB+1BSjGvm
	 WsdikKbHL/pgiuZCIxcu4PfIw+i1f3ihbwuxX1uRj6wdNwujq7dkf73LB17B4v0X99WrB
	 BuvsmelqwOJQ1Oh3os+lyU3R9Hs7XNZo4aG7cIPB0KrulaNQm7LyRJwbawtHNngRQQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TpI5MSa2Q+IM0BhbXOsY+ntZ38HuqNQpI1P26tJTGVI=;
	b=3joYLlBiLFet87LxgyZY3JRQ9EbRVl8ApgDlSA4JCEKBbblmngjm+jP6FxvS7EQ+umWq
	 wVcnbVKUMoYbTGMND3FwELytyPeNLiOw8zXLSD39NX56+CzyPVrLNd5H0bXQYtuWEzMgX
	 25r0YTvqNDSaFehmmigJ4CtDkJvauHc/Upn8EjaJ4EuMY6a2T6xWwz8GSnd9rFilY0tQq
	 b68AtQiwexG7wx2IuX8XbtaRdxFylg3OuU0c3QL+N3tWQgVyuEan/gP/FA4PD37HbxtjK
	 WIvkKa8f9QafID5kxaHWkD/mRhRMtViS17N9ZW12ZsB6Ar33QuHXApessjqimwgV7IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZz4sETh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrJtzfhk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81A8606A33F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D81A8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZz4sETh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WrJtzfhk
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL7Dg694259
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpI5MSa2Q+IM0BhbXOsY+ntZ38HuqNQpI1P26tJTGVI=; b=fZz4sEThVrx2yL5r
	jJxpMNh549ETHiBkXF2nz0dcr9/iyDz7Xex+hxwMosYrvT66zcN9C74OL2rg90A6
	osCa/SORwl1n+VXduNDaSn54E22JNIG46AJmoANxXwOdAv5MA68N7VxoD5a7LvIZ
	s5XZqqr31fH9TxF7qKy6ggMC+Yzun5hgtonfcADlS95xgZ3N2JNxyGff4rMMoTUz
	uX1+481ukNvlRM3ETB8jneyOLI+Slu5ah2lgdGzpfwahezDwH+XNSvnJuX2lYuk8
	FSXbxs82hlr1/Wn8XE54rrccnKr/4OE8X9IdBnsz5DIqYI/wMw9IIK+uD+Ho9/qa
	ynlwKg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0rx92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:16:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ee433ab272so93011e0c.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446964; x=1796051764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpI5MSa2Q+IM0BhbXOsY+ntZ38HuqNQpI1P26tJTGVI=;
        b=WrJtzfhkFDx6EIvhvIRWnaGJKzOG5O2jGC4fYL8SYpmJQ9mvzUglKctpcILy8VXPyE
         WW52DXfK+R7ChnxyYwMna7XoV68MNimXD7UdYcmBNrzfxm3DUGeoAHMonAP2j76gFBjq
         Apl4UprVkjzGPXpc5Gy6eXMAWByDhkEqpuN1ikRcEot9/CkN++7pY+i+bQEv7sC2r48k
         FwPcwin462VRw1QAB4ThxEzG6lwm8vRyTfVLv+MzV9NK3ixZN850V9tXM8W913WYfQKc
         l9NewFkNyXOnJfKgPWdNRmI4t0F2Ux/V0UVdFOoME7nYmKknwO1vENdEySgkgFGLTMBp
         +tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446964; x=1796051764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpI5MSa2Q+IM0BhbXOsY+ntZ38HuqNQpI1P26tJTGVI=;
        b=sitYtH85Xk+zsyAyICsg+3AXwxQibxlPlvJai+Wp3ddYm5vMdTBgVamU0PfaTOvr4k
         IcCjJEoncqwjcw1LAEy8Dgcy/KrljfeUyaUluOPey9vUEPZi1Ms/ZeVrpGGm//CHjFDx
         c8tkjHvAINdmeDnYLByvqEw0hfFEOEjORiNEUGMnsIHYGovsFm5HKWvpssZoijxpyQFK
         /n4yX/IJTBVkycFRWdL7FQxC5G+n0VCryMdpyc3tOYa8ampeOq80Ia3JjSrVl4Gzh/OX
         qJrndobJoCyB8X9RKeOmqqR/p0mMCM9P6/XCPN5Ie8vlR6Ug9Q87T3/uYiXr4Oe1sFLF
         S4EA==
X-Forwarded-Encrypted: i=1; AL+hErFMdQukmphcj3YaMO1DBYqVkf7i2rJ90XPbZtkpAiWBpugctKcsLerydeaXN8Hwoj2Ip54Z35zQryVg@vger.kernel.org
X-Gm-Message-State: APuU4Z/VvJu8XkJnjw2zlIcjR6O3wgihO1b3EHj9yp2j450s3tEDg//i
	UTlaS7ygMu3TG4/KOPK5xY3ok/okHyC+YBBkl0whH1EjGPOdnsjT8wg1FLPCIQwYJXSo+Os/ZHX
	1arENLN21XQWAeERLnUXFMc86M62lLxyX+G6rtVrCucghhS/sqR+M/hOMuomd/Hp+
X-Gm-Gg: AZFdTZeYP/Lva20JkvJLpZXF95SM9gFyAzR2nmg8RxyLCwI8eYPUrecTX6CmwIFm23K
	GD28rGZcBzBVPA4KarK8uKSyLEGNaK18YNcOXjvBYsry7iSclvT1Y7GQL9jxF388WbOgwTqkrYZ
	JyfVh5/qbEts4PwNPlI36JOIglS/GvqS23PVudlfWiafyNxnystyVGvBjt0L9uluB15ZnpRJu5L
	dYTztfWwFwIPN58yEc2zd5WY0H3uXs4hqiTVt9togNrOtZ3i74gDycK54dbeEAIoOZQj7mz/BBU
	imbBlihn3NuaBANgZOgw1ZIiS1h+dN87zvkFtXWl2qHJvVz0qk749EgwB9Wc2/NmsDAW3C2TI6g
	YEo4ydu4OWf5d83qUeDB2suQkMj1JwvTX8Y5Ukl5TxsCeIXu9wkc+gCi1xSi41+gw9mvZ5h8=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7240781e0c.4.1795446963515;
        Mon, 23 Nov 2026 07:16:03 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7240736e0c.4.1795446962973;
        Mon, 23 Nov 2026 07:16:02 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cd368sm5502638a12.8.2026.11.23.07.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:16:02 -0800 (PST)
Message-ID: <96cb304e-0489-4f65-8dae-fac36e5d2be4@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:16:01 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: Use
 QCOM_ID_SM7225 from qcom,ids,h
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
 <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-sm6350-msm-id-v1-2-99482c9ecc48@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Uk1JCCY8U_lssHZfjYeDsOdxuR_DREu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX65dPHGcb58LH
 lB+sh3yve25pnpWEC9xff90TXKwxXmahFYTbcgo1xEDxhALtwsQ7C0kItFW5dMs2V9RIggwmFeo
 YvJLol4ZY+Zh/2R38vRoYFTTCbnvSkk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXzPdhqP+rnpR9
 v0Y2oPhyH/byNkpih44VbxDbR3S3aCRMRkwXPcDyt0NRwH3aDr2Y36QSqGAF4AZaTO+XtpdzYRw
 CQ3Taaj3g5RhQyS2KSAILClduOAXOW8QiyX8VL8VARzSYfm9mOzP0BcQS82nDTN1+8wFEnyknjq
 wFSardy8CnS4MbDGzMjlkhcZjuQEcK0nqqFeocVc2fUfbnqhvyrRBacBrhjjGYPXvkq2iv6afxh
 0gLy/LifPSuPAgb3OA8wS/HYkFmBkgIpvhUv0LiGZ/K8aMYG5qM3yKdRCLYZmsL/z3A/I45qzjw
 INJFUHyRzVwpfHQLoEmRcR5O/ZGykBsNt17s5KOnk3Ubz4AxqZ2QspYPrAJLwoPr+JGqt7V6XXZ
 WqY4ciAWLt/D24wK3jj8e3FHWYoS0wLgekgYVxwm6dJXxx3IHQFkn7pLq8eC8W5yEBqfbxUBGJT
 lpk8aovZ0QFAaujsopA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b0458b4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=8ixNkqbS5ZmMUdSob9AA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 5Uk1JCCY8U_lssHZfjYeDsOdxuR_DREu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/23/26 3:46 PM, Luca Weiss wrote:
> 459 is just the value behind QCOM_ID_SM7225, so use the define to make
> the meaning of the qcom,msm-id property clearer.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
