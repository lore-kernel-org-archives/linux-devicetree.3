Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D433F12C0
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524259; cv=pass; b=OYlq9TlwPISHPBCSp5hXLi3LIanvC3T/oK2T8VWlCcR2NoW2L/uE/PVk+SXU/aiJSq8e+QiMYq0kDo8H8ROlrh4kVrAiPigi5wpui746YQ4TsY4rOJMxsxlA6pR0lisOecnCuBxM+S/eIIR1jhtk+xaIqbi/1Ok/Q5ZFwUx4TMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524259; c=relaxed/simple;
	bh=fTRf+CpDlg8oC/q1+pBZdLSPb9okL8GDVBLZGR4FfHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dwk5IHF0/VpuUVLrU1r1dpj1YPg2qktxdRHonxspzAxawgoEm+FbQM1Q1efyFnVb0Yj9tic3euFohhJaPSvllPgzoqwaBOdoVDvg0OAhE8oOxef6LUgPbGnj8ceXrBl8wroKbs+xJlZ8zXA4dc7Ohhf0b5BYLhvu4WCb/PiFqeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNCMzsev; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2r8VGke; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNCMzsev";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2r8VGke"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C4QRV2752702
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=; b=KNCMzsevlh2tuc5/
	1WnIHZZhAhaywF9mfturWOYGVfOtDmek/uPAQGzO8pf5SVlIUqrprfq9VMbsxYYJ
	In4RT4IQuLvwHdCHl2uDDy4uroXw2M6EurBD8eSU3xR6PTtrM8Dmh59iWn6ws4dC
	92CbytmCMmFTb6lNx5rnJolDTaY4yGqklGGr7xsWt1VlIFJER6Uybv8uaGV5g0Ps
	rr0TV2ROBhLa1I2l3JKNmDMytA1jSAa1NTLNCifcU+9Wn7GCxMZBY2vQc0S+n/f/
	EYdNB5Cdm1Zocr9tW97T0cxeQ0WEWUd8uVX4VjqI0hpNRSjBJRCtoKTB03j6Z/Ki
	naEIwg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cssu51f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:24:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f08560ea44so11935996d6.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524256; cv=none;
        d=google.com; s=arc-20260327;
        b=lhz+8zNm9O6LqXz2vKlQ15/O/y1VP9OwSypur850GmiflCjt0EmUncr9me5vxOtOuq
         1D6TvryeGm/WOicJvGzl9JRZrSKb48cGasfQm/SMpRmIsr0l40W7ZY0KenXFxLpfi5+i
         64x0TnFWErJxDIwd9xhbXAwvSKzv9yc426cZGuK+/DPAbWsKOWT57i+KyQxqs13jX3IQ
         EuzNEWSNbuFOctJN3bLDOhxJvhz7OPDvWUvpsZ3aM0LrdRlMYYOzmtiJuht+hw4/rJT4
         cNqTAJ865afgosFmx9kTIAOFKo2CtLaUkGq5d19bIma0hmc8s0CCECePcKekA2kjtzas
         GtCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=;
        fh=/RLDX/DbT+QAzY90jBoU/3ZsXMacxz3xlklSl1pk+GI=;
        b=MyvMzLPmGZzXzYXMHjCTqBIOpsQQtQA12FcBc4qXdcKtmtX7KMGoCq4PMYDVcHFS/s
         s7t6QgPqGOfw5eXydC4tNTyC+RY6OZO7s05F13jY6no4/XS2pMIaXP97tVU0+1Snl0x9
         2XFk/CcNS0/Jngtqa1YWkCVH2PcXrt5kRW8P0hhNds7wVmJjqBl05rgJDhsXRkoHkMge
         hMk8h/Ws1Ja2qhfqtY2XPuvn6UU0ghxrMKsqP+mJqCbxi9rYsdPac240wAQHu6n8WCbL
         Fdv6isGNLu73Og//BzjWQ9rw06wQmta7p15ZMT+DDWGS5W6qYGKDlNqK4mqGxsNFIOqG
         184g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783524256; x=1784129056; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=;
        b=d2r8VGkeAH+lwaWwky4muLFcUTtXmnSE+3oojBCWydYTpy1wBibstTsVoZrc4GGb0y
         P+Np375jyxcnBh6SARZWI3DPcCs1TnFLQY5LCGsHFgZXuDx8yrXhUgj2kslfBJek9rA1
         yDkUOH2/v7Lkjkt2wIz+4Mi8PCu683IWkNeZ9QWPdaYyuo8urN8LgSyM5fFOt+QMmJbZ
         +a2CUpL5p9DRWOIFuOCOnXLoJ4RSmz6uvNwqjIpAaWk3W7arKkhrjvoeXBvxcAQ7Fqsj
         urmb79UJjIrej4T+go2t363NRX5tmS3lOTzJoktoXKOOIrW2f49ocEzB58+zFZPKcnCH
         wjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524256; x=1784129056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMJCbXSgt5kAQ4lY2HA7hGLs+5rsBULHk8Vjj77tBIU=;
        b=FF8ASnHjGXil6J5l4fVagcRC3rNJeaFUmIS6YvnfDGgYHmuHfh0ITHOy+aqceL4Fbi
         nRS5+iummxifnVTu8vgbmzV5lRJVkl8xo+0svky+EYRSo5ZlvuFntOwocHbg/77+6X4I
         B0PsEEciSodE3tmcbyTNfwm/ldnTyMUeKWrlaq40v/BoY0OEKjb/RCPHFXjoMdpk2cPq
         qHYgsyg7FhYBqvejJOlb21LN62SWkjjIt7PoF+bPXxa/y028iGBNUdyxQHf2ZQUhOlkQ
         V9so973oBXnBXDBVD1bnUuu4G7khTk2wdmZ0WEtBe2WpGXv3oiw3J8+buWNisJA33MYS
         7KiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSMbmMDI0ZygxHjbNUrlZIpyT/ulXJjAJ2lWD0yXBBj83CPNBvbAchuecoetO2cWvQ9TtkDsaGtpa0@vger.kernel.org
X-Gm-Message-State: AOJu0YzePYkqFzBMDvj1i5F264FkOXyaW8OCLH1EstV/xeXnSjo+QRds
	GvpAf5TjGAhzMKSi++xyBV/61yNdtQI1vsQkQCg2l9uq6NPOP9c9t0lmUEwACv8kwrqL9S4C74o
	OmphxY0D//EOnYczyMpXks/0FPO2jOrsRizon2SBoXOMeNMWwRavCf94DxUy7+qfrbsbbkRnnr5
	amyslgqcz454HdqndrzPRsinyxgR7fidDeAnspPhA=
X-Gm-Gg: AfdE7cmlatwN8uZTG8gZVnhyWAax4KK5z2R4Z+bsSOfKOxGESPl34asg7SlOD8HPjrr
	AMh/h0zw9gO7Hjuoyx0FzOQjAGt7ubT/MIqauqzezysxrijOvj74cHRu6+ILqTcv9pql61+k5H7
	Og53AmA2CdNuSWQfKc0pZ/U66JwkH8crpRTXk9hX6kKmavRaabKccrv+NUcCIg6fGKf2WU
X-Received: by 2002:a05:6214:5504:b0:8fd:6df3:b377 with SMTP id 6a1803df08f44-8fec323e5b7mr31147426d6.59.1783524255411;
        Wed, 08 Jul 2026 08:24:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5504:b0:8fd:6df3:b377 with SMTP id
 6a1803df08f44-8fec323e5b7mr31146966d6.59.1783524254959; Wed, 08 Jul 2026
 08:24:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613070116.438906-1-midgy971@gmail.com> <20260613070116.438906-10-midgy971@gmail.com>
In-Reply-To: <20260613070116.438906-10-midgy971@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:24:04 +0200
X-Gm-Features: AVVi8Cct2pvQNJ49kCocOmZ_g-M7AfBNrJ0WxbavryIJprjGJGNLahRi4HQp2RE
Message-ID: <CAPx+jO_2=SYo0smYzwd8T+TUtHZtgXU0dSWQgZGZ_haV3aOU_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v4 9/9] pmdomain: rockchip: Add a regulator to the
 RK3568 NPU power domain
To: MidG971 <midgy971@gmail.com>
Cc: tomeu@tomeuvizoso.net, ogabbay@kernel.org, heiko@sntech.de,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        xxm@rock-chips.com, chaoyi.chen@rock-chips.com,
        finley.xiao@rock-chips.com, diederik@cknow-tech.com, jonas@kwiboo.se
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e6ba0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=s8YR1HE3AAAA:8
 a=bcpWyJPC7eKr9KdVfhAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MSBTYWx0ZWRfX/PJVCC/uY05m
 63ozQpI5e8KeDk4V63ySup5NBjHCuaN9aBNHIDai0YGoUfCHerjqN5yZdsvfwz9tKcQt5KVhM1d
 hzcA0mRkQew/cwWdlY7zjADq4MrZfR4+BUfKH2jzbvwJ2szvY11JvbqSnc2CECIT1l6pYG5VfFZ
 4wokWaII6wodlD8rMkKTGy00anlI6yaVXlNN8LFQp3z6OIMgNF3v8lxwM2jiVm2mrsTjVQttW38
 gZVAjl1xXAVaZJfCKq2zcBuQLpaJ/ecazITgk/twvGOg3CDiVaAx5XweYLp+/uVU5R1Ot2i5BJn
 TKRS4mC4Id4P1G/QJB+/NerjQ7m1jpVA2hI+rXKVSDAWcKk/mc3vHYFMk2qfQ11WWxR7d/snaiv
 pnXoWc7p8JRJlIcbpUOPzWFva3L9WYa/yPbK4wn5svQWL0YY+H6A2EHMZo7Arl6XUROilwPLbRQ
 AeUqCgdU7amo6JXepaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MSBTYWx0ZWRfXwERZxabn9PAK
 NSnGOeXbBLDe68AlLdWnG7gnkfq9Jn/RzivtQYBeLzWUKI3t7ncXocD6VA7jsSLVGIHtSNMIehH
 MjJ/TCSKOpkFaEY/3s2Ltyqtw/H9c0w=
X-Proofpoint-GUID: Pj-EBmJ_IcIsCnRMkPXaS_z5qPJZSS1M
X-Proofpoint-ORIG-GUID: Pj-EBmJ_IcIsCnRMkPXaS_z5qPJZSS1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080151

On Sat, Jun 13, 2026 at 9:01=E2=80=AFAM MidG971 <midgy971@gmail.com> wrote:
>
> From: Midgy BALON <midgy971@gmail.com>
>
> The RK3568 NPU rail (vdd_npu) needs to be enabled before the domain is
> powered on and disabled after it is powered off. Give DOMAIN_RK3568 a
> regulator parameter (like DOMAIN_RK3588 already has) so the NPU domain
> can set need_regulator, letting genpd manage the rail wired up as the
> domain's domain-supply instead of marking it always-on in DT.
>
> Suggested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Midgy BALON <midgy971@gmail.com>

This looks good to me. I assume this can be picked up independently of
the other patches, whenever you decide to move forward from the RFC.
If not, please let me know.

Kind regards
Uffe

> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 36 ++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 490bbb1d1d8e8..19db307e3811d 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -138,6 +138,20 @@ struct rockchip_pmu {
>         .active_wakeup =3D wakeup,                        \
>  }
>
> +#define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)      \
> +{                                                      \
> +       .name =3D _name,                          \
> +       .pwr_w_mask =3D (pwr) << 16,                      \
> +       .pwr_mask =3D (pwr),                              \
> +       .status_mask =3D (status),                        \
> +       .req_w_mask =3D (req) << 16,                      \
> +       .req_mask =3D (req),                              \
> +       .idle_mask =3D (idle),                            \
> +       .ack_mask =3D (ack),                              \
> +       .active_wakeup =3D wakeup,                        \
> +       .need_regulator =3D regulator,                    \
> +}
> +
>  #define DOMAIN_M_G(_name, pwr, status, req, idle, ack, g_mask, wakeup, k=
eepon) \
>  {                                                      \
>         .name =3D _name,                                  \
> @@ -241,8 +255,8 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)             \
>         DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup,=
 false)
>
> -#define DOMAIN_RK3568(name, pwr, req, wakeup)          \
> -       DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
> +#define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)               \
> +       DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
>
>  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)      \
>         DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status=
, r_offset, req, idle, idle, g_mask, wakeup)
> @@ -1274,15 +1288,15 @@ static const struct rockchip_domain_info rk3562_p=
m_domains[] =3D {
>  };
>
>  static const struct rockchip_domain_info rk3568_pm_domains[] =3D {
> -       [RK3568_PD_NPU]         =3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),=
  false),
> -       [RK3568_PD_GPU]         =3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),=
  false),
> -       [RK3568_PD_VI]          =3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),=
  false),
> -       [RK3568_PD_VO]          =3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),=
  false),
> -       [RK3568_PD_RGA]         =3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),=
  false),
> -       [RK3568_PD_VPU]         =3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),=
  false),
> -       [RK3568_PD_RKVDEC]      =3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),=
  false),
> -       [RK3568_PD_RKVENC]      =3D DOMAIN_RK3568("venc", BIT(3), BIT(7),=
  false),
> -       [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11)=
, false),
> +       [RK3568_PD_NPU]         =3D DOMAIN_RK3568("npu",  BIT(1), BIT(2),=
  false, true),
> +       [RK3568_PD_GPU]         =3D DOMAIN_RK3568("gpu",  BIT(0), BIT(1),=
  false, false),
> +       [RK3568_PD_VI]          =3D DOMAIN_RK3568("vi",   BIT(6), BIT(3),=
  false, false),
> +       [RK3568_PD_VO]          =3D DOMAIN_RK3568("vo",   BIT(7), BIT(4),=
  false, false),
> +       [RK3568_PD_RGA]         =3D DOMAIN_RK3568("rga",  BIT(5), BIT(5),=
  false, false),
> +       [RK3568_PD_VPU]         =3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),=
  false, false),
> +       [RK3568_PD_RKVDEC]      =3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),=
  false, false),
> +       [RK3568_PD_RKVENC]      =3D DOMAIN_RK3568("venc", BIT(3), BIT(7),=
  false, false),
> +       [RK3568_PD_PIPE]        =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11)=
, false, false),
>  };
>
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> --
> 2.39.5
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
