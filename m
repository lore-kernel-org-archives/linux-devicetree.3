Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DD44B4897
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879396; cv=none; b=PkTI6vGInib9maCv7czBS8BvkxPUiUlSOyyTAS0s8OOh6/MTEQ4rk55pFfOT0/drgr5c9DbVcvqRoi2U8E3KphZ4jVBqjrEwb0kjaZ51nLn6NOUctWNtJRUGgeISnKS64oVKWEUt6zoNGRdD7eAdIG8emG3TfaUsuUZwLATnZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879396; c=relaxed/simple;
	bh=1pHLKshdHxQcrLypPIK7hVVxymfxuemEkheNNQ1sEvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0YY2HOlcre1BAnoTJ35xmheuaKcaOG3uVz4Eg1m1xBD45O7zSL49OtNwYyBUi/uWMxmb3v6D7QYimOpvu6muaXNBqOd0EoufCP6bWRcXPcX2ObI+OaUhT5C6/dBLtGdKa7ThMe9sMJy+x2fpX0bxZZVlBGbiojr4ohznBwwwsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gl8+3Cly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZggqMnO1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gl8+3Cly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZggqMnO1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21COE3054788
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	De3U/4PawyyUPC1Zr+Tl8+8pY3E5A4kyNY+f/G4LQDc=; b=gl8+3ClyQlKDw4hU
	qlQqePccqdUzbWUUcdL5gC9yOOGZmgStUiFcrCh6xMazFmSVSjHE3OUZZhnfv7Le
	10IC4VTPjRDOggcePRt6bDnkn8r2UtnCJ0fP214ogKw5HMlklJayRt6pXbMzUUJc
	UqR/xDNNcCBvO4AinkhrgCUIkWomaGgcdLMheEFtnQ4lhlM8xdSsjUVz/u9ntQkd
	IqCSEP3Ym49PPrtjMuESMVzqVFTBVQG3Jmf43/kMilo2PAxfcIKIAMVInksiVCmF
	oMlBGhcR5sKnpZFJB0XLh1P4nRxHPcllXTUhCmHXTHrzKfhpWglB/5K4YaP+pEeg
	w496BQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeu7ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:16:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338bd59032so6456611cf.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879393; x=1792484193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=De3U/4PawyyUPC1Zr+Tl8+8pY3E5A4kyNY+f/G4LQDc=;
        b=ZggqMnO12zRjkCQPVEY1guAiXim5bp3roR+GjxAeCOE82HE8Q0GxBeWv1HkHFtzeKn
         JMM2M2F/o56U4w8q9KRNAjFuvn2OG5w94+Km8x5X312CLvG+dqx4jbZTw8QtcI7kwvWx
         OxVRVFC4E2Y4iluAdpNx5JEfmbZfxMJMUqguukJpzfyV2xDXYiRYGIwWmLrFx/sZjOFj
         YyulsKBv5/t7budzPyrhWbQatA5CmVaCwajVQQPv79Me4caFcjfYHYgV2koKmf+MJp+4
         ZsGEcUG3NKoDSNpvAo1zk0UYHm7wbrI4f3crg+cUce0kBZwhvQY18N0nh1RUsQVm9Qfn
         tW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879393; x=1792484193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=De3U/4PawyyUPC1Zr+Tl8+8pY3E5A4kyNY+f/G4LQDc=;
        b=l1gRsSQDVWhHCZ/VFmp1U1qlYXQ7ZJO3RA7JaYUwzPWzdlLv2nfrfbpWZ20u+tHr9Y
         kbNjT9ntmEJARK/D/ln1mB0tyt0XiwAVU3RW+oWt/5S1KP7bNiYDouhPQqCUkv7yG9FN
         eiAAbXhxKRKEiXJCuYZLELBY3gBRAMVHgplLS7dfOWCB6S1CXSAKhj5/hGdty5NN4JqP
         YlxPnWs1O3jMiMInZ5xQFj4m2ee5JwOCwalqAKha7rylUBQAvaNFH0wpmzcVOaILi30h
         FvdotLovSvXpNrLMqkGXoe/PFXaeEDqJDJ3r4JzzL7vt0yobidMhFpt4dpPae+GZmTfg
         Yseg==
X-Forwarded-Encrypted: i=1; AKwUvBxTcLWI2TCEJL6OstDm/jRn/D/Xzz8xMjwvzSBRS1wQcuxcJd3xcBwbFS7/fDTXBgkbmp/TCoHSt9W5@vger.kernel.org
X-Gm-Message-State: AFq9FYJC/i5p3QIYKsGunLYhlIsIDWkPJ723SDsAyvosq//jLcaHGBAh
	qKpat/gHX2dCnf9zcaMLqFJxX37C4EL9faaXNsP3frzMG3drxj+kttkqlJCAN55GPfv9JgsdvPO
	yMptkq3AMKld3HF5/I7QJwBoezkSdjuQIJNiAuvjE6e7Q3j6d7Xbn+N6f8j+Mmfmu1E68+1l/
X-Gm-Gg: AYBFou2YqCMiJtXMeo3tfWV7nT7fCV6UsRM3JKMumnZZiZt3uKhqHpAn4NzvivVE8Ef
	xtUVlBazyC185EA8dYphO26u4yQyV95sAUnjrWt4P1hakFG/GpK9Wx6eZTEaGf0UqFwrONDdVFW
	737xg3tYrydzXS67WhP2IEJ+7BjuCOsoLpkD/oBR/lMKNvID2MOAacYe0mxOssH4QqI1APOuIql
	nBaI00V6j41m++xrW6+rLXWRHTW8aC3G75w0u9XRnZSK/g6rwLLpgJ/6TiFkTzFfHt0nWSYwplR
	V7oPCytMQ5p6VFm8VbVBuoLiRAADma13Z10nfdtmnGUFgEzvUVwhOsu4RZO7hxTFeTTkSrCM8wF
	GQEU5iYuhaLqioEhMjLN18A==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2370152985a.1.1791879393205;
        Tue, 13 Oct 2026 01:16:33 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2370148885a.1.1791879392602;
        Tue, 13 Oct 2026 01:16:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c32983e8c25sm421779066b.69.2026.10.13.01.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:16:31 -0700 (PDT)
Message-ID: <af4d34af-4e71-4ad4-a9ce-73eb684914d9@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:16:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark tpdm_dcc device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008-remove_tpdm_dcc_device-v1-1-48574c6ae6c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0giAaIUY2tnjJQWOoQSelZAVSPuJoPlX
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acde8e1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mwqT9ZDZRjcqunfB_n4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX5o3ulyJDiqqE
 kx41WPMrUrbvmATGljrCUA7/xU4t2NS4EG3gIeXvKkMbGFPFq6GBcUKK3lA1leR9Bsahygveli4
 bCEaibOqY4peXoN/Rw2UkKOlcDeYGv0=
X-Proofpoint-ORIG-GUID: 0giAaIUY2tnjJQWOoQSelZAVSPuJoPlX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMiBTYWx0ZWRfX62EMt/YHHu6f
 0puEmUBQ7QCgo9bEbIcCnbxuZz/oQh4lJeonTxWRoyh0SCKqglTsUsroX/huJ7GNm7JCGpYvPah
 vLywTeJ9gL3ac4vi9asNPbiwtdydYXwlUBv0aVDjQvfHqC7JMAGlBA4WB40GmC4CiRJxJ6Ey7EM
 QDu112HCmPIXLb4g5SpbhYU3BnSAf/PEo0k7dcCHFfSqFHVL3L6mzpLK08mvQsDcbAIfWEy3JX3
 wwRLSUdn/PyJPD3CIBUmQmcP92Jyp9kuFKo61RYNk2jzomq/HsEedWy06qqyp4Vf1lIPBR9DYp1
 kZdYXBmRVoWWML1Csh/ttPHPis8gMxHGT8sMBzsZTc0VekxWJdxzdPR3+jcQIMS/ccqdGDnUq9P
 BqqaiWdVlK5+pz6pv5ieXrU193uqis4B+OC98XUuPX3MAGcet0dLN4qrZDZtu80nOEyiYgNT7Or
 w4bVFPNNovB/WhlSKYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130032

On 10/8/26 8:08 AM, Jie Gan wrote:
> The tpdm_dcc device cannot work properly on secure devices because its
> required clock cannot be enabled due to a hardware issue. Mark the
> node with status = "fail" to reflect this.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
