Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583AC3D6484
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084817; cv=pass; b=j3u+vIEPX7wdrmzK8BgMRv/9QR8n6hdxqLwi6qsCrrkyDIIvVetbkA7caVY4h5wNuCq7LvhGm1HMYYsNk8FjpemlDc5BXuI5cFAfQkYtWfIuK6oRFmI9bAb0BikIQQdpTUBUhoAPS9JjbCdXuQURLqfePwKFjd6T4sjkeNghrpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084817; c=relaxed/simple;
	bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJLfb/VIBqaBK4JN8/pNbe8Qr0Z4ZpUkP61l1vM7MKWja7rvNL4L++fG9jgw9m6AyVuGqdFoqCSeaQ1xnDfQrK1ktv1O9SmFX6Ph7ffrWtRSj0osjfUvtw8alX1oR1iJb/OF3AI/T2X48F+HI4lmQ9ZgyVDH87PLw1gqOk4fuUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=grWpVETA; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="grWpVETA"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664c535f1a0so762243d50.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 06:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084814; cv=none;
        d=google.com; s=arc-20260327;
        b=b4tbXX9m68snthq4uJKPlKoUpMAapGB0hmu68AOAUEmvfUxD5Y34gwfxKwQHz/uwQJ
         2tu2SXM0vcYJfiYNACpQF30itgIF7qVmAc1lz1xh1agHTfCeTjaF+Q6LAGtNIHRr7PGZ
         b0OPFbFgMOiFTpFkf755l04HjOIUw0eqgN2hT7X4hthIU73etPkX0f3vYSp+HdkmfuB5
         CJMlAbMKtYhkQAtEFHiEI24CGhdFto324nqzWAs8fEjsphybcETQSBCrKZreTFPen6MH
         YZOIpNGe79iZxL/FZXfFOc2WJoq2uNPZfgX/lKDjUvngNsLY/FmlZN9vRTgSy5axFa3n
         Wt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        fh=cwzQ9gCJDpCY5S5bHSY93IwTV4xaNoTQhfpEeqjnBkM=;
        b=k/kmyryEbm+fn/Kp8fsfaZTMDfCQZy1L2nVH8DtuHABXXSPKlgXZIt8Q0eugJ5aY/M
         m5gRNb5bchNPOzU9h3I784YMSnA92xHdRUd/aXtNjBVN2Tvk3kNOJYxEKDN6vFZbHZCz
         5i7bg6asZkw5G0sd64wEuQaikfblseqFCWXsgWCaScILkDkdGX601ECaAybGWhjQP7+S
         sH0EOJbuLL+2l/JWlKRnUz1sgmgXLpQp6fw5opbVAmajC+HvJwu8k5zVgg8qqSxgrd+b
         Jgzn/T5GQ31zSkxFME0kRpwcJMkVYs/VuBQYVV7Vm3vOAATAtNo5lkxyy6xAmZni8biy
         iHQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084814; x=1783689614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=grWpVETAw3jDMmUy3XPnUGOjR8BcA4jyfVk14MFE953+F1914LoGY5rwA3Ge8NZuIE
         7GcRD4+VXwKna3rqHOPliBMs5HWA4GJVOYeQwRl48oHFyGMaDoiBQQ4jxnh2KgTL19Mu
         DTB/K71gdvc4rjOGt/blrp0IXyUNL2x51yQPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084814; x=1783689614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=TxlPhAUFeOTWJTpfPhblSpjmTnbBcr5HwLteafqrmeh+Jvy6t6UBZESlCjCcTjRULC
         DLKXCVgL4mWwXUNfRnl7WY8bVZQB827DKJLB7IEfVilJzVCZBIACOOCZ5TotxYqHpqYe
         n0CEBZA0aOmYZISnMv1Q+zJri4GqirCKGhPZcE1X673qJJqFEVj/jJlO9hIA2hRE7l0S
         LlF92H2kCUpsilx7wT1JiYgWOPlQLMaG55aXSLDgw9JMlxOOeTSlD9Pb6qiuZQ/QcG40
         fNNBe2v7042J+exk8qHyZJw7C5oN3YrpL9TlP/Rk+VzcCfpfWYNTeuUqQVYs57QsGz8v
         aIMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rry33nxj/hGOkBNxapIlNoJm8IIQo7/x9S0vWc1pM1LhB+AJbvEjEBWpyMTm3gbfQb/ErLFW7fMdPWK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxkc1C6nCxd6fY22zCWcnIf9R/peNQnwSYjx2hrq29/vQ9+Oge
	ri0wLtOYQ2ENEmJoJuoY/wKdP4RrBl56GlWn+pc5xI/D7z1ic02sRnGTRaifV4mDLSerKi1Nr3t
	tewdqudTRZ9l6Zh0ioM776hB22JSiwMhVR3L+B195
X-Gm-Gg: AfdE7ckYzmTDcgxNDLTvUKUZes6JKL+UU1plY7cnf6Q5eBjHjabSMPuBQHqzRJRFKqa
	3jbdrrb2kxX80ortts1uRJtvXnAHINprGmAaunvYzMNCizr6m+rCsaLTo3JLmhH/HuNNy8cpPZy
	ejSn10sqVpcxJz1858liab0UcAO7wBlt79SlBNj/9CTtjvZRDBpGrsKzrvoaWGApcszuuc9O833
	48ClHILOrPDUtJo1LLiGMmFZcM1eVEDOJPCmtpWcppJq8TfCcBhY9iXs06SC237WCmldce0W0fY
	uM7hDZIxd6/F7UBmOtmXCbuIbU0=
X-Received: by 2002:a05:690e:418a:b0:664:ae6a:e9a5 with SMTP id
 956f58d0204a3-66521d54781mr9923763d50.75.1783084814296; Fri, 03 Jul 2026
 06:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
 <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com> <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:20:03 +0800
X-Gm-Features: AVVi8Ccxmi-jSFxGKDTUuToCDHyjKIoBrT_lajnjop8tp06Df09KPZI8Is_qoIU
Message-ID: <CAGXv+5GH3navtUC-V--dJOEjqiDtOauXf_TKxzdQ_T+bK_v9gA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:16=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 14:58:56 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >>
> >> So this is only needed to not have to track the state in a separate fi=
eld?
> >
> > Correct. Reading the field is not the problem. Updating it is, as the
> > fields are packed bitfields, and Sashiko suggested that locking would
> > be needed, though it may have been for the peer port, which has since
> > been removed.
> >
>
> I'm not sure if it is. The user controlls the handle. We could argue, it'=
s up
> to them to provide synchroniztion. We only assign the target and pwrseq f=
ields
> once in pwrseq_match_device() and only change the powered_on field later =
with
> pwrseq_power_on/off(). Unless the user does something weird, we should be
> alright. Maybe a small note in the kernel doc would be in order.

I was refering to the status bitfields in |struct usb_port|. As you already
explained I think the pwrseq stuff is fine.


ChenYu
