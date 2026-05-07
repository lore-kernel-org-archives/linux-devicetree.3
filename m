Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72613F7A98
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160940; cv=pass; b=SynXCDNhCfNoE4W4svwtrDE9fkO5ErHNTiky2QtO1ECq/OYIgoJXjkdIbMvDAhup17AKr3H+OFxkOiPYpu2B1EShdTbC+VtD8wLbgmUUmDzb3peVy+esVci0i4qopKU8CwLU4JzETApUp0e9I08Bj/1VQXn7BlpdO9tbLSR0f/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160940; c=relaxed/simple;
	bh=zFi37WOHMnD2fGFA1dmfFCncgxAuI+BdsH4IGYbGfXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CE8IQdtd+6IF2yDNNrkJSQ0hU9TKx3elsadzS/4hABAu2GmC3Zc1sEP5nF83VO+uUC5GTnB7c6MGnBCzl+ZktCn8uwbuJ3k8fXqf9ZzzBJcJF4BlfjhW/XhAgxm9do6HFx4tuUYck/TdL8MwODrcV1fXUX+G+RsKKCGxe3CZ+rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljck0YhJ; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljck0YhJ"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c45281a06so1421565c88.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778160936; cv=none;
        d=google.com; s=arc-20240605;
        b=cXrxcw54Oa84U4cTpaV4uKA4PY1BHblQcT2fUDaWK9Qhs/XeuMwGY4+P1MgSu82DcR
         dHottUYSXIFAIDcZmb97n6pYlRGy6bzQbayBggqdkXQtwMeYmfa+w/7yHuPkYy8VRCkL
         IZM72OT5f7VYr7eaGSxxf2Rjpl2+rE3zTHuXuuwjN1ukZowF+pSKDdVpIPo5KzcFOP6I
         /HigwhiiJzPYZdaMyC0t+Lcy70QpMvWTcC6rC04DuTkazlv1DQOP0Z3woexG+h2OFPse
         Ze4zEblb/BprG9ZBj8LTCJ73R59JZIvY4nkZCY6Bp02B86W49v/SGVplDWM5D7Ki98lA
         s9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yIW74LfJcqNSSJkFrqdk8Y22u7WmxHTRMdFEB1r680I=;
        fh=bAe7w4e/ARDud4Q08/0u4UqduBGlVdEuz7v4NOSiHK0=;
        b=NS962YMOAiZYsKXEvGZDimJM0Sx3zAf1il+DKHL84t1BXkS2rIlL+GgSBqjzac5PRE
         0wz3omQo0klscuf7JTqoffYsknGtyvTRjPkbQN3dWlV/4z4Mlzd9HSPLpikZ6nrPqXGB
         ThcUwlDsupqKLIt1Oxba+y5qb/vtJlkJfi4Bc8hW0o120BUMcR2d5lL+zAdNl2ttTAdA
         XzC/X3b5pA0Hrw4qLlmpJLZc0f5HKabtmU8wVsSloCWzX/QA0gXhhxHzTM6QBvqQJUiL
         WqYe3hqA3O6FOi/+JCQ1xw6DCna9z2DYt7/F2+5WOofV8KZzxpgrSWHMyGnG4+/ksIYX
         8JKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778160936; x=1778765736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIW74LfJcqNSSJkFrqdk8Y22u7WmxHTRMdFEB1r680I=;
        b=ljck0YhJ6PgNTKHHNhYGp8ZVBVhPRKrxuKWDtBXq6xr0GiiSUwrGBZOCnjpPfB9CZR
         sJhWW44QBzzenUEL7wpy5pjkUw9q3zzGg2E14hxx0TTZ7pUbhZJzhXUm6C2Nm+XHLuEN
         iAuZ1TGZxgLk5NiifXh5dyixCqnKMAxJ6U4IQgCRvClCj+m3K0EXyajfAqapcUgPWGIm
         TRg7OGjKBynBrMKsMnWswakxtkJRqWCysvZ7UkWBjMJCgEoWP6ASucD3dep6w10Rr7ld
         4tsA1kyfaBpDKhyqDKpYP3ExZANIFyqgV44BR8p7saBo+eTE7Ir5e0bulzq9Ky3X6Cgl
         8QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160936; x=1778765736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIW74LfJcqNSSJkFrqdk8Y22u7WmxHTRMdFEB1r680I=;
        b=hr3OAhXNbLhVIFU1wxxtqEe40XCuOYvSyfqcyQ0jFkTueGyce50gVn2fH+28dywrdG
         QMy3mGrB5Ki9Q35fJm2bERkUXick+CdAerll0ke8K1Q6r6ZmtEclmtZ9cci+b+7yG3Mg
         w5kwJIIxcn+0AI161jofEVdYDxOLSr+6xxabEAUHXxVYLzCmG3v+V6u2zkrHn5OPyo5y
         rOUhvBZPX+FfUZE4CVN6020aYWUBWai8YsEXSiitS8LojQVtZuRbQgs2d4B/tl3GwrjH
         k0gol1Hvf4c+xsW7MBcQq4Ma0iT2jTJbNtMEUC54GKnF8pBAXCn+FNFGqncTQbZrI4SR
         KHkg==
X-Forwarded-Encrypted: i=1; AFNElJ+Gnj+71VQvvRgZZGgSUacQOupoML/1NnbCIzsBD0U0Byk/dZoxSwPseGWP/5e7XYLTMW8fMLQaBLwg@vger.kernel.org
X-Gm-Message-State: AOJu0YwUak5RN9OXrB4FIWXqmKFmCuvTGm9U0NCx/kwiVNRmU30pbTxP
	aN9w+QclOcy+bY52Gin8Hmj0mgLnJs3rGGHGONmAfx++ndZ6p6fLYo6CHqC0QuURV7Gy/GV2f0x
	BmPoQk0k1TiX8BbWCCtKjl4JkhDaP4t4=
X-Gm-Gg: AeBDieunMOiWyYVr5LXAyC0KGk3/PpXQl14SOkOoB3RQOIs1bO53yXBkQPikeq260qW
	eV/97jZ4jj6urR4ulaKPnAgtINBDM262xqu2FqWRkUoQWY0As1B8233cWcWeD6gSGfdbR3aXk7h
	ZNFzP2IriiyG9z2Oopr3H/YsuQygoVY4XuvzymbitsTiBzD9cziFrm+PKkGAJktMxlJ2YcqK4hu
	Ng+/6iiRxrP5hEn4eJdStr/wuh5o24ex2wpc4doH4zegHB3kby6sdl8T01boy52a7RfaK99ZpEI
	WIHi/m90CcD/1QOiVkKWRsgtEeBrDA==
X-Received: by 2002:a05:7023:b07:b0:12d:de3f:d84a with SMTP id
 a92af1059eb24-1318eb41b81mr3610865c88.35.1778160935629; Thu, 07 May 2026
 06:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com> <20260505161135.GD1547435@killaraus.ideasonboard.com>
In-Reply-To: <20260505161135.GD1547435@killaraus.ideasonboard.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 7 May 2026 16:35:23 +0300
X-Gm-Features: AVHnY4JSoQPxSG1_-AH3TDVcV5vCvXQD6fKsE-bVCV2z1QwTxgZHx1yruhmxMl4
Message-ID: <CAP1tNvQtDSCtJ8UmmtdMK=Prbbs=s490WU=H=3_O5tJbmO6mqA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Laurent.

> On Fri, Mar 06, 2026 at 01:36:14PM +0300, Alexander Shiyan wrote:
> > Add driver for the onsemi AR0234 CMOS image sensor.
...
> > +enum ar0234_link_freq_index {
> > +     AR0234_LINK_FREQ_IDX_BPP_8,
> > +     AR0234_LINK_FREQ_IDX_BPP_10,
> > +     AR0234_LINK_FREQ_IDX_MAX
> > +};
> > +
> > +struct ar0234_mode {
> > +     u8 bpp_in;
> > +     u8 bpp_out;
> > +     u8 dpcm;
> > +     u8 mipi_dt;
> > +     int link_freq_index;
>
> I think you can drop this. The driver already uses the CCS PLL
> calculator, so it should be able to deal with user-selectable link
> frequencies.
>
> This would require testing all frequencies specified in DT at probe time
> to map them to bus formats, and restricting the formats accepted by the
> driver based on the current link frequency. The CCS driver implements
> such logic, and there's also an implementation in the ar0830 driver I'm
> working on (see [1]). Note to myself (and to Sakari too): this is a good
> candidate for a helper.
>
> [1] https://gitlab.com/ideasonboard/nxp/linux/-/blob/v7.0/dev/rpi-cam/ar0=
830/drivers/media/i2c/ar0830.c?ref_type=3Dheads

I reworked the driver to iterate over all link frequencies from the device =
tree
and validate them against each mode using the CCS PLL calculator, as you
suggested and as implemented in the ar0830 driver. The PLL calculations
themselves succeed for both the 360=E2=80=AFMHz and 450=E2=80=AFMHz frequen=
cies with
both the 8=E2=80=91bpp and 10=E2=80=91bpp modes - the resulting bitmask was=
 valid for
all combinations.

Unfortunately, real=E2=80=91hardware testing showed that the 8=E2=80=91bpp =
mode does not
produce a correct image (MIPI errors) at 450=E2=80=AFMHz, and the 10=E2=80=
=91bpp mode
fails similarly at 360=E2=80=AFMHz. The issue appears to be that the sensor=
 requires
different MIPI timing configurations (frame/line preambles, D=E2=80=91PHY t=
imings, etc.)
for different lane rates, which are not yet implemented.
Since the PLL calculation alone is not sufficient to guarantee a
working pipeline,
the automatic selection of any frequency for any mode leads to
unstable operation.

For the time being I plan to revert the link frequency handling to the earl=
ier
approach where the device tree provides two specific frequencies and the
driver maps them directly to the respective modes.
The DT binding will remain unchanged, so when proper MIPI timing configurat=
ion
is added later we will be able to adopt the fully dynamic model without bre=
aking
existing device trees.

Thanks!
