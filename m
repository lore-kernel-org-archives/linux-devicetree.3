Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071433E3143
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946332; cv=none; b=ftvJq5uqfPGbcD6zgDNBm9hi8/HVyEcfRSSUrv7hu/FhLcaWAV83kLbU8wPUMH+3K3xWakTz5CmDhPUjLbmnpDPDym6rbyQEgxezg+wc5Gbx7cvgxB813mAiA/nf4anCM+Zpm6xPv1FQZc3G0b/nvqwp2Xy0QS50D6wNRufg4dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946332; c=relaxed/simple;
	bh=FVx93lCevswcq5l+R2VU0JgE3r8sIXsyEhbVA5OTcdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nKoJlZq53uDechuZqBd+uGryJrxk9rj7GDRW2BD6NNNwRsxmb/y5p1PI+zNfuVf2gifcqDyZewDPGdWsr5iuSaPo98lNy4PAbuymvIOaLj08JFT/rBNKOhkChUa1adu8F140uhUEloytNwqDPwORGu2q0FThIhOlOldLEmirJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozc6h+QE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvNa4TQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozc6h+QE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvNa4TQh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V634qI1090666
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KFgNcGo+xYoSpwKsV16d4sVETGT1v5jey0T0dpg5rnM=; b=ozc6h+QEkhv0Ihjr
	KymCYxrNd3mu81usiTPqN5xHUKuSZP7zd5JXvkC1XNtb0K0GuGzK8Ir1WDoqciHj
	vgcL1JIjSNPkLrfdQpJN69b7V3CbLdUAdeMOWKcXFRvaxIEOqUnLSYOhZoJlIqA3
	A0t/65M0QJ20Ig0ezOuTv4HjzNZzRBCvPNRzEh4o7E/tDlMkspKbKe1Xywqw5Tpn
	krKf8t8XApl6gqEQhTm1nkaGIQej3JOvqAGEQL5mUrCaBxguiw6fOWnfpzkWuoXb
	WKrtQ4DAtn++i9umFwbKKxuUHcdXWgWIGIPPr3uLHflPFLxC7KSd6MQ+SbJuMpoC
	/CkwhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd3tgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:38:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cff2297253so159162485a.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 01:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774946329; x=1775551129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFgNcGo+xYoSpwKsV16d4sVETGT1v5jey0T0dpg5rnM=;
        b=bvNa4TQhcYYbjquCb+Yu6bT7+87+8xHLTTPR3ECElVtMdnhklMtAGS881b3aHi2Lvk
         kkrl4rtkF29jLkv8IxGbmsFgIUX2oHb2FzhiSaMokGf0OZ1Q6TDZ3TRavMOXGDLMjVJN
         yNy1w4iLwILLpTqHuGsYRP1IyWKDzxjNmJnTtnCpqejhe61ILppTAdGQacq7TyZRAER0
         DoKo5AA3y7DXdvmCennTBlCdK6SZwwP3oJJd0gGnODgMiNTjaxjdo7Qjl+ytOriQkHAy
         qdhSYDlQb82E7hWZD/Hkfx6nyypD5DDZIa03f3W/DGvfcRyweJAyREeIPIHugi4MRS+v
         DCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946329; x=1775551129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFgNcGo+xYoSpwKsV16d4sVETGT1v5jey0T0dpg5rnM=;
        b=rKQRfU4CMQnl4gF4Cn3QWAzV++HuKjOhQtfye8Qq8A3DKowObyI6NnIXeNT8IwrDMJ
         lB/80mh8xLL+V2sY5AXU9e6ofUttRnBLZkelj1LjAq//lIIH1mV9IDp2+iI1Z19kusDa
         n8YAzce68tpT+DrpB4PmRpejqAVTCBSPT76LpCTvlzGPE1xfw99SGMPcL9055Z60rPNp
         /HMqdcRhhF3hTVjsq/4hafIUNHVInvFr5Yk1qZlxoCNTvMP1f9w5nYOc0bbG38TKaBBI
         D+HAunWWkyEvQfLLcexejnKXGHDA+OJqo35FG1qGWVblQVJK7MYISRvqcSIJe58YSBkD
         lavg==
X-Forwarded-Encrypted: i=1; AJvYcCXlR/oVhLDDdgV4Pf89wshb505061K9P23SVsgiYbcADjcK12E0hEzioN0y4MupxlVgqSJdAGn/idZ7@vger.kernel.org
X-Gm-Message-State: AOJu0YyRVEfdInyzJFGhvnC0qCeWhphy6cwJbXDVqCaDTzL4jiUjizE0
	zZxqiltg/PCVnJf2aT57xHKq9mZnaw5uj/ki4awsPGZf+IkmJdd+jg9xvgWA2xsV5QLegTz4o7X
	w/t4w/SyL/wfeXxRNTwZ69WDu0JIRiVOGb2J70njpWJUe6asNSrWMvEWQaCCyFa1k
X-Gm-Gg: ATEYQzxU5gHcDaASX7d1p1UxAoRi5QuAL6vUm/SymdbSPROMb0ZdBXfe6YF6Nr8FEvU
	4nhOlbThbVR6gVxKSMsyWjSa0d+Ao+1RqRo965REushTM7pSmzti2U8ghz+oP9+5+WT78CpaCgZ
	9HVoYH+m/90dytf8c3mZHxwD7K+J5JBbN/Q1lYkHw4nc3K8p+PTr/V8vSfw78UYTpU8Ms322Ax2
	53h7bCfS5tU4dPhoPI1M4CZOWDCwkoyY/XEd9q5j9vpCekqHKOVtPkJEUOhsZnJ09U2t/zMvlnP
	TakgeLz/Et1/RGv8PkJYayG0taZy5NUxb+2DvBokXX3jsfgG/NaYeVbMJE2YGLYBrlGGvkn4uu/
	YJA9knoXmapAchIa3/Rc2HUTihogU+1r7em1v7sHc+dbZAlJjMt7Ga3LaUVy0sFAvg55idZ91v4
	Skx8o=
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr160828411cf.5.1774946329298;
        Tue, 31 Mar 2026 01:38:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr160828171cf.5.1774946328912;
        Tue, 31 Mar 2026 01:38:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24145sm367561366b.2.2026.03.31.01.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:38:48 -0700 (PDT)
Message-ID: <0747adc1-0d6f-475d-8217-9d1f1a2c413c@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:38:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google: add reserved lpi
 gpios
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20260330164707.87441-1-mailingradian@gmail.com>
 <20260330164707.87441-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330164707.87441-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TmJNbjcPK9dnygEcikJYkTX8J272CA-v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4MSBTYWx0ZWRfX6RP55ZjniykF
 UUwMoxv0H4/oic/jc7f7m9NJBeoMKXnclbxNhJm3R7JEsP39sjl7NCOH+zvQdV0Of/RvRJ8JJog
 SY3ks+qT4NpfHTt3ZOmzrIWEmlN+Bl+RDO3qKhwZiHANNnvnf9ySeZ4BpNQ4dSQzIOHlgI+c6TM
 Myxz6VXirsAHf5q2DSg533NiVrEdcczGSAnmS8A56Dybilje61wc6xZNfzohFHuPvaenfQvS6mV
 vNxR33Rk63tX8+tnnrCuWjKDgPaX5Y59NzxFbRNxfBvoWv3VL0c5osSG7mmIPXwBG2qv7IkRY+q
 wpoyEX8oK++vBGgLW/oZfVvpzRYdleF44+v2IUIdZFEezU2bizook5s2fhvxzW6RQpo8zrsQSDV
 JoGkJrbGqso5pCK7DXxJksZtbktPLCPlGlp0xe257jchfluF3H/nNVjSBMtllPqGNLIGGD6eDK5
 9RCYKHgU0txNebPvh5w==
X-Proofpoint-ORIG-GUID: TmJNbjcPK9dnygEcikJYkTX8J272CA-v
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb881a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fuxX-muTBhbXr6ZgZ98A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310081

On 3/30/26 6:47 PM, Richard Acayan wrote:
> Some of the GPIOs are reserved for sensors since the ADSP also handles
> sensors on SDM670. Add the reserved GPIOs for the LPI pin controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Technically this'd be best squashed with patch 4, as without this one
applied your phone stops booting, but it's up to you

Konrad
