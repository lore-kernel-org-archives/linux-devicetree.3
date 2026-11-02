Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793610941;
	b=IzVhDXWDB5hKoTUpfpVEopbqajyqld+9tbBgjpJZtIqqjzVs6BoISLJeHU212Huq+R+t
	 crPweNxwgxSIZcEZolnn0cxfVNZvzKGZp5z5CfySmUTiePQaK86xETBeX32FNvOHdQdEl
	 9QqyIH9Ab9+wbHL95hA92jePWURNom1Jxu12nMUdg+EMkBmZHJITmTHLf3crH8DtT3o0T
	 lKu347BTwU6tsw4UtyyPoRp+RuILa/NktJOa6AzLNTN0+yZq9GV7OQGMc5kmSgqjiD5vB
	 kFQktxPIWtDmfFN6ym6aFYyEyxQxlswaLeon4VaYj5U6dyVvjlng3QiMJf+K4JotoVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
	b=j0LhNFUTIu6TLd7ALtpxTad6Tec4BxEtm9MuAAG46Gjxyu8Jb6laff7PZksBs8Omq38o
	 5tM8dg5VwlTylFVoZOMlMyz+TkIYwbbCHKRBLy6KrtO+mHFs0k441IAo0YkgikF8Sbtoy
	 J1DF3bYbMtYBcZulMYh4USFibnKBPCR6iuOi2bTTna4IHYWm/bfrMOADcbsVzXi57JGXt
	 WlB/W/cAKNYYQ1kQkMmEJu8lG7Rq/+PrSrC8coDbuqwYPu7sJ/LAOMfP17F3AqR0GhH1c
	 KX66VpSU9FvldsBH1+efO3rCXMQRmKRojKXG3l+iRDg2cZw0WZV6LfzVdK1TBdzeF8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aar7RgYg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTEQuBhl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990D3606A329
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 990D3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aar7RgYg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTEQuBhl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A5n7260605
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=; b=aar7RgYgm/5vhEdj
	Aeyu59+LXbpUVGQmFfLAiggu+wtMIpPNQVUTrqYg5iuP9kUgZfDHxWOdBGmz3h+K
	vuhuu0DSQJTz2KckgrCwIUaMgkmCdLPkh+JlWS83pBVTLuWlKjn+YwK4odeCYLZG
	fiikjVokI82lMXGA8p/2YSEaIWfD2/1m1kEJtLRi7xINpR0bVNW8pvKsCz/4beIr
	q7Gs/gZtn/8AeFxBc6nQXvu7veF2z0thrVus1uM9dBNwSdrTi6tIxE2Y3T+rF+66
	J9ZepK1SYGOOzAJYP6GO2yni4ixlqL3fGZZzy4eRD7d0AwGp7qGn+FO/un3d81HR
	FeiWjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvr10s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:15:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so304686485a.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793610938; cv=none;
        d=google.com; s=arc-20260327;
        b=IOIQpO1du1qY0SY3B0GKMicbCsOgiKdEdZzXEZ/1ISpY9OASnz7J16ssEzcYaDQj0s
         rwiLxShIQyFnJJEJ/KG5SgILgN+3wUJt+4RDVId9Cqyz9XvL6pLuzi7Lqy49vMU2ImNH
         u2wC2A0Ih4mCcSXKpwfNHssNNNpPwstnJAg0NtbYwGKg8XUGdG4ncyuajVvZ8puCef0x
         Kr3Hepe32/HAKB/OkE6lnmGmcI9ZjzqlggPSQPVeMgMWuB1o6QZ+EspRq5qTca1epyAT
         HVNdmZMMaD1oV0OaQbvcSyoN+Uj6CIwTV/f88ma5sLJnan7dJPu2/DspwukWK/3KNJHM
         2QvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        fh=lnpP7GJfun/qXMV9qdhJTb/I/ag3kj9NGfZz7cSPZAc=;
        b=aCY1VigS8HX7xrcmhplBgfhG7FjDcw8StZnTTLGwtqJIjv+eiQzxbPKH/hWRGCwUCH
         NmnMTkfVO30kY5dFQVcLWF/oRwlP+8mb86nlxl098pqAD9xZxb62FVwJjyk/iNtS8k0L
         z3RPpOpqCKAQ65TE38+gBUx2diWfaF7U38YpeCjgKmK1fK19Naovq4uAxevBvEdeici3
         F7CDBKjwOSIXc4Lcs05StaoAJpmc2xaS+KhEW4eKcpppWf7t/PDyamAz86hKpHAogkDl
         X36TQnP6MgMP6SW7etWgNPwwPXHpEUByI3OTuC/XggqQt0NtNrSkWaF0GJ0utGY+j7aC
         RDCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610938; x=1794215738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        b=ZTEQuBhlquxXcghAghWe41mg7QngqBllRgUlvQT9uehPiOd06nBqHXJEca/YXjfHEQ
         eIZqKvQ5MthODkagbQ0jobFFQfsMNmHtJkX6nmFKd47KGseqsN9IGfkF3y3mg5yhyqWd
         yVIOhkDbgGIL96ilx5IBh9xeBMKNVhgdhAyt1zqfHIn60krvrTaCX+HKjaTs64jJgLkG
         VbTE4b3ZkW1HzUtccdnW0VJ1bgWAqRTjYNRVf1mK528NcVcuAvJD60PjargNsljWowvj
         NyK/91lxtwwmazwTY80HeHRu8Z0X30QNOkdZi85PD1AP9KF30wPuOLvO/mrgJTUn+AdC
         hSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610938; x=1794215738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        b=i23Db/Aeqc/ENd7PODDK0dnJpY4g8coLO1fVNrIqmTsLQhN9/pFGOBExWAtgf523SG
         n9KKvC5YnCcm47MOEZkdja4uoFn+Zcz0xf8Qrp+mcLX2G5IanXxfcQVnMHBVyhVS+ZKU
         MPUkevgrCPFK+Imb+gohCLsCmI5+YSUr8QyEQ72cDvkFfb0aeOTOf6GwTYqFHzluFSpf
         51WqkNrnBYQj+qx0M/9W07QIP6SIcCClE6dzlR+Sgz/1UvJKVLR8vmYrRm9V/xcAO1xN
         Nqwjh2PfBVPclgjke96to+BTXKn7l5nquE4JvN30kYuYK0G8ZakfsYoKNAxJ9BZKbCmJ
         RybQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEFZPpePK4sc8p3OFdwJpUFLBGWehgIyN2bwlR5r9FunUu31kLoZnp3QSjYuI9Qs7mbyCuBeqnPDP5@vger.kernel.org
X-Gm-Message-State: AFq9FYLbAyccUQsj1bNx7QxGYk6EtZdpLAxGLL9jMojEcaOOItiNQZM9
	17Q5hciEFSvEHNgiOXeSDbDNSf190uo87KaVn+cUzqiXTqbCTypm0nXAut3j10vJ2etv93FfsUk
	OjYZvj2HIwAULxV4TYhscl9E2hExC/xC7WL58UcC6LcrCgHZzzbkzED9PP1f9ASDp5EZN5ivA70
	6KYSaaKF1fsPIOtDL27jzn68v36WOa3oKtgcl9+xU=
X-Gm-Gg: AYBFou145mFytcgxSSPn8ST8YJDq331QSPjzNJwnrF89983g/DzAkRwvK4dJINbHbIn
	ZSk/4mQs0xu9uA/PaXhCcHD2Zvf+dnLTNH+cG5zhEH/J8t8OK04HJLV5EkxH2w5X4qWas9iM+n3
	LWXUVxlsCuEi/XpB8vCv2aAOfKGxQhKADoRHZNh8oUTCrY3aUpkpEC3nzQMDhp1N8+SIHxMoIaZ
	Po57mC/6gvDbirG0z5/m5AKH02LP40inC61esXiAYB23bS8Qz8qwnSTs7XHR7V0YktWDhLWQik=
X-Received: by 2002:a05:620a:1d06:b0:93a:2611:270f with SMTP id af79cd13be357-944216b7459mr1546915085a.13.1793610938026;
        Mon, 02 Nov 2026 01:15:38 -0800 (PST)
X-Received: by 2002:a05:620a:1d06:b0:93a:2611:270f with SMTP id
 af79cd13be357-944216b7459mr1546910185a.13.1793610937520; Mon, 02 Nov 2026
 01:15:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:15:25 +0100
X-Gm-Features: AclHuK-vXfGGpfTNdBgvUtbM93_wYn9Fa5uzM4AszJQG5UxZU_Wa-Rfb9kFn0d4
Message-ID: <CAFEp6-0ymJQN=9tu7HOYHdvRheAU76iyn3KFcVVgf0j8SDbM1Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not described
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae854bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=HTgco5He2NIbjNvQVVcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DyHQUeMtA5qXhbarhGaaOURQrJ8m1yp0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX/KufVLf5IhuZ
 HkfeEAHB5GQPzO0GXVhGylkM1Kwgay3QsluKwPPHf5Hgq9E/owMba4UcnMdzlnto/buph83UUTh
 XgCvY5M3KYrtIFLx5bQ2tU2xkrCTdNs=
X-Proofpoint-ORIG-GUID: DyHQUeMtA5qXhbarhGaaOURQrJ8m1yp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX7KlMliKpgqgT
 O6l4vtC8lUER6PaB9l66XeUudFqIlObWkSgpcn8mRK3OA/V9ncZq1D0IIsDIrfCLIUadtbd3E+Q
 FjAnhEM57DTLTKF/fxC9odSCF7j7n7SuJB1v1QHfnkKMAs5nQWQb/C01GIvvjJevTttvIIkItzz
 lSnIZyJM0++r4UFR8I550jHslZSyQiiTRTtewlqWk1W687asYBvCRBZ6HdLslHS3Ttv+l7PFAgp
 +t6zDhQ1QqDhVfF2R9MWVFdaL43OqFnKGf/YOOvj8muoqQaaumWoCiuCaIsppBQGqa626K2704F
 lxaGC3u0AGMNO8+YdlAyiaIy3WgYmM7LFPpGU3h/bMdf/jOPc0kVV5+7N9kXSvvRBWX/4l5vudd
 NvOlozNlFh2Y6fUyQ6v1Iy6jbmYDR/mHPCk6BfjSKA0QIT5hTLf8sB5EvePQf7wbiNypV7/eDMl
 /m58yLCyKiquPc4lBxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> If TPG is supported on a platform, CAMSS probe fails on a device tree,
> which does not describe TPG I/O regions. However support for TPG can be
> added to platforms with functionally CAMSS at a later stage, thus
> registration of TPG subdevices should be skipped for sake of backward
> compatibility with old platform CAMSS device tree nodes.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

IMO, introducing a camss_has_tpg() helper would make it a bit cleaner,
but the overall approach looks good.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..cf4687a20dba 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4965,7 +4965,7 @@ static int camss_link_entities(struct camss *camss)
>                 }
>         }
>
> -       for (i =3D 0; i < camss->res->tpg_num; i++) {
> +       for (i =3D 0; camss->tpg && i < camss->res->tpg_num; i++) {
>                 for (j =3D 0; j < camss->res->csid_num; j++) {
>                         ret =3D media_create_pad_link(&camss->tpg[i].subd=
ev.entity,
>                                                     MSM_TPG_PAD_SRC,
> @@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pde=
v)
>         if (!camss->csiphy)
>                 return -ENOMEM;
>
> -       if (camss->res->tpg_num > 0) {
> +       /* TPG register spaces may be not described in old device trees *=
/
> +       if (camss->res->tpg_num > 0 &&
> +           platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                                        camss->res->tpg_res[0].reg[0])) =
{
>                 camss->tpg =3D devm_kcalloc(dev, camss->res->tpg_num,
>                                           sizeof(*camss->tpg), GFP_KERNEL=
);
>                 if (!camss->tpg)
> --
> 2.53.0
>
