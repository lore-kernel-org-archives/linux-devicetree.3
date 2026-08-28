Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1973EB0E7
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907507; cv=pass; b=N6zoheixCXJotmz6I5M4TxMjpd3cTR1reiMIq3dd9IxuVMjFsDela6cA4jkMSmY5Xk8F4HwkDoqWaMCvu7LrjKaP/sSwvvR2+2I61GDck5h8KBol3KcHp9vstJgWUBMl3xc5YTp7X63BbE/mz1lP4Od3L1Np4vkq9BTbRIPVjDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907507; c=relaxed/simple;
	bh=1tsOIF7GoqjTfi40uyZxs9Vza8UXlgkEXcU+W5xhQJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+Dn01fVvB5WJ1VPjfmHloF+hcDG8JjetSMFmBDoq1Ve8BRkC10Pq6VJ50F/aN3Tc9CeWjFEyeCMnoosJHV72csHiG+SFyGWpbtirRvBigDw/cmv2fDQdqVvH1ZzBb0WUe8bwMBUrNIFkIpujBW5kBt/Cno3ZZzKBkolIfwxQ+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXtXKF5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiixQJdM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXtXKF5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiixQJdM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66pOR2181544
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h9qkRpA0u5mykihbpeoCW8HU
	7LRmqZIXoSQrDWLq8YY=; b=pXtXKF5yPk1BKfDBQCYDpjfC5+Ujrkw6ShRTS9M9
	abPLyOFuyzKreu3L1tMX2o+qXkeLAckAhc6+QyMjRnyMLT3fCFP7/1K/T5ty6XjX
	QZ0CjE39GhPmvhFXmCVrHZqpAck8XwVR07KgVfRTY+S+ycIkuIlmXlq1ZpiO5chK
	BxOS4pXOfw/CE/WNov+UHYsngtrgj4qkPsFOTCuin8tSLgUyCZyv9bogsSh+LRaw
	86a68TCzYMqOwLrxfIzd4G69CE5PvOvJg2hFvTa+MIzo/SIg1qhMJ71AuYdafD3f
	DGAy9FSTiHMo6+MJiwbr2bIBtLnDGktmaF/zmNN1vYxzIQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee43p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:58:24 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-85da2b96c35so14294627b3.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 01:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787907503; cv=none;
        d=google.com; s=arc-20260327;
        b=VtTxSE99iJC/43Tkjv5TQgxae+LMTtTvvJiOndNlosNWP6FPWI8/YXX6JKjAUIP6Sm
         ubzbAoORVXCi5MbAzsYq4q3l1BC45xKn6mh8gokA6h4yktwryBLqYoj6Gwd+d5fmQ/Ks
         eseIdZLGq5OBI+hgecU0KkQRCdqbRQ5hNNeZy2eltKV2VyJgi1U+7GJlqbjjk9rk60DA
         LN6k1Nv7NGgNmJd76q9dD4CBtdbajHdA7X0iYpPeIZECLJXRHlklU53czjoQ/X8xp7fd
         ejwsKliYfVPHAPOZNkdm7DYHKxZ9nGXrHK5OqnSivAmzKaawK2lVd5a8qzNIfUK3XtKa
         HOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        fh=s2czzKnxSV06q36zFUGqd4aQ/nS25GJH2HuO+JYXV+k=;
        b=N+2Wp6v17VpjhnmRkWjUzRF/Km+gNiWwIeW1VqZLQuhNeBAciK+9SOMA1mkCo99Wjl
         lVjixnkdcXvqf3kW+wT6Jrqwv6paCg7+YMWEvWJmhNWmei6JkIiGLLpKND0t9V4Fa0jx
         un2P4GUWSqkwpx3btokCjLu9LNQlKdF6lsAq9THecFiDIvYYHU0tXGMclsTZYb08usTl
         wz1YrpelUyUoO4GLmxMTnHJEWOFQK0hkv1EXEj++y3+E71W+GvJo9Fc8qcjGOwd15VHs
         n/zmKKP6kLjsuPnVusj4zC66dpahJm6Kk9dAHBtAmHCuKjcnali0qITnTA5T5BlOyn2Q
         i8rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787907503; x=1788512303; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        b=YiixQJdM5fptqa8SZjHzXQn/I5KIYhbs7E7W51MC4UDf8HuHeR6BleBUfibRNLkm3U
         w3bO3mEYlq5YSjD2GEKYFmHyaMGU833QKhGhmS/NVmCSjOH4iqJF9/VZRgj2pf7eZdG9
         KlqmJAV7uqsIL2q0SDRyEqQQm9i3KMSyj0LgCaDaFrp5RlyAWue6NGSbQMPeCDWJjCtY
         xK4CEDYF9BGICuiWpQcXVS0fL15NSJNoNDdRFV/I9pOwyRfHIZVeNJftmmBpo1GxqdJQ
         MHvchYL8PUugfX11cXhnV7NBE+uDpUzIKvkKDUEc6aTQuvW3TpVXHnQsr1Qz0ntHe7+n
         Snig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907503; x=1788512303;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        b=i2NGxvCTSDA6GG1h7Vb34Q8ZaSoodNw9Tlu/7v2iiV5GT7mM9rHprRaw97W3ml03sV
         OMT0iD1QoSAO4kVoVWt9WqgJx9rnPoGLWSU9w2e87OsNj3wdkWtq9+tK53rpYZef3D6U
         oDVa8j+IllJS/81lqR1QlprhVDShtpQ8FNatZX6YFEEP9p/qqmh4snGib8D/MAWvdMek
         0Hs4XyycH0lsDTpFHihaRBsc8O/q/98+6OQ2UmNh78srsKSPz1ZbOKbkcTEprvSpUTQM
         dFJftjE2rQkbnVRtrGV5rl2oXaCOh49t+TgxhDdPtt1nDCARYJd/8Zf7ZvafWDk9yv6x
         qxsg==
X-Forwarded-Encrypted: i=1; AHgh+RpJ3Te3zLO5iKru9clzm55il+WVFvanmGSA0Q6Osv0bU3A3da4rEB2S4Ivcz3Ypgd5NnYq2iv71JdA8@vger.kernel.org
X-Gm-Message-State: AFuF++mpDAZ9Y/CSO34xwcgRue6aiBo4BkUtGIF1vfQCchFo0H4WSPNW
	CpCiq4zp6OuNRkJo2amG/yOSgHAA8ATnJ+ZWo6rHL5ZuSZZ4hRpao7U46fo3V2bdeS6HCknlWdo
	qzlGRk45p3ACJ9gRi62DMxu9uHGgvhroaQKzkzeJZSdpKaWJX577LissH/NPYhcVsaK51G2h64M
	eAqmRXKTBWXcTpzww0GXoYX4fkAr2Q7yH3BkSKQ+A=
X-Gm-Gg: AR+sD13m2MyI4kQv7rvb6Fo5yXRbfsrOd/4sW5hqMFMQtzKJYV0huCPG8WQDkUKw/Ta
	vPbrYJmfwDgNQ+PjG6gxQDzz5eHNKT+OLbGcJaSrrvP+fnq59iE2B/fw+P/V6jdM9gTV1cKjqLn
	7a51F3prza9bV9S5oSVbvCWDjn7Rs93hXFmHSgSoPZHJt6W1nMya9ZTb6iS+8=
X-Received: by 2002:a53:d0c9:0:b0:667:7dae:8707 with SMTP id 956f58d0204a3-66e4c6007a0mr1146603d50.8.1787907503456;
        Fri, 28 Aug 2026 01:58:23 -0700 (PDT)
X-Received: by 2002:a53:d0c9:0:b0:667:7dae:8707 with SMTP id
 956f58d0204a3-66e4c6007a0mr1146595d50.8.1787907503061; Fri, 28 Aug 2026
 01:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
In-Reply-To: <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:28:10 +0530
X-Gm-Features: AcwNN1UHIzNqBIGzwT_M18HWoKDt3V5mbkibZsr-oWOmOtjNKEOEnS-AEr9thQ4
Message-ID: <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NiBTYWx0ZWRfX1nT5anvuD1W8
 QNgYPVQtRcY2Q8CBegNGalyhpQtGZUz4BbRfAJSImzgeK4HwVG7B78vwiAuRvq1hYNubcHSG8AU
 kDCI4JRCXaxTERUzIDkZWvKNYxE00aXUwBK3qo2kgYinRW7I0OTwDOlMJoEQ+iKO2ov4m6OH1ur
 QduEaGz9vyTFuwPjvJ2dqMfsmSrJGQzlP7UGnFhjy985pBTvQC96v+rwWePLYs6JPLK2sjl8XkF
 OI7MdzF0qiEu06j/pZdpXsgSRUQtv0gz1dzMA/DcYuBqAjUwVLrr+l0S7XUlLfARFroV8+x6OpV
 koOO6MAFhRi7ARiWHhACxtqEy2UjV/BzUcvRox3Hogt5IaMy2vkUPah3aDXddSz8YrE2ixNk37d
 F4x/M3UMtw4aGSYyboHv8+Bgpzb7hXAE6X6JMB+OAsDhdG9w1OyiSKmyL02nX6gig3UjWFw/OyA
 3FLuy9EAYbrRgneTrKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NiBTYWx0ZWRfX4cfW6biBng5c
 ZaewVnO7cKkK896xumqov6e9x83WCKEMMjo4YUDFpo+M+j4IMNd8qRYZXac4yU7bD5Q79O0Ciyu
 6OOI4KHEuS4TtQzFc4F64aDfBWRV1Rk=
X-Proofpoint-ORIG-GUID: s4Rpl5XQKrlYqgAuXCXghWoyUsSm6dpA
X-Proofpoint-GUID: s4Rpl5XQKrlYqgAuXCXghWoyUsSm6dpA
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a914db0 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8 a=VRosaQPrOrfO6Z3GwksA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280076

> >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>>>> +
> >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
> >>>> card registration to fail.
> >>>>
> >>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> >>>> beyond the supported LPASS port range.
> >>>>
> >>>> Best Regards,
> >>>> Rafi.
> >>> Thanks for pointing this out. We can either add the range check for
> >>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> >>> qcom/common.h to validate the supported DAI IDs across Qualcomm
> >>> platforms.
> >>
> >> You should add these ids to
> >> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> >> conflicts with common code.
> >>
> >> --srini
> > Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
> > DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
> > Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>
> These are IDs that will be reused across both dsp and non-dsp solution.
> So it makes more sense to keep it in one single place to allow the
> hardware description (DT) unchanged across different software solutions.
>
>
> > would it be better to update the range check in common.c/common.h to
> > accommodate both LPASS and QAIF DAI ID ranges instead?
> No, that does not make sense because these numbering might conflicting
> with other ports in future.
>
> --srini
Srini, could you please confirm if adding QAIF DAIs to
qcom,q6dsp-lpass-ports.h is acceptable given that it increases
LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
drivers eg below
https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
-Harendra
