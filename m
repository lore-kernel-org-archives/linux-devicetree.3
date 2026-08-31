Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D38D3C0A1F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217349; cv=pass; b=N4RBVOgmFdKNMLhUXi19opc5Gjy1xyQhIyQxh7b3SUklLm6iOfLLN2ltsQWkfJ/GVJsnms6/DReLnovtKlHJgXD/CXY5SS7Wq2FfZ2Z6yiOIhwNjNSwEkxqxVkgq4CVrMN8hFkWxW2a8Fh4cmwKDL6pfH9+FDMR0MMqsVRpey50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217349; c=relaxed/simple;
	bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+BWDwKCCCmRl5n8JYWfiHLCUNjTPH7MhlkiBQAhPw+cRZL3zoiaK6T7IinI3LfGME//rJI5OSHUPPmztf5Ab9YX1uxlzT+T0n88v9G49Y+IQ2guqUEOqwGRJfH9WVvxmNUXhvyiWAwRT/17gliC1s/Uf0cwZDWNWEc/gGsAWe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifAx9q3R; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifAx9q3R"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a6010a7234so444538a12.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788217346; cv=none;
        d=google.com; s=arc-20260327;
        b=MUnl3pBmUy+6wrd9vq+FIwzISkLkAG3c0PSbV/ip+/qLRkWHTwE0P8CnwGPqaoZzp8
         LgPM+fduZesFtU/nKkiIC6rBSpcgcHD0QGqB3DNGntOdeIJXTMVjThuxPODUNwiR+Bwx
         7T40viBKsZCxipKCbihz7vFMFT54S+wC7eOXzJTS7Ld4i+IuovFHgQeWugxy/Ik+mdll
         i5oLrXoQf0LsFJtvhX91379QwHa8fHRnHTTSwjZmVqK0/bjruJexFNqGn/Acy4tY2+Sr
         nfr3LOpe14cFihlVA5AjwpmsALorZpdHHxLPagp2qivHh41ddYU+t6nK/SZMJWDEjHhQ
         R+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        fh=+2AWMpumipstUdFBbZ4syUPMQCHzDrex+WkKuGkJITM=;
        b=p/XGgif7z4gWBy6y6ctJxshLOacFXC4klsmoq4y2OFItI0VeqMA0IDVpmD5zXUAjfb
         DPWvBB1dqw95Bm2k79x/cqEI942YX9QP2pwc/AVVENdqE2mV99rhIKq9G/BRYrQsUvRn
         +qtiVBkcPNRsO//waHTBlmr2azfYY+NDMFl3v7wlY2KkBsa/7YyxVHfNhuAhBi8SJVRB
         0GW9r/yhN65roC4IF6sl+am9ab/QHs9czy8RLUmH0SE3/p2ElwoG6OcEMFd17aOz5qvB
         BzX4CiV4rK2/NG+DYdZgE1QzOU9uk9uBunQKClWpun6jVkuR6as5M0KHn9NAlr9E50Dk
         FO6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788217346; x=1788822146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        b=ifAx9q3RlC6ARp0ztxGHiYF8R3lsuyHdfd75Sqji3lFJLwP1kpmViWwvQmd3/yfyf0
         KDR7P0k+mJVSuHGHi9j+Cp30NtYgS7RSnqe/9mj1DIQapHsSAYDHRdYi6QCDWPEegnva
         Q1LwIQMU5eX65XkPV6ONsYL0ILxwlwxtBIK+OrdH40x7apHzJpTM1vL5jLVuDjgf/RRe
         1NXEWoMdp1XPBhOzgUnNUuOqrnuNNC2zkwvQDdXHa+XolulBwfBR49ADVuqUlZ74oufe
         uwWazj5+wpTOwCjT5pOhOa/vx2mfBAyq4Od3vJjLrSSh844fV1Y8S5U5wifmNeX2Ees5
         0RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788217346; x=1788822146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPDBNzw+KWCEMD9k4Xi8uOYkWevA+MR4K4kPjQL2HXg=;
        b=qBtpV31gAJG4SFnu+s6CQoVmxrSFIcc8OZtF70kv62G6oU9wTXH+liZ3gCkceLSx1A
         GG8wKlfQQTC8LvqthCImB0PxQ4WeklJ3/5nV2U72pnRO6obEAZ/KHUfw1QnhBuWCr+PK
         ZP26zgCgh0sd12OZ1bB6aYf5mxSq5zPAB87yGlGFL5ESpDXnC4Wgw++QrQ9j1yXit7xB
         gW9GoHeHYF0HvwS/GxQls6deHdHLsJXTtn/b9Q9Q7UyfmAPUElAPZSDvoffna9tPI2V1
         nMYJvX4mqQkiSNxZc8G7kAOuOKwC2QYjv2a70WM2cUO4SqpM/UxrmfiBvt2Z9q6gYgLj
         +smA==
X-Forwarded-Encrypted: i=1; AKwUvBwGbW3Hvaqn8DSLjiuLVe2yZ/ttSo7w2Y2mpARGcmMFSgD+xblNxM90Tk1U2jP35btQLGn9z9/qzCtZ@vger.kernel.org
X-Gm-Message-State: AFuF++kVfxKI6/QNqX9xsRGU3gpyOpRLc6PgnNkKw0xZB41OKCfFKLGl
	V9hoGC3x2wspWFJHy+Ne0BJCHTDAr4wGFTwUbi6zTnJezEsqK1UjJ/vp5ak9X9ZIrz6AIJtjfqc
	65TSS4fyak6HXefeCsJSQDMot0GVS1Wo=
X-Gm-Gg: AYBFou0R+WAjuQWW7KIWyWQPtxSEqt1sAAisz2oBnGpsniR84XL0kiObqcsBDp5nkzf
	Szbsax3zRc43lZx94Vd1h6+6kSKLjOEOW74DYH4Dz+JT0OVg4u+6u1fcRX/UWemAhCEWWrfquM1
	vh9V7v/wtKbz5c+StknBa5Ct2usszysxZ4/i+hM10qczNTnwSFRoqha0oVJAP+Mre9wabsAITT9
	zhTIWErUURtPe5n7fVtJVAAdm6mA23yetevF9WZHw35KYprKRI2MDsFvi5iXT3vhg35K06/Vq4Z
	C9xoSooQ+T59GUJDw07FCSJ0LnofQlOqUgqbeygJIXBTDj2HsSlGbnWy0mwOPkOwJoLtYxNHH59
	nvFY=
X-Received: by 2002:a05:6402:43c6:b0:6a0:d411:930d with SMTP id
 4fb4d7f45d1cf-6a60d36c8ddmr8084948a12.2.1788217345227; Mon, 31 Aug 2026
 16:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
 <20260818-ti-am33-usb-v2-3-66fd44d66824@gmail.com> <20260831134643.GA733140-robh@kernel.org>
In-Reply-To: <20260831134643.GA733140-robh@kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 1 Sep 2026 04:32:13 +0530
X-Gm-Features: AcwNN1X3HOOhqJKkqX2zS7vFMQd-QWtG1Ec31OOg1tzrgRf7iaa2sG06AC-hKII
Message-ID: <CAOWyW_4RpTD9zAmFDr41sFOj5LtRaGdad7M8QCvQNAQDtamYMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] ARM: dts: ti: am335x: Fix redundant interrupts
 property in USB nodes
To: Rob Herring <robh@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Siewior <bigeasy@linutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Ravi B <ravibabu@ti.com>, 
	Kumar Gupta <ajay.gupta@ti.com>, Sergei Shtylyov <sshtylyov@ru.mvista.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 7:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 18, 2026 at 07:58:45PM +0530, Bhargav Joshi wrote:
> > The am33xx.dtsi defines a single interrupts property for the MUSB nodes=
.
> > Several board-level files override the usb0 node to use
> > interrupts-extended instead to include vbus interrupt.
> >
> > Since both interrupts and interrupts-extended cannot be used
> > simultaneously, Add /delete-property/ interrupts to the overriding
> > nodes to resolve the schema warnings.
>
> Actually, both should be allowed. In theory, an OS version not support
> 'interrupts-extended' and 'interrupts' is also needed for compatibility.
> Though in reality, we've now had 'interrupts-extended' defined for a
> long time. I'll look into what's causing this warning.

Sure will drop this patch in the next version. I also opened pull request t=
o
dt-schema fixing this warning
https://github.com/devicetree-org/dt-schema/pull/206
>
Best Regards,
Bhargav
