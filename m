Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E97233937
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092737; cv=none; b=D0GXwHqbm7WcHHQjNAgxF+wgsxoO1xalMMCd4BjCYq+sDCmkTdrsw75jfgA7JBic1DqxCvzvA9KNkp5miGQ3BF/bMR8xTjkNrQQXEpHmLpKF7u8Pd1ZwopXFZ+r7ZHgOQXtzG1DlsXw3sOXPE2Y39rI7o56QQ/XwF6MfsK85Fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092737; c=relaxed/simple;
	bh=QgII9ryv9JQCJcDtGueopEHukhohDkW/MVfV9fMe9Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuHu1bieLBfqYKnxwpfhT6FW/KGmPlrefAJzDD/NaTa2J41CYsenXCoUs48TmiTdlDs6baL6Y5M02q7qx3ABaIyNIHXvN0dpGdlRpaPHGdiBCYoMTVVhAGbfjifKQFDiVnnZawFzgVm50yBRcTY3ikvKPbpDibGCRaSGZGESs+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvuuOkQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuvIWIZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvuuOkQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UuvIWIZJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663A2uFR3772711
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 15:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7M4A5A2q632Eb9taEhCM1j2UptjxaJBaXty1useesM=; b=PvuuOkQ9jArDku98
	wI9EVQqMPtbkUAZlu34MQpj0+knqxy5mndEPC3FBq6dg0O0KfNo3YnW79t8Yojb4
	gVXee8ejfgDZ5iheGvhnMpGGSvRKHai8Q+4fTYBiF/pPNbmrVCIeGl/Bxe4nuGsm
	vJASGILm2isKIXB8Ets7LxlXzg8kERTLOx3Ca65IQzO/vqjDpQvhcuThnadQl0X6
	XbxkuttmZrhQQk7qctiwyRQA++zZqe+Y1AJOsXYwB+qZ/kNQYhoOz6CwhFueZoHY
	Frf4HKEzw1LYoJg1cllFhkacdjmpWs9sIkIvp9nplCWBuHD06BYhz8uVavRWayaq
	B6BikA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b0396kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 15:32:15 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-48f5afc9692so608965b6e.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783092735; x=1783697535; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7M4A5A2q632Eb9taEhCM1j2UptjxaJBaXty1useesM=;
        b=UuvIWIZJFfrc52LuI7FrmFYOuW0QrBoirTdGx9PXPo6TvWK0gK4vmaQo7EaFsMOL6t
         QhjoBTjgS5I0nD/GNS201GtEd4DG/m7/C6tW3ybjKmyUXXvnGeRESXfzX4U1aszKrb7C
         0hJ7xUhccdsB912WIUQ50MUU2kzSAtZgNu8vda70qWuAl+TPV//XC52q75Tk11u/7ehP
         c8jJwQxooeY1oqiHfkHRds1jbd/n9PIhV2fvHwU6h+6dulhA6Nxgvneza4NjTmzjCLt8
         NzGjPKrbQ0IOlWBtpiqJxMZLb1yiMgsDgMO5qD1P/Wgos6ujCyyJZTWZdxnJMMJm10Oc
         0GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092735; x=1783697535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U7M4A5A2q632Eb9taEhCM1j2UptjxaJBaXty1useesM=;
        b=reLzywLJWjP6Cgwk9sZT/jxNSBPw8B2m2RoDosuFIFvergyjT7lNahENBzo2Pf35ZC
         XtOB8EOzeFd4ZN66KZ2QWtYrtgXk+iMAvfqf0tKP6z6mQtPKoumejZcgFR6VBhe7W7ii
         1+dvtEv1CcWWrHj4oxPFoL3yF99zowZOnjKaBn7lrYT41XwnN1Q03UZfC7t91tNdruqr
         ifkQ5Fvgkqh7vqCwAA0/ax3fq6wvwg3uoBCAeqWiUeC65cZX16jIuKJmeRN6f2AJUBeB
         gYD/hkcvef+yYK/Y9SWYenCh3d9HP/AVcvXwisl7ZgU5w3n4R8pvis+U2n4Q+K82vCTB
         b17Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6g7Xhzs5xnwcUBDEAH7z45bFcMCjC67ZJDgc/3ONb5O3yHAM/T2fZcSYvQVrJ6J2qsXHt3fCoDwAr@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwu2ZcYsNIYPdcgxYUX5OrD7alRryQzzU7iz/FA+HTsMzgG0+
	zJ/VzLdjEWgkCyq4OgrW3l3vbKt9SXojhOar0UhEHXgTIitmirHcGMoOxO0YN7WTefupScC4hae
	BvZnCg5HA+N5W/PREs3fyoUAtcjgI4BfhvokZcOTVftp/I0S+QCbXzdaANihHRNWX
X-Gm-Gg: AfdE7cmspLF+tR4mvQ6w0agd5k5q+yNDNJwXOY+QqEkZUEDU/80DOJLQTwByMxOIoTh
	mfuhNycukFhMUQ/Q0bEGK0yIC/4SFzrBKsX2EgxnKHwo/BPESbWbYUwnVu9e6xrWtSnyoBdEj3E
	PXrJfYngZkFaFn7KH+qjRb9IJVCNBUZOatMGFX7DG+n0KIT+dqsZd5CGEuCv9mLMOq6AZQ5a7MA
	490ae5DiS8JcZcgytDfvwwEW7RdlOtiyvDCck/IU9GPRwK50Mw5a/Sd7V2D2vSUw7WpiDIZXYX+
	0i+jgMOpCViV6d7wSMQ29zgw6vB/HgSVyDfEEzDaChBhUJo/zwHMlNtaU+xc11vdUkdEyesoHBa
	Y6ywOQIIDvkx+Nv0fp+8t9MzMuz8REZZcMTEcE5B5DGPK36q90tvUh6ygP+kF1iV72mljS6Zn7g
	qqLgO23vLszE0XJ0oFOXx/WI8J
X-Received: by 2002:a05:6808:8412:b0:497:8ca:a8fc with SMTP id 5614622812f47-49708cab015mr5568048b6e.19.1783092734565;
        Fri, 03 Jul 2026 08:32:14 -0700 (PDT)
X-Received: by 2002:a05:6808:8412:b0:497:8ca:a8fc with SMTP id 5614622812f47-49708cab015mr5568021b6e.19.1783092734107;
        Fri, 03 Jul 2026 08:32:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae59a10sm3852541fa.33.2026.07.03.08.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:32:12 -0700 (PDT)
Date: Fri, 3 Jul 2026 18:32:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <fku5jad6op5upobwvrphbqteg76zukbovsifzarizz4m3ofuka@gdpaxzzuraee>
References: <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
 <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
 <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
 <33c74e59-076a-4877-9e62-83a8ebbf2d54@oss.qualcomm.com>
 <20260703093035.q5xgljuigpt6zqt6@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703093035.q5xgljuigpt6zqt6@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1MiBTYWx0ZWRfX8Xb5wcO5z58/
 pyioZpv3gMVX+kPogerEMg5+GUJLKEfYZMst3XbFK/HOme1aHLZfLNNybDwPvkHL6iByGoKVua5
 8IISB/Jv+nuUwMgDFzUtDBdxio5IKeY=
X-Proofpoint-GUID: PDWV4nx9MMN-elSXt-Vu5m16ym4ZnVfo
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a47d5ff cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eBmASph2dt7FLklNJeEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1MiBTYWx0ZWRfX9lSozi8Nj7eO
 MbPZVUeAzW/7mDpm3WpezyllwNxG3rUx53DYIQrDD0NFNpmUV2WXr6qHkotY0CrNSu6dkKlxvwT
 61RcH94UKi61uePRpSDCcdl92FtMWhyRyiG0R4YYdtbk3yFHhi8+QXuAqbUJBEoAGVanDKhv6k4
 9/UiyvyD+YPtLxf0bVsuyIqoFtj8kFXeK6sfHw9d2iJSh5PRuNXs6kyYAObPRu0/lDrzGhL8vvx
 kIgAxAs3+hb5EzkLBKijkliaPYAipW71KkWugfpIqzJykjmVjXGmaTxhXk/LZjOuzjcv7035M4U
 bYVHJxvxSPIDLbl+K5g7sPF4lJYlWC7ARHPRBAPvR3XWY2bEqJfZWa5+4eMYSOYltKP3cx2Io/l
 tVFziAg2ulvvmDuvoSUi9SbJydCSAgZoHQ1Jqm8LuVQfIdj9Acy9vNlMGgFU9wSDEP+wND47rZR
 abmpbz60COZTvNBDVGg==
X-Proofpoint-ORIG-GUID: PDWV4nx9MMN-elSXt-Vu5m16ym4ZnVfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030152

On Fri, Jul 03, 2026 at 03:00:35PM +0530, Rakesh Kota wrote:
> On Tue, Jun 30, 2026 at 03:50:16PM +0200, Konrad Dybcio wrote:
> > On 6/30/26 2:42 PM, Rakesh Kota wrote:
> > > On Sun, Jun 28, 2026 at 03:33:23PM +0300, Dmitry Baryshkov wrote:
> > >> On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
> > >>> On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> > >>>> On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> > >>>> <kamal.wadhwa@oss.qualcomm.com> wrote:
> > >>>>>
> > >>>>> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > >>>>>> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > >>>>>>> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > >>>>>>>> On 13/05/2026 17:29, Rakesh Kota wrote:
> > >>>>>>>>> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > >>>>>>>>>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > >>>>>>>>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > >>>>>>>>>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > >>>>>>>>>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > >>>>>>>>>>> --
> > >>>>>>>>>>>> +
> > >>>>>>>>>>>> +         pm4125_s2: s2 {
> > >>>>>>>>>>>> +                 regulator-min-microvolt = <1000000>;
> > >>>>>>>>>>>> +                 regulator-max-microvolt = <1200000>;
> > >>>>>>>>>>>> +         };
> > >>>>>>>>>>>
> > >>>>>>>>>>> Do these regulators need to explicitly define their input supply dependencies
> > >>>>>>>>>>> such as vdd_s2-supply?
> > >>>>>>>>>>>
> > >>>>>>>>>>> Without these properties, the regulator framework might be unaware that the
> > >>>>>>>>>>> PMIC regulators draw power from upstream supplies.
> > >>>>>>>>>>>
> > >>>>>>>>>>> If the kernel dynamically manages the upstream supply and its reference count
> > >>>>>>>>>>> drops to zero, could it be disabled, causing an unexpected power loss for
> > >>>>>>>>>>> downstream components?
> > >>>>>>>>>>
> > >>>>>>>>>> And this is a correct comment. Please provide missing supplies.
> > >>>>>>>>>>
> > >>>>>>>>> As per the Qualcomm system design, the parent-child supply relationship
> > >>>>>>>>> is managed by the RPM firmware, not the Linux regulator framework. The
> > >>>>>>>>> RPM ensures the parent supply is never disabled until all subsystem
> > >>>>>>>>> votes are cleared.
> > >>>>>>>>
> > >>>>>>>> How is this different from other, previous platforms?
> > >>>>>>>
> > >>>>>>> This is not different. In the previous platforms too this is taken care from the
> > >>>>>>> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > >>>>>>> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > >>>>>>> may have a RPM/RPMH regulator as a parent.
> > >>>>>>>
> > >>>>>>> Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > >>>>>>> internally voted by RPM/RPMH FW at proper voltage with required headroom
> > >>>>>>> calculated based on the active child rails. This was done for all the
> > >>>>>>> subsystems (including APPS) regulators.
> > >>>>>>>
> > >>>>>>> So no explicit handling from the APPS is required for parent supply.
> > >>>>>>
> > >>>>>> You are explaining the driver behaviour. But the question is about the
> > >>>>>> hardware description. If there is no difference, please add necessary
> > >>>>>> supplies back.
> > >>>>>
> > >>>>> I understand your concern about descibing the parent-child relation in the
> > >>>>> devicetree, and given that we have been almost always followed this for all
> > >>>>> the previous targets, it will expected of us to add them.
> > >>>>
> > >>>> Yes.
> > >>>>
> > >>>>>
> > >>>>> However, we want to avoid the unnecessary access to the parent from APPS.
> > >>>>
> > >>>> Why? What is the reason? Do we want to do the same for all the
> > >>>> platforms? Only for Shikra? Something else?
> > >>>>
> > >>>>> At the moment, I do not see a way to avoid that, if we add the parent
> > >>>>> regulators.
> > >>>>
> > >>>> That depend on the answer to the previous question. In the end, we can
> > >>>> make the driver ignore the parents by removing them from the regulator
> > >>>> desc.
> > >>>
> > >>> Ok, this seems like a good suggestion, so you mean its ok if we define the
> > >>> regulator desc's supply column with NULL? And only keep that in the DT?
> > >>>
> > >>> you mean like this?
> > >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
> > >>>
> > >>> (please let me know if i got that right. thanks)
> > >>
> > >> Yes. Don't forget to explain in the commit message, why you are doing
> > >> so.
> > > 
> > > Currently, Agatti uses the same PMIC, so we cannot set the driver
> > > supply name reference to NULL. Since it's an older target,
> > > we'll need to run a regression before making any driver-level changes.
> > > 
> > > Additionally, the child-to-parent regulator ganging differs between
> > > Shikra and Agatti:
> > > 
> > >  - On Agatti, l3 regulator is ganged with vdd_l13_l14_l15_l16
> > >  - On Shikra, l3 is ganged with vdd_l2_l3
> > 
> > Is it configurable on the PMIC level? I was under the impression the
> > supply maps are fixed in hardware.  Is there a chance the agatti
> > description is just wrong?
> 
> The supply ganging between child LDOs and parent supplies is not fixed
> at the PMIC hardware level — it varies per platform based on system
> design requirements. The same LDO can have a different parent supply on
> different SoCs.

It can have different power supplies, but the supply is provided through
a fixed pin of the PMIC. Please correct me if I'm wrong.

> I have verified the Agatti parent-child supply mappings and they are
> correct. The difference between Agatti and Shikra is a legitimate
> platform-level design difference, not an error in the Agatti DT.

There is an error in the DT. It uses fake PMIC supply names.

-- 
With best wishes
Dmitry
