Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE433431E68
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138478; cv=none; b=N7qd6TCPejjcmoNDfs5Gy4XUvfjNSSBaZQjdBxYS0jHnfbYLh5getrMzEp/LgkaxRcJQ21y5jMgWfUThJlQvwGqNVcsVKOTj0pckovmyU2hnyVZXIjXc85YIIWhn+yEt6OZrBGE0zQ2tJGtrp3AMcKUOAXrf2+NBEShGDS2yVcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138478; c=relaxed/simple;
	bh=ewweEl0ILmlFEynfdw37i+tzRtA4GALlKRycg76XvTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0Df0v39+2WWP7zgJa0oXiT21gzsjDwLSFdn9rNWsl3/G+59GgBjIcpRZKiLBhxs57VuTXfHtg7O3QYjpvxFZECUcckhkivO0WtdoahKSrCkTbs8RExsy1YeoTegYDeGFEUc7HGGRX1Sfjm4ogCOMTU/Axz4HBkFIHWr+nzWQ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eX4LkD9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdH2fRsR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eX4LkD9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdH2fRsR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2SrGv406165
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=; b=eX4LkD9QphhegX3G
	fJSC8i9CtvbMoISkCJqJj4tLN83yck3czz7esLSkPR/JWEMMHZkGzJigNb4qDoqF
	uOx79DkjoiaCpRxgvkHYJfoN3sBekrGG+NF76SBzOnx9xrn1uVPW5qaxoJiLBFM9
	pRjhVIWxE0hCPaBIrrONitdxgY2G6TC1zYyKY2b2yuLl+rhUYuJaK3uabdmWn6ko
	U/TRGHysUeKbImfIiYzJjR0Db+wOTlAu75tiBLSJnx9mKhJb5Q1pUIPkWopvZiEQ
	wUskhBdZHFf2DNKOWElvGkYf96aDAF5+NXwODb5LY1Y2Un/J1cQBifjOC1L1WaXO
	NME7eQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2rh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:14:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7030023eec.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138475; x=1792743275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=;
        b=UdH2fRsRdHWcADLvg6WmgC9emaF25DmpsesjOLqRKZLVCAei7scoOp9nU5DkOrQAy5
         OrRkzhWF+avhiHXnea+dFKgMXKvmLacr3839YZ35xEdYi9rbs4xifPX19YgZ6STVFIdj
         xRceLDis0KN6dpzpT49M4CSOOhT6Hx0+DSBzBRCaHHOdKRPApWVxz3gEGD4xcaxAFIbW
         gQZ01CXXzqOIStTtHycom8RCc1gOfAeAse6lWOpAALOF9OuBDKPlZIascQtevkL5g2XR
         KBFPqbjEwPusx6lWHS5XgcMjj0QbPrMd5UQcXcfg3a5pTvUZrYC5Oml1xpVun4rKsak8
         9Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138475; x=1792743275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=;
        b=Jl+YbOKdhEOkI69x7DVK80kZadzp1RIuQDxLN3igP5hdAG72s+YQ6KdfwlAZ40xdKE
         ER9Sp5LOdC4WSYbun6Sb/DkhBn2wJ2WMJdHiW6t9n3G+N9yAlFTL/+u8gQZ/kj44kdCh
         8HR9IGsimjSWHmxMw2XeZXTbUYTRtgidwwpEYs/Kj6gSUYBpoXpkddnYgvlVaul7tBjr
         oAr4+rNEY+ILIu3Gk9rjtknSCsHFSdXhCsinRiRU2ctbXcPPjPQmg3dGZIe7APlkBcyw
         x+an0fKuFLcbppoQtJ1P/6NuE9vU7KpPPkDpbJFXCkr9KXbkrNUvKKjPEEoccm8jxm5y
         6UQg==
X-Forwarded-Encrypted: i=1; AKwUvBz/TdcuPj5CIwliqfc8vczggT4/He/KNXpIYXG6Kmaq82mfcH6x+APEr7oCZrF10961VQwGNwIeHPcQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLlyz1DCJn3TlPvVYX6hlX0dAFaolabwGR57T98g8+nyLzuNMr0
	JGHLebKBiwgzdsqNnEtglZLQM7OoLJRBS+t3/kUuQi4PKCCU5kIW0f7DfZ+0CWIqP49PUKw7KdK
	ul2J4xbACkD70Xeh4xqO/65V4criRsuieZI+OxAcjCcEZOV3zWM/wHeIwtu8ifeOi
X-Gm-Gg: AYBFou1Y8vM0iPAytpc4naM9yNxDk17kyx2v7rlBEMz3eV+e7TjsBndYePfChwxtVTj
	V6FYotiEYC5AYEPZCJ16ca2QdRwJ6fh2BqAJ9R7m/i4jqUbMf5rIulQmFt+1vnmTKnoYq/8hTSe
	8u9d9wPAhbNvKgDmOkIaGUuiOYVoEOt8Yc1+vzCEmbaw1J/Lfd37/8XxvwgVSEbXN3VbHKDIQLQ
	5W3+PFqWRDU0YFnq8ZlrxLfo3JQYwQQcrcHMnpskMhw3zOWYScIpIdcq5Os4spAnsudCZSW71iL
	dzdjoxa22hIsLI2asb3vtnB5D9CXGiIl9+ctcztIitOyeodR7PqOF1w7dMd5kTzuxHBoPtApeXx
	RNbDTcE4+v+kjK7VyLq4tCjTV6TfQYuwdcw4=
X-Received: by 2002:a05:7300:6cac:b0:339:7b3b:236d with SMTP id 5a478bee46e88-3537dfc8fd8mr41404500eec.15.1792138474364;
        Fri, 16 Oct 2026 01:14:34 -0700 (PDT)
X-Received: by 2002:a05:7300:6cac:b0:339:7b3b:236d with SMTP id 5a478bee46e88-3537dfc8fd8mr41404461eec.15.1792138473880;
        Fri, 16 Oct 2026 01:14:33 -0700 (PDT)
Received: from [192.168.0.106] ([124.123.197.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm4528052eec.1.2026.10.16.01.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:14:33 -0700 (PDT)
Message-ID: <9a12fc9c-e766-45d3-a6f8-eb6ff3332434@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:44:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
 <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfX58jDLCLDi+da
 A7Wv/WkwG4HV35px50H1bE6HPJRfct8JXGrzLYeM5Pf1zxmy2aBRSVMpFu2zCnQzfwfAyhlIEcK
 p181gvOVIX5m/oBzNCqjVxf1hOOe+t0=
X-Proofpoint-ORIG-GUID: gSCYKAJDm6b0tFDLIyOelP3ZDRREPFwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfXypsAevJZZIN4
 bMTdHkf6EhusDTyHg0ExYG5fRXXNwxhkp2NwEjlc64OUR59coI5juwLyt4o8i2mQ37hb/iELK88
 zhICtVO0vU9itdoT1fxUIpWdg2Fe3uuS4H9xMusXCawnKPuT8rsdSExL6n/+wLB+diUmtwOfDRZ
 WS/hZ2jk8bMtn2tsXB0kslyERITiuYyT9/coS8IeKZgHs81JUVc5z0JZugj40SzqOyffdXmyp7x
 5cW+4oDNuS5IC9YMVzL9VMuu6mihznKiL8/n39DPltuMB1XJiDbMN9SbDGeEsdAzCYxkVzEzbiR
 zaXH7uMJtXsaM/dpwma6FcMCyJaOHvaUXRW0VgFCDXWS7HzGvCw+xuDcVd4QAH6kZwcsYbxA9R9
 X9e6N6IUyhj0kYqObK437oI1qprkOGtK2UOT2+5tumBtID+ZtWULDQu0wS2GPaPxYRc2OHiVuR0
 m4lNtkOCNbsnKReHRcQ==
X-Proofpoint-GUID: gSCYKAJDm6b0tFDLIyOelP3ZDRREPFwA
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1dceb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Z7qWu28e8E/v29kk1A4VTw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qLKQgrqcCyXtwMQRFB0A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160032


On 10/15/2026 3:08 PM, Krzysztof Kozlowski wrote:
> Are you sure you are not using source clock names?

On Hawi this RX input is sourced from the LPR vote (LPASS_HW_LPR_VOTE)
instead of the MACRO vote used on sm8550:

     clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK ...>,
              <&q6prmcc*LPASS_HW_LPR_VOTE* ...>,
              <&q6prmcc LPASS_HW_DCODEC_VOTE ...>,
              <&lpass_vamacro>;
     clock-names = "mclk",*"lpr"*, "dcodec", "fsgen";

"lpr" is the same style of name as the existing "macro"/"dcodec" entries,
not a parent/source name. An sm8550 fallback can't be used here because it
pins input #2 to "macro", which no longer matches the LPR source on Hawi;
the other three inputs are unchanged, so RX gets its own clock-names.

Thanks,
Prasad

