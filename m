Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE42EF64F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525411; cv=pass; b=uCfN/XiU7F3EKu57mOcUBLvMf3i2G5kfGFRGeIE0Mnkypu0c3JUtE1ngz70veKEjmQ5JoopcLqXX3LKa9OIkEzewHFafJjT7eV1/rsDyakujQNlXzRwDyfxmS62VNoM85tXiQz3ciLLJvSRqP7X8vNjUANTUiGyIAoNSfcAI2/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525411; c=relaxed/simple;
	bh=V4fIwFsr0mLwchZrRcsUWwCmrPaULkaS8mPw6q6+HMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VS9wZJw8TbgmEafnMUCAa6ClkW31X3GOY0MwY5fV+Y4/8fZsnbHGUtG2hvN3C4e9b3h+4W9CkQEDfo9HI9aBty9JaYR330MXTQI98HMw8SnM8MFgvB+EvDl+r8bsUyM5JT1mN0HyJbzEogCZVi3HGibGDP36Y9AYxFEIDeUvojs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gpi7Z0iH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM2/mEWl; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gpi7Z0iH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM2/mEWl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3amG2727634
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=; b=Gpi7Z0iHanVc4ewT
	7FQ/iOmgIDYfQPNsLWBPahVUdstaYgfQlDtGjG8VdQQA7J4awDImmOUNWK7vXyEM
	tSCOlLcy4XHryPydn5GaRVu0CuNO/LMFBPRrPiUtLOo8SoV/IcsywNpNveG3cn6g
	VDgjqyDZIdd4vgQqIb9ZYLZc55+qR8tBPSNrjrvHWDGsX/3Tk3aD30L/o2F4t6w2
	zphI+wMiWRJYxTClL0K5W1KWq+cUBGielBfTLp041HPpIH7eneORQez1UM2tN+J/
	M9UK/hSLMSNSRYjxhJwXnpci8Kuk8ap5IbJmXjvS3+m3abiBsrAgD6FN7RfdohoZ
	qd31EQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6abe2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:43:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso15329341cf.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783525408; cv=none;
        d=google.com; s=arc-20260327;
        b=iujgo6t5hmme5acu7+yQaR6HBIV2/XgfKwv3ZW+UeFE4pmSTy9uef36X0De9KjhA4T
         BOQCabj1Dk6AcetxiFtWQRqFKsqFVQ5EIl/LXI/uNMIv2ytmm4d4xXXVqhxiInR+wADO
         nRieMvYYb6/2J1v0KijczaViccMSXwV/9dOZrLcntESxz7XRJYIpoDaNkQaoLKMVRzhQ
         PMx9q65nnt6hF1vdFjunqK9RUBt9DyD5AHNUXC/9f3hL8ge35ucYScaDuSWgVEzYVpxZ
         8fawmZMwaHvggImT4umwhHZRFC5dJZWWsEtHfeygkKJGxaau3mdpfDA8Px/1qWnl9yVV
         /AvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=;
        fh=Zt5wSmFUdSR57Jerc7aXQ3s2wyE9C38SGEWd6G7M50I=;
        b=iVY13IEM4wj0023ZtFtmewRla272T6zp19HQ5qEWb1jik/d934AwRM3WcQ/UzeitO5
         37FjVIwowGSFD7j5Kbq5Mie52Fxf6gpK7Vej2nx46X2VsOo+DBwMrdEbfxNzwPmJsUdm
         /9VUKUuXRjlQ+XwlRDR2IcyfB/hCXtG7w+xjU7hGLGO9SKAO72Lb7FAEw9QbIOPgHhVX
         r7wcHpE9iy9+frv2KJVspwQsLJ7G1H+skJMGT4umqVJxmziwCFTeMjSfZy7ebV9MlCvD
         KUqDi1WYUbAMO4r8kgtfnyCT8I3Wlz2dKVMRG3+gWCtIJiZWYekCY6DUnMLc5BaDiCAA
         IpyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525408; x=1784130208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=;
        b=OM2/mEWluCLsPbJC8eIOIzkXxij8UmJLfKyByk4qPV+sbPUyOqlm2t8vw//uyQWdn0
         Jq/rCWZxjVdCR+aGScQYfn0NDTftMWXaKVCIUN07zb7WBTeYwLMxnmO3Sa8duSlE+L+Y
         TABXd/t4XHU/YxZVu9YWx2n9+vQs3PU3gRPlpV+C/yyP80d+pAfX1kXrt2L6M7Ga/g4l
         R69vxny18tFaPVR8wAJlE72VK4NroHHWfw/rHH57FP+qpPG6TDmCdjQ1no5QykXRJnxE
         uqTijfGiYpIaxlxDgRFvXKT4evug4QCsD6UkG91i6lcLwiTQTDUo8bVTYvYT4rp3dws2
         psOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525408; x=1784130208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=;
        b=Id5NcxU2hzDj/E6TottcnTyyD6Jbx2oootkWjHOWBFYD4JLwrCoQ+ykK03MJ93ogCB
         ApKitZTJQLvd7mq1BVCWeew4PdvhnhA82GAwgXaSPyyiJpZDVnLSAB5hotiNMe0hpED2
         +18FS7uC7k8xB/boXcHOO4tAATlVk4C4lbL3MG91GsRN1+w3lxrzddgd90aCg4dpfG7w
         MkiMF05KlQ1fRtVYhfhW/scEbGLaU3wNqXFtVR5jqrz6C4Wz1UAIs3sauRH7Pulr1W+i
         M7M338GT0v0NSD2t5LLVyis+s1kXzOz1xtYtojBIPpMTQR/bdya/YcLM2HF5/3ETTnBf
         RZPA==
X-Forwarded-Encrypted: i=1; AHgh+RrGPMNibGS5sNz5bHEyoBRy+kGzhyRJogWxMR0NWvKkVt2QMXnm3nxN9PeFo5Uq8xW4nd2WzTxMua0P@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4YJo9d+xQ0Cmb6Ud7c8lrMIfxEOliYtTAj2TamXY9Bb3wk6Q3
	FMEcvWLvhikbGbqAPTJAhf0FAiwAe2QLcB+WFaOtdynyxtm1RThIjKgB3uTeEdqDfWlrcxpOaqn
	MEKbr898OMz3TLdL1S+qMY55+N8dStk0e5xORN85bVN5PYmI5FxYocRY5/behdNmGoVRtRubt5i
	Hrb2fgtX6vARWXqUhq2nxEfjIxjdgtFPfpY3i/xrA=
X-Gm-Gg: AfdE7cnocGyYyEZpZM2smP8vSB2fxbekK4GZKnjzd2aURHTn4LKt5QIMFYr0Q5EckKF
	o2BR3AZkTnSejzp6GHLNn1+JG6gsmXVM5jECJmOo7rtY4WfGmj19RsX06PDEZbYdumljBr2JklA
	9XkZUpoM2cs3oJo13v3AK+g1ueX/2pEh/EVa3OYhgwxX8YDFMTWT2ZMnFdq1z3pT/LYfEa
X-Received: by 2002:a05:622a:4c05:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-51c8b398897mr31023951cf.11.1783525407762;
        Wed, 08 Jul 2026 08:43:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4c05:b0:51a:8b64:69e0 with SMTP id
 d75a77b69052e-51c8b398897mr31022071cf.11.1783525405268; Wed, 08 Jul 2026
 08:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org> <20260618-ux500-power-domains-v7-1-v1-6-eb5e50b1a588@kernel.org>
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-6-eb5e50b1a588@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:43:14 +0200
X-Gm-Features: AVVi8Cdq0rtjAP0YSg4WhxzCqmLPP1um1vAPUHWXvoo9MmpPquQaWcjqsUHRPk4
Message-ID: <CAPx+jO-teiu9vQfw+MeTbixH4PnARaqSC+_7bvHUMAAEPqtDaQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] pmdomain: st: ux500: Control DB8500 EPODs
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX7RcwvzKTwGbf
 RafiC205eftjittxwt1WEUIuQpwZmcdPZFmoKWIYArL3NgpZ8rjbsbgCE4nw5AP4kPhUketUvLe
 6G8Io6I4+UVDf84a0SEZKPjeYWUjtkKhUaHM1jDmVYdCxApj1UdGSs5tYHrxA1We958gzUwV7Cq
 3LYmXG4XB3mpC6D1Se810IstXB6vO270NWS6sA7SYgLFXQqPIsH8fNyNFC9SS1MN83GEsmG5kmz
 zFHkKQpmf/ThYbuvJ36i6cM5g/RAVOm55l85fsBTf83iJM+fUOabRO5lmK6/Y7nLIN8bn0oiD++
 bLqVcnIz6p6FMfckLYqXjeE6PLGQQnMbsJcIANV8/mBU2DMasx/y3sb1mai3OZcivd0dGLZmohv
 AQPXjlb5SzucDqOMgTlDuy3Cvz6h2bYq4ovNK4ZzJHJ9nZbxIyuKOkbnjso2K9qfWhTcStJ7sFJ
 S+WAXk98IlHnFfL1ohg==
X-Proofpoint-ORIG-GUID: Q9K4uRIcz_LwTSoM8QnYIVFClmYKV66v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX4S0fRWSwn9Bv
 UompanaLRdxQQnaZS+jy4kG3FsUFloN6nSC+VXaIB2x2lzwsc7ZPlOwobyfWjAZvRK5RhSnFt8T
 G9D9MI137xUYS31uR5KM5j9KeavYpiU=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e7020 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=-O4hDVTBhx9-GJANRbkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Q9K4uRIcz_LwTSoM8QnYIVFClmYKV66v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155

On Thu, Jun 18, 2026 at 7:01=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Move the DB8500 EPOD state handling into the Ux500 power-domain driver.
>
> Keep the old regulator driver mutually exclusive with the pmdomain driver=
.
>
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/mach-ux500/Kconfig               |   2 +-
>  drivers/pmdomain/st/ste-ux500-pm-domain.c | 380 ++++++++++++++++++++++--=
------
>  drivers/regulator/Kconfig                 |   1 +
>  3 files changed, 282 insertions(+), 101 deletions(-)
>
> diff --git a/arch/arm/mach-ux500/Kconfig b/arch/arm/mach-ux500/Kconfig
> index c18def269137..56636c993f49 100644
> --- a/arch/arm/mach-ux500/Kconfig
> +++ b/arch/arm/mach-ux500/Kconfig
> @@ -26,7 +26,7 @@ menuconfig ARCH_U8500
>         select PL310_ERRATA_753970 if CACHE_L2X0
>         select PM_GENERIC_DOMAINS if PM
>         select REGULATOR
> -       select REGULATOR_DB8500_PRCMU
> +       select UX500_PM_DOMAIN
>         select REGULATOR_FIXED_VOLTAGE
>         select SOC_BUS
>         select RESET_CONTROLLER
> diff --git a/drivers/pmdomain/st/ste-ux500-pm-domain.c b/drivers/pmdomain=
/st/ste-ux500-pm-domain.c
> index 723001004690..1cd5b4985db0 100644
> --- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
> +++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
> @@ -6,172 +6,315 @@
>   *
>   * Implements PM domains using the generic PM domain for ux500.
>   */
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/dbx500-prcmu.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/printk.h>
>  #include <linux/slab.h>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/pm_domain.h>
>
>  #include <dt-bindings/arm/ux500_pm_domains.h>
>
> -static int pd_power_off(struct generic_pm_domain *domain)
> +#define UX500_EPOD_NONE                NUM_EPOD_ID
> +
> +/**
> + * struct dbx500_powerdomain_info - dbx500 power domain information
> + * @genpd: generic power domain
> + * @epod_id: id for EPOD (power domain)
> + * @is_ramret: RAM retention switch for EPOD (power domain)
> + * @exclude_from_power_state: exclude domain from power state count
> + */
> +struct dbx500_powerdomain_info {
> +       struct generic_pm_domain genpd;
> +       u16 epod_id;
> +       bool is_ramret;
> +       bool exclude_from_power_state;
> +};
> +
> +static DEFINE_MUTEX(ux500_pd_lock);
> +static int power_state_active_cnt;
> +static bool epod_on[NUM_EPOD_ID];
> +static bool epod_ramret[NUM_EPOD_ID];
> +
> +static void power_state_active_enable(void)
> +{
> +       power_state_active_cnt++;
> +}
> +
> +static int power_state_active_disable(void)
>  {
> -       /*
> -        * Handle the gating of the PM domain regulator here.
> -        *
> -        * Drivers/subsystems handling devices in the PM domain needs to =
perform
> -        * register context save/restore from their respective runtime PM
> -        * callbacks, to be able to enable PM domain gating/ungating.
> -        */
> +       if (power_state_active_cnt <=3D 0) {
> +               pr_err("power state: unbalanced enable/disable calls\n");
> +               return -EINVAL;
> +       }
> +
> +       power_state_active_cnt--;

The whole power_state_active_cnt thing seems to be a leftover from
debug exercise, no?

At least, I can't see that it actually adds much - or maybe following
patches makes use of it somehow?

>         return 0;
>  }
>
> -static int pd_power_on(struct generic_pm_domain *domain)
> +static int enable_epod(u16 epod_id, bool ramret)
>  {
> -       /*
> -        * Handle the ungating of the PM domain regulator here.
> -        *
> -        * Drivers/subsystems handling devices in the PM domain needs to =
perform
> -        * register context save/restore from their respective runtime PM
> -        * callbacks, to be able to enable PM domain gating/ungating.
> -        */
> +       int ret;
> +
> +       if (ramret) {
> +               if (!epod_on[epod_id]) {
> +                       ret =3D prcmu_set_epod(epod_id, EPOD_STATE_RAMRET=
);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_ramret[epod_id] =3D true;
> +       } else {
> +               ret =3D prcmu_set_epod(epod_id, EPOD_STATE_ON);
> +               if (ret < 0)
> +                       return ret;
> +               epod_on[epod_id] =3D true;
> +       }
> +
> +       return 0;
> +}
> +
> +static int disable_epod(u16 epod_id, bool ramret)
> +{
> +       int ret;
> +
> +       if (ramret) {
> +               if (!epod_on[epod_id]) {
> +                       ret =3D prcmu_set_epod(epod_id, EPOD_STATE_OFF);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_ramret[epod_id] =3D false;
> +       } else {
> +               if (epod_ramret[epod_id]) {
> +                       ret =3D prcmu_set_epod(epod_id, EPOD_STATE_RAMRET=
);
> +                       if (ret < 0)
> +                               return ret;
> +               } else {
> +                       ret =3D prcmu_set_epod(epod_id, EPOD_STATE_OFF);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_on[epod_id] =3D false;
> +       }
> +
>         return 0;
>  }
>
> +static int pd_power_off(struct generic_pm_domain *domain)
> +{
> +       struct dbx500_powerdomain_info *info =3D
> +               container_of(domain, struct dbx500_powerdomain_info, genp=
d);
> +       int ret =3D 0;
> +
> +       guard(mutex)(&ux500_pd_lock);
> +       if (info->epod_id < NUM_EPOD_ID)
> +               ret =3D disable_epod(info->epod_id, info->is_ramret);
> +       else if (!info->exclude_from_power_state)
> +               ret =3D power_state_active_disable();
> +
> +       return ret;
> +}
> +
> +static int pd_power_on(struct generic_pm_domain *domain)
> +{
> +       struct dbx500_powerdomain_info *info =3D
> +               container_of(domain, struct dbx500_powerdomain_info, genp=
d);
> +       int ret =3D 0;
> +
> +       guard(mutex)(&ux500_pd_lock);
> +       if (info->epod_id < NUM_EPOD_ID)
> +               ret =3D enable_epod(info->epod_id, info->is_ramret);
> +       else if (!info->exclude_from_power_state)
> +               power_state_active_enable();
> +
> +       return ret;
> +}

[...]

>
> +static int ux500_pm_domain_add_subdomain(struct generic_pm_domain *domai=
n)
> +{
> +       return pm_genpd_add_subdomain(&ux500_pm_domain_vape.genpd, domain=
);
> +}
> +
> +static int ux500_pm_domains_add_subdomains(void)
> +{
> +       int ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sva_mmdsp.=
genpd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sva_pipe.g=
enpd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sia_mmdsp.=
genpd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sia_pipe.g=
enpd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sga.genpd)=
;
> +       if (ret)
> +               return ret;
> +
> +       return ux500_pm_domain_add_subdomain(&ux500_pm_domain_b2r2_mcde.g=
enpd);
> +}

We recently added a generic "power-domains-child-ids" DT property,
that allows us to describe child power-domains for these kinds of
cases.

Moreover, we have of_genpd_add|remove_child_ids() to easily hook them
up when probing. I suggest we use that here as well.

> +
>  static int ux500_pm_domains_probe(struct platform_device *pdev)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
>         struct genpd_onecell_data *genpd_data;
>         int i;
> +       int ret;
>
>         if (!np)
>                 return -ENODEV;
> @@ -196,7 +372,11 @@ static int ux500_pm_domains_probe(struct platform_de=
vice *pdev)
>         genpd_data->num_domains =3D ARRAY_SIZE(ux500_pm_domains);
>
>         for (i =3D 0; i < ARRAY_SIZE(ux500_pm_domains); ++i)
> -               pm_genpd_init(ux500_pm_domains[i], NULL, false);
> +               pm_genpd_init(ux500_pm_domains[i], NULL, true);
> +
> +       ret =3D ux500_pm_domains_add_subdomains();
> +       if (ret)
> +               return ret;
>
>         of_genpd_add_provider_onecell(np, genpd_data);
>         return 0;
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 87554ab92801..35d1b191462c 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -414,6 +414,7 @@ config REGULATOR_DBX500_PRCMU
>  config REGULATOR_DB8500_PRCMU
>         bool "ST-Ericsson DB8500 Voltage Domain Regulators"
>         depends on MFD_DB8500_PRCMU
> +       depends on !UX500_PM_DOMAIN
>         select REGULATOR_DBX500_PRCMU
>         help
>           This driver supports the voltage domain regulators controlled b=
y the
>
> --
> 2.54.0
>

Kind regards
Uffe
