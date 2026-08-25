Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C133E6DD0
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648224; cv=none; b=KCENFeotHm804qgW5WD3MpJMbGbqscBsg2AzC6+QfXnmzEe9qPd+3gZNnbbaI6u2PBZvXrma7ucq/lfQ96hidTrNd0H1mOT6GGt2v+MYlG6CKy584uJy0/SdGMSmqvPxKvs+5vOLPLXNMaBiV8FJF6k+kueI8lnpx1BHZII3KTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648224; c=relaxed/simple;
	bh=8GIUwsRZtgCfuK52kfkZeWWpsrkf4QzemAasx5i6aBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSRtcUGcxPGA7j81aqTIh5JfR5z4uO/rUeKVf4pE4jxr35f9DdhzKFVPJe2PsglPnFVzhZr172RNd5BHfAfn8HIxVnWUV5v8+eqdXHydILx8USyFCKkzhISSCWy+NAP3HB9LQ8mvguimnb7XoARor7YoZdcUgLUPqpTjJKKW/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSI182x9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTAtU2sK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSI182x9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTAtU2sK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88D4c1934799
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuNVclDcvxSe/4OyhV8OfbkBRNHpKfxrNBlk9ot5xGA=; b=gSI182x9Y39yYgVv
	KrcuchzC2H6leSIV9i7D9Y0OQQ3CrK0TelCNTeh6Y6KWUufbNfJKxz0elugj0/dR
	hWVnnT7j1kBwzwzaH5fRzSTAdHp2W+jOyBpcaesnYZV6o+ZT58BoTW0m+LSo5Cmk
	rwNPwwWMWT16QPFZfSq6rbCC2N/hSPv44eD7qb/ff09RFSUH4ZrBoI1Yr8HBv77X
	JO+8i1ASqOApt40I0qhzSVtlsUy8LZhIXkhNVpztjk1VP0oyPKjjBvK4DU9B5FTj
	W21QoSDcSfsgu7CulGYSgrEoZE8E0W3XVJHz8Kul581Km2JwaFqpEX9+YWaQGkfu
	QJUX5w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqs9vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:57:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90a4b2e6b4eso8807516d6.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787648221; x=1788253021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HuNVclDcvxSe/4OyhV8OfbkBRNHpKfxrNBlk9ot5xGA=;
        b=cTAtU2sKkzPiQX8jD98K6IVlkcvRmenCRb9yMpsFeXG9NN20Ikq+OWMLW0E9EbH+vZ
         vqnQ5Yb3nYJP+V3NLFu9slz9S3fjQ9cKqg+onCNNl5a29u9Rj48Wetm/6mG3inF16wTj
         Y6I3CEIC3gJ4Mwh7jHFP38FFBAsCPA2E1bhFTeas6GS3QdiniOsD9n3H91Sn9kNL5V3E
         71UbyOI4qJjNmAsenhmzE6v4VqKJn68ii4Rux4xPkp5vbJ0i+00XIWbfVUcIwJWtaAH9
         U+OPJ5/0Q1Rh64E4YCqIxB1DJ+jpkDVGt8Uy4aH+3zL0k9TUHfoiXoaa+B3TPmPlzyNb
         Qn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787648221; x=1788253021;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HuNVclDcvxSe/4OyhV8OfbkBRNHpKfxrNBlk9ot5xGA=;
        b=W1muIWwoabBNMQabNIp8fD82AF5g8uaKv9LtNSCa4DIz7KYi6Ow6XlouOLWpuxRVPa
         ainujDgOULPfXuUe1UQzpj9iPgEEd7un8ewlfQ5Kjme5Srr/VRpjjlXNGn94SJU8vSfh
         mbevWG8N3s8tKSoJTmjPwi48bNjYFRoOqG4+NvluSRv+pb5gQVhUEE9Hz9Dopl9dMhai
         ExhCQdtps+hvXZSWOLb728T6dGqw5iKad5k2S8ZovyCQgIRA0+zFH7ceTbYAvUNdJtC5
         ZZB5To4+BRV03XZXAUOOGUAeJ+1N6piqE+4h8yKwebfvBxi33khSooEZIuDtehDfFXk2
         bJzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHT9QTvdIAm70wZIjjcyYwVHoqDGed7PyLMmubYV4Ib79jMhSQHiRq2291YIQszQCW4GJJam8k0yCM@vger.kernel.org
X-Gm-Message-State: AFuF++lw15uK1Qiwty+Tk4D9bO/n4h99iT6kotJrxRgTbnEeIztC2nl/
	eadyq2vprFGRfQO9tPG6VijVn4NWysq6afVXuKXVp4NJP3MZlcqC34YxIPtSvzMMs78hei52wDg
	FML3VbV/k7Jom4mOz6a1GFPB3qbHgLL+1+08/0gXYWXQVH4VjMCI/UZOGWZDLBwWGCEW7rTpP
X-Gm-Gg: AR+sD115ltCsbPqh4qNBiu7XEydyHvPgg6NBmRGsWb2sI7ojIgOTvRWiZWaMEjzbdMS
	5mDfcSt0wc0WH+UUyizcB6t7MmdgVseW7uG0E8j7f0FlOYgn2hV4Vpqp2TIU+FzdslJvwqD0KdU
	zYdSl5yCsiACPDpu4B5a0uEZ1MTJfu0UjH4bnCgcDQ0gh98Xg1daZsLgFGDGBj1Wz13fjw0hblq
	cnaceNkhX83frX01eiSvmUoaVOSRcQW8wNnuIg76MRtIrZHcIPWrzXdP0WirqI2YmelaQNjHoCn
	Ce1pP5BA8Ojo7X/EP05clNpY2S/3HNhce3Up0D4zQUmnuBYY07AgBl4ttt0YmD+9Nvp+0j4PyLj
	+i2b2/npVHmulnN0tDsr91uKo
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr243449531cf.4.1787648220893;
        Tue, 25 Aug 2026 01:57:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr243449191cf.4.1787648220517;
        Tue, 25 Aug 2026 01:57:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967459aesm1603574566b.48.2026.08.25.01.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:56:59 -0700 (PDT)
Message-ID: <892c2f5e-c3dc-47e5-9f57-338315332879@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:56:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init registers to
 config tables
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NjW9iQnN4Mvqjt7EVD7L4FT_1ZpToj9R
X-Proofpoint-ORIG-GUID: NjW9iQnN4Mvqjt7EVD7L4FT_1ZpToj9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3NSBTYWx0ZWRfX/4VvJsjILrpl
 cfp731kIi8+C+GUf4/J16RIrXKhhCL95PBQDKcKI0iVa1PfindsWuKI+0oVgKjpqYb9dcToYPQz
 S1WIWFjhrYQglUzr8MyNno66N7HQmTbBx3czq4GrbRlsuX68g30rUC72qIoEIg8bpzCV7w23NEV
 EXwtl6bUiDiP/4DED4m43sYAhL/+JzaIIDGAZR4Zcbhb3pu47fWhWEQRLn0yoJ5AWWDiAJ14D91
 1P77VXeAystncWS9sqVPiEg+CriJWgsc0x6aqWSVP71ae2oeYN33795n+IhltOc4/P4vQUlWmXg
 p7HvxchKZeyVB39EyY2ZFtGqAaop5zkIiT0rcXPhuJDbBE8EXkb9N33M6/nh/SOFM6xEGR7QABQ
 6E5eHN51qEap7aRfabmbyhxiOj7TBUbrBEbuz6/bVf8Kd6aME0IUOAxJjOvm/ErMLhhdCTOoPIu
 FG1G22UnZzgE0NRywsA==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d58dd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=t8z0oAJ6WeIUDCOA0PEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3NSBTYWx0ZWRfX4BD3WVySqPIl
 DXHoCQIvwE8248onEk+kzoHzn0Y1ZJKYgE75hzLV4UWALAd8pCc7dYpNwFrGHaDdHlnamBelsH3
 mH07Gfkjebm04JhLslr4/AALXFeywqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250075

On 8/24/26 8:37 AM, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.

[...]

> +	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK },

This seems to be a pre-existing bug (swapped mask/val)

Konrad
