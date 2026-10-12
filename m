Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446DD49B1E9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818585; cv=none; b=lYxruzjXIHMcpAk9YxnOFV6cxusYjHIIdbRPxjNa3EN+J/1LO7qOa2RAC9xTVsdmg1y7PENcFrUjUYKc/hoCyb3GrERPZLzyjdLa2sAUOEHl+m7ckPRKHcZFxzYGJkHBog77V12fQRrcWt4YCzsvOWaXWZQIhRj4W4u9ZM7MO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818585; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0cw0wcbAQJise9KgEeKSWOzhQUuZ+nqpsJTS899IWhQD9sm73Fn7hL+tZnzPCJlnCjt3yWiBNQuHQbwTy50PNuOvQTg09+CRLmpFYdtd0ZoxmNV/9sfjwsrvs81/20Jrwkm9q0Z0bWENLgFd2dlo27vsvrLiYjS/EbmxRaz3os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTdvI4Bn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guAGi9Yk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pTdvI4Bn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guAGi9Yk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Aul2275884
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=pTdvI4BnS5SyTvkL
	Y4PuZh9TQazHicJvSVk7SPAzIMnWeRBk1CXa18H8/yhFoxuiRX4173x854tkoImr
	/vRw1MBCynC7RuyUZ2DnXk1mB1JvwrymZyC8XBvfxAegGIAs9/1e9+xilS2ttPzv
	F0wrH5GCSB9vIvlqiVeAM8Gw1RBr+BO1awD8XtFV4BYivElD7uVWTLJoHYq2W8JF
	tR3LP+yyRzM+Rb3xBgTAo/HAy9ejM0t1mIYUJ8wiZnuJbXkycRlwLT2rVLdL0P/W
	U1PSKYt6rBTUdro/f02/nSSAIu6tN36a5LZrBRHE6fBSouiwLNaKqNyscq5cSIUA
	Rm12Hw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq21gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:23:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0e2566d30so38508137.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818583; x=1792423383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=guAGi9Yk7qBAHjTe4iuEtpVNtOmGew8Ox+Kb52mqMtrIhvj0Z+qCHnB4QV5EeLYwWt
         yNUrzHiMZx5ptWxA3y9tuGuF2DnctkubeNX3NlQ0zdQBpDuWoJ31ytmaCafXSxbR0p+2
         6LGJARAQKpZGHzfiZ//KuzJ/kRVENR446DssD4sdyl+TAr0f83BGe/ON3simODEZ7pN6
         BW/s7s7abmvyCrYZrKNpcNMAE8wA0ZowcPystbv3FZ8P0gQY/5ZXRlI/ozEY8Pnu+gn7
         90m4nz+SC43lBUA2aDfBQ2e2qyLIUt96c95K+BjlLPMCeK/uLpwVxwrExsbW/C8LOyo5
         Hz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818583; x=1792423383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=yq3YY23SWGpMu5kwIrteZ70KaLsxPVq1Mrqx6k+vGS9lh2ZIiWt49SVJkhV5wJj8YW
         JUU6Gpi3T2ReLtZo96LDNxsZEOl+Ej4aO45uwMMybD4YfjmfinfhlyLF2diROKze7sml
         V0Vy1xqOn66OaS0HvrsJgFXnLJHclEaHDDOJ73UGYliAnGDllkN9niX3hC9T+2jgmMG0
         Bdno1jyto5dn1iJCBYSGuB7243rFc8uvN6C90kCZwVofDxbeiRGEGzQLqM+yGIqSoJ3m
         R6I6B9ykjVC/wGSRk4x5meTEap42qIZxKu4OgukmZSGVuRc1DL7jWAf9rN+n0mvPkX83
         VGyg==
X-Forwarded-Encrypted: i=1; AKwUvBxobwN4mhgZ0XhPKUZnP3VEeufk/lIDVS1XvWv1xLmBMklTYMG7oIk9bpJUeg5n2q+5Yz78DtPQAMyn@vger.kernel.org
X-Gm-Message-State: AFq9FYKk8Zt6uJ1LepApIRyDwHuNRr0hNTOGxvXw9nSjBDPQft2CnS8i
	5VjbguC6AESmrKhDSL/dp+nDKiASI+EcT5ivFV37gocUU3d6S/QyzZTaMe/yWmv7jGXC9cXby6t
	JKkhkZoOdEAa1BCtIgEm4xS3LD8IiP39sF/p9+ca/7TMcoXGmJFXBEVxbVz9jK4VJ
X-Gm-Gg: AYBFou3tDYUmVHuePjvXNGawmLgp4KwYRamaFCs8dEuwBZmBl0x5le8v02ut7nkUWGz
	e/885g0IK5LYJscB8ufhdX3Did7mrtsrPYsZqu42FcDk5QoAA9D0KPvleNIk1nJ+Sfw9gSJr9sE
	CqiV77sff0CKb4D82uXsZIEZ2ktGlvhHyCC7dBE7s+87ynlFa/vLzzBTg1XejrVTaOPf3Q7dXw8
	BnIRnNvh0kPxM+bSgo5rjoOUUT7+XyfwZsUQ0Ayb2wKWBas97OHlms1QbteE5LFg/OpUVd1yHpJ
	F4qwqWhSfyzLDDZIBEq/o/s+s5FVVHkShtHmunEoH4VZvurwgkY2ECkiN+IGR6qCKjJf6UL5dVQ
	lgNQ3ffzy+efgz5v5h5h8wQ==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1350608e0c.0.1791818582745;
        Mon, 12 Oct 2026 08:23:02 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr1350605e0c.0.1791818582263;
        Mon, 12 Oct 2026 08:23:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1cd4a1876sm1011273a12.19.2026.10.12.08.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:23:01 -0700 (PDT)
Message-ID: <51f5c9a7-5b5e-49b2-b8bd-a900a906cd2a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/38] arm: dts: qcom: apq8060: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <1651102270b2dbf6d21809f94d00af11f3aff98e.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1651102270b2dbf6d21809f94d00af11f3aff98e.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfb57 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXw3vZSwS11BFT
 cW/VFENGn4VlhAc0+jGlFlgZ95SD87bqajvNJvtIw4l9WDZMSgiSYH1Hl7t1Fr7/4b4sBjnZOsB
 wR77+P0k8kzl3YGpsyiAAMJvA9ISnQU=
X-Proofpoint-GUID: YYWYqKLvllNSgcsfi0T8224N_MdXe4UT
X-Proofpoint-ORIG-GUID: YYWYqKLvllNSgcsfi0T8224N_MdXe4UT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1+x3YVb197DX
 XL5dYL25Ic3l3PhEllpxge+s2U+kW1yNQPrUdPOecVDZXYf7Z3trUbFNHaGyxa9DjY2zn4T5bzq
 P9XaC/TzFDP0zhvrlBgLKGk2Lig/vPYOqforTobY/kBhfhV4oZH+DGocbVnwSeBv8RoIgDPTSpx
 8UIQyyiejiIED82tZ916I4zn7VJgllJWA/Evyzf1e9BAK5o1Z2y9/AIdZXLstSzOMx62WgG5Hi0
 hMjHwPCr3dMaYs7vlp/z2TUZ77yXhwWUHwnMBK18ELzib+yTRrqojHz0pcXpzMKIllLLD5w8dfK
 JEE8ON7BuR9P0kzmF+sha5Y+Mux67pdAV3B9u5YoUp3Z9pdVi6JBSzBmPpi6a4D3smRfYPdOh3u
 W3TVBfPJtox7vXX0AkJk6w3JU71bOcK1h4znm8kRUe3YYXLfEguDWpT/Q33QLSo9shM+cRGo5Tq
 J9rTX0EcjgqnkBGFC9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
