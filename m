Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A863AB29A
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 22:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775167470; cv=pass; b=H+Jx6/36lknS8iHr4WIM0DAY7yWtgaHpzUALDpFyXsDceSjCVtAOKGrsZ+upXAIM+O/DjkomzomQ6xi4IA7a7EpjUJfrutDzDj/pgNPG6vyIzH9CD2YgF0bAlFD3jSQ8CRyRfS1bRdIozvwERJesZxCQSkmLpsGJQcdxX4CocT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775167470; c=relaxed/simple;
	bh=Q+knnfU7dMFDAgjTPdI3wDMsHWDR0/Dwy5tPJlLOv4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnQm/ihajK6ex8M31wrCTSRy7xwapfqLYQsF5tyGau5MSK8tbc1h/B9Hk1jzYGQKmt2+kFDl3Xd/hKlFKI+YbVqXXtJVuYBLld+tGppSV7juW8OLPGTdhO8P+e6a2GUIQmUO2HcVBLV+HUo943bEIXW+fD2AGEI9jF/gdQciEqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELRPOklY; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELRPOklY"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2a75393e2so1365357e87.2
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 15:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775167465; cv=none;
        d=google.com; s=arc-20240605;
        b=LQJRRat/Yilc1GsEydJLgXgcwA5PY+WPAdXFCu7fMICMqcJJ2cw3uXvqaF6Mvvj2CW
         83prXmqPEo8MT/vCwiXRrAnzUdPIGvTrmEE/6OBb3T6+Wv6r0oU4OjOvgy86sn0YXJRl
         ABmxPwXDeJSkcV29I0YyOy10YVRUBGJbzYs9zJeO26tU69jPLTOGbuqlqi29shq0v1Xt
         LGecYbfdInoaGIOVc5I2Y6wY3Zm6MR91Dwf/wfq8DYgkv2FR/PLVSDC8oX5DUjgg1RhL
         kdHE1i4BwvlMYK2Hts3e+dE2f3RdlZjqqAHfmeuUlfvNQlulzj4D4uKs0Se9t9Oc51AD
         0RCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QHTZHPkq23dj4VdSUniLCKCNY847p08ot+FeA7eXxUw=;
        fh=CzAoms+vuBRXvk3pkmOTaEhebpa8mO3Bx6aEVD9b3JM=;
        b=CgvTuzhzErcavHqJ1gd7Rtbybk8ANUpDYERt/yN0XXt5Lvaxh7WOyICi0+X7e3QB9f
         tu55EbT2zTox6MZ6Wp2wGtSutJuNi2zojqyGfeDX9TkZanhwXslAMAh4rJZlSZVYZ+Ho
         onq2muoZ+AQfslTOOPYmmx1ot8uhWyayCKQfdoDdVvIa6ttZkdfwadWyc1TLysQpbW97
         lr6IQNQ5UzjdrPhlf05umRA4cMCxkmWkQpecmMVIVXnuWyHcGIv8YUCyDb4ebOyseeM+
         orwwBIoTIxnfmu12fs0Ne1TuPdWXqVNBZQXHldhPoCFExNN7GzCUY3oaNw4CIGAfhLSr
         DZ6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775167465; x=1775772265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHTZHPkq23dj4VdSUniLCKCNY847p08ot+FeA7eXxUw=;
        b=ELRPOklYO7s4ZQQSc0FQuJgVYNmgqYIMkiupUiuxGyEh+TMZhKwL3yrdBruR88NHRb
         3XOrvwnJNXzGTAlE+I21ai5y3ux1WYcRsQrNrMES3MLCC7HS9FLN/vp54vJfZxRTPIRD
         IBbbaTyvbxbd8qBVLAWwzNmWLOFFuXrfHhhU2UpCvPTxNjylmsQQz4xuUAUywavjX2ib
         NDL+f8LwR23tic7PC9usZneWO2popHDCI8leGczE3NGQJEXofl9pn0ALhT4E+ZLqe5d+
         if72MNZpKUR7hUmEGgKyOO/7tE2a02fhnOUOJ5txyOCz8s1RM1JwPJjaYFMhIyYg7rAo
         vHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775167465; x=1775772265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHTZHPkq23dj4VdSUniLCKCNY847p08ot+FeA7eXxUw=;
        b=hT85kcFseTp2kQacfP29nV4L2gqUZFscJj0iuqE0JeSHrEv6Kppz6doDitcZE5ORpt
         SGD0tfsJr76PkPkE4CVSqyea9SAGpTKkGVtLNDNG2dWhel3sr6LtN/oZKp7iDXsOfmbY
         er/dS6IPHSQLIYUtdz+1S/G/dLE4K6oxaiP9joPX/qgiN8yFfdZmg8K6MQLWku9Yl9zV
         /gY8Li8Pkg8atvmKchL8pwXaq5JiLJW6J/1Y8At+ghYGWis3JKaXxWwawSHsgTV2+ReO
         WaR/61CjzeCM66dd8mcry915VIXBfb1siLgsHvIJm6QBMjAhkS69y5g9i1YAv8KeIZIw
         VXJg==
X-Forwarded-Encrypted: i=1; AJvYcCUW8lU8K5aJK7RO+Wemr+J7Ul0WeQBIRqTFlqqmBv5iU0R9edw6EqEAz7gTU9UJNeKz3SLf8BG9324i@vger.kernel.org
X-Gm-Message-State: AOJu0YyCCBOInrwLu5QC704vqbYQL3dwIOZrIEmM30q9VuB8yBpOWl0B
	t99x0SPoTS4jEjpxKRZoXgQGP54rVlYNiQDpfZLCL0rrksuy0GXlcwztlVa0x8OjRxGmdpPHypm
	/iRI/nWcmkYXIQkPaDfvRDw2Vf9aUR4+5pQ==
X-Gm-Gg: AeBDietZzkEizZKi6I9TJu7QdWHX3RoU6u7hNn3Hz7GFTUIe/x0kWvhcEyhqw70hJUu
	6Liscm/08BWkb8Eqy0/Mq2Y3rEAS56xFHB7P58aAr4sC314NAq3Ub6HPHZbBkU2XxtMmdjfimKQ
	sswZLHfUPyYl7MjFD/9i+nXwaNsyHY0byYUqd/xX8uGUeF0lf9hWDSfqrYd4eoAce59VfK9+jxw
	63+S9qQ8OemRR+R7zVleIDPW3WFQ9ZTslbiRJOkRZMT9AAac64AUTlXnjhJaMkUDVeE1eeE8zJE
	ArULjG4noRyUyVcMLwP3ofiXh5Q56OF0LNDtOpG61qnaFjaLlKCObO6SO9kUGJwdJ/D5
X-Received: by 2002:a05:6512:1152:b0:5a2:bf05:be77 with SMTP id
 2adb3069b0e04-5a337580953mr211204e87.23.1775167464301; Thu, 02 Apr 2026
 15:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-3-33a8ac3d53fa@gmail.com> <7d6c2c58-310b-4194-8159-8ea56ed9465b@oss.qualcomm.com>
 <CALHNRZ_tomry+tJh8g2mCZBM1XQcaA7p1ycK03GH1gPQy3geqg@mail.gmail.com>
 <78d7d85e-ecd8-42ca-b59e-b7fbcecf1502@oss.qualcomm.com> <fbpk7dm72aiy673r2776pudw2ydpdirr6bu2rwvceour6lgwdx@melipr4mhv5i>
In-Reply-To: <fbpk7dm72aiy673r2776pudw2ydpdirr6bu2rwvceour6lgwdx@melipr4mhv5i>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 2 Apr 2026 17:04:13 -0500
X-Gm-Features: AQROBzBYbm-XDpG7pIHU8lYphnaC1dfFr1Ege7Wlckv5ir5ZnCX1PiOmiFDEAhE
Message-ID: <CALHNRZ9ZiENcXJn7SKuAoDWoBbuxWuOktBDF7FZob6xFH8A3=A@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 6:32=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Mar 30, 2026 at 01:00:55PM +0200, Konrad Dybcio wrote:
> > On 3/27/26 10:26 PM, Aaron Kling wrote:
> > > On Tue, Mar 24, 2026 at 7:36=E2=80=AFAM Konrad Dybcio
> > > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >>
> > >> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> > >>> From: Teguh Sobirin <teguh@sobir.in>
> > >>>
> > >>> This contains everything common between the AYN QCS8550 devices. It=
 will
> > >>> be included by device specific dts'.
> > >>>
> > >>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > >>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> ---
> > >>
> > >> [...]
> > >>
> > >>> +     sound {
> > >>> +             compatible =3D "qcom,sm8550-sndcard", "qcom,sm8450-sn=
dcard";
> > >>> +             pinctrl-0 =3D <&lpi_i2s3_active>;
> > >>> +             pinctrl-names =3D "default";
> > >>> +
> > >>> +             model =3D "AYN-Odin2";
> > >>
> > >> Is this enough of a distinction? Do you need to make any changes to =
the
> > >> one with a HDMI bridge to get HDMI audio?
> > >
> > > After this quesstion, I tried to verify hdmi and am unable to even ge=
t
> > > the connector to come up. The lt8912b driver complains that the
> > > connector doesn't support edid read.
>
> Looking at the driver, please drop lt8912_bridge_edid_read(),
> lt8912_bridge_detect() and lt->bridge.ops assignment. Those bits are
> lame and useless.
>
> > Which per the current connector
> > > node is correct, none of the devices list a ddc node. I am trying to
> > > investigate this further, but vendor source release unfortunately
> > > appears to be missing pieces related to this. And no other current
> > > qcom device uses this bridge to take a guess at which controller the
> > > ddc is on.
> >
> > Go through the I2C buses that are enabled on the vendor kernel and try
> > inspecting them with toos like i2cdetect
>
> I'd second this suggestion. The chip doesn't support EDID reading, so it
> is (hopefully) handled via some existing bus. Does downstream handle
> EDID / HDMI at all?

I have been unable to get the stock OS to display anything on hdmi at
all. The downstream kernel reports the head as DSI, and is hardcoded
to a 1920x1080 mode in the kernel dt. We have been unable to find any
kernel handling of this bridge at all for downstream, in the source
release or the prebuilt kernel shipped with the stock OS. Best I can
tell, they just hardcode the one mode and nothing else will work.
There are reports of hdmi audio working, though; which I'm not sure
how if the bridge has no kernel driver at all.

All i2c nodes used by downstream are already enabled. And when an hdmi
cable is plugged in, I never see the ddc address, 0x50 if I understand
correctly, show up on any of them. I tried enabling other i2c nodes to
check if anything shows up on them, but that causes kernel panics
during boot and without uart, I can't see why.

This all seems rather broken, perhaps by odm design. Given this state,
should I just drop all references to hdmi and leave a comment in the
dts where the bridge should be to explain why?

> >
> > >
> > > On a related note, I'm not sure hdmi is covered in the audio topology=
.
> >
> > Since this is a DSI bridge, I'd imagine it needs a separate connection
> > to the SoC's sound hardware. We've had similar occurences in the past,
> > e.g. this on the SM8250 RB5 board (qrb5165-rb5.dts):
>
> Yes. Unfortunately, the driver doesn't seem to implement audio support.
> I'd suggest pinging Lontium for the information regarding InfoFrame and
> audio bits programming.
>
> >
> > https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm=
/sm8250/HDMI.conf
> >
> > Maybe +Dmitry could help you out
> >
> > Konrad
> >
> > > What I'm using is here [0]. This is in a fork of the topology repo
> > > with aosp build rules added. Speakers work, headphones out and in
> > > work. DP works only with the pending q6dsp fixups series, which I
> > > should probably narrow down and ask for a 6.18 backport for. The ucm
> > > config [1] I'm basing tests on doesn't handle the built-in mic and I
> > > haven't been able to figure that out yet, so that's also unknown.
> > >
> > > Aaron
> > >
> > > [0] https://github.com/LineageOS/android_hardware_qcom_audioreach-top=
ology/blob/ad67f3777b1d4dec5289bc7117f2ec34521be7e6/AYN-Odin2.m4
> > > [1] https://github.com/AYNTechnologies/alsa-ucm-conf/commit/d33738b93=
e9560e8d9e08a024cc84c8055bb7eb9
>
> --
> With best wishes
> Dmitry

Aaron
