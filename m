Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50439541E74
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924559; cv=pass; b=m/w8/o0AfPzctfPk5btuASSLgrGIgjlsoyTTe3yULEkhPZqQM4whmdhcDy7IqVrnox2+cZJQbTkAEZcvjNueLEadRai2lr7L90m/D8ueUdQfyBfkvzynG7JuG/3j1+SF4YFgmNG9kqePEgkbMT87MieOZUgrins993aVJLf+r9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924559; c=relaxed/simple;
	bh=N4S4WhX9y1egfYubZD+cGlmH0A5CORT1pqeSQxAxxVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbjUeuHN717XgMyzxwn/mUIjKJ9WGWxZbUkzI7E9a8IX4mz7arFnisaaUFnFFFhpuuWYIoFVTPvj8bU/TN+4BsV7dh7nhgtVi2K7DtsXST/9PwTXNqsAe+HvBtbPOf2l6bP/Mwwz9AqZQFrXzlj5uFyvzGbMjuWTQiZvcnCtTnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I1p9abS0; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I1p9abS0"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8ac525c1f05so3980097b3.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924556; cv=none;
        d=google.com; s=arc-20260327;
        b=ayzTOxjnMa+qTGw1NZTFMw4FE/TZvNkEMYgt2hdupEZQKF2x1nNirlre7G3zUYFw4w
         H+JPAfbBtiDDH84kOQZA/JCw8WNEl+zhjreiQ5sS1sJWUf4tt6CEvOKloRfI0DQaQdGp
         2zl1uIfZvWo2ULr4NtblW5ktdWc2bHJ1ZcfeEPgRv7Gm5jywznf9voAQbHU0kdbAucKb
         qj9NbGQAU4MvKlijnhh/rvUeTMdrfTC5EYAbO8H1Tw6uZjd2E7WfT3JPLqryG5CABz0Z
         hPQtNh79itKk++ilO4ZPQLz6GR6IsEj8vqWvaLMlbOphlSvzLLIh+ATkqDIvjubBGKhc
         HNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dRtKBgWA0Jhd431B/P66jOflMrkNQBh/GJ9zmcjureo=;
        fh=yep/hlR+UwgJbaY/0fKsD4oVO9RC84c+Pli5RkgG2kM=;
        b=TlcWWUBQ3S/MATajYU1p+SNvHaNmihFWaQO3tI0zOBf+fNVSCDxBXX3wsbeSNxXKzL
         djuOwaUGuvqGQUN4MghnRyzQ/WypLKu+2Qe29oMe+2govhBFRx6pFi0/xb1VkzWpeFN+
         l+HzxVfHpOpwDkuTI6de8jYLCveBnlXFGlb4Dbm1J/g3xy5DCyYgj7h9BOM+tVMb8y1n
         RFdlaAzUej8bbWI0Vf4yF1xHsH0rkPLmuSF6BTwGtvV5E0bkS7i7ROXF7YctQJfa13z5
         zXVc+HzFFaz5GqLG4Qy7A0kRXL6wj2r5ur3bL44DyNOOpaAsA/uFnpu0oldSmTWVKAVA
         IRjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791924556; x=1792529356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dRtKBgWA0Jhd431B/P66jOflMrkNQBh/GJ9zmcjureo=;
        b=I1p9abS0I03ydil5tw+1+oHm1ZRrXzApJ/AyHzRfe1fNjgAPynndgF9MlwKwcXtX2L
         mv22K4aWNMCfrPIvMq4w60WpmeecYq5YZpIubkwPRtTSUv/nBo0YaqkqQPdCbwChnmNh
         C6H0fVgHya/BqUURY0utSk+jRiTHujEtwkfBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924556; x=1792529356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRtKBgWA0Jhd431B/P66jOflMrkNQBh/GJ9zmcjureo=;
        b=w7LhAD+bsOksORxHxFYZwyTNy1/wJiMbotj4ci3fMX+JentrjvnCVzb/uxlQhoVpeW
         09ZFVoCMdXvaFJwGd3HulZb8r30HNgWWrcpgvakW8KrHLKI+KfIDEedlAxMh6coR3bk8
         tRzF2/aoUZbMDlUpRgkA++5E9gkaAkZNihgKXyKhzUVrL/gg6DNl3DahymxVSZGgAibS
         u5rRShtBJXih1RSUFjRsIG+b8M9I1V3/q5HxlL149oCCbsrRps+PODUZDs5lG81uU6yK
         v1BWndZq8rfhJjlCtigHoEk6+M/6E7s2Np8hVhd0znhovoKSMtMhpuehlURpJF8CTIUF
         Vl7g==
X-Forwarded-Encrypted: i=1; AKwUvBy1SKHdz4JuzNNHbJd9DR0Lkw0SheF53ErYWYQ8xe4xErYQR5xWl0h6pJzeMapav21aOalpC5+yemd1@vger.kernel.org
X-Gm-Message-State: AFq9FYJUs5f3a/EzJPDJDSNEYP1+omMjzKONDnlE8TUtFVLEq2f5NbC6
	bFT2kxNHNj2nEvGHVcLJC+1LnIAHKiCgB3j/wpFn6km7TUWD5dcrmeZat9OtiR4u/B+3x0SmuR5
	5l0rCGSK117LCZD1OMvd9I1IDkjFs4z7cAfmVM6CY
X-Gm-Gg: AYBFou17sbpYTmlbE9/7gF7njYMEU9GclP21K0OWXqN6kvQ8tySCMcmD+yaaLvWV7cH
	cI3IZUM0dVGbUd97KcNcWl1DlFD60JnhzihhWYYEW4StNiJwsz9xuVuMVmG7E6R1ru9GOE3lJ01
	GyXlGR0OW4eYJZC9Fn7j+3raAY6vkfM16BTR02zZoE9WON0UrpeaKklQpPOzy9+tsm+zsy0MKmo
	0UWv12N3OxeWYMzDJBIWsZQB1d3HvVB+EwNA22cx1+rRoKJqbsSue3P07NsaFkjX6wFlWRuhuXw
	OAPTFfxFbENecNjH9orofi6jcNez9ViJurnWHhSLzhKHjXIX6nSSsntoAAwt5+NZu3nFRF2YlOW
	Aj/tHSjvs0g==
X-Received: by 2002:a05:690c:c513:b0:8b0:a8cf:f424 with SMTP id
 00721157ae682-8b0a8cff8d1mr29927657b3.41.1791924556355; Tue, 13 Oct 2026
 13:49:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-1-384af01da3ee@chromium.org> <sashiko-outbox-166133@kernel.org>
In-Reply-To: <sashiko-outbox-166133@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 13:49:05 -0700
X-Gm-Features: AclHuK9FMbu9JZUnRnsoojppgwhlqyo5kwjgao5eIiFBqF9-3uTME2iK-puHtSM
Message-ID: <CAEe3GZGi02TbXmPzFKKdf_nU0qejx+xeRW_2xKQ0B7RTk-VqEQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] Documentation: Correction in HID output_report
 callback description.
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, linux-input@vger.kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 3:29=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] hid: documentation incorrectly relaxes asynchronous requiremen=
t for output_report
> --
>
> commit 6d8fa62fc058c7f5630a13cc92c85b7867bc9869
> Author: Jarrett Schultz <jaschultz@microsoft.com>
>
> Documentation: Correction in HID output_report callback description.
>
> This commit updates the documentation for the HID output_report callback.
> It changes the description to state that the callback might be asynchrono=
us
> rather than strictly requiring it, citing i2c-hid as an example.
>
> > diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hi=
d-transport.rst
> > index 6f1692da296cf..2008cf432af12 100644
> > --- a/Documentation/hid/hid-transport.rst
> > +++ b/Documentation/hid/hid-transport.rst
> > @@ -327,8 +327,8 @@ The available HID callbacks are:
> >
> >     Send raw output report via intr channel. Used by some HID device dr=
ivers
> >     which require high throughput for outgoing requests on the intr cha=
nnel. This
> > -   must not cause SET_REPORT calls! This must be implemented as asynch=
ronous
> > -   output report on the intr channel!
> > +   must not cause SET_REPORT calls! This call might be asynchronous, s=
o the
> > +   caller should not expect an immediate response!
>
> [Severity: Medium]
> Does this documentation change contradict the strict architectural guaran=
tees
> of the HID subsystem?
>
> The HID subsystem design rules mandate that the output_report callback mu=
st
> be asynchronous to prevent latency spikes, performance degradation, or
> deadlocks on the high-throughput interrupt channel.
>
> By stating that the call "might be asynchronous", could this inadvertentl=
y
> mislead future transport driver authors into implementing blocking,
> synchronous callbacks where they are not permitted?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-send-ups=
tream-v5-0-384af01da3ee@chromium.org?part=3D1

The "must be asynchronous" rule doesn't match the in-tree transports.
usbhid and i2c-hid both block in `output_report()`, and hid-input calls it
from a workqueue as a "synchronous output report". This patch only
brings the documentation in line with existing behavior; the actual
requirements don't change.
