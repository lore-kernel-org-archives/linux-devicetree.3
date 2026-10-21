Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591343;
	b=UtAIRxe0EXvo2N/HZFN8o9vcqHMuHhXC4uUu4jUfPpGXyGI9GQ4M8cfWV+Jlr8aqD5ax
	 Bn+zVW/ZpE+9KgtyRqBpEpR7yMdmkLBNuVh9JhRkiuU5AQwoma6+dZNrTpLp4TSwLeZKF
	 mhbaKxvvly/ekx3wAYRN8CKCYGf7QGPnLq99HnRR919SdxgeAdOoq9nLFE9ajJD7kgFU8
	 akX1rmMX1KzA8M1yYCjJ0ESCwpooiNi7ZMqMQ+Xr0wJR34khKNiealNBueSp4ReJqOes0
	 cONGASu5eeMmuXNzxIPQkm+nxubwEmLENaiubbojTTngDBYhFZrCF4g9TVjKJ3vyfyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
	b=Fz8FGp1qCIUU7vvtlDy1WLztAGQJXVB4YZPAODmA/RJWEJX4F7ezBIjDaHpv8EmKefho
	 nbEia4EJVcj+fGfUgIQED2OU7s8lnUGQ6RSwbKsNwj1aRRy24le6Zvvh09wnBX/voLeF7
	 bf/T4TfpSXACmdpgH3NmD+xDZ6tV4qab93DFHYrOkCklb/48gPao+yOzJ8/NlERinI8nZ
	 fTVT5xylQdPi3E6WsGHVcLMqwKWLdHaXJnb7P5zwstxAne39qHDmPwAn11HLDOdVC1V9v
	 IYRavmDJTmFvNHmF9yf0faf2Qhz4CTk++gT3YPbVbArEVo08eQHCeZqji1CaxO9NA7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2bf290;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnYgPett;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7589606A31A
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7589606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=di2bf290;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YnYgPett
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDHOgU4038126
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=; b=di2bf290CClcfrhc
	jKzh/qb1Tyb2Dez0KXF5lHo78AqpupmhKBvOqSewBsyOdqxvu8biDiIOPyNpDgNn
	d2H+AVDxpSzD6SSAi48DYV6INTM+aWRzxMRvYt7zzVaJR0YrSzKd0NqQb2s1Koxw
	khCwHPAmM+fkf3iov2OpGJ1FNwprBNQDSN5/a7u4BlRwjlXAxBBzWu0fN2Z8bRWD
	eoWHsFeawCoo70HcizOlBf/b2NwqNtygHmlwUS0W5ZZ86SFNhcWOzi15TcM8z7iL
	Fwe6fRKCa50MEhq1XertPSk1M3PByLk2NwK0C1sjzRa/I4/dAS9HCOySsLp9qVqY
	lRPUHQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex58863g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:02:21 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c6f74efc47so16637b6e.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792591341; x=1793196141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
        b=YnYgPettYe3RxdQG9r4/qhTs2eKwPOLdC6Zxq/RveeV2Zov6UiKlbawF9muxkq1E5a
         OvyPyzANNyv1v+NYqWm0LotFp7BYa8VkXIIV6O4Ciud5WueCaWgcn/TZkCWWpE//ek5q
         /9tYIutHlofKlUEUA/mvIkNXKHxAYc834V0fuu9jLcwgL4Zj8KozA8fomjlLha1ciKYl
         KSPBCrWYnx6kDUPVwdSZax0uhdX4rKoWmoe03D2OMvBYO50VQt0MaBO1KrUGfH9izYmV
         qF8iQ9JhP9qfeIxF7codRTaesY0y6JnattSV5/1OctaueqiS3zH7R0J4/VD28fZ5BmVt
         uICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591341; x=1793196141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdQ2R3se5w8ic9Lfj8qGSYTbGzQ/J+m8NimOyWriIrM=;
        b=K3p8rr9xJTZwwzo352qtH4q3oOsuIhyjuYpVf/lsLpLC5EIZEskjxGXiLcPcSUtZvq
         5t4H/indfHk8p229TICnV6m1JZn0CkYKcPL7+1js5V4/sHy/4kUT2mLchN6FEXhbLvMf
         Cyw0NGgDlnwEyvG4gqcuSrWz9WTSR8RzdWVHE8kBaAoyOp4pBqtmRP6vSySsHVZYLdmR
         3j/eq/oD43saSJq+SD/kQp5h8r4N5BOUzBUu34rI3qXXHUEzhkKHmVM1GBTT3WGwkGeT
         HzmCYECe7nRLhnOjndJMCQYhkVvkyjfSl9HwuSDxQ46XgkoTkDUIj9OqnPG0KBRRJpNe
         GY6w==
X-Forwarded-Encrypted: i=1; AKwUvByPLN902XBjRgZ2ESni0X0qeNbSuxfWk6OFHk566rf1beL+XLpFib+ls51mXHbtSOwy3SO8/SjCSLhR@vger.kernel.org
X-Gm-Message-State: AFq9FYIaCJr5ZbmranMKy/UCy9foltJ+l7QdJpcDg5SotECDlMh4/jVj
	ZD6dHjgqNR+oINcSor1nbHD8yME27VZtsxIQP27XN297JKsuhd5dyJxADMPVB/IZcXux2ypVmpg
	+C2I48ghtQDaHn+43RuS5vnB7tPVj0S8eBb2iaZPF6+E9z7yxycvGYjEpohH26XtU
X-Gm-Gg: AYBFou3pS4YCUpZ8iCAG9ymtUyg95QtdNqwS6e1sVxy7wmlXlWwkPXa13tIA2jFZJmZ
	2SxTlvihY1ujrh1B6pc6TxaiAv4Fy9oaZG4N8AzjzxhlYtfmT+s47VdQTsDQ3t85Uar6CaWrer+
	nQcdtF1FWQQWL22u1vnfuaDDEH2INtk6EhIiCerNgFQ7/jA7PGDTYpKTMoZQokgqQrTTVXeo69q
	pT5hO3GXZbt/UbSRFOtVcnHbZ3uIMRafyvGP22iISK2/+A4TdY1Gn8m7VIRufnANfQw5nEBiqiA
	NlAgd2FKTIBwfkgOcXHwcE+zP+xMoWRPeLmCG7xKPSk/8lFYHKbE36cKzNHtnXExF0vF2uFSz+y
	NCD9DvxyiEeUMebtF5Ftjhg==
X-Received: by 2002:a05:6808:1914:b0:4f3:890b:5fd3 with SMTP id 5614622812f47-55362b28972mr2213752b6e.6.1792591340785;
        Wed, 21 Oct 2026 07:02:20 -0700 (PDT)
X-Received: by 2002:a05:6808:1914:b0:4f3:890b:5fd3 with SMTP id 5614622812f47-55362b28972mr2213659b6e.6.1792591340150;
        Wed, 21 Oct 2026 07:02:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316a2b3sm856108a12.35.2026.10.21.07.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:02:18 -0700 (PDT)
Message-ID: <92bb95d5-946e-4169-8382-487ed9ed2254@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:02:12 +0200
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
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX+GxJtYDs8OT4
 sZo/5kA7IDnu/eHtK0yKX9LHtnVZJuvZi9iUIHJo9Z6A1MpreYfbhU5Zm/Y23z0//xrzb92Zmqr
 xXGW31lZt9e7TKiE0Kph5zJ3ZZKjS9M=
X-Proofpoint-GUID: eCUQnE3KllnW45l0Vzps72IrRQT3IyND
X-Proofpoint-ORIG-GUID: eCUQnE3KllnW45l0Vzps72IrRQT3IyND
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8c5ed cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g0yJHs1RHlB3dt4QKcIA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfXwLrrIWHGwver
 vqrrnzF7L/ho3kD/tIRAhUBHG9kz2gkC4SLXOswLdrfi43JaBj5xrbxyM4Ws/OI4VAIIufeUihF
 lbl3h2Hjco0h8TGKEeNSWyMGnToyTGote+vj3bEZmcFB0uoYTRsctFg5sqm6jKYgOceZtQCWPTu
 oFLuUBdun/k1hoGG+OR3nCznFKABULu2fevpRk+pwgqp53PafWO9zzzJlqxkKDKaDD0U5fBWyfT
 aEeoK2ZfoQd8LTxxr0Fc5rfrJcVbUGzjJbqOafxCi+2zwbaDwVt3LSa/SQOIhkAUywAqvy85Eq9
 UJiKu/ys9xm1QFMQ2JUychvpee8qiPT/QG+O1bVvsbFBMI+H+5SHvFT/dFrZgMaNRBsC07g/n+x
 zgyfrs1TpbrCNgoi0o9CSoOm3wBUwTAg5o88fRwDjmArvyNIqatDLQ4XyW5hBY2sdhceOiD6Uz3
 zJScoBrCD9Jaj57LvIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/12/26 8:45 AM, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

[...]

> +&camss_csiphy2_in_port {
> +	camss_csiphy2_inep: endpoint {
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&csiphy2_out_ep>;
> +	};
> +};

Please define the endpoint in the SoC DTSI like the glymur submission:

https://lore.kernel.org/linux-arm-msm/b5734dac-1285-452b-8107-9164e6a3e5fa@oss.qualcomm.com/T/#m55a2d04f3fe573dbbc86fe89a874514494eca345

[...]


> +&csiphy2_in_port {
> +	csiphy2_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		clock-lanes = <0>;
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&s5kjn5_out_ep>;
> +	};
> +};
> +
> +&csiphy2_out_port {
> +	csiphy2_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy2_inep>;
> +	};
> +};

likewise for these two

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
