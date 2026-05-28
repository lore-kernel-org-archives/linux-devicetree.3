Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A8F3ECBFC
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971121; cv=pass; b=iWOHWH5I8OfYpP2AiwXUVUGP0i7kHAtCROuT2cAblcWjTsJkNvv/a3x3mWWqCLv6Rw6icJrrSD2ct5rFL4/UGLTWc0kYlDuSeOBflYSasty/I7SidprdAaTMLOObiRAS7WQVklNh/dfwwDr3qYg/yz+NORs0guVH3viDcRc1Bqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971121; c=relaxed/simple;
	bh=rjGKcaiPzzE9XfowjPUEZRn6zT+jUKQFamebPp3qZ4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTodzpdi7/0aeHSx3RKknmS0qFCWi8l+hB5MOyroe06pj4dz/ShMkV+QbR6+SGxLCNdsdRBFvtarEduF4sKqQeTNvOwNQsFFx6JBNdL3vzP5sWBs3+5p59aN6q7K7XBXqICS6D8AuA0pwK00aUpfaBRt5B16qTx+wdOolH7BWxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prEfC2i4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZMuzG8B; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prEfC2i4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZMuzG8B"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vkuo298205
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=; b=prEfC2i4IyXES7BC
	cmHulPI14uPbrVtMetN2T5yu4ICQO00WgaK+A6eXmgJI1v7hE9fii++rwodl+CgJ
	mST0ZvEIHGyhietuMO6fYzSAJNAzRD8ppMDX5EdMynHhNRkTmvNeu5bXYvzPcKdB
	rA6oIBqgnEmljP1Z0rxr7yVDRlNHKXT0pivyyFO5kR7FlVfxbwaHpqz5Ta0WTbp9
	6BnOI1vOHCLXZDz//RqETpdeYe9/zaf6TLaJHqlz7Bdkrx1h3kD3pMG95XEDk2MC
	DvpNyX4lbx3Im5Mx5bc6unNLyEB6lrMTHPd+XBXSQFjT+C1Wg9a7joPe0d9r3EBz
	WzGJmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajp21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:25:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9112b2755abso2841397685a.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779971117; cv=none;
        d=google.com; s=arc-20240605;
        b=Et6D2IICF+ygdfUAej8y6YbN7kx41jHDY+zmYjlnhrNgu7gayuOvhMedj2dtWmFlmA
         cxk+pTBvkuUimAsgpTIDwK897othMJlTsQdigLal+hWJed30To2D4dSb2OGPCkzaSN6b
         eRtgV9ZLR7FL16LK4w3wqNzdz6yaw6xLNfPxxLbKeYSs6A78yWtzcTuIH2AXHI1Y+jpS
         86zU80+fm56ratUQSZ8LxW83DCzHHhMM+jiSYln4mQftsFwIHqYWe5t60QeuC7gjBIoV
         u+12Jd269OoW5mnvRaPsCnde15VzAlaSVB37+/9nl8D9TiqxbsIrIF/ZPIkybiFHkv4x
         cT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        fh=qhsjxM3H06VkCibwuExej9TaNnmQ26fZa7AchW0z45o=;
        b=LGtSALPHg9zz+hca4MbsqG9KAq/zIFn57xL2N5hnSylEHMggAW81yvF6ykl6t8Dixm
         4e/LeCdluGNAITWmyOnWDJdXmu7JF0JmEoor439LWd+hcFezhfW+rXdKnNcZvwKKW1h0
         zy8hucCf28BzFg8bDPZ6ZDblJUcVQrbcJmaphsQ/UR12uByx0U0cT/YeJgiSuoLbw8IQ
         aSxfXcMwRUxkXBguPhkJ2MuG/1ZKOcaioh2xSHzK/NeOGs72RNNtLdsvJDUf9Zb3adn9
         9ihKoSuv9TxkUhwU2gjiT5E9WlMjRgf3Jm824bDoQgULfmZbSuxadDTny1BV5mac7hfN
         7uRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779971117; x=1780575917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        b=QZMuzG8BzyeJWyVaeoG1d3GykAoRlxajPSwjX1kPY3Q94GZF0NUbZhCiZhhQg07QcO
         AOtQ0IraRos0+dASszySCYdA2jDXAURWgr91VRnbBrOYxS4iKPppD9E3ykQR0vUZeG43
         L1a58Gnd+Xs4j6B4A3mIjiyttHz97UJi7Ammp/9y1lTP94gd0x3q1zq1dHjTkf46U2Zn
         DtAe6PgsygUCYa/7ByQvom2IZ/lyRM+SrADua4O9b7tMP3iJVnZw0TD59eda9SpB/1tK
         m/y6y1tAPlfvFLUsfyFMb/UuYy3ijLxNIDFGUKoB/1nTuy9dDPnkfoECypOZLkMPJoC/
         mU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779971117; x=1780575917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        b=ZLYYiMXXdaqKGiJ0HjLrYkoV3pexvqENVrXgXAsdBzkY2V5PeTNw5O55wgtwoMhexs
         DmDG2VkaHXl7l5NUkL7IzOFQqE+WVw7rneUOMatKf2G+UMXZc5+euSRI7athyzDP+tmE
         CF+UFozd3Swpo7shzUfp5aj0gkWYj3El4L3pi/jO+rD+iuFhX/YJCtRNjt+4qBPmqAzU
         94FzhiF/tF63ONs8laydxZW+3Z5QrvCWqqTQkJJ3lywf7/hPfAQ0TugTjQXr7POPlKrU
         jszHIEZoUwvl4wrt4xkhCIy9hgPeMoLZ3Ycj7vRLU0D9xR/wqFJDdCwdWi/bD0uM+sM+
         9CYg==
X-Forwarded-Encrypted: i=1; AFNElJ/QzWbyp2MnszYOeY0UWGz+PZGuj8f9gNYtGCHv5xCnEp4zQIDO9TXHYMpinjMkqNIGvgb0SF+gRubc@vger.kernel.org
X-Gm-Message-State: AOJu0YyCwLhYFK2HQnuMiIrsRqMpGu6CaFWXSim8xcixLVEXzRNhKCG3
	kFihZE9HDY6EJU9h2+o7UNzsh5Qb14f0lsgFZNayI9IJXSEqTlgcOV0r7C7fj8D7yUh9QxhfOJU
	Tdk3FZwbKNumw/GR3KdgARA+Np6cyxFYfcETVhMARwPGdb+9Ca3mkLYlBAIaN9GDOa7QG45NlD9
	MLptD8iVQhfspgdnh4eKSFYo+U5ChUbX7pTeIzlZE=
X-Gm-Gg: Acq92OGej5Fw4POQzEfTKbqurpqFmI1p4J/q764BH32S+uTByigQXBEVudcNbuss4rC
	4mDuqvVcC/c/uVC9WlowhHc/VTrqXQlJMybuw7ZAY0Lsir7IAZGgVhrJ14tTdVcPBd4D3zhPhMg
	SNAqSlQ+LzT5+P2b7EG5ZlPUIPPFmCGGIpl/Lsnqyf8cWdDkTP6nXdYgytkpIAcqcprWRp/cmQk
	X9Dgi2B+RhBH01MbS62UZ1lmnYMCerIn121o2xcd9YnD7AU
X-Received: by 2002:a05:620a:84c4:b0:914:c0bc:a7cd with SMTP id af79cd13be357-914c0bcaf11mr3886831385a.48.1779971117110;
        Thu, 28 May 2026 05:25:17 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:914:c0bc:a7cd with SMTP id
 af79cd13be357-914c0bcaf11mr3886823885a.48.1779971116654; Thu, 28 May 2026
 05:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com> <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 28 May 2026 14:25:04 +0200
X-Gm-Features: AVHnY4JO8P8GLceB0VuUyA9tvcNmn11LuhgjLHguxnzI4BEUk6ZkF0V4tx2XITE
Message-ID: <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: pR5EoaaKOziodeSWYGgR6zc1EF0o74Vo
X-Proofpoint-ORIG-GUID: pR5EoaaKOziodeSWYGgR6zc1EF0o74Vo
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a18342d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=8qkcLw8Gk86Nxc3JiHYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNSBTYWx0ZWRfX5rcZaI7tagpk
 Hxd98sCZ98RmsGCAUhUw2iAJunL1GTkEo3RMCuQmBdeQl8X/BeJdtr8RR+GGH00bybduMP22mXO
 +lom0ZAuICX8MiLEjNVf7wob4EhGgORlrvLQ8Ma5cF59dE8+Z/4eKI3rwPLugdCQTFV+9YyuQK2
 YQ/4OSzvYQzEmN7S4GmCetdZz8JYG86Ej9Xq7D06wAT5CRvSbdlc4T4QsgzWVZx9DDYF4j4LL5A
 Yp2rMgYQ3xx2uCY3AhN9TODD0zt/isKdM0x5uNv7j8ISEBGuJhpHSBetGYSJGmvuaPSNKnJZss2
 f1ZB9K0xJ/ntmNUZW9V5lOusgyIhwpL0vAqvqL+82BUBLMhhi8sUnwcuoK8/3GvvloF6wqHIePC
 OuA3Wtpbecs1ZY7oZ5pQ3shd0pQv96Xq1rcqLHKZR938uD8LWvX04fw29tVO9AiJvUQwzVQmA2m
 h54NxVa9dEUk2+R8iSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280125

On Tue, May 26, 2026 at 7:13=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>
> Add CAMSS driver support for Shikra SoC. Add high level
> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
>
> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>  drivers/media/platform/qcom/camss/camss.c                | 13 ++++++++++=
+++
>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>  4 files changed, 17 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613=
649920e6ee1a1f2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>
>         switch (version) {
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>         case CAMSS_6350:
>         case CAMSS_7280:
> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy=
)
>                 regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
>                 break;
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>                 regs->lane_regs =3D &lane_regs_qcm2290[0];
>                 regs->lane_array_size =3D ARRAY_SIZE(lane_regs_qcm2290);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad=
57419b25cdec087 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>                 break;
>         case CAMSS_660:
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>         case CAMSS_6350:
>         case CAMSS_7280:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4=
e5fe880007d1ee7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resour=
ces =3D {
>         .vfe_num =3D ARRAY_SIZE(vfe_res_2290),
>  };
>
> +static const struct camss_resources qcm2390_resources =3D {
> +       .version =3D CAMSS_2390,
> +       .csiphy_res =3D csiphy_res_2290,
> +       .csid_res =3D csid_res_2290,
> +       .vfe_res =3D vfe_res_2290,
> +       .icc_res =3D icc_res_2290,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_2290),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_2290),
> +       .csid_num =3D ARRAY_SIZE(csid_res_2290),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_2290),

So isn't it exactly the same as 2290? wouldn't it be easier to have
the shikra simply fallback to qcm220 (via compatible string)?


> +};
> +
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sdm660-camss", .data =3D &sdm660_resource=
s },
>         { .compatible =3D "qcom,sdm670-camss", .data =3D &sdm670_resource=
s },
>         { .compatible =3D "qcom,sdm845-camss", .data =3D &sdm845_resource=
s },
> +       { .compatible =3D "qcom,shikra-camss", .data =3D &qcm2390_resourc=
es },
>         { .compatible =3D "qcom,sm6150-camss", .data =3D &sm6150_resource=
s },
>         { .compatible =3D "qcom,sm6350-camss", .data =3D &sm6350_resource=
s },
>         { .compatible =3D "qcom,sm8250-camss", .data =3D &sm8250_resource=
s },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d0=
5b2c3853f3a7714 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -82,6 +82,7 @@ enum pm_domain {
>  enum camss_version {
>         CAMSS_660,
>         CAMSS_2290,
> +       CAMSS_2390,
>         CAMSS_6150,
>         CAMSS_6350,
>         CAMSS_7280,
>
> --
> 2.34.1
>
