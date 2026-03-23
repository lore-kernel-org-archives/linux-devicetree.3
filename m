Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55913B47E4
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279917; cv=pass; b=RaIh30aLGMfL+EC4zfmvmhijbSHSCpecdxO60plNGw7YC9z4tYdS0cxExanQxIBptOp7Dc/3x03U5WUdVpaJFMjDbs6QT5ruh3GgD0viaMG6odz+J4pZ6RK0L9PgU7sFn9dmbDBKnHrSDIzDn+AG8/brOatipCSb9DBP97wp7Ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279917; c=relaxed/simple;
	bh=hA3vFGi0xhdHolQ7KYohzpQJLeGFeYhby3JWJQkk+8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTfYJd5VOSMcyQ6/e2/pobsJtlUfyYIE0yBhCvZiyOxfQyXYGTsGCWhEqElnPTT59JRvrxBbEV/Y1AOJugTUGzPCdoolyraXy2fQZv4MdM/jNaV1v8MFCk6qsOT/zdIpiDDBlcgduN4EO/Mae8qqVfbxpmInZtceLrL6YO3fmpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWMRkVy9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFR1Qk5H; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWMRkVy9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFR1Qk5H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGZY83589292
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zooEQK8t/2ouQC6EjzFMFIoTYfHyS+lgB7201z+qAFo=; b=PWMRkVy9FKnDbcGG
	UhJu3lRdkmzlkfUjxOBYRcNn4TkHR4r+b8X9lZjv5stnabdPq+ftpBX7pfQlxOAJ
	aYgvaFSvFLb50xCM6xIrl52XHPLXrBXu+GZCTk5K3ff78RydAYoRCPgkC3FN5akE
	RyFhoxXhSYBtS+jYEnfobCbk2NTCASe1xBs0Co/N0raiGlkakk+cij3bgqBT4B7r
	/eKpl/slj2ALQ3RHr8Vxf4MqtKFPLmqSwKHibhlo3Eno7mZr7leCKvGfYkcjGfG/
	2CG+MZNBIquXJec8MS3i6HuHyY/5gPfMf2sCYHuLIHCsBEDWrw4jLpLE2IEYnO6S
	n4gPig==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0g7eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:31:53 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67c7f139d4aso41341988eaf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 08:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774279913; cv=none;
        d=google.com; s=arc-20240605;
        b=IyuxC9E4b7bZKvD2ol5R+jBmbWhXNOsT+nXi6dMyLq4bzIbkUxCDYLxhuWzZv7P/Pm
         dKfZnW+pBr1e+l7KRJYMQkUZna3qRhv45lmVNCb/ga22GEvlfybbGh4gw8l4nrSqEYya
         6RY0/Qx6sOyO5nAI1TCQb5mYKqqBSwl4WktETerWR/K9D436k52qX+L/luP9m+spwftV
         EwYcknViVLLxCv14f5bLqk4CbI2RINrzqpPO+9F7XJVi2irc7W+1XQ1oAjfTZsSjilLt
         9+k6oplCowVSWUZSaRnkW4LRAqv1V23vemsqrKxgzfBTSTiy4HUiT4DKOQNSn7Le+Uyg
         sIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zooEQK8t/2ouQC6EjzFMFIoTYfHyS+lgB7201z+qAFo=;
        fh=W1DawiOCEwvb6puFAtpvdpMicDgkxds0YNMR/uipoRc=;
        b=cwW59EtY/+63NdlMFdKfSjkVt3nyyrWEm/3WBaFtewnE6If9YZtc473e5fgOJhTUl4
         Gfr7I3yuCiqlOZCc6QrhC2XSEifPa59gvHTvYOC8K7/PVb7+nXO2CFa+ZD0XxWoJoEC/
         chWRWEAQVhZXe9n22Gfb/+neDXnlkdMbxsQnSv7GNBJZgewW3t4jAxLklqDf5TjHrvYO
         GHaYvhiRC3UUE6DXGihkXzejVMFiwBiNZcWBVmPM9Gk7UAdZOQjPx9D65/Fxx2W1ECFo
         B6/DP5Sk/BTGXQ7P5Jdeg0tj0l6h/vhy0lID9DTpNCmsMCbZIWJejR9TjrizGaxbo1Vt
         iWsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279913; x=1774884713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zooEQK8t/2ouQC6EjzFMFIoTYfHyS+lgB7201z+qAFo=;
        b=MFR1Qk5HS0zhLPGH+Sh16TWHmGL06yvKlVNjyp7BQ76O4A3TLAPDcOp5JeGt2xSmmZ
         Elxm0m6KDhYlVe8Mq4WeDTPkknLeO4tVqBo7aeUVWwjP7ahNmGdKloSuDz4+FOILs46P
         RZ+14VrzVfzLydGPkT4p7Xamt2eynHs7E1mt19F1zE+OFx9bi+sPhQxR+INugsHd3OpP
         vG86Y1w7I3VMdZ4/5MbJocNQpWmV76ocFfaz2n6oDCKVHHB4iIMQlCKQopcccobgmHV8
         hYHRYxNrYWWwjV57BU7czYAd9Q7zPiN0gXwX9hFGecuFLCYpGZErYpxv+QaW7vB6MIPU
         6joQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279913; x=1774884713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zooEQK8t/2ouQC6EjzFMFIoTYfHyS+lgB7201z+qAFo=;
        b=KAOLh8HEqiS/5VBxJ+LyRt8PJycLZ+xXeLGN51UrHWCsru6YjDE6VqHD3Gx4+n7DXI
         ZDGPwCrqPT3MD/mwIdQriKKukR6EuyIcfBvwGqEr2QszmsJBJuTzHYS8u5h6Gv0HSFaI
         t5ib87evdL7AjUNu6ljrH++DbzvGQ78eIvLD0n5iDTMB0+NlNGO5rhG0UoD+5iiHvv6b
         KhpE2pr+g+OQK5Mgw15WpnJgeOhOM53G7UTwOV2h0WnCjH/uC2vr7kmdlzzlmJe6VAlI
         EMgFz3gKXJcDGn+lQk3EfYipsp2UpfGJM4Zwt0ONabP1x2qb+jjxUY6D1CYWRdUp26Yj
         KC9g==
X-Forwarded-Encrypted: i=1; AJvYcCUImUWX3fcgoCFOSKxr1ewrNEXsvNEdBqJKPCCtQum78oMNT+3sGnX91desv0M0wIWP+z+2E+9UJw/q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyco8WtsTszlmAhC9KXcpSwQdTfMM0S5KoenqXLnuqfINa5J83D
	olPA4EcDupQWixqjnnnSymY9btpS8tX9TcZS6kSyK2DqWC5tQWGvrWSww2dVVVMRB/zYZBD1f5E
	lrmeNrIxs4JMgQYyBGAhH87aW3J4KNNVDI4eHwUhNVdBBqCeMBSxJ0hIx+nfRXzpg8GjWdSfs9R
	062+b/Zy4+hD5aAv4ogl47PvE72MSsHn6qo4fJChQ=
X-Gm-Gg: ATEYQzwTCiVdFmIS+xG3BsTFOiS/9BCXnOUJFgpfeNYXXMfo9E9xV2uv47utEDKUuXm
	eLGrA0gGwkK7owa/BIL2NSHhY+C1TPj4d4XMWHQC2Ew0v3akVx0t+Ufbo5zOCwcpeq++M7xh8RS
	EKZ0ItnlTyiYegfsxVPeVd8TZDelfGzs+xTXv5fQ0r2Y0D8z6uKi6Y5oa6yRhWkX74ouD1QE/AV
	07yCn4CFTbgwmAV4SpMV+RODZURPIPYcUaVBaw=
X-Received: by 2002:a05:6820:982:b0:67d:e6fa:4461 with SMTP id 006d021491bc7-67de6fa4742mr4279318eaf.0.1774279913005;
        Mon, 23 Mar 2026 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:6820:982:b0:67d:e6fa:4461 with SMTP id
 006d021491bc7-67de6fa4742mr4279284eaf.0.1774279912472; Mon, 23 Mar 2026
 08:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com> <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
In-Reply-To: <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:31:41 +0100
X-Gm-Features: AaiRm53xzoHHwgMOWwk6NTn-iPorq4CFeRRF7Y74-Fb_mjblKqErrqYsG34Xjy0
Message-ID: <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c15ce9 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y-P54spXN9flPJXOXx8A:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMCBTYWx0ZWRfX1YmrCBP0QlTy
 PVXdHl1zOA8BYX+zehqi8MfYymEzwyA4IZu5D8jV5XGz8nEvFoj99jItnHqlWG/rezc8z/gDoJf
 HzA+qeW1xiyjzIqrAJnkPw/MaF0IiTd6TK3BwZex2Hgv25Elw8JIuLMx52vnd2V5kh6VjcobKVy
 lLmEKMrobvawg+E9oGjKI5a4pP55bI2jkX/0ZczsK98og6HogMVKPoWzIsWxAqQLKjMiazcMRmL
 95lROs2I1nvdAy/hl8US2+znsB7E6KL56NS23e9s8Ui4Z2Yvxm4W1WiQTmaCHvgcs5F4vaw3x9U
 R0SnhA/QU+Axp2hC4uuAN/jmV4YCGTlyUi+Yd/QzcJHvfzuu8IFfxOgsZVCpFV8b6Hsk//YLLEK
 d68gjO00ckjHevfoS7AqZ2w/Nl86O0cwViP6SubtBqm+6wrSq0ZJycbLkEhM1x8P8aVSrhDTF5g
 koBB8Yga5JsXS45MQ5Q==
X-Proofpoint-GUID: QCT1j2gemaCxfur0s-_l5yduojOcc86V
X-Proofpoint-ORIG-GUID: QCT1j2gemaCxfur0s-_l5yduojOcc86V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230120

Hi Bryan,

On Mon, Mar 23, 2026 at 2:43=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 23/03/2026 12:58, Loic Poulain wrote:
> > Provide a initial implementation for the Qualcomm Offline Processing
> > Engine (OPE). OPE is a memory-to-memory hardware block designed for
> > image processing on a source frame. Typically, the input frame
> > originates from the SoC CSI capture path, though not limited to.
> >
> > The hardware architecture consists of Fetch Engines and Write Engines,
> > connected through intermediate pipeline modules:
> >     [FETCH ENGINES] =3D> [Pipeline Modules] =3D> [WRITE ENGINES]
> >
> > Current Configuration:
> >      Fetch Engine: One fetch engine is used for Bayer frame input.
> >      Write Engines: Two display write engines for Y and UV planes outpu=
t.
> >
> > Enabled Pipeline Modules:
> >     CLC_WB: White balance (channel gain configuration)
> >     CLC_DEMO: Demosaic (Bayer to RGB conversion)
> >     CLC_CHROMA_ENHAN: RGB to YUV conversion
> >     CLC_DOWNSCALE*: Downscaling for UV and Y planes
> >
> > Default configuration values are based on public standards such as BT.6=
01.
> >
> > Processing Model:
> > OPE processes frames in stripes of up to 336 pixels. Therefore, frames =
must
> > be split into stripes for processing. Each stripe is configured after t=
he
> > previous one has been acquired (double buffered registers). To minimize
> > inter-stripe latency, stripe configurations are generated ahead of time=
.
>
> A yavata command set showing usage would be appreciated.

AFAIK, yavta does not (yet) support M2M devices, but I can probably
use an other tool.

>
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/Makefile    |    4 +
> >   drivers/media/platform/qcom/camss/camss-ope.c | 2058 ++++++++++++++++=
+
> >   2 files changed, 2062 insertions(+)
> >   create mode 100644 drivers/media/platform/qcom/camss/camss-ope.c
> >
> > diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media=
/platform/qcom/camss/Makefile
> > index 5e349b491513..67f261ae0855 100644
> > --- a/drivers/media/platform/qcom/camss/Makefile
> > +++ b/drivers/media/platform/qcom/camss/Makefile
> > @@ -29,3 +29,7 @@ qcom-camss-objs +=3D \
> >               camss-format.o \
> >
> >   obj-$(CONFIG_VIDEO_QCOM_CAMSS) +=3D qcom-camss.o
> > +
> > +qcom-camss-ope-objs +=3D camss-ope.o
> > +
> > +obj-$(CONFIG_VIDEO_QCOM_CAMSS) +=3D qcom-camss-ope.o
>
> Needs a Kconfig entry.

ack.

> > +
> > +#define OPE_RESET_TIMEOUT_MS 100
> > +
> > +/* Expected framerate for power scaling */
> > +#define DEFAULT_FRAMERATE 60
> > +
> > +/* Downscaler helpers */
> > +#define Q21(v) (((uint64_t)(v)) << 21)
> > +#define DS_Q21(n, d) ((uint32_t)(((uint64_t)(n) << 21) / (d)))
>
> u64 and u32 here.

ok.

> > +
> > +static inline char *print_fourcc(u32 fmt)
> > +{
> > +     static char code[5];
> > +
> > +     code[0] =3D (unsigned char)(fmt & 0xff);
> > +     code[1] =3D (unsigned char)((fmt >> 8) & 0xff);
> > +     code[2] =3D (unsigned char)((fmt >> 16) & 0xff);
> > +     code[3] =3D (unsigned char)((fmt >> 24) & 0xff);
> > +     code[4] =3D '\0';
> > +
> > +     return code;
> > +}
>
> This is a bug

Indeed, I will use %p4cc as you recommended in a similar series.

> > +
> > +static void ope_prog_bayer2rgb(struct ope_dev *ope)
> > +{
> > +     /* Fixed Settings */
> > +     ope_write_pp(ope, 0x860, 0x4001);
> > +     ope_write_pp(ope, 0x868, 128);
> > +     ope_write_pp(ope, 0x86c, 128 << 20);
> > +     ope_write_pp(ope, 0x870, 102);
>
> What are the magic numbers about ? Please define bit-fields and offsets.

There are some registers I can't disclose today, which have to be
configured with working values,
Similarly to some sensor configuration in media/i2c.

> Parameters passed in from user-space/libcamera and then translated to
> registers etc.

The above fixed settings will not be part of the initial parameters.

>
> > +}
> > +
> > +static void ope_prog_wb(struct ope_dev *ope)
> > +{
> > +     /* Default white balance config */
> > +     u32 g_gain =3D OPE_WB(1, 1);
> > +     u32 b_gain =3D OPE_WB(3, 2);
> > +     u32 r_gain =3D OPE_WB(3, 2);
> > +
> > +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(0), g_gain);
> > +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(1), b_gain);
> > +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_WB_CFG(2), r_gain);
> > +
> > +     ope_write_pp(ope, OPE_PP_CLC_WB_GAIN_MODULE_CFG, OPE_PP_CLC_WB_GA=
IN_MODULE_CFG_EN);
> > +}
>
> Fixed gains will have to come from real data.

These gains will indeed need to be configurable, most likely via ISP
parameters, here, they have been adjusted based on colorbar test
pattern from imx219 sensors but also tested with real capture.

>
> > +
> > +static void ope_prog_stripe(struct ope_ctx *ctx, struct ope_stripe *st=
ripe)
> > +{
> > +     struct ope_dev *ope =3D ctx->ope;
> > +     int i;
> > +
> > +     dev_dbg(ope->dev, "Context %p - Programming S%u\n", ctx, ope_stri=
pe_index(ctx, stripe));
> > +
> > +     /* Fetch Engine */
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0, stripe->src.f=
ormat);
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE,
> > +                  (stripe->src.width << 16) + stripe->src.height);
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_ADDR_IMAGE, stripe->src.add=
r);
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_RD_STRIDE, stripe->src.stri=
de);
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CCIF_META_DATA,
> > +                  FIELD_PREP(OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN, =
stripe->src.pattern));
> > +     ope_write_rd(ope, OPE_BUS_RD_CLIENT_0_CORE_CFG, OPE_BUS_RD_CLIENT=
_0_CORE_CFG_EN);
> > +
> > +     /* Write Engines */
> > +     for (i =3D 0; i < OPE_WR_CLIENT_MAX; i++) {
> > +             if (!stripe->dst[i].enabled) {
> > +                     ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i), 0);
> > +                     continue;
> > +             }
> > +
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_ADDR_IMAGE(i), stripe=
->dst[i].addr);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_0(i),
> > +                          (stripe->dst[i].height << 16) + stripe->dst[=
i].width);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_1(i), strip=
e->dst[i].x_init);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_IMAGE_CFG_2(i), strip=
e->dst[i].stride);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_PACKER_CFG(i), stripe=
->dst[i].format);
> > +             ope_write_wr(ope, OPE_BUS_WR_CLIENT_CFG(i),
> > +                          OPE_BUS_WR_CLIENT_CFG_EN + OPE_BUS_WR_CLIENT=
_CFG_AUTORECOVER);
> > +     }
> > +
> > +     /* Downscalers */
> > +     for (i =3D 0; i < OPE_DS_MAX; i++) {
> > +             struct ope_dsc_config *dsc =3D &stripe->dsc[i];
> > +             u32 base =3D ope_ds_base[i];
> > +             u32 cfg =3D 0;
> > +
> > +             if (dsc->input_width !=3D dsc->output_width) {
> > +                     dsc->phase_step_h |=3D DS_RESOLUTION(dsc->input_w=
idth,
> > +                                                        dsc->output_wi=
dth) << 30;
> > +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_H_SCALE_E=
N;
> > +             }
> > +
> > +             if (dsc->input_height !=3D dsc->output_height) {
> > +                     dsc->phase_step_v |=3D DS_RESOLUTION(dsc->input_h=
eight,
> > +                                                        dsc->output_he=
ight) << 30;
> > +                     cfg |=3D OPE_PP_CLC_DOWNSCALE_MN_DS_CFG_V_SCALE_E=
N;
> > +             }
> > +
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_CFG(base), c=
fg);
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_IMAGE_SIZE_C=
FG(base),
> > +                          ((dsc->input_width - 1) << 16) + dsc->input_=
height - 1);
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_H_CFG(bas=
e), dsc->phase_step_h);
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_DS_MN_V_CFG(bas=
e), dsc->phase_step_v);
> > +             ope_write_pp(ope, OPE_PP_CLC_DOWNSCALE_MN_CFG(base),
> > +                          cfg ? OPE_PP_CLC_DOWNSCALE_MN_CFG_EN : 0);
> > +     }
> > +}
>
> So - this is where the CDM should be used - so that you don't have to do
> all of these MMIO writes inside of your ISR.

Indeed, and that also the reason stripes are computed ahead of time,
so that they can be further 'queued' in a CDM.

>
> Is that and additional step after the RFC ?

The current implementation (without CDM) already provides good results
and performance, so CDM can be viewed as a future enhancement.
As far as I understand, CDM could also be implemented in a generic way
within CAMSS, since other CAMSS blocks make use of CDM as well.
This is something we should discuss further.

>
> > +
> > +/*
> > + * mem2mem callbacks
> > + */
> > +static void ope_device_run(void *priv)
> > +{
> > +     struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +     struct ope_ctx *ctx =3D priv;
> > +     struct ope_dev *ope =3D ctx->ope;
> > +     dma_addr_t src, dst;
> > +
> > +     dev_dbg(ope->dev, "Start context %p", ctx);
> > +
> > +     src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > +     if (!src_buf)
> > +             return;
> > +
> > +     dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > +     if (!dst_buf)
> > +             return;
> > +
> > +     src =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> > +     dst =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> > +
> > +     /* Generate stripes from full frame */
> > +     ope_gen_stripes(ctx, src, dst);
> > +
> > +     if (priv !=3D ope->context) {
> > +             /* If context changed, reprogram the submodules */
> > +             ope_prog_wb(ope);
> > +             ope_prog_bayer2rgb(ope);
> > +             ope_prog_rgb2yuv(ope);
> > +             ope->context =3D priv;
> > +     }
> > +
> > +     /* Program the first stripe */
> > +     ope_prog_stripe(ctx, &ctx->stripe[0]);
> > +
> > +     /* Go! */
> > +     ope_start(ope);
> > +}
> > +
> > +static void ope_job_done(struct ope_ctx *ctx, enum vb2_buffer_state vb=
state)
> > +{
> > +     struct vb2_v4l2_buffer *src, *dst;
> > +
> > +     if (!ctx)
> > +             return;
> > +
> > +     src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> > +     dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> > +
> > +     if (dst && src)
> > +             dst->vb2_buf.timestamp =3D src->vb2_buf.timestamp;
> > +
> > +     if (src)
> > +             v4l2_m2m_buf_done(src, vbstate);
> > +     if (dst)
> > +             v4l2_m2m_buf_done(dst, vbstate);
> > +
> > +     v4l2_m2m_job_finish(ctx->ope->m2m_dev, ctx->fh.m2m_ctx);
> > +}
> > +
> > +static void ope_buf_done(struct ope_ctx *ctx)
> > +{
> > +     struct ope_stripe *stripe =3D ope_current_stripe(ctx);
> > +
> > +     if (!ctx)
> > +             return;
> > +
> > +     dev_dbg(ctx->ope->dev, "Context %p Stripe %u done\n",
> > +             ctx,  ope_stripe_index(ctx, stripe));
> > +
> > +     if (ope_stripe_is_last(stripe)) {
> > +             ctx->current_stripe =3D 0;
> > +             ope_job_done(ctx, VB2_BUF_STATE_DONE);
> > +     } else {
> > +             ctx->current_stripe++;
> > +             ope_start(ctx->ope);
> > +     }
> > +}
> > +
> > +static void ope_job_abort(void *priv)
> > +{
> > +     struct ope_ctx *ctx =3D priv;
> > +
> > +     /* reset to abort */
> > +     ope_write(ctx->ope, OPE_TOP_RESET_CMD, OPE_TOP_RESET_CMD_SW);
> > +}
>
> Shoudln't this wait for ope_job_done() ?

No, according to v4l2-mem2mem.h:
Informs the driver that it has to abort the currently
running transaction as soon as possible
[...]
This function does not have to (and will usually not) wait
until the device enters a state when it can be stopped.

> > +static irqreturn_t ope_irq(int irq, void *dev_id)
> > +{
> > +     struct ope_dev *ope =3D dev_id;
> > +     struct ope_ctx *ctx =3D ope->m2m_dev ? v4l2_m2m_get_curr_priv(ope=
->m2m_dev) : NULL;
>
> You have a mutex for this pointer but it doesn't seem to be in-use here
>
> Should this be a threadded IRQ with reference to that mutex then ?

We currently rely on the mem2mem framework to manage context
concurrency, and in particular to ensure that a context cannot be
released while an ope_job_done callback is still pending. This avoids
blocking on the global OPE mutex, which may be held for unrelated
operations such as creating another context.
However, there may still be unsafe paths, so an additional per-context
lock might be worth introducing.

> > +static int ope_enum_frameintervals(struct file *file, void *fh,
> > +                                struct v4l2_frmivalenum *fival)
> > +{
> > +     fival->type =3D V4L2_FRMIVAL_TYPE_STEPWISE;
> > +     fival->stepwise.min.numerator =3D 1;
> > +     fival->stepwise.min.denominator =3D 120;
> > +     fival->stepwise.max.numerator =3D 1;
> > +     fival->stepwise.max.denominator =3D 1;
> > +     fival->stepwise.step.numerator =3D 1;
> > +     fival->stepwise.step.denominator =3D 1;
>
> fival->index should return -EINVAL for index > 0
>
> should also valid width and height and pixel format

Thanks, I will add that.

>
> > +     return 0;
> > +}
> > +
> > +static int ope_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     return -EINVAL;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ope_ctrl_ops =3D {
> > +     .s_ctrl =3D ope_s_ctrl,
> > +};
>
> Eh - I think you can drop this ..

Indeed.

>
[...]
