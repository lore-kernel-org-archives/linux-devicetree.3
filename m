Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900397;
	b=yAl/h9vRH2q7nZsl86JksZhvVmvujOdcYAcNTBGU0R/tzb4CFEE7HK8cdPwXXEORUwWp
	 uIFqezA+X/opjiyWCplxWDpzlhnbE99bx5dpiLA6xLuuHIk4FiYlQ58hU4KStmqNTrj2J
	 VGys1qBsMEoi/wVcnHA/b2aTME4dDbFnI8h0d3ocpoO3nhoklvJGjXEeG0ZTMDgrz+aWs
	 Zu7qB2mL1NpfRmKl4WWzR8PPaelAndoP7NuepB766cDGhAukIm5GqFHiBacyxQKTJ0dMo
	 gcVwgjyQQDIWZPBdKG1ve+s90tdJHdqVH6inv4Qr+EBNw76kTyo3q9VtYyYY21nOtJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
	b=JJGixsu5mPjU0smBhUR9pBJdRaxCd9rYfQi0cwzgFRGpaQN298XAOMQrTvU7JrURhatL
	 dhA+bCkAsG0+JTqpH6FA+2urum4iLXXHb/UvcGh+jMfApx3dLNRQNv7uomKDCp3+1kYe7
	 GdSd31oH/WnehwAXVSSCSUdWkgrhOrGX0SUBPcAoDzM9+5uK+Jhv4TXVlMSwBQjpmoUlB
	 Kyer069WwQCiUVAfeLdIKGqbyILUSebZbMSqvz6E1kLJWkghhHsTVIGJ/wTC2St9sRCVa
	 nDqyS7bTkAoozSTvvtspQLuT55DJm5/kieEE6AMSsm15+2vevGlOuDPzDjRbCftO8fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwBI+vib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHZX8XTf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E05606A323
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19E05606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwBI+vib;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHZX8XTf
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55e6w3350043
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=; b=lwBI+vibggJsAHUf
	TCibgt8UJOSKTM9ZWDAoXdJG0eTAAwN+BZs2Zfqr3dl2WZWedkfVjyOfA3EinHVn
	7bchx+Z/R3g8uOEhAqcCgXUbLziRN0fwiN6TEzQhLLXbKw4WJ54GyZ0NTu0iKJuW
	TXmCGPXJFioMr+f/kIbaxGHV2YuKhzv34o80FsQY8REGgDdgFK9WtsUgIVY8zKCm
	vTpRHHcNXtlAvgyrszEI5zySfJbUUzi08aoRjpEsfWC55yRUJ3T56dReAwULA0Jo
	iSJgJtF5UNS6JSsKG5emFVcH2GfFcvaOOm91zowj96zUKltq8OpoJjaYfb+j0MMO
	kXWBnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr0fh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:26:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2793739a91.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900395; x=1795505195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
        b=QHZX8XTfy//y9AHjo5mjbBuzMVOo8P9v139xj0dLBmLqOTv9FVumUmBNom56MPtmhe
         axIugMLN/Rb19QPVvv7Jd1k0KU+ZFF2G7wf79E6TApllfP4ocPpiyJPAARj2WYBXqmG2
         vYMyrVGt2kvY88UiZOPBAWI/fWZIqTnM7J5qKIaUbe+BjhlGJ9Kujg4eX85xfzkwko5V
         oS9vWygNTME9Z2RvLxg2uURNlZMkBUS4KLajwbO8NDnzZ2N+7o3w2snuGBditZ0xslx/
         cIMSGGcbDnOS8DiM09eurIP/C54fe7nMnaoVGSydPAJB7aWjdYk9uyXGW0okRq7AH7cy
         XrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900395; x=1795505195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
        b=V/sUU6YjEk3Q7w8ojFM+lOeGFsoE1HWZfidnfTFxg1DVWZJz68rnSSVgmeU5lliGww
         GSLX9shvO6p+LYmjOf33pFnRdfPisHas7ZbVVFLiU8Fho1ndiDAHCxHlMR3bQScv+jSl
         2O+jT+8H2oo93g5t1zrxJRlgwlFnMyXN3v3zKAHiuswzY31uJaCKy1VOi2sXJwAd6ARc
         XUEat21Uz0c8ZNBeQo32oSiSpNF62SqqVOadm6xFT+LmruktLIHSOx3A0RJRKYfemoAG
         TLP4OSKuUe/se+L2BWceaXBfFqcGVhRS3Dm6DaZK5nG8jpfjCDVWaclfP3RYCt4Gu3LM
         kwxQ==
X-Forwarded-Encrypted: i=1; AL+hErHwrNUYcRELqUmpElDb3KoZF/YyM2iDvYxyDqDZG0d0pIaAFNTOUe5OXGaTZMhlTZeyiX6O/zBnTR9f@vger.kernel.org
X-Gm-Message-State: APuU4Z9K4TzNYsZtiTaosswmDoshlfD5WQKG91sLwI7SOoRNSxhCn/+A
	20lJlhaplyI0Myep3/98iRiEx7gIrZUkvpyu/wPco9JMiDM6+nNffmGkinjvH4jNCFAgTGyc7H0
	dKQNoQwRsZ2cfFqJtxbOtAWEhZNuOmGQevHn4JUJyefbZnQmf4e9hQ+hJ4Eu9bJAl
X-Gm-Gg: AZFdTZcbd9sVKMbP06FrUA2Ic7DNiRsQASfsDilLDhy+WiMPHLmP7zYiRmEJS1KjwH7
	1u42M51vNO44jyWaZ/uF8/3HODIFAtJQb5YNgeN3GT2Dym61skhBmyOrt2N/cR3zRMKPVJtsYQk
	KCENNobjxHHBCyX+mUGc0+Zv5zuhEO0uBW/n6sJEwmpt70CRY4LgvEJalY+tZoIrlJgNsM/FCOM
	ppVUW7dJGDhA9hq3Qb6NEkVWZEKRoBXt26of/oQ64wtJpNE2uo6qENyDt7G5agI+yXlumqdUXTD
	R6q4VAw+6RqdVzDLGhgh7tqtpOWm+CkYBsYk3JdF7Hb8Ku3HHOSpIpgV5KMDYKYevai6IpKw8gP
	sfrQSsqdWXpP3tgfw4rKJaKwo0CB0k7PXxtKFJprNfryc2sL669JzZSFOTXjLBEkhomcKEaZ+
X-Received: by 2002:a17:90b:53c5:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3bf8fa1admr117631a91.35.1794900394990;
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
X-Received: by 2002:a17:90b:53c5:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3bf8fa1admr117617a91.35.1794900394563;
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
Received: from [10.219.2.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe78930sm2697549a91.12.2026.11.16.23.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
Message-ID: <d880b084-ed36-488c-98bf-fe9acf757464@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:56:29 +0530
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
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afc01ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=SKk0sALQ5wlVL1HxRVsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 5BYZi2gvbsDGQh6hIOrdj8ZRvbeodKJY
X-Proofpoint-ORIG-GUID: 5BYZi2gvbsDGQh6hIOrdj8ZRvbeodKJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX8lJeKM7wh+jy
 88eZyVE2WYx0tq7jeaZ2gPAf1tpCCWLwj23QutbQm0qxhxyc7UMU0umvmlBaCSXhekwMTdRfgL7
 pjxBfEIc68+/MA0L9w6NrV04XlG6PHuoEz3La5OlsJT8JA7mnKIxTxVSLLWjWNHQs7M9NbA2HQK
 aC56wKwIjV5tqgsBwd0g1xX4e5zTxbYlGE6Fs1AvypsefsHKMY9HmkrsNbsDsWRG/NaAapLkN7M
 +t3bnxeU5NMr+At5UlkzTjKzs24/4/0AaADc1/Kch8kxHpHDuKjKgBQViYZ0308ybSTVQwlUtb2
 ENtFrwMfOvRQ6kuHxtue8zgAN9mlrEzTFZjEinEh1IlsXHBxUktKU4fi0Ir+UhIyeT5N620U/56
 +em65PvJnaiwsL57q+a5Zjviz4GeLxR1l//LK5++ABUdDLo7/5MOayaFMc0PMBI7giRW+Dlpo5b
 lTXJCEMmGMhr4e7oU0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX3xS0pMpXRNKg
 dt0daBd1nZlqwHPrl5jTIN6lezZaJKsIvmvi2DsStNaDhSC6yLJv3zzXtf2tcpRHOSPpiFsBIv6
 sXKN91c3om4py2MxcyyDyiP+QvAMjsk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029



On 9/8/2026 6:32 PM, Konrad Dybcio wrote:
> This patch produces dozens of compile warnings and is not split properly per
> subsystem.
> 
> Also, it looks like the data you provided here is a subset of
> pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
> copy-pasted between these SoCs? Are the extra functions present on 670 also
> present on QCS615?

Hi Konrad,

Initially the i2s1 functionality seem to be similar between this new 
pinctrl driver and sdm670, but now for further implementation upon 
further inspection , there seems to be differences between the 
functionality of this new pinctrl driver and sdm670 for example : i2s2 
functions from LPI GPIO 23-28, will send v2 with new functions, hence we 
will prefer going with this new pinctrl driver

Thanks,
Karthik S
