Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03174D8DAA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646309; cv=pass; b=oXRIRs3gQeRSy8RaysDI79oh37+fLYf0ugEvTb+k8/JgRAU265MAk8DBLv7gvL5XvK33Q0AYvA3Fza4X1a2MKdkKj4mQ9JM/frkHDa7+iHus3t2PfMVJrbwoCaVZXCL69OCyyAnshw0T3v7rQqqzF2wDCAh/bfRjVuSDx+nqXwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646309; c=relaxed/simple;
	bh=dOYdRLtajuKWeq7l0EZ1y1y7lhVrzrmKGXF1xfK4b9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnUxoGAAYWrAvK7ESmIGe32bylk1sZZZrSs0NrxCCKP470tenJz695fnsHpUFMb5znY5zI+HcwThZGE3krswOYbbs8D1jGQDiYcxgY27aSEUx8kNiGGSwFwurbQVeKTS36zzZg69dPgrHzz04LQ7U9z2lKRK4NcLrKAG1eLAqiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CS6aIioT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4scLvfD; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CS6aIioT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4scLvfD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfwwh1804790
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YByahmNJG5MKZSzb3gPGLiRR
	hG+aYD8P8HIDb4kdTjY=; b=CS6aIioTR973cYCLaauCSIZlyfJI2S/TPTd0EGPW
	uIDAnPcIcRETTrXuIVm/T/75MlIOaJXEhbSNbRlv7YATib45jPIiv6n4hL/O33a7
	BZo6IoCc83VTGOOiDFppnbW6HX9jUQaY6GkPnIhdgPqRfIFCuSW3uRGAEnf8cjJa
	7ujnWiiU8PdyM/mk+E9PyfTphY1Q33Boz5PfQi3NOhsIrzJUUldRZguqQZzUKrWp
	n0JdVQxPmmNJhAId1j3uGpHUhEFrzaY4wii/LbIXgebHmdpE/mP2s4yYJFWaIlqz
	qror97C+O//TyHpAcCyJvuX+sAnVWU1BAd5uGuiQWPXkTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa9cmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:05:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848568a6f62so19225280b3a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784646306; cv=none;
        d=google.com; s=arc-20260327;
        b=jaRTDHn39mCxTpZQZTRIqgjR3kWsvCcqg6C42oPwup3+Aq0WfKdFmL6juD6il4g6rw
         anocrEOk+oPu/RpHLBCx0ZR9KYXaaX1ZEsF6yde9MWHP4d50yISlGvGzwa7cVVAfPpvf
         7FRrMlmkgcXFnTEzl/iAmvKK0JMjLp1gJQDuI9dhpbycyGTXKfL6vA57j1B6RokvEVxT
         JWQLDVRkQAQlTxZociuzEcYiGl0Kdyx0I64Vdr0+QjawFjqxoV+kUm53kQQYnqsND8WQ
         Myj+djt2f758Di9I0DWGCOH4fBGLnbhCeWy4IlRUIGJZeKzhBti1Hqqhh2A4u39dKaAm
         /OKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        fh=Zsfxr41w/7Taf2MEpupDURI1/jbP/YMcxnt6yCev6h4=;
        b=BeYTtyHS4BHZvJzhtU+GZu9ZxJKLDO+6Ol9qTzRMcG2hMWcGEYU0p+65uBf8Wvz860
         apy8ige6joHaRBqwKT5dtTVd7FR20lZ7oYIiAaYBL5pNL4B3HcqGx9lZp6Xb/L0YtcRv
         eOpIgVSZSIPA1XcL23oKGyirUJgF3Rxa6xi14cEI2Sx3hkl6vhAFblrv4G91GA4Hypo6
         CiRli0vmoUGSElZX8JZKf8PmPgajB/+Wtsy0FojmiUdRrISuz56D/XK4qDzINgD/HQEt
         /xkfLQxsoA73cyb25UHziZW7r7mXuwh2NR4q23NyOO1J1WXLO3aeHg8UFmFBn53HhcPL
         Iawg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784646306; x=1785251106; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        b=W4scLvfDKaB98sTMVzEh1Liu8tY7//jdm2+D7PKFrrkVvUtvCgRptHldpJuxmsIUY5
         Ybf1pbv/IlaCnYjHrPb91dHJvZRKMUku+bNA8LBawAC300biXB6b2i85UvjloUM4wx9P
         WIx9oXKOIHTrZ/G1a1aWJPAxGJkf1EJF59r7OWvRKfOh8AhY+HpuCAH/IE7SrezRzASE
         on3HgPzaCbtU0qMhuXxLHC3YJ/H49CRMCxXeLC973DQq5dADarM98XARsyLAoR2TYSM/
         KZ+o0uOb6hGmen8Xrx72PVDvE8T+U4Bi67V1cHZYiD3Cf7Fb+38iexb5rgcXfelM/+tD
         l5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646306; x=1785251106;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YByahmNJG5MKZSzb3gPGLiRRhG+aYD8P8HIDb4kdTjY=;
        b=g2mf6gcI2OyYL/tSFyrOX2yxPmRezMQI7cq2KkYFXvBOcVQmL4MvbfDN6GLUM8+wzy
         SkdyLoUXxU8H6+wpPoMtSILtKso2bU8Ms66pG/WZ5XV7pzbXOVpEyta//J7wXgJnW3Fs
         ow1QHo11AMlRF8j5cpxL/wBdziHAXFoI6Aciumvl3O/uRgymnWbA32bbdMuwEZEQ9uyf
         h8YaqkqyEbEKumWSnbT/CF4oo4sCEJEyamfxhqZqQnEnYrsCtKTaXHopNh5rzmCOptYh
         7qroGghL2mImJXmYo8c4CPUQ6OhuLEioVHQR0Tif7arlAtp+2AsKzjhvV/6PCkRUCT9M
         7PYw==
X-Forwarded-Encrypted: i=1; AHgh+RpNNLVm7DJqo9QjdzBnOTPkF992Emj1NbhBWkI6nHff3ulRbfqFNRVt6r4i4pva+rDOJ6uAdmz653Rd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuyu1n0WOx8BF7S+N+19tTHES+3tHRLPnOsRlruKqtmhG+RgCW
	gheAdMYZorf4OHGaa4VnAI0OIoc8OWkDKWulP8SaZTXhs44rgsHVGAhmf29HepaLAHzjXnfrSPg
	fRcOUimqCo/2/1EP+c2WGISzFy67IfvNBNUIsEiZSzKAK00XKRIp10DnpvPI5uGf6cnp8V1I68s
	WhaaGEgdS7XeXO6+HEqehO2+g8lvBJ5RY5TxAmTrM=
X-Gm-Gg: AR+sD12OcA0FOk2RdupCYyyTRah051FSsUgYpfSDhdH9UdM1xVtNubLs/FFkQDxjGLs
	xdScxRp8fwplB8v6nMRK+HKj7fSWpoae53mxNjfa+63OgHBxqVNVDhfrfuC5iNO1mbgIRwrmMUG
	c0aropAq2lRO9RE9LZQwNp595gNa5lZv03XEU/rOpXwbanTaYLirzS2Oeic6MjZJQePPDCM94=
X-Received: by 2002:a05:6a00:1748:b0:845:363e:12d9 with SMTP id d2e1a72fcca58-84c292a0e86mr17652517b3a.3.1784646305710;
        Tue, 21 Jul 2026 08:05:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:1748:b0:845:363e:12d9 with SMTP id
 d2e1a72fcca58-84c292a0e86mr17652128b3a.3.1784646302052; Tue, 21 Jul 2026
 08:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com> <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
In-Reply-To: <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 18:04:50 +0300
X-Gm-Features: AUfX_mwnWEBpQLukUwR7S931rfRJyPKDW_MoN2K5bzRez7pKe6ZY8ZSVeWlcMgU
Message-ID: <CAO9ioeW3y0ck2k3H2XK4W7z6YCFO6nuENN6=SmKxjQjNUNKWPw@mail.gmail.com>
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: u7E25LN8HXgx0o0qv4kHMhS4HkoTYVBK
X-Proofpoint-ORIG-GUID: u7E25LN8HXgx0o0qv4kHMhS4HkoTYVBK
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f8aa2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=UDfdo8XgODCBNK5t2fMA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1OSBTYWx0ZWRfXzMDNU4HzwMkp
 ALM0GnlXmjiQ2ToQC7oQM93oTisFIPBbI0fEngKP3kR6wBiJnUu5qmU36Egue2sUo1kVQgoIEkf
 DIjlOJmO3NwWoAiUUODxya4tDDUr/FG+JB9MsFug8zfnodeV4oVTVHZzjGzTcJIOt7zW2Uq86dr
 cDHvnoQ0KGxhvB4GtQ11CX1yjcqeW3bHVfAZ3LHk3dAawP5S3wVuVXNzwDDA/38opQWJcuU+W/J
 AQXlkDWmzss89OLVtr8aAT9DjUzDkrWf8P4pnCHicQas/GL7ipUPwedH+l5kRcBgoOVXCCxrYbA
 b2ODv/KXpjgzauArkh2e8pZOqVxDJLR99hkglPP/GwmaX8oIkPO/bijbrZ5ZawADM0GJgFeXdps
 pJv6Eqr6BZVSnKg5gEq0FC8RDMGRxLHU74Tlf+5PU3Nm7tl/+vVmxMa/SClEM5MyYUTsBRhw+y0
 WXMSLezZFJUNHAOGY7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1OSBTYWx0ZWRfX6jyJmi4kByvF
 SRCQh40jzmDRVHwNN5+Yl92twhv+DF9iFq8ag5di2BslN2j2tEo0hdjhEBotrr/wJ/+Kn2Xmxhz
 XCoH9nEa7/ecAEloq4OItI7HPMu228g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210159

On Tue, 21 Jul 2026 at 17:08, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
> > From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> >
> > The raw formats supported by Iris were previously advertised
> > unconditionally, assuming UBWC support on all platforms. However, some
> > platforms do not support UBWC which results in incorrect format
> > capability exposure.
> >
> > Use the UBWC configuration provided by the platform to dynamically
> > filter raw formats at runtime. If UBWC is not supported, UBWC-based
> > formats are omitted from the advertised capability list, while linear
> > formats remain available.
> >
> > Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
> >   drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
> >   2 files changed, 43 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> > index 4c8bc7aac135..9fee5f28097d 100644
> > --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> > +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> > @@ -3,6 +3,7 @@
> >    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >    */
> >
> > +#include <linux/soc/qcom/ubwc.h>
> >   #include <media/v4l2-event.h>
> >   #include <media/v4l2-mem2mem.h>
> >
> > @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
> >       V4L2_PIX_FMT_QC10C,
> >   };
> >
> > +static const u32 iris_vdec_formats_noubwc_cap[] = {
> > +     V4L2_PIX_FMT_NV12,
> > +     V4L2_PIX_FMT_P010,
> > +};
> > +
> >   static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> >   {
> > +     const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
> >       unsigned int size, i;
> >       const u32 *fmt;
> >
> > @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> >               size = inst->core->iris_platform_data->inst_iris_fmts_size;
> >               break;
> >       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > -             fmt = iris_vdec_formats_cap;
> > -             size = ARRAY_SIZE(iris_vdec_formats_cap);
> > +             if (ubwc->ubwc_enc_version) {
>
> Do you see a possibility that ubwc is enabled for a SOC while VPU
> hardware does not support UBWC. IP document for qcom,qcm2290 lists some
> UBWC configuration, while VPU does not support UBWC. Not sure at this
> point if other blocks indeed support UBWC for qcom,qcm2290.

No, QCM2290 doesn't really support UBWC between the IP cores (as such
it has ubwc_enc_version = 0).
Currently the database defines a least common denominator for all IP
cores. If we ever get to a point where we want to define UBWC params
per the core, we will need to restructure the database.

-- 
With best wishes
Dmitry
