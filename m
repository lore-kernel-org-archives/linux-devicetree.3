Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8862521883
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756077; cv=pass; b=karSdhhKFXzFj+/dPkKdtLv8eoiffh5nUjcFff40rdhVIft0HtAQns21Mrs911ffkymbZe0cC9nOWhruDISiILX5+UTxaLv+puoQnr1oV9D7R7vI4r3BFDH9TxPv2nBjclmmglsVyQRFhVPNyU8sewDYiEdqq5f0qXcsU8yWJxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756077; c=relaxed/simple;
	bh=CehHEgeM+pdJ84HcW1hUWFnVx85CKeaL98EzBzD3WlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcHgR/R0IYSWX1a6nXOnQRs0ePxJCc1l9u9MnSFEF2Iba8q3zcGM5vX00FJOUfb86fhUMAHeQAAD8VpeHC2d8spN0BBMMDPaCJPrEhhpFXN5roAvYH4vC0hWfd90SSC/bxtFpOPUuD+PcwOzpQS8+NIi0IKJtBkDzMlHlaVPvjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=U/h2JdbE; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="U/h2JdbE"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d45ae011cso11429767b3.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756068; cv=none;
        d=google.com; s=arc-20260327;
        b=W71Empn7fVff5A+R95aGloC8aWw82nA+/RbJnmsghRxMaYewoAM5ctzzoBOOLKi8xX
         tHNC9xZ2Fb0aUczoe0jqHRJ+NDGwDn1N/UU2nyQKt8URF3ce0FvJuSvXpTwaosluM5Ai
         vXXtuu9fEgwA0sZxocj8QRRef5jD51yzAFW5kKS6O6C15w/6B4IxPYsm7XSxze4AOMU0
         5WI/WIjHXBYPan+tv+RZECNvc7DX6+WX6lu5PS4XQbOtGaLUxdTQ+bLZS4ebET92whOP
         EX0grZBKtV3+E08Ftrad8alZL15MQxZQ0eozxrXoxHmvNewhJPK13bv81pPpOOf3+IlF
         q9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mSi+JtaOU6ls557xXyeB3xrqvaX8RUi/FGWcovRXz3A=;
        fh=xuqG05u+sBmiQZT2EeSktRirhEwzb2mopr5OGFfXXBo=;
        b=VBegoTjB0hmZeBNCpejuLzcgB//cZHpt+LFq4IdU4yJ+xzqFL2HjVeUuEn/+Z59FyB
         Uoc13e8EIByiVhe8kTRoyYipDUo4SWulazHU9iwJRx2oalfjZBbEISaGyiXtX7YFflRW
         KAcGcEsqcpdwhUQwl82uDXS80uV1Vk+eICmn/JybVkkJSNTGL9hhuoumxTGstiDv3TJr
         bKclZAb/CDeZfyKsg8Mbmo6tt6yJRl9lQ1FaX0HQq7uer8i/0NGOs84750EApG8G2Ex2
         sZ7hmkFfKOkn6+vd+r3HZ5Nz+HugYRoWyWl+SHML98ZF7oDC+ClPlYX+9KNLNNDrCVMh
         WSAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789756068; x=1790360868; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSi+JtaOU6ls557xXyeB3xrqvaX8RUi/FGWcovRXz3A=;
        b=U/h2JdbE8ozNMa54OGq9H7mCHViUsIveVo7KQZ9AY7M6CcSMpZOchVw4h/W5ni8bWq
         AJ8HQepQ/yY+mfxeaf0l9bf6qW26niSYfoxFbR5mxESvfVCTIbmqQtUp7T2uLaJvMX3Z
         ipbMU7j0MQdgoR78ws+bBhQl/842lkDPn5/c6b7PX07BuPR0fhXDEiHzcEt6Qy82QaJK
         sfrlfkqHXOGJXPXroMgoHxFImrjmRdlaslmhLVM40EuxUoPr+Lcre41npJUfSpGHvVjy
         mgDiq9T0d/TuDFjOXSxq3MVZvR6yTL6G2qsWGB9AwR75Y+t/BM8TXQ2RDYHX1gCCGniw
         Dj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756068; x=1790360868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mSi+JtaOU6ls557xXyeB3xrqvaX8RUi/FGWcovRXz3A=;
        b=IliZETVUbU+81u6WTkm5AzRGGZu/7Vd5wlxJP5Vkny4xe9UEp/ZWkYic08fjFgyjjO
         OJ+zjI6Q0eMNAVKXcR6QawOwoW4jOr5yiu988ADTbSw1S/tN4alT2uv7JWo52VymlIdJ
         npVKBl99ejKLKj4sLu7R6FOBB6tAozfkpcXSphlwOOxn5RGq+Og2FBoI0AjB9ahhZKCQ
         rHkaSlernEgZFsSJ0cV9c3QNXCX0Cli5VsWOQ2iQNEUi15+cXmHsyH5PSTwHp6Tjfd48
         620BFA33zK85SLvXCviwwDopXI39eHywcAIANhY2JstbrLkR40cmU0HK+FEAK//eMHrT
         Ni3g==
X-Forwarded-Encrypted: i=1; AKwUvBxBRPtMv/Equ3lHO2lZwGc+N6S1I8X8mu0TwNbnAxPZdk/k9Dk+cTRYvg5lXZbOacmaEo9/vYKnQXCF@vger.kernel.org
X-Gm-Message-State: AFuF++mehpmU2aFHmLmYxz2H/NRoDAvMlDV1CeefrfyGkVrNXhD9OxV+
	D7nmTLKi+YmzODWD1pDBCJkKNCTz4L9x7H4MU9ofnUBbh4LFT6KesDFY9BQLuz75VyhtQ8Hj4sd
	LlCaT3Y1pFnn9bnQRjahhYAHXr03bwL5BOiBcq1gZlg==
X-Gm-Gg: AYBFou3HVHycdIhfH+pdSsCmbSCTvPJUMLYfulkmTbPt0uZWxiKWkM37gmld1WanlLW
	y/MXJE0CH3BgMuqBzGmChnFG3eOw8ZH0kFwebt2YT+dDfedTDZ1Osc0NQKpFRyMUtB0oEhTzpWZ
	S2miUn11DhExYvMA5fL5WLv0Jg0dcGZBrKzdTU719G2v+NZppRflHnDtGIK5z5QyeYBAN6993r3
	nRXaTav8nWYqi46ki3TipLLZZW8cQDGyAv+cIvPl++tzU99VUfaOa6LJpsBc3OecCaNcWWKPGVY
	vW26oC8A7VwCFnQ1VajKKpK3F7WKdcJiGL++POWTqssrlbau/xwpa0JZ8aJkGZpwPGRkfE1ojyX
	lhWv1vEuRvRT3
X-Received: by 2002:a05:690c:f13:b0:89a:63bc:8c3 with SMTP id
 00721157ae682-89a63bc0b51mr1161317b3.77.1789756067983; Fri, 18 Sep 2026
 11:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918031326.68542-1-karl@asseily.com> <20260918031326.68542-4-karl@asseily.com>
 <20260918032414.DA9E01F000FF@smtp.kernel.org>
In-Reply-To: <20260918032414.DA9E01F000FF@smtp.kernel.org>
From: Karl Asseily <karl@asseily.com>
Date: Fri, 18 Sep 2026 21:27:36 +0300
X-Gm-Features: AcwNN1UT5LNp3dA_PhMdzD49GGBeCsZBq_3bsdgYVOg6s5JM-3kAuBBBQQ5Lo-k
Message-ID: <CA+gvwbot+W64DPHxgFNM9PfPF7tPVzhOmkLgL5CjdwPPMwSU2g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Can we use named initializers for this array?
>
> The I2C subsystem requires explicitly named initializers for struct
> i2c_device_id arrays to ensure proper device matching.

Not taken, and I do not think the premise holds.  Measured against
broonie/sound for-next: sound/soc/codecs carries 202 i2c_device_id
tables, and 136 of their entries use the plain positional form
{ "name", data }, which is not a named initializer at all.  The bare
{ "name" } this driver uses accounts for 196 more.  Matching does not
read the initializer syntax - i2c_match_id() compares the name string -
so the form has no bearing on device matching.

The other three findings were real and are all fixed in v4, which is on
the list now.  Thank you for them - the FIR-versus-suspend one was a
genuine bug.
