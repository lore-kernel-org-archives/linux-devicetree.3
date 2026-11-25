Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605450;
	b=qoG//aWNZj3O7tOMBq9ZYUH/coqz/HemV8X/4VWS/kNFq13wW9ciPpLO4rjLhTS2koZJ
	 SC/1AyzJ02lbiVq0NYDrxCuaExOzSaTLN2LBouONaudtcTz3gXohXokym552UdDgArNu4
	 TwVvCLFqNX5VVscXFUsdvDaEm4nV+0R+sIC8JrusSx2mB95959IyPAp0VG/1XJnw+VTo/
	 DwkMyzHjIajHXm6P2RAuOdW/XMs7siyiqOi7smcYUGKXb17CC9tnTGD0IDVDhRGMppvn2
	 nH8/BQKhyeooBGohg3s1utmoXCuQwdpRXr7fl9mXqyi022X3iQwyYpp1xsPRVXogFZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
	b=RMmP3S1CWhjjxSU4KCqewotDwgpbSAvAsTa17vG1PLHBbFKaR93pQpuXnMzyWxntUObW
	 lRcSQc6MDBbsA8mr8BFd1atl8nYP36T0kEjIkiGwRPDwiqoYMzxmF0Yboh3zzaEhbVgqM
	 94LKpWwp2/U3TpeSLWQOPh8GU/eQUPuT2RvizgGvm8g2p1aLTB50+1KANER//p9Z9wuJ6
	 Fek7zR0sCE+gKdB/fNL4C9HRi1hr/feXWo7oVus9Ju7TQAXc6w97qfxb4eMVuMS5wfg4D
	 e/EfQFJtZIueVmCKSIbz/KEVULTSSumvemsC0aOGfIlu4Z76TvuNF/Egc2wFzlcSE0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W4jWDdVB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QKrZI4Ng;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9305A606A330
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9305A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W4jWDdVB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QKrZI4Ng
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOpG115429
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=; b=W4jWDdVB1vbwwYli
	084svRdTuIpZGcbEUnPgXFOT3xfX3COpD8NlOSCTDx5vbmO6iqlsSjsyj1d4GyLL
	nVOQ7ZWM8f0DKHclVqbU4ZkP7EVvYnnEXvT3wIzR4iDWx6pNq8Z1BIggEvUuYzO1
	GxNYOiSA7xj39P9WA85R+PuRN/T8BnNtIXrGD8KSW0aoV0KInDxHm0smhmzGphcI
	3lY13tpzpfmCw4yTAdbwxyIy0T27VvXtuE7mzUuS4uPS3QeJ/y1RC2M0RqeEGhwn
	KxzYHwGlf6NbPM8BaVxNMu7AyROhy/1HuLKSIiKuynlR62oYOUOeNrSDq7kvHR8I
	97krqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkcj13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:17:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f052777c7cso56192585ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795605448; cv=none;
        d=google.com; s=arc-20260327;
        b=pOwxmiDKEqTvHbH4N1zCUkqXJj8R+COjkS08CAnfvEAW2KrCwiZ8LXK/M4livngjfg
         1gy0elUojJtZcp0o3dz4I5KM70SAvkZ3D77PtjtVsgHJBz6uy3LkRbQWhBad4UIej5Lc
         54g2Fd+b8T7ocVvxuMRy99J5ivPLbNFO0wUWrbiFgep7ERADRN9dLV+UhFqoKT96b3X2
         qlovs8rsdNgYs2TB+iAbA42L8OvBt/wGBGROjGRM0RKxMOZaYV2x65G8331AG+7UHlby
         SzKhIPrn5ISZAR9zIwLHoD/gCoQ2MpcxJrczCAZyxjr+vu/oUUS5FIESnIkR2suocMbv
         cAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        fh=vHI0P3J9dTFI13X7vwfYz6u4cxDAC80YS88gdMiBHpk=;
        b=d9558L1IGjTUaC2eODjGprUS7Ns2YOUrHM6uD+0Yb4pyA4+wEV134asoTbsHFE8OeL
         bXSrXCAbtRb1gW/G0lYrKbYx3bhz1QdtZXJO4geLYXlrc4UHuz+tjuNmuqKX3crmttYC
         iUqrpIB5e5AnRTYj/DoCqyc9ZMO/xgejJK7JpiXr+9GIcgAgPhFN7vB77CTtj9IagJlh
         1GOwWSJ6zf18przvu3ZYesUF3UezO1MvzLK5kC9y6ZFvdQ0GHuZUmI9tTXE5VAnSte4X
         AHJ+ffe8GO7tUFTSsqjbLAiKn0GZAEN0j0b6XIPOj8IGQXJm8Nwhrkj7KjxNAU1U5wg4
         uBGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605448; x=1796210248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        b=QKrZI4NgAhRHB370rBIbBEFXiJRt9QROPd09PkqFBWsAzoWKlBdFIThs/MDYEdCSPA
         sPezC3Mh+wdHgWOLLOkO08Lx1ylLHGANQeWY4nSZtmt6GXCMw2hsFyMnPh0wZ5fQWxCn
         RKlNQfOhbztl8N7O3XdyM4PXLMzGyROxS37zsonwNnHD1MZM/u2ba/jRAks6GZGao2F1
         RdReAizJpvZ6OFoVaGQ+FKCm7gZt2CPq2GwdAdMoj8oSh8NV8yNrfLcO58J77RoXtiCN
         3WFjxQQ1pHWUyyBRIXb4Af76MTBTdVlnzLXd1lWXI80FspcDhyCTYHZXWnHdqY6O0pt4
         nQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605448; x=1796210248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGcM3DKIo02LA8xtKEqWDCXbSDDx+E/CgQ8lPKySp7s=;
        b=HtbnBZdfW2FTalGY8cgC/fmNK0kWqjcM5xVTL9zGTzehdUsVvLKlEsYe5Qgy+cibX9
         ursGbd1+mEIMpjIWqjPGVl/eH5lzMd1pm587805mPm82pdDCh362+BkQWO5jeDmbcm4H
         /L1bumttdb748yqahVL82c728TV25U+5JnjLp3d2r/yR55r9cEci90vuR35ex1AIaR77
         SZpr+CI+1j06LuLCi7YzqRlnHyHCUKV+KDaSANv7JechaKGpphxuOp3+L3Kla4kLryFQ
         HnuEGsdfkkpwq96WfysrMjIUUeFsez4tiGVYcpfIz8kkgy/2PqPVB5WQIOanmR+f2aOA
         vh6g==
X-Forwarded-Encrypted: i=1; AL+hErFteZpmd4d4dbaqTk42G097+yJIp/zgR6tNk7go2BtDg/0O9cgEyvy3qDwdCfjXg24U8mEbvzJOFFEy@vger.kernel.org
X-Gm-Message-State: APuU4Z8FUrAd2QqmTeVaqGKnyTsPIXP0vNPAZfwSuA7/G+8ato49mNp5
	cKUEdJ8wUZTDtpImXH26KisnzfZCe79H/S62pizBwtq+D9dZMgUb184DrGsmsdz4DRfo4JD655M
	y+sXFB78tQKgSj+GNNNwZ7HDO87HZtIvwLfiTy1QLQHpps5hiVUaJetGXMr7wa6DXsx7o1qMsmY
	T3GYUTOGwE1vrrmnHo1DzDeDLAiVf5wbKg1LJPCvg=
X-Gm-Gg: AZFdTZdsYsGOM4ojPMRp98isnPXvGPHGkVIiB/fJu6KErzIa+AhDPERvsCoEvkxP9p9
	AW+9DuEqZkidLEGCpvgm/IKc1cbGoLsgeGnPtEQ1tttV2Ff/9CHmDMCma35XDifJkZBrstur0Xq
	qum73awHcSW01nLoo4TabIqZfAd6Ab6FFWgKNgjfZyjQhBw51qx2fU78Mf3A==
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr17035903a91.61.1795605447968;
        Wed, 25 Nov 2026 03:17:27 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id
 98e67ed59e1d1-3b41c9b9dc1mr17035856a91.61.1795605447334; Wed, 25 Nov 2026
 03:17:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795029012.git.geert+renesas@glider.be> <dcdd928d5b89cd0a67bd8c1d3a60cf657516850f.1795029012.git.geert+renesas@glider.be>
In-Reply-To: <dcdd928d5b89cd0a67bd8c1d3a60cf657516850f.1795029012.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:17:16 +0100
X-Gm-Features: Aa3M54otUsCwPZ0NLSXUquKQv9JCjL7ZJt5maqUuGrgwo9AgbaI_i_khKOzQbo4
Message-ID: <CAPx+jO8EFFeGp5HwOEnQgR1rc--1Akz+ADOoqTjdba6Y8Hb11w@mail.gmail.com>
Subject: Re: [PATCH v5 10/15] pmdomain: Make genpd_get_from_provider() public
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Paul Elder <paul.elder+renesas@ideasonboard.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX0rD3wg7d6bXI
 R73oZRok1g36NB2YKE9GcJ6Q8V5F9xAEgeXrDH88ZvPNQX2UIaFGCd5UdgY7Bsd5k2HYO5ROluD
 tVW0CT0AzsKYs0tmNk+Ssjlm+0m1l213bEJ0qut5mWyVlZzz/ryYJ8rxw0mN3z0oO5MCCFDOQu1
 1m+zfc0F0Fd7siQYHY3db6cpJvz/msPxuVqsthiidTrc41S+GeoA92OkBnlGnN95ia2IMXxZLf/
 fJBOH8n2fok9WwrYE2alBnrRjqCVDNUjf5fxDfVt3udqraEVX3DWnVjd5vQLVS49NANGMuDCuxK
 X/5YPW0fKZvNGgVdhZ4DGPUPwEaiwxrD2PGFavaSzHsEYysPhPLz8/iXNttfkzd+YC+mj5nNxXY
 JcAdGDj6z719nSpRwFRHpJEUpRuGI6ziC+eEzquuGuVOUkZIuK125FJlQ+IUP9aT/yNX3TCODXz
 yjz1eKs9J0Fg7OYSQqg==
X-Proofpoint-GUID: wkoBaP2fHc985lq3eHlKfJUrQ5zWF3f6
X-Proofpoint-ORIG-GUID: wkoBaP2fHc985lq3eHlKfJUrQ5zWF3f6
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06c3c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=LDBv8-xUAAAA:8 a=wx2en-tew_9JlkkAXb0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfXx+f/YheYF/FH
 dO9tnNo4/yrq5qr2cb5xi12RsI8+TDOVctQk+NAf3tBhX9P49aLnhoFBlrobBUtE7IJh9rKOot3
 K9czXlDeaASpDtEBSmO/d8Vn3etlbEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On Wed, Nov 18, 2026 at 8:46=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike the corresponding function in the clock subsystem[1],
> genpd_get_from_provider() is private, and thus cannot be used by PM
> Domain drivers.
>
> Make it public, so the R-Car X5H Module Controller driver can call it.
> Add an "of_"-prefix for consistency with public genpd function naming.
>
> [1] of_clk_get_from_provider().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

FYI, this looks good to me. Will apply the next version.

Kind regards
Uffe

> ---
> v5:
>   - Add Tested-by,
>
> v4:
>   - Improve patch description,
>
> v3:
>   - Add "of_" prefix,
>
> v2:
>   - No changes.
> ---
>  drivers/pmdomain/core.c   | 22 +++++++++++-----------
>  include/linux/pm_domain.h |  7 +++++++
>  2 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index c242807f62579e5b..2a44b45955dd6ba7 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3008,7 +3008,7 @@ void of_genpd_del_provider(struct device_node *np)
>  EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>
>  /**
> - * genpd_get_from_provider() - Look-up PM domain
> + * of_genpd_get_from_provider() - Look-up PM domain
>   * @genpdspec: OF phandle args to use for look-up
>   *
>   * Looks for a PM domain provider under the node specified by @genpdspec=
 and if
> @@ -3018,8 +3018,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -                                       const struct of_phandle_args *gen=
pdspec)
> +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_pha=
ndle_args *genpdspec)
>  {
>         struct generic_pm_domain *genpd =3D ERR_PTR(-EPROBE_DEFER);
>         struct of_genpd_provider *provider;
> @@ -3041,6 +3040,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
>
>         return genpd;
>  }
> +EXPORT_SYMBOL_GPL(of_genpd_get_from_provider);
>
>  /**
>   * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> @@ -3113,7 +3113,7 @@ int of_genpd_add_child_ids(struct device_node *np,
>                         goto err_unwind;
>
>                 /* Get the parent domain */
> -               parent_genpd =3D genpd_get_from_provider(&parent_args);
> +               parent_genpd =3D of_genpd_get_from_provider(&parent_args)=
;
>                 of_node_put(parent_args.np);
>                 if (IS_ERR(parent_genpd)) {
>                         pr_err("Failed to get parent domain for %pOF: %ld=
\n",
> @@ -3196,7 +3196,7 @@ int of_genpd_remove_child_ids(struct device_node *n=
p,
>                 if (ret)
>                         continue;
>
> -               parent_genpd =3D genpd_get_from_provider(&parent_args);
> +               parent_genpd =3D of_genpd_get_from_provider(&parent_args)=
;
>                 of_node_put(parent_args.np);
>                 if (IS_ERR(parent_genpd))
>                         continue;
> @@ -3227,7 +3227,7 @@ int of_genpd_add_device(const struct of_phandle_arg=
s *genpdspec, struct device *
>
>         mutex_lock(&gpd_list_lock);
>
> -       genpd =3D genpd_get_from_provider(genpdspec);
> +       genpd =3D of_genpd_get_from_provider(genpdspec);
>         if (IS_ERR(genpd)) {
>                 ret =3D PTR_ERR(genpd);
>                 goto out;
> @@ -3259,13 +3259,13 @@ int of_genpd_add_subdomain(const struct of_phandl=
e_args *parent_spec,
>
>         mutex_lock(&gpd_list_lock);
>
> -       parent =3D genpd_get_from_provider(parent_spec);
> +       parent =3D of_genpd_get_from_provider(parent_spec);
>         if (IS_ERR(parent)) {
>                 ret =3D PTR_ERR(parent);
>                 goto out;
>         }
>
> -       subdomain =3D genpd_get_from_provider(subdomain_spec);
> +       subdomain =3D of_genpd_get_from_provider(subdomain_spec);
>         if (IS_ERR(subdomain)) {
>                 ret =3D PTR_ERR(subdomain);
>                 goto out;
> @@ -3297,13 +3297,13 @@ int of_genpd_remove_subdomain(const struct of_pha=
ndle_args *parent_spec,
>
>         mutex_lock(&gpd_list_lock);
>
> -       parent =3D genpd_get_from_provider(parent_spec);
> +       parent =3D of_genpd_get_from_provider(parent_spec);
>         if (IS_ERR(parent)) {
>                 ret =3D PTR_ERR(parent);
>                 goto out;
>         }
>
> -       subdomain =3D genpd_get_from_provider(subdomain_spec);
> +       subdomain =3D of_genpd_get_from_provider(subdomain_spec);
>         if (IS_ERR(subdomain)) {
>                 ret =3D PTR_ERR(subdomain);
>                 goto out;
> @@ -3491,7 +3491,7 @@ static int __genpd_dev_pm_attach(struct device *dev=
, struct device *base_dev,
>                 return ret;
>
>         mutex_lock(&gpd_list_lock);
> -       pd =3D genpd_get_from_provider(&pd_args);
> +       pd =3D of_genpd_get_from_provider(&pd_args);
>         of_node_put(pd_args.np);
>         if (IS_ERR(pd)) {
>                 mutex_unlock(&gpd_list_lock);
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 14e0e346c610a9a6..d65ee8b3725c1bcb 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -467,6 +467,7 @@ int of_genpd_add_provider_simple(struct device_node *=
np,
>  int of_genpd_add_provider_onecell(struct device_node *np,
>                                   struct genpd_onecell_data *data);
>  void of_genpd_del_provider(struct device_node *np);
> +struct generic_pm_domain *of_genpd_get_from_provider(const struct of_pha=
ndle_args *genpdspec);
>  int of_genpd_add_device(const struct of_phandle_args *args, struct devic=
e *dev);
>  int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>                            const struct of_phandle_args *subdomain_spec);
> @@ -501,6 +502,12 @@ static inline int of_genpd_add_provider_onecell(stru=
ct device_node *np,
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
>
> +static inline struct generic_pm_domain *of_genpd_get_from_provider(
> +                               const struct of_phandle_args *genpdspec)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int of_genpd_add_device(const struct of_phandle_args *args=
,
>                                       struct device *dev)
>  {
> --
> 2.43.0
>
