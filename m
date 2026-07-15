Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471C83CAA4F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112581; cv=none; b=ddDeql0ULIGuQEJq9sFMO+/5hxqHg5lawFtp7bWCZXyC29gxmsBo7XGuP8jxVEoY8JsU6soq/54730ayWMgZvfxULfnr0ZLgP05o+wfNQPyT2DTA0YAXjcW3/6LRU5t0k8QG9DLaRX/JAgo81KbZd19wbDKtgHixF/QFE8pIPe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112581; c=relaxed/simple;
	bh=wylHWGzjDFIH1QOZ54Z4bb1DecJkGi8SuPFSZbyjgr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEQAR0kdW7cSpZ6/GzStobN1N9/RQ2/FJmTYOnvZpV+NC0SZmyMuUnLn4aswqkEYyvnPiBTVk3MzBF8mddzcLx/QF3AlGSOpdy96NwC2T3SDucy1YMg/novyXvpDDMKSbjMFIDiE6CU0AtcmpUaeo64et+7n1uALMWVfaakyO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zzDOhNjd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zzDOhNjd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso36308215e9.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784112576; x=1784717376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=49AS4xsltVhoKM2n8krRWILDUm/Xmz/Du0DlWZ1325o=;
        b=zzDOhNjdwwpXzQUuyT+wrxr0zqWVlAdUxVJdAHRiJfWQnSxgE/Fi7vat85DPw4MN9a
         w4L4RGOSAXlx4mEqo27UDFV3YPysPE+vGj8677VK/OCqTf3subeORtnhfTygdl7Tj/7I
         Sy5z2lxxY5PjsnD0mQD5F6CpEMV8TWHJhXt1c8ZJ13+CNcgHGEdNhIfKUbDi6/GDSm9Z
         BGh8cWygUcN9EKj6j+exM+hTfcyQ0Q5fxsxkcZcOVeNID6tnzU7WDnf7+sda+OHLA30+
         1SOIAhxVpKiXUug2/Awf0HVwbMqrKw866O8qNIqaq0LYww3CkRlcbsPhe788Os0RyrrD
         jdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112576; x=1784717376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49AS4xsltVhoKM2n8krRWILDUm/Xmz/Du0DlWZ1325o=;
        b=ExdMY7mHgy7iWNRPS962lFcCIeeKrSvls1fR0ci8z7zikp9DNmpuPk7c8aNruwlRl6
         1MJqYm0SG363BplWOfIvo9lWDyi9aBhR34r+fcLgfBDPIqaA3UFBuM9F7fDpktHYvwCH
         QwOHCDypq/3EfQM6ZmW80Yew/qy9i1EqnPjWt+SZf0UeJiseTX5wXoRT3wxhi1Tqzuwv
         zNs3+Pz+UElM7ZUaxfVb8HSzorFSgVFWsxZdaFBcNAGRTvRV9F7q8I1s5XIFw6lC2dKj
         O7ah+NESLfG3iQqTTJu11e6baXeCpGTSSpm5Bj9LhwCvOjc8E9G1pJDnKk5TfmPKrd3D
         y0/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpPoW5l2H8gv0IgY4Sp8Cz1OlWXHUXOulVPPXAfFY9pmaaTELbizHDndm6BdByFOmX2vWJgPhvd8BKG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh0Nt8fChX5dGJ7BZHhM2Gya/V/k0mAT8z1hPuJw/r2uSTGS17
	2lYLT26aGWfecgjNf2HDxS419BaWtxMXBWG2R8q75qLVY3nYt/DFo5ksjZgJT5UOalg=
X-Gm-Gg: AfdE7clT0NLP03R2X9ciNSonV6qlbysXXW3KKSZRd04xW7ctiFBeBzYrbsSN+IiekeR
	bCwSW6TQHgd3Cj8wVYM50Fyk+hDyAWZJjPzPh/6zZMHJPHSnG9XlYWorSwiKs+py/g7b09xnTfe
	PwgTDOjjaexOEL1u3ASss1Zi1HzbmS0jTVpIy7NO/v5Fwn0ZyHZ9ucmNPeQ33vJUnmgYPSulPqG
	T/5T8DG0WtVnZKHptZue9eAA5AI+Lpc9jA+VtY3kTRQKJx/EakBsR19hQVpN/GlCMVwu0+VrW5r
	4/R8xuC0tLhpGOBs1hvwkc8+H18UIkDzWqNpG1LwhnPvKrfP18QrymsRRM0ueu77AqYIePrpK0h
	NM5Y+MDQj5OwR95XUFp5ArU7S2XCqyMHMg9mphottwhEagl9052RXg+10jwJ1oe0SxMrAJOUBbd
	pR2zIuVoo8TLQaDO/rLZthplRl
X-Received: by 2002:a05:600c:4e93:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-4953c286bbemr26256415e9.26.1784112575922;
        Wed, 15 Jul 2026 03:49:35 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d62b:a557:d06c:e9ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm13449387f8f.21.2026.07.15.03.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:49:35 -0700 (PDT)
Date: Wed, 15 Jul 2026 12:49:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
Message-ID: <aldlu-Qdf_T9uwbf@linaro.org>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
 <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <401ee2b2-1d82-40b0-95aa-005840a5078f@oss.qualcomm.com>

On Wed, Jul 15, 2026 at 12:45:48PM +0200, Konrad Dybcio wrote:
> On 7/15/26 12:34 PM, Stephan Gerhold wrote:
> > On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
> >> On 7/13/26 12:25 PM, Sneh Mankad wrote:
> >>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> >>> the latest wake up capable interrupts when the CPU cluster is entering the
> >>> deepest idle state. This is done by sending IPC interrupt to RPM and is
> >>> implemented as .power_off() callback by registering MPM as parent power
> >>> domain to CPU cluster.
> >>
> >> [...]
> >>
> >>> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
> >>> notifications to manage RPM communication when the last CPU goes to power
> >>> collapse.
> >>
> >> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
> >> fallback for platforms which don't have PSCI OSI mode specifically.
> >>
> >> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
> >> all of the arm32 platforms) that don't define any CPU power domains, so
> >> perhaps it's necessary after all..
> >>
> > 
> > I don't think this fallback is relevant for the non-PSCI QC platforms,
> > for the following reasons:
> > 
> >  - They don't define the MPM.
> >  - They don't support cluster idle upstream, so they don't need to
> >    define the MPM. They can't reach the idle state where it would become
> >    relevant.
> >  - The setup for cluster idle without PSCI is essentially equivalent to
> >    OSI, except that the SPM/SAW driver needs to program the idle state
> >    to enter. There is one SPM/SAW for every idle domain (e.g. on
> >    MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
> >    SPM/SAW instances as power domains to get the same setup as PSCI OSI
> >    (I had a draft for this at some point). So if someone ever implements
> >    this, we should be able to use the same approach as for PSCI OSI.
> 
> Yeah I said 'necessary' because of the arm32 platforms. This would probably
> be the preferable way forward.
> 
> > I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
> > when this fallback would be used.
> 
> I think it's generally only SC7180 and there's definitely no MPM there.
> 
> > We probably do need some fallback for the old sm6375/agatii DTBs though.
> 
> The sleep logic doesn't really matter without the platforms hitting a
> specific power state anyway, so I'm not sure we actually have to (i.e.
> the regressed path can't be exercised today anyway)
> 

So are you saying the MPM is currently assigned as parent to some dummy
idle states in sm6375/agatti.dtsi, which aren't actually triggering APSS
shutdown? Or is it just irrelevant because other power resources keep
the whole platform on (RPM clocks etc)?

If it's the latter, the question is if we might end up fixing that some
day without further device tree changes. :')

Thanks,
Stephan
