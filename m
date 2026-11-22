Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795329732;
	b=SltlXoicMMJR8CeLGBhqn3ALveokrgL/pjQ6XoT/1/vRvnvEv+XEVhwkfGELboaU6KCW
	 ++UylI/MZCbeoTy9tZsgQ4dVW6HyefU77HvoSrvmErJuRC6C7UGP50O+y4JYx5J9i3gnW
	 2MrbH+nN264lEAF5wu8s4GWhAZB6SQdbl6y6zSbxXxZ24WW15aQdMhgeya3W77QgGiVra
	 xkcUBgrViLf8xEPJNhbj/DcwbKcp7jrNooaZgGwb2DpBX2C8qVnUZp2FnZx1pQmDhRc8C
	 QhLNIzGkrHhJb5lV9Gvbp0+uNx1zclkdUnqaL1EZxy92LWtWF5dgqlG5xFLEqWTo2dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uFwt6mW+1RfJR5QBxZ88YeWE43yBZuAMkFsXG5rT/+k=;
	b=HaKxDPI9UfXLKAOf44/SqZ52U0bhN7cnm87MvRDhTFAxVYSZqWbH0TVvnb+CCvViPvNr
	 6OSa/m5yvSbK6EaWHq3G6KmEpUEsSSezBdDg6JT1GC4BkHwX3MhEPnx59YwgN0AhENwST
	 vNADZBVzSr7iXqvqdxpMlz39WSKA2cjqkrtt4e1NFd3VcLsZktVnBbOgK8L36h3dB2YWo
	 8t8VjU18sc+JZkuJkbJ5GJEYFgqcnEjMmTZizYwCYB7UG4SN6V+BWNqLkRSvGYVki6YUp
	 tpYDw5SRpnYPFyNuD5CJWGs1kg/GWuVrPL/OzdXzIACOj8EVUFaav4ZUbvDqzF/cY9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=enser.io;
	spf=none smtp.mailfrom=enser.io;
	dkim=pass header.d=enser-io.20260707.gappssmtp.com header.i=@enser-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bNZB0BOo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E140606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E140606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enser.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=enser.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enser-io.20260707.gappssmtp.com header.i=@enser-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bNZB0BOo
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-675ee8fe788so280354d50.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 22:42:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795329731; cv=none;
        d=google.com; s=arc-20260327;
        b=PuQGCwcEflcsN1dskE1zYZOSD0A44SAKnzJ0JwOrcdhKth0KRyn99WTQ0JJGLGcU6m
         8xxDxhAj6RTaMRsvgdhBF+YjzKxIff4eaI5AjmfDNKCkpW+Jp79zTxhzmsvPZAQPKXMU
         sLTQB9eaUSnbWFBmZ8N5mZOAMCXt9z4LNYbuMj7SVUDh+AtpuZ2ZWbjXQYxzh9+zyTso
         ihD0nblyClpqyr72ioLMV21BBROTeStqo/FXsJU1905+5/9kf38oYD1tnmgr8eYh89AB
         xYDQx15a1kEreS6cVP6WRiX9jchC1bn+ZGR5XYYezNUbFfKBonnjwVcLZ5oONwW8gRQA
         CpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFwt6mW+1RfJR5QBxZ88YeWE43yBZuAMkFsXG5rT/+k=;
        fh=HpWhSFz0sHglulHepYMb3v1819DQzhTud62THCx83DQ=;
        b=WvlvZwAxCd7B84Gy6QxO4W1P4AREBNWLc72iQ7eTAeJ7ZBaMYleuk54ld0y5EBSUJ5
         BYlU5Ge67Ugx+5t5abkjRjKdpHkwUbMXRexHaaN6WHVOWTnttv1wfcDE5HSzXa6WRMQx
         65536hovmIDBXftLHO7nP81p6zqAQFfVg2QDmhQ3+QqU3bdpIWTzQxzKVM1gY/mP2IcI
         a7fusm4dIhWKErlsAcsxxqeT9A1o5JmCYsU/2GkQFLy7cE26/6CHhez4/96pwEBrcmxg
         DMsu31fSzoP+/ULZV3K2TVLQMDW2PvGKzO/wVCB+TjP8XaaJLr6PZydcg4D0yZlBsWrx
         Kziw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enser-io.20260707.gappssmtp.com; s=20260707; t=1795329731; x=1795934531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFwt6mW+1RfJR5QBxZ88YeWE43yBZuAMkFsXG5rT/+k=;
        b=bNZB0BOoRQz1FxNQ2GzB9WUdytrvsG+ktDXAS+RgINcwH+MVX9oU42NXCMDUJNqgXo
         IbNDMZrLOztY2Y9+FQ6sFuzDI8orCzvtG9gSXn058LDGgYiFFDFR7WGDp0QRUwHsYIx8
         JRdlCafvMIQXvdaIiQWFkHVnMX2hYnrBTmt1IsORCctzHga66b5xk3cnDPni7ym8g6K5
         W21tiuMMwzFVpDGHTR8AFlIrZ1QfZFgIjnN7YSNziuFdgepwmYdbNBPDkgNPwGXXsb2h
         QSFjWVfcgs/ZDFq2xVYWaHV5LaAygLOhGDKgHMvzVrq6KnbJj14PVdkz+pwKpuv2w86O
         8J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329731; x=1795934531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFwt6mW+1RfJR5QBxZ88YeWE43yBZuAMkFsXG5rT/+k=;
        b=VFXBoA2dsDtHSy/Ish7w90H9DVEvoQ3uSwiukTJXIttxbGKubeYGzWMxC6Pyd8B5lD
         cMx8meDZ9mlt4Ec+sLmZ4gNeOMcrb5wKKgxTV/67Y7REsowUC4Syvm/GF0KGvZC4pvgC
         PtoqtSCuVoVKV73wpFqcoo7MszCU8GT6GHT/nC7/xk9szU7ujScTU7HJspf1vSBlwZdJ
         Nii6cQVBAMEc6yxBHNPd5HB/1dT1tF090v61AslE7aVUNFrAK2zE6yPfWs3vI7RAJmPi
         7vP/HAb8x3mugL6YKr+X+ZbPJjthTizk7PP+Wuu64q4AEI2Y4U0icI1A3NkZr4y42xq9
         yHlA==
X-Forwarded-Encrypted: i=1; AL+hErH/djpf2oeZmBcaGp+Hpx6qGDjVfed6w5tRTAGmX0TGR52s3HJrNAqeahEoQCR4Q35lExSRJDFtL88J@vger.kernel.org
X-Gm-Message-State: APuU4Z88pJnjXgIFwqIf/M7XDIlU9ZYobqPEw6dU5qfWGFFjPZGPLERD
	L0VSvoL5E04fitoFg6A6sWbI1s4116Gt/A3Ef3ddErV+AI1uxXD09uhRihy1uw4ZAeZC2ek7BCo
	TJ974nWXzfeMqQMqKfODXq6FO7m81Z5nJoFSW49mIpg==
X-Gm-Gg: AZFdTZe8DiuEL7JVh7jNN2gClDlli/1faDoFoQUt17vrcB3GQMhaFYMIV5+efLHDl4g
	KfGazXytHSbxa80Gom3ch2zyaR8eI1W1zimyZmWJ8zqMDSfQ23x/rkIt68RlSDZdpdD+ak0PBO1
	I+/QY2tyNDCkHT9x6gYMWfVxVbtwrwZg/ALckifrZri66ACB9w9y/KEWEXj/NJL6PZj4NLAj/g4
	OtRfQEWzIgd6UuDKtg7Sq0waSc7zNEbTkXcZ4H2rlCeNq+P49re5Pt9z92E+LQuRtSu/633FZju
	cBfR/Wd9DfAgfd4cV/4xiL6sLoRt9RNEuc/DIZC0M34/58hzFddJrTOHFkExnYAHw0A5J56nSLO
	f7IdTAYesEBol3Uqg4vHw+ELX/jJG8YVZ8Q4CO+z927ptE6jAk/kFivb5y7Q=
X-Received: by 2002:a05:690e:bc5:b0:679:8c5f:3fc6 with SMTP id
 956f58d0204a3-67df43af88fmr6006818d50.3.1795329731209; Sat, 21 Nov 2026
 22:42:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-rmi4-wakeup-v1-0-1b662be4a9d6@enser.io>
 <20261122-b4-rmi4-wakeup-v1-2-1b662be4a9d6@enser.io> <sashiko-outbox-227741@kernel.org>
In-Reply-To: <sashiko-outbox-227741@kernel.org>
From: Erik Peterson <emcp@enser.io>
Date: Sat, 21 Nov 2026 22:42:00 -0800
X-Gm-Features: Aa3M54o4H3dZxCmAiIO7gvw6DhWgTDlv3S5qgVksMYPQ1wzHp1Iq6bG55ke5jY4
Message-ID: <CAOY-3nAwYxgAeu1zUPOBO_PQtswKtsEOnV6a8hfnZf312ALT6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: synaptics-rmi4 - keep an I2C device that may
 wake the system powered
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=8F=BA (Resending as plain text; the lists rejected my first copy.)

  Thanks. 946c8432aab0 is where rmi_i2c_suspend() started disabling the
  supplies after arming the wake IRQ, so the tag is right. I'll add it in
  v2; Dmitry, if v1 is otherwise fine, could you add it when applying?

  Fixes: 946c8432aab0 ("Input: synaptics-rmi4 - support regulator supplies"=
)

On Sat, Nov 21, 2026 at 9:23=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] Input: synaptics-rmi4 - missing Fixes trailer for commit
>   946c8432aab0
> --
>
> commit 83b2656443640f5726e0dae2d6e9d52155752d68
> Author: EMCP333 <emcp@enser.io>
>
> > Input: synaptics-rmi4 - keep an I2C device that may wake the system pow=
ered
> >
> > rmi_i2c_suspend() arms the attention interrupt for wakeup through
> > rmi_driver_suspend(..., true) and then disables the vdd and vio supplie=
s.
> > Unpowered, the controller cannot report a touch, so the wakeup it has j=
ust
> > armed can never come from the user. Where the attention line is pulled =
up
> > from the switched I/O supply, cutting that supply also pulls the line
> > low, and that falling edge ends the suspend by itself.
> >
> > On a OnePlus 6T (S3706B, attention on a falling-edge GPIO, vio from a
> > GPIO-controlled fixed regulator) with the touchscreen marked as a wakeu=
p
> > source, every s2idle ended within 3 to 4 seconds with nobody touching t=
he
> > phone, with one attention interrupt per suspend.
> >
> > Keep the supplies on in system suspend when the device may wake the
> > system, as edt-ft5x06 does, and skip the matching re-enable and startup
> > delay on resume. A device that may not wake is powered down as before.
> >
> > Tested on a OnePlus 6T on v7.4-rc3 with 'wakeup-source' on the
> > touchscreen node. With wakeup enabled and nothing touching the phone,
> > "rtcwake -m freeze -s 30" slept the full 30 seconds with no attention
> > interrupt (2 of 2), and a double-tap woke it (2 of 2, 120 second RTC
> > fallback). With wakeup disabled the supplies are cut as before and it
> > slept until the RTC (2 of 2).
> >
> > The code and this changelog were prepared with the help of an AI coding
> > assistant. The submitter has reviewed both and takes responsibility for
> > them.
> >
> > Signed-off-by: EMCP333 <emcp@enser.io>
>
> [Severity: Low]
> This fixes a bug introduced when regulator support was added to
> rmi_i2c_suspend() and rmi_i2c_resume(). Should the commit message include=
:
>
>   Fixes: 946c8432aab0 ("Input: synaptics-rmi4 - support regulator supplie=
s")
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-b4-rmi4-=
wakeup-v1-0-1b662be4a9d6@enser.io?part=3D2
