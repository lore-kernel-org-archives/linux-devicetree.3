Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452B4A3418
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865370; cv=none; b=EKN4gu5ql8SsvxZzuCVNnfRTpJIfgsT7zuCGcRTVrN4FUqa90YoAIo/xf+vpXcch0uA9+DTtmbwjTMd7mk9AnjQPrAWN5EZZWHugsMTCr7rqOJpJ2VICCfa53A71IX9DmoHU2UPvGqXf7Eh0/mP9uPomH+wbnb+ZI0sWAlVHcSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865370; c=relaxed/simple;
	bh=sBa8ltIh4+pH6a10LBu/cywBUv7pw7RdSU2NuPS8+JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnI3WKEcHMpihFGlJyR1e2a/2Q83Jc1mbr78dA6fybfaseoVHLvx6BaSVdFBCwkwrCQKOwV6GVM000J44ACO/RFeNSzuTnrs6cZmQ72RmQt+H1BAljsCMgtMh8EgGvDRLe4cnHBmJAr2Sn8iZPWqYq8EMykhIliIck2wl6Y1Hik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vFvNbTPV; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vFvNbTPV"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d8dso16300a12.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788865366; x=1789470166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RrjJW9gbDN+73JFbZgzTZ4EPfRkPYet7uyVCoDfB100=;
        b=vFvNbTPVuttGVMVUGzXSVNzSMTkdbPNvpYiXKzu/83cxPeqd4XtB6JYuzABwrEFwlC
         uscSDw7lNExciJ9U0b/1HUrlKbXAmV5O9zO7zIgDCMXGTrx3CgDRpq3yqNlNCvo5jUaI
         RHLZ4Py1PGu2arSFMl+p1VFDlpzX1I0MOI94EecpSPdlPAM9ul1rfnIHL/HX2QF+55w3
         uHRO6UNoouilk+6GASamhSXzOSZ8L9//n6q7Z9zHe+zFTJImMBr2HSAT4nQm79/ciHEA
         /Z1H2LkULeul/VMHz2NmnFAVCzPloUZFWKC2eybHWCc9aOv5EoXaCDXlp8av0QbU/yya
         MANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865366; x=1789470166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrjJW9gbDN+73JFbZgzTZ4EPfRkPYet7uyVCoDfB100=;
        b=DhHeeRaNpp5K/aQMyD1yjSKY1P4eUyw0RlTgyvS9Guoxmp0RyjrFzbA5uUfmMoShPR
         UN+VzcytPLL5fl/fGKFZzxCnPBMFv4vrA8llU+PCHvPGwwP5M1Vjne9RNpCAm+ciniUE
         YIjPV0v/YUqR4QqraJ+IjZytf1LETi7MF3evS9rnd3d9698h1m64RUYt5K4qWKZ+Fx6Y
         mjSgPqyqtvJ1rCAMRcQpLSElRrJnqzSRaYvTAWldV7FA8XZcfrQc5pIf2N2/6zkQeo4t
         nYUHJxDSle54TlEuA0bo38ywryUzx5S0MUTtosJpYTLG44j4vLAwe4HyVlpo2Jav9AeA
         Qpzw==
X-Forwarded-Encrypted: i=1; AKwUvBw1sue+sbtQpw22ViTQM8kQYIdVifYx7f12jonUqBWvE4cJp8AXmy/XsG5QHBRi2x2NavV2ALsoFcPK@vger.kernel.org
X-Gm-Message-State: AFuF++kND0g+k35A8tW9UWUPg3f0crjffA1MXmxCAqghC/rWWBMMTgMt
	5DZq+otZvB0GR/TdTM6BBOiG89PVzF5LgRA1UKmNaooMQu2RfsdsLZ+irJmSOT4uXg==
X-Gm-Gg: AYBFou2aI7oUSuA8Bp16tr/SUOVGr0HXmd/9yctIo+sXI2gAPc9JAZbARi89ffdncur
	FEb3o6zFdIwCpaIjl3cTFaSB/O04D68DCjxiJLKjz6j/vb2u3c5Dosa9vhkxOn7f/FiGYKVHdNz
	wrz9djJGctaisK6MSCkjDjGVaN05Nhc59w/B+wBxwIR1rmSWOGS+2nzjU9ucFxRtafJq/Jkm2r4
	zo0oivPg6SkDfz+T1Fp08lvLB4B+cp1X9mhuUB+UCKXkEN5jVQK6Xnr/wNPsgXpSDAKytxvsmt/
	ynZavD/qvx9WDojghM4ShXUjnboll4AZYcRSokt9PVorIVVitZFF9ceN4kVTS5qM5mSpYZ6DWbj
	XiVTnuPU2yz/ZCZf4TUxwbXrM0eotXSZZ3XGfIbQdTf8GDlKTlWwl2WyBco0ZYrnhoiVqRqaBas
	U5gX8SFtqj3oPt9XEfu65iPZCRjq1HnMre4b+SP0e+X0+p64M+hbrs4Q4FaJEdaTUhpaGR4zbr4
	fUA1q419uhaiQGZA4cIgLkOwslUSQ==
X-Received: by 2002:a05:6402:1a4c:b0:6a6:9d10:f52b with SMTP id 4fb4d7f45d1cf-6a7f682636amr90301a12.12.1788865365985;
        Tue, 08 Sep 2026 04:02:45 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036652sm606844766b.2.2026.09.08.04.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:02:45 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:02:40 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	jens.glathe@oldschoolsolutions.biz,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <ap_rUIaJGAk-gZVP@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <799c3128-cf43-4a64-a8c8-3f6695bbf424@kernel.org>
 <ap_RKfCbXAVBRtSY@google.com>
 <4d2c00e1-8331-4a08-93f9-6564d0c46aa6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d2c00e1-8331-4a08-93f9-6564d0c46aa6@oss.qualcomm.com>

On Tue, Sep 08, 2026 at 11:57:33AM +0200, Konrad Dybcio wrote:
> On 9/8/26 11:11 AM, Mostafa Saleh wrote:
> > On Tue, Sep 08, 2026 at 11:05:34AM +0200, Krzysztof Kozlowski wrote:
> >> On 08/09/2026 11:03, Mostafa Saleh wrote:
> >>> Hi Jens,
> >>>
> >>> On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
> >>>> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> >>>> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> >>>> chassis, different silicon. Stubble and the DTB loader need distinct
> >>>> compatibles.
> 
> [...]
> 
> >>>> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> >>>
> >>> This series does not apply to ToT nor I can find this base-commit
> >>> in it.
> >>
> >> It's a public/standard commit, next.
> >>
> >> What is ToT in upstream development?
> > 
> > I am using Linus's Tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/
> 
> This tree contains the latest release/rc tags, linux-next is an
> aggreagation of each submaintainers' branches, effectively "what is
> the next release going to look like" so essentially that's where the
> development happens

AFAIU, linux-next is useful to get a view of the next release. However,
it shouldn't be used for developement. It should be either Linus's tree
or the maintainer's tree (as mentioned in process/submitting-patches)

Thanks,
Mostafa

> 
> Konrad
