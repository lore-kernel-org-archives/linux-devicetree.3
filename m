Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF53314A90
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881632; cv=none; b=nzdXxeXxFI+hRrGP63NE5cTQX4JwAPk38ID3BuyJEZnS0468+JTyR8bGsqobjTN6164SFoiuueEc/9oMJo/oU+0WbXDfGKXwQ/+EnYrlrdyi8TJWM7nM8uViK9fL9wJrOBSDmKdEph8QREdjhBmgGYh/pvIzIKjI9hW/5ers7C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881632; c=relaxed/simple;
	bh=XiDrAWYieOq20PsUIQWQPcsJrTUBHepknhKTiIUCdm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MUJZvLzhDYgUu2QfWQG6Y5h9d3FU904K0AvEOJTjaQwKS2oyA1jEm5xN5gGZOM3p/Mc+Z6iMstBD4i7DeDod5HVPR3SiXWHFNzklJAlz3lRBgZBAXp2RZ7QlwyK9ChutcRIHzKFpaLZETFfiBnnmvACVXcOJ/ju7w63GSUOjBZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5lw6c+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDK+hQg3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5lw6c+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDK+hQg3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DElW3479971
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 08:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIR7fDQi7e+NMiYwH12EeBP6IQkj7IAZDunBXH9Fy/U=; b=T5lw6c+VnKOSFHV8
	PEedQP+D2vjc7hhvFco6rOl5lSD9UkLxAd44+/Aw2LzR2/Fb8BlKE6K1TzX0Z5zm
	UYsUgiy3Q4Sx77OOWswhrV+KNnVjFLiwBGw3LbEHD+Nu6ATiilwaUGsFWqu47sMH
	2tKIF8wBlB5+fa2qgZYndJy4eF2i3CulqHECb2GTd9l9OFUi11WYwz0FkL5nVlXs
	eqn/SPiQyKar5Xh8aftRfvjQ3Zpyfhr6mTCzhNTUpyclC38qipHUUpb53FmLZGBV
	T9oI57s79DUNU937/2aheIKWZWHJF7Q4hoM7DJdJ+JGjz87CZP8FcIMyvWhd19cm
	AN63kA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3mua1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:00:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94de248f59eso235394241.2
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 01:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881630; x=1778486430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XIR7fDQi7e+NMiYwH12EeBP6IQkj7IAZDunBXH9Fy/U=;
        b=dDK+hQg3rCReagL6zgieMiIegTIb6CMg1IviG0D99khgmiHu4FbP/kJ/hlHvAwY+15
         +zbxMX7dJoFJnM5IoxwJFT46RM+yFsW8y8Ye7u+0vEnnvpQOuPxjNyktHRqZfxKDZ0Hh
         4h9RQoVcDVkgEVtHPsorYeOyOA0iqWle211nTYVh783vtfw+kzKmtbFqJO5x93iFYUmU
         ZZZddTFy/I4DpEeqNXTyjkfjQpjonqnbouKo+mVIIUIOZVwC9mrNjG5cHsrh7nEj/0hT
         adkY31PM5vpHkin92N7iKfFflJnok5OpwCEZULN5h+CoE/af+cfi8LyXyCk7JBT1SqPe
         mBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881630; x=1778486430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIR7fDQi7e+NMiYwH12EeBP6IQkj7IAZDunBXH9Fy/U=;
        b=pnr7/a92p2YnL2vbSICEtUOJAd8P9Ug/QHvY7lDq3CqZz2xxSH3NtqZHsgYsx9m1Uz
         u+DAybNXEcNxbgU8IIxoOuQjGpHG/lXbkOiw0j6IitYPDY8VaevLVfFqFBHLY/MFjdRA
         6n2pCN2HztjCzC1g1VaZmAkgxRcT9QkwjrMIvQD4GsU8lwrFHK5JkLuXCzWBQP7ZpOU6
         dw9/PQ6NPnZhzX82oMNYKJmbvoGjWBSPFNcqKuBZRaYfAsspwlHz4FfeBoJaxq0Tqbiz
         dAsTBUz7r7iPYejqr5oi4QQf1M2SiD+9HHNB9qfW6/q5okH6lJW//OM3fFfmJwo8ACv5
         fGEQ==
X-Forwarded-Encrypted: i=1; AFNElJ80n3Bci+D6cQ/1uROMqa4D6xmbWNxbkHpxG9mUo3yJgYXdLfdaYqbfCyCbh0hD3lZLTdQqphTZx6MN@vger.kernel.org
X-Gm-Message-State: AOJu0YzcCd8Y1SageWtQw3DjA1oRZFq/IObeJP7z6r+fcyilGceg5bC/
	lyzPiUkQB0SHrXp7D32zIp9FikucccmHI/tfQh2MrGO/s/5Gcgyg+cfnAmqOSBFeR3zcHdA/ZZF
	Umyd8M1drzRkS3ZZL3CEpyYWBmbokTsNLLry7cJatuNItfgmBen7Tz7Gwr45GX0EW
X-Gm-Gg: AeBDietAMQyp1joZH4/H6I3eqd0ba0xQvhmBGwJawDVc/AOu+lRdUOc1HYjYqAkkyHk
	QHEy/RLH6Zc4w/xAV4Rqu2Bc92GRXNEkcBQIJflVQzYVrmlCN1NZ/N/ej+gVXFIpPg9hk0XfY0u
	R+Nx9/f8JGibJGfPGDNAKj8vfcVviHFUYDnP5CXQqjawGH63H3a8Bt8xAodPPM/lHcpaVjm7KVt
	6vl0OYkEV3o4KYV5DaqKuNVnYPsUR7yD9Xg3jdNGbwaevY2XvXZPI5rU+XZ5lF7oNiJXCLB6+Fj
	IhkvK0P3axIRbvSb2K6er9RR96heDti/acbLP1sEiElf526bDbUYwvKEndSU+rm17iZor8Le/1E
	gG6cAOVNw4ow12TaA72gmBTFF3l3i2mDBYMBjC4n7/IoufhY4ihyqjfUKfk8M2T/FpiNJCdUmSY
	OoHBueQyDjUgY0Pw==
X-Received: by 2002:ac5:cca9:0:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5750c63c2ecmr1241769e0c.2.1777881628569;
        Mon, 04 May 2026 01:00:28 -0700 (PDT)
X-Received: by 2002:ac5:cca9:0:b0:56f:4a47:6c9e with SMTP id 71dfb90a1353d-5750c63c2ecmr1241761e0c.2.1777881628038;
        Mon, 04 May 2026 01:00:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc20825b337sm94736066b.23.2026.05.04.01.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:00:27 -0700 (PDT)
Message-ID: <e562ba79-3b97-4c4c-b3fe-56d950ede0e1@oss.qualcomm.com>
Date: Mon, 4 May 2026 10:00:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: interconnect: qcom,sm6115: Restrict
 children and clocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260503161653.60785-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260503161653.60785-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NiBTYWx0ZWRfX/oNunM5a7TwM
 OXhdzuOldGf1yvGMDnByE3wA0bLzChnu1n1HEp5VEQWkt/zO5D7ut09nrMip8OxF1W7o0qvE1Zn
 cdi7w/LXNTQxiPK9s5OOSkuHGPV18tlmre2EQ2uaSyz8OqPMDgJXbCOfnQY0GLwJ9dfQPrdrzrZ
 Wle7evsuxqIeOvR3HF1w/PS+v7n7Z2G1h8jRWEKiMFZoySSQc+Da2g0z/7yBVDCHtZzz5kbbVSs
 lQzFo/nglksgvMHCTdezJMC3uy+b3wqL6AU+5oys00Z6NBOQOxtUGC4QAgSMWWWZEEk/m96l55g
 izev3uI0Pl2r3GpRblrVNRrODKUypw+OLHR4KPL06rwdQUwoCKhp27A/A1g3NRJsdq40LZ2zWe3
 nDvwdBV+sFxWLF8BuPXiWtQfm08tMMmsPhg5aupPiXAd79GUOOhtUKuE2zO2TkB8X7E/y71b5EJ
 r+wpQDqDl8qGsMKYXuA==
X-Proofpoint-GUID: 7ydrHFic3sxWwYepLg0rCBANtZ6-mxMG
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f8521e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=om1VwnBSGygLgw2Sl-4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 7ydrHFic3sxWwYepLg0rCBANtZ6-mxMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040086

On 5/3/26 6:16 PM, Krzysztof Kozlowski wrote:
> Some interconnect devices described in the binding have children and
> some have clocks.  The devices which do not have them, should have this
> restricted (disallowed).
> 
> qcom,sm6115-cnoc has a clock, thus also extend the example to be
> complete for this device.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
