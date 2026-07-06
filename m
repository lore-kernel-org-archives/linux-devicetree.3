Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3B3563DD
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 05:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315733; cv=none; b=ULCY/3z2nDfVl24JeTCzdZRZpn9rZHGlLD6us1FjzIGinT/SB/Pn6fe9eW+JJeSm6N/wuLkj/yEf8Na5xX4ncgG/eVKv3B/PO6rbEhyg8eZWFIQR7gmxEdhauwc5TFcQXlNYMqMi13SwYjVxlthk2WvlqP2kJNKGGAVX6VZqXqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315733; c=relaxed/simple;
	bh=kTpordRqqKUl8WzwLQ+oGN1UCo8FnhtoeNRWYUBKhgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HUfMTk6G603zexOhobaFZpNodPiVTE0k11DjL1m7i7x1t4P1a8MHbBvY7QsnxpHjf2XI9ThkU09Y2pKDu0/z79a49H/p0QWUY7JZkGCn7K1VPfURrx9YBf+QAnT0JLuaPFNI1iZ0uFpD3NFjtHaQdT1v6zGIxNATry7IWdLMrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTCjD9Pg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lp2Dzwbi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTCjD9Pg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lp2Dzwbi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641goI3402327
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 05:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=; b=KTCjD9PgjuqwdhZ2
	6dKSeiGSFQc61DcwHTYZuiPE3Nzt6bkRKmB7JAP8kqILuOjsKUx7MF0CpIPeFVYD
	RUCipmYE7vOki3GEj3C7lv3maOv+cKsubyRLeUSpKniySdE1bexIaKJqFrrc8brS
	EYxHmUm96SPfBzgOF7MTx1BMp3B7GbQ31CJYYApMm0dK1ebt+XiZ00Pfe5aplC/Y
	77bW6JHPQDoCwyfLQ5s1pxhDw+Sjixbg7CeRV/WE+Fo4BcRHQ+jOTV4HVkRSi2Yv
	71reF6u7d+jJhq/Cmin2Xq+gh+IiWjTMD8IeOHsjYw4gZBx6jlCPQdKF8wJwZjH/
	khhobw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgmb8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:28:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c890bac374eso4088386a12.1
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783315731; x=1783920531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
        b=Lp2DzwbiIlRR85ZXn1AUzmG/yZM8HsKeWjDet5BXYEmsio4PuiQ5awemPKcVqJ8zE0
         SWgN5eVXfo+1ael/G7LR7m7EOIJVU3+oIP/cc150WBStFMjYRcCasCzjLVhzjuIhJfN8
         Wpb/Zaph3YhIuDH1PWpwIn10oYhPcSXA5NeCIcy+2ZAnjRXRuEOkkO53GSG/yGLO/Rej
         iUOQfl2mpC2vdjeRsNAXS7AiLEDEJZ7NwAVFKlr0lbSVmJn8xN2ht/gA4vru/oZXitET
         qP6NjdW1jgKDkT0MSQ4KyxqSAkfbUarWzZ0NkXuOy/Xl2buaq+mvlzWpsVjfSoY1PlTa
         wOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783315731; x=1783920531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAV+cDxNEbBgATm6StzQPek5m2H7diNkW5DFl0AvbJY=;
        b=BDJJo9yO2ASIzih7Pkori0XFAvL1yLondtvPB4ozaB3O/oFAunGiHZXgMT6uGvsCNj
         Gzepy/ob6r8hNXuBviiT/hp94ncexuO6oI+SuGRTSfn0hSK91hyOn5gKnGpmZIb6jQPQ
         gK/z6r4O/pdvzZKBsC9KmNPmDO117MOc0IioAvTVsR+FwWhAN68RQq+7qmNW0goxanJ5
         6cC79jKUlmLbdg4xqSQZeQ9EePT70VZog6LR3QcNqm3NSzdTu23sN+nYQrtY/DieA2XD
         GlSTPS/fNERA/eWG2sjy8FMSrp+jfWh2IRoQFCsqL9zHlqu6wrjVgq498n09r9b3MSXb
         BpeQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpoJMyet5wC/3gTe7fW6SIYJ3trSPB2rZMxoBwefs6a7/w7p2RfZMAJN7JlUDtuo0yj2XAyvExpW19@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6ohkpso7vFvPKsE87qvcRcT6x6/ei9kLg4euI76nGhBw0XzS
	4eNgz5N3oLG7vLD2zQ4slSW3z/YGAI064Mapd9EaOgr/BtTEYC8hfIeDbSkn+C+8WSm5jcP1wxX
	1tIwj7dXERtmj00aUEmluA1RbVNy8eEHAcpJI+vR8MkQ0hsYH4+3rhbWR7tyCBa6z
X-Gm-Gg: AfdE7cle4S12ZpQTVc1HeA5uOPv4ZiuPne2h91S021XpjxYZzi9p+Lo9vn24LX1JZxo
	AZr+PI+X/F8lwz/MTavy6Dw1GF9f9gDh5pNWMWmCcFxgCiADq6MTp8ejwR8ayW7BZzSWDq1bIDe
	Ilp+Je0WzO92KTcUcUl/v+/sDds3lRRFvsioraCttICQWTznXAZMn+Gn+S/s6kJJQfn7m+7Y0Bq
	MooVRMLlmVYmUxSSn8f2RtATG/B48asoj5R8FjlxgDz/sgLAr3P6kq/O6QC5SOnvQHqxWIjxiyL
	Z077RpvZToC/bZFCOypiXip6spsYlh8wKDqZEwsxspr4lzlQEN8nzG9uy7HtyoKG0Pe7a8Oe7YT
	aTaxjSH0/y8n+drfi1u65iXmQ1IA9KFb/Fu9aagA=
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c03e5469bbmr8361338637.43.1783315730999;
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a91:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c03e5469bbmr8361303637.43.1783315730566;
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm5875489a12.6.2026.07.05.22.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 22:28:50 -0700 (PDT)
Message-ID: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:58:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfXwsuybsJCrBnT
 m+ILPyYi4sWq3TDQz9AX/Mb+7DXBlNl+2OFI7T82WC2b2k97zp7PS9MwKeoRQPU48V+Hejy89zY
 tN9Pr9PJTKcZQCSzUXPl+pYF8lT3yjg=
X-Proofpoint-ORIG-GUID: R3dAqsIiY6CGY36LzOYbm0tZMWd7bBUW
X-Proofpoint-GUID: R3dAqsIiY6CGY36LzOYbm0tZMWd7bBUW
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4b3d13 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dZunwGW3stLU1k_RaHIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1MiBTYWx0ZWRfX5W2nS43MexUJ
 UFdSSFem6SYR6iUbx5aU5pVVO+VcM6eYBeHbJRpf8qwt5+ETM2TGt0P3LORm+SIrLJp7clgiPCv
 j2LmLl3v/13X6XrLznSz8pdFMHv+1KPNGu8Ih3DYFaq7RPGaeu9JpBe8BOSm+2TNVCZuUEbm9Tk
 g1sEQviYWsXetcC2vKmaL4ygy7NQET0yYI2xETBOS9BpAWQKrQSnfA2pS1KoBVlFXR1GlBstZxc
 CVhTtQIx3ZSSIxFYjHhefLBbpsCSZbyYnb3KDn0JP5EWhA+wQxhQeHNqKfg1mED3v1hUkdV3X0s
 NyJSb087NEqNCX2Zh4ZFWOTRPtoPNg/1VkgSBPqh87VEpBji/rKIRZWx8ZiwEvJxI3/RW13o79P
 5keZJ5QzlK6PKcBngCOs5UyAiQJlx7Cj7JJBw6eN74f+U4TfCX3+2ofOslJn1wCHt+MmBGju4lz
 a/7jSplkIya4goUUJhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060052



On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
> On 6/9/26 5:02 PM, Taniya Das wrote:
>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Almost all of these nodes lack power-domains, meaning the
> aggregated performance state requests will not be translated
> into RPMH requests
> 

Konrad, all the clock controllers are on CX, similar to Milos and does
not have any special voltage requirement for the clock controller.
It is okay to not map the power domains here.

-- 
Thanks,
Taniya Das

