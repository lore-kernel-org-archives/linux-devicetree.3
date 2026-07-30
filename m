Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7EB3FE36C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411855; cv=pass; b=l5U90QWm4m/06EeTXV8mRrx/+UQ5/B+FUq07AJzcuJy0oOOWr7iMJtzg0sU8hcbjqfecH5lXi3ebMpFPpxTIE2QUsUwsAdRj5KFoRguJw/2T7htyYWCqGWJEaV64BbYzZC3aZWN6arauWP87n8w8XQ+TiqLhxYS+0XtWE/O0C8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411855; c=relaxed/simple;
	bh=ev2/weVx6xMlQgDmYd5TevoZcOHWWng3/NPgGYBbmDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IU4wsa7Fz0NTwtjctdiv9yvTIagg27uF199r44tJS54pZTX6adYd2Bphb+PaxUCpxw4L8oMUpZ9KUUdPYmVJYdqHZQAXz19YNJEGk+h4UoFkbHYsAUqO3Klb5h7isVi4Vr8O83+NBQ/a08OcqZNe16VSHZLuDAB+VQPkqQucymA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XITbllBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXKs+WF0; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XITbllBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXKs+WF0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UBZPLV568034
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFdmZs+lWs/CU3aJZjtaSyzVJfvoHSuYdAqR75AXrhg=; b=XITbllBC/1NxFjvl
	Ty+GQ0YtrzxeN1b2qsd7RLaaJeycUAbGDH4NeE2R6P1ncbHsOonDM5G/5ntIkDC5
	0R5N2HHwYnV0hoq7A869wY5u/btDckkZhVyq2PmelyyVEmi6iJKAn6tpiEAD0GfA
	dP5CVHIE+010lrQ0G6cmq0oPC44pNn0O5bHLk8tjM856SvIUSP3gaKh0AGyYT3lB
	5MM1NAs9g/ZnaIu7bE4uniHazCkYKpup1qESvr0TJPqs0sVO48nm9YJ50q+nhAmH
	EG7VyMELyQRuIdx/qKR2kuLauCVswlPk4douxRuTai3BT4XUb+Fda1+pKJJsRTIF
	iERbLQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5vd811j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:44:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9077b4c35c5so38504336d6.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 04:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785411852; cv=none;
        d=google.com; s=arc-20260327;
        b=RkfEYm8G1uLKrlWsLs7nsTYs9B66rPGUA/KKhrk62Z4bGwyV+PlHHqn/cFEgIsLeZM
         8RrMsWGcLvWI+nCsjen2LoOZxDXgH3eXsv/h0WF55oykA+8iTDdTOE9tXrX3tseJGIbX
         TuWLiWfvNu4d/hkZssjsapDyTWBVDVAKHyfvoT8o6HieVEUE6cVkyDS2HLXiO/uZkI9U
         h/upVwCaAt9KEI1M1S+EiwGfnciJy7KqBrzBoPTgDp+jl2nxwStCRXZ2PqDwoTQcEarh
         JCWpI6GkMlTWAWiMlcZbS9zZJYNLIiLHNqnT38RI0Kfwqi/ouoBO71TzmVKZC90iCd9x
         COHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZFdmZs+lWs/CU3aJZjtaSyzVJfvoHSuYdAqR75AXrhg=;
        fh=jgnvHZSYukVZNw9iao0iZWsAXr3EH4Qz5SjL7fFdf5U=;
        b=KjIVRA661DiqHqThNr2g21hmRPaly4ioy1PX2dTdlHb/vIgUbLyJdjXt4b7e0ktapb
         DIZqys4V9PmI3jI9xkJwlRmRLZxLqe9z1bunmCY/nd1Ny0S6yO5GkJj1pss5Z9oCgV0+
         VEpZOz9tLpAzSEDJWdc5AIYfE3IXbyUoaxrOCIMvgsoHz7hE7NhgugSwvgPFoh2bw4Qy
         K6HcKbm5LLUsUCKLlOnIgdUN2B8SzI3KL4Ld1BYuk1e/fkPLAnFAbYH9LBozQU1Gu8+G
         YT2aheTlVvSpbFOiDKueGZdoEhRCSGKLrlAEyezOGM4x7POvk4R8cL7EzpDodDC5jh8n
         RxmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785411852; x=1786016652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFdmZs+lWs/CU3aJZjtaSyzVJfvoHSuYdAqR75AXrhg=;
        b=LXKs+WF0BAfH8Ok1l7lwvjE5bYWxTqfGh5TPwVhNlRj0msq6hWKjER1ot3XN0TIq+0
         gbX5ZnTR271EeDeL3cmFYKGwGBVftKGXt4aZKbRaP1X2Ncy0yCBAm5qX3xdPnAIrkc0t
         x5RMnUdD4GakG5llXLt0N8d+2PzMPHaMWo/GT+nav9Lpwl/tJwUTsF1FmA9p6oHmpHUI
         tjWmkoWHC+a3iV2eZoCuwPuyxdLedmTt+ABNUxlD45S62IYvHcnA+p71BMxXOwBeoqf1
         rIkfTvJ1DwwsqrpMq47fo0Fqam4mMWoTnxy65MvqJ4VBm2/ETYHFXkQr3einiT1YTQO/
         1zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411852; x=1786016652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFdmZs+lWs/CU3aJZjtaSyzVJfvoHSuYdAqR75AXrhg=;
        b=EVKK0fe+yRMX3Auap25bITKqxcsKzmF0XXHQcwUYlP5t4b8aoXPq8jaDgpC4lfTU/X
         jGbXQ3KhqnQEdT4qbM4t91Qwo0AkeWORboyHesXzENtdTlq+fK4o8yf0C8v5MA7Qd88t
         astANj4N+rgy2p6iqCeX4JX/jS87DAP1UYtaU3PN/7s7uYNzj5g9lbJGZ1uJpI76ooFO
         i54Vv5A7jQ2yOArw7pikYPcKPlm+BdN7El/va2Zwg00CB464zDhwsYKNDiOT8hgCTM75
         Dc/8Dfb1fPqK6eiHSgJk1tjmLhIOoOxqVu2fXJHakAZGgMmHsE+uZYyDO4WqkIPG9DgK
         4aDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlO6f18GMjIgBtEcPBURfHaPBreJsVK1IEgWJpNT29LBHa+ckCPrfShqXBtuvCVkYGU7io10bwema1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3q1p4e7LRGx9qoerzhFtB8x3SKKMuhuXuvvJYjfmjsz3jY+4o
	fU65aa0heeBBt7RxTQx9Qp0msiXes5KKz/R+en69UeKIrd5IpWYCaSGOCrhTZcF1O0Md/EAa1Uj
	KELXzTptzsYW5LxRDKZ9iF1YVbWNsP37urW7RsC6LgQ3c+dSGOe5djEi1XpcFVGMXtEtTfqW9N9
	wgiLD2bgQB07o/SJiE6Er0RxNIUar/OlYgcemDLMo=
X-Gm-Gg: AR+sD12XC9k9p4z+S93iFlB1N7w0/0H0JwbOvITex23TWue/KTqyB8wFo0SvDTU8AlU
	036WZd3HQ0txfxd2A/qs25r+W/z+34xcJdZIDgVvYxqTtL1AcPU+zO9KNhcsUPRaqMfGlYVljvR
	/PCcFw5jNVGYlS6+bVOuBUl6FXBpAjGFDCvppzTrNVHCSxR4myAvAwY+/yk/eiVo4Vst8QHiN+O
	V2drtOx23FIjh+MQVN6xgXjYY/AnacLFXBwqbi+p6/oQQd1wxUD8PvzLs5ysX1rqToce3TjRmA=
X-Received: by 2002:ad4:5d6a:0:b0:8ea:184f:c15b with SMTP id 6a1803df08f44-908346f08b9mr18113016d6.14.1785411851766;
        Thu, 30 Jul 2026 04:44:11 -0700 (PDT)
X-Received: by 2002:ad4:5d6a:0:b0:8ea:184f:c15b with SMTP id
 6a1803df08f44-908346f08b9mr18112746d6.14.1785411851237; Thu, 30 Jul 2026
 04:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com> <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com>
In-Reply-To: <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:44:00 +0200
X-Gm-Features: AUfX_mwxQD17-_pwcBQOZzIjdUKawWJPVhjgc8TmItAVXQo-3ebnuMZ032ZLb6Q
Message-ID: <CAFEp6-157JZogPG6vHLUjYiAJ-fwWcVX_xSMTUY=1R6+kat25w@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4OCBTYWx0ZWRfX5zEqAF1MUnCn
 e1a2rFJ9X+cOSArZ5+qZ+umJWL3ehh/CC2o8EspLcZqzFsYhJPVgub3ueEhf/adG80CsikQyszq
 DXxmMmlJz2aF9jnFd6MFE8igSkty7Llfm0ayt0p5QyZ/5X6/HZX/3w9yZJQnrWN8SaezUJowtoE
 tSu8gbzZvJ3hXlRptWEkA/Ik6vgtC3CCdXfJ8xeisEsHluPQxytYvSMwGvbLYhd78NnNN4VBmCg
 ENUlbLm4yqk9HBEF8Z4k0YHr0ryonPzNE2h/KQq+1Rfk5wo49zkg/CJXiHcMppvf1bTFdNrmcrE
 421QhxVcTce7t5ueUs2PXpX59GNaKyCp2Zq+U0KUNmt9XUbra1QoDpXmIxOqzOcT+iA56aNWg3Q
 3OkEw0UEYDI49t5p8wE7kg6toZq7jjTgOXAMbubMUoiXKgnb8eMelLcu0+sZVyv5/L8lm5oBsVM
 BuG45lL2Uk/9NQCoYXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4OCBTYWx0ZWRfX8flv1D8qySbd
 pRQhlelZwaIErv5yeONEJKkwlX+P95I/ggKLO9qyv93BQMQ3FQMQKRjyzFGjwutHvlG365y+G5X
 5t4Rw7p1VQ+jFCNZIkx1fGq/NH2kYcg=
X-Proofpoint-GUID: rNEzIxG0PztP3C2yV__OBlPyNoNaMO6M
X-Proofpoint-ORIG-GUID: rNEzIxG0PztP3C2yV__OBlPyNoNaMO6M
X-Authority-Analysis: v=2.4 cv=ffKdDUQF c=1 sm=1 tr=0 ts=6a6b390c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=vIisSAodvos0t_4omlkA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300088

On Wed, Jul 29, 2026 at 8:28=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 7/24/2026 3:42 PM, Loic Poulain wrote:
> > Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> > Qualcomm CAMSS ISP parameter buffer. This format is used by the params
> > video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> > ISP tuning data such as white balance, color correction and chroma
> > enhancement settings.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> >  include/uapi/linux/videodev2.h       | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d5=
9409dd6cc97522943 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >       case V4L2_META_FMT_C3ISP_STATS:         descr =3D "Amlogic C3 ISP=
 Statistics"; break;
> >       case V4L2_META_FMT_MALI_C55_PARAMS:     descr =3D "ARM Mali-C55 I=
SP Parameters"; break;
> >       case V4L2_META_FMT_MALI_C55_STATS:      descr =3D "ARM Mali-C55 I=
SP 3A Statistics"; break;
> > +     case V4L2_META_FMT_QCOM_ISP_PARAMS:     descr =3D "Qualcomm CAMSS=
 ISP Parameters"; break;
> >       case V4L2_PIX_FMT_NV12_8L128:   descr =3D "NV12 (8x128 Linear)"; =
break;
> >       case V4L2_PIX_FMT_NV12M_8L128:  descr =3D "NV12M (8x128 Linear)";=
 break;
> >       case V4L2_PIX_FMT_NV12_10BE_8L128:      descr =3D "10-bit NV12 (8=
x128 Linear, BE)"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6=
fb2570cbc6bced230 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -888,6 +888,9 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', '5'=
, 'P') /* ARM Mali-C55 Parameters */
> >  #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S') /=
* ARM Mali-C55 3A Statistics */
> >
> > +/* Vendor specific - used for Qualcomm CAMSS offline ISP */
>
> It seems that this is generic format for ISP parameters, can we update th=
e comment and remove offline. The proposal:
> /* Vendor specific - used for Qualcomm CAMSS ISP */

Sure.
Loic
