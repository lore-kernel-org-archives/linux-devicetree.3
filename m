Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338B831197C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180693; cv=none; b=ccOuXkhQXKX5TONnlk/deMmsrIV9WZk9/mPYU9P3Xklk9ee7GG3o8DS+ZEseZJfSLZ/bmHyPBQM1H+YNHIlk7iFmiQRtUmU8XjjN4YUejcowIe8qo7JlpLqRWkVz6+1YEpdBOKhd8T5UvhfvJXdHL4C+4cLkds16hnkzim3BagI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180693; c=relaxed/simple;
	bh=+GWDGGbtT20VSu+vCSgxyZGvak1PFsiVLn78RBoQ0lQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3ytZJOILHa+Bipr8P5Sr9UchXGGpLcU4n2Tx3DMomBnwSY0zlJlmpbejyYlQEFnHm24cZg84Lnzan+vgx1ud67Y5pS2MdLGsPO69RdGdGvbjl3cIR6u034HabdWbmXfG3SE1ofWIfhNjgw6wvpaqDEidOjsmOCPPDMLcWFjZ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bw6jNGKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bw6jNGKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72FC1F0089D
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180691;
	bh=+GWDGGbtT20VSu+vCSgxyZGvak1PFsiVLn78RBoQ0lQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bw6jNGKeIFNH7sZFrP0z0Zagg9pDJggcazcxMJ8NbE8vziAoNbaCrOfA0e3ZKyFC2
	 fafdVMtkeaxth7FR7pxHJudDoa8v9eqzahrn2ThLI8OkuqVFeKiEpPv9OynXuMgARc
	 3ijHcIrcZo1vInJNsr0KHrVjYbCTquiRks5WovepWGKM/egsiOAJqqNmfIp2N2CJ9E
	 gs7HHB3nI2QEFyZmsvsMrF0mj8kFM7jdqNihg41xeTbWSDv/bRAAxUjPpOdPen8YCj
	 JFPPrnvTHshT0FDUfQcybTsF5jfSi1hvn1oD4waHt1SZ5ddpzvyuOe01+MbugscMeO
	 nbO48dKWEG+xQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ad2ac0a0a9so108130e87.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ83OEROr6E3coojpzqT7Ge82sJF1Hcb4YrFndPPOgoCZxSt3RvTPeEL4L+q7C5gWYPBYu7lMntsKhVM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+6DKbrsm6UoHXXVdmDJUM0CRNDlpAarLQNHdVSSHuPN58Yak
	WLayBquBZYdoPbM/YwbB01Yu1CiPy79B2nkCIYLIs4+jUhaU4tnRjbuHsStJ0c68xCF5oZKEKcF
	5sfAboTk6etgRgBSTB3oJA5SA331Iz8M=
X-Received: by 2002:a05:6512:3985:b0:5aa:6585:1ba4 with SMTP id
 2adb3069b0e04-5ad27fb5d65mr737232e87.41.1781180690702; Thu, 11 Jun 2026
 05:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
In-Reply-To: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:24:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=m6++zOfq2gP4-y4N7U6nx1buVM5KMoxWJ_9PM6RVV8A@mail.gmail.com>
X-Gm-Features: AVVi8Cfk_Nb67GqHhEaC43czvNZSfeYaRUO8eNFAOjUIKcFR1-C3mQUmgjkvIvI
Message-ID: <CAD++jL=m6++zOfq2gP4-y4N7U6nx1buVM5KMoxWJ_9PM6RVV8A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: ultrarisc: add DP1000 pinctrl support
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 7:29=E2=80=AFAM Jia Wang via B4 Relay
<devnull+wangjia.ultrarisc.com@kernel.org> wrote:

> This series adds the devicetree schema and the pinctrl driver for the
> DP1000 controller using generic pinctrl bindings.
>
> Compared with v1, this series is narrowed down to the pinctrl binding
> and driver only. v1 patches 1, 2, 3, 5, 7, 8, and 9 (vendor prefix,
> CPU/SoC bindings, DTS files, and defconfig update) are not included in
> v2 and will be sent separately.

This is a very good looking driver so I applied the patches!

If there are any more snags they can certainly be fixed in-tree.

Yours,
Linus Walleij
