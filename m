Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660CF470E82
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582940; cv=none; b=bbn+/NztNdLCVH31U1iszfOsedd95AoNK+66DPo895OG6jVedZ4QKn6oCyVKullrehHuU1RS/JnWy7QScwUcDDpEYABuk/QnUnipQawljl8OVU0PIuV++E7B/xXwdjI1S/TU2J375nfQj513J+/3VBkQvjBk4UGUizSMd8Ft3i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582940; c=relaxed/simple;
	bh=KW+CIQTivfaP13k7qjV89wVsiakN0oVzsaUBC1ksteQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoL4pH9rQPpBOYRtdFksZKCk1H9cEOksV8f3MoMptyU8f1aj0NbaAcPTCHaZ+RqyxA4bnzOB12cxlayzi7uavljtNm7FPxZDrRwzuwMKiYMSO+H0R7eNM25FoDTVWsHdxZtVhr5BJDLN6JT0zU+Tpaj4SgXDblV6N96JfDHLVZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKDSW8Y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7rJBq6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKDSW8Y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7rJBq6Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xqKI361323
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=; b=SKDSW8Y5QhLznaQ1
	yzxkud/7TYJOhk6dx/p3qyA8tC7kxFki3tE+Nd56wjxF+b9iJASw0vjxii6TezBT
	ZMdgxRrVQ2HKFKydfWaRhBoF1GZenEMTC9ZAlW7V7JbrI6fP8P5Zye3NyIqA3FnL
	bZR5CJzL4DXRwrnLCl+DzAJSwTuaS9FLvO/Sz22RXBSSG5drpv8iuVkBtm4eQsJG
	dpY7YaSJfuQDnR8mcWdZIemD2SZhPnkbHriD1NzKmc8auOlu68yM325Jq+Uh3j4G
	/z3D6lwBxyFHr4YBKSDVwA3Y/J+s3jJDWavHdfwb3amjUN9uEsX5VHOL68NyDm0u
	n08ytQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav49f5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:08:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5c205127so274446585a.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582936; x=1791187736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=;
        b=e7rJBq6YtzSC98PJP/jyCj4NhUdKhbJKHOoawdRthVsZPYOhcsG6yOn0ek8B89Pob8
         1dhCOdsZ+rx/55FsNQmbQSm/YzRmFiusGY9M6aIWCMx5D7Wildubl3ESQYnk4l+v7GN5
         RPOqCVlbmIliRP5Grz5FLb+GTxyquqHSRVm/ij4SxW0e1YYlD0AWhaHvSsKTkzGwrBaJ
         Nf3BwutNedEWdszHH0oNr/XBwwh8kdj6W/0PhMDzdLsjoh6EDOF6zUkdIg+cua0ZZqbp
         OX2CZW3AqKA3ykBqdT+eEqfQbes+0eI8HvWwk8wmIBHGcSMui+GWWwfQ68//ocCKn/NR
         cX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582936; x=1791187736;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oM81pKyayfK2X8YKDVXwTbFLMrukiJVnnCmewayJBqA=;
        b=olS8olvlEvwfmVFbs0iWqmFAgIDgtOh2wEizAn43vxpzonLyNWfJC2dKuS53UUm1j1
         +nQAtlU62kTUudKkaFkvSdyXpBk1+kn4oEAum22Gc+KXvSEg16PYDWp/d4BHmw0kkxzD
         C/C/j4casVDXZtTJrQ+YVweLcGYTqzKKZUbRvUfVqzO/cB6DF7/U9NTUb7FzcyAlUBbK
         z8NlNDICYqMWlqyeNvla824u9UkLME1NkgfslpErgpgzCClR197Bur4lvsqtEqe6OMPB
         YT+rVttVpfcLTWzgNfZg+5KpMZiRFcfHTK8zMlSWsAWQqpynj8c+JMhDk0cT6aGORqsF
         ivQA==
X-Forwarded-Encrypted: i=1; AKwUvBzopi+XtVSOgFWtRYY2lDafjFkjYbFZN5YyeKK5stt0BffPAgcq6ShZ1oVdLh9zw8hiA2iJevRYzfXL@vger.kernel.org
X-Gm-Message-State: AFuF++n2Dgas/QsGbMXIZjqd3mw0L64TMpPWRC4h1JGBIZqtxXLbWCLt
	CbtdUQKFn72t8Z7Zr/3JoQk/IKbgNIczRvxRM3Sdtg3BZeuwqIyRZa99VTJH1m5cglZAl7/PWbo
	RgOEjh588tW5FzbXKJzom8cPliklzDwXxVZvGu2q1bwawsQp7qcPlZU9es7K8+EFd
X-Gm-Gg: AYBFou0JAgX2NwRIlYGAoxCRz/nSgV2efntrIzKj/7+soqCVWhPTND5PgoRTTThtssm
	dNfhdeenRkeXCxM04o6Ht3MU2nE80NMiRDo6IaIazEsDt+jT2gm4RzZ527eRl2+Alh3VpOIuwnc
	X60Gse0e+4w0ga+e6uW21LDo2H41LETsXOd4Zsu+D8ABzk/0rCPiiES82BPkty6hNZZJe+i+DfE
	2BsQYPgIx0n5orL7yRn61UDXJEPKNj8CQsNFZiLcAPKOqgZ1XVvKNK2FpifUqpDNo+MZdDqd5fK
	UlUFXpzyfmupy+3Jbvv7yQYL7iiM/0eqzy84ZKSykupTR9zTcBd2RFMvpkCwFkCCMXV/E1oka+P
	1fqt7AE/glZ/yuRcGjxN/B3ZpoAtV
X-Received: by 2002:a05:620a:4150:b0:939:a003:7127 with SMTP id af79cd13be357-93c43d15a2dmr1823456585a.52.1790582936288;
        Mon, 28 Sep 2026 01:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4150:b0:939:a003:7127 with SMTP id af79cd13be357-93c43d15a2dmr1823452285a.52.1790582935772;
        Mon, 28 Sep 2026 01:08:55 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm26045947f8f.12.2026.09.28.01.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:08:53 -0700 (PDT)
Message-ID: <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 10:08:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai
 <wens@kernel.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jernej Skrabec
 <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Francesco Dolcini
 <francesco@dolcini.it>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Chris Morgan <macromorgan@hotmail.com>,
        Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
 <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
 <20260928065837.GA22609@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260928065837.GA22609@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U8QeM2QCIT_YVOwhjrtcp0dS8_AHr0Dp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX+ie1P2g4mze1
 3+ex4u1fPSOu9bHu+ETPh+7y/rYC6nXHoVonSq/21onf7r4INh8BtMyejZjuv//UyYEgrsqFvsg
 Shk93qiYpM1gl8vZdUBmzLSW26lCSWekkc/9JMvJZDPaNp2sa8z5UP69QaHRDef+d5lZyQi4eZV
 Om6G5fnCc5KkkeCQXfJbdijYkmphiWVGVykDa/IfdbpgWW5WvoQH0+CeAXmwiISvFjZGogCfSlo
 J4CVzAeUe3rhEzoK7I9mVbgNuk0l7L6WS9gNuiTPXOQdVLaolAAxXCs2w4TfqQ3xURZlWtYoY7S
 WmaX7cad1ZUNKgXG1B0IeeijzoKwraIdPNehygmG9JbrbGvSmHs6ZjBRwb1PNshlDOVNEywAm99
 FakqRvA2ReG+AEPLNllASAGphMHJocig75mDBIXdFqKEaxIE71cTTzK76k1HMWx9EisY0nx8DQz
 1pdpUTfy5L7xC+2lmNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX8s5IibgFwvqt
 b/N1jrNDPI8lFml2e0x9SAMSPvfqjjCcLMCE0ojzM+pJRPmvNMydogbLgix3D59BEMwEAcv/10N
 aEC7CSk5rRljzYBR8+aG5ZaSCMVI14o=
X-Proofpoint-ORIG-GUID: U8QeM2QCIT_YVOwhjrtcp0dS8_AHr0Dp
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6aba2099 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3sPRIKSABCI_lCAVw8wA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280032

On 28/09/2026 08:58, Laurent Pinchart wrote:
> On Mon, Sep 28, 2026 at 08:03:18AM +0200, Krzysztof Kozlowski wrote:
>> On 28/09/2026 07:33, Luca Ceresoli wrote:
>>> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
>>>> Correct indentation in the examples to consistent 2- or 4-spaces
>>>> indentation to fix dt-check-style warnings ("example 0
>>>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
>>>> re-indenting entire example just for that is too much churn.
>>>
>>> Applied, thanks!
>>>
>>> [1/2] dt-bindings: display: Use consistent indentation in the example
>>>       commit: 370c5d9004f8b754351981d59fc26851bf943e93
>>
>> Thanks, but I expected no one will pick it up, so I asked Rob to take
>> it, thus it is already queued.
> 
> Please explain your merge plans in the cover letter next time.

The merge plan was this going through drm-misc. It got reviews, no one
applied, even Dmitry for msm only reviewed the msm-bits (second patch),
so I asked Rob to take it. This was not planned, but result of usual
drm-misc inactivity for bindings (many bindings were not taken in the
past or with noticeable delay/pings).

Best regards,
Krzysztof
