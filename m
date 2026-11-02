Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620678;
	b=X346qH38LWAXrGKtpShrIed9Tpq5kFS2nXKDd3xkG17TJOV7X4SdPSTE0hBuXnDkN0T8
	 /jS2hoTeQCwjXgEahvbmU4duhnueHpIw02njwjMDgbYjp0JuZeS/bSUVAvH02N3C7Rxw5
	 vt48WZ7X6SYKkumieQfzFaMDKldU47OLxHHsI1vuCGpxq6TYlsblmneEgpGm9Ga5wLP05
	 qsle2D07z84ysoBmGBAmrZQRoEV43loztiwLbUtYkJrV9/LwZep5rSMGqE3UqQVKYMHOB
	 ejVbxJGblpZhtHYhR4yzQ9JVTI+L4OXaMfiZO59OvOuJ0gG4ylJ8G+A5/+kF7y4QKHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
	b=3l6gY25rH2PfySLpnrc1Nej10QMW9uY2xwSjdZOSo0HcD7CEsreuXh18Fhy4OZRpW5oO
	 fTC/6z2ldnJatI7gmkIHBQqC//r1Ik1he/4lxvdQSPV0YfBr6XWfATEquspgGJ2A/l6zP
	 OXYqDMhLgAcxCaaYoyZIiWStSC51pM8yW0QayBV81awMc0X6rfMAIrXCrnBJtCTrdMPow
	 74/XCSQ08NsJa2sxYyGT5DssKX42buyzbrJ5DGWsFSRnaiQcNySIehhG1DE7fv7DzA2EK
	 qgjjJJKdW0CJAVXEHxplZrbkkfpRco3GGahwMvND5FZh2x6zaVlDqn+3AIjPEskhR0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxZGtLJP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgcyOFPO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA378606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA378606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxZGtLJP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgcyOFPO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1YG2466067
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=; b=PxZGtLJPRS29HD5g
	tHiiDT7NNNUhHpl19C8IpEfL04YWROryX+LiXAbzSklVMNmiKA7WmeBxF0mwaiz3
	yLmeds68Ki/2bl7MXu7CB0ufsF+BCAhHYFXwzGpauL9QpjFhwWwKs3CalDaBPGP9
	HRfVOIEjyIelDGcGkTKHNKa0RQr5PnRjIVFpAsV7VdmMJcihhlC9gL/xLNm7Ax/D
	pynLKrb0zNUyGET23tDaXogLz99WpdjJVOpuMEHy738NO4BUmsEbeUaoGkqReCKh
	ToCWHO9Dmrk2q5/2TFNh2p0e8EZ7SVmjyomWstG2PZ5LeZ+6dN6U/esbHycSVA7V
	AefRAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhnf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:57:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so49823985a.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620676; x=1794225476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
        b=WgcyOFPOzp9ejCC8snroS6beael6hMxQwTOUWv18WPqeHBaQAQXbQdyQmCcP9YlRIu
         +oueAGSbDn8fTM7BtiN6uoLlRymWvrxLsl6vrJL+lXpCJHO36nssn8w68XE5dljmyZ1s
         J3MNLrax2kkrT89FJZO78h3GALIz9jyk+9Ir9aCuxRpGpPZV9nPLVfPszNyhzp4N9JAm
         ccOjcJw2Cgl/RNblH6N5IhpsJhCyr5E5DKheShHbQMKZSSn6Uf7t99P7qe0uAFCpmN6S
         A/MLHUdhtiUlucZPid1wKCQz2YdDJECttlPR0dkMyAB2XHGL+xfC/vjvneb4AAxQrTGp
         F85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620676; x=1794225476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNKwtLEPoAerLUKfTmxvN50PoLCkeJCmqkuTSnSA9VA=;
        b=D/o+9ZI9OxQVNxH2QUthaDc3sspiDzMhc2a8Uu1Qq6oQq1tAPrORwOsEmd78wteZel
         et1btuZokzEioPTg+5YHivPcdVBdYMuFVyuUljJWAu+A/i3H1+79HEuHrzXHUt7HP3GZ
         Ovl06JvzEYvaoQOJbHA5ccvCdcgb99h19iyRodl/g5OQ5AM176pPTvzql8OSfH9oJ7qr
         mmPC+7WUwXxv2epiq+MsShJTjaSVn/chpMDMXWfga4NonNoqPkyWXPFYWNGpn/8hMQoD
         UtG9RzRSkBC8VrzQc1i8kF/01Ns/dNLpc/MgrT5abOxtg14iJnYp2ADdu/7MrjjoHw3m
         9b5g==
X-Forwarded-Encrypted: i=1; AKwUvBwbOdjLqj16YdSepL4NH2bo7uD1sf+nwTgo45QCSu47BO8FLDDEPhGYigYKFx8PyKAlDQk19miqLN4Y@vger.kernel.org
X-Gm-Message-State: AFq9FYLyUxjl2IMTIxUI7mdsNelvdXiMKAvR0ysMqT+GZaHx/mGHENaW
	ldD6iQ4KsurbGuTQokfZjyZ9KHP1EVcEjcT9bteYRE77YOZZN/oq5K2JkyP34e7ZgbHUj+KBKnm
	UBtyCgCz3KpGZcFQRTVf6+TJ+6F71rXuyqktb7vIfY2EEUtwxpy39+J8P4Ws/YYxh
X-Gm-Gg: AYBFou0AVUw5k0QnuZ09WixxI9Zt4sQIxkWhv5/uDjxYkjE1P/WAsRpamcV8IjnGavf
	zn4yo4dZrJ0o1q7dId3vU0s5mKlRP8e5Ibi/gW12Ptlpi8NPucWFVa5aJUzK5gtw322ucDkEf8T
	4AlyC3KK/DaDb7JMwBwCwkU9KzOLb7slDXpEixxJYVZgkOmYUifAIMr/SfKxqubkJncGKgljb63
	wsBL04f9oEdjhOsf5tjDEjtdTN7jBIFd500amEvweSNAcXpsShU/R0cbW5B8SGP6du/2yAzEk4W
	OL4EemMVtsJyr0prI1vtDClVnMlI1qHAu79jnK1+0CVAHTIo+7n0sCJYSIkfCcy91GQoDFr7rAl
	xPp4zJrrePbf3on2W8o1ELXg9fU5CMGdL4C/ZUV/hNm5m6AxOhj5Ohg8yt1zQzx6vADEU8yo=
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1761512385a.3.1793620676197;
        Mon, 02 Nov 2026 03:57:56 -0800 (PST)
X-Received: by 2002:a05:620a:124c:b0:93e:571e:94f0 with SMTP id af79cd13be357-94421734130mr1761506985a.3.1793620675652;
        Mon, 02 Nov 2026 03:57:55 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18e78sm387008666b.9.2026.11.02.03.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:57:54 -0800 (PST)
Message-ID: <2392949c-85f4-4cf7-aece-df3b9dc86cb4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:57:53 +0100
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
Subject: Re: [PATCH v3 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 88UAXry1-ExXQlwDrKO4izbyzbwSxWz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXyfRXM2FySN1H
 4TeqmsSeC4v6FR2DdIe8Wq8w5gj2W3FvZvoHPls20bkNuiwCXFXyYVxghCF4/b3hCo+gF5a0nhF
 +ylTHa3jM+hhqLsipxxE9yGH3U0AKr+MZY6PYsbOFz1Ij6P3IxxtEZ4YNfR8TMYF0wbjbN6fBiV
 nZZzspLb6pYnLTA+Vvbmlgh6lyvu06ohttMrlUV65dtcs9Kod2Qt94P1CcKlukV8rA1jUwH4ogw
 ng1oKiXbFe6wJiL+B+HWiQZdFx6+0n51npyj0OmQcQ633FQ8JJmhu/tHvjRuE0Hr3v561jNOInN
 ySST1lrFrikdE5oP5yWdszyC7GzrDYrgv4qIDnsy3gHcT+7XkqsyQhqhSwQBnHWv0gSBQuaW3wD
 hFEPh3fBFxlCMTfp0nr56DkFIssr00oIDrk0dYZUWx3XjzEcIJsMH5lTL8i/9zTCiSLCfPRY21q
 jJ/PML22LzUxFCBFc8g==
X-Proofpoint-GUID: 88UAXry1-ExXQlwDrKO4izbyzbwSxWz_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXz/o6242GfAs6
 NNo++2Dx3GUJ9q0hOYERNVqKrwGzTclsDdTw588S5Z67D0dnWuuPrJhX+PxqnaRBAKgiAiSn99d
 WibvaX3QhVq6YMf/zlCVHerzhUzZlp0=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae87ac5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> rename touch-en-regulator -> regulator-touch-en, to
> keep any future fixed-regulator sorted together
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
