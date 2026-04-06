Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7A1371D1A
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481779; cv=pass; b=h3HIMPJRed2SVpRp4M4nvyPGsvVqRIDeRbd/y8LrVfYIxck0D05W/PboNj/xzJVGn1Kevn+9sExwjYsPvsM2rLVuDtYCEyrnsY8gJCLEjn680lAXthqIDXOjQGcoaZb/enLCzuRdJMMshXihYv7+IfXDXys8hnfhz1tSgNYa0Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481779; c=relaxed/simple;
	bh=VK1ThM+uqbu1JSH381FumBkiogu/j0zYMAwl+a98Hpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewGT3xXWT2V11rgQ9RKfv7HAYEdhovSI24psjaGMHBHTmJxB9oATgdbtd4I9CNwMbN9Nz+YAKfR1cOnMSJsuivYQNIngljr3ILfC0nCNxGYLxkN0tpagls5EY0+jWl2oaF1fhb5uwkwtJJjOIC30vtJf/v3UB6cRc/CXX0qOCEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTEXEg9q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsrWhH0j; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTEXEg9q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsrWhH0j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636C8rln1346779
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 13:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=; b=iTEXEg9q7uMQFgIJ
	TiWom4He0UwvRFm3uXMy01J0jZbm21f3OXVzDbueKzLh5ic2Bv+UlXD6Srd8KonV
	L1ooDr0UABvbiQX9kl+GCljpAWJ88AuXfAMK8Stkx6BOYF0p5PGdAY+1Zbl50iSl
	rmC9WBQDaYxQYl48D3mVbKG47zUPCXMxS5PAI+5KLqznAcwcv8si/Qmbd+XPATXU
	4IMmsNawBaL8BpJTgnqggCyL13JdyDCroBkm/Jm5yTYgBC+EfAdmQGMGulOZfdxh
	NNTSonDhxrJb5OzgJ050JyZ79X30jYygEoBs2IbyS2mov9euO1YfAsOQ3INtTTlS
	JzSssg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcck085w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 13:22:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a1accb970fso116107186d6.3
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 06:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481775; cv=none;
        d=google.com; s=arc-20240605;
        b=RKPaeysyZ0RFGS6ldBuCy/fwJK5dDCbfG/JsfkdikQ5nYPCjpd2SLuW8E1QomozJ5K
         dASGh4JQZDR4RdWsloqePXrc0xLhyDFGkde9Buj6V3SZ7eR/pE1cBKW682u5FZsaOsrh
         kTTUWu5YBOzN/zAYT9vFg2YfBvCqIKZQW8KF401VGo3XSqlwDCH64lWXrXjKKVR/CaBS
         AQYXPdKbC2nMpCc6TCk14pKmnnAUjgeBqwOltquNzESSjM+DyWgg1S3XvZZtBeY5nX63
         u3Kg1Ur1HR16om7S0h+e2+rev1STjq+mZbLi/qOa56xzB4mvLbbXKOiILKdjsHOJbS9Q
         Cq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        fh=IuEgsFPgkQU6jKSHIioRS2v9vOEL44C/hlzI0+MlQAc=;
        b=hbq1L2o9LX1JdeU8hVdRYxFcWGotfsRNC3w8jL4DaXbCLmTif4MKwOQ6dFQCzSDojk
         9vFQGil+jfaMLCVpsZ2JKl3FeXJ8t/eGS/w28NUWJgix4+z+CCjtnGBwWB9MFA+5hug0
         lr/89tEiRe2AxfhCXqAcBVOQBoTZcoeFNWTnRBEb3Kiep/fjxc7ealA4YWqRejJGPG3D
         p6xn1u3876LsHC8JRiGvMC6HcygxVIakeWinUAiI4mRZhH5UBjlaCsbbMt37NNUmPHyY
         ALJWedp15Ev4zW6C2H+g1LQWTYK/V3EjB7Y/49VLhHWgKvpv5vVg38YTNL53wCBKVJuX
         ebYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775481775; x=1776086575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        b=NsrWhH0j+kzOha7j8tc4DdvfVPQ3mvmAZNoal+uzmPC6CwWyHFPeUZehjxI2H+c1BS
         0iVWArigwVVMbdg5TLn4V4cBFpR078vRAeIJZeB2T5U/TDYTDa7RhdZsJT/aWW/pKsjz
         0q+iTje5zOwYhsIq6Kv4Nd29FSV6/G+BBATY6dlIZmhpt6kfv/3SC00gQSmxeYXz+5Dg
         0+eQesUxfpr53ZtD5eMuSJNr26az050MsifGVKN8A5Z0y81xcRDQY+WMkcn/9UcPaLer
         LVRhr2nTr7Eh60yiC/I7IjwHgcFFU0PC1iIG/S6NPqfn17FufkeLtr3HruTkUZwp9HDX
         klPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481775; x=1776086575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXW5EOLhP6pJTGPFoJj0ro9L0xBVMhnkMxgE+lrT8AY=;
        b=f2vkpisyKFJbC/eWddz+YB0144Jo3Mdq3/mEj0NSeCs4DnRPMtQxNhbGNvlyVXtDGM
         UgFmPy3A/z4B1ev/u33m4Lfn20PQp2HdnAcJhfzMO8VmyfiYGDdi/R+75ZekpCLB60ck
         rCOCznxiVP7tCLeaeyqtuHRXxYr+rJELzA31X1Fb41CHE1YENC0u6rLYpRgPOEg5wlZ3
         gaQdiC+jMfRvLvdilV0yAXE6RDDfCZtJCz/6Xdxu+eMI8kIVkQ/pAJWa5YDnShg1kXen
         +5PdaCuOG7ANUdDBi/yS/kDWZkRALksjbj3BZOg3dV1KFDVVD69GArL3vnPxFCPT4+IS
         Pnsg==
X-Forwarded-Encrypted: i=1; AJvYcCWwRnie/C/TviHnlGFRTTkRdbMVUF0mDCi+lr+zT+M1RspqKRBYlnH0KPKJXW+qHenqaIHb4RBHqKvb@vger.kernel.org
X-Gm-Message-State: AOJu0YwfKmuJHuiYLt/Y5TyQfsFoGvbC93+feFkWQNDu8Wiw9cDssMN+
	BoxHAXjlkOyp5T9DRlAN4Tb+vVsUcoRpphi8ovSpYltKo+JKJpAfWY3tp8xjO+MvKgzSXB+qelT
	g7VUhOXFBNms1CMk6ZBmgjiW896H25R5tpSRQe0JvnS9I3494QVUWR4SxYy48q+xfS3tJuH2E6O
	mOe4tFd62y6vJLcaguaATugz7ZgpzHUE/AWA0ktGs=
X-Gm-Gg: AeBDiespwc+D4cMwY45M42puJk0ObOiPTqt+CdKczBXvzmJR9E3OLQNO80PA8JKH62O
	1y8APxFKd4LB44aUWTjQSoCMibGkCuNIZL2XFxhDjGuB2JChlGqFxxjQit5WD4C8j/LplNa8IGQ
	jSqUFZW8y9Iyb5x5FqA9eaXvgok0D7WsCfiz7ItsQC5i0ZMWaRUjlVxlLh6cp1ps+eyqvPUKqJ1
	HXqdEqSLLunZ/Z0ZGLzo/VBfeembE3QzukFZHGTtVp+Eg7ECYQCh8jilc29y9H/yT1r
X-Received: by 2002:a05:6214:5199:b0:89c:e7d8:9898 with SMTP id 6a1803df08f44-8a7041fd1dcmr215789656d6.39.1775481775366;
        Mon, 06 Apr 2026 06:22:55 -0700 (PDT)
X-Received: by 2002:a05:6214:5199:b0:89c:e7d8:9898 with SMTP id
 6a1803df08f44-8a7041fd1dcmr215788846d6.39.1775481774852; Mon, 06 Apr 2026
 06:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com> <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
 <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com> <20260405194851.GA3972481@killaraus.ideasonboard.com>
In-Reply-To: <20260405194851.GA3972481@killaraus.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:22:43 +0200
X-Gm-Features: AQROBzBQYhS1dscbWRRvRHyPv5Ub23UlECBtJFH6zANXF--27o0o9pYwJsejpLc
Message-ID: <CAFEp6-0ReobVALt573jmo5HEbFfDk_NYfJ0-0tDM+TW7+T3ZaA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, vladimir.zapolskiy@linaro.org,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dZqNHHXe c=1 sm=1 tr=0 ts=69d3b3b0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=GW7-DiasAAAA:20 a=P1BnusSwAAAA:8
 a=q3epTjbwirT8uiTGkjUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=zY0JdQc1-4EAyPf5TuXT:22 a=D0XLA9XvdZm18NrgonBM:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: u1qr0wTT2GpELZAG5ffnp8wU2zaZ4ydi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDEzMiBTYWx0ZWRfXzTjCRTVnim/f
 MiEBq6/Ge60Q6kImn5qcZ+YhQDfd3u+T0ZplvBiAv5dUO5Fjib8a5x6npFHaFTiZNrJm0IXF7R6
 YAapZ82HtqIrTZhjwMQySEYyBOtfDMjDwsTGzjIErRmZ7IIHOkG7EPDLdGQK9xFgcz30ZSmb968
 oqJvP8xzltthfXNKOpjp+DhddghbCv7Iy/zFZCywGv2unlcpIsZ/X9jtBxrdUvwJKOFCqqZoc2c
 O5T35O28qGPFfMX1uits8twYtxg6znwWH5emPR+VrmHyhCWizW1Xx47r/koQz/zkuOd+YjoM4dV
 sbmunkhKgD5+6Kr83k5Odfm6eZUW8hflP4XKr+1zyuc2V8kjHgdb5QIEdsG/vbey/YfCeMRJlSv
 Hjv4/qB9NIxp0FuJSY7IRmn491U1jpX0O7qwaZWlkJB5FdxFDIZgx1c690VHS02TV3b8Vwt93+6
 0qTsUMmBjLX9BJjqXgA==
X-Proofpoint-ORIG-GUID: u1qr0wTT2GpELZAG5ffnp8wU2zaZ4ydi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060132

Hi Laurent,

On Sun, Apr 5, 2026 at 9:48=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Mar 24, 2026 at 05:16:21PM +0100, Loic Poulain wrote:
> > On Tue, Mar 24, 2026 at 1:54=E2=80=AFPM Bryan O'Donoghue wrote:
> > > On 23/03/2026 12:58, Loic Poulain wrote:
> > > > This first version is intentionally minimalistic. It provides a wor=
king
> > > > configuration using a fixed set of static processing parameters, ma=
inly
> > > > to achieve correct and good-quality debayering.
> > >
> > > You need the other 50% of the kernel side - the generation of bayer
> > > statistics in the IFE, as well as generation of parameters to feed ba=
ck
> > > into the OPE - which requires a user-space implementation too, so a l=
ot
> > > of work there too.
> > >
> > > I'd also say when we have an ICP we should be using it via the HFI
> > > protocol, thus burying all of the IPE/OPE BPS and CDM complexity in t=
he
> > > firmware.
> > >
> > > Understood Agatti has no ICP so you're limited to direct OPE/IFE
> > > register access here. For HFI capable platforms - the majority - HFI =
is
> > > the way to go.
> >
> > Fully agree, this is exactly the point where we should sync and work
> > together on a proper solution.
>
> I don't necessarily agree with that. There are pros and cons for using
> HFI on platforms that have an ICP. If correctly written, a firmware can
> improve the throughput in multi-camera use cases by reprogramming the
> time-multiplexed OPE faster. On the other hand, in use cases that don't
> require pushing the platform to its limits, dealing with a closed-source
> firmware often causes lots of issues.

Yes, we need to further explore the ICP (MCU-based offload) solution
before drawing any conclusions, especially to assess how complex it is
to leverage or bypass. That said, the current platform (Agatti/OPE)
does not support it anyway.

> We should aim at supporting both direct ISP access and HFI with the same
> userspace API, even on a single platform. Which option to start with is
> an open question that we should discuss.
>
> > As a follow=E2=80=91up to this RFC, I already have several ongoing piec=
es that
> > aim to generalize the CAMSS ISP support, and I=E2=80=99d very much like=
 to
> > discuss them with you:
> >
> > - camss-isp-m2m: Generic M2M scheduling framework handling job dispatch
> > based on buffer readiness and enabled endpoints (frame input, output,
> > statistics, parameters).
>
> This should be generic, not limited to camss. v4l2-isp is a good
> candidate.
>
> > - camss-isp-pipeline: Helper layer to construct complex media/ISP graph=
s
> > from a structural description (endpoints, links, etc.).
>
> That also doesn't seem specific to camss.

Yes, architecturally this is not CAMSS=E2=80=91specific. However, the curre=
nt
implementation may rely on certain assumptions or shortcuts that do
not hold across all general offline ISP use cases. With some effort,
it should be possible to generalize them  [1] [2] .

[1] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-pipeline.c
[2] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-m2m.c

>
> > - camss-isp-params: Generic helper for handling ISP parameter buffers
> > (using v4l2-isp-params).
>
> I'm curious to know what camss-specific helpers you envision there.

Nothing too complex initially, just a parser built on the v4l2=E2=80=91isp
helpers, along with a few handler callbacks [3]. This is something
I=E2=80=99ll discuss with Bryan, as we definitely want to reuse the same
format and parser for both inline and offline ISPs (as well as for
stats).

[3] https://github.com/loicpoulain/linux/blob/camss-isp-dev/drivers/media/p=
latform/qcom/camss/camss-isp-params.c


>
> > - camss-isp-stats: Generic helper framework for CAMSS statistics device=
s.
>
> Same.
>
> > - camss-(isp-)ope: OPE=E2=80=91specific logic only (register configurat=
ion, IRQ
> > handling, parameter=E2=80=91to=E2=80=91register translation).
> >
> > This approach should significantly reduce the amount of
> > platform=E2=80=91specific code required for future ISP blocks. It shoul=
d also
> > allow you to integrate a camss-isp-hamoa (or similar) backend, or even
> > a camss-isp-hfi implementation for the M2M functions, without
> > duplicating the infrastructure.
> >
> > So yes, let=E2=80=99s sync and agree on a shared/open development model=
 and an
> > overall direction, possibly even a common tree, to ensure we stay
> > aligned and can collaborate effectively.
>
> Let's schedule a call to kickstart those discussions. Many people are on
> Easter vacation this week, next week could be a good candidate.
>
> > > I'll publish an RFC for Hamoa for that soonish so we can make sure bo=
th
> > > coexist.
