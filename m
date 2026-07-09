Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF929AB07
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583176; cv=pass; b=l+Qfb57tsG5h8mDSUd/RmF57r009qGamn/FEJ+jWfTYC2KfRG+LQx+UkGBP9ydfmtlux4ZJNZmJP5ljGi+sR8f/R+W4By5u6WqmPEjRh/Nb8cJ/gOiI83BVnNelHzBJqBrFH3ck1YijAULJwTgblFhpoaxLVW4W3E+QHjj0gzYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583176; c=relaxed/simple;
	bh=07wva2+HW2Xk8v4uN43Cx4PhQoeKjtx49ALQficpH+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7N/oQ3UdOeS/ERdzpgX6mM9x9Sai65Yvjgao51EX4bhC/OR6lHRgKKnSX5Qf0x7Leca179ex0K00DVHwlQ/gcfz02+UQk/Zg4EOr/L3cjZhtW1c8NGclxryrd3eE0ueP92/9I5avAyLKGQMXBKqvcUpPnCvQ+Xx49fGWBNCYK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ca5aqJA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6/QT2qQ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ca5aqJA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6/QT2qQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960PUQ784627
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=; b=ca5aqJA5NBD4tfAF
	yKnSTzw+vMLvpqGGwD/U8VkWR+Dmshjaq/96UQ4Tu+ENN/SFhVJ3Np+m5TbM11Ag
	Gcc1w9uMjI6mtzV7pDqYnRMRzmptfl2DsNs8EqyU9ToIOgO/h8i2qobqDjitDmZz
	4bZIejbD5Vr/lup7R2Rm31EMCUniKXE3gsIEniNoc0o2hQXtkmm7cfWDLQd1dLlm
	xZj3jRnb+1BG9HCpyt0KnqscZSYMdbZlZFO887tll6u86YwTxXe8s9dgUmgEZu/T
	eb1+9lPfEFA5/s7o+8UDK/zu9BiYa1iC7VU0O6+s/INuJ2MpLmCUTHwXf/UBlgEh
	9BtVLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u2gkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:46:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91931144870so81036185a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783583170; cv=none;
        d=google.com; s=arc-20260327;
        b=LbMnB+w1aMdlQBhMJLiPFOw6ujoEFOdIjuAceD1fg/6kZZPa3wgMlcbyUTmyseylQw
         nwaMEvFWYeeNiMelL06/Zwa5YBkP9YQLNcxrf69PNiCAK8NhGzv2Qcv4Gzmc5zpf5YX7
         4vWu4zwgxEdZ5ToE7ErXEP6oGXOT+aaEVRy/cGlLsMSbEL7ZNgD+g5V/2/Mmkccjj1qn
         9NoV/erJD6VdESiv0oCp6jjxDYfI1dF4vaPSj/NKC9GS71v6vLYyqoe7xfHDuH7Jfmpv
         mjpJnceLfXLD6I8bJFp39oUKNsCwxqkT7Ppr7YjDVMiqV414kIpsQZz2z7LrNdHjDUyH
         8fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        fh=MxUHM/mSvISNWm+3J7ea+cTKeWdhfXRiDFklUHdyAL8=;
        b=UikU2TjlNV/OHzXacnrh/0nOyVyf3pcg8eiJWCZU2ub17sDxjdBMs470yTAxyerWZO
         D5JlsaIW0OusSA3T0uSIaXlIyIFnNZOCh3zBcLvL4KCoejMcQlPpUp/PmPqINxCNwlOi
         Gdw68O7K4UmeJ+xd41rgF3IFYEpnELvASE38/LeSJ2C9KWcXswc8AVzbYC1RC4oV1VDg
         tygw4RlkJm9UNDKT+GBTVhyOdYJAXCqEfz/ARKYDs6n6yEFYz5d5hsJNVK8RYZEmZCUr
         uDgXlHDi3vFgkSv32SUrbuoJOm0wupc+5MnRyzosyv+Onr9VmucQjaRZXOGDYsdvvomk
         Yl/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783583170; x=1784187970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        b=c6/QT2qQfoNXGfM35oBzWZNtQaxt08eTRwKWVlH3IiMxE1+zYfOiOdQQ1nflORUu8u
         y0n+5xVzeOQZov++dLZqJ8QIaRH7g2f6IHIJcBYiFNC7XEIhsMFhIur2TTWXuO51mrrP
         n8W654bnYby0s4+xPpGpjV7d+leyBjAm/pJNhzMSO9J6+H4I4gVlS0DUzdMimSB4UPpJ
         zEVZLX1pVwD8NnesMi4pn5gpPXwtRZUs8EDQAB8TTgUGmbdBRdQapPOV1rowEzKtivSX
         RDfd9IAJBojTKcL03xWaP46B5uO1VTNYcg1rwupYeiS0BrpD9RRbnAhN8TsmXqWuK5dU
         exNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583170; x=1784187970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhGxkCX28V4kHMRzxiw6nz0Sa/jpmcLA68qNhvWGngE=;
        b=dwZhRtgsc7G6vMz93Rx3BJ+y4ArryvzhrpBAwhZszmOcnTiOwpabeBnwiy+mCb5Q+q
         y+EKA6UZsrYS1XQITKPCQwbBbJesSWJOIJDOKULYli2MRxvEqwIKMVK3rGm9NSc8bnpW
         p/uPWCYZX53oIlz5ZX6u/YOY3dik7qprtc322ScF5w3ZOhNNv4BTOdOw+xTOoRr4gTpR
         rM6it7mPWjFN9Ynv5WVsrcEtHstGyGXajB5BwmN7DXysWlmqgiHfCp++9w1cYP8E/Rat
         wdSeSESnPqih4RKivIpoOXdU/LdV+z5cfmBuoRKJdjP3H3TOeiDBE1u7RuH9HLUlG6D9
         6XYA==
X-Forwarded-Encrypted: i=1; AHgh+Rrh6gVSVdG1EO0EeWPR4oN44uEMS/v0Z4jtl5kcKWNQe+T8Sj4pk2IKSl/gFNQMcjxiCxBMzWLTFGDI@vger.kernel.org
X-Gm-Message-State: AOJu0YxPwAaB+wXvZzgg1xp4VsC/EvQjj1tbP2tgxRIq+VxHBaC3BstD
	g37YUfskl3xcD9L7nN9M9j6Mp3dQrp4vxhbZa4UC33+OwTxiB2l3J2bgbKpVF3Z5miC9V+EftI7
	I2zK2ALx5GvrPkdHPoQp0U5d2nIdAxBt4Q38QGvuXQsUBL5F7J0ymYqQPPog8Y4Tauep2tOSxYd
	d3IoZg9zFiSdWwwEZmdasC9qrklmlLY+19Coci2C2Lxtcaxyox7oiS
X-Gm-Gg: AfdE7ck204nwYUuV5DNr9eS2oK0mFotc/zKjDbTVhtjCEJ0MOO5na6R5IMtfXoJ+D1c
	QQL9s/IZQOKHTeMgUpLhDdnhAj50lQEWy6rUAgF5Gh0Z1x/Sq31nZAMIF9OfhYrGNUcqoaxXAXK
	IAlTKyOAIxUogCfDwcYnDAw5/L7ojj29hIilgqcuokmvFaSfL7OYD4Czn9I0+ETIyLNUzbsCXmG
	EnkFfF4rQsfp5+DJixD8geA72oWQCVzvxXDTim1CLR7F5LYy+WMOF5JfDVevwL1NG8z+p99mCwq
	um5Wq4lhaA==
X-Received: by 2002:a05:6214:450b:b0:8ee:ff2e:c2f4 with SMTP id 6a1803df08f44-8fec557ab7dmr64350696d6.17.1783583170407;
        Thu, 09 Jul 2026 00:46:10 -0700 (PDT)
X-Received: by 2002:a05:6214:450b:b0:8ee:ff2e:c2f4 with SMTP id
 6a1803df08f44-8fec557ab7dmr64350496d6.17.1783583170002; Thu, 09 Jul 2026
 00:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com> <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
In-Reply-To: <d579ffd2-b99e-4e8d-b2b7-e7e896b2d71d@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 09:45:58 +0200
X-Gm-Features: AVVi8CfzimAcZqI-0huc1ogOqlRyuYjOXyQidt826_gI6qT68v2jCz-ds2hC2iI
Message-ID: <CAFEp6-0rwuRzXM0fu0uyrvSvgG0ttpygOULkKfTT7aw8m_HUog@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX4PSZwejoUW+k
 wQ1AT+xs1VYNOx+vFijycaSBJCUWIHDOpOFHpMMQ5jmi7Qb26X2iMXdkIjndoDMu4B65ChVd60H
 1V/evOq5Qzi6Q4t0g600S6B1aXh9TTk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfXxXIncz+Kkn5m
 G1HkKS4+L643a/W3lFnitcVdvQwDaSJEfGBPLgZ/SpRwlZd63iOEt1QN8BioMFy8M8HSKk/58Sn
 Jd8cCHMXGm65y8SIYxC9WTpt9DORYm3ds08gvVn7RbZs4mJk6GT6/YXQ+wPx4hwZJNvoPjv2nB8
 8oLuAGAbd6iqEANu0Nq0FdpUwH4/MeY1pJammUtQICXOUJi/4x4jnvPMpBfVI65E5OHTAV840x/
 69D992rjQKOQX5arbRTaniKcLKa6a3TEafRsXCv0PECohrO0iB0jwzbfS7bfZ1FDmEfvuWFMdgT
 lO3WDF4p68UqJJnjTt9XvhsxlEj6dEwfx1aANAaHuv/+lFmXo1WiooXnNXg0fqbEwvUwceMqYKC
 K+hncI+DE0b4mUhKA395j0V/YMhmsX7JGCLamPo2LM0vmf3i8reMcfdb0cLMe75wYSxuXs+APBM
 +v7TIiqASc4jkVcFWag==
X-Proofpoint-GUID: COdp3t4vCrSL0AEzjrcuBZOSFVeBa4c8
X-Proofpoint-ORIG-GUID: COdp3t4vCrSL0AEzjrcuBZOSFVeBa4c8
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f51c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=y-x-Ysk6LtgDBV_-dcYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090072

On Thu, Jul 9, 2026 at 12:30=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/07/2026 08:11, Atanas Filipov wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Use devm_of_platform_populate() so that child nodes declared under the
> > CAMSS device tree node (e.g. OPE) are automatically instantiated as
> > platform devices. This is required now that CAMSS is modelled as a
> > simple-bus and ISP blocks such as OPE are described as child nodes.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>
> Looking at my commit logs I see this isn't my commit message ..
>
> Anyway.
>
> > ---
> >   drivers/media/platform/qcom/camss/camss.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/=
platform/qcom/camss/camss.c
> > index 2123f6388e3d..95e655a8b6aa 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -16,6 +16,7 @@
> >   #include <linux/of.h>
> >   #include <linux/of_device.h>
> >   #include <linux/of_graph.h>
> > +#include <linux/of_platform.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/pm_domain.h>
> >   #include <linux/slab.h>
> > @@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pd=
ev)
> >       if (!camss)
> >               return -ENOMEM;
> >
> > +     devm_of_platform_populate(dev);
> > +
> >       camss->res =3D of_device_get_match_data(dev);
> >
> >       atomic_set(&camss->ref_count, 0);
>
> Just drop this patch entirely and model JPEG as a peer of CAMSS. I'll do
> the same with the CSIPHY and Loic the OPE.
>
> Modelling for subnodes is nice if you have the idea the camera block
> should be a bus.
>
> But for what reason ? As you pointed out it should be possible to both
> compile and run JPEG without the compat=3Dcamss node on sm8250.
>
> Making the camera block a bus is a nice idea for "reasons" as this
> thread has shown, its a problem to implement with an upside we struggle
> to define.
>
> When the facts change, I change my mind.
>
> You were right to argue to have this as a peer node. Lets do that.

Having a camera-subsystem bus/parent still makes sense, especially
when dealing with shared resources. Whether that should be the
existing camss node is indeed the question. Today, camss effectively
describes only the VFE (including the CSID) and CSIPHY, so using it as
the subsystem parent would introduce incorrect layering unless the
node is significantly reworked/broken. So yes, for now, keeping the
components as peers appears to be the simpler and more scalable
approach.

Regards,
Loic
