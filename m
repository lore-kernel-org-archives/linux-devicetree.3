Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF65B4ADDAF
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087281; cv=pass; b=mr+rD1fieZFdMdzvT8evbH02ESuK6l0RPn3j8r9YpSNAFy4kLsvMzfXQEHfNo/9mYHlBrKwsHu0Ho4yMHrFWvSaofDK0SU3WTa2Ga3ZZz54TKE1GMKefWKzcvZip3Cf465QnhSmbzLqc8qgcI7ohHfk201f0j6BPIwopDkVZOW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087281; c=relaxed/simple;
	bh=iJM1KHmjIZ05feWWOBSzK5MzppaF6eNDe2/g69UBMwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ua6Hc/F044polYhFSKQ7GuMJhfs62XxtiU5MqWSuu68mDCjfQKFIMPuRxVEiTYRMoD/whcpfighfr7/fklSSuBR2Ykbe/UX/5LfkJRfmd/aOe1QzSaEdkqcRdXg/Rtx9c3Y/tL0QJmyhCjcms6zyCDxHK9gIc2xAmfV2Xu2PvwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgeHaMlh; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgeHaMlh"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c8ccc7755so9883827c88.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 10:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778087259; cv=none;
        d=google.com; s=arc-20240605;
        b=Qru0gBfUf1oipPMKuuB1a/6zSCbCKvlwW/dEBDasNglvsimVIg9SowpKtJrbtF2J/2
         YHMKm8KgyhtNBLeMfI8rpXEzWo0q4BBWb7irg0dXIfHwzJF/iP/wwqKgrXpH/o+L++l5
         JdSDv4SByJQYH8MSq+Mg0jCAV1e6KPVpynU3RMIvVjAxRtHLg0YmsvHJEIgVt3i/+31B
         Cq7QkfCXl5osUm2mpAlo9HZqZmmdJiMn87MCLP2bV/lGmnQjHQNC5afEhRQThkSl2P/5
         OzGHQ1MusZ9O+MRu56I7n6k84cifc6vyWJsDobl1ejU6FIS/plVZXZIRaRMSfys74/+/
         mSgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/v9MQFgIlffWIKDfvYVkIbMIOBfG0NkHQjEHrpEJtA=;
        fh=+qL86+soc8cBwzzm+Hg1Ij+QMHSLW+5FoMc9Ktfgs6Q=;
        b=e3ySzPoSo1ZsWJG52h9bK0c6yJV4vKvTMH3CHV545UM1U3Ln6YCy1I0VjppkObtIq/
         gWHwiz59CK6lt/RIG+hdl0JGDnqD+0nlQfaHPldHDbYKHJ+emDt6LM5vZn/niicypW3W
         u55e2M35FBTIs5hPCo9LRIQxyzkrZp9HgRHKA68qg2OrH9Hytq9w+rVYkwDK26QiFmv1
         Yk9TwKtA4JHaEF4R8yUv7yp33fSBXUdH8HVCKq43wIRV+25JZaU9Tmj808qS09Hx8l7v
         lGZP/pOUSgMuP6wK5vrOv1aBr0Jh69HU7rxdO9g7Aq22cQwrE9wQ3JC52vb9Q3YgtELN
         YIow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778087259; x=1778692059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/v9MQFgIlffWIKDfvYVkIbMIOBfG0NkHQjEHrpEJtA=;
        b=JgeHaMlhpxcfihV2bxQVluPHWaJhlHv/K+I05cO6JicjQXzmZXPzRHqW5EdRXnnC+t
         kIznZjod8kcAZ2XtlWWmNgp9Mf+mRh8blLtSUUFF778/SVEsdECxCFbgN2nFWCPeaMMP
         QvHwZMC3LtBa0AssumkYr9W/Ntp62zXO4mBGup+RMAflm8X1C7KmkeqrX+2ITQbciEVO
         eGNegO8jSxNnWCAdLC99/FO+jd5tApgnSdqHC1GG3EtBqDIFq2x8IXO30ImQ4z4oNx++
         745lHODgSRdqgQENxCCJUZu02CstJYspKqlVfJ1o2y9ykx35QxbgCcntA3P78L545Shm
         Byrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087259; x=1778692059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/v9MQFgIlffWIKDfvYVkIbMIOBfG0NkHQjEHrpEJtA=;
        b=ZPskPxYo3MhxpSAWnrqyoXzDEtUEn3Ww/HYaXhTfSz27MhpBEo5sO5kdazAOvX5G27
         323u5XQAvUpUzHJX1v7NwiUMdTWDiGxZTzo/5QHwm5OdYw2NHVbNJZqlRkxB3gH/2ZEi
         cc8Pyn3yz2xT5LBbzg6t1s+rY+NEiOncKhUPnZ4nWYtwP6+9MC6KA8pmwivnzLsf45cw
         sI/MXquyLtTf7LU5yzE6IBK2kPjTYqIa5UywOCIZJd2ONI2ujls4RHfMl6JHcrz9jNOJ
         jCx1N+iGaFTuYXSMg8Rn4mDEA3nT9OBN2KGFhnBRZkyHsdjhA8LvrNwQwuFDvw9R/Rnc
         84mw==
X-Forwarded-Encrypted: i=1; AFNElJ/EbTE67otSOLJ+APhct2Q8tNxMg/H0haHiW+5dLNC9BZrdXDYiG0QJaFruRHiVfuGmJeix/6up0sCk@vger.kernel.org
X-Gm-Message-State: AOJu0YymWINGjRm1cuA1DLB5xoRBLPkjssok16wVJ0nqBfscynU8Kptv
	Bxpovj6nsMDfO3vQr9sdNLjpuEj8bsxU/aIX3bYRfh19Lfc6iwFoOWnG/VU4n1H3uNFGhw3I4wx
	5ESAJUdafyskWeZxPvbd4mJyXvXAoDPk=
X-Gm-Gg: AeBDietuVDwRDxPYrAzM5p2tWeU1wOfZBAgaBJ74lU1VnBpWDV42VB455wPZeDcMtOI
	MzyLrlItJFopIrf+yJQ1//BsGKzhYibdV9WpTgjhR52RaUheF2AmDW4B73LCU0GMqvxHRtK4Ljp
	2+VsWflIDFDD+uq/xcwCUcI+ldkdxdOJ18zFU3+9eGLksTUCzet85Uk51ri3i3l3GKR/7JahCvq
	ZL78nBC6Fo5b5L86s/kC/fpt1zol7Ppk1k5EQPL0Z1f6+skdvrHwX5vbWXeqijlGukwVP73I3u+
	hWpXY2L7aerJybtXLB1fw32IKOPF16IdbCU4ZoXrYP3lQd2m7C8Dx/G98YWT9+Qi1oTgj6n9r0+
	pShxJopfVmRuxxwAqCw2/37xjFNDXZjRJ1nb2mWB/nxyb8XuE
X-Received: by 2002:a05:7022:1e10:b0:12a:b932:81d3 with SMTP id
 a92af1059eb24-1318e7f7469mr2001823c88.26.1778087259155; Wed, 06 May 2026
 10:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
In-Reply-To: <20260506141040.1368918-1-s-vadapalli@ti.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 6 May 2026 12:07:12 -0500
X-Gm-Features: AVHnY4JssmbmMVgWYy_rr3kP7VA-rHrBRjYoeKWuuDrMj3pK-MCy7FEMX0YQL8c
Message-ID: <CAOCHtYjJRmr5LhRePqaOomjVHb=o+B8-3+6BN89Xx9erwRdcng@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] TI: K3 DTS: fix USB Clocking for Compliance
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, josua@solid-run.com, 
	w.egorov@phytec.de, matthias.schiffer@ew.tq-group.com, d.haller@phytec.de, 
	francesco.dolcini@toradex.com, joao.goncalves@toradex.com, 
	emanuele.ghidoli@toradex.com, ernest.vanhoecke@toradex.com, rogerq@kernel.org, 
	eballetb@redhat.com, afd@ti.com, u-kumar1@ti.com, stable@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luis.parga@ti.com, srk@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 9:08=E2=80=AFAM Siddharth Vadapalli <s-vadapalli@ti.=
com> wrote:
>
> Hello,
>
> This series enables Internal Spread Spectrum Clocking (SSC) for USB
> SuperSpeed configuration. This is mandated by the USB Specification
> section 6.5.3 Normative Spread Spectrum Clocking (SSC).
>
> Series has been posted as individual patches for respective boards since
> the Fixes tag is different for each board and needs to be backported via
> stable.

While yes, that's true for stable branches.  Since these are so
similar, wouldn't it be best to push them to the board soc family
headers?

(Either way, I'll be backporting these for Beagle. ;) )

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
