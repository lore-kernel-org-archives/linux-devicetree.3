Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A139C013
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785389066; cv=pass; b=XbauNKAbPncJqv5pptiCt1aAt1DUczoY/fnHHYrKAo+SIzdx+Qtk9FbQGuEhaPAMuxb05j663wlfzKcjDIFTjilxgacVp6nXzTnFidflq5yHyFA4ZiKrIye3sthcAHdlOEdGt+BE/Q4x95Y9bkOGat4bH2OGznI5iT+zfhnOFhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785389066; c=relaxed/simple;
	bh=iD44/rGtVzEnXi4gt4YVeymeNme8+lpJ4mWrVC12JEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+tobmHScj11tPk3rMtum5CK0RwzZy7vqIEQUwboLiUAHmn7EZ8eCuuNHkCHPPCYs7YS8l09KpamsVe0yDArA5hx4YJh1ntms0mMrn0qoapeLgupXKM7BSBroqm0O1xhBnQAVjfGLEmsNUJ8CYI6LTJcX4TOEIOzwJF/DQ1AC5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nd/NscQB; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nd/NscQB"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81062fdeaf5so6796637b3.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 22:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785389064; cv=none;
        d=google.com; s=arc-20260327;
        b=alTFY1be80Vwk+s6Hheb00yDOaEdBer8fn+hh+3m6W/qYtR2gRkKRjEiYPWhR+rc3R
         Eg4e4AaSPbmz7fb8hYPK+NRAwR+to0tDQEGNi3DIkbXrNon8dm/vHcsAGPM9FzdoP3Ky
         uMlQXJxfl7L/tjQshVvArTQRlioNdZlJoEphRR7ZeELL04p+gO0W5PyELKC6Dl0hllFI
         Igmv85JZoKYjOhV6ZDZ3qNKGMLetF4ZFoPXOgOccx22i2YqMGH5nDoleAyKScK20s37k
         SlUdjXlMdRl59I9Xfxo8+slMXcWtIGrBABvhTtbUssrOvSyaBBLparF2oM6ly9N7XwAd
         tN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rc+hxOuofWOse1S21bWYde75jrC/PxCtGOdh1TnJIOI=;
        fh=oqJDfKF1r9/IhkCruMFmNwZITpLXT3HlZAZwWk0Kf0k=;
        b=sntNwnbrX8QHiXS6oZUuqLN62WeJBI+CmGzBWm23i9yD8DlOIjAba/UeH0k2FDDu4O
         jKqOKShzY/uMJP8FxFRMcsxPLnix5HlN55FwK58JsvXo4h3IokpyK+zAKnI3SWU1BmkX
         6dJW2LCEq+y5EhWamb+GmGLVOqZ9kDY0DsADer55iL8/n1m1eAslsJujoljxf4PMaJiy
         MAH0a9WkXSuKt6UtSI6RYM7eskKW4IpPTEOJ07YwMxyec6r9fSn7PkzTzvSpQbCcvMn8
         3I/bhLDkddG22vLajgAE7cxd0aBlGf7BBQgJIsFzKBno/FpX/H3q7XvcDEokO5EBuh9O
         OfDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785389064; x=1785993864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rc+hxOuofWOse1S21bWYde75jrC/PxCtGOdh1TnJIOI=;
        b=Nd/NscQBcmclqJmOhZMc6shIbf4+LeHSR1xF0OL6XOR1dGCtL9NcfmTYxGlodJxoHc
         Fwfe1UVOUQh6rvdfBC8frjUe3qBk9jvBwmDeLZUhGRwFzdgCK4fskGUia8mFh2+j9FMt
         7WRBb60VOcokaipue4D2p6w3PL4DQT511Ymvm1iat5WAOdCextJef/RP9XFS6ZZ9cLkX
         ZppbZKsjnF1y1SGhaADgkjBm6aZRtGsAYKvZZx3/Ss1aAlCEslYweyigfxQKUnt+YtPB
         zRy3xNnf0FlraOXA+cGZGNo2rMXNdfUZuwE45dK6W3OEwOiPkd+TDNbdcseMI/Ce+FBg
         mJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785389064; x=1785993864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc+hxOuofWOse1S21bWYde75jrC/PxCtGOdh1TnJIOI=;
        b=EXr5xzaSAmeSmqt5VsAmCnl9QybV6AxsvZ/SSF59Fa6Vf6q98sXabMp+pybANkJkQT
         YEKCUGSsov78MHDO4BGfclX6Mf58bts4rtXBEexbR7yUTamVKgq8BrpoQviVqD/usLMx
         NHwT10sxSuWZfyW51YmmcNeRGL8hlNPXBOpCsJG/lRMrEAkylCO9CfqtKjXOll7izaC6
         Ed7/+HDX6YwsJPObsIVYqWe478E6d4mZSZWwG2lnR97T+EwE3dwAoTncLKarQgMLD4Jp
         1IKX3hI5Fid0vFdkWcthutOpz7eshX1uOqQ7nnHeY/XVlPkrIVrAZwuHp3BsLdPPo0Ji
         MpAw==
X-Gm-Message-State: AOJu0YyWk5T0kXe18DZMTKNgBmrZTnN+MY9D3KMFiGdME04hZ6PrrTGX
	+weawipt3oHdSbsLObr5zrtgbvFrMtdRJrCHwaWgkSq6hKzTrIiIrdOVvOVo9sn0ozz2zEEQC0S
	FgPZ3NhcmzXwEM2lWa0Vy5vktHiB5Vo8=
X-Gm-Gg: AR+sD10prw4FD0y3g+L8uOPYJpYjBndG1Ml5XzMEDy3w9G5dawxfT2rdRU7r+r7zVbH
	CrgNN+Fr1DNoC/NdbETc47+oswB7mj/lsX+MPz1y67ZJ5R68sZDwoWqdXQrOLER0oljdkLQDvZq
	kR/KXn6E7qcUbFfwf0Q6HHM53L32gNlrmill4nKhpYgggLkfNp6KFAOQcobNn4GN5/y5YmhtXiE
	1bDYEL2KLtwpGjN564HCXw7/wEFWBC8RTsXhivwNxCCytIdVuyzLFxvzooIHpklnvDvNkKbBGfY
	kEZaW4TtdeXqtdhuRoEH4vvJCJwo/zO54xTPtUZ1
X-Received: by 2002:a05:690c:e192:10b0:80d:ec6:ea1d with SMTP id
 00721157ae682-81fb96410edmr4064567b3.7.1785389063747; Wed, 29 Jul 2026
 22:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729064538.19564-1-kaipeng94@gmail.com> <20260729064538.19564-3-kaipeng94@gmail.com>
 <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
In-Reply-To: <7eae2da9-1d4d-4ed2-85ba-4ec5d389b0df@packett.cool>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Thu, 30 Jul 2026 13:24:12 +0800
X-Gm-Features: AUfX_mxiizW0P8WvtOyPiO4sz2tAEt4IJFB7icocyx3eD4OMM8xqXH7yGV20jtA
Message-ID: <CAHk8Zdt5st9TCUU3tbm+vFgzpsVCjtLYm4KDgJasj88C4AwzCA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
To: Val Packett <val@packett.cool>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	konradybcio@kernel.org, andersson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 9:45=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 7/29/26 3:45 AM, Kaipeng Zeng wrote:
> > Introduce device tree for the Acer Swift Go Pro AI (SFA14-11).
>
> Are you sure it's called that?
>
> I think GoPro (the action camera company) would not have been very happy
> with that branding :D
>
> https://duckduckgo.com/?q=3DAcer+Swift+Go+Pro+AI+(SFA14-11)
>
> It's only been called that (with the "Pro") on the ubuntu forum and
> such, all the other pages refer to it as "Acer Swift Go 14 AI", no "Pro".
>
> > It is a laptop based on the Qualcomm Snapdragon X Elite (X1E78100) SoC.
> > This device tree implementation references nodes from the x1-crd.dtsi.
> nit: "to reference" has a technical meaning here (with the & references
> and all that) so it's rather confusing to say "this is based on x1-crd"
> like that.
> > Supported features:
> >
> >   - Internal display & Brightness control
> >   - Keyboard & Touchpad
> >   - USB Type-C, Type-A
> >   - Wi-Fi & Bluetooth
> >   - ADSP & CDSP
> >   - Adreno X1-85 GPU
> >   - HDMI & USB Type-C display
> >   - Webcam
> CAMSS itself has not landed in -next yet :)
> > Signed-off-by: Kaipeng Zeng <kaipeng94@gmail.com>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile             |    1 +
> >   .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1483 ++++++++++++++++=
+
> >   2 files changed, 1484 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dt=
s
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index e05414290d8e..fbb6b0ef67bf 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -422,6 +422,7 @@ talos-evk-lvds-auo,g133han01-dtbs :=3D \
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D talos-evk-lvds-auo,g133han01.dtb
> >   x1e001de-devkit-el2-dtbs    :=3D x1e001de-devkit.dtb x1-el2.dtbo
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e001de-devkit.dtb x1e001de-devkit-=
el2.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D x1e78100-acer-sfa14-11.dtb
> Please add an EL2 line as well like all the other dtbs here.
> >   x1e78100-lenovo-thinkpad-t14s-el2-dtbs      :=3D x1e78100-lenovo-thin=
kpad-t14s.dtb x1-el2.dtbo
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e78100-lenovo-thinkpad-t14s.dtb x1=
e78100-lenovo-thinkpad-t14s-el2.dtb
> >   x1e78100-lenovo-thinkpad-t14s-oled-el2-dtbs :=3D x1e78100-lenovo-thin=
kpad-t14s-oled.dtb x1-el2.dtbo
> > diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts b/arch=
/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> > new file mode 100644
> > [..]
> > +             wcd-playback-dai-link {
> > +                     link-name =3D "WCD Playback";
> > +
> > +                     codec {
> > +                             sound-dai =3D <&wcd938x 0>, <&swr1 0>, <&=
lpass_rxmacro 0>;
> > +                     };
> > +
> > +                     cpu {
> > +                             sound-dai =3D <&q6apmbedai RX_CODEC_DMA_R=
X_0>;
> > +                     };
> > +
> > +                     platform {
> > +                             sound-dai =3D <&q6apm>;
> > +                     };
> > +             };
> > +             wsa-dai-link {
> Missing newline
> > +                     link-name =3D "WSA Playback";
> > [..]
>

Thanks, I'll fix this in the next version.

>
> Thanks,
> ~val
>
