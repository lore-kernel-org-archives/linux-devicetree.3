Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0D424653
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785414873; cv=pass; b=EGVwepWnC3/2le8u4VFMEr/5016KgXA/2MeJxwCsHjv4jpnQM+9JcpJ8mBjVTdvRQ9X+JudQLXx97+mqpcHlK+crqkXoxypJK1GB58oIT14rCdBU0pCJUUWcFNWn5CpJ4drvZxlStskapgkOn0zrFOoJX37yhZqiEqe3niI5Y1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785414873; c=relaxed/simple;
	bh=NxWEunGjGB86A7F89AhMOE8cJDXgKJh1EGHFuiKVhl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=toYsUxdXEQxRQo9+NGf8pbAkazmBRh8FQ0qeVpDaYEQf+bwX9kjdgsEz1m0BvpwGcBJbnTKIUv4p8WXnJtxyUT7oYomgTTpM1sRcUVRKmqUfOcfNyec21FtOtGFwG/JSPzFBhyole+C1GnnDhzdZ1U159MyFYaRrikYShXRiiT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2NXF71a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSJNlEKj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2NXF71a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSJNlEKj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UB8jdi828159
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=; b=X2NXF71aPsY6oyRK
	kpXT1OTMuzTzpetDZa/SgPtRNGCr2anNPQiBNRyyHucvvNxO+rrCpfqg63C8e3AV
	jkj7Ah1nEElTgWEMDyOAfYuYPptOvFs0Ha1HuQR6HQP92ChR7LsYDCg0cOLkcrjt
	DoFWV2PWfx2oW5CWlKU40WKSssB+SXacd92oJ411MlhXz4mxoPHmXhipcpuPdAI1
	n3s00XzCIP10ZCT83954Sb4CbOyUAX570SatOTUvHaJNWQ7L9IyHL19FGGWW/PMP
	83w0l/7ypMeaHdJ1A7ckAjYrhwEoh94C038E33wvqcFRDP7qTya5YV37s3q93Iyi
	jDh7TQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5fpra3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 12:34:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so6688826d6.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785414870; cv=none;
        d=google.com; s=arc-20260327;
        b=oqSp6YPM75AiLWxXlzIYwwsolSC3sgw2D5YDO2tKUI6C9AIUFRsZECW6M5DU79689F
         RF4BvwX0A+9rwWOJdIhY3iWw4/OYLmSkSeg9k/xCGefpZdUBV635Ps9V5SjMqKOJtDTe
         1pB7jUPU1ztsCnsX7jHgUCkMqHkCVXG4jBbFUf8E2DVzcebiJ8CFoq9BcRxKpvsMnnyV
         lBeUMvdYaTDVO7DvM1rHnq10LnAGlc/QMovAqH+0wQhP7yQlkCduGWynWE23tL1LDKJ9
         +mvt/X/+4v76xESvjQFk2Bg1K92FYfoMH6BLHE4N60VhJwoQXs4GM+CP3vNckeOb0tbY
         CrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        fh=4deQ7F9PPg8Hx9ARHixAifnlyxmZqH7gVDeL7RzMb7w=;
        b=DKlia+QIdIyS7AA7KqAEAXh9HcZ0i6+/BUhZVxmZydZAFGlvHbyJxxOhqwDHTrHxsw
         WvvKAVTfg5bPlZVOR0GDP2KxliiRXs1CrPhffsQ4+RJ6DdEzzHg9bknzSmmNSUgzux5m
         ZXw+7vrFuFOirFAu43oK0hEHF78jMlQVRb0Fq5GwbXsjsmjXyDrLjpGqIZeM6eRQHv6u
         RetISqiefPj8VmDejCFjhrm3hW9nd2cFoB++TVs5ImoCnniB4ZTqHqTxOfTV94i4EzS7
         PJAMW82jb+Q01jujhv8Q8+LTBSpNGbnSnb20iOpAzVX0ygFQMqQOqB0uigY1IHeQfKOA
         aiSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785414870; x=1786019670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        b=HSJNlEKjmlayVed3YFWXi2+ZYH+3hwYUoQf1HuMXvNv1dd8Ti02RCaOKfIbnMT07rB
         gNDcKfkrFWwUNPaZOYQBka72qkqS6tyLJcVi2hJpunRuCMQVNaXUkeraAZYeYammq21Z
         owUdjihl7A4fhfsECCzy4dm5GSYs8j3J4FWzvEYS2XXvXzGcrvlR7ZXpwDF/BMyaI4vK
         UQP2yUERYAYhxqzuEsO2DgnEHgyF4JdCL4wTk7QKvAy5+n6QvCydfvYWHRgH9GBFrAs0
         21OzR4qqFwBtmZ+Si/+karTGQKqD37sdAzqmNGKKyEM0Zpvq1FViGnvmiPxgiDNTkM+s
         qeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785414870; x=1786019670;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0BeCVwbfS2EedV2zVMsiVjAyyRHPtS6bc9+ZZ4vpvA=;
        b=NT+nULM2Q3a5ZPMkhkYhM64rcqfrqJGPHY4XoCF+P4bJeEHm0XAdHEXz+aEC2+2X+P
         ARMxgSel27aJFg0eTtVidsI4L7iKtuyQMuxax+OH7xzUbbtopoxXaGf/QlArU37ur28S
         82/wllWONITYZiL1RnucuSXzJHdK/s6EygZouARPCgdPfR0oKB8zwyP91191VXYgllWV
         WSg/fWedBuD/cl3bv5iaJyxDKsEOUaLJ/2IB3k+kBNAVcdd4nDRxDjjd/DsaqQs2+va1
         XL02QcJ2gJEPKHA9jJWy5M56iArLgMlqZSEbZ78iW1H3s8+vL7mnUHJqYU1W78tRcD6S
         S1mA==
X-Forwarded-Encrypted: i=1; AHgh+RrBGwxqlllxwj9KU5pLfAiJIJKjOR8coS2GWuHYLqImv2mDPukYHt8313/EJZLP1OIBsagoya31Os+B@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxGY8cRoOsoo/SUPW2wWbbu6kghqL+GMX21FbNMOvHHhty4Ee
	8e/NJi52zQb9sD0DrNUVQLh9+P27W5mpM82R9A9ApXSKIlxfxnB7amZy1Iz8Lw6wxuYPF8v4ekM
	8RD/D7YHbEFbamwCkAJ/zuauFzvudcIy0YYuH8xTMTacN4nD3M0Pw6B/ODIAjrnggMAmF/dk3QQ
	W7TKJTxyfZdmLVtoZf/4kfCRQQuloBoq1w3QpIaQk=
X-Gm-Gg: AR+sD10vquy5z0sE2d+SzLwjgRt2tpm7dhj+Dh8wqY04QCjU9QRvjk3l9cIoRUIzGh3
	Xqs+J5b1ozmucg5Uhqu4iVIDMFz31LUCo93CT6QOWe0tgtL85MNKgXfRfxLaSywoW80tgT8BSeL
	7mo4nxYY0B1g/bI0eyazirbQbnrrDDQm965bxf9WMy41M8OyHkQblnldC2ylFfj/qyjdMSb5M7w
	88NNJzHLYLOl68Eot98NdfV9JR2RW6tN9Wt2FfDXw7IfCh2KuJ1YwGiIaZG7MjKZPV0UzaPZo8=
X-Received: by 2002:a05:6214:2388:b0:8f1:ed00:7fd8 with SMTP id 6a1803df08f44-9083a3ed266mr2312446d6.3.1785414870372;
        Thu, 30 Jul 2026 05:34:30 -0700 (PDT)
X-Received: by 2002:a05:6214:2388:b0:8f1:ed00:7fd8 with SMTP id
 6a1803df08f44-9083a3ed266mr2311916d6.3.1785414869813; Thu, 30 Jul 2026
 05:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com>
 <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com> <CAFEp6-157JZogPG6vHLUjYiAJ-fwWcVX_xSMTUY=1R6+kat25w@mail.gmail.com>
 <31a77684-221e-452e-85a5-873b0cbbc118@kernel.org>
In-Reply-To: <31a77684-221e-452e-85a5-873b0cbbc118@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 14:34:18 +0200
X-Gm-Features: AUfX_mwG_XLqff8We1-VjUFCpEv_zMOLloZt58qLvXWmamPVEeHzeVGoLatBSdc
Message-ID: <CAFEp6-1jt_q2YZv17mxWTwKbxipNoh3F0RPqhLwhdH-ffcCcvg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ErfiaycA c=1 sm=1 tr=0 ts=6a6b44d7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wb1n7jFByJHGHbbB-X0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5NCBTYWx0ZWRfX4puQzvsiYUrb
 SdoZmJ2JO13GwPLCvSX8VUxsSjxFGGmpT5imKJE8pfoU9Lbn1VoVxAUFxLea0/JLqZ/PIwhwaa3
 Je0+hPwMphndWPMYL1FxzVA5Geoej+CdqH3nA3oZZJb18DmlrlmB6tpiviZlCt2uZHCb2zW2eyg
 7nw9SJ3K/BYASOmLqzDSW/fUGaFwvrUuQ4FYnIetQfRZRNWaVqOEszDiirzxcwRTQsx2LmVx/uU
 bIb/kuoDIPHMHmTvPRAK+p/cigm/YBTmzaZpt4Muglhu2Jqnap96xUMp4dArv+dIR9WUHkLr4tT
 2l8o/+9mNGawn27PBwyogbDz0+64+zXENqmtRGbFFyG7aTxfbAyBcgCLT6eTAECJl9uoGoSIv+Q
 cEOlt8qwLJNHL4NX8JWXmD97RvNS/ejKQHG5WxyFZxKcg19fs4Nxs1wGo+TbW2C/5vnS8XQFaAc
 mV7PP9FFcLHMyGm2czg==
X-Proofpoint-GUID: 1wTXOyiUsgX9FQe5GQ7kcXo-6ny4q1DB
X-Proofpoint-ORIG-GUID: 1wTXOyiUsgX9FQe5GQ7kcXo-6ny4q1DB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5NCBTYWx0ZWRfX1b4CsxeUSMWC
 DWzrihHiOKsbH2ABc6uCpqUv8CC8lJr8qpsqbz1umx4NcwQN7riE8lCHJ8iEWFz7nvNw9p7P1fV
 KSNGf9nLPYL4PGaw+c2qWDZ46SDNOAw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300094

On Thu, Jul 30, 2026 at 1:57=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 30/07/2026 12:44, Loic Poulain wrote:
> > On Wed, Jul 29, 2026 at 8:28=E2=80=AFPM Gjorgji Rosikopulos (Consultant=
)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >> Hi Loic,
> >>
> >> On 7/24/2026 3:42 PM, Loic Poulain wrote:
> >>> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> >>> Qualcomm CAMSS ISP parameter buffer. This format is used by the param=
s
> >>> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> >>> ISP tuning data such as white balance, color correction and chroma
> >>> enhancement settings.
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> ---
> >>>   drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> >>>   include/uapi/linux/videodev2.h       | 3 +++
> >>>   2 files changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> >>> index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55=
d59409dd6cc97522943 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdes=
c *fmt)
> >>>        case V4L2_META_FMT_C3ISP_STATS:         descr =3D "Amlogic C3 =
ISP Statistics"; break;
> >>>        case V4L2_META_FMT_MALI_C55_PARAMS:     descr =3D "ARM Mali-C5=
5 ISP Parameters"; break;
> >>>        case V4L2_META_FMT_MALI_C55_STATS:      descr =3D "ARM Mali-C5=
5 ISP 3A Statistics"; break;
> >>> +     case V4L2_META_FMT_QCOM_ISP_PARAMS:     descr =3D "Qualcomm CAM=
SS ISP Parameters"; break;
> >>>        case V4L2_PIX_FMT_NV12_8L128:   descr =3D "NV12 (8x128 Linear)=
"; break;
> >>>        case V4L2_PIX_FMT_NV12M_8L128:  descr =3D "NV12M (8x128 Linear=
)"; break;
> >>>        case V4L2_PIX_FMT_NV12_10BE_8L128:      descr =3D "10-bit NV12=
 (8x128 Linear, BE)"; break;
> >>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> >>> index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374=
e6fb2570cbc6bced230 100644
> >>> --- a/include/uapi/linux/videodev2.h
> >>> +++ b/include/uapi/linux/videodev2.h
> >>> @@ -888,6 +888,9 @@ struct v4l2_pix_format {
> >>>   #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', =
'5', 'P') /* ARM Mali-C55 Parameters */
> >>>   #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S'=
) /* ARM Mali-C55 3A Statistics */
> >>>
> >>> +/* Vendor specific - used for Qualcomm CAMSS offline ISP */
> >>
> >> It seems that this is generic format for ISP parameters, can we update=
 the comment and remove offline. The proposal:
> >> /* Vendor specific - used for Qualcomm CAMSS ISP */
> >
> > Sure.
> > Loic
>
> Since these are not the full list and as I understand them not the full
> structures for OPE - qcom restricting the full formats ? - I'd request
> to move these to an OPE specific header.

Yes, I think the params struct can be OPE-specific and defined in an
OPE-specific header. However, could we keep the enum in a generic
header so that we only have a single enum definition? We could then
extend it later with OPE-specific or non-OPE-specific parameters as
needed.

Regards,
Loic
