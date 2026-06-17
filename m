Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F8F3B8BD9
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700513; cv=pass; b=d+Jti65/2Msy01PrnZ8Y3mk9yP1KLZRD9Dz+ev8+QZw3q1xNiIxMQrsOpf7qQKdEj/19DxWmELlOYYqoIFxYlL5EhErHBzbUbul2p3zroSeXrLLvsLjCHzQvICOuP8Pvm8nNuHsTxJZKVxIQlCPqxgl2y5wmKf0D4tTP95RqMOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700513; c=relaxed/simple;
	bh=1QDlqDAENZKDUJNZlTH6erPxR/tMb1XUANlyY7Q1ycI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLYBUCHik8r1s6t5ZpIOx5lu6V8UiOH+n/1JiBLVy3ezHAlI192fbk8LLR4p1gIw1T71GGoftI2zx/AxQd2UIbcqW0HuFF2BD6EGStpesD2u7Xnr2SfER7WPRmVY+0gf1gd1RJk5B+muTxNS+iBO60dSh3FVZ+QKy3/o47fiosw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sb0rsstT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJQAtJnv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sb0rsstT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jJQAtJnv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HB9RQU2579451
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZJF6u/a89oyxhTG3HTO28Hbg
	scfu0gN23dEPd4mDnnU=; b=Sb0rsstTnC6r34y5brXEKwpLM+MQYVbvU1Tcysyy
	WpcqkIF+10wTQjYCZNwqCE9Ptmji1wtP3Iy8lTvMJFSJx4td/yVhF1ZmwBeiOcze
	4fEIIZno21U488IWX8Minb5X03wCK/Ru2SE//9/1BlhK0OX5H64xOza9PaZI+9Y4
	6TIPRPhoeLQfhpsZu8tYuNBVqXvPLn6KVsLTcJE64Kl4PpYYR5DJGyYVZo7b6ScI
	U/KV4MAdzq4zgsi2JE4uNudVOoYGM9irMq4ryv9yFmWE9c+SgQuTzJjknJjY10vO
	fL44hN4Po2xiFjL0jjLTWtsas7phV6kuVtqQqFJDj9oI/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerb7ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:48:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f6247c6so6400319b3a.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781700510; cv=none;
        d=google.com; s=arc-20240605;
        b=TYRxdd1XcScj5l+386IjiWhrSqQMQKF7WO2os/k9+bvJsMhii1bHyV84qSEz47lckI
         fgBWQiFoBHn/cg+3m0JYSw03+fYsfecZK235krBZTTq9Gl3++SEFIdiDkcQ7Rs1+Oz7v
         sAET2Rdg8XFH+t5eRmV9O/GXM3FrgJkfq8SrgkrwGZOgyJ56ANCSwKhhfKrhLxzP5+Ef
         P5bbMPI7wuiYyt/SiDanzf52E90UydCluIgwiqsTCEZQ6Kvv65n3YUUoqS2auu8cC5lu
         g4PmNnfn89LIIFrO9hDkiE0zj95NVa3AGt63Gc4Zgh0GbweFC2oawZKCAlwyK40fF6pU
         BcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        fh=J1AomSrjewML6WRyK2IsSu+izhM8o7vPmeUda0yuOpI=;
        b=XGDyglFEm/26gTIbQG/aDDoIJU3RgW/HWJqy8Ieb/EMmKDvu96j0OK5AcmjCbSdoC1
         s3uSXPOwDlOsMrczuAgTRWiQkYQnaeil2Im7Ys9qo2Z4cuXsP6/w40E7XBiUnGIaMCTt
         s0aKGc1imYfWnRWZdMWvL5OoJUy7+dRbziNs8yyLXRXa05uJ18Sc7Q/vP/PUmb8UzTrW
         0ISk0wK4WPHt5Lgs/yKDLPTsAaXV+jQTnCLUmYlRfSXyGnlXCLmjZqoeCN0YiFZoDX7A
         6MmpyCw3okZhqEKUgjxbiB9IaRVKShZ1q8uZoxuk0nQxuUBG3f1c1D0VAWEsJHGe8rNA
         CgNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781700510; x=1782305310; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        b=jJQAtJnvuDABxnuAI1drpJwQFxXdHruETd77QucJfpQua4U85l/KyVfjP58xz1N1zQ
         HgP9QcW+QaCFEw/7ISXxurSQTL3vLY002fZvHP260iMY7kQmQqep2G1FDTfhjb97BWrg
         SU0OncYxKIsrnpbrMmjObiXHmD7XkHHc6FMlE/k7jCzXwTBFEkbLJMrat7JkBZrGh7D6
         VWdhXIIJFohuKueJIcAVGdT/raiHncC460qVSO7ukJzEncOm7/+YHmlJDYFJm7QeapzJ
         WoWvpgDxVzNAXw1U8/m8HpfOApQucIa+rUog7qAEAG6zLhJAfFZsn1nOHRzbmQTzprlv
         rrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700510; x=1782305310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        b=DNnE7H5NjCqrVPLCh+J79f8DXXxkGR08ToAMWATLRkirGfKWPb3JU/1pKrnTBnN3Sq
         YPXNDReS16QWyh2IXODXVaJrtN9Ib6L5WMUMZNm34bMIxHAX+3Fb6N6wlFYJFhX4OL3g
         0X+frC0SGKeH4x2/e7LKe6J+2f71seNvLqWhZHQUl7q8SCD6koUd+naCsk33KZdIincp
         L67DhqT7ZBLrHuXfkDQ09RubbezJmf8Vjy59Y0qQrSwz9jKPvO4fgO1Nc1CdKBnz9ta7
         P2wio/JYRH0RAWS/K1q8sL3/pGDFGrcbuSG0MLxDb+7Va4B6wWyKk7b1JseoG3YdIHgs
         ysXw==
X-Forwarded-Encrypted: i=1; AFNElJ/8QK2QruB2h+/FmgGxYr+P5DMWvb2t4Xpm79SFLobCColZorjIPJJOCAZKcuZo5cxsF3WhTzzXlnrc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0QbPgVyZvbcfB4oepPYJnihGK1kvyNt82hMfa7lMGkD2+3D85
	GzpVKbGtwbeH0vo2w5D3cci42zKX07WT/XLi+u0Bk/12o4rKUZxSCGgkE9GUmb2XnGSGp7rXRqa
	lXY/pQsM9IqbWIxwHEpIUFN2o8dDSPmF244bRl6qBjqREXsem4aOTe00iWuRkl2R6f+svcoYFKd
	2B4XdehLSZy1eOd73nVB3Z0VL5wgAhxFuGeIKD3zFotZJW/Us=
X-Gm-Gg: Acq92OF4YhzaTYyIX6p4W41F0AWEMazZWsvkUFRua0EpVZgHUVfOPf7PT21itEZf7E/
	YRxkNgIo/4l2eOeO6fq5LyVFTajrUH7Tk/kJIJuwb/NemLHqcHWwucV6D0V2o6pmU4WrK1HeXLq
	85Fa0+HPUCwZPg43YEpwRRe7h+T5e96koDIAjd5jPi4mHqOJgqlvJQSCxyGZkTeG+ZrrHO6tXNS
	WisayhcdJQ4pUvo7GRLbxV5agFgMw==
X-Received: by 2002:a05:6a00:348e:b0:842:7992:bdbc with SMTP id d2e1a72fcca58-84524529a80mr3916370b3a.28.1781700509787;
        Wed, 17 Jun 2026 05:48:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:348e:b0:842:7992:bdbc with SMTP id
 d2e1a72fcca58-84524529a80mr3916330b3a.28.1781700509240; Wed, 17 Jun 2026
 05:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org> <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com> <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw> <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
In-Reply-To: <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:48:14 +0300
X-Gm-Features: AVVi8Cfcg5pAZuZTe-ugeVW0fqcByYJhAO0tSKWmmXXpUZyQiDgZdXY2-T4O6-4
Message-ID: <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMSBTYWx0ZWRfXyLOIFmOPCAQd
 xv07Hz/VP2WupLOxdqqbQ469Zxk4FLrwPKWKpvZd0G7uut6yjLWSBTCrFGYm01IfQkFOV5dODPq
 P4H213ZcUxm0TcZC3feS/kxZYl7Zt2A=
X-Proofpoint-GUID: WVkHREuE4u1DrWGfrfY_WtN97iY_HKUW
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a32979e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=AXN0PHSXbqqaHeSrhoAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMSBTYWx0ZWRfX+Mn529TrIfVM
 W0TV9Ltf1tH1LAET71Knm1r+ywRdYjSFQfqNl/+3Fdz5oC5rRegRD7eFY4wBVhzDCuLf4REru/J
 6PpGdVFUmlllwh3WsohVqamO1tMAjBLgHlTpPExDSTDboj0pCFJM111qdIbUfKV4/qKsnZY/i8D
 fWBTguUsHLGKKCpQhpetHhmy1rn9fRZSaS8dCvGGFIV6QxBVg4YT3GF40DB2MpGcHQCZ1JHvAMy
 +MUsSmSDjzLdhRmQRd3iH7zVAqEqiT8eWHUPawurOUxWEuUGPSV2YpG6bzOlRPSqG+iY6c8MNHU
 +wh2lo7cqBB5JhzH2Ay7pxnueW/H2jLHHTFhyS0vUapD7pRTNriDvADWf6/Aryw3hU3dn3KZUo/
 +k07IlUq4FwTUCN1k4W/6I+IsWyizEUOrEh+WZsAY1n+594sZhaQkI8L3xTNn5y6IxG/cexWROV
 DGMmNs5ks0q5GNEf1YQ==
X-Proofpoint-ORIG-GUID: WVkHREuE4u1DrWGfrfY_WtN97iY_HKUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170121

On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:
>
> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > --
> > > > > > >
> > > > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > > >
> > > > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > > >
> > > > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > > >
> > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000000..401e71720519d
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > [ ... ]
> > > > > > > > +&rpm_requests {
> > > > > > > > + regulators {
> > > > > > > > +         compatible = "qcom,rpm-pm2250-regulators";
> > > > > > >
> > > > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > > > compatible string include a specific identifier for the actual hardware?
> > > > > > >
> > > > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > > > are discovered later.
> > > > > >
> > > > > > This can be ignored. The compat is a leftover from the historically
> > > > > > incorrect naming.
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > +         };
> > > > > > >
> > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > such as vdd_s2-supply?
> > > > > > >
> > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > >
> > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > downstream components?
> > > > > >
> > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > >
> > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > votes are cleared.
> > > >
> > > > How is this different from other, previous platforms?
> > >
> > > This is not different. In the previous platforms too this is taken care from the
> > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > may have a RPM/RPMH regulator as a parent.
> > >
> > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > calculated based on the active child rails. This was done for all the
> > > subsystems (including APPS) regulators.
> > >
> > > So no explicit handling from the APPS is required for parent supply.
> >
> > You are explaining the driver behaviour. But the question is about the
> > hardware description. If there is no difference, please add necessary
> > supplies back.
>
> I understand your concern about descibing the parent-child relation in the
> devicetree, and given that we have been almost always followed this for all
> the previous targets, it will expected of us to add them.

Yes.

>
> However, we want to avoid the unnecessary access to the parent from APPS.

Why? What is the reason? Do we want to do the same for all the
platforms? Only for Shikra? Something else?

> At the moment, I do not see a way to avoid that, if we add the parent
> regulators.

That depend on the answer to the previous question. In the end, we can
make the driver ignore the parents by removing them from the regulator
desc.

>
> @Bjorn, @Konrad - can you please also share your suggestion, how we can add
> parent-child desciption, but avoid accessing parent supply from APPS, as its
> Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
> recall we had a verbal/offline discussion about same concern in context of
> RPMH regulators earlier).

That's why offline discussions are bad - you can't include other
participants in them.

-- 
With best wishes
Dmitry
