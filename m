Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400278;
	b=vF7c4rTuygTD2Rh/UYkUVfxfycqnPush4FTqaZEuTfpYUjGHQEMJxAUc7TiPOoiHnXnu
	 +U0eRL+IW7jr4VdBD+OMvX1qcerH8zhIYdovEyGFyE0+88Hew6eh9D7vCiqZVDeZwXt7s
	 JHiw6kWAzlR+7hvAQ06SazGTUOCVXs4Mwu8hIzlmbY9uL/nzvGTvWJQxd1bEi4wS7q/C9
	 DHaKAqFJmB/yBLoowMmuVc7L+LmHbovGrENOEkvuU7cooAThh9FXpusdo2JxktqmVEQYf
	 ac+gbNv0ai21R+cPBT+IHgbeDIowptjaG8c3/yK4ry/m23OxxR3pjL+7GKnpy0+4Wyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
	b=f6UwUBYI0t9wjhmP24X4nnnfy0ISgdSQDJIB+5aRWEFG2r+OKSqGGsqFnJbte7x8S87n
	 crLuaTimrUbANqY17EQ/yMRLMRwyNUNcEc1esC9TdePhlL1B5e87iImRqufk796S2nH5T
	 lxQ3LTFtsI2J8vo8g8ExdToGmxUofHvIC131hU2Yq1gkimcU9RG7Zj8X7wpI8SLtsJXqu
	 5kTmLr4XcAgdrhwBeo+J7HxW+PFwLK9vxESwu3uH55WBf9lhgS22lPBBuGB3e6XTS1u9T
	 gj4+i1kY3tj1smTDn7EUZWoC+jC5ZbTr6RRJJWw+VmvRvu0USy7gUtBvN7SJNgEQ0lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M8YkKQJz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dLIxTpxg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2168606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2168606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M8YkKQJz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dLIxTpxg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCPrdh2266935
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=; b=M8YkKQJzuae/NJV/
	myZr/ObO1tyiVD4Kg4EGhWc6KoHQGb20zdsWicCyoLKMeZhcUCke/QJMOjNT5jmu
	fB776SPGIbuzhCGAIJ8KLoAU8JVtR2lHaqj46EwazLtjQWts370Lb/g/NXbEWVoB
	zboCxylr04BUsBum/wyv48LoDD0iMCViAnbvtS7Xjzkh5d8VU/fBL9f0RZqgasNe
	r1hG/116uhf/78bQkcGhl2HCRRjJttIrDHvVjRVMLvsWId6Lv7tqoxOXpIF0AyO8
	Fc4QUi6POKw2ZWLdD5SCZJRLZ1VeRbvaCGQFyP2YeziOMnzpA/9g+B/tpltJwqvt
	SFrtkw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm95ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:31:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2dd8c5aeeso599651137.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400264; x=1795005064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
        b=dLIxTpxgWCFgNgHgpRPhBHrdxXX5aYICMBh1A6fJYH0F0LErATVG1ZrfMp/1kmMmnH
         3I1h2+LZq4Jo58G9xkqDlWpeJNBPV+yMDMjOYmGTuyxU9a+xlvipewUdvz1jc9dsdGa1
         /wscyif6XqK0h1sEB9HA6sAJraPbPKplO9qMHZX5FcyATR0QpOB4zVLl4O8eMfeSZNeu
         F3nC7tsjxwdJYVuV3AHquWKkUu++EWUWPEpnVwKfWEKVh4gdYo/cFwJLFAWMLBBqpd1J
         FvL1nAfyd3V8ocazOem04TUJv4x/umboNIgPQ2cmjQclYbtxQPzCbzLk6FmYS950t2oh
         ln1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400264; x=1795005064;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18nAmy0Rw3+8ZydYCQnphip24SphiKWNlEUNCb4K9EM=;
        b=VXBtWbMrC/2cg/yWcdwWb5apb7YQYX/uCBJyy20Ob44U9g4K5Lw5iEyezDGm2Ntp7U
         F27zVSrZnrZP3O8V8/6H3s/Kc1LUTsO0PU9iUkaXziuCTrT2BDg2/J6RkSmqUg5H5DZG
         NyskbgdKW359M5B+dRgKFPlpmNu1WGqhJAExinXQDAXrl0RYMGGow5/yqjTACtLgYrf4
         Ho/Y821g1iSyIwB3DbCyFaVRpdiD4Aoh59qB+E8NV+xVzj2Pl1E5S9e0cG2rOcAotlj9
         Ck8oqLVF+L5FRzyuRazaQHp10uXo3COLigdjvpHTz/JtuUgt3W3MtQRqCtjRbbhITpll
         Y0eg==
X-Forwarded-Encrypted: i=1; AL+hErGbaI40CySh/IAff5RcOpJTKNo5a4M+qKqqwRk49i9fEtM/6iqeB630hvcSCLehU0tf26EmbKhQ+0Y9@vger.kernel.org
X-Gm-Message-State: APuU4Z+MgfjaGKjsKECbAa7TRg7bRhvYGDwY1+O5kuc0EMn11c6hCl1Q
	guUFx8t28kFKML8aYO/9JQMFPItpdg5+PdlAKs2bkYEmcJtB34EXjrWkBG+ONKa2uvnHSf8vL2N
	p6Xz6GwmmkGHV+vpMEgR4TNErpqaVsM4kfjbn0dUUJqvnUcvWz77QClN2u6XwZhyL
X-Gm-Gg: AYBFou1qWLT1eflv1UTlyUEvDt1pkhMdaz8+f6M+KRnIbQpFTzG+YeWK4GsPUcbAAIG
	DJW1GbSt+H3sgc2LtnwyGs1D3mvLInDSV+VCB+yJGdYj9D0yeveDpySFVg4PbzdwWCxu+O/KAzA
	mRdF1Vz0yFROzxt04TqLjQ6bflXDc9kbt18+trS63iFmXexaKPf/iKyRSOfqVUh3Y7t29zfP7Kk
	A5CYbFkpIy5k55w1eLs78bkfcSktUVDFd7sChsmuT2Srv0IGnWnTRmaVj+bHAIHnTck/5Ihi6Hz
	v+PW8haFT6KnRpaj2pIcUe8VC7CHdnpcDGchkt8qIVE+j9YRRE8nQm/oYW8cmDKhIAiCJBIfLQ/
	XcwS9r91MahfnTEq/LUL/K/TzIpG/EbZPLCfEd4aqKU1lB2K1RDMfniQRx3ZCEtNZxvlbU5GGFM
	k=
X-Received: by 2002:a05:6102:c54:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7d4fb255ef6mr538740137.6.1794400264174;
        Wed, 11 Nov 2026 04:31:04 -0800 (PST)
X-Received: by 2002:a05:6102:c54:b0:7a6:d11b:16ea with SMTP id ada2fe7eead31-7d4fb255ef6mr538702137.6.1794400263480;
        Wed, 11 Nov 2026 04:31:03 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951f237sm35965765e9.4.2026.11.11.04.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:31:02 -0800 (PST)
Message-ID: <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:30:56 +0100
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
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich
 <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel
 <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <avRM_GhtR8vMdTO4@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Yzp-okGZlo2ScVcFzoLNmkie693wJ17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfXybtAbXmGpzjs
 Wgr+2cWFlqsHI1ieI59+11BgkTxprUUKu4ZTwdVxDqM2eh3oH7Ltm4BN6QvZSuJIPFudF5oN7l/
 RbexVHr4OdzVueOVakGbq27OqIHhBtAOTvBJVIycs3CXKWs+Tcaz7KAXs4ws02UjGRM7OP1o7Lz
 k+b+d/2EfkePM9TRSl0Yot8lzQsDKMKNyC9VFT+kE42Kjw8URBiyU6u9o0erdf7DiWePJc4hrIP
 tbiOBfQkD+zCf9rMdjd6PlG2WIILI7NX5gd54W7zSnW0FY+ZRgysRBCASncB6uIvjMFJzr5B6c7
 2+HCBKk+syaGVyCcaSkIDWe13W/On7SyF0Nigq08kKT+aw4yVjmtgHs0IUGaJfKxzzwg2y7+O35
 3u+W5oOU6e9teE1o5+vXr8tisOOg43C2S6rLatS5o/3ZpAR2XjYLeCHGFlr3UZ6sO+IXtzYIAvs
 b6Mg+YDIMrNfPW0PMVw==
X-Proofpoint-ORIG-GUID: 1Yzp-okGZlo2ScVcFzoLNmkie693wJ17
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af46009 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iRCOULmDqfF0gFl_j5kA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX1Zu2J+iG4u0F
 +jYNM14xzY9L1vw6ilKqo5cPFpBqJEQ458/C562OD3QOv5NTrvEC7FhEypgTpAVNJp0KVSFqOYL
 CEBHZ3zAWYs9mcNDtP/BxLU2CQx0uvY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110049

On 11/11/2026 12:13, Maxime Ripard wrote:
> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
>> DSI panels can be placed under DSI bus directly and many Linux DRM
>> drivers will work fine with it: mipi_dsi_host_register() adds device for
>> such panel and DRM driver does not use OF graph to configure lanes.
> 
> That's not true. We do use the endpoints to configure the lanes through
> the data-lanes property. See drm_of_get_data_lanes*

Some drivers use endpoints, some not. As discussed on other thread,
there are more than which do not.

> 
>> The affected here Linux panel drivers do not use OF graph, either.
>>
>> Requiring graph port for such panels is tying the binding to one
>> specific implementation of Linux DRM drivers, e.g. Qualcomm DRM which
>> requires the port.  The port is not needed for the hardware to operate
>> and for some of the Linux drivers, so it should be optional.
>>
>> Suggested-by: Romain TISSERAND <romain.tisserand@gmail.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> DSI busses can handle multiple devices, and multiple data types. If we
> were to drop the port node, how does the upstream video device know
> which device it should send its video output to?
> 

We do not drop the port node, who suggested that?

You do get, that we are not talking about the DSI host, but the panel?


Best regards,
Krzysztof
