Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257D3E3165
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896357; cv=none; b=nffUZJ0bHAkBPvmS6Zlyg/n3VtMUIJ/fTi/sAlcI6e6CFQUGSW2SPTPNDoRravj2F2W0IJw4COV3HZZ1sMIhQQl1QK+cgFooUIRvfZLAi6IVJnL4fljLtZaClmitpM9XFtuVZzi80nvvIRgf1rl5+lspcfIyR9sPeC082vPmkQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896357; c=relaxed/simple;
	bh=vYhW6sp2VV3qy2pd5m+ykuHKAdjzoYeYYAcYIKeSnL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gX9LL1ob6JysMiBS8wYIffH4JjDPX2vfWpWrSsgwj2Jim98x2o4dQ8ZapQkDV2BuuoC1mWR8VpcBcjS249nXt4VDZAFiW0faxLTqrtVXjvf7yBU5fBWLLrszHKisywHNKzRi8QF1d4cYrwmWZ/mPAvyai4uXclGcsKKhYG9ctSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaVAN2Y+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DO+Pc8y7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaVAN2Y+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DO+Pc8y7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GL0G489280
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dY4DQsLIWN155WO3Hf1JbtTF
	IG9I3zBKpW9XXTHmvwk=; b=FaVAN2Y+xPKmLXoLUyXMYC350Ng210RlU6vx1Un7
	FmCUvk/yIePvFjvrrTpjuKl/ONbmkE5uau2kgNKW0krAnwHTEYWqLUAKgYsAkzxZ
	60e+NzfL+VctU83Pqh+E8qP9uiQT9J8qT9icZrId1ZUohgoK1Ph2ZUaK2/aEam00
	QZZa2lQkklga54EWLulbqob9f+URu2DWKiULCGZMjaoZyJOGRWsWgCOwKYJ6MLMN
	e2rKr/mirjC572wrH7NDKKMq3odbc+ITqzegpbnTlP53DzghhNXg5+En203Jo4IL
	ONqQJwiwhv0aIK7whz9wvJxUjoguyhMlA0pZk0VaTHHkBg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0auux1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:59:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c80be91ea3so9474965ad.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782896354; x=1783501154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dY4DQsLIWN155WO3Hf1JbtTFIG9I3zBKpW9XXTHmvwk=;
        b=DO+Pc8y784mDXDGdKGJfoT6xYmkc/bTmb3nD2wasjiGkNBOgpO8j+2WLqYcpDl6WCC
         E/8gerkFIBUl/00oX4VtRJECK4AL4Z4vsAfXi8gDkZgQL6gNFHoCO+mTZrfH+ocvcQbW
         rIB4asYqjebGvTwKAIgoWVvluitMSZ73DpIBj+w9l4MwuV9BGBE3S0JfNm5gE9e/lLdx
         jbPYSANddO0BhyvNb504oKEQa6vynhyhnNMHTuXwRuznqp1Es4cMC6syZrzO8GGo0M3r
         lmHNJkv2QJv7sf5xrrb74wHmYf8o+w22Q5QlG7cOyhbNuLU+0W5EBu3JVeF/YG9qHLFb
         aTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782896354; x=1783501154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY4DQsLIWN155WO3Hf1JbtTFIG9I3zBKpW9XXTHmvwk=;
        b=P50Nj0RZwavGdRoShXERGuxYgK7n11+WZGI7Ykcs1pGiQPZdN9Rr/EYmges5Qt+tpd
         6hcm/githr+piNhG9Am95DZj8nRU6kgmmLvnxW4QoRzSVmRsTVVlzEVc/uOH2BAhWqW6
         AMru/lFWvGbIW6Y47cJRJ7BYAYeUIFvMn15J3ulwBNv1rlxMEipEtd7PLNrTF9iLvzYB
         IiUzL4kJdg3VGzsJf36VCLUCkiL4oIn/yJotAmiC5sg18LDtfaiQwuGhkQ/WDk4qv1xt
         pfC0LCTL/53qaxP0yE+luKQzDcllCZ4u7sqObt6uet96U/MHNj4Y9Bvx6hcLZT0amPF1
         OIqg==
X-Forwarded-Encrypted: i=1; AHgh+RpYExIRb1dUcLBeL8t1+c3Dqsy3X2nV8gvgyJlnyX3J/xVKC987sGdlQFnDP4wJsjr7otHTG9B/r5Gh@vger.kernel.org
X-Gm-Message-State: AOJu0YyE2mm9NT9lY6SkM1bEAIIo8du4yulaAe6C4ZDK6E6XBnxNyjjy
	GssO4bwiSawKVru1EnUm41ZPvktEayIoaoSFDMGbp26KFUZG/ClLwnXf4C439vF69ZD0iQ+rfEh
	O2igEJ6Qxr6rhn/ovH2ciEl2YnQTk9midnhk30D7rn14cHgfosj/MFiYBx6Il+BjL
X-Gm-Gg: AfdE7ckr9bx0pDHJ8GIlhTqTYwIr4gR28G5xNFZm6C3B3nsIs3872rsGlkBZL30Xp5A
	HBawrV8AKml8+9/Ojj+nAIeEfUBDvPbmcyklsUkTzeiW+PO764DZhXDuv7cdxPeiMlvq5+NjPcH
	0ufBfQ8NM4KCNSMSqrCkzSAuTZ3wkryJzKG9w3PhGTRgdolwHk1Hr5N2atdQfhtsSpItOsJxV72
	B0EJtyGtk668X/vw/FBxVlldz31VFF3A2q4XBAX4yuK4WvS8JRA+zAUn2Yh2UvnIsgs55roaJpa
	Eumcja+Zb9ZEEaXX08b3jynRmIQVfGEvEdwvQa+BTly7UIbjbgzjKGrGgAfQgTUXNvV1s1EYTmw
	RaKjvYBx/1+g1y5EIfXt1ZACyCW3EZZt1oJsYxDKKj7KHjw==
X-Received: by 2002:a17:902:f711:b0:2ca:302:2a36 with SMTP id d9443c01a7336-2ca7e678096mr9413075ad.2.1782896353932;
        Wed, 01 Jul 2026 01:59:13 -0700 (PDT)
X-Received: by 2002:a17:902:f711:b0:2ca:302:2a36 with SMTP id d9443c01a7336-2ca7e678096mr9412865ad.2.1782896353497;
        Wed, 01 Jul 2026 01:59:13 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b8fcfsm28370085ad.64.2026.07.01.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:59:12 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:29:07 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage
 support via overlays
Message-ID: <akTW29UMV9L/TK9D@hu-mchunara-hyd.qualcomm.com>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
 <fg4lxixp4fekhxbvisohgxoiaqya6gvuw5czflkk54kvr75xs4@nnze5nvbk2ix>
 <aaWh9ThZJK49Ex4o@hu-mchunara-hyd.qualcomm.com>
 <ioyvbf5wqfvu6ddl4ua2upow7wdw2xmdjszuoubh5cbsko2ovg@gilcelxn77di>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ioyvbf5wqfvu6ddl4ua2upow7wdw2xmdjszuoubh5cbsko2ovg@gilcelxn77di>
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44d6e2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=yZ2IDrj3TD960BM_Nr8A:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: p9tLg9NXc9aecQ4gcvlC0HeZ5jm6gq-d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MSBTYWx0ZWRfXwyEPCLInni8k
 2OLVojW9DA6wL838i6lgu29ITbfI+2EKVXIcDzfaKZFGSt1i8IC++oz6h5aJroH9mD36CEM5B+i
 GEdPEZdGG1I1zyyV8HLzh41GXfH0Er0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MSBTYWx0ZWRfXxWEQv4PghwK+
 V1/FoN2rapx53dtrd/0mSjBYJAi8WixP5VrzPKQEzK+a4k6sniqM201fU3WlEhUlDYekd5FVNJc
 gMAgGheLnDQ7wk+MnTWIxVWgbTPaH5agH5PV8afq29rqbU661bcwsUjW2ekUWefD0HuTjEC45Ua
 XIGtOFBuGlWnWv7HeiCoKSsre6BFzlFA4OaJrB7DGZc+i8rSOXhwEduh4aTcgSAK9HfA1M5mBlC
 4GykoYsdx6YtNz1P3wq2j2NFwM6SN1xii6nuEyEuhFR1t5zwW0U7rV/MSKzWJSWNb0nLN1To5Lq
 2ZaIwQNx2WXGrp/aEScDk8j2FVIDsFk7ZgKKnEh/hum41liGMiyCPmIqTy5agpJeJFZJy/9aSV5
 t/E+hIdqLpeANMvKpdbwOnyJiBw/WXl3XXaC+aXIpD71pStEh1qA4NvYTr7jCar/mMgLy0lvHxI
 AS2HkPXp6inwPcVn7RA==
X-Proofpoint-GUID: p9tLg9NXc9aecQ4gcvlC0HeZ5jm6gq-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010091

On Thu, Mar 05, 2026 at 06:52:17AM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 08:13:01PM +0530, Monish Chunara wrote:
> > On Fri, Feb 27, 2026 at 10:07:33PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Feb 27, 2026 at 03:54:03PM +0530, Monish Chunara wrote:
> > > > This series updates the device tree configuration for the LeMans EVK
> > > > board to support dynamic selection between SD card and eMMC storage.
> > > > 
> > > > The LeMans EVK hardware supports either an SD card or eMMC, but the
> > > > interfaces are mutually exclusive as they share the same controller and
> > > > resources. Previously, SD card support was hardcoded in the main device
> > > > tree, preventing easy switching to eMMC.
> > > > 
> > > > This series refactors the SDHC configuration by:
> > > > 
> > > > 1. Moving the existing SD card configuration into a dedicated overlay.
> > > > 2. Adding a new overlay to support eMMC.
> > > > 3. Updating the common SDHC node in the SoC dtsi to include necessary
> > > > resources (clocks, register ranges) required by the eMMC configuration.
> > > > 
> > > > This allows the bootloader to apply the appropriate overlay based on the
> > > > desired storage medium.
> > > 
> > > Is there a default mode of operation / extension? If there is one,
> > > please define it in the base DT and override it in a single overlay
> > > rather than having two mutually exclusive overlays.
> > > 
> > 
> > The LeMans EVK has SD card slot onboard and eMMC support via a mezzanine card.
> > 
> > However, if SD card is configured to be a default case in plaform DT, some of
> > the properties like 'no-mmc' would conflict for eMMC use case which cannot be
> > deleted in an overlay file, and vice versa. To avoid such issues, definied
> > separate overlays for both which gets selected based on the actual connection on
> > the board.
> 
> What would be the result of not specifying the no-mmc in the base DT?
>

If 'no-mmc' is not specified for SD card use-case, then during boot-up, it
would unnecessarily attempt for eMMC and sdio paths which are not required and
can be optimized with this property. Hence it needs to be added for SD card
use-case.

If SD card is made default in SoC DT, these properties will conflict as per the
above explanation.

Regards,
Monish
