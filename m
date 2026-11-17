Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922888;
	b=LcmwLxpXAr5GFJC0IxNZas8ktYXOE6MaZNHV0RWrSA+DK6Md2f8ATYoeg5iG03hHC6pU
	 jsDS8sGELPKslP3m6NXEP6sydOVXPbmrYE2bn5AcuwgqwjOkZE+kfn7xg8b7krC37Lj8f
	 LHFtdbwnDcAUDhxpEk/2SXSl5tVcO4yDlAzJgFfNjKvOpVSOXuQa+bRXFNipfsEo7jsgL
	 EdA9WULB7XiZL7SaKfPHsaj86WKjt/NsspzVrPQpLTSIAm6EvSlMl6Iw2Zhe9+cwy+NGp
	 Wn7TIvwHrKkFykg3pNaJFUsGt20xK6tOqcJmjVD9KdNzCHSa+UbXsJPBvvgtlFp15Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aMTLkO1qD7P9lVAzbitn1JDwJOqwYWGXqm+2ed8w8mM=;
	b=eCYkP2yiBS1YeGhI585i+jplpNPc2m+Kf1OyiTnBqB4zbq7NBRoqGzYye9o5QuaVOPas
	 uAx8q5gXIC0EF8I260125jCW1Ko1SzQtfDXHLfx7lQd8oihRPtvl/UnCqJxydLMoEZQ/t
	 yrCggXrRBeUst35QucQ/oCVScBFPLzwezjjoqXvAL79Iw4kjyxds876n4/sWvM7d9bTQ3
	 agzkPqnDIzMJJqVgpmQMwCra8acF4y2HDWC77hO0sGnBmlNg6fS9r4tocJEe+6DDMU6wC
	 8+Pey2VjbWOLaGqERUL0Guuo6IIdy2P/QvEtsg7Y7HggJKu3uzJ7xFmvvRPmh2FQvKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Thxja5bN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMxc8Zeb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD3606A33F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFD3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Thxja5bN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PMxc8Zeb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1A6C082081
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMTLkO1qD7P9lVAzbitn1JDwJOqwYWGXqm+2ed8w8mM=; b=Thxja5bN+IrDwn/P
	0yeFS8ECitVmFyzMPsB2WIBDbpGTKL7mhkgldtIU0EUOpXIv/PMcEzuOKxe93Nzy
	8l0rh2wNxKIbX1r+w2Ym7oLms/ioifJS+1Y0nis4DNCNE0nvPk/UIyBZKERa30u4
	4KoGhA3g6sXKGyGLEi2C8/82vkgZ6swPJhonIhC97J2fkRSQ1VFOOz9zesmeooa/
	htADpDf7FOt0qMw6YEaNBR1P9ymlXbhOsJ5+o0pkR8miQ8ihFSLEAGY8uSdkmWgr
	yTOee4oQHjD2c75Q35ecBsbQcm/rTY85isBgZdKxGdZVVwHD+uXKgY8u0t/m5jXl
	Qb+n1A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr1x47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:41:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d64f59c80aso641870137.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922887; x=1795527687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMTLkO1qD7P9lVAzbitn1JDwJOqwYWGXqm+2ed8w8mM=;
        b=PMxc8ZebqEPwvz+SOjxvYu0KQgFFQteP6FCP0aN6tk8G5sjd6b1gj8KJJqReSgbfmD
         fDV0WW1reSprmP8m9umlvxXDDfu+D7S/BFNF9pISZcEZkTrkwC9+Lulz3YY84LgpG47/
         CPF5rwG/DABopWlvpy09feCJSOeRtnQBggvXDEe+FHNYrOAUBP4MTAmP7AfsOEKeJoGE
         vp6za1eZGWp+38ErHZtToWvmeQjXV0kDqlyzQ6feFHRr454yW0+m/AmESX5Be0EiR+hd
         3kF1ho43v+qSKl/yuL+zN/zuOE+KvPUmaFIK5ie9H++ryk/SZ0H5Ccmo7duUHI/bjk4B
         nVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922887; x=1795527687;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMTLkO1qD7P9lVAzbitn1JDwJOqwYWGXqm+2ed8w8mM=;
        b=CRBAVzk4EIttNMxLzHizHfqTNh3y76sW5E5BYZAuKXuBhoOSYshLLficdeIL6jhAUQ
         nOIHDXC+gJ9tuzxC5D+cUmzdv6pzgVUErgfWxITt8Y2Vl7H/ReTe/Zvt5M8tEh62/P4e
         LaksxAj2rpuFwHu+r/CaKCfLTxpYGiZTwV0qSSf8OyeeOC9j2PteQNZpzd1uG09LJyOL
         6zCpmvgCmYEwvp4dxSlNXwrsHrVuuSIptrKYO6LnuMYjqTvYCHJOSwRFfXzyLRheKr1g
         qG35D8OaPW4BNefkAxMjXsvW8CDz6eeStZvoxrgpSUf90AxHa/2qpIFCTkuETbV7ZW5n
         EShw==
X-Forwarded-Encrypted: i=1; AL+hErEpYwx2ZqLBtZVSMKPYqnRx4o6Xnp2bZojBGJNCDUiyjAFpDIMdWKn/PdJymELb66d9jbqP4e7NWfXk@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q3OVkxlFI4mT2ObXGTnVfyGizvC1/+C/eK26BCSgRVVLzeoJz
	xCfqlP4vbl80EhQpGVMoDn3Oy8oKfjRUYY9VQhPXKBaQAK2dAMWy7XGbRfXQLnG3Kc1r+DruyEw
	TZcenYsZdCb9gfthPPhYB+QyT67YHxw4+msTRuXbE+lb2UfZeg5k9MM0cPVs2TyvtfT9oQWSn
X-Gm-Gg: AYBFou1DYUn6RhojOzVcN+IItsXlmZsd7rPCXYusgwag+p6//lUwzTOFmC5X7rByIYr
	2J+DderuuSWkLXspTn4yrt+CHxPU6F4TJs2qNp+Gau6Vh3sToRHi5h84Js9p7ARVp9lp1NuBkQr
	lZp+aRdPCsUDRaIvgtVSIqO0Xwk1bWqt8ZesuS/crfBm3HO9ld7iBbrn78gx1xsxSH2gpE6xRPQ
	RRdk19qR/ZyeIrPK1ytS+z+TETlI0S/CVnwy1DR97ClwOGUyB4pPlqyf0THJC+BZj40LpbWKjTY
	9UZ1efVVTHVAaMV67y3qeHxtRs+JoIc1RzDQbbQ0yhSMuzV5sm4eiGqD13BskRc9D7in9t8nXLA
	a2J6I2FdkFk/fuQ2JFVAlEVgAUtWvoJ9GqsiRLtACTllkguwRZhCjoRvOsdFEX9ZR29vwWuBIKS
	M=
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr681056137.34.1794922886651;
        Tue, 17 Nov 2026 05:41:26 -0800 (PST)
X-Received: by 2002:a05:6102:2920:b0:7d2:fdb9:b189 with SMTP id ada2fe7eead31-7d69f850c5emr681048137.34.1794922886186;
        Tue, 17 Nov 2026 05:41:26 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7813fa23sm84049275e9.2.2026.11.17.05.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:41:25 -0800 (PST)
Message-ID: <f35b802c-70c9-4f96-a5cc-158e22774769@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:41:24 +0100
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
Subject: Re: [PATCH] arm64: dts: apple: Remove undocumented, unapproved
 aliases
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261117130616.234953-2-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218871@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-218871@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc5987 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=QxBoTKaGf9fV6qxcK5AA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: o7E71QyncZWHAdwwVG_JV4xW91p-GTnw
X-Proofpoint-ORIG-GUID: o7E71QyncZWHAdwwVG_JV4xW91p-GTnw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX7vhjN0ClLuA2
 0vfjpcqRIgTHyOEys7n+cGJClXgfSwSARk6XoIRTUB8kfTesA72cyH9n0XLL7x7cZ9nYPKpBMZ4
 VJPYukbfnu3Ou0Yrsj1HkAbOsq3EgaC54brRpsQMyEwnV5ikMC08Z2hxph/9indxP8zuWSdnnL7
 uRo9MeaYe01kbE0oky92Vqeh9RgRBo5m/ImE7YY/fYcE9ShQXDSFpAooHS3sxArmJA3Xy1naJej
 fHwjAXpO9gnrtGFyjnisQ8pXOySwVG9qawbYHxHkkxAYx/2WGlQ5w6gygtyWzkUwsYX91lr1vYk
 ehncN0nJi9Ugkrg/UJEBA+64o2b68MldK2i0a0F0SwJmN/JophU+32w61CVQmoZ/K/zf8DucP+M
 8ElF5zM/PaWuQk4A+D2nNte5hNcc8goqnYJ6x/BC/sOJXSQqpVp7Ex1H2auuRbz+34VCQxhxmo0
 9znUCg8Gtmtnf/Jsu2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX4wFJELmPLULi
 PEhtCFrwbbRfRaEXvpVnhGxSXqPz4wrwo5KlHXNJU+tSTm8cMQ/PgusJl0pQnsBgcQvNo4MSiZ5
 38dEljwDcGvWO7EGWr4A4RJ1nUYNSiQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170054

On 17/11/2026 14:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: apple: removing aliases breaks atcphy_probe() and
>   Z2 calibration
> --

Life, you should not have add such undocumented ABI.

Best regards,
Krzysztof
