Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B868175A66
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402095; cv=none; b=qOM6FTPs2NKkZa9oIgETTpNdpqIL5SzGn5VOrW4Myg9tOlGhjI9FRu81OduticD5vUfMR83D9QCNGRqd3aZyDhx1hv9c9+g7bCaSWSJwycDQtcQz/RNhMKP0IgafkvPeLuTneanu4GJopU534lqhrMLb6j0sBcVZLT8vR2fVJlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402095; c=relaxed/simple;
	bh=TMS/Eni9iJcWLOPOcIhJacQLBtwyb1sBJqX79YJuijw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4SxUjZWRDCOj6/9pEZCVP7maU8ZO4Pb9QPPHXuP+GqSfGo1/SsVq1cq83v1jA/oXXlTIEwx1xv47zwQVfKd0HhdQNYMP+SDV2zxz93a0OT3Wc6TGk8esm2lP1k9mNKiFsDCIm7wpbnO5Z8XvV8qNnYz4gebwhJLF7u9p5EUgQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QR2TJaS2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxIB+Jge; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QR2TJaS2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxIB+Jge"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFeJs42737258
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 15:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Lo8pgHVw8dr8EhYjzI7pSrf
	sLgQ/Biprz4uL3xaU+Y=; b=QR2TJaS2SX2+bZ06LYZB+kyL6ZsJHoBYyRt26ndF
	EqxJ6TbUexmudm22+NW4hSFiazz+gxOtPd/8Vrc8hNetPds5pi//jK0Mr7K4ORyQ
	QprkNriUo803wEaMuXf5802rJPLjJ+YRaVu9QGfB9R5HguFvM/je/BdFG/o8hRVy
	kvkKzNUKDkbFRpfXyWSSaLfDv3UfW77O46uDoA6xpZLnEqSr7HGQ6bQSCr5djZ8k
	pk/YhY7dEGH59b0pIhXSexz0ErfVfQRxhFP4LUSTG4+CffCeZLCp/fvZQV1KVRAa
	IcGziadAIwfuyYPTjLr6dMSgLPEFE4uUIm0RZixq4dfWkQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8t28t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 15:41:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bf305403so141615ad.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782402092; x=1783006892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Lo8pgHVw8dr8EhYjzI7pSrfsLgQ/Biprz4uL3xaU+Y=;
        b=OxIB+Jgee10y32bFK+u1S9GV62rJpPRZwbhk6VKwmasss3MXSBilxXeiWygT91TEHW
         WTqEZgViYa3MqbGshByfFOz4oaB6Hh1tOyM6bRAztr+SEXSN5LAu79NLjiff3rGkKFzy
         lH9Q4QYLYA96zm0dUaOKohTcpx0Gw2d3Q9W9zPJzE6y3pDD0G+C8ztcWSuJdVpI/Nt4F
         /Ta0cxYoPzWmFAhlDn+Yohr0adzdwCP7U3lpJNIrjPX92CntidQyfDLRYdeyiMy6jzuN
         vclq0cFjOF9T+X168sHtvMKElG/8nJ54IOSxik9LlmdDqjkJjuUyY7Ng8SSgZiO0l/VQ
         rwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402092; x=1783006892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Lo8pgHVw8dr8EhYjzI7pSrfsLgQ/Biprz4uL3xaU+Y=;
        b=H046WiRvHsyFfrNqB12visSvzpiuxaJaHFBFm/13m89N109XGX/p174UcmXPaXfMPp
         u/m0op+1+LIPUKPTeGQQdge9qZkawTtR6u3gnNxMC/jFmpHImyJuLFPvM14LRh+PxoPl
         9ZC9f1AgJIIctsiHjrt+zJce6SSKFBMTU6w50rLzsR+hAX4A5z1cQYbBfGOpzgSosGyq
         uzWjAPexZg/0tUSnSzKl4IKouv5YWkOUuwwDt29QBvI2CqBKS5T8dQnEQ9fxw9dGq/3y
         8jc9YWif2BGYp73rq8AUNgcLfWan48Dzapv3BIkLm7XzIIp/V1HPk9vA3aESzJ21aAMi
         TQzg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+ZY+w2HyB0kSjR8ghtUUIKsAE1M/Uei8XlqNSh3nD+0JCNiN1X4ZV5olg+aR0LCwyh4b2wS4S2M86@vger.kernel.org
X-Gm-Message-State: AOJu0YwfBSGaFX+6HXN51MYj96huC7u33Rt+ayAVl6h5H8EoNBAg2bVV
	t4eRKdumZVfxuzvlSSwtAsREdqlJ+cO5UKFy4DGkuOza74s9Z97hHccGMX84tO9S6hUUvC1nW+d
	HBeXZvWH7RFNClscEpDdBR6bOTxJUEBl6yXGmElFICfJzxeWHDOQRLqbNOypLBdjI
X-Gm-Gg: AfdE7ck10NQVeJRtGdBSxxdzLgVz1gwnSMrgFK8S+kezEpTCcG5yZP+4PgNSE74AqaM
	+QDrWm7VZev3srk9iqUJUZjxHxH4zbUhOaAizfa4aWBVM4QjegefWMz4nrSMS+4jcO4cBPRorqF
	oLGkVxiXKa/qn2gD9Kb4iZxkeNUL6qpMB6vXPWxIfh6mfnjipMe5yD/JFlxjvbmrScXjBnndJe/
	AVvloYYBo0gNqi/HSwertTIn4v04gjHtMWCnHT0ipNwyekQrdmqaov8oiSi7WLp+TO4vmxkxOZb
	SEjLYG3fp6joVgfhU25SBkRw5qCUKsbvo7fr3B2Ycwfpseff9AwSvuwkdUqcGo4BsqwJ9LOb6uI
	sIAxe2uXA3AWxYPcqIhbEMAruBbdoDiriz+TNVAod
X-Received: by 2002:a17:902:d482:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2c7fc74bd33mr30863165ad.21.1782402087096;
        Thu, 25 Jun 2026 08:41:27 -0700 (PDT)
X-Received: by 2002:a17:902:d482:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2c7fc74bd33mr30862855ad.21.1782402086573;
        Thu, 25 Jun 2026 08:41:26 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac88fdsm23947525ad.17.2026.06.25.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 08:41:26 -0700 (PDT)
Date: Thu, 25 Jun 2026 21:11:19 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzNCBTYWx0ZWRfXwKQRpV0Ny7iI
 EqDV/CUXz7ZA+cpRXQGDIpCsxrd60kzRRhy0k+mEUDqSY5tYTKYHsmbN7fS/Dw07hI8EOJCYg/d
 oH0EdAFzuTV/O+rvnb69G6MrBzqnOG4=
X-Proofpoint-GUID: t36-ZkkPheAPydQPzSzM8jqOXX_TMbCk
X-Proofpoint-ORIG-GUID: t36-ZkkPheAPydQPzSzM8jqOXX_TMbCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzNCBTYWx0ZWRfX8N236qxPyawR
 V1ZSebzEqe3JIKn64zUlsX1T9/35TzaZ7I4yUtGLETgLYhgl7CJE4jItbpyI2vtbh6UUDPz4gVr
 lLK+Zgs2gbMDoTpL/1MQEKvUwzZ76H45LbgqlXJUtD4mq5SwpqcgCqIBWHkCd9XKMpgOoSsx5Os
 AKvQuPyte2f//l/s4o3umJxZNRWpPSLTLZsNjDuK+KgvaIiWPiDHL3nfVU+fC0xS41bidtcUEdM
 NHMWEQGASGmw0tcEbcwQWYZNOqWpNLlSJeuek8C0TY3NrL5L1ym0Ez4FJC0CaU/zjc21H5V3sLr
 Zisp6wY9kPnPvK/YsZNKEoPyrI5anjvstFMSZ2Y2AbfEsaVNLrnWw5S2u5dNJRbGil2HM8BmLd4
 oRvbv6UX3l5hesqCKjT5NcRdAHM2lFjqOJnhZnou70EgTgIZQXi7TRoW7kbkqiyQbxMHoYvwYsB
 YXQmjDj7s5Ug/jXuAzA==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3d4c2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1JGSnXlUyEB1KsQKyO8A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250134

On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> <kamal.wadhwa@oss.qualcomm.com> wrote:
> >
> > On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > > --
> > > > > > > >
> > > > > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > > > >
> > > > > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > > > >
> > > > > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > > > >
> > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > > new file mode 100644
> > > > > > > > > index 0000000000000..401e71720519d
> > > > > > > > > --- /dev/null
> > > > > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > [ ... ]
> > > > > > > > > +&rpm_requests {
> > > > > > > > > + regulators {
> > > > > > > > > +         compatible = "qcom,rpm-pm2250-regulators";
> > > > > > > >
> > > > > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > > > > compatible string include a specific identifier for the actual hardware?
> > > > > > > >
> > > > > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > > > > are discovered later.
> > > > > > >
> > > > > > > This can be ignored. The compat is a leftover from the historically
> > > > > > > incorrect naming.
> > > > > > >
> > > > > > > >
> > > > > > > > > +
> > > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > > +         };
> > > > > > > >
> > > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > > such as vdd_s2-supply?
> > > > > > > >
> > > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > > >
> > > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > > downstream components?
> > > > > > >
> > > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > > >
> > > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > > votes are cleared.
> > > > >
> > > > > How is this different from other, previous platforms?
> > > >
> > > > This is not different. In the previous platforms too this is taken care from the
> > > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > > may have a RPM/RPMH regulator as a parent.
> > > >
> > > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > > calculated based on the active child rails. This was done for all the
> > > > subsystems (including APPS) regulators.
> > > >
> > > > So no explicit handling from the APPS is required for parent supply.
> > >
> > > You are explaining the driver behaviour. But the question is about the
> > > hardware description. If there is no difference, please add necessary
> > > supplies back.
> >
> > I understand your concern about descibing the parent-child relation in the
> > devicetree, and given that we have been almost always followed this for all
> > the previous targets, it will expected of us to add them.
> 
> Yes.
> 
> >
> > However, we want to avoid the unnecessary access to the parent from APPS.
> 
> Why? What is the reason? Do we want to do the same for all the
> platforms? Only for Shikra? Something else?
> 
> > At the moment, I do not see a way to avoid that, if we add the parent
> > regulators.
> 
> That depend on the answer to the previous question. In the end, we can
> make the driver ignore the parents by removing them from the regulator
> desc.

Ok, this seems like a good suggestion, so you mean its ok if we define the
regulator desc's supply column with NULL? And only keep that in the DT?

you mean like this?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453

(please let me know if i got that right. thanks)

> 
> >
> > @Bjorn, @Konrad - can you please also share your suggestion, how we can add
> > parent-child desciption, but avoid accessing parent supply from APPS, as its
> > Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
> > recall we had a verbal/offline discussion about same concern in context of
> > RPMH regulators earlier).
> 
> That's why offline discussions are bad - you can't include other
> participants in them.

Yes, i see your point. I will take care of that in future.

> 
> -- 
> With best wishes
> Dmitry
