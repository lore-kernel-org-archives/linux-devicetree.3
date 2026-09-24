Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5EB493643
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257518; cv=pass; b=LEc3EW+1xjSQy3bagVXYPnpcv0O0uqWU30rhPaXpM1q3CW/DY8okAuqugKEvtT1VTRNoizHx0/NgY6UB4IjjXv1tEbF/gjV2C+FeeHz2O2wVk8m3AX+VR4gOG7ehfqaUt2wlyGKP8XpwgD3mV3VMiFvRPylcqKbmuTCM3vd1VHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257518; c=relaxed/simple;
	bh=VxTD9bps2tmguob1h0DU6BbtFrs2Bck4jQrFUdaM7uY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIs6N4Sn+BHohkffkWJ2cR2xXFCsr00c8Y4co5u5d0cEVk4OanCgtWgrgdLYx8xeHuPTz7eisBS8T3XZtRT5KXXA+YQi6fBjcVfwSMMpIwro03x9HqhUHq5BTxQyUkTkDv6vNkyy4wsPblfve5VzXqqsFP+o0UqpTaJon4fzEAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXNqTZaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JY9ULeqQ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXNqTZaW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JY9ULeqQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4W8o3134060
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=; b=OXNqTZaW1hVXUEuA
	RpbpIDZ5ZyZIMz5G3cp/uC/FgcuVeu3hcEkHU+lrs0zGQ9LslzczkcYpfSViC2pQ
	HDAj2sS5zlACKFUS3vuWUqwcHy/Pirw2f88NsGnJYR7H0RLWPSY9G/qjBuA7oVxg
	r7JUkZP6oRWhIYTIB6Dlxk0JYowYsovizQ5kDwCHxSzWKeHWGpUMjP2vryZbILNt
	p4jOnHT3okmy53j8LtMoyl+sGDCmTjkISbe/J+tNphd93NjcoU2TBMXKYrYszQ5t
	96fw3+VpQemov/UV82Yj085pC3Ts6ZG23ZZMYfL+KsMe2dJihm7aww+cvUEExwLZ
	/JxeBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1ragvt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:45:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df5a65671eso12220045ad.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257510; cv=none;
        d=google.com; s=arc-20260327;
        b=R0ywkGHtdiqvdOYnYMgy7a30LgHJS7Q48UJ2YQEJjBcvDu5yKO4/7GlB9f1+yIgBOY
         XtLpE7oGKe4EN7g+hSwn33PFxS2tIIKOvAuYUP8p68AgIOTqu5IE5B1ySa9FNSFR9aub
         OUAMh1kqw8mFGG9JU780kcsOhJeQyR1lpWls7Qen7vB4011ZoBNeDRoVKWxsHTYpoXVg
         qaGWxa6GdpGsy5p5u+aNn5Y7MluJPPzJD+khHVttsYXr/PTwMS8bpGn1ofzz7TTJEBnR
         RFe7qvEGgQ1LsL7BTXGvVVg16aZAUfDu8q2+lj0hJ/pBdIqOwKA3zmwFvyJOTEbl7Pwv
         PrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=;
        fh=UxJXZCW8366tnkV4wb2urqRfnvLz26BwLXLx1QR/TQE=;
        b=WBnI9Xd3P74RRiIj/wD+nZHqfbGLIH5a5TxW6MuAQvwKozJ32bYzwGkxomjxKkmxEH
         kTjQ/qcsMeSBoXNqWAGasOtZ0qmyZIyfo13qu7cv1byi69Rj0JqSWOHVD2MMj67D+RG3
         wcVibp5/v2OnlRnypZXoOB3BTBlVe2Tyk4l13nsaK9H69IIAX39QA3m2mdW02RY2rTvt
         mBq5e+I+ptgRWo2k8YShbHlXcRSOR7q7hHXHlWPMERnNODpJkI8ZOVowQ94NcO+efQei
         aVDngUWJthM++LF3fnVXXmrjZRpb614AGOZouzheFKO8mGh2gPAX8QNAElBUEAfllnS/
         08dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790257510; x=1790862310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=;
        b=JY9ULeqQf4WDJl7hRLUPNcJW/pFXdxZq05HjylkR0v4cB/oh+4TbWjXYzaq/UGPsn8
         6ZOGjC98a358NTSg/rg1PnsrnG18fIlOuiUK+yynLF0j6B+BIVyybcC0m+myaUt7aDyA
         naHumX6LXOv+Y6JTnkwdC5I0TGlLZTKLV7NzNdO3INHB7c9BImob1eSfWMNG+4R2yKMp
         AO3fManve1qDQod+2canUkb2NCuMhtXBTSuq+Epq843EOjMMSIfVLJiM7C0NLJWyffx+
         tyzkurISrVmqBSqwUX59j8PwfHcUl8Jl2eNPp4r56dv27xKyEz9RcvVFgm6Y6gKwRx1v
         pwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257510; x=1790862310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=;
        b=yzwUU4ApiAE8bAAzCwKdBLEZFVOwrMGWh3gUkxAyYKEJsoP5IU/OCLO4c3KtOASi9J
         tPAuAnJ2bwIkIbXWwun1P7rS5ICMYaAlahnFxa4SZOz2sqS4cn1O3uKTx4Pswj7tB1jU
         9T/UPtwb1AXBX8TkM0giehUi9ppOjI67a0l4T6VHjOhXwst/BNIqKiHo7bDX4YPwcxN6
         YNVABAnERWqpZlffVpKgOE1k5BmJPKWv2JQWGDA6A++Yj0yoYpnIZhvA851aVYWBduQo
         PqK2zBJE3bWGfQOnd5/21kRLJhSHQk2c878uqJ9eP+vi5VCKVCuLjF4h6d76S9kwfEqf
         6fcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBvSpw6aC3IcDA3k6uf9N2+iVBae8obj4fo3ub0JNy4ZG5i2JLvw4K1s+NPtUecwizYkMblHsxxa7r@vger.kernel.org
X-Gm-Message-State: AFuF++nuEOiCw6wJtfDN46rn8/NjqBN1W5ePJnrJVggP3exg2miD2/me
	cK2SaHpMhBfzSaiqfYU+ZEsRVmI/IkMQ11jqtZPzFtS1c9yHtiPfZNHBSd7RyM8EisKewMTwEmm
	TR4nQp6AGviqOM5iNmXe57/QbZgTz8ZOgdWBDYblaw3X3xb1xid3HZJO51xq9zXDPWAgjnlq/+Y
	N4xaD4TXTI3a86iWyYcvhd1/zGuxEMRvaE2ND0xXw=
X-Gm-Gg: AYBFou3MJcbjz9Yum0IVfFYMIEO430ziyi/VaXMVr2iVTmtRd9e1Qz0hOqP+5vmVV0k
	Byw50gmqVzQciB+Ls/k3C1/JRwLps5q9n/NB6NKDO4TC0LYDj3F+2WjJF70abUfLUyn1Zg3c1aG
	gunje5MRRrt6hRrGyvkfflANf25zuQG438q+1PYjfnJZdv4s0YdWc8wtNYSw==
X-Received: by 2002:a17:902:e747:b0:2df:89ac:a9f3 with SMTP id d9443c01a7336-2df89acb234mr4396845ad.30.1790257509518;
        Thu, 24 Sep 2026 06:45:09 -0700 (PDT)
X-Received: by 2002:a17:902:e747:b0:2df:89ac:a9f3 with SMTP id
 d9443c01a7336-2df89acb234mr4396605ad.30.1790257508990; Thu, 24 Sep 2026
 06:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org> <20260921-ux500-power-domains-v7-1-v3-12-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-12-9352be6b86b1@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:44:57 +0200
X-Gm-Features: AclHuK8823By2ir4rvAhJl6ftcMi5z7VMEo6jrXMBPTc2AtobSCQW7MLn1qCZ9I
Message-ID: <CAPx+jO-3aZXatF+zL=G_cG0QaSjjCPrdhpXOGZC+_zNYxjsP1w@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] pmdomain: st: ux500: Control DB8500 EPODs
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NiBTYWx0ZWRfXxpFN5dPcEsG/
 X1z1el7aphB9XYxGp9nQqPymo7F4bfiuY7Qp6R962iuamq+/y2vrAKNovZJLygGgwdHqLQM8F82
 LgDmD/qRoqMpbNRibBF6IG8qVyVmNAjn0F9EXnhrujU4V0BZTFfOb28sOOUQRkq0yZGtDlI8Apx
 U5JW59G2gnySwyEQuQ0CH6J9SbRVkqwnvh5uSG/U8maCtAA5h9i+1IW4o/Evnn+8yMnqDh/L4gy
 0GBnjU4zLiJkZCCns/IxkRWxN7vmmUs1aPWaxDq3kh2BL0ANFDdUIs7ghCrAr+G7rSny0EI72Iz
 y8nuCu6T7YyeiXxat2B7JLCF9foth0ANcgaMeux2EEQpGyCKX4oJqtNZZKpPPA70YYbPYPSMoEK
 yoFy7/jf/RTUeBt14FJaAi3kPjY47ed6Hy1IPFUJGviQ89z7RE81J63CnCuCN81eo9Qz3DYcc/1
 Ep97gtcXcEAcXY5qBYQ==
X-Proofpoint-ORIG-GUID: SlscOxu6_wnFPMBmdVYoIanBAYO9n9m1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NiBTYWx0ZWRfX6wXVTjK1k4hB
 zynWAaTBiqfewdpAdLapTRM5v5UDG4X0oeh1oCiHnB8MPtI5wcIcmWW21kfnD/UWS6C06iC71Ev
 gRp2Xo3dxBuDhRih8se8xEVoCamSeSI=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab52966 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=-O4hDVTBhx9-GJANRbkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: SlscOxu6_wnFPMBmdVYoIanBAYO9n9m1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240056

On Mon, Sep 21, 2026 at 12:49=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Move the DB8500 EPOD state handling into the Ux500 power-domain driver.
>
> Keep the old regulator driver mutually exclusive with the pmdomain driver=
.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/mach-ux500/Kconfig               |   2 +-
>  drivers/pmdomain/st/ste-ux500-pm-domain.c | 355 +++++++++++++++++++++---=
------
>  drivers/regulator/Kconfig                 |   1 +
>  3 files changed, 254 insertions(+), 104 deletions(-)
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
> index d90a563cd6f3..b31a36a4acd1 100644
> --- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
> +++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
> @@ -6,174 +6,292 @@
>   *
>   * Implements PM domains using the generic PM domain for ux500.
>   */
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
> -#include <linux/kernel.h>
> -#include <linux/platform_device.h>
> -#include <linux/printk.h>
> -#include <linux/slab.h>
>  #include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/db8500-prcmu.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/slab.h>
>
>  #include <dt-bindings/arm/ux500_pm_domains.h>
>
>  #define NR_DOMAINS             (DOMAIN_ESRAM_34 + 1)
> +#define UX500_EPOD_NONE                NUM_EPOD_ID
>
> -static int pd_power_off(struct generic_pm_domain *domain)
> +/**
> + * struct dbx500_powerdomain_info - dbx500 power domain information
> + * @genpd: generic power domain
> + * @epod_id: id for EPOD (power domain)
> + * @is_ramret: RAM retention switch for EPOD (power domain)
> + */
> +struct dbx500_powerdomain_info {
> +       struct generic_pm_domain genpd;
> +       u16 epod_id;
> +       bool is_ramret;

This one is unused for the defined power domains. Is the plan to add
support for this on top, later on?

> +};
> +
> +static DEFINE_MUTEX(ux500_pd_lock);
> +static bool epod_on[NUM_EPOD_ID];
> +static bool epod_ramret[NUM_EPOD_ID];
> +
> +static int enable_epod(u16 epod_id, bool ramret)
>  {
> -       /*
> -        * Handle the gating of the PM domain regulator here.
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
> +                       ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE=
_RAMRET);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_ramret[epod_id] =3D true;
> +       } else {
> +               ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE_ON);
> +               if (ret < 0)
> +                       return ret;
> +               epod_on[epod_id] =3D true;
> +       }
> +
>         return 0;
>  }
>
> -static int pd_power_on(struct generic_pm_domain *domain)
> +static int disable_epod(u16 epod_id, bool ramret)
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
> +                       ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE=
_OFF);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_ramret[epod_id] =3D false;
> +       } else {
> +               if (epod_ramret[epod_id]) {
> +                       ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE=
_RAMRET);
> +                       if (ret < 0)
> +                               return ret;
> +               } else {
> +                       ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE=
_OFF);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_on[epod_id] =3D false;
> +       }
> +
>         return 0;
>  }
>
> +
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
> +
> +       return ret;
> +}
> +
>  /*
>   * Apart from these voltage domains there is also VSAFE which is always
>   * on. Vape_esram0_pwr for eSRAM0 is connected to VSAFE.
>   */
> -static struct generic_pm_domain ux500_pm_domain_vape =3D {
> +static struct dbx500_powerdomain_info ux500_pm_domain_vape =3D {
>         /* Vape_pwr */
> -       .name =3D "VAPE",  /* 0.95 .. 1.20 V */
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +       .genpd =3D {
> +               .name =3D "VAPE",  /* 0.95 .. 1.20 V */
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,

Several power domains below share this epod_id. What does that really
mean? Or is this only temporary?

>  };
>
> -static struct generic_pm_domain ux500_pm_domain_varm =3D {
> -       .name =3D "VARM",
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_varm =3D {
> +       .genpd =3D {
> +               .name =3D "VARM",
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vmodem =3D {
> -       .name =3D "VMODEM",
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vmodem =3D {
> +       .genpd =3D {
> +               .name =3D "VMODEM",
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vpll =3D {
> -       .name =3D "VPLL", /* 1.8 V */
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vpll =3D {
> +       .genpd =3D {
> +               .name =3D "VPLL", /* 1.8 V */
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
>  /*
>   * CHECKME: as these are used directly by peripherals as regulators,
>   * perhaps they should stay in the regulator subsystem?
>   */
> -static struct generic_pm_domain ux500_pm_domain_vsmps1 =3D {
> -       .name =3D "VSMPS1", /* Also called VIO (1.2V) */
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vsmps1 =3D {
> +       .genpd =3D {
> +               .name =3D "VSMPS1", /* Also called VIO (1.2V) */
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vsmps2 =3D {
> -       .name =3D "VSMPS2", /* Also called VIO (1.8V) */
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vsmps2 =3D {
> +       .genpd =3D {
> +               .name =3D "VSMPS2", /* Also called VIO (1.8V) */
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vsmps3 =3D {
> -       .name =3D "VSMPS3",
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vsmps3 =3D {
> +       .genpd =3D {
> +               .name =3D "VSMPS3",
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vrf1 =3D {
> -       .name =3D "VRF1",
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vrf1 =3D {
> +       .genpd =3D {
> +               .name =3D "VRF1",
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };

[...]

Kind regards
Uffe
