Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794489939;
	b=1NreStQ85LD3szhPQKjjUWK1KYQ4O0+RYF7ERgEunOUhcbzMKYBtZU2gDZq9iXslU1O8
	 XsSKlCD8yUXCVGZdqGAA2xGRyzKe1gbNXy9gndifWcXEdQnQ6TDkYGa4ZWZ3gkso74goJ
	 6xFCHMn7YRUl0Qli4tdddSrNDVsW1YOv5iuwIXAva2AmTorJKbhg/nzOA+g6fn9EnjKG4
	 ienbudW6cMSGH2LlXNKpDZqW9VKSvvJurOBzc0orfL8NZ60V23MDJJvAwSv69Rc5BkMtD
	 LPkDljDaV0lfDH5IZ/Og7FcPCEi/8HzyuErLZDAPuk34k2PohNI7lCsaxihSH90askg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
	b=bYD2ikYUvr1JQd0pVWJ+Zhxa76IXUOOSdu4arNAXJr/ry15RqURUxLFI4dZ7Mx8+PZrc
	 VoATxRryVD/USyYnnr/uojWExnkwGTfC5+m1nXaK5Mw9gG7aRCzQaoYO/5lAPDHPNPg7i
	 kKSC4jetKWeVBbAarFxWeCkwIzyHzxkaGYm1nSDRssdweJembrrVzC/J66Es/VgJtk0l5
	 mLr75BRwbfekO12s2XtlGSr5GDQ8FU5cWAFuUA/V/FroAVPXEZq10N3ARLu9Uvm7ZHurH
	 6AQ/oqv4u26DDTcL9eIG81v+r8m/nAIJOwEHbB2uv/bmHcD6wySW+jgVfORgPlo3TUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=u+Yela27;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E5606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=u+Yela27
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4395d31228so578541766b.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489937; cv=none;
        d=google.com; s=arc-20260327;
        b=bIdB2p2fEQJ0SDRpAc1aInllK/Xn9Tmar6QYdyQwA936te0BNsQdRGv+6kp+r5cemd
         gxVKVei+911NGp+N9/DtX0rl1fiz5P2Hqv3GyZRfbHU5+EV4Nz5xWSi5fv0b2TUSnCTP
         He+mSzWxY34At0PuS4QwsW8Et//1YmKCl4Km27m1SFDuOEKiMBREShODVTIm8k49tOBe
         +a3H39RS1cZnnQPtlgZ5iysGX0CbMSuWDWua3Nq4MRRLoPHQ/JMVrJpZ+sMiRpwMrU7T
         wF06l1YiczC9e4yC+qCO1ItDiwVxsWIH7lglxQHqyqgIchN+/TKWtbNvx914s5UjE7Fq
         qjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        fh=Az+7FAL/J823sU6p61Jyh5toOu9hxR/0rO/XTO/pDhs=;
        b=V6TmkvKSceqREOx0JqIT0CxqwbKAWnzpoZnstkRNMefsToRjRYoFOsG87lmvyzcHfH
         XxAq+8utO4n8BwVPzFQqy/S3WWbs2vwqGIPArzXlEAOEzdWsobPOmmYTgQRaiOVH718O
         pSDpBPytcUTfegKuqltyCdm5/AjphsnoFI3/UiizlBjcNjLBeHpypqU79S92Sxsl6mXT
         QTJ2LmqGx2wvTHVtpWLx32GjYii7w7ggYiZjWboP4ZT7sE5ldwl/FqdV9GFAsyIi1HNn
         VA+OVcud06XfZl9/z6Q/CyqVbk2l6a8/d6TIN8I3tG1+0PdUPJkZGlDE+OhZmf99oAa6
         wPxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794489937; x=1795094737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        b=u+Yela27ys6WrC6O6cMeu8FbCzQ1GxNwG/t9Lv3qK2J01oLMc8YnEOhkrRQVrP50lc
         oonW0tndDuePWY2dgnEqV0N3/APvsKjyw5d/y95ft1LMbzTKx7h3LjfXl9clk6RoC9Us
         RRUX4Jlo/wede39EAd9CKmXpzyDucIJsQeuNRs6cqg7qkXDxoKHG/YB5XhS+bLoHtTsE
         dRbPnE523JDyuMkpSxGzlabo/HFRZDLwxRFZWA1lpLg/CcmETwKNwk/gCIECEtQ3zSrv
         nFfBGP4vIgGiO/pBr6ZjJ4ngeUqbPbZltyfz5K7B/RHtuz3jRS0SxN21KXhj3m/agjvS
         AbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489937; x=1795094737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7Re7D8sh20+8UvmpEtbEexH0DREKJTutui6y5r8LDI=;
        b=TtCds2XD9k+1c0ON0q6JPiGEq8W8zIrIhWw0azDx8vhEAKgyyJn5WlcuJstEc5s37T
         +5QsvEaBOtlLJZmDAKjn5voguu0whY+MpDqOL9MnDSvMSmnS15GSpe0PVAnQA2RqHb3V
         njHwxNU+CdEkhBHRgw2h3Oz0NKst8rlKX30POLkztXkcD0Y5G/B75kvM5p7lmmYzbQyq
         cVCydgMzbsIsJ86ao6ezYDSPhdxBw5EjsmG6kQLvnn4mo9IdoJUt7af1zghwvA3nWMkH
         f3ivSPcUf8PR0hMGIu/dpNMRRegP5S77kXU1iR5jdmMgAmqdc+etBbV+lI63EDhM+yaj
         Qlrg==
X-Forwarded-Encrypted: i=1; AL+hErHMX0OGiYpA1/jE4pbOjQBtSqyP1Hre9Tl55WFJLIGqjIv7MrfR7aLbmk0rRCA4ekfyyjDcajgy8MTl@vger.kernel.org
X-Gm-Message-State: APuU4Z8FnbERBKYJQ7BM0l/c2csn8Ojs/lmG6rsCqkFKJxVeJZwagYzY
	P5xbUTGX6mQEZoYiRI8o/rWVmNtWuwndSs9USrd7s5SG/6R3nLHXKZFC04VfeQbBrsOHMY71XxU
	hka1WUs74erLpzcoMeWMXL4436f0zEWyLVW5jZTHzAw==
X-Gm-Gg: AYBFou2qofivWTLNdSpZtMiT5QRjdTfXK7mqxpZbRc6cvNJKvBEdvOZh2vqE6X/I4Qq
	bRnaQTjb13lvfVpLaslKaEv6Qslzkr4l4ruiECeDrOeqfRcKgfmXlwCdTu8v+7ZLO9LkyPTPLBJ
	a1bN0cCjcjNB43SENL/0u9V77sgkJum7tC5qNQAQd2iVjxlhgIWEJuU4mlcMwUyAxevnOJPkwO9
	SZ0Xl3t7bwzW4EFlgdlqdmk3aYswhJ4h0PSPCP8DdVLfAqiRbu5Wp4ifqIJueT7wMI7v7EG70NI
	IxtgW0Ji30s6G1tQ5UWOepN1EVD5sZGSNgEcqAkhqZ+73fd0w758koXkgHOtUvy+ZpqbsEeqzzw
	1wJo3kDcMF4+4AbEZsINnzk2V3lFPXNvmV0mEKpMMevfCMWT8bO1NIAcNNsTbLYHkURO0
X-Received: by 2002:a17:906:4a8e:b0:c50:750a:6a1b with SMTP id
 a640c23a62f3a-c50750a6a81mr275760466b.29.1794489937376; Thu, 12 Nov 2026
 05:25:37 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-rk3576-evb1-husb311-v1-1-99c2f57ea2a5@flipper.net>
 <dd59d491-82b0-4047-ae98-f8070f6be112@rock-chips.com> <CAKTNdwHbxnknob9NdjqWUcGU2fURO5B7V4kTTK+fvEYjNDOLCA@mail.gmail.com>
 <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
In-Reply-To: <dd25880e-be2d-4adc-8384-fa4a7160a4df@rock-chips.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 17:25:26 +0400
X-Gm-Features: AclHuK-ae6rK5KLX865N1ZAAiK3m-L1yS3bWzPXEljeOEVs3lx4mmzdXwRyUZxQ
Message-ID: <CAKTNdwGHS5M4yNKEqfKV8hEJRAYf3wnY1Z6jOWQx7e4cipTF9A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe the Type-C port on RK3576 EVB1
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:01=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hi Alexey,
>
> On 11/11/2026 6:45 PM, Alexey Charkov wrote:
> > Hi Chaoyi,
> >
> > On Wed, Nov 11, 2026 at 1:31=E2=80=AFPM Chaoyi Chen <chaoyi.chen@rock-c=
hips.com> wrote:
> >>
> >> Hi Alexey,
> >>
> >> On 11/7/2026 1:52 AM, Alexey Charkov wrote:
> >>> RK3576 EVB1 has its USBDP PHY routed to a Type-C port with a HUSB311 =
CC
> >>> controller and a fixed-voltage VBUS supply.
> >>>
> >>> Describe it in the device tree, including the wiring for both the USB=
 and
> >>> the DP side.
> >>>
> >>> This makes the data roles follow the Type-C port's negotiation, so th=
e
> >>> port stops being host only. It also leaves the VBUS regulator to be
> >>> managed by TCPM instead of being hardwired via the tangentially relat=
ed
> >>> phy-supply on a USB controller. DP lanes are also muxed dynamically b=
y
> >>> the USBDP PHY based on the Type-C port's negotiation, so the hacky fi=
xed
> >>> lane muxing also goes away.
> >>>
> >>
> >> Have you tested this? As far as I know, dw-dp driver does not support
> >> Type-C HPD yet.
> >
> > I did - it works fine for me under Linux with Sebastian's patches. My
> > primary motivation, however, was U-Boot, where the current phy-supply
> > hack breaks USB data role switching, due to VBUS being forced
> > always-on. With this patch it works, and now the DT actually describes
> > the hardware, as it is supposed to.
> >
>
> Oh, I almost forgot about that. I think it should be this patch series[0]=
, right?
>
> But I think we probably need more than just this series, because
> richtek,rt1711h does not register the HPD bridge, so we will get this:
>
> [   14.828983] auxiliary aux_bridge.aux_bridge.0: deferred probe pending:=
 aux_bridge.aux_bridge: failed to acquire drm_bridge
>
> Maybe you have already added the corresponding patch yourself?
> Another option is to use the generic AUX HPD patch[1]. :)
>
> [0]: https://lore.kernel.org/linux-rockchip/20260806-synopsys-dw-dp-impro=
vements-v11-0-0d508505f383@collabora.com/
> [1]: https://lore.kernel.org/all/20261020072816.180-1-kernel@airkyi.com/

Yes, on my daily-use branch [0] I've got a local commit enabling the
HPD bridge specifically for TCPCI (69b7c806b334). But that's all
driver territory, so out of scope for DT discussion ;-)

[0] https://github.com/flipperdevices/flipper-linux-kernel

Best regards,
Alexey
