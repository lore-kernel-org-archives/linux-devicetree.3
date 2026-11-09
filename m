Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237135;
	b=T0sB2FM2OyIy4WzLkiQdJxYow9RAKlngrrR8pqM9/bxU2P9aWqKBV8Tgif9LxR7P9YWw
	 tBmnbNHsKdBuVroIa+u5J5eEM7O/IuyeHHQB9cB0i2T5UCkvU00RgHHvyPa8u65bnfHA8
	 l1QX3yijRWXzKgCfFv5840OCSapZAk/k8cshrog0SnQV+FvTThkL86vlntZA99r8hWuMp
	 E0ZLiyd8nmuOaLHQby3oXOr+N3mKDvem7IpcCYu/K0Ug+jCaFbmYEPLBMY08gqssC2qbL
	 qLUMx3oN81OVc+BwRmOB8TPZDziAyU2c9x76nKUtLwfl7weFEVkpSIXigzsBw7ss5Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
	b=Csa+/i1rIGSmU4dtks0vcI2R3F041PchIWTRmM5o4TyEWfZ7/3v6z9RfFNqzKmYh3HRH
	 dn9QxRHNAeUNOQcS2URmeSo4GMneED47T8pQuVfs9hGmKpm+J8n4+vhE1n7mkgbcSi3nR
	 ovSm2hj7UCY7U2teO+JKrneqfAc8zl1UjjW5p3Tp0dMJqMwgN8xwEgt++tDB/LhgJKTgH
	 Wy3gJXCJ2qkkkg1BlWmq38vhwR9ziFkCTq9APev/wqkuOl1v3V4mTEI1cwlyzN5PG67oD
	 0PxcnPCNnHV0MNY1hsg6r8Uu3uKh3Z9E2Nk2Ahu/Khf7HelNgg2XRGK/C/8wg8sIEDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIrSQFS5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E22E606A333
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E22E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIrSQFS5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFGtu971371
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 15:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=; b=JVHA+WmS28WTu51A
	alo4QMvr0WoiXI1XjKsBEXyVuK1q94o60sR1tEhkiY2tviOamIxSXbW2e4SvWI0B
	FTkucu81+2EXGVGJ5suaNaLkGLtqVzxKWtq5ruWvOOwNBDZI8/88FOsPRUA5JBHv
	JACpPjvZIITH3FJcqZnm9Bm/J0R+cyiE6IYGLJFK8oO7l309Hp1OjCX0HhYMm7Po
	btMjZ1ALCHvtYmQq86wiBt9nEtv5ydZzL5OQA1dARTOb2/BpGIxuc2TxWsSA0U8s
	SRIa4+tiSHSiIPRLKDBLsxrgw25FmtzCpVrDJlCpin4RqaRpkTqQZu+KTy5h/1ec
	MSZ0kw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3qdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:12:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2cabc2086so17669137.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237133; x=1794841933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=bIrSQFS54jIdF4P6guxFfiAzGIywaL3HcI2CYKiZk5KShXVQ6LHaUI2qAuwOyPWpRw
         xzfuvK2o0r67SnIflhrl9zw16CC67EqRne8OQFuU5E3F2mnYa7/4IlAf3C5Ho221FobL
         MUwgyGtBjh4n6LF/d9m/JQ357ZnuHtLaD7Cq1EMyjDyZfTd5B+EhzTgX+uPhK5gG6Ftk
         iKdSSKA+NDnD/Ck74XrYb7w0tldFtDH471GRhN14JPzJrq4cg6ae6XdIVK8uI9S1qoOh
         fa2WzJoIQKQpdigRZRTw7drea02PGQV8R/jN/nPrkpNaYuTnO5sCoXD++Xie7/gJLWME
         g4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237133; x=1794841933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=Ni8wLc592AkhjjQrKRkKoo3iHYePBbPas/Jro6N+7Rv1n01T21nQoXsLmatiq87vcI
         PqAykmjs8yM5kLi25yR9Csxwvk+JTbOsp7Xpf4xPpGL4d9teyM8TC9PHVbwrgXPPTeXq
         /kdLwQg7RFu2i9347BSxYsDEFh9js7fkr4j0wXIjMPn2pfjZqAnbWX5u2hf1EWc1gNLW
         0shtPYeYjAj4UTyXffOYQNszjw+YiqHnBZFlkLW8fv3aGsO8d0TlwTAOxnPBzlFvlUEQ
         6GUrwnD8saqqtrbex9ErhTuvEYnWMnSm6Vy4cjjpoho8so0IsnvDjb5uAI1yd2J8OKFi
         N7Cw==
X-Forwarded-Encrypted: i=1; AL+hErGdZ4fVIOhcmDDTd7obYW3aY32642zFvxCEFtfML1B9K/QersQSFe4fj8wrRnnoqrNPru7w5y7IpMni@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z0SlX73/l7jOSQfivnggtPkVu3YCOKhWjtjsJQxHWQA5KCITD
	5vyyCxLreNxm3Pilf7cf4nLHHTF1PwDyeeWGDm54PrbTory4ON7zm+YrWce0BgNlvGzsfnH8TAd
	Dr19/Ykos0DrWdQVl6IEeRfZGU0yt2KRafVCs1tAk7VgTP0p1y6T/UYu/VSMYmFOi
X-Gm-Gg: AYBFou2G/vsYjkeGeF5SoppXmJYiA/R6J6JxBdRNlISACO+/+kZaqmuvxGoNTIrfFiZ
	me9abySvTN8N6BJnpmZQg0wmhf5yPpcEe2Cxy6RXctDsj0/fu+hUfICQLI4nno7qk44DqUDfXWh
	Whd7eIbeHxqAzurMrkiWpqfbjVELFEbtzCZDy49u2pyOKdhGTEo4WjvnBT1M5JF/a7HlOsPurFZ
	vOxQOZFiNwS5ghpxAH7UEZ3zt+0Sv4zX2LsUNe3dpd8Jh4iN+Wv6Z0SEhT4baev6l+K6e68HlTY
	xYwBy4p8rVyaAQtYCU7Xr7PTyv41/BEeFmv5zY5uMsBtSpsFeRV6fyc2zg7+IaBr+94+EsAKOrI
	z0XbX4Ug7Tt6PuuTgiokuMYVpnVbqF5Q9gW29doGzEo+yA25stiMMa2emAHY21laknXH0FQ==
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229148137.0.1794237132556;
        Mon, 09 Nov 2026 07:12:12 -0800 (PST)
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229073137.0.1794237131982;
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1765456a12.26.2026.11.09.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Message-ID: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:12:05 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX8PRXbWs8ryXN
 8oZ2vexgwpGFPGaZjGWeyI0hfHGg8Te9AEFVkgepiMKtEE2BulDEHNB/J/B0l8WdVmkDzMQWgOB
 WLavMs8mYG/jDylAh677bQqtB1sWabA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX/EfsdLw1POr2
 8koXPPELhbfI1zSRCGmMx0wXBQTtplpgw5ibJwZ2E4QU31LIRNOjBU46mNa2ElBS5EiqeJG4N2R
 k/88Qe9QLNP3cd5GiFDgfqtV6mpgSkJ2dJ+j1Ief1+2n4yRoVARMoYUhw0mBNympPFhurvFrZCY
 xj4C8UvlufCd9lyCkofRAGVkzLhPhKwl/x7JrIgQL8BY+9Cxvxj+4giIX+ZGYbFBwWJQdRWAhnf
 LnSuB+wnt2uiSNUWMSGjUAmDAvbdM1NM6ZZzXtJLtx0noTh/LeagROCJIyvxYhD6sFT18/9mXma
 b+UXThaHpHlWZDM0+aQDfLHNb0fh5qvblKUxQ6Z8SaCPbz/E2lki1/djgHK9PyOXqrKvYE8WI0u
 FXk12Zp9e+Tbx8cqxyripgb58vn2jeqVCkexvKFre7BDM2ZWuLqut9m7bg7jyR6y0ZKSGEig5fc
 wWqavK02BNDH4WCvrNQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1e2cd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=Xzw-RmQiYhs1fFvV6_MA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ZK4Lo01-zTwM0ikYSp7pH-nDsIYyz60z
X-Proofpoint-ORIG-GUID: ZK4Lo01-zTwM0ikYSp7pH-nDsIYyz60z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]


> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;

Is there no superspeed / dp altmode in hardware?

Konrad
