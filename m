Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F53126DF
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123533; cv=pass; b=TnvSTqVYFF+aKC0ytd0qT7sqjiWyWk0pc9ISk5o1LZGYvBWKjtiob05vgjvRtY6n60eqg4WiLBEIjzhAl4yXTIKnVbvueJdp0u2yJqlBRrP0weDMMQ10sdTsAXJaFlMdingQnR81TyHdF8pkYYe4eRapKrD6XwmlSYrgmaCxF1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123533; c=relaxed/simple;
	bh=YYg5eiB94mB3VISmVnhcr2eYct6Z9MxOLR3m1ctoO2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijKsluLGTzvJX1YZZEretGGYB3GJETHsFldBgvnybJWHuXtcEvDiQ/Ru2Bo/ygrMBeQd2guSPZXlXtmXCe+E4Maq/GoGs7Q5uMisVeBLlYeYrDRIBeIflnP91GBUoFkLwCLUC2RVEzLnKIjoaqJuiQws4siXf7gLLM3EfjRacp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UobDZ0hY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwMpd0pb; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UobDZ0hY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwMpd0pb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcdDd3479987
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRDnaHbZxLgU003Z7di3xnBpvLkFBoiwrEvgYu4LvWQ=; b=UobDZ0hYC0oTT8v1
	MqjYt1jw6xsTciUAAAuOOHl1CBaIZYNhWApPcIG3ClKjp5CBU71mxUfBXsppzugk
	TI/wcFQUej4R9PlqN4gJJkHvSrdsL9ZcXkuTDUb6OdrJR70CeW3+Av4SlkzglWj8
	cU/V7HKPLIUtO9qqhL9Lm7F52wczok4g1Wmwo99xXwRq7yK6TdyJOl9I8DO8GEg/
	WNb1EtT/cpg4JTVMWle2IgkUrnXgALf+hQvAt5SGDwK8IvEXbynPD9ehgp8zA5Q8
	LxnISjaS2kthG75MG/dMIQVdmKui+IyAUOTeKCFU6Ff5sqW0jJgAs186cxwc7gMT
	D7O6GQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h9m84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:52:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ea75996387so137257186d6.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784123530; cv=none;
        d=google.com; s=arc-20260327;
        b=oKDxbL7e90NvAReQjwCc6Tlu910KtecgYSxrkngg+0H2yxEJAOEX0CqbWUCMbOHGC8
         OTS6ya+V4f/cmd8YgY/pUctRgs+T317jXBWN3AFRDxiOtq3i4co5yqHBUbs8JqzMBSlu
         0NyYT0Jl/G0NhjXpQgfaSV0EggMmCPoC8JTscRd4eamwPLVBF5ZWTzeJVU6s1BU1eWvq
         YiUIwIQTZgyZDO82nFiDq14mWbYvbLJFywMTrZM7QV+5caiWcVh0bS4PeL7dnh+nAIYf
         dAV/jL0cZbjcry4NVWqTsrlnN8HEVULiehqHuQK3JyqMsBK0ubDw+N2Y5nKfitxO1e8i
         NugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRDnaHbZxLgU003Z7di3xnBpvLkFBoiwrEvgYu4LvWQ=;
        fh=jx+uL5MnEhFMHwLGPisJBiR8jPUGYgqN2qVeyZj6hUM=;
        b=LiZJXlUGQU2wRH9F2TDVxYUdqifpqoakOETHfef7ya01+W19HqYJ0CxUinHjb/a95v
         vNL3d7L5BEOxp6AyTX+Vwd58eS2UQp92kMEqzZ1LqmtN+7AxG1HgFcrBnwI3MMMfoEzN
         A/T6GDainUBZVgSWwW1wP5dYPkxWOVL+CNYnPV4BYrLlEgVuw3KZnj129uVn+gxXKdKY
         YopPYA78a1wW2ATpuDvyEsoGm4+BlC3lgnPbTFpqL0B2xhhKbXge1jw0XQozF3HY8i/e
         bbfr5UtlavZAR0foU2z+RP8SyC+WAgmlbQ1FFwLrnL5wrvExb2Kze+chT/zfK6f7BjgT
         Bg2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123530; x=1784728330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRDnaHbZxLgU003Z7di3xnBpvLkFBoiwrEvgYu4LvWQ=;
        b=VwMpd0pbigmF+4b0DLg/NFJvRRCUSfQFIYYQCa+IpM4eK3AU6MHgaPy/daLMPe6/3k
         Y+IQ0saF1Pfs/gBB2ZnogkUSBma3E6coXPlov5D6kViU+JcnkMxzpvGKcP53N9LjVBYn
         i9BQ2d8pPM4XisZDrGPDFUVGIFTVABHp1wTRBld9SwU2jAqgRT4c4KSIZzpQ6Fe2iSxf
         aqdndlMWEI5WopHGr3Tk7c2ePI3255jlB+1RbaHjvvddw0PDA3YaumfvVdgTnsFgJ98b
         9LkVK+7JgsMfOfur6e+x5fB7Ws8Ug/XWToDYdZFVfFw7ZKRDcUZuzbWieM0AmA/NFTSw
         uF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123530; x=1784728330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRDnaHbZxLgU003Z7di3xnBpvLkFBoiwrEvgYu4LvWQ=;
        b=q458uQYIGbDgAajKtWXfIgZt5E3AXOvVmjmHf5aCjI8uSkqYlNpApB3YOUWLk9kX17
         xiS6jMQF4LUW8JUtMoO26ZOv03Tf/tK7ChHsEqocNaOqQrWHidFYBu1y8XMHnx4QVsgK
         3nOfusaZ9vZVajdhwuFeBjziI57GPSt5rJORGZXoyMHcGXJs15WrBs6SkFRKe14mt5qE
         24CibHDFOpGFDjDbvtVCnO101fuTkyHpKD1mhu6y44rqKJPadCaK7LTD03baf8N00hyi
         6Zt56LI/a0miOyj94RxjU/UAlpeFJyqt0fLBoPPvZyozm8rmVB0owR1tYhO6PMtapPWg
         uQBA==
X-Forwarded-Encrypted: i=1; AHgh+RqnTGAVYu5+n8ZRMzTrr42ooyRw7xZ5qNYwg8eGtrwvFpZUUFgG5mcccfs3v40g9I1VGu7pyZkQwaPN@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLmeVU5Tw3F/PPK8BHDriKI9BnPXf5IU4EWaCVRtQUbgKcFO3
	yulRyX6tVEA/x6XSyrRzNCwP48nKLKjUoshvofF55wmppXb/nnxncoc4bx38oCjI/BbX5yXfmNI
	HT5euQ1qe7pdjl380yg4e0L7N1ycLg8U0Ivs4Ue0tFLqwDENpd0NCtvMRPdEUjj/iCQ5evQ2Qhx
	46wpHUTsdGD9rDef2uc7iinGauwhicDEpo80Dfpl0=
X-Gm-Gg: AfdE7cnQ7XcH7NlWDsj/+fO3gHgLZQ3A+sdLQKq3x3h7IA+tKBv6/k0h18n3rQqNeyu
	aMDWdHBHg7W/YQ6kwna7WT9ZGPkTKyDz2RNTPtS8iujbPNOs2VacT6QWa33IPzBg9K98MzKcZPJ
	1rAs96yst+nne9izT9biWnxTSRMHR/vMrK2JP4Gklj+RjnkJPqR/n/Es2rszSnYdQY9wOK0tbAi
	ylsT/M2j2grjBaUx17IqfcVE8sRrg8gGHNEjMZ0utpOneIZO5C4iSOHhMWEkVsslohF5Vso91XB
	iAzBy/Y1j6k=
X-Received: by 2002:a05:6214:5712:b0:8db:dd:4d85 with SMTP id 6a1803df08f44-90758d34f11mr30929556d6.26.1784123529610;
        Wed, 15 Jul 2026 06:52:09 -0700 (PDT)
X-Received: by 2002:a05:6214:5712:b0:8db:dd:4d85 with SMTP id
 6a1803df08f44-90758d34f11mr30928866d6.26.1784123528967; Wed, 15 Jul 2026
 06:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-6-51207a0319d8@oss.qualcomm.com> <da70ed94-fd76-4105-8071-1ed8d8e41d84@linaro.org>
In-Reply-To: <da70ed94-fd76-4105-8071-1ed8d8e41d84@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:51:57 +0200
X-Gm-Features: AUfX_mw9FYNoF0_hfoG8VGZ5UTEorPD_jR7frbEunNBfVR6iyQH02jj9VbYksmQ
Message-ID: <CAFEp6-2nTWjU0VrMQ8D8nDzH9P-vbA1gFPimv8aX+qREWHPNow@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNyBTYWx0ZWRfXyNwgWE1KAEFv
 hxSZGTQAkFf/x8kQb12ot+p4eqWNZsu4uxVXlxJmRSRDkJvs16RJMOaFICDBFhtgi7MYPt5wy/X
 ZIQKsMUPEX1srnw0bDbz4yAFywd6ktI=
X-Proofpoint-ORIG-GUID: OlSKJtpHqYDcKAzIMterD06YxnJLR0ER
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNyBTYWx0ZWRfX5VwUpqJjmulr
 F8ir6VYFCCOkDxoFlI50SGtTKjHFit1TtFlkFcrtHCLPW/IMMQOcZs3K5BrOwdLcoeNfKud7Acq
 6rDypV3S/pdIt30c4u/h06t47aGHd5KJUfPFsWEmZ0QjITzbPEMVyRh+4uZFzlLrJJAJ/SglLcq
 DO6ssnSb3wD6BmxCZbyEolxqZm40Gy4ZvmE59q6mW1xO77QKslEjuSWJU2ziTBuPwgzKh2sVW97
 EYFRJP/gHsvCdxHTQ24yURkqfaRfKXjpIjLVmwNo+V6e9F6YqgZu88wtt88dspqCtAdf8JtCSSa
 3ed6rDPkFaeJ+qk+fBCuMeV/zGGl9jBrZZdh0t1WDUT+UQvxkHZB9rtT93aZjjoFE6ZF52aVoir
 ZUwd25Qh8g/8IEE8StD/tO5NXw4V9ouoKt0MPvkYXAmB3y+l8pVj1/Y2lMj75uJ/kiJryPWzEY1
 NGNQ/eOH4+8HI6GHSkw==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a57908a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=5oiKfTUM-gNaU-HVeUYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OlSKJtpHqYDcKAzIMterD06YxnJLR0ER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150137

On Mon, Jul 13, 2026 at 3:05=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/07/2026 10:04, Loic Poulain wrote:
> > Add an image processing driver for the Qualcomm Offline Processing Engi=
ne
> > (OPE). OPE is a memory-to-memory ISP block that converts raw Bayer
> > frames to YUV, performing white balance, demosaic, chroma enhancement,
> > color correction and downscaling.
> >
> > The hardware architecture consists of Fetch Engines and Write Engines,
> > connected through intermediate pipeline modules for pix processing.
> >
> > The driver exposes three video nodes per pipeline instance:
> >    - ope_input: Bayer RAW input (V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> >    - ope_disp_output: YUV output     (V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLAN=
E)
> >    - ope_params: ISP parameters (V4L2_BUF_TYPE_META_OUTPUT)
> >
> > Hardware features:
> >    - Stripe-based processing (up to 336 pixels wide per stripe)
> >    - White balance (CLC_WB)
> >    - Demosaic / Bayer-to-RGB (CLC_DEMO)
> >    - RGB-to-YUV conversion (CLC_CHROMA_ENHAN)
> >    - Color correction matrix (CLC_CC)
> >    - MN downscaler for chroma and luma planes
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
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Co-developed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/Kconfig     |   18 +
> >   drivers/media/platform/qcom/camss/Makefile    |    4 +
> >   drivers/media/platform/qcom/camss/camss-ope.c | 3245 ++++++++++++++++=
+++++++++
>
> I think this should be in a sub-directory.

You mean a OPE specific directory or a kind of offline engine generic one l=
ike:
drivers/media/platform/qcom/camss/offline/ope.c ?

>
> >   3 files changed, 3267 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/=
platform/qcom/camss/Kconfig
> > index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..895fc57a679655fcb6f308b=
e1565dc6b77bbbd67 100644
> > --- a/drivers/media/platform/qcom/camss/Kconfig
> > +++ b/drivers/media/platform/qcom/camss/Kconfig
> > @@ -7,3 +7,21 @@ config VIDEO_QCOM_CAMSS
> >       select VIDEO_V4L2_SUBDEV_API
> >       select VIDEOBUF2_DMA_SG
> >       select V4L2_FWNODE
> > +
> > +config VIDEO_QCOM_CAMSS_OPE
> > +     tristate "Qualcomm Offline Processing Engine (OPE) driver"
> > +     depends on VIDEO_QCOM_CAMSS
> > +     depends on V4L_PLATFORM_DRIVERS
> > +     depends on VIDEO_DEV
> > +     depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> > +     select V4L2_ISP
> > +     select VIDEOBUF2_DMA_CONTIG
> > +     select VIDEOBUF2_VMALLOC
> > +     help
> > +       Enable support for the Qualcomm Offline Processing Engine (OPE)=
.
> > +       OPE is a memory-to-memory ISP block that converts raw Bayer fra=
mes
> > +       to YUV, performing white balance, demosaic, chroma enhancement =
and
> > +       downscaling. Found on QCM2290 and related SoCs.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called qcom-camss-ope.
> > diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media=
/platform/qcom/camss/Makefile
> > index 5678621efb6780b67a043ec8a2e914cce02d9b98..422eebc0a86301de3f39c74=
3fbc06c437b17ac9a 100644
> > --- a/drivers/media/platform/qcom/camss/Makefile
> > +++ b/drivers/media/platform/qcom/camss/Makefile
> > @@ -31,3 +31,7 @@ qcom-camss-objs +=3D \
> >               camss-params.o \
> >
> >   obj-$(CONFIG_VIDEO_QCOM_CAMSS) +=3D qcom-camss.o
> > +
> > +qcom-camss-ope-objs :=3D camss-ope.o
> > +
> > +obj-$(CONFIG_VIDEO_QCOM_CAMSS_OPE) +=3D qcom-camss-ope.o
> > diff --git a/drivers/media/platform/qcom/camss/camss-ope.c b/drivers/me=
dia/platform/qcom/camss/camss-ope.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..2c0d68cf1a637c998ebe4d3=
afb1fa6dbdb68f029
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-ope.c
> > @@ -0,0 +1,3245 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * camss-ope.c
> > + *
> > + * Qualcomm MSM Camera Subsystem - Offline Processing Engine
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/*
> > + * This driver provides driver implementation for the Qualcomm Offline
> > + * Processing Engine (OPE). OPE is a memory-to-memory hardware block
> > + * designed for image processing on a source frame. Typically, the inp=
ut
> > + * frame originates from the SoC CSI capture path, though not limited =
to.
> > + *
> > + * The hardware architecture consists of Fetch Engines and Write Engin=
es,
> > + * connected through intermediate pipeline modules:
> > + *   [FETCH ENGINES] =3D> [Pipeline Modules] =3D> [WRITE ENGINES]
> > + *
> > + * Current Configuration:
> > + *     Fetch Engine: One fetch engine is used for Bayer frame input.
> > + *     Write Engines: Two display write engines for Y and UV planes ou=
tput.
> > + *
> > + * Only a subset of the pipeline modules are enabled:
> > + *   CLC_WB: White balance for channel gain configuration
> > + *   CLC_DEMO: Demosaic for Bayer to RGB conversion
> > + *   CLC_CC: Color Correct, coefficient based RGB correction
> > + *   CLC_CHROMA_ENHAN: for RGB to YUV conversion
> > + *   CLC_DOWNSCALE*: Downscaling for UV (YUV444 -> YUV422/YUV420) and =
YUV planes
> > + *
> > + * Default configuration values are based on public standards such as =
BT.601.
> > + *
> > + * Processing Model:
> > + * OPE processes frames in stripes of up to 336 pixels. Therefore, fra=
mes must
> > + * be split into stripes for processing. Each stripe is configured aft=
er the
> > + * previous one has been acquired (double buffered registers). To mini=
mize
> > + * inter-stripe latency, the stripe configurations are generated ahead=
 of time.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/clk.h>
> > +#include <linux/completion.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/interconnect.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_clock.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/pm_opp.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/units.h>
> > +
> > +#include <media/v4l2-device.h>
> > +#include <media/media-device.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fh.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-rect.h>
> > +
> > +#include "camss-pipeline.h"
> > +
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/videobuf2-vmalloc.h>
> > +
> > +#include <uapi/linux/camss-config.h>
> > +
> > +#include "camss-params.h"
> > +
> > +#define OPE_NAME     "qcom-camss-ope"
> > +
> > +/* Format descriptor */
> > +struct ope_fmt {
> > +     u32             fourcc;
> > +     unsigned int    depth;
> > +     unsigned int    align;
> > +     unsigned int    num_planes;
> > +     u32             mbus_code;
> > +     unsigned int    c_hsub;
> > +     unsigned int    c_vsub;
> > +};
> > +
> > +/* Per-queue format state */
> > +struct ope_fmt_state {
> > +     const struct ope_fmt    *fmt;
> > +     unsigned int            width;
> > +     unsigned int            height;
> > +     struct v4l2_rect        crop;
> > +     unsigned int            bytesperline;
> > +     unsigned int            sizeimage;
> > +     enum v4l2_colorspace    colorspace;
> > +     enum v4l2_xfer_func     xfer_func;
> > +     enum v4l2_ycbcr_encoding        ycbcr_enc;
> > +     enum v4l2_quantization  quantization;
> > +     unsigned int            sequence;
> > +     struct v4l2_fract       timeperframe;
> > +};
> > +
> > +/* -------- Register layout -------- */
> > +
> > +#define OPE_TOP_HW_VERSION                                   0x000
> > +#define              OPE_TOP_HW_VERSION_STEP         GENMASK(15, 0)
> > +#define              OPE_TOP_HW_VERSION_REV          GENMASK(27, 16)
> > +#define              OPE_TOP_HW_VERSION_GEN          GENMASK(31, 28)
> > +#define OPE_TOP_RESET_CMD                                    0x004
> > +#define              OPE_TOP_RESET_CMD_HW            BIT(0)
> > +#define              OPE_TOP_RESET_CMD_SW            BIT(1)
> > +#define OPE_TOP_IRQ_STATUS                                   0x014
> > +#define OPE_TOP_IRQ_MASK                                     0x018
> > +#define              OPE_TOP_IRQ_STATUS_RST_DONE     BIT(0)
> > +#define              OPE_TOP_IRQ_STATUS_WE           BIT(1)
> > +#define              OPE_TOP_IRQ_STATUS_FE           BIT(2)
> > +#define              OPE_TOP_IRQ_STATUS_VIOL         BIT(3)
> > +#define              OPE_TOP_IRQ_STATUS_IDLE         BIT(4)
> > +#define OPE_TOP_IRQ_CLEAR                                    0x01c
> > +#define OPE_TOP_IRQ_CMD                                              0=
x024
> > +#define              OPE_TOP_IRQ_CMD_CLEAR           BIT(0)
> > +#define OPE_TOP_VIOLATION_STATUS                             0x028
> > +
> > +/* Fetch engine */
> > +#define OPE_BUS_RD_INPUT_IF_IRQ_MASK                         0x00c
> > +#define OPE_BUS_RD_INPUT_IF_IRQ_CLEAR                                0=
x010
> > +#define OPE_BUS_RD_INPUT_IF_IRQ_CMD                          0x014
> > +#define              OPE_BUS_RD_INPUT_IF_IRQ_CMD_CLEAR       BIT(0)
> > +#define OPE_BUS_RD_INPUT_IF_IRQ_STATUS                               0=
x018
> > +#define OPE_BUS_RD_INPUT_IF_CMD                                      0=
x01c
> > +#define              OPE_BUS_RD_INPUT_IF_CMD_GO_CMD          BIT(0)
> > +#define OPE_BUS_RD_CLIENT_0_CORE_CFG                         0x050
> > +#define              OPE_BUS_RD_CLIENT_0_CORE_CFG_EN BIT(0)
> > +#define OPE_BUS_RD_CLIENT_0_CCIF_META_DATA                   0x054
> > +#define              OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN GENMASK(7=
, 2)
> > +#define OPE_BUS_RD_CLIENT_0_ADDR_IMAGE                               0=
x058
> > +#define OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE                   0x05c
> > +#define OPE_BUS_RD_CLIENT_0_RD_STRIDE                                0=
x060
> > +#define OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0                     0x064
> > +
> > +/* Write engines */
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_MASK_0                               0=
x018
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_MASK_1                               0=
x01c
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_CLEAR_0                              0=
x020
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0                     0x028
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_RUP_DONE       B=
IT(0)
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_BUF_DONE       B=
IT(8)
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_CONS_VIOL      B=
IT(28)
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_VIOL           B=
IT(30)
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_IMG_SZ_VIOL    B=
IT(31)
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_CMD                          0x030
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_CMD_CLEAR       BIT(0)
> > +#define OPE_BUS_WR_VIOLATION_STATUS                          0x064
> > +#define OPE_BUS_WR_IMAGE_SIZE_VIOLATION_STATUS                       0=
x070
> > +#define OPE_BUS_WR_CLIENT_CFG(c)                             (0x200 + =
(c) * 0x100)
> > +#define              OPE_BUS_WR_CLIENT_CFG_EN                BIT(0)
> > +#define              OPE_BUS_WR_CLIENT_CFG_AUTORECOVER       BIT(4)
> > +#define OPE_BUS_WR_CLIENT_ADDR_IMAGE(c)                              (=
0x204 + (c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_0(c)                     (0x20c + =
(c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_1(c)                     (0x210 + =
(c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_2(c)                     (0x214 + =
(c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_PACKER_CFG(c)                              (=
0x218 + (c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_MAX        4
> > +
> > +/* Pipeline modules */
> > +#define OPE_PP_CLC_WB_GAIN_MODULE_CFG                                (=
0x200 + 0x60)
>
> Can you just map the individual blocks so that we can interrogate
> HW_VERSION HW_STATUS and friends ? Those regs usually come first. I can
> see useful debugfs and/or dev_dbg() usages of those data.

Sure, will do.

> > +#define              OPE_PP_CLC_WB_GAIN_MODULE_CFG_EN        BIT(0)
> > +#define OPE_PP_CLC_WB_GAIN_WB_CFG(ch)                                (=
0x200 + 0x68 + 4 * (ch))
> > +#define              OPE_PP_CLC_WB_GAIN_WB_CFG_GAIN          GENMASK(1=
4, 0)
> > +#define OPE_PP_CLC_WB_GAIN_WB_SUB_CFG(ch)                    (0x200 + =
0x74 + 4 * (ch))
> > +#define              OPE_PP_CLC_WB_GAIN_WB_SUB_CFG_VAL       GENMASK(3=
1, 20)
> > +#define OPE_PP_CLC_WB_GAIN_WB_ADD_CFG(ch)                    (0x200 + =
0x80 + 4 * (ch))
> > +#define              OPE_PP_CLC_WB_GAIN_WB_ADD_CFG_VAL       GENMASK(3=
1, 20)
> > +
> > +#define OPE_PP_CLC_CC_BASE                                   0x400
>
> Is this actually the correct register base for CCM ?

Nope, you're right.

>
> I think you should check again.
>
> Same comment for each of these blocks HW_VERSION should be the first
> register.

Ack I will define generic macro for them.

Regards,
Loic
