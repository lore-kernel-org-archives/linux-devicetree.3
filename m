Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E9390200
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782650011; cv=none; b=KjVRYU1h7prdIBmBqRtwfBmgIv8T12x6l6vx8rB89N8Gzg9bogbqZbgafW4p7AnPjhGDa0ewETdLAuVemfRtDvfqXQoMC9vbXu70IEv8TjvzQAZ9y++sLbLRrhDn5+3thDNM4eddf6fwc4mYQ0BiAYQofCTZuFvf3IuI5XIUA1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782650011; c=relaxed/simple;
	bh=mykbP1tmhDjVBsB+bhm2oNPjCzqiU+fEZXgkJTccrvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srG1rpxXRWmrn94DPZL9P1ERW9PpAhQNoq3Oxn0lOP+bI7v9MigF53UPfoM4BdJrYd4FuXCysi/3+mBSoHjv0T1NJxj4BS5vhLOPNpU6iuFh6Ug9XRBbzKDwL6uyOAAp9rF3mp22ynShtws1mDtpQ/bx0P78kfJAOwJpccHDty4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHujCWWk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsPkvJJM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHujCWWk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsPkvJJM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9Ptht3634442
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iMYnMWBp77TV2qENzpNgtRcZ
	SO5SxyLvA6XoKjxuz0M=; b=cHujCWWkTidRlrat45BIiorrO+2mngzn53H0cvys
	xFGS5sfcY6D/phIjo+VZKLXf4bVw6kkd2ZHkZAagjCBLm9Moug0WavnVQhkPaR0X
	ChKK8L3hEy+3AkvaOHkFWfvSpo0U6APLQ/WRTjC/V5LT5HenkQKCPzt1gPA/mqBN
	8jVkotE6sE3B4+4eaJePKa4LkcPfUXLydTTb8eIg2ggpzU+76HzExBCJJRk5cGym
	1BY66FrF1usMTNV9ewtKFWGnfv8UYSzKHmyYeKsSiiUlSr4I/+xsR2Gl1MS0N1eu
	7UoQTKjUeHA08szGFRJH9yPbMAt2jWpGRi9des6H08zo1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tutv6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:33:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b4b575561so383063685a.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782650008; x=1783254808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iMYnMWBp77TV2qENzpNgtRcZSO5SxyLvA6XoKjxuz0M=;
        b=WsPkvJJMcTZcbnafPQ9j2drIyk+mt8L081LtgWDwL8jDLVyJjEe9FRn02E33cW4QqC
         7Gj7FOCD+jBu8/yxum6azK9bmEkcKnzCXnBGHQY8uhhDsUZ6OQz/xPiuQVMiSLNE+bzU
         rEteaEfll1RJ9CqsVH1X6UJlGrRRkjtRtwCXLOw9hsJxaoPtwCrkWD93Qfj9VxSXEZ4J
         VdTA6E4hynvYbt/cfunkhBD3Z1A8Ow/n3LFqdW49GEEx89YPj1y6SUehXQm8veFhFST3
         z2c0jc0AMeaKEBNp5mJxQj5ww6oDu8LzBUyoAS92mahsmuQRB3WSK64i4eLUwS+tBviI
         5G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782650008; x=1783254808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMYnMWBp77TV2qENzpNgtRcZSO5SxyLvA6XoKjxuz0M=;
        b=slJmRZIS33igydmMd8EOcNcASpbMC3b4bxo5Vn5VQg/I1QAXcODgoZjDFR713TVtuX
         oeaKhh7rzlkCDN0BdIvs3lZaXYi8veTs3Uf2ponufyQYWfC8ABQ5c76s8P6noCcUIVpF
         IEb49M5xzN+39pjbSlg77dAx/gZT5xTHgo9aqSvGDUJ8S88jc2GUubMvd8HDOuKShYGB
         h8thuol/myMVr7yS5rnChgfVFZYpGsrbRmJ8PMkR80Wt2pKmItIGoj4Hdfuk1qCtA59X
         kBVrCuOq6Jqx0bOPbA/rbPUu+xnR0p+qSulWTfiy1IhPBB4AuaX5xpIK+t8Wj4uYvilt
         aXqg==
X-Forwarded-Encrypted: i=1; AFNElJ8Jty3Gt+R04NJ61eIBA3/b9Nt+wI3f1kgbp74BldUoB2Ht50JtZ8X8jG0WELfNKtIFGOsPbxopda6n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7CNQjtjo1iN5kHfo0BlxbE1fuhC1XOGBJgA6+4S0iZsRLc/rC
	pCS3r4ZUOPdG7xzHo2vtGy0P2Ns0sq8HftOaeLlF+24wPi03JtVNBoHqGjfeg+6QzEPXhiSJojM
	AGS2+sp0iYAT3w3dZrChWCqlrxVyJNPmo9ohHt2XmNEWh3EGRmARqoo9dcp+4tfSQ
X-Gm-Gg: AfdE7cmBQu0ApSQXne5QQEhAEgfLLS9Z/FyAt3U02dpUPIjyoDKsLtYVEp/l2Q9Fyyu
	DhGxY3r3XQik/Fy3GuKL3HfTaFlBHA0a9CG7QVH0EAtkpdSIdTvLMqMIQb3FUeRhluCz6gUP/Tj
	jvNo95dcZ5vmsnyKn4bsCqkvX2b9HezoMAkGyNY6Zt2L2UzJ4DtbzsmkNhRESD2Ui312Ea8u6GQ
	i3iKi+ujOFa+h8W+wlfoAvQNKqUK2Q1jeiEs/0CHN0EnAJvQz7//UL/+jeScFMjT472IXabbpAY
	UC2++sMn8g4LBwb0qpbyOFhBE4NoVoPXzxGtL6WnQRCpa4Ojk+3DDbat4GBwwzZug2JdmsCUO4u
	b2uFyhCYm264/JSGqjXkx7jHTnVGX0V3xNYv3u3d1LybizG6pGCW0c7ImepWzSjPR5L27OGwBfg
	JRmArA5u9/L2QRdCUDT7jImyly
X-Received: by 2002:a05:620a:4147:b0:915:9da9:b51b with SMTP id af79cd13be357-92600a83049mr3348415385a.16.1782650007979;
        Sun, 28 Jun 2026 05:33:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:915:9da9:b51b with SMTP id af79cd13be357-92600a83049mr3348411585a.16.1782650007434;
        Sun, 28 Jun 2026 05:33:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39af63056f2sm9044421fa.17.2026.06.28.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:33:25 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:33:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfX27yC/0zCMsCW
 KhpbJ8f4Hp1fqkyY07m6U0UU/vF37LdMIDko5XtGHCQaFzqSKUT8X7LgVIGLRy8sXfuqhbcoXwc
 aXe9nt1NBA+dg+kMLk7HyEbKBFh20Sg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExMCBTYWx0ZWRfXyTh9PWKiokCB
 TmULqtmChajlIPl8oiYIM64t3Z+j/+Udr/p+rpjvMdZqreC2XMvXBL6yxn2c4lS79ZPk7mlgvyk
 IIyVg3OdHljKt63mbqtcP8vlSQb1mKAInXejyjBvr5zJyG+EvW6JmQYXc+273p7hy4SCFRc5QhT
 Sv35H2hHPSfNUEgEq5w0JgVYUwjHcMUMQK1HKyky5AksOXd64bGGM4qo3xwtHJ+2VH4J9G1lTC/
 FJ2Y8rOzj96upW6Z6N0QzsZNFZBLgSDI57Hiyefg+CXl/1C75zmpAHdoB58DLrIi41kiDYokWJd
 82Dl9qy4dVkgEc6zbpoDE3+OKTRj9HUgzNhH3ftdxkmGJNhfihhYpGnx/Kpq4d7GYfYitM4SliG
 X4YX8fIdhDnVyfC7YYLtbAud8V9BvH6FQ+It9SQPUNAOs2TtBtY5IAPu4uRkG3Ly7ApPt5hcx3s
 v794nxXgxP2BEQl8IlA==
X-Proofpoint-GUID: 1dUbYFWIDGAQgaSzacN5MKS0sUHo2U7G
X-Proofpoint-ORIG-GUID: 1dUbYFWIDGAQgaSzacN5MKS0sUHo2U7G
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a411498 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9oNDkMca_vBqraWRZNIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280110

On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
> On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> > On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> > <kamal.wadhwa@oss.qualcomm.com> wrote:
> > >
> > > On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > > > --
> > > > > > > > > > +
> > > > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > > > +         };
> > > > > > > > >
> > > > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > > > such as vdd_s2-supply?
> > > > > > > > >
> > > > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > > > >
> > > > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > > > downstream components?
> > > > > > > >
> > > > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > > > >
> > > > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > > > votes are cleared.
> > > > > >
> > > > > > How is this different from other, previous platforms?
> > > > >
> > > > > This is not different. In the previous platforms too this is taken care from the
> > > > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > > > may have a RPM/RPMH regulator as a parent.
> > > > >
> > > > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > > > calculated based on the active child rails. This was done for all the
> > > > > subsystems (including APPS) regulators.
> > > > >
> > > > > So no explicit handling from the APPS is required for parent supply.
> > > >
> > > > You are explaining the driver behaviour. But the question is about the
> > > > hardware description. If there is no difference, please add necessary
> > > > supplies back.
> > >
> > > I understand your concern about descibing the parent-child relation in the
> > > devicetree, and given that we have been almost always followed this for all
> > > the previous targets, it will expected of us to add them.
> > 
> > Yes.
> > 
> > >
> > > However, we want to avoid the unnecessary access to the parent from APPS.
> > 
> > Why? What is the reason? Do we want to do the same for all the
> > platforms? Only for Shikra? Something else?
> > 
> > > At the moment, I do not see a way to avoid that, if we add the parent
> > > regulators.
> > 
> > That depend on the answer to the previous question. In the end, we can
> > make the driver ignore the parents by removing them from the regulator
> > desc.
> 
> Ok, this seems like a good suggestion, so you mean its ok if we define the
> regulator desc's supply column with NULL? And only keep that in the DT?
> 
> you mean like this?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
> 
> (please let me know if i got that right. thanks)

Yes. Don't forget to explain in the commit message, why you are doing
so.

-- 
With best wishes
Dmitry
