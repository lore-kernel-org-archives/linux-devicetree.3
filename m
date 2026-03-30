Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461FC3AF671
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861568; cv=none; b=BYjLR9+TqKwn5Y3gN+5kUqE9SeD15ZhtjsDN84czZnL3hSu1mZUtIxfxvuJMQKTWyzX55hjQknqla6xQcOGkgs4qGfaV5ndHeeid6uoZv+YiAh8+W9o5HNk0QbOxAeDUky+yHZ77uFV2c/KqSmerYwy0pFV3u9lYOeB/a5HcVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861568; c=relaxed/simple;
	bh=Obo8urS0LbfTKU+HQ/PJDwdmWRXP9ejwer+HCyf8Bn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ueEOlIxzEEw/wHBJzZnDw0RfVj0ey+MHqLt2NX33zkJG7ziQ8cwo3ZdKv2MaVpu6Z4+1iNVjFOVBleMi8qOhSVqnIaFcjm4tj6MQr5ZIS4jUtDZ1ebmXH5Gj/DbprTlh2uDdWlYrU38Tajtc9eI+OhsX0uN3VGX/riKD0bAKmz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5RNbTQG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVG+Mf7O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5RNbTQG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVG+Mf7O"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6JVw52964239
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=; b=m5RNbTQGoa9Nd29D
	Fx3ROKtAcu37AjwKpZanidVgaZPI7qTYTuI7tsr4gaz2cdRlDDBhW2ur+Dq6p9Go
	1PkwLonY49XT+lSuUuzSWPWUifFywf+KfDvXkv5SW/D9ngWuynRNAuJpPzqRKqLH
	tgn3bFyVxWDAnkIav4/oWxQMHZah0SXMUL4LkxDJmePKdcnYId5KlptE3SXXs0Qq
	xapB9Uh5bICthJNIRAsycdSoRKoHWppSWP9PooJq3VUjNnOT4ph37wfubNlXWrqF
	j1YTTR66tR5/pUwV9vvpftvIQzmqJI3bNyEgXdITCgePqK2SkardYBmNZ/8Ghh57
	LH2TpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c3ap2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:06:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d1a5661ff1so7681085a.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861564; x=1775466364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=;
        b=PVG+Mf7OcjIo/46K3+orAmqeHoQ/RHVv4uSryJhTofyjZ5E85Ls/zTw2Gs0QzCC9WH
         AwhJ/1lL8cxdYsC5Si8alkEYfMzRTjAoO7CpCy2FBW/GoXQifLsuHuzlCX3f+B01WRru
         OoHVFdPWWKYZ05TsBgXhgkUYsWzj8KY29of+s7rMYzY68N6Vj98LljoCaQf9ityBfbvN
         wQap7drAM7T4L3sA2pDAJDDxeHBZ95MEF4EM7IgtN2LAmD+0HYbGLg1ein+/Nmcb7OoA
         0roMroZJXzFc5TKpUC12tgS3qiwXPSlsU4gm40OcITjN65r+XuZKrvfcrl4w21TGANrv
         yd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861564; x=1775466364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cMipK/UwAxMfAPwa9yteB5iqHHVJPr2rGBR9HQPnHk=;
        b=VejfezkdFqJj6k2zYjDp/6ZFWzI9IXh4mnetQiH5r6adnIaOQBDBVI0KJ9JPxG7oH/
         vTGWpOJxnGaJ81G5IiL9eLdV4zVZZ+DF96CEw6jVBrm1v1EvJEWInp+n6hkXnIDFV4mZ
         9i4LwnCB7gFG/OzXVDCntcooUgiOH4+R3S1k8Zmr4GFtEtTXE0aMSOtNe87qFqBWYylM
         E954tPKD7iK7yXWT9S0AkIBSgoe589YRGvSoJAKSUh90ccp236RwIk2QvQD8G17nn2CT
         C3x2A/Lmd60OnFoMPUi+7iOurRkilfYMh3YvZA75rY/ubk0jIJGG6Iz8hE9dRBQ1vQMy
         6iHg==
X-Forwarded-Encrypted: i=1; AJvYcCWoUrDQiZfkNiVzkx4Ot61UHDqoWIu5OUzbNqHnnl1hJUysp4DrCc5s5gUdZOcOFzHwmciypdOBTwK9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsz4zJnRpOKsyo9PNscLjW+FNcLaSh4Mi3J0i6UGYw34HiueXW
	tHJxsb6ComxyqhYIdjdxcny59/JRRaH1dqcSM1IUlXgrDPJXcUhvCuePqG+YNvGCjxR4d55SKYX
	Yl2C9xJSKiuUq4iiB2gNYZ7wwxEbO4F0Fs863JkaoynFi9WPkffj4Bk65EhD+3xGV
X-Gm-Gg: ATEYQzyjwAr3GnLPlVC7p5o/BHw9D1VG7KI07uGPVe2UB7vJpEO/RCkFsX5ls/n3jLJ
	7XWqLVaL25pbVWOIEvm4v86EHWAY4jt4kUQFoaUErSGjAbbW1pfEhHpK+RTTzfayy3y5nnxxiBO
	SPThssMYCWRYEwg0kpH4aA/lKfCkoyjgoqZ/RkBmOcnzo9eC9StMVbhn0XSba3+BlJ8C7JrDNGg
	KrYJJKuBSMYXtg59XGqOd/pMuy0RDAZsPaurWTKhZuAu3kBWLp73eaG0D39HkN+LtZyoCv2PQdR
	+hA5MRcJ/UyzreDE8UiZQ1CHCudpKJLcNDY5MIGV1D6sQ3nPZOCVAJh21jqtooFyNhyyQNXnVqW
	k1XrHHbCxRRnKi/hafasy56X+Y8Ra6PNcwWZOpF29p6KN8sfMPFNhZIo2TFNnFE3QqoeJ19QtRV
	AcwXk=
X-Received: by 2002:a05:620a:17a1:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8d01c5c3eb2mr1047717285a.2.1774861564576;
        Mon, 30 Mar 2026 02:06:04 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8d01c5c3eb2mr1047713185a.2.1774861563989;
        Mon, 30 Mar 2026 02:06:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c07ab1634sm208039a12.16.2026.03.30.02.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:06:02 -0700 (PDT)
Message-ID: <90d8fa65-a05d-4514-931e-657451a31842@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:05:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add regulators for
 ambient light and proximity sensor
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-z00t-cm36686-regulators-v1-1-03e23b03bd70@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX7wVFDgWUgMBV
 +iLwQn0BZldb97e/oxtv44BEaEC6bae0kuRyBuh4upUYI7g9jy1hLfUu7slUZO1KwQaY6Ala35x
 ga2mAyJlY83uLcc6S8W0IDHl2PLXZp/m0+1VYMhBj+BuSszjh08nvlH/WcvUZ2tA3b9lpw1qgwi
 zrGdXDIj3BuMS2J0eOoijn/3E6yWnbM6oHubri6COLxvjQJ0ks/1kTtAUaOuRtAmMXh05tKCe49
 gccqolbW9oSXinZyyHfjz4RTi1CvI3KmdiWGK7YIdsVdbBC4Pg0gU98LaebiVELm5DqBtS+VLHU
 qsfAJCrXkBjZEgJAtlxeiRvnoLsTbA6F+ngFUshsX8862JhKf0T4/oQLGL/VkXwxOkNv9zII5uK
 rM3uonBv4TW5aigmIvaFulc1PVTVaZ3F5aF802hL6rroLyZi6kDmFeX9jOGxzbfv7+Fryys348Y
 Jh4K0MK4I+UBggQQrDA==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69ca3cfd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0DFV3Fus7tF8Oymfmr8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: cmA9ojtpOIDpQaf5Q3GSWDHD3IkBoJOT
X-Proofpoint-ORIG-GUID: cmA9ojtpOIDpQaf5Q3GSWDHD3IkBoJOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300070

On 3/30/26 1:37 AM, Erikas Bitovtas wrote:
> VCNL4000 includes support for regulators. Add regulators listed in the
> downstream device tree so they can be powered in during initialization.
> VLED supply is missing downstream, so it will be powered on by a dummy.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light
> and proximity sensor.
> 
> This patch series describes regulators needed for the ambient light and
> proximity sensor.
> 
> In the patch series which added the ambient light and proximity sensor
> for this device, regulators were missing, as they were not yet supported
> by the sensor's device tree binding. Missing regulators for the ambient
> light and proximity sensor resulted in it not powering on when a
> regulator supplied only the ambient light and proximity sensor. In Asus
> ZenFone 2 Laser case, the regulators were shared with the panel and
> magnetometer, so it was not affected by this bug. However, for the sake
> of completeness of the binding, we add the neccessary regulators anyway.
> 
> The mainline binding for the sensor also includes vled-supply, however,
> in downstream, it is missing, and we have no datasheet for the device,
> so for now, we'll have it being supplied by a dummy.
> ---

In case this isn't AI-generated, you don't need a novel-length cover
letter for such a simple patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
