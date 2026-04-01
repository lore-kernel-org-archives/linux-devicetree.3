Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED4F47278C
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054693; cv=none; b=JjvrFag+UA9uZ/acQoLv5fTxGzO+kPYQLsAmnnu6tCCChbZwChwn3yO9IGhFb5ECVvscDxZvVOP8iQUwoTW0yimCXPRW3C00L936eV8x3JEdo/2FeICWOWHy72p4y65TunC8FFbLGND6uy9GtyqOR3UIF5q9PauNIuZ3fVMJaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054693; c=relaxed/simple;
	bh=eCtz8uzC3ZyJhfgNc4nb8F31dhwu97gqPpF2HvCCt2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=uMO2qbQ2So7ZD4MgRV2YJ+zOxXWz6wMEIN6dEcd2lfE4q7xiHfhoUJnWytCOaqkTA+eZJWWcAg1fhZlv02A6Km0Bck8Im42vcprNVsrGmkMyDgsA3Nm5nPt9pbnN4LbzKwDhijNOpSz6fD+RzhLxlXH+z5+X7mpnHMLFkywFPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1sXwq8NL; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1sXwq8NL"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b97f9587e6eso1048845166b.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775054689; x=1775659489; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCtz8uzC3ZyJhfgNc4nb8F31dhwu97gqPpF2HvCCt2s=;
        b=1sXwq8NLtGdu7z6wbHuWIWyUwu/5yButIFiqdCXoUK8dS+HqT0cW9HZen+TJFo24Ny
         L8+15BoEum2NVrcrquJ7scAQPBtdnPQqZyh8pyZW42E5vPez6PxzlZWHnydLJEgxm3M9
         vTO3/WDspo0LQg/TytROkih1KmnuprcqS92TP2t0p2LxVdPi48V7Uo/vxCDanx6E4SpM
         NywT1I8Xa4yxvU3uRlUf8NfYOZSNT+cQwi2e4sLpaMukapsxG8Gnz2hrVX36cFDHdt19
         ty2aTjEfoptx5PUiuVcOVWM93GsLHLTXagjVw5sFVMzIfL/6xHIdpNkQS+ZkXooL/F/9
         NChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775054689; x=1775659489;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eCtz8uzC3ZyJhfgNc4nb8F31dhwu97gqPpF2HvCCt2s=;
        b=FaQ9xZeOg6BvdloLzq2btSxK9y17Wxt3CrV8Ezw3RCXeCSinYgDB4M/VjludkDmi3x
         w9+CCUhLPNPZwk7CRF1AA0UVxZ8TbovxwkwH5GgiKTvQFptdXtn/raCZfKrtUgOVfbz1
         LxuX0D5gX65SDlUkDECVxEyGRDmbiUnXBk/QYaAMpRvQ0S8whNTpJbn71A15LBhdzNlO
         E0RBf1lu/0PMMp/KAiyZzZsHzDAKOlooe87OFiyw1eTPMM5QSU6fjmNGrFm+B5jw4ea7
         Iz5CaqCMJpRXiUFrnzhXi0kcjAdFvGgP5hB6/9A26vMFCwpB1wQZZhQ+38sgkoJ5b5gH
         k5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWmtbQo8hkZXlyrNPsI6S0e8BuxmsAGnP6yjmGIw1X+sd7YqiMqQut/3i+r91sGXsh/Y93WcOoCZc0b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80ACsHwdLgKIeUtQWfvkQjh0qhokOOG9VExPHnDW32BLLF505
	/6Hgp91O7bmdpbC/aBceAn8T3fJLlE+RjKiqAQeDJC4XQoW1DC4hdBKq2Va/huHzFOg=
X-Gm-Gg: ATEYQzxS6bVQrH2Ttrz8KuLGQRMZO0McJU4m4j5nDlyxgw5GIpqJnnhHwUDvRN9budh
	sYKWqanImLRxJyzbQKR/eG1RB6ic9FV/KelDcab/UiBUmuzXSI+YyCkBwvrv2GrppE/fy4240cO
	PBYXcRX7FMYVc/nA4xCeWQqgsUTP7Ta2ukaiSd5BPOzdzK4ZopLnqoQR5Cvhk+78Q5jORBMXAVj
	u4HqwnEdxSHePTWwwFktG8wPo4vKkKHJV+qwBA5gvHKAn8p8LcXVtn4juiP9/lxtmbaxDdl5YRB
	1qJIY0LGkYqoxK7Uokz1oXx6CgtR4FSy/8ESQV+GCqu/1s/APT86hTtovRXMtLPCIKelsX2nJu8
	YqMBB2d6HwaOkHZetosBtQ3J9OTWDyeyjOpGNb5RV6vG4AI/j53NjnzAbe7e9PIymbjIDw71D6w
	66PxMOHgw7aZuI30GoYcLHUaVZXcZjBupowuwC+1eXK4LEyqRop/6iblPT05f7HKH5TkA1Dp3Zz
	lrkNoQWzBzeC00r6Yn9s/OtH559PdU9k/Jh
X-Received: by 2002:a17:906:3750:b0:b9c:1a5:acb4 with SMTP id a640c23a62f3a-b9c13ca82fcmr213347166b.45.1775054689211;
        Wed, 01 Apr 2026 07:44:49 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fb3sm538720866b.31.2026.04.01.07.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 07:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:44:47 +0200
Message-Id: <DHHWDE7QEOTO.1AQ85UBLO8IQG@fairphone.com>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Griffin Kroah-Hartman"
 <griffin.kroah@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] Input: aw86938 - add driver for Awinic AW86938
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
 <20260302-aw86938-driver-v4-3-92c865df9cca@fairphone.com>
 <aae7fRYaoDHMptyu@google.com>
In-Reply-To: <aae7fRYaoDHMptyu@google.com>

Hi Dmitry,

On Wed Mar 4, 2026 at 5:56 AM CET, Dmitry Torokhov wrote:
> On Mon, Mar 02, 2026 at 11:50:27AM +0100, Griffin Kroah-Hartman wrote:
>> Add support for the I2C-connected Awinic AW86938 LRA haptic driver.
>>=20
>> The AW86938 has a similar but slightly different register layout. In
>> particular, the boost mode register values.
>> The AW86938 also has some extra features that aren't implemented
>> in this driver yet.
>>=20
>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>
> Applied, thank you.

I'm curious, where did you apply these patches? linux-next doesn't have
it and I don't see it in your kernel.org repo either.
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/

Did this slip through the cracks or will these patches still appear
there?

Regards
Luca
