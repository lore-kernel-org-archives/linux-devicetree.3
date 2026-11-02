Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626339;
	b=peZH6BPAUFc3KlVj5tW4+aFmEEMUBCbv1ay2iFVmj9jAz3s8oTuyCvjIv71v1QzM7TM6
	 54fPeas9t3eR7xYZsJqJQSsm2BkrR0a4FLq3y6g54OwXGJ/2zti/nruo0o3KFm8roFlbU
	 HUE8Joz1uIiRwv5wAyP33oJEvbNmyuAfhEPlkpIODdAg+11MgqViDYF48bIDJEeCVALnY
	 QtqwYixHkPGeuUDu2OC7MqwdfwsX8aO13uS59NK1mKQDox4MZ4xxmDMj4mQAPOqVjYWOG
	 3QRanFGdkPKGRwzLs6vh/CDO9LA4LAL/Dj4bDZIELP3UMCCcTRIsMvH/IUw3h9wwBRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626339;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+KNo4bpud+SMYchvK5KCDswdCQ037Y0sDC1uaSlb35Y=;
	b=IaqQW5sovp5HWbIvtycw2fveg9m6qZi8NZ96yYvpdk81FOnBMc4Dh0OEVHXsKrddcgpM
	 ufASGv3cWVQBM907NoX+pm3GsfgjXe7ubeprUPZhwUvfEtUBPiQKjJdHcHC1ueNwMW2v2
	 ZBqDDhclGWpGYUSxgPdzVgylJYagXb+WMRb6x92mV9sGXNkCNthj2lnIBJ4wgaHBkoEIm
	 nn0e3IFkY/9AsgmA73P0SfyScKADgCexGO+gTMvVswkc9vck4Yd0SGwrRx587OKIpzzl3
	 rNiMrXglU9aFEkgtYg25weOcHS4uKIy7e3Mri8z5xwIZp/ZWKV+j9gTW7n+N9DzwqrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xvj4Jys2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F6F606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xvj4Jys2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B432E1F00A1A
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793626338;
	bh=+KNo4bpud+SMYchvK5KCDswdCQ037Y0sDC1uaSlb35Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xvj4Jys23GETo9grfLKMbvGSh4RgLw8HsL6f9b/mbpgnyy/pKYBZTFLhYKpZLQg6H
	 eufN+0t1CG+Nn6Ru4WCURQFx92w1aPoaY4k0AxuwOeRnebPpYtwpmow5ZYkyC2Z1lC
	 GuM6/I+9vDPnlDuALgVNJUqAC3AtA8EQjW0gZqjIWzPw779QKPlyYa7BfAKS2uLYN6
	 X3jvMer+WxHs0dd8LrPgeVnsiGPWarPBMAdukj3Bc5kgQmC+y0LRJQLUXztDevdpDA
	 x/fz+si4fpVRE0M8+bLkvaZjJrk5DC+VLPO8vprdqT17JBXWvq8p64g345ZcthTtOS
	 USJGxDCz6vZjA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so3213126e87.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:32:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzwvQjMUSt22X66aZsM1FM8xL7g6VtzTMQbo6C+kqUKPaii3E3TAEC+aAK6t+e1rIjvR9cQgXWetjz3@vger.kernel.org
X-Gm-Message-State: APuU4Z8xNYtfp5h3oOprEkrL7jlsF52KIVKgaAxhxlCgKf5mcNZDSWTv
	8jIZIGy2aqzr8qoEHDcHPPDb4QvNyA77MXy7zA7frIdwDC6a26CrqSOutT+vg3cacuFYzbOjZQm
	/pd+awzsxfgIJBasOi/nR/vWZIqW6enI=
X-Received: by 2002:a05:6512:230e:b0:5bf:b313:993f with SMTP id
 2adb3069b0e04-5bfd9563266mr3175580e87.18.1793626337495; Mon, 02 Nov 2026
 05:32:17 -0800 (PST)
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
 <20261025-genexis-xg6846-smp-v7-3-rc1-v4-3-b352ab54f46b@kernel.org>
 <CAHi4H7Gc9_b0L5xdEBd7dVdbYMUirWm4vSVaSpDDB6yZP8NSHA@mail.gmail.com>
 <CAD++jL=sYrL8BV6ap2POTbT5=4iPEjG1mAUexwexiiQGqEUwPA@mail.gmail.com> <CAHi4H7HkCPWTTMW8tmejx0Cxojn9Xq_Jkm09nH-=v3tJKUGa_w@mail.gmail.com>
In-Reply-To: <CAHi4H7HkCPWTTMW8tmejx0Cxojn9Xq_Jkm09nH-=v3tJKUGa_w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 14:32:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLny6x9u3iFH1HnmeahSBshzghEXvGFpdFJHN4kzwrrWHA@mail.gmail.com>
X-Gm-Features: AclHuK9aAhqsiw-4JCsbkVqcNN-7vMsWqGS51RqakSrrCdq1GW5KD7oX1FrUGSg
Message-ID: <CAD++jLny6x9u3iFH1HnmeahSBshzghEXvGFpdFJHN4kzwrrWHA@mail.gmail.com>
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

On Wed, Oct 28, 2026 at 6:03=E2=80=AFPM William Zhang
<william.zhang@broadcom.com> wrote:

> > > Nitpicky. In your dt-bindings patch,  you use <0xff800568> as example=
.
> > > I guess it is better to use the same here to keep consistent, althoug=
h
> > > what value doe not really matter.
> >
> > I did it this way on purpose because I didn't want to put 0x00000000 in=
to the
> > example in the binding, lest the DT maintainers would complain
> > about that the dummy is not a good example.
> >
> All right. I don't have strong preference either way so it is up to
> you or if anyone else has anything to say.

Me neither, I'll do it any way that makes Florian merge these patches :D
(I think Florian does the mach-bcm business?)

Yours,
Linus Walleij
