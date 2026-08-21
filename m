Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009E47DD65
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317208; cv=pass; b=Bc/z4cEMhymINeHQ2sJZw1haR14OPr0mQ21E6P31RYCH4/V7UeFTaneQaVZsdcPwxCY0f7mduR7OQli596h3dMx2MlfFnFdCmw18UdnAzGmdzBoN69ZgT1dn9TTS6ZPi3K7a7+qYnAFmLhHTHURXaur3o7Go7+pvi+R5yRtHxV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317208; c=relaxed/simple;
	bh=bbjh+lpl5kSNN0tHfy+Fh32nIkV8RW6mF8Saf7F+QN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jeucx0mVqD7AkRBYs+57b6KqWklbNOac5x/EjTB/0QC3yLdqGfzChy3Pr4lhOOWTBh+cYCDrt2LdEHGaSbHZz3mJaNgUcqU/XYSNI8jS5RKFVcCzZSYbPLemtgDqhadqnc6dD09doUm33JAG+oaaYljB2SN2beJUFIsikmJmra8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjLCozDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Es4pZzU7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjLCozDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Es4pZzU7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LColw91250382
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=; b=DjLCozDR/JQKfj0I
	LGX+gGc3nt49HwQZ7pisjID9l61OyR9AiXwfdQdk3w2Ih/2NN3h9RQINzcDmM9Wv
	NRu+VJW0CcgX+JtFpDGdkhsJ0TQda3kG9pw1xtf0Xhm6sL/v1SJk+H/yJQnX+q6n
	efNdf6UFF5YAe9aP//A8m871HS+Gvega2RMM9tpn6o5N5TU5JU5BV8SaIBd6hFV0
	kescd85G7izy8x2ojf/KldMlTTXs13DqN+52zcO6zMHat2W/3SF/kmPrBWjI3fLi
	IMu0oZbuJL6A0cZlFEwof59qO/Xfrwmwh5TUHpawHYPuH5Z1b4jt8e8mBJXDxSrc
	GvAM8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebut1c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:00:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc15155cde2so938910a12.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787317201; cv=none;
        d=google.com; s=arc-20260327;
        b=YvTpTNDk350JDcLjHwShSjdf/5gxAQJcgq4pKwkgECKghUMiecGkFYjS++4GHmRG6N
         SkiIQdfDVM88yJauOmMKKJILp/6aOvL3s5EivowSD/t8OZcRlRgHUTJ3ztU7Q/Ztduto
         T/ROF2Sl71NeYrznhCr/8/wGUoDW7fQuMKC8VKDHyEF02tdGF5SwjCtERAoW7rXybt1L
         1VZ1kgZczFLe5EhY4E0p69myG3qQZ5Ro73SvMi2KIJYkOje1iELh5Z/my8nZV7o8K6rQ
         LTL1bRJ0EGXwZCU0H/bmBWhQ8PmfoPLkkYWXieJiez4LcpOvUC0zl5/U/wQ0+oRL9zSz
         kWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        fh=c2yX3hwvOmfYSTqPoJaNQpPuCMo3l6Lkmla7NVO/Iig=;
        b=N0uEyg3XXc65Hm/fdjR88S0ivugeU2V4pAHlBgCyJd+6scpZJXHr8oPkTYPR5iiBhQ
         Xvm9alKkfyHSePEFfM8ejgYfWzttC36nmIwauyeF2BiZyZyCHzigvW6g9bYZCIl5STwy
         +ROVVEagQVlqsTDg/m/ZA1n9nQOxwjNij2aJ4xB4CAiOrxRPh7BVm9s2m3qzx5sTs7s6
         KBzgaKE0Rffl5FBm/+YXNmqhOTDI0OX+WZI6+s2hwsg5IetRqEcWvLEWb53mPJ6V9F33
         vSZsS7wpY6UbeCBuXZ2gPmdIo06lgyDR8cAjxddLyUxa5piCK5BCXRJGdrcULMBkqpOk
         2lmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787317201; x=1787922001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        b=Es4pZzU7GI5vfU686PNAlorcj8ezScbp8VXIEFAO0TbKQ9moS/2GPJzgR/VKAUpP3S
         GHkG4vI+JWGtQZ97D4ubtMfgnUqNkkw3avNEcIcisXMCMjA80ngCXqi5MTfy0zCu13Dp
         Eu3bfKS+7ma9PopQ1NmKAEChGz8WSmtTZFiWQq6jlY2hPoV4S2CbxqklC2Q0EF7DlliR
         SfAZDBQjNvspp4AUnk6CSjFjLJok6nCq5OVpe81CNVhdQNqutZ1832WlVb+llL00FJOh
         SmAn6jQoBLoq3txyq6ylsjkOx3wFdIT1B5MV77HTXUGYL+1pa+54CvHzu/jx1TdVUxkN
         263w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787317201; x=1787922001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        b=d2d0QH9x6rMXNkp4gKZ14q5Eltwc1VEFthFQDe8F5Q3eQc/lQVJUsmqonx21/DNCF6
         y4GuVnEupD+gqGBnGOgViPVE3VUxgDjXIJ/svSASQGPRFIveoXDtGwe6j49boROSYz6p
         0dmhAd1iRtFPs5fY6QhPfMvyJLXYUelEURxi0n9iuxZr27hKfUUpEOjrPRsuUrf/rC86
         hT3IP57g1GLw4VUUnJ7effr3erpd7jpeJU/YSwl6LU51YsOnq7CvDReHnzMAIktg6Oyj
         gWNs2I/gNprixjd+i/Zce11y99Uj9Z7HjveN4fUmsMCN6jVOxXgMAh6INWCf2z8vaF4K
         ruzw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3SUppBPkGfqWsVqSS1n2CWr/JVuM764iHczEPvxto9Aj488KKS7O5brIdZkr4yL7mqP9tk7XMF9/I@vger.kernel.org
X-Gm-Message-State: AOJu0YwCiuyFlMTAeUf10/U8b7YsvNNXA+xagS8wqrdgXiSLdn8euFXi
	y+Ct5P8u0I6hRLgYokG/xcmUEuwsPOggpWnvymwdv8IKQehRMJQtAthUjh0A2L+POch9Ll3Z4Xw
	+0UesjqzyM0GNdU0GB3H/T1Pm2C2WCAZiM1XGQSZc0IUhyYM0Zwdy87529MyBa6tvt1AohjJfo/
	10KEPQo5G86UCopG8lk1JBE71MbposxBwYjaCUEnI=
X-Gm-Gg: AR+sD110O9SCZPeGEF9BfG9tZlq0xgvoeS8Q8vjvSNwF1fXo9ZNc+ZtbeKMFus+aU1Q
	KMs/oPQlAuaYri7ZP3xzqGCkhi2jWizPnfpQJsEI9GHHgQCbdjSn9YsgZ1+e9xUnSUzFk+mwI2g
	L95qvWVQkqDLZZT1w5t53en/DqS8z+XpVGrPKE+KljfdYUQQYUCNqsqi4L1Q==
X-Received: by 2002:a05:6a21:6e8a:b0:3cc:51ff:c2e7 with SMTP id adf61e73a8af0-3cd3000a327mr12362756637.10.1787317200924;
        Fri, 21 Aug 2026 06:00:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8a:b0:3cc:51ff:c2e7 with SMTP id
 adf61e73a8af0-3cd3000a327mr12362636637.10.1787317200300; Fri, 21 Aug 2026
 06:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 14:59:49 +0200
X-Gm-Features: AcwNN1UMCNjGyQAbzmHsbeA8xY1dFu-8Er3YSHHLgMxcyqihdxWW5Lbpb1PS4Wo
Message-ID: <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kqJ_zb08sQpB7PC4u3WYxAeDMmdn_up7
X-Proofpoint-ORIG-GUID: kqJ_zb08sQpB7PC4u3WYxAeDMmdn_up7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5OSBTYWx0ZWRfX4HMWYQZnnT8j
 ybSm0iiEb5pwWaF3OOJ93rs4/qEP7+DQ9m531TwhHpBGLxWxc/1dYe5Iyz3Zy64rGTrd2PLA64O
 WWe9MXGnUNbmTGLKmMrv1fox/4l1euE=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a884bd2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8
 a=26vBHaLJDQanIZDXMEMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5OSBTYWx0ZWRfXxTxK8P7HDx1x
 xbqXWJQ9ej3a8mQiLBTlX2tDdric1eOXFi0iN/c+mgdZp6oIQHvnPu35cWL1oH6cFFRpBKf4FKj
 7hPXGvenIdKRwuo+4A9TtpNSkyZ0gmiqTWdj1fPqTQWOd8Cb+ArqDENhsk21VOqUY6fGHfWPRc2
 aPFChwzZAO0mp8icUKrdGTxDGr2rZY9GpSu97A2aF1QK0UvJ7h1Ut7J0djelgDoWktEupd5HpYj
 Bv9ChJNEoEHklGBPeLvazOLMScpKlhsEOCxvwwSvLE/9RP/E7fzV5FnkiZk8Dncd1yKYn6SxaIn
 VqEf2N5Xj/+LArDGm+G1pDd3wk1kwawi77STpUaoxqe33ddWMzHOaej2ClQw4yAtmfxueNbDyu3
 N/tWWhw8si4CMrx8NiZlXOY24tV7EPor7yQ8C1NFd0oQtkVIezzfrRhV+HNfWdP5zmto9rDufQ1
 175z+AuQP3/x0DJZC8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210099

On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to several
> drivers attached to a single device node.
>
> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
> PSCI child cells. As the first user, register cpuidle-psci-domain as a
> child cell.

I don't think PSCI should be modeled as an MFD device with childrens.

Instead, this looks rather like a better fit for the auxiliary
bus/driver. Please consider using that instead.

Kind regards
Uffe

>
> Update cpuidle-psci-domain to probe as an MFD child and use the parent
> PSCI node for power-domain traversal.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/cpuidle/Kconfig.arm           |  1 +
>  drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>  drivers/mfd/Kconfig                   | 12 ++++++++++
>  drivers/mfd/Makefile                  |  2 ++
>  drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++=
++++++
>  6 files changed, 60 insertions(+), 8 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe67f7bfa44c..0b6e4f89f319 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21671,6 +21671,7 @@ L:      linux-arm-kernel@lists.infradead.org (mod=
erated for non-subscribers)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/arm/psci.yaml
>  F:     drivers/firmware/psci/
> +F:     drivers/mfd/psci-mfd.c
>  F:     include/linux/psci.h
>  F:     include/uapi/linux/psci.h
>
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index b88b01aa5829..c5ecca0d7397 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>         bool "PSCI CPU idle Domain"
>         depends on ARM_PSCI_CPUIDLE
>         depends on PM_GENERIC_DOMAINS_OF
> +       depends on MFD_PSCI
>         select DT_IDLE_GENPD
>         default y
>         help
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3..a2d01810f295 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -17,7 +17,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/psci.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
>
>  #include "cpuidle-psci.h"
>  #include "dt_idle_genpd.h"
> @@ -122,14 +121,9 @@ static void psci_pd_remove(void)
>         }
>  }
>
> -static const struct of_device_id psci_of_match[] =3D {
> -       { .compatible =3D "arm,psci-1.0" },
> -       {}
> -};
> -
>  static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  {
> -       struct device_node *np =3D pdev->dev.of_node;
> +       struct device_node *np =3D pdev->dev.parent->of_node;
>         bool use_osi =3D psci_has_osi_support();
>         int ret =3D 0, pd_count =3D 0;
>
> @@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_dri=
ver =3D {
>         .probe  =3D psci_cpuidle_domain_probe,
>         .driver =3D {
>                 .name =3D "psci-cpuidle-domain",
> -               .of_match_table =3D psci_of_match,
>         },
>  };
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f..d18655d76172 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2374,6 +2374,18 @@ config MFD_KHADAS_MCU
>           additional drivers must be enabled in order to use the function=
ality
>           of the device.
>
> +config MFD_PSCI
> +       bool "PSCI MFD for psci child cells"
> +       depends on ARM_PSCI_FW
> +       depends on OF
> +       select MFD_CORE
> +       default y
> +       help
> +         PSCI MFD registers PSCI child cells and exposes them as
> +         platform devices. Child drivers are probed only if enabled in t=
he
> +         kernel configuration. Select this option whenever a supported P=
SCI
> +         child driver is selected.
> +
>  config MFD_ACER_A500_EC
>         tristate "Support for Acer Iconia Tab A500 Embedded Controller"
>         depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 72d3944b0ad8..f3edfad702ff 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)        +=3D exynos-lpass=
.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)        +=3D gateworks-gsc.o
>  obj-$(CONFIG_MFD_MACSMC)       +=3D macsmc.o
>
> +obj-$(CONFIG_MFD_PSCI)         +=3D psci-mfd.o
> +
>  obj-$(CONFIG_MFD_TI_LP873X)    +=3D lp873x.o
>  obj-$(CONFIG_MFD_TI_LP87565)   +=3D lp87565.o
>  obj-$(CONFIG_MFD_TI_AM335X_TSCADC)     +=3D ti_am335x_tscadc.o
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> new file mode 100644
> index 000000000000..7affd6bb09dd
> --- /dev/null
> +++ b/drivers/mfd/psci-mfd.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mfd_cell psci_cells[] =3D {
> +       {
> +               .name =3D "psci-cpuidle-domain",
> +       },
> +};
> +
> +static int psci_mfd_probe(struct platform_device *pdev)
> +{
> +       return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci=
_cells,
> +                                  ARRAY_SIZE(psci_cells), NULL, 0, NULL)=
;
> +}
> +
> +static const struct of_device_id psci_mfd_of_match[] =3D {
> +       { .compatible =3D "arm,psci-1.0" },
> +       { }
> +};
> +
> +static struct platform_driver psci_mfd_driver =3D {
> +       .probe =3D psci_mfd_probe,
> +       .driver =3D {
> +               .name =3D "psci-mfd",
> +               .of_match_table =3D psci_mfd_of_match,
> +       },
> +};
> +
> +static int __init psci_mfd_init(void)
> +{
> +       return platform_driver_register(&psci_mfd_driver);
> +}
> +
> +core_initcall(psci_mfd_init);
> +
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
