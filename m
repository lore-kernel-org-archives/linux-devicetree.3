Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620769;
	b=fAYsChaEuXbCZDG9/slNBh8WoVMwPFSwYXk1zIF0oYHoIdqWNTYPs60m02t63dcKvFRK
	 JjzkLlffAuhq+nmU6FtuNXc5jPdUMHHL/9f83FxOA7pvQkJIBWVs/jw2c1X1rABaIKuIx
	 CJjt2c9FhhJU793EXdBGCHky0pAvZ6iZjRl7fJhXFXR2kY6sg/N6V3CTO39fIjBfxh0Wm
	 LiKx7JVF38EFXFD8RVlSks9P6DMk+rI9f7FG6yUC4qx35XqkD2DxXNHLcRwYG5PUBCf0R
	 UrcstBq5O1lyAUz6mkoHjlf7387wwWhS1uwGogwbB7ujysBL+V70T86AzL5epAvb46A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
	b=eBehgX+J6XfzQm08w7lvy668BcjblvyRD05ek/uaVSLh/tg+HEbwuvVdW79N+jFGI8aQ
	 6gLIf3K/hEb5c0AtvcNUIOK8ZYZ9wZtPka80TxGJX+kuMnQZmzwHByuaSPweS/zvT6RDt
	 pR8p5B/6UkYU6x/jCFuPrqPRR6jWvSmF87uCwiwiYvI0WjzlvB7TDTJ/6SpFMlf8XyZa5
	 JccZgzcblRE8uU3l+wcarywXMl1A/M+QCkpJd0q2ISVtATtSZ2xfTEigJmO9TK1NHPCW7
	 3Ssp2390OUPNuwWmgNcq26cBzB1H+vVn1506r3hKJ4WieyJacxnBtld2aAgfKfhdpCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RK2HHeBj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZksFjal9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345AA60A2613
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 345AA60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RK2HHeBj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZksFjal9
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A97o4039352
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=; b=RK2HHeBjVeFnidnU
	oFUwn1G0rZsfbDoIOe1mDEJvDU6WhYabIXrOIvTTN3R43DuyYCZlTATTzJu0SiS6
	ynVHCuAa+dM+NZEwSt2Hf948QH2vcvU2OZma8qirKGKo+vrdU89NuzdpF9o6fkyf
	uHsre8dliUieMfKhh9aIBZX6QfAb1ioWU5Uey32f+40HX3kw18Y+xc3awFjLnBf8
	kR8rxv+9y8z8bFmREfbNZq0TG26DM0s2udi9mh/0yYMXukXRBXqeYE+M8iRoWNWV
	eA/GNeyP5qGN2Ry+kg4OFlkQqU8BVhvseC7L507JppsaenXY9J4v0H0Y2QKJZUhm
	LzqRIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19045-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:59:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c7fe5576bso20442586d6.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620767; x=1794225567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
        b=ZksFjal98DY9yV0Lt7N4y8WWqPO7SWiJ3/U0g32R6LF1LXzEcq2DFXG4Hi6tc2lcwp
         YeoKB01JuRGilqs5y0DXtfB1A6eTe8FYRkrnH2SwUnojSMErexHVzcx5Svhs7NfAmZoO
         o9jJdTfotYYfRjqtZiCVkrNXRHj39WzkfB4nT7kUY6hiqauKjOjw4ZBhKQwd5YdTPKld
         Xs9+0QBztamzYvX7AplN/SdxALJc5aZzPgCxbNTY+NCwYQ3CIRLC76FMGY0MhtnAIhRA
         6GdYOqkWNV0+JkwoDXhQ4Db8ECucEdJESmUsweVvo1F3DI4lIpHN3cF/KZXmNHjulkPX
         RYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620767; x=1794225567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
        b=XhUGqRim3YDxWCxKmf4WgL2W7aZyuNK3OQtqcgQyM1cQz2wbu8Zp8Os8Q7PrVPY217
         iMMaPL1ohM1gVqUp69wFzuhEh+gSv3DNRDKUcWZ3pyTW/gLHcDIoNUELO3kQZrbtaVzM
         sw305ZzxZ6bGzYNsJXL1mPrKj8WVl30Iwu5AAZIUXQkaOsjAEY6aaKhgbewiUNHRgAdF
         4MuDmRgdzjwpV9PejfqKitNOz80+dqeIXv2xsKUlhz3pDKXXCar83O81fSd+456sFhbV
         5cMF1f8LdSo79MqVpOdOApSgvSIquRtnGrxnIxcHNVTXSE9vwRa4uIDQTBRxxRtLKAXF
         Ol5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxafmJCtN8Gz9tnxrTG1A8SXg9mGGWEwMmybMa5EVHn9Ey9Qsl3iR83QrClJSUKNSXVqR/5mY8wwg2E@vger.kernel.org
X-Gm-Message-State: AFq9FYKBiCxDNSqVlGOcUd8GazVZ9aMe2X/8kXVgrTP1D1A99DWDOnJC
	oIshkRATuFY2n2eDatCDm5Ts4uI0qkfUQ05lV2KEeQsm4f+5lIzb3cVjiKEL8vJWNkhynCDXmut
	maqqJvjCxoLpn5EnShgS/xSLgEc5w88x/a5ukEe2up9K6h/QUCK6xtGHPa5SMlVly
X-Gm-Gg: AYBFou0TJh33C4VWZkF+T3uSGfvW6/1nucwh1O8JCFC0npp7C6jxw3TBKuZjIo4BI5b
	gSjmgDoVN+/KxeYtwZMWuTbld8+fl7LfWKmNi06j3hb3RPXtNV98sSoSi9nxiIURa0q62B6+CNX
	QdvxqWgtfWIgtyOa94YtKKprev94vntWFKTi9YjDo3zC7+cL47EtD5Ju7hQkBOlaqBBbQszlbBX
	x156kA933LFayQELYYXy/WN4nVaxH7AFeEFQFKQLinujVmD6M/DHjlC2CtPnN5f0eTmRTA7vRiC
	e78HdAu5tITvpMJSgytqQAHV3axF00N5tIbUTNE6ypj+bWGbGcu3OTA6RHfG0zY90KwhG6b3Ash
	De4x/ZzD1HOS+WTpeaOa0VHMZgamwpPhIGIfusw8W0zhvBciV3yopRM9DqRJUh/OqWqWsw80=
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1517091885a.3.1793620767309;
        Mon, 02 Nov 2026 03:59:27 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1517088585a.3.1793620766638;
        Mon, 02 Nov 2026 03:59:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1915csm377913466b.7.2026.11.02.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:59:25 -0800 (PST)
Message-ID: <44ac4c60-d89a-42f3-82aa-ef3fb0f54636@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:59:23 +0100
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
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
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
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-7-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-7-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ikrrAGLO7QfKuPTgykrBVrbpRbFDFWP-
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae87b20 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=dNZ_EX_IlpB_z2sQReYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-ORIG-GUID: ikrrAGLO7QfKuPTgykrBVrbpRbFDFWP-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX6nQuAb022VPy
 YJ7qz6MMZ2GQvQ5jGYFMHun7okUIZsp8fqZtmjFUqWTBat7Ny0dTrgnT+W6BEEYUDz7Pmt5Hy/C
 fL7TJ88dApMPYtP5bGwuvpZpf0+C4/XKdYiR2WuAjb1E4SVsgDXQXP3boXwJd0JpdR/vvZcNM7F
 TVyv9bvCs/FLwlqgQMWDpUqPwtgQnzdfYGEjhW9IVVqPqDHGIyns5VbeCaB5DE7DkxtctWcK6ds
 M+VcpZPL/WQsIDfVRr3swOG9wmwEi8jNxzjhGJKoWV5aIdqpwsJiDQ4qod8LSUgRTiS7NrLV6L5
 hIEAL1UREouXnrgePDPwwmKwWt4Gvg5RHrlZtbesb4K3Pxx0gEmqzTnbjNmbNEmbuu6aPC5ceuZ
 xAuBqMojE4b3WNCDEy/OEsLcpdI2pObW7h5d54bG4N7c5TKQEI/M7nL8IG27hRibyvVy/9ccaXj
 FAKde+U8LmtQze8p/bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX7FLvQvxjwimZ
 00i4e19W6QXg1nXC6Tqg3mnEB2Nt5adhW9ZV4BG51OWiPRZZn5k+wca2L9oNi2f3VGIIneGqMQd
 iWo32OP+pexT2Za71MtIGpHLwscr0uI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
