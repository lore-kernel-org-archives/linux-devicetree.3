Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAC93382C9
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 21:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780868707; cv=none; b=d6J5RjYfTGQbH7MEH+2UWukTXhW3OV/Abd+71bMpX++63Ldoz9FmvMJTISPP/qESh+k5esqCXSXuabfdYAsQ1cQ+5dHjXBv5TZtdb/h5uGcA9yueEIbxYBJOdpar67VoWfAW2tP9wqrdxjl2jIrkTQpua94fj6cP4I0rYgOuDpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780868707; c=relaxed/simple;
	bh=+bwN3DIrr8Ncp5C+NOFj+WmoQg9K8nfxp+4DlYtqUF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdScA74s4PZQRVsyAoB3PVzc5pTgeM0ZSWGJxOP+a8c4CGVjeXA8MHvCzeMadRDmtCAzmapeCwm8gV1f6noPGmudQgqLDqsAYZjWb4mKnzqexIAUrMbdPMS5Qu4HF5gUeELp0UBSF6ggBjm2pwH6Y03ay0Kwpz9pz+kuNJ+sM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aU2bBLzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJzJkc34; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aU2bBLzW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJzJkc34"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657JM1v91437828
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 21:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F3pLuFKIhp+LSTwGdUH8utJW
	F1UNR+G2MEHT2U/zAmI=; b=aU2bBLzW8+X0m4XsOrHSN4Eb1OU8T8l9s9wWbRrq
	AtHwVrDaCIWvan4874a8wee+CW96RyyGtsbCFLZlP5DtqQLHOjsxiQ89aqftF6dk
	53Dh6qmBI6VeXoor7C0Q0oENmYZFCykPpCZM9/yDK0TDt0bXcvB2vD7LuZ1W6Ll4
	c9ocyfpAKBTp6d1FQGkQ6dHa9SdVVpyVlIa8sGjww0woX2i3NfeISfgFJVibaP9M
	iAIpoYjVmPhYa9X+9raQ1HsNHfy16SPvWZnuKiAQEG7naur2lm3QZdc/m6jNDzNL
	umMWRP6pEZZYwgPj3m4ib6G2ZtnxAUj1KFoW9QiM4D89Dg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4w5jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 21:45:04 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cff652cc58so6095527137.3
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780868704; x=1781473504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F3pLuFKIhp+LSTwGdUH8utJWF1UNR+G2MEHT2U/zAmI=;
        b=aJzJkc34OBnGP5NmgnBWxlEjMtFNLudo8v8RESEa5ABtNDJ6YX7xWu3+gytxTp4DG5
         00PGJ3HDSq47oZhCJgJIszovUMtPQDOxRWH5crXsYTLJkuzJlYGYJQaPteWvFJUEZMtc
         tsXA4vByKSZAZP6/EnkJpScIvPsI/+khdYOC17aRec+C6/NRiRS1Tl+SDBbIw81cvOJU
         xfAyhlSVqiIeMGfui0VMkWwaDFb1+Oz8lT5/CHJOLVG+YM4Z69yj+WrHMcTklaX4BZes
         /iqoDZT0t60prjW62ADwMprfFObigLM/qL8htDrJVQC7KcP2q5Thn0EWjDDKQyrFxi6O
         8G6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780868704; x=1781473504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3pLuFKIhp+LSTwGdUH8utJWF1UNR+G2MEHT2U/zAmI=;
        b=R6mhC0MN7KiaSiuPqmycNk4rxSEqggkauK29wOQ8KzMEYxz7IzlDMqPjeP83PalGbE
         mz7h8/cmWIopHnRHPuF/kOgUFTs8vvfnDeleYJFQEIKYtmz9TM9sX0kkKBYmNlAiOS2P
         NguTnHQLZPqR2iLorojyovEYjiGyOo5jwUCFy6IZt7SJGfjrnJYaiwL7g2pDC5YQ4rmk
         iIKnd0b92I0zoP+jKGeWssSqqg+RhZvKDKJxLVYuUXcBr+ge2YwQsmtoRmv2rYKnGxsG
         0XZgFsz2drAioIDlQpqbLLuftu9Q4Wzm83TGuqUEpcUAkrMEpLxxOwhxL7qmR6SNAxqL
         vaWQ==
X-Forwarded-Encrypted: i=1; AFNElJ94Z/2HvR3F5ACmJWdY1xiXbn6UYB/+DyaM1F2dYGDo1WGDDFUChgg8M17JOZgPdrduKdoxvyOwEYXY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Tlj4OrJIUuAmLS4B+3ahlG0sutkYFwd238qBSWNXrjrpu6ty
	sKde1Y+I9aRpX3+C57MzEZJsHX0BG3sCEMST4IJeTbGBJ0MdFjJQQH+sB00/Kbt3KS2F3Lf+fit
	pliInzfkEl2yimsAt32dmqvdZiCaxX6sk3EpYOdCtQ97FmqXfZTsCuOr+YosmwYjr
X-Gm-Gg: Acq92OExFoYyz5gSQGdg39PCopI/RFE7KHl5uuIdT0XvvdZzdIayH164ceY8N4iuuJH
	9BL/bCAcJcnZe2ciyZw45vhRw9TLZI3dJt61s+VILQjXWY0TkxXuZYOnDZZ4vNPgA7mbIKZs3qw
	pXbPb9YOWFZkSc77HwG2WVlYlvBAoc32KhJpETdYZYydEmFIMbCJ27SzLlCFdWq947UbzcASv6k
	C32Qb82bZb19P2Tp6yNe/dm7Etne070DfCT4GAZHrEU3q7WkRIbeuQ23bVKSBsADH6tENk7de+T
	rY/MTkYWgcExdYbg+TEnhPsZkwEcppLSRkr6DjRAMfdPLjvMDWUIuV/vblXFzilwdYO1iDcmSXu
	pOTrl9+NZG9fQUlR0FAnQwHTgedSf5KbeMT7xYYCXv9jaOHySJiYuAhRWPGAmLHnbOGZcLUR0Qv
	DdGqZig3oBOdxYV58nwJN39SV+OWmdCHjhGMYYi7WiALgXEw==
X-Received: by 2002:a05:6102:1612:b0:660:c9e5:8d95 with SMTP id ada2fe7eead31-6fefe3beb6amr6622683137.12.1780868703811;
        Sun, 07 Jun 2026 14:45:03 -0700 (PDT)
X-Received: by 2002:a05:6102:1612:b0:660:c9e5:8d95 with SMTP id ada2fe7eead31-6fefe3beb6amr6622675137.12.1780868703392;
        Sun, 07 Jun 2026 14:45:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b986c42sm3316452e87.58.2026.06.07.14.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 14:45:00 -0700 (PDT)
Date: Mon, 8 Jun 2026 00:44:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v7 06/12] media: iris: Replace enum-indexed clock and
 power domain tables with per-block structures
Message-ID: <h64x7lp43zd6ktit7t4slxlr4fprqtlaijzslpeqtxpyd6gar4@kadh2diinpmg>
References: <20260603-glymur-v7-6-afaa55d11fe0@oss.qualcomm.com>
 <20260603143718.A65981F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603143718.A65981F00893@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: -7DEEGJrRHpwBu_B435YZQDHB2i4Miqv
X-Proofpoint-GUID: -7DEEGJrRHpwBu_B435YZQDHB2i4Miqv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIxOSBTYWx0ZWRfX71gDRZKKWygG
 nkFlz6Ou/ycuECb/RU9gytoFSAO3stae3AhQtmn3KGd9QUPtv+Vzw6mxYbRj/JJAlqV5h2IiTEn
 zFipodv97b44gE659qBCYm6xrKetoGUIl8WXizPVao2bo5ra9y0vjAKMO+3rDblpAQvmJ74Tvt9
 f3etylEkGS2tdFsmIPz+O7C9c6rF780RqHhL+41tUXUYKCQjM34hpQLHcuaWYxPIoTYIs+DlGXh
 7bSvaHmZ/tVttYl33EWu2bXPWDzR4ucJcvD7amdfUKYL/p+a0qHR6ry1D1ka12e9BVkwTlbxyak
 yEOOfCBPNCIDlWSlAu7pt8BnnCG86+gCWzxyJCQplG239j3CEvODCJyxHrnDJAa6AHJut2lMb28
 jM1w5f1tYqPiYEnm6tR8WJccVWFAIPA/ezvp+4cAkx52pCilj1BLjr8/F+agY6z9poyAwu2okHq
 ZKc/KVH3qZ7vtJuRC0A==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a25e660 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XV5t3ym9ZgdjytnfEF4A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070219

On Wed, Jun 03, 2026 at 02:37:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential issue(s) to consider:
> 
> New issues:
> - [High] Uninitialized stack pointer dereference when a hardware block has 0 power domains.
> - [High] Secondary hardware cores are left unpowered due to missing iteration over `num_cores`.
> - [High] NULL pointer dereference when optional hardware blocks are enabled in hardware but missing from platform data.
> - [High] Premature OPP voltage drop causes DVFS sequence violation.
> - [High] Uninitialized fields in `struct dev_pm_domain_attach_data` result in arbitrary behavior.
> - [Medium] API mismatch silently discards additional power domains if `pd_cnt > 1`.
> 
> Pre-existing issues:
> - [High] Resource leak of Runtime PM usage counter and OPP rate on error path.
> --
> 
> commit 569dbace99d0eb806398e44f1f3dd0f46e77e155
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> media: iris: Replace enum-indexed clock and power domain tables with per-block structures
> 
> This patch replaces flat, enum-indexed tables for clocks and power domains with 
> per-hardware block structures in the iris driver. It groups devices, power 
> domains, and clocks together logically in the iris_power_domain struct, and 
> removes index lookups at runtime.
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index c2dcb50a27824..681db1da9559a 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -39,15 +39,32 @@ static int iris_init_icc(struct iris_core *core)
> >  	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
> >  }
> >  
> > -static int iris_init_power_domains(struct iris_core *core)
> > +static int iris_init_power_domains_per_block(struct iris_core *core,
> > +					     struct iris_power_domain *pd,
> > +					     const struct iris_power_domain_data *pd_data)
> >  {
> > +	struct dev_pm_domain_attach_data iris_pd_data;
> 
> [Severity: High]
> Does this leave fields in iris_pd_data uninitialized? Since it's allocated on the
> stack without zero-initialization, any fields added to struct
> dev_pm_domain_attach_data (like link_flags) could contain stack garbage when
> passed to devm_pm_domain_attach_list().

A simple '= {};' would have saved you.

> 
> > +	struct dev_pm_domain_list *pmdomain_tbl;
> >  	int ret;
> >  
> > +	iris_pd_data.pd_names = pd_data->pd_names;
> > +	iris_pd_data.num_pd_names = pd_data->pd_cnt;
> > +	iris_pd_data.pd_flags = PD_FLAG_NO_DEV_LINK;
> > +
> > +	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &pmdomain_tbl);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	pd->dev = pmdomain_tbl->pd_devs[0];
> 
> [Severity: High]
> If pd_data->pd_cnt is 0, devm_pm_domain_attach_list() returns 0 but does not
> modify pmdomain_tbl. Does this result in an uninitialized pointer dereference
> when accessing pmdomain_tbl->pd_devs[0]?
> 
> [Severity: Medium]
> Also, if the platform data specifies multiple power domains (pd_cnt > 1), does
> this logic silently discard all but the first power domain? Since
> PD_FLAG_NO_DEV_LINK is used, the driver has to power them on manually, which
> means secondary domains might never be powered on.

Indeed, both seem to be correct.

> 
> > +
> > +	return 0;
> > +}
> [ ... ]
> > diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> > index 773f6548370a2..fdc6eb68e5c78 100644
> > --- a/drivers/media/platform/qcom/iris/iris_resources.c
> > +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> [ ... ]
> > @@ -70,7 +69,7 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
> >  	return dev_pm_opp_set_opp(dev, opp);
> >  }
> >  
> > -int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
> > +int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
> >  {
> >  	int ret;
> >  
> > @@ -78,66 +77,20 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = pm_runtime_get_sync(pd_dev);
> > +	ret = pm_runtime_get_sync(pd->dev);
> >  	if (ret < 0)
> >  		return ret;
> >  
> 
> [Severity: High]
> This is a pre-existing issue, but does this error path permanently leak the
> runtime PM usage counter and leave the global core device forced to its highest
> performance state? If pm_runtime_get_sync() fails, there is no
> pm_runtime_put_noidle() or iris_opp_set_rate(core->dev, 0) called before
> returning.

I think I saw patches fixing this.

> 
> > -	return ret;
> > -}
> > -
> > -int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
> > -{
> > -	int ret;
> > -
> > -	ret = iris_opp_set_rate(core->dev, 0);
> > +	ret = clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
> >  	if (ret)
> > -		return ret;
> > -
> > -	pm_runtime_put_sync(pd_dev);
> > -
> > -	return 0;
> > -}
> > +		pm_runtime_put_sync(pd->dev);
> >  
> > -static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
> > -{
> [ ... ]
> > +	return ret;
> >  }
> >  
> > -int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type)
> > +void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
> >  {
> > -	struct clk *clock;
> > -
> > -	clock = iris_get_clk_by_type(core, clk_type);
> > -	if (!clock)
> > -		return -EINVAL;
> > -
> > -	clk_disable_unprepare(clock);
> > -
> > -	return 0;
> > +	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
> > +	iris_opp_set_rate(core->dev, 0);
> > +	pm_runtime_put_sync(pd->dev);
> >  }
> 
> [Severity: High]
> Could dropping the OPP rate to 0 inside a block-specific helper cause issues?
> If multiple blocks are being torn down (for example, in
> iris_vpu4x_power_off_hardware() which shuts down VPP1, VPP0, then VCODEC), this
> would instantly drop the global controller OPP to 0 when the first block is
> disabled, while other blocks' clocks are still running. Does this violate DVFS
> constraints?

Yes. iris_opp_set_rate() should not be called from a per-domain
functions.


-- 
With best wishes
Dmitry
