Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792970253;
	b=qFFCcfiVDPR+yPHUzJAA5JyijwjjU/80svujUdN2Ka9XX8KUmo3Sp+XXI5tQOaCnr2es
	 0Sos7ujsQLcS/QRO+jq8etxa2IP8tiVH0sVsUcQSqdRtmG1xmOvdqM6UZftQ5zx85nuTI
	 9MQ/zX6MRgQoH7JsfyugipBDylc6Z8DSYe4nN3UiVo4jXyoIrrhvLJTu4kr4Dob9CvA96
	 JUcCfa62zvzihiLuu6lHr2iG4yqAODFPFp7IcRsLLGVogvk6n7ZT+aKTaIn8KCqbo8/aK
	 l0BWwdmvzEs2fFA6kg/Dz03mrDnNzol9/3cdCGUzJ20u+PF/rIOG4aj/BmjiMXWx+cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792970253;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1hVXHSSffpcrZE2/dIYy72FKUCCmACgLfbWxbiqGBxk=;
	b=rXvM7k/Hny/IPWmM8gntQHsrnUota18Q+xCfYixixW7cfWaUuSxkANVPR/zcOfjQC8iv
	 V8Ne/XDP8t6qA4YjwZnCmP8tQ0BxNbrsCpguOSsFGJgbLroyUZGBI1pMS9/U/02NO4cDj
	 U/r0YRtzbospfGh3BVI2AifyBm8PBN7274oNeAosUfVTVtIsthaJwlhK3yoyI0oMRG8pO
	 w8GI8DJvgYWAp/PMOyu05sjhgoNULoklZ8xF+MQ+COJLNhlnuczG9yxLTbFwKed53Gk4O
	 6AqTFt49G+pvgNIwnGJXrNGGCPLRE/yczcIG1YUvjAdaXgeNNUpZLuBVWYAIys3IygQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ToJEnEMm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F73606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ToJEnEMm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1671F01825
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792970253;
	bh=1hVXHSSffpcrZE2/dIYy72FKUCCmACgLfbWxbiqGBxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ToJEnEMmIVfjGvCctb2YmRbovLJqqptQ0eSV3TAce8knL7eWYTU8PTmxl7Ld/AmZl
	 vhDC/HZ2XnCdjus2MWVCm+ZXiVoCJHpFf9z6J2Lhrb01hGUfSsZvElxkJlW92uZ80j
	 GyZ433ftSpxT55G0dDNI58CjFVBlZZqZ27zs7JnTQNCsEeIASZ+sgkJ7L0NTSXKEvI
	 aeI2yWENQ5WqhSgqUEQGZDLPbtwuMtZ28Jl+tZPuqHhe1/j4s4dmj8rrN/dViySDkY
	 VVm1d+x6wEsC0dO4zV0HHs+Mp28n52dYY+L7uTI52mzAYEeURH1tNEzfkZqB+VKhc/
	 CbGThHW6AJjOA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso1806211e87.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 16:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZaonMZN4LpCqXfIqnBBpw1bPRBhM8wKE1KEyqhup1MoGtZhP41gEewNikG6iImfE9PXE3Vc8msNM2@vger.kernel.org
X-Gm-Message-State: AFq9FYK+vdnIagOB6GEqc6mF4c3W5y93Raws0mqluv4cucenBqXzF0c4
	2lVOTAsz4J9X8AlDt5WfZesVLfBKdwFpeFW/wFBwpvbcBTikjwa6V3TZb57wIBc5lmzHfcS/wib
	wkrIUZ5S1sYZdT7mi7pKyrVh5RVFulQw=
X-Received: by 2002:a05:6512:128f:b0:5bf:6c49:42b3 with SMTP id
 2adb3069b0e04-5bfb716e26cmr1579164e87.6.1792970251552; Sun, 25 Oct 2026
 16:17:31 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
 <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org> <CAHi4H7Gc9_b0L5xdEBd7dVdbYMUirWm4vSVaSpDDB6yZP8NSHA@mail.gmail.com>
In-Reply-To: <CAHi4H7Gc9_b0L5xdEBd7dVdbYMUirWm4vSVaSpDDB6yZP8NSHA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 26 Oct 2026 00:17:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=sYrL8BV6ap2POTbT5=4iPEjG1mAUexwexiiQGqEUwPA@mail.gmail.com>
X-Gm-Features: AclHuK8hWfyHYeZsI3EvK84CwASHP7zMUupYjb-JuuwHInkQdWD88LMlReS1FOY
Message-ID: <CAD++jL=sYrL8BV6ap2POTbT5=4iPEjG1mAUexwexiiQGqEUwPA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
To: William Zhang <william.zhang@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 7:02=E2=80=AFPM William Zhang
<william.zhang@broadcom.com> wrote:

> > +&CA7_0 {
> > +       enable-method =3D "brcm,bca-smp";
> > +       /* Dummy release address since CPU0 is already online */
> > +       cpu-release-addr =3D <0x00000000>;

> Nitpicky. In your dt-bindings patch,  you use <0xff800568> as example.
> I guess it is better to use the same here to keep consistent, although
> what value doe not really matter.

I did it this way on purpose because I didn't want to put 0x00000000 into t=
he
example in the binding, lest the DT maintainers would complain
about that the dummy is not a good example.

Yours,
Linus Walleij
