Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B43B42F0
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073604; cv=none; b=l63Y2cnZp/Sq8Js1xpkgo8VPrkp21Tdb+b/KDMuWilWb1ildbUDVVO01CDyvrO8L7xuYwnn2/qS+6SB4rzuJYRnPG5nEk0pW9VG3HP8XfPfC1UZM+Nchzvvo6J9RKdCkhpEmfzzm9IiCdkyQQXLZcyYaHOZV/GxwFc8hRMB8+2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073604; c=relaxed/simple;
	bh=g6NO/hgtUlkK66EiSlUQVymWJtmwBVpJQ3HhUlxuYQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ND8C8/e7Lo6iszi6AIKCkXMWfioEI5FRTAuGCM755nhXKaidIehKtK+u9YJgt0cCmy14yxXxwGMZF1suz7vsEA/jbC/NyCYHOk9bh5RH4rqaU5/qQbhzHRD9BZhkP9GiloUvRsCgJFf+N0yblVvJptmBkJo/W6Qzr8ZW7vaC5xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqgTkWJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWNSbDhw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqgTkWJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cWNSbDhw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637ZgmS3410056
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 10:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=; b=dqgTkWJ6AwlZAOOG
	TZJpLI93qT8q5TY9jfKapyiPNDC9hTYfBrkRhQfXHKwLBwG2xzEy/g1PYCJBcaUU
	CTJYs9XdM10N1GTv0P4KQnQNQoOdn5DVhLhrTSUVE03KWI9HQEgv4/Jv6jOVsiyY
	4c1b2PrtQ9oMKYL/tAlxRh6TcM94/lIi+GmwRMAsIiH5dwgA/CK3fkX5PbnZTw0b
	OBpxzzyj5fCK8w7NNtHeRjrO/9tTtK1oC9IZdWvprYULOQOdVLu0aXf5uHpMdJuv
	9iTAKxyFVHLl0aDagEWjv/nIz/7L+TqQPjLRV8ArqCu6K537da52zC9trXoYOpYy
	To389A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u30k5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:13:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so1109686d6.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073601; x=1783678401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=;
        b=cWNSbDhwoqcgJdGu4xBtgZCRrKJicFu7XfWq7e+gTVEVcmxt3ipgZDbcd6Yy8B7kWw
         Ktn+NvQNUC0hsPYZu6CwkhpEWZN1RKCbljfEiMVVsJNI7TpCbRbsrAF6kEmEhzN/yrF5
         nx8k6qSvIjEqfhjS+R70KP9Ytooc707SZXuFNgs5I49hM1vR7P5xR+tJ/kytdn3A4JjA
         dJnRor46KZhYeih5mpDG44DNG6Kgatcoy/oFIg02N70USx0f/HLghmI0UfZ4JQFRT3vT
         ZPYWchCOCLjqooApe+FU2CeCvnYyhp2pc/QMAhQY0oQWb6iIq/fnpgQw/oIg0ewPA1lM
         XxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073601; x=1783678401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=;
        b=HXmcBESBC16N9Jboj7gxJCdet17xuo97gH4sSRvCSKwYrTPUVZfIPie5I8S4vsrSk+
         jrm6wlXExwADCyo/ew7L2g4Ipl6M0Qd3ltcdNdjQMJULC2fFirMPpGzEp0XudFyDQiwE
         2qRv32zQlP1Y5gtprelKHzcmzeQ7t+wGqNJYC+RCqq4ExnQq3RTuVrHzp51jbjTxiPNs
         GzvgW1LyqNJifrEITRJn09B0cJiwThu15LVD/exngVF6XhguB4p4kn2ar8yfN6oG3hJ2
         9hm6UNrAPQfA8pjQuh8o4xjkwBsNoTNlZTuNFjfx69wWj2lB6fTE7eiL85TYc0HARnhh
         FptQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0iaP9568tQqFkUV8bjvmm36ypQjb/gEuhi8zpOfwLEgjH8YACdxDjT4bcW26GYS5ZHTklH+54rWmA@vger.kernel.org
X-Gm-Message-State: AOJu0YzC9huUQVYPQQgNWP6dom9Uo1z5Bhhpq+yTG66+dDh/g9tZn26Q
	4Q/Pm/46s+GwKRI3knT8fOW3sX+Vw9c7UtJhxUH1ouOvPPvietv9FKgQajknam5tMYMoBKirVFs
	ht32DZJSlJugqa7C6jQ1hYho1SdsZfvuGzb91dlPyxqZtt8sxntRWafinkWl/oJFw
X-Gm-Gg: AfdE7clImYgcD/8Mc6e/dPKpbFCZN3nB4gokZMgwJPXBFt2ei3XduxDRD34dgWujxub
	D1nLKgAiRtGntjMk99SsJgxYN54A0b4Nc3rEnFSR24OLNgbsOUTMBGoIF4B0kRD/Zf6GWBwKNDd
	l1BrB7luV3RUi5qDzZZaV1uJHeV+I4tqnX0qreFUImNEuuZgzgdmu+xI1IK1VB6mmwgjkgFfxcb
	g2YCSkgI/GDBfrUr68TL16L4r5/o32gr8o4Lr5PmIhsz7/XNY4VCzDv7QFXtcfdmMvfA23hRFKK
	6+LyHBdo2gZIx3HunNkPmNmEOShruyj3acQPtnzwMaPAQ1wh+6wZgD13GbsiU4WbgsfszRZPR8/
	Qozu0QWDMh1qO5E4R9ATzvUCQRPha+BBXJUI=
X-Received: by 2002:a05:6214:cc8:b0:8ed:a980:6b27 with SMTP id 6a1803df08f44-8f3c854777cmr86121166d6.8.1783073601118;
        Fri, 03 Jul 2026 03:13:21 -0700 (PDT)
X-Received: by 2002:a05:6214:cc8:b0:8ed:a980:6b27 with SMTP id 6a1803df08f44-8f3c854777cmr86120726d6.8.1783073600643;
        Fri, 03 Jul 2026 03:13:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad119406sm2158642a12.21.2026.07.03.03.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:13:19 -0700 (PDT)
Message-ID: <827c4b64-1881-4630-bb08-f9e2d97cd32e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:13:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman>
 <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
 <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fAr4694iUb8GdW1BfKjTwagITcd07Jvt
X-Proofpoint-ORIG-GUID: fAr4694iUb8GdW1BfKjTwagITcd07Jvt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfXw7eth3JZFN+Z
 Mlu6djXIKnLE3w99C/yv9WDVn7vDU9QYPH5KmDi76zoDgugH8+RhrDH2CU2sMiKTB0+RIwoLrvM
 8uVFKQPY82EKtX0XzIlKfT3URzZ5cas=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfX1nrFWcZPs4ei
 wFu7yiyPhLcFoYHk97kC7ehNaIBF/GOSo4GZUeaCvp5VyZoVgiMgulpZ83t1H0R4b9WFEcahbtn
 gGJjFtSo8jcr8XaPySiVAce4zxezYJhmIPfLcmlzI1idP+fjIbfgKaXKA6H+6hHFRrRO+A2YMjh
 kn67VOOhVySkMpzHJZlJEY+zbFDmMOJEIGHQzSqUsfuHlIQRESNxuUo2cqa8xvqCOctjCGxGU77
 JW1shgqJwThQcEd3ct5P0homvt8xVNUvLxIqrYCNRSXcVa9nJfRlCB2r133rpTTpkDTW3I/yGqZ
 y4K1/Aon5HpXq1ww6k4RdZ2BFDJYAx7OZC5nyPWnpGjHrNgCwnkpkrDtInrMUpunctJ/b9Q1D0O
 b/3LPfOfXXbMqTXpukjbBUE5vOouoeDVfdBXSLKxs564MbeiqQi3sUJA1qXJOILHp4D8ZAqcl7n
 28KSY1Pt5vOvR4Tzh8g==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a478b42 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=lwt6xitBv4dyHUtHhEkA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030098

On 7/2/26 11:16 AM, Geert Uytterhoeven wrote:
> Hi Bartosz,
> 
> On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
>>> On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>>>>> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>>>>> driver instead of the MAC driver where it was previously. Instead of cramming
>>>>> both HLOS and firmware handling into the same driver, I figured it makes more
>>>>> sense to have a dedicated, cleaner driver as the two share very little code (if
>>>>> any).
>>>>
>>>> I think you are mixing up DT bindings and driver implementation?
>>>
>>> Should the bindings change if we have different driver and firmware
>>> implementations? Isn't binding supposed to be agnostic of
>>> implementations..?
>>
>> I've thought about it some more and I believe this question is philosophical in
>> nature.
>>
>> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
>> the same Lemans Ride board and it becomes one or the other. Yet they are not
>> described by the same DTS and the bindings differ as well. I don't see why we
>> wouldn't allow the same approach for the this PHY.
>>
>> We treat it as different HW variant when it's managed by firmware - just like
>> we do with the rest of the SoC.
> 
> DT describes hardware, not software policy.

DT describes hardware, to the extent that it's accessible by the OS

In this case, lemans-bare-metal and lemans-auto are essentially 2
separate platforms because the way we can interface with the hardware
is so vastly different

Konrad
