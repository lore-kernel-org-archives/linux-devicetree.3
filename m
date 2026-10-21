Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594771;
	b=UgOVCRR/a1aW0yJ60TVCcWV8TumQS/B41QwnlKr6J3qs+Fa56lIMrKdyZXiQcn261z+O
	 T2kACEJU8tvE7CDEqTk0wU1y11WCk9VouTLSJF+xF+kx+V5GXGlGLYvD/UkXtX0Bc+mLj
	 k0Z0tbZzliRBjziHYF5Q383+gj06ysi80XHRBpwr3anCbl6qtriFyLrRdR128t234Hktd
	 h1NeCvLTf2P7GXk2rqsQPI6D3HerLAeoVp0+qHwLNhI0bMMNmd7LLYDRu1HLIxBkY+Z1T
	 45ZxgE9+PXXcCGY8gdglAtT5et2b2ViDYBKkKqOLS8zpTLkEOVTB9QLAJEMYQDfcyaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594771;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o7mWMmn0y6OE7cAZuYYIUBrV66g2IAm+RrH+ZQQFxok=;
	b=LhuwHIPBaX6onWphDxFVPv3YiYWgH+meMR0eajLrnQIzkl0JcUbUVwt4ij7UzxVWx8zl
	 mv/fQxcrsWlsOp2rzOC+fJk1+zCqhc/vDdl+14e/7nytcy9+I85f1NiZcJgjKJ2Ou9/pI
	 jleZU5yLJQJYAg2dxTIJ+hzfYNpfptC2DepiQZ6wZagJw174IFUClgqAVooGu8ewUkfr8
	 IMH4sYfDnenPMY9nMxNUYRyQH4+L//xyn9GwSObfVAWEkK7suuGi1uMxnnaN6OVBDVY7G
	 E0ujz+cPDQMgWKIC+Wv+BTcWHN+BXflX1P8ZYxCLCEY1GpUuEvqjX5h9hP7Hh559ziw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clWbjGJC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D83606A31E
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clWbjGJC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861131F000C7
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594770;
	bh=o7mWMmn0y6OE7cAZuYYIUBrV66g2IAm+RrH+ZQQFxok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=clWbjGJCxxVLFJ3LvpsN1aOnBJIsx6leHLMO13p7eRGlF2MKV8FEKUDJCn/ozcJOW
	 9XgjqKIDuRgCQ1XNHM3TAfhOy396e8lhmNUmuVecjwjFkHVLsQqLAVOYh9CgeW/kKd
	 GRebasXy9HFuDAY5+HZAq2+VF3kOWBwqF7Nh9L/ePAnP9/Dqr56ctuKdkmkMWtveE3
	 3qC6Wq1Y65YzXwXVmKoASCOFnkWmPsX8uWaRzZpJX00mRvRxS9M2JxoDAo4OUJ+9GU
	 fba4ZiWZ0gxJrvwzUuOEP1pEnLI1z2/VqE/ZsQkREv0I5k2CJSo5kbkG6KhXutemyR
	 deMTgketoSr1w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso721682e87.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3mQ20EP14cmLcAqiOQrIZmcNjvu/7RrvyDVyhaFOZU6PWueAfXjX0K6MH/a7BFE6YUPAENvp4PEyC@vger.kernel.org
X-Gm-Message-State: AFq9FYJYnGZYwBl7o622TSywbWecmQdz5JOJu49eGXPLWSNKrPf16kAB
	MsAg6EOv41oGHFT+nF3s0Zdp9NSARuW+XN1KTevJ0KP1yaGxMLnhBBLSXLqvTj0qsSDvZYK9C/F
	giLteTtdO9CxY80CsjRPtI/H2fnWR1og=
X-Received: by 2002:a05:6512:3f08:b0:5be:4ed3:95a5 with SMTP id
 2adb3069b0e04-5bfa1bf964fmr1050554e87.42.1792594768911; Wed, 21 Oct 2026
 07:59:28 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021134243.35103-1-daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0g5a+0eaULxGG=RFm=JN8Gh3_A=7mGUTmFUiXsxVKvpDQ@mail.gmail.com> <f223c867-fca5-44f2-9cc8-dd3ca99e1387@oss.qualcomm.com>
In-Reply-To: <f223c867-fca5-44f2-9cc8-dd3ca99e1387@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 21 Oct 2026 16:57:09 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gdciXBVLVkg+61uf295KT04z=te36rYR-p+18M96p9=A@mail.gmail.com>
X-Gm-Features: AclHuK_mfzmSMd0d7MFDzlfylep29Qo2bx4v9s1XyfNDjPJ7gnGjkHsawtfNplo
Message-ID: <CAJZ5v0gdciXBVLVkg+61uf295KT04z=te36rYR-p+18M96p9=A@mail.gmail.com>
Subject: Re: [PATCH] thermal: Share THERMAL_NO_LIMIT between kernel and DT bindings
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 4:47=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 10/21/26 15:48, Rafael J. Wysocki (Intel) wrote:
> > On Wed, Oct 21, 2026 at 3:43=E2=80=AFPM Daniel Lezcano
> > <daniel.lezcano@oss.qualcomm.com> wrote:
> >>
> >> THERMAL_NO_LIMIT is defined separately in the thermal core and the DT
> >> bindings, using different expressions for the same no-limit sentinel.
> >>
> >> Define it as 0xffffffff in the DT bindings header and include that
> >> header from linux/thermal.h. Remove the duplicate kernel definition so
> >> both interfaces use the same unsigned 32-bit value while preserving
> >> the existing DT encoding.
> >>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> >
> > But THERMAL_NO_LIMIT is also used by the core on systems without DT,
> > so why is defining it in DT bindings not confusing?
>
> Yes, you are right. I missed ACPI relies on the THERMAL_NO_LIMIT default
> for the cooling spec

Well, in principle not just ACPI, but anyone whose .should_bind()
leaves the struct cooling_spec as is.
