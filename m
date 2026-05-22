Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA89941C307
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466285; cv=pass; b=i60gdpj/t/WmH2MLROYg6Hiiti8lq+1ONRB0kz8FHbOnX80feiUCZy2TbM9sgkydXmUG4HXBVs0AHaq0wAchbM6RT0igjK/nj6ldRdU9+3pr1CQHsnbg7Fu5Y3b4sHQ0foiRd7DPhPukkxx2VbRl+jzPjtybtRSDLp8DdL1Ar6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466285; c=relaxed/simple;
	bh=bLtI2OBA5rafdql0eae6MY8/XGVx80bBush8lA9uIPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L3CmK8x4gfCYLuOF+iaz71F7hHCTtp360rLDH3JWfDcKrbNzhNWhP3uJ8Pffia1/usJGvqEhNTj61x19C5BseUes4m+3H2vXu0X1lxBhjnr5ylgXObOPm7tvwy0iYl9O9n/nwdrTf/DFqQDGW91OBdrHb5Sz22OVGI6+5RB7oaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8UL5tlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1zs7Ncw; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8UL5tlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1zs7Ncw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9RiH32765202
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lu1niHMrECx4L7qZONZo2E7wZ8eqqnrUPVegshXdyA=; b=C8UL5tltXnXU+6nX
	jHhbbZeMbZja0B7v1zrospoXn2ug1pL3ImgZciQ7OI7Py4ei7tviaRBOQVb6TZ1r
	7I6Sb5E4UsdKg2h7pRgaEEj5/YV1kwv/Wjp+ceh6enYt2BxwvxAwubUsJLS51Ohc
	d5cBl0XI2mFp9IWXX0Kfda9Zl5qiwh42eMTwIE5X1jsDKzWDHLF8Zb5SGuy7KHhE
	yiAXYXtAXMz/bAsnEaIqUKCqh12KIGXxeMogYcgjahBO5eTLbxD6Ss+r2P1FRlzy
	8oLVz+bFkGxYTiKaz1mHJxjjo40BRWgU2Am9jF3DdDh2Uc8jvHTiiiE5YVNpqxGQ
	SlI3zQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7wtgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b9dee344so137587085a.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779466280; cv=none;
        d=google.com; s=arc-20240605;
        b=IdmRDDNOogfhDTAIJp6A21aHedhXHZuIf9U1PhdCdDjaX1uXtJ2e53gqkTWBf0ix5o
         ZR3NDDSlIOuoN83BEGq16TZ49/GfbPDgJ0YiM1wwIoR6+vdPo4n3u6q4Av4CVQ615uj6
         Pe8oF/7ecVu9NA4p4vH0uMvwGAP2U7BfNB3ec/YV8yIBAuDxa3YoEGhvBUKHWqHkKrI8
         R4mgRelestasNk5VDFhjmJ6Pu2KQgpO/zZfalESVrZP3/br0EEhpcysnMhCMks5lcwCu
         0R/hxeTSIg2eMP3v0M1UlMO89yOIXeMqcEB5XBpHyPSv/lwJs5K8c+KbCzffDiCOjT2G
         HPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lu1niHMrECx4L7qZONZo2E7wZ8eqqnrUPVegshXdyA=;
        fh=GZwXxtwy3+zgeDTabbNJP49w+Vd9OURs7vNxPsCkYcQ=;
        b=Todp0cSunpErB7yNxc+B5yZvHF+nGWsExCWxO8SFdQL4klAIRKYcQQE47d9LYe/PSB
         +Dn7sPXXwSQz4ftNnYJpvv4bSB/6+xugq+hEugFg/BRKgqp2gBBtPWlHNX/NIuWcW3Hg
         T9J9xxgb7dCe2vRB4SKkgpKNWcfA0eJIWvUb/2BD9e7jXKsjpJF4METKvvV0Z0eAY//1
         XD6ZGx2EKNSD0Yz3Ca3tNfzORWMdu0VwTbE9w9ffqkWu12qmXXrIBoDuTm8Xy+hKhcDy
         uYqTl8GeQqbBiRCnONvm50VSjET22ovBbvx1xWvAjL5Fu6NPelhm72s/+pOG+qUdPsRo
         SkWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779466280; x=1780071080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lu1niHMrECx4L7qZONZo2E7wZ8eqqnrUPVegshXdyA=;
        b=Z1zs7NcwoaDDv18hn1p4srMEtR0KUxDblC4x/k/zSZIBcivFY5T5811aqqVbTeDgnu
         8vfbYJkDqDi4XMm+c6OrUhSkYklTjbGIxl9MJeCT560/ThO5zq3XWKpgmOTkzdAwACEb
         kso7CfQ/a6e7K48IIVbuvXZFazNPblDpkOHoeoeBgBELPXjsHH4B+WAtPful8DUWjq4x
         smluPBh87Z5D3Ah0DCAPGQqH58P3gCSl7WRz7U9OtCBY3fVsGIKua9LaFTZ51ls2HqLJ
         E//wSngSpgfiIdNBC3P6XdWxIQDo7JgZrSQb1TH5jbyOtpEIgzHjl+sxLV9hkt1Z77/R
         QIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466280; x=1780071080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0lu1niHMrECx4L7qZONZo2E7wZ8eqqnrUPVegshXdyA=;
        b=DNcXbH4pT3kElzVudzq/PwN3u3E7f7sCS8P2E/2YmiPFVScSXlfes6wB0Y+zsFOUxY
         XHS4J8KnZRKErqhJGsL/MEwQZRlEvxY90y2BPxRegiCFnUr2xx61Rn2ZBX/oyx0rVf8V
         J0bptCnRUTJAf7grKg5B5txyOmpNY9r+tShBzn55vsRnT6XfSEZ8ZqilFrv0JtyQv343
         5JKoHT8bwlD0j6wPXUyZS/dbEZQiLzG3bpvp0SiPb2gd+tmWvKyUycA4H7e0SOd1S4zs
         nv14bspf2UWhEwwyBd+IXtmChISlMzgBag9TVBvVw6EXAOOHZH7LhNy0i+94RmJA8PDa
         4xGg==
X-Forwarded-Encrypted: i=1; AFNElJ9Xnx0XIQ7v9n/CPeGocrkqN4Q4a0jtCj6lykXYyc9xU4ObjYUEguFEYcN7sZqDiI7ppptOSmL9o45p@vger.kernel.org
X-Gm-Message-State: AOJu0YwWs+GA8+44b9X+ged44kFVZOE3vN0ivG+Mj5NCbtH7ukEe4BD9
	GMotj3teWEKSeg259tjS83C1HJK+N2nr2cvMmPTYvHYbQs9IHeq462BqlCtA7ZmQsIwvyQTSpxb
	DC5JrifuPGoM9fu35LU/6oxbA0G+GVweTPqvcbSibrjflYDvYz6zbTE+lMkH+NAwT+abTg7Lm6i
	eVQEISARCZxUHhhTcjSmu6oLGq2j6rd3tISzrL+DU=
X-Gm-Gg: Acq92OEWSu4FQwTMuB5YfAUCkPhtms3tIkrZrtLyeeS/c2lPG4s83Bds6T5+Rk8xC6G
	iRLCy1MWiq6pDwand8L4uqdBEtJA36qQgJUK6W31XaLMakR5k8Ya09wsymSQ6a+Va6IE2/h9Jh0
	wXlel44xAejcGsxrUz0cFewrmDTMjgO5znxRGTh4ywrVt5R3uSKXT1BGJg3LC37ZskVSoqCQc3e
	fwMR7ACgvcjmMoQsDjTP3Ex6ZhDN2dIffPWJrM=
X-Received: by 2002:a05:620a:1d0b:b0:90f:9cde:9788 with SMTP id af79cd13be357-914b48d6853mr675636485a.5.1779466280572;
        Fri, 22 May 2026 09:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0b:b0:90f:9cde:9788 with SMTP id
 af79cd13be357-914b48d6853mr675629485a.5.1779466280032; Fri, 22 May 2026
 09:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
 <20260520-monza-wireless-v1-2-9f6942310653@oss.qualcomm.com> <cx3pbr47tsy5mnag73oopkodnx4jgoiipz5pzrp4uze7mk4fgg@zogzww23ueni>
In-Reply-To: <cx3pbr47tsy5mnag73oopkodnx4jgoiipz5pzrp4uze7mk4fgg@zogzww23ueni>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 22 May 2026 18:11:08 +0200
X-Gm-Features: AVHnY4KZcbVzn920hjyxYOpqLudIDkA1KQq_MhbagXA8SoEUbTo3JjxoNdQTHfM
Message-ID: <CAFEp6-3_NuWwF=gthfJyqeHMivGnfF0xpsTXT-xGW7pgFs+j3Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] Bluetooth: hci_qca: Support QCA2066 on M.2 connector
 via pwrseq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a108029 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=O2y7hZ9sxHz_cEH75X4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: A6gxzPuMS1qZE_XAqoUTHOUANjLriE5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE2MiBTYWx0ZWRfX0vXTZn9PpkhA
 AH/+IojYRxnIAjx884jZRncn5Q2Wlwm+FG6Rdyz/5g2EWgUG1FbJSND9l8wVm+vB2a9VbPjrU1c
 jqVzEj/WuwD8zxEqkKJrlWpAzEtGTFMuJOvrxHHOsS+sVJYRvTfWCNVXxQferaHmNzt+vHcuwQF
 LgtZQW0lpOqXh8DeU3hisQnDqWbyKlEMPeYMbr1O/tlV4gc4CsalAGC7wIMnYSBTjIkV4FvjIUE
 Uq8ID/MUaT4XUdmFJgNP9Cy4t9a0v638KoJ550+MyYfV4zQzN9jbCJZztfikGbOGpPdmySPilYe
 bLl54kBfj30so21ymJ+X4pRSPeNGEfpu/BggaKLC2gn2uP4XvSpaPqjB0oBNLEr9RGA7rW7rhdR
 6aYpaI0+re+HYJYrmBTc2sHM3qYAiTaP3hzYMdUbEgyvK54jSm1P/HYEnmUrLCr8rBW8k5B+CVP
 DAFmICwEA3fQUQCKKOw==
X-Proofpoint-ORIG-GUID: A6gxzPuMS1qZE_XAqoUTHOUANjLriE5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220162

On Wed, May 20, 2026 at 2:33=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, May 20, 2026 at 01:01:43PM +0200, Loic Poulain wrote:
> > For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable
> > is controlled by the W_DISABLE2# signal managed by the pcie-m2 power
> > sequencer rather than a dedicated BT enable GPIO.
> >
> > When the serdev controller has an OF graph (indicating it is connected
> > to an M.2 connector), acquire the 'uart' pwrseq target from the
> > connector's power sequencer and use it to control BT power instead of
> > the bt-enable GPIO.
> >
> > Also allocate bt_power unconditionally for all SOC types since the
> > pwrseq path is independent of the SOC type switch.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/bluetooth/hci_qca.c | 33 +++++++++++++--------------------
> >  1 file changed, 13 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> > index b5439b9956cfb0497e6ba6ccd9ed61224d23a9dd..de5cba7b7f44e280a48dad5=
d670fa2758d3268d0 100644
> > --- a/drivers/bluetooth/hci_qca.c
> > +++ b/drivers/bluetooth/hci_qca.c
> > @@ -1873,6 +1873,9 @@ static int qca_power_on(struct hci_dev *hdev)
> >                       /* Controller needs time to bootup. */
> >                       msleep(150);
> >               }
> > +
> > +             if (qcadev->bt_power && qcadev->bt_power->pwrseq)
> > +                     pwrseq_power_on(qcadev->bt_power->pwrseq);
> >       }
> >
> >       clear_bit(QCA_BT_OFF, &qca->flags);
> > @@ -2415,25 +2418,9 @@ static int qca_serdev_probe(struct serdev_device=
 *serdev)
> >       else
> >               qcadev->btsoc_type =3D QCA_ROME;
> >
> > -     switch (qcadev->btsoc_type) {
> > -     case QCA_QCA6390:
> > -     case QCA_WCN3950:
> > -     case QCA_WCN3988:
> > -     case QCA_WCN3990:
> > -     case QCA_WCN3991:
> > -     case QCA_WCN3998:
> > -     case QCA_WCN6750:
> > -     case QCA_WCN6855:
> > -     case QCA_WCN7850:
> > -             qcadev->bt_power =3D devm_kzalloc(&serdev->dev,
> > -                                             sizeof(struct qca_power),
> > -                                             GFP_KERNEL);
> > -             if (!qcadev->bt_power)
> > -                     return -ENOMEM;
> > -             break;
> > -     default:
> > -             break;
> > -     }
> > +     qcadev->bt_power =3D devm_kzalloc(&serdev->dev, sizeof(struct qca=
_power), GFP_KERNEL);
> > +     if (!qcadev->bt_power)
> > +             return -ENOMEM;
>
> This builds bt_power for all devices even though it wasn't the case
> beforehand. As such, you can drop all further `if (qcadev->bt_power)`
> checks in the driver. But, you also need to check that this won't break
> support for other (older) chips.

Ok, I will do, and double check.

>
> >
> >       switch (qcadev->btsoc_type) {
> >       case QCA_WCN3950:
> > @@ -2543,7 +2530,13 @@ static int qca_serdev_probe(struct serdev_device=
 *serdev)
> >                       return PTR_ERR(qcadev->bt_en);
> >               }
> >
> > -             if (!qcadev->bt_en)
> > +             if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))=
 {
>
> And this breaks support for pwrseq for non-M.2 BT devices. There is no
> OF graph in such a case.

Not sure why, here we handle OF graph as an optional pwrseq provider,
but still support legacy enablement.

>
> > +                     qcadev->bt_power->pwrseq =3D devm_pwrseq_get(&ser=
dev->ctrl->dev, "uart");
> > +                     if (IS_ERR(qcadev->bt_power->pwrseq))
> > +                             return PTR_ERR(qcadev->bt_power->pwrseq);
> > +             }
> > +
> > +             if (!qcadev->bt_en && !qcadev->bt_power->pwrseq)
> >                       bt_en_available =3D false;
> >
> >               qcadev->susclk =3D devm_clk_get_optional_enabled_with_rat=
e(
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
