Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493720;
	b=xqNX+yWWdNcfRbQDZZwcNGedF0Zibjde/IfkPY7fLHmzEe5n/N/Z82Z484cLWpH5aXkI
	 wKIrkEZpcyKX/di75vXeNxGM93cqF0ytc4Hw1QKej2/Z3r/yEgS/BDisefy/4+YKLWL8+
	 4mroteYkfqaHZXKL2URNJSV9suiEW3dZNZDbdRqhtGJuJ+Vyr1NYcxbnMJRuPS5DJiOEX
	 w3KW5aa5WPSDmMbYcutO+Z52QrijIMBd03jEmYUKLjRQlzebtiAsuwKDapZ5ZrD7ZQis7
	 6aanHb6iJ9LIJYoIaU00adndwixQ+hfRf0QgQ6tejMFxK4UhIih/9Y4m8OFEo4gT8JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=;
	b=gLsuFWxvb9vaSjye0n5xVzWYLpMhyYgPUKB2xi561K3sIsxkNbOpVIxGMi0ScPKOd4Wb
	 2R495vBe6Nl+aUpLGgjhwtxSBDvznO+ooYBfSmkbuoVmzfm/aYU/WiHLJgXlLFmUIuMYa
	 VCekKQUcCWfhncB9G7ombLsiIK0L5/mq2TovIjdBZvs+DPscmiItsVUdlXniTcytmUBAq
	 LBiFRkfLal1qylorn272q5LfXMWmsiW4klj+MOAC1zrfr2SGB+HNj4P67hS6wrWajO5bn
	 H8udl/lcfmajiMf2B/h1nTAwFivcLHvm7l+0unZu2hEMLfjnq2CPCptF0LPegcgYA6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPH5P4g2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ieTi1lpZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156B606A894
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8156B606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPH5P4g2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ieTi1lpZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACE0lRK126726
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=; b=lPH5P4g2Qthn3tVI
	MqDjIkh6YFmtfdMCQB0seAxDLqgq07voAUUzsx0HXCe8mjpt0Q6C1Cd47JXGwfdQ
	BTeoIclVoDzYzMVDDoLGP4YQA+XZedprjoR8W0omZQZ4mLxQLM3Nbm7jUo22ldOw
	Kb7hdw4x8X8XnHq+tQeTuvRXKk6heAUOwqQOHQg/V+7JQFzCGYaQVCQ+oU/NXHld
	aVUKxdAN1BiEUXZTQ25CYhcod3MYy8aF/sQV538mknDkvjB8O9KI93AlZYuwkT7s
	R/UmYGaNEFHyPwkAt9scHerWa3PzlhFQXbdUiuUhjWMKRk/XwGRr0/gGLxLYNl14
	0+n4hw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09dv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:28:38 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso639482a12.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794493717; cv=none;
        d=google.com; s=arc-20260327;
        b=G1UiU91I50QWr4nhdZnH3nWUZjakJx6HTQaG0ZRMkomEsjvhqOy6bx5ydHQJ6VovZp
         CjQPhTbCGrYcDae3ksqpZqefgUV/JlPGn55rufYGi/mZHTMNw2nPOzh03z8/v/gpdmbc
         /27/vnvCLdEUI2xI5Nzpbgq1hmUbDtaWZZ4tCCwshH1QaHU0cXST7R58f07Y/UKOZWc8
         RobmiRPKEJt71A2sLpCVpMgqSsVhws0QGRIFJt94gbvltIV7zDkz0zcFgNhQpDsW3bsc
         jGxtknpKI/lgmDsRMjL5eU/KTCSwbTr/4a8Ne6mKbVlPY5AL3e60dEKOtxvpYlDmQu1L
         O3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=;
        fh=lVy8IdQitKibVRu1Ld1+8Pu1Ta17P68kOiicLk1wVoU=;
        b=FOGYhN0AVhrkkMlrWrds97QDgB6KlbnvtIe3IZBE+hLeXoRpFbrUy2gC6R2TjVHF1z
         Yivkm4Mgn24ateuDwMqReyjqW+XPh6iOPwbEgT5Xm65R+ejHKDJQAvF5WvaEiK2EX+md
         GMa5hM3J6rR8/ChjA/WB2glWpvFx77ZkvUVqimP+vtwU1qfl9+Vm+LZXZt9MQvVyk6im
         +GtO1Oa0dqIthZ31ntEM3d6hG77yUK/+sna/Qll/baosX1ilQ1Kqgt6vjNmSNVk1jQRu
         CfgzLg4CqgPOpBe4W0IVooobdzr8ShtS7I7EOlm2gAjcMy88vwKl0MTDhCGdjMCS+IJt
         fC4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794493717; x=1795098517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=;
        b=ieTi1lpZz/gZ9+K02hnpe+oCwL3X39AXvGFHGkZWcTue/30AVKozTpIhRsOJe/djrz
         E6megxGmsvZx2dZc5bFo7MiI++MTxXLfnh0f8eP6WiBoKd9frhHtjJP0sjXjCeFUigQk
         UWqXMNqVpJjYcyxKywHEA6PGLrKCGJz7nHMm4WjWXr8NH3/UR+GnPYNYzN6Y5vk1LK3m
         /1cwmqlQ8CiMeu1rdXoBXTc31onFQ67YItGkXZH+wMcfIqO2jQwcH2hOJv/I8iZVoOpm
         YeMfffSxEliQ8j+T+t17JkvtqFBzeyClb9ZocX0mb6McjpGZKdreifPRoLaAAEcRaFSw
         MZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493717; x=1795098517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=;
        b=quUYO4yhkp0fMf2nmXAuMZR8T3w/oj9Rd0os8sWp3q9JBexU6zVuH8SmcjQ+sd6nh4
         dRx9W+Wp45go3j/1AgproD+jw7eGWpAjYHk0Sl2tlcEOhYvraVyElxwVmVTxUwQykE9/
         KXhu7tDgmTb6RW/bW0J5kBrqIbn+8UuCaZlN5Zy8Rt79ncotNGHMJOM56Rny44zUNSHW
         wbBVCAexq1fXWv73JOYdKxeBY9GKDQLJtC6mad4/EoVQNczf2vBFiZk7YjJREaHmQfrM
         06QQPXQIcuFmrp4MsN1y2cQd++7BoN+5yM0vifZ0iKJBryhyvhI2P1NBUOWfiBSrfBXj
         TuqA==
X-Forwarded-Encrypted: i=1; AL+hErEaIYLEquTf4OtkizNCU0VNyczVFWJ4JUDBMOc/iAc6UxRURIHTbf/lR0tYAQ747tO93Cd2ME3lzP9s@vger.kernel.org
X-Gm-Message-State: APuU4Z9D5LqCZsVrQf9lVkbenL5XMXNOGzeJpNNcGtN0TKgoQx/b4ciV
	EsprU6AqCaTQF8XmlQD4lpepxjZe3mwljfDO2ro8GKh3mppYLN5JIuPeT5wYXbVnaOQD4vDHkMG
	OoADstUHaQbcwn+KpXQp/O+JbTN+QD2HZ2HUDuBtw9YfDcf+3/4yGGzDM+luiWh1auaBQswXCHO
	mX8wHcDCsReCNf68SVk7YO0w/l4pwT76Gz2NwUk1c=
X-Gm-Gg: AYBFou3TykTh6Vpyv2+5eZJ8bsDdywQNi3mnl86aNAzy5FkfEeQBX4kiOf54vwtEcuz
	XmSBBl6NyaKpl9so4CtWUuQPOSK5n31Ye8tHVXdIW0YwcC9NWf0wWhG2VkZClaSg6jnTWzE6zTK
	jTU/wqcc618wejoHMX/hxV7WU0mm/cezZCYk5s667a88Dl7jmvNC3r8TWYtg==
X-Received: by 2002:a17:90b:55c3:b0:3a9:79b4:d85 with SMTP id 98e67ed59e1d1-3b197d8268emr2031806a91.32.1794493717113;
        Thu, 12 Nov 2026 06:28:37 -0800 (PST)
X-Received: by 2002:a17:90b:55c3:b0:3a9:79b4:d85 with SMTP id
 98e67ed59e1d1-3b197d8268emr2031772a91.32.1794493716564; Thu, 12 Nov 2026
 06:28:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com> <20261014-topic-qc_clk_dvfs-v1-5-3041b788e9f7@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-5-3041b788e9f7@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:28:25 +0100
X-Gm-Features: AclHuK-NURketk7FOpHZD6AhO-eykxqhfixKIHKsjFm9bSdW9Bd41KhgBl8UQTY
Message-ID: <CAPx+jO8RgKnZEH=H5vD2PkXU=q6n3iApgQSgDyN8YcG=rvQ1WA@mail.gmail.com>
Subject: Re: [PATCH RFC 05/16] pmdomain: core: Support subdomains without
 pstate propagation
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: NYcKpS0SEN9PWz_2PWaFdH8Sc0JSJDp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX34y/UuJxh+3W
 0kelUheXzUCI25QwFZK2tJwifxcI26TmXGsCr0OOWTdRyu+StXUIIxzu1Gu25qc7oAUegJ/CUf0
 VlbKwyhISu7Xc6s9jPlzOLcHb/ysjBBTbS1aTcrTE45GhMmiJTIKgo/3ZTcabz+Nb0jcBvu1zq2
 2wdeDrDAJWhpwozS4TuIQAN0QmsjuJALwRkex66YdmpHFUnfrfAOnCVJ2RsN2JxaoiXx6KuQNCJ
 rbp2vSqu81Uq8MXcM+N6YeFz9XlGAjenf4dyr5j/M9V/AIHHtTKOVid9Wqxdw7ElweyMY0OQYdK
 6lipGHLHqU9RBm3toAKyYM15B5rP3Ke3V2S6g/B3icfa3VuZnMrWbO8nH/+/SOiSf6YGIZzoT7c
 dxHmi4q310OHz8oINK95cHFxkxU0sBMMeDfJL8p0VC0Q8QLwaRgGLO3GP7eaMmcscTH6Qk9SbII
 +UVn+yoAdrcZHmcENzw==
X-Proofpoint-ORIG-GUID: NYcKpS0SEN9PWz_2PWaFdH8Sc0JSJDp1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX7zhs+F74SjT0
 6U15ujGSFYXouun6Q0ZySEqLY3yg41AQmHQzwenkQmaM3KNlpFQQOcmvJ9lPXrOLkVkjgxB7u/o
 tic1+hIfMnbo5gw1NmQ7RABzxXyvFX4=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5cd16 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=04sI-PGMuLug9NVl2XMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120057

On Wed, Oct 14, 2026 at 2:21=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> A subdomain may need its parent to be powered on without requiring its
> performance state to follow the child's. GenPD currently couples these
> requirements, so increasing the child's performance state can also
> raise the parent even when it only needs to remain on.
>
> Allow subdomain links to opt out of performance-state propagation while
> preserving power ordering and active-child accounting.

I assume it's intentional to do this on a per subdomain link? A per
genpd flag/bit is not going to be sufficient - or is it?

That said, I guess we may need a corresponding DT property as well, at
least at some point, right?

Kind regards
Uffe

>
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pmdomain/core.c   | 32 ++++++++++++++++++++++++++++----
>  include/linux/pm_domain.h | 14 ++++++++++++++
>  2 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 76ff0d9a229c..80ea70930cc6 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -463,6 +463,9 @@ static void _genpd_rollback_parent_state(struct gpd_l=
ink *link, int depth)
>         struct generic_pm_domain *parent =3D link->parent;
>         int parent_state;
>
> +       if (link->flags & GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION)
> +               return;
> +
>         genpd_lock_nested(parent, depth + 1);
>
>         parent_state =3D link->prev_performance_state;
> @@ -484,6 +487,9 @@ static int _genpd_set_parent_state(struct generic_pm_=
domain *genpd,
>         struct generic_pm_domain *parent =3D link->parent;
>         int parent_state, ret;
>
> +       if (link->flags & GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION)
> +               return 0;
> +
>         /* Find parent's performance state */
>         ret =3D genpd_xlate_performance_state(genpd, parent, state);
>         if (unlikely(ret < 0))
> @@ -2257,7 +2263,8 @@ int dev_pm_genpd_remove_notifier(struct device *dev=
)
>  EXPORT_SYMBOL_GPL(dev_pm_genpd_remove_notifier);
>
>  static int genpd_add_subdomain(struct generic_pm_domain *genpd,
> -                              struct generic_pm_domain *subdomain)
> +                              struct generic_pm_domain *subdomain,
> +                              unsigned int flags)
>  {
>         struct gpd_link *link, *itr;
>         int ret =3D 0;
> @@ -2265,6 +2272,8 @@ static int genpd_add_subdomain(struct generic_pm_do=
main *genpd,
>         if (IS_ERR_OR_NULL(genpd) || IS_ERR_OR_NULL(subdomain)
>             || genpd =3D=3D subdomain)
>                 return -EINVAL;
> +       if (flags & ~GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION)
> +               return -EINVAL;
>
>         /*
>          * If the domain can be powered on/off in an IRQ safe
> @@ -2298,6 +2307,7 @@ static int genpd_add_subdomain(struct generic_pm_do=
main *genpd,
>         }
>
>         link->parent =3D genpd;
> +       link->flags =3D flags;
>         list_add_tail(&link->parent_node, &genpd->parent_links);
>         link->child =3D subdomain;
>         list_add_tail(&link->child_node, &subdomain->child_links);
> @@ -2319,16 +2329,30 @@ static int genpd_add_subdomain(struct generic_pm_=
domain *genpd,
>   */
>  int pm_genpd_add_subdomain(struct generic_pm_domain *genpd,
>                            struct generic_pm_domain *subdomain)
> +{
> +       return pm_genpd_add_subdomain_with_flags(genpd, subdomain, 0);
> +}
> +EXPORT_SYMBOL_GPL(pm_genpd_add_subdomain);
> +
> +/**
> + * pm_genpd_add_subdomain_with_flags - Add a configured subdomain relati=
onship.
> + * @genpd: Leader PM domain to add the subdomain to.
> + * @subdomain: Subdomain to be added.
> + * @flags: Subdomain-link configuration flags.
> + */
> +int pm_genpd_add_subdomain_with_flags(struct generic_pm_domain *genpd,
> +                                     struct generic_pm_domain *subdomain=
,
> +                                     unsigned int flags)
>  {
>         int ret;
>
>         mutex_lock(&gpd_list_lock);
> -       ret =3D genpd_add_subdomain(genpd, subdomain);
> +       ret =3D genpd_add_subdomain(genpd, subdomain, flags);
>         mutex_unlock(&gpd_list_lock);
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(pm_genpd_add_subdomain);
> +EXPORT_SYMBOL_GPL(pm_genpd_add_subdomain_with_flags);
>
>  /**
>   * pm_genpd_remove_subdomain - Remove a subdomain from an I/O PM domain.
> @@ -3271,7 +3295,7 @@ int of_genpd_add_subdomain(const struct of_phandle_=
args *parent_spec,
>                 goto out;
>         }
>
> -       ret =3D genpd_add_subdomain(parent, subdomain);
> +       ret =3D genpd_add_subdomain(parent, subdomain, 0);
>
>  out:
>         mutex_unlock(&gpd_list_lock);
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 98aca4a4aede..322453da7fae 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -277,8 +277,12 @@ struct gpd_link {
>         /* Sub-domain's per-master domain performance state */
>         unsigned int performance_state;
>         unsigned int prev_performance_state;
> +       unsigned int flags;
>  };
>
> +/* Preserve power ordering and accounting, but do not forward performanc=
e states. */
> +#define GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION      BIT(0)
> +
>  struct gpd_timing_data {
>         s64 suspend_latency_ns;
>         s64 resume_latency_ns;
> @@ -323,6 +327,9 @@ int pm_genpd_add_device(struct generic_pm_domain *gen=
pd, struct device *dev);
>  int pm_genpd_remove_device(struct device *dev);
>  int pm_genpd_add_subdomain(struct generic_pm_domain *genpd,
>                            struct generic_pm_domain *subdomain);
> +int pm_genpd_add_subdomain_with_flags(struct generic_pm_domain *genpd,
> +                                     struct generic_pm_domain *subdomain=
,
> +                                     unsigned int flags);
>  int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
>                               struct generic_pm_domain *subdomain);
>  int pm_genpd_init(struct generic_pm_domain *genpd,
> @@ -367,6 +374,13 @@ static inline int pm_genpd_add_subdomain(struct gene=
ric_pm_domain *genpd,
>  {
>         return -ENOSYS;
>  }
> +static inline int pm_genpd_add_subdomain_with_flags(
> +                                       struct generic_pm_domain *genpd,
> +                                       struct generic_pm_domain *subdoma=
in,
> +                                       unsigned int flags)
> +{
> +       return -ENOSYS;
> +}
>  static inline int pm_genpd_remove_subdomain(struct generic_pm_domain *ge=
npd,
>                                             struct generic_pm_domain *sub=
domain)
>  {
>
> --
> 2.56.0
>
