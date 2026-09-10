Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924743112DA
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026158; cv=none; b=AA9eJadVlCUA+gI8wV3y6Zh2AFZwlv04g2wDnxmToGj1SS2/edm02zqZj6N6lt0qTdYDmA3VxKM2SXN2SIXIf4l1VEx1Ejr2P9wDUIlUqYn2+vcG6cwxD3LZBHO+NAf8eKhjLj4cBQF5erXxmpqX79kX6HBd30b+oKP48UaF9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026158; c=relaxed/simple;
	bh=vjldFUlWJ3Bv467WKqjWPrWJr/pIs/4SUNGMbgof+iE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RInBITMX/cnK1EirgVkIlvGeWwJF6D2bHDOyU80qbUdA96w2sMUvtk5pE6/ONqaQ9xQAIduWSW88v+fMdscs8UvvzUK4JXltNYzfi90PFDFWcA2uIO81jNtziocxozyQwrwzBk1SFbtnIBM565WH2rDBKcOHhonfVa9sbjRUhV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/Wrz/In; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EgpY3e0s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/Wrz/In";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EgpY3e0s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A7aqTW174087
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HD3KIZI/JGXXpi3r04AqikoOKtna+WhS+DJyoZDd85I=; b=Z/Wrz/InqhesG7hS
	sa34X9S+yBKauVlfeHvla8IFGF9qjU0McP+8Ndraa8Ofnz6oUBJWL7l6SZp/piht
	9h1DeGK8asV2PFTmA4dw7OSLPZc5pSUEa0oXHoEkzcmtfbJ6FfimW+9adkIQixE6
	Rvb+RwWfTZs4MGi4Mx5+xl46rj/xKKoJGR0UI/IIq745I8Sgf5txYZZFljnLMTqb
	/L4/Q8aiQhYtlYA6ZOHocxgHlE8noTNcGLGzbnDW1wmFX01zmlCwx6Kcy7z+0r5M
	csYfHoCJzgB+dCSR2d4gy3mS0aS+59hsKnNw5untPZutxxTp5NoHF7UbKT3w27M0
	3b+T6w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak80na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:42:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d7ef17031so10779861cf.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789026150; x=1789630950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HD3KIZI/JGXXpi3r04AqikoOKtna+WhS+DJyoZDd85I=;
        b=EgpY3e0sixdtjP6MMBmCb4qb3kAt0lSK6SIekiMe1fEc3Qngv9e2e04+94j6+E0b7J
         XsUJYTkOUaVl0z0iMLys4RmQui1r/pTrK9TpFKoF3qu3wVszF/UVoxOUwYHGGT3y52B9
         oLAE61CwfesWdIlWqimzA4a5CL+Trd1I++/PeLzBt2a3O2DhonufT7joEz3Iai0uqsDI
         e1rb7CFeRuaQz/Fti2gunSs5jkVll1HbZl7vxh1tRcnlkWUIHTnYwrMdGbUqb8d0X/YD
         b7p6YWH/RJjhZVqbesh1nB2+AN+YaEzdGIGnolnu1dyiJcOADeLDIaZjvZMeqQBbkHfU
         Ua9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026150; x=1789630950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HD3KIZI/JGXXpi3r04AqikoOKtna+WhS+DJyoZDd85I=;
        b=pDLGjm96t8znjrOFkRpdUKjOsyyXL5G0xQKBbeYaPB170GcL9Oo08yLGKUiUot0C7/
         G11QH4YUoK/CWKS82YAPWDVIwOHzpLUG+N3KfZhTscpJFhZdEj9yLcQuiYmlbdcWybF+
         DGnbBlo8lSS4/HFfYAHbRZfANWZ3W9xOnVaW4V7c0kjO0xqNYeqVn3p9RJUcMIfzO1wx
         qDYngN1kAA8nSfOvN9LVAQSGAi4d/+qWRsb3iS8L74e9pyNItB4MSpzt//aAWOQHZu5l
         JyKxcset44oo5Jrbpgn3PPYSMOZKuM97pyd6ycqQsA8emDkGMLxKJult67zEugGnBJSR
         YXaA==
X-Forwarded-Encrypted: i=1; AKwUvBxfyLRY4xbt79fGTIbycXn9BL3Qm1P9DKRGMr7TTPRHy6ZM4ivqNnR6uWTPequzWBshiYT2jJ2wjXd8@vger.kernel.org
X-Gm-Message-State: AFuF++kgFVBJLTuEArUBmkZikk8R8qQT59NDtz8ByeFhaQ5ibvYg+MPz
	wzRZjtfnkZvYx6Z9Wo5V2Wk9AJocK7U3Y+rVcGHstZEGUvesCvqs1aDIyHybjpF6zjkETu061Zv
	jBgwpOqVyFunKGgI5g8RcRGI0LXnNc/Dqb4/hRgTnc4zbgKEDUq9QlpvxkTuthi+B
X-Gm-Gg: AYBFou2e+L3zrmwD74ylzx0Ozolg4QdZ8MmYKqeF58PtAObPQNDAHws6K6CAp4arK99
	6uC+WR2NBWUPVFxnR+3XMAqHN01qNSZAAKqkQ+eKm8NsF1fL73ajbf+BJQ8UXNscjE2R+yzkUff
	k8ilQQvn2JJE5q6hwnxdUFa5vW7PhCB3hPrQ+I56AUy3/ITTsp2S7NckXJy00IyabFjn4dF0RHw
	o5OGY6EGh3Q5sBYaMnjZPqmkKW2sCsn4hs7WMniARz9xF+8bGV37MuiFofh8fvsbFzYDlVw9UgC
	OWzJxp3qpqkO7oJW5qjAnp2XymchMhvO4EutuJYoWIkMRnaTv7upnHlpVMNd5JmIqL3ybztLhLm
	IIMVxId02RgtrqOux+/48gQ==
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr125141856d6.3.1789026150356;
        Thu, 10 Sep 2026 00:42:30 -0700 (PDT)
X-Received: by 2002:a05:6214:3d8b:b0:907:bdb6:6534 with SMTP id 6a1803df08f44-910477624ffmr125141576d6.3.1789026149993;
        Thu, 10 Sep 2026 00:42:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm793516066b.25.2026.09.10.00.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:42:29 -0700 (PDT)
Message-ID: <c23c26bf-d0e3-4bd3-9dbf-3096b0050f87@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:42:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] power: supply: bq27xxx: autodetect bq27411 and
 bq27541
To: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-3-rinat.muhamedgaliev@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909234744.1177153-3-rinat.muhamedgaliev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4NCBTYWx0ZWRfX8l4pzjW5Ri8A
 Sj9EMMnyUGquvzhj9+dUX+/xZy8UnGbHrW89squraPSmgyOW8UEb0HW4Bxwhp/Pfa/3oPZpX6F3
 c/zDLhMdS8Zq605Bh0bCBEIcIQdkRE4=
X-Proofpoint-GUID: HLVldIFIbQnkPSprn2ySnmDz7egwYnQT
X-Proofpoint-ORIG-GUID: HLVldIFIbQnkPSprn2ySnmDz7egwYnQT
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa25f66 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bY1bNIcL0Yak-Vr8utcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4NCBTYWx0ZWRfXzvt3WxRWJa8P
 CSEscPdxl5ASAvusmbwY2uXEHBt+tl1PWNsY/Hj+saTbZoJcGGUuXu3nczgGZcradF22Rctv3nw
 bBB9akwvSuS84bbac6Hee0Knal+vTWfhjQY83o/kRrGmk5kA1dKWWv/5BfyTrxDXd3Sr1GTZp71
 ecbZmiCkWuzspFRuiaMCGx/Eb0TMfBPNY0TBl9omVRBybY8UfDoFwKQe/paf84+yHRfQBg0DmwN
 rQIncrk5NDRM3wlxlYifVBQlEB9oKC4Jmd/rh0fgfR9D3C8ndyvzWl8CsJtbusiWhTeRTxqWiFz
 WJrqo1geZsOnx2mQ9W1Js2s5zh9Sk7/qPLfYyCqHLpw/MjInLii8JPWPxi6Slr72pCRqF6V02gR
 lufwdpvLHWnxGGuwI3EkLWwvRY96hnDbQ4ScNYPHxH0RjQ0BfOgmFPv1vBDtcIbbCq9+oLnWdW4
 s+QF8yfF4bQxF0dFe4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100084

On 9/10/26 1:47 AM, Rinat Muhamedgaliev wrote:
> Some replaceable battery packs used by OnePlus 6 and OnePlus 6T
> phones contain a bq27411, while others contain a bq27541. These
> devices require different register maps.
> 
> Add support for the generic ti,bq27xxx compatible. At probe time,
> issue the DeviceType control command and select the bq27411 or bq27541
> register map from the returned value.
> 
> Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
> ---

[...]

First off, please don't send new revisions as a reply to the
previous one, this creates very messy thread structures and confuses
tooling. You may use the b4 tool for easy management:

https://b4.docs.kernel.org/en/latest/


>  static const struct i2c_device_id bq27xxx_i2c_id_table[] = {
> +	{ "bq27xxx", 0 },
>  	{ "bq27200", BQ27000 },
>  	{ "bq27210", BQ27010 },
>  	{ "bq27500", BQ2750X },
> @@ -262,6 +300,7 @@ MODULE_DEVICE_TABLE(i2c, bq27xxx_i2c_id_table);
>  
>  #ifdef CONFIG_OF
>  static const struct of_device_id bq27xxx_battery_i2c_of_match_table[] = {
> +	{ .compatible = "ti,bq27xxx" },

I don't think we need a new compatible here, especially given wildcard
compatibles are very much not going to be accepted by the dt folks.

I think it's fine to add a chip_id readback mechanism that would be in
place regardless of the compatible and would say something to the lines
of: "detected another chip, proceeding based on chip_id"

Konrad
