Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603832;
	b=wL0AiXNeU8awOKR+TaQhNC1Cd963tiRft5K/ti0HpaOI/GtPo/rnrKgE0fXpqcE2c9gk
	 1IZGrdOb8z59uE3fHJTMDNiJrnSuxDUw+EYwo99GDHlaSkZ0rHEptKo1f3jIWf1XYMlTQ
	 gY2brN0iveErE2vG69ChSx06aORwol6QkjYwwLrAKJQc2BWLKU9mcB445bm4hifSsKFKF
	 zOSKbsfwOBTbAraI48bkKrkCG3IL1vt/HNGe/bJ/R4+6H5Z919gGb/lK6dpbZCW4GiRk4
	 PQnpCr0w7B0KViiyIxY8hVw96giX/MYEE9G54a7HgxzP3oTrflh84tjxjGiKuLcdVLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
	b=yiwMvEYN5f5xZBN2AaDoXZpTCC3cptgrvzncYjzzrZcbFqag7AAH3hEN8N3/nkzzjw5o
	 b5EoUKDA3lU/UgdVu/pvC9TMzqbEhTYgHbWbwfIPIJ4QoaqgA7Jj/FGIr8T63+0T6QXV0
	 ZawHD3tO2h8XiOihRYRDUPO1X4BLldUfMlWWircuqGM7fhtoO/r5a+8bGIdQT86/tI7/R
	 rnrxzgmB48YZKTNGHIhPIR0IeEWSGDz9oG79Ynm39mPBS7cskwPzydWFyWsAOFdRG6E3M
	 2FvRUUMdtbFWvPyexGGh7iDkaNXzP8GcdSgvFcjzLcnso3ukhDdsrr5C251xDFh7j5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hB61JRxs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGH2n7Nd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9C7606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hB61JRxs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGH2n7Nd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mkUu3642560
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=; b=hB61JRxsX8FfHAST
	nuSPnLvl/Et3RzhY+S4vtXxPMVhGcfRM9gxNBzVh8Dfzlr8h0SRTSidsxj1waO8F
	C1kSl/KaEAkH8b647LMM19KRWKt6HevMM4krRmiTi8/9OBaqt7utSEoOWwGR55DB
	+cjFuwYw8MdfLTc2zWSnQ4NBpT6DMfYWMkd7fqYTnG0DiFNCFJrsb51+fVzB81Tx
	LvPLx6yZbUWAROHQY7VVdx0sHBEO0duTTP/xHqHURPR0PGyNnK03rU33xBS9DG9H
	q+D3lnCeQTn6wIC+tj2MRcvKCva8ETJNDIhSsdTwdoEBzCMiEpe7vqJaTcHkgfuw
	SerH9w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aeuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55b9c41fc3cso16937671cf.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603831; x=1796208631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
        b=AGH2n7NdMuiGVTSYiR4Jhxlk59jv+RnDvlqYX+oMK2Ck8/DP9+TxulgLgzlMgPzSu/
         3mOdUqNca/XWR/+byDAYi1Ku6LmbiZV/HKxoPYvGDGubzCzBZq4DMbv0QP9DHm0ebHgC
         JJM3ryS/1qwdw+UkGKzo4qxe7jk1vk1mc8f0o/5u+dP1NMIuY9FvcbVOHKK7F3YbVxu4
         VbJPuJzr+bLCZ4bi/tHcSGvnkBmzbSNp8mkd7dviMXD7oPSWbMALdjva304WfVoBgjNe
         ovv0T6kAmhelOb92YXItPuy/9Jl7Ge/N8trDwC0I4cFPDi2mbtM9h68vlcRidgzfZQM7
         35sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603831; x=1796208631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
        b=0LJER3pdamIo5HwiKY/2lMjmzeqGekQgXjnYNBREmx3D8FDunGOuRkSNr6W8Z9Rcqs
         V28fDs7H7YcJd45VBZ4FCdCaErG4FlIecPD0h3tbUaKcp5a3Xz9t7Zt+EPvBGWdXKe2L
         AsKtZjQJbwSGH7Z7HYZQMS2Jf1aV5zm5QXJBjzLmp47gtdS3Q8z3VFJ3qanhyfP+9Dl1
         z1t7/UiapDILLepPdeWPuUAXSEtnp8abJDMANgnozj34DJ8GUgvC2E3Nq++gwJIRYVPP
         s+XK9Vb+F7GaTvGKTKW6IqcjFOgIDJDzDuv4JPyTEq0M/X9DvZ2ZHttqEpEV1/HF5vcG
         phag==
X-Forwarded-Encrypted: i=1; AL+hErH6Smjf/aMy3CEez8wRlCgFrRLHGkfPeImGwin16/U81tyCH5ZuCn93XKN0Z9elRJxQxeLr016we9Zm@vger.kernel.org
X-Gm-Message-State: APuU4Z9KqCGWd7WrwvPWfMZpzl5hHo4czyC52QJbHvixcHVkWjDA8XPb
	fPVOq3BM8V7u87qvEp0z3DS+GCq3ygBL8jB8FzJqqn52NkigE2uTzKTy9gthtKZDPujbBSRJhAs
	jUKXtHasLFBaBtLW3Iyqx/ddvmFhdtyN8lbOrKrcb16PpXtCYyDXjruH3VwvRJDyi
X-Gm-Gg: AZFdTZd+VAzPbRiwZ/xvznrjVTbQ+yNC0XYz7/K5DBwQDc5TsuFtOtil3n1fvS1kvhb
	sJSwWcbfXLpmtSiigkBWdB3vTRF4eUvRuLR4mfRrKEa8qTpnE4HiNM/TBNOsnc1JdmUU0YxSvWj
	nhPPyiTV2sBbpVZEegjMY7+uGbuYemcsXIwOxJMqfTTuntTP44ANBbKhSHrw+O+lb/9NmgjH06F
	TRjRd7+NDA5MtSZlVB9Gvxh40wlNTSxtLoM1xzeAieJPt8Y0POt7CgG63fnkrChiW8z7hH5Ii7n
	SyqlCgonCCc/H7MTz7IO3B/Fdb2AuhrorbMZR2KZ9Foo54i2SaRaB8xVLg+8HXG7aP71cTT/5f7
	sUfH75tHoqfTcL9/ugGaegMtuuPmuObO252OqeeeZ8M283EOHiUGDWLdAAd/Ht3ZenvM1R68=
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr312121161cf.4.1795603830687;
        Wed, 25 Nov 2026 02:50:30 -0800 (PST)
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr312120901cf.4.1795603830306;
        Wed, 25 Nov 2026 02:50:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:29 -0800 (PST)
Message-ID: <25cb1a07-b334-49ea-9259-04c25459e8c8@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:27 +0100
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
Subject: Re: [PATCH 04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-4-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-4-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06bd77 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sghjjhV7bxI5PrJzascA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 10wofly9shmt261SPIDAqUgvfCa2jzu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX9RJBJIwxpmpj
 Wxn7hsD4XXKRXnLCtBJOMoKKJRSjjNbsyJLdeFCZw6dqMsrJko9D2vfBGWhHjFqgUogOyfZzXK/
 hvsAT6uKHFgWFRb7DXV42+p7ObJogBGNIgS6EM1Ygo6B7wIy2uudk0ktphRZwnhPDE3VJaWn863
 5Mb/z1/rNiuYPJn6zEhQJuhSjborZsx09BIQzMwPFgdHI056HvUzVlePWgqg56+eYahJMWfn5GH
 6SNACz2T+2nQC04qmhAIRd1Cm9Ggx9D5o6ZYbhvvMuud5WZXDF9F9t+5GYuO5TxcYr6Fqpt64ku
 jv1E9Un7pF5DrUnqTuDDLjvsOEXY2gP1tJcj+LZNOpoBbky1vI85F+PzdcblbJe2CCHhm2hVi8s
 HKgUT/HS49SpbnaA9x16TpQALUYkg1TuRWOvc5cWix0kxwOMcDlXiRNqLH9gd6ys8RFURlJ9azA
 5C6wo5+Xk2fmKYLdRiw==
X-Proofpoint-ORIG-GUID: 10wofly9shmt261SPIDAqUgvfCa2jzu5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX3TpzBAlntnxY
 wFxmS69zMG7S0WV7WNLgQuKxlKlyJAViwVTGs1pjXXZ0HZb8g3yTiyMupPXOmBxw7RlRiZSlmJ4
 i2b4f10Y5u2UElXkX7KmO5rfTpekS4k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the eliza driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

