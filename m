Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15D33B4EBF
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578357; cv=none; b=iJM4TLtMS3UtWmgE/TyybiEJQL+4k7j4ctQIvgCmtTLf+os5BOtH0UQUNU+gM7GMF0NcmzceCsg62sLwluNJs1TxsZVdZUR526+GFLlSqSZBAR7N6spx0aKRwPlcSRGUJcWZ5olb3SIULWaRnwL/7UYGeAdcmP0f4CWzj1uvN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578357; c=relaxed/simple;
	bh=oT+qyKGguvYTXbU2o3MxwZ9h8G7lSXD9PAN6Vz3yPhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZNWtDmjYXsPLr4n4vagtO46Q13uG+xsvuow/Mb6WCni1NKSx4TykztKkm25fsZL97CTD836dZGzizNXaN+x7CKBiCIJgA3S3BGCDu6Zy+lZDVyD+TgycaVUEMcyeIIvf9DUFr7eHIh6uGv/x8NOG111ibFkjyYFf5LIHvkzAF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSn4fjg6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSn4fjg6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9011F00ACA
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578350;
	bh=W/4OZVYAEidoIzb/vZk4OlyR1a69x3STJrX0+eOpz+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OSn4fjg6OWV3UNqvAqTdoJ7TLyB4FGH+1Z2wB2JEh9Yd8oc/5Ii6P4A7m+BnBg0tG
	 YBVKsaQ0qb+RElkwoEJIRf00uCVoaktY9T/QP9qW6VRBTnoBdEEcnT+/zywru/UCxz
	 xhOYUoJC0SDhvE9v9IJQMQY6n9S8wxY/sZX4eU1Ny1ARlvdbdXhCmKuwY7RyfSYpjP
	 Vwz3OaGbN6rOywbAMoSFBGsKBXVcQHoWp8XSsayEDSPWvPrDrYm81WLv40KET77dLm
	 OLSvRKv70ZTx68293Eod4p6xBeEtb4x6dmiD0RRXzfyFdC3pPag9qEEghIn9wo8RTw
	 VU3E2bx1jjc8Q==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15dd4b9132so1703955666b.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 13:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNTZrYF+sMMUhTF2eZEDlloKOlAFa+l/VK5NdM5WB+zhRRK+F+TUL+vq5OVxAieq9lKjaMgV4PP80u@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbV+quw+IPbSaBqw1giaPPr8JSUvINA7gvFoBi6ZwT8F9P4+d
	OkQtCmr0tctVmn9EiNmzZ1S3+HqbMkPx4E1unVCGBwqEiO4hnYC2pAyNd6KqeLKnZjGbYRD7CoN
	k+iTG+i+MRtsssHVSaTK5eC62Z+3jmg==
X-Received: by 2002:a17:907:9623:b0:c15:f65a:43a8 with SMTP id
 a640c23a62f3a-c16b4571a28mr675113466b.12.1784578348579; Mon, 20 Jul 2026
 13:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Jul 2026 15:12:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKkxVTVE=o-uar=JEVvqw9NhBAQcBrJ0ukf+RBXCwFZJA@mail.gmail.com>
X-Gm-Features: AUfX_mwgZbPYorhmNWUblQ-rJjYQoMokZ0OMEFyO8O_QkQHXpRAwW7QY0ciSWZE
Message-ID: <CAL_JsqKkxVTVE=o-uar=JEVvqw9NhBAQcBrJ0ukf+RBXCwFZJA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF maintainer
 profile document
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 1:40=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Document how Devicetree and Open Firmware maintainers handle their
> subsystem, especially focusing on two caveats:
>
> Devicetree subsystem handles patches with a minor difference comparing
> to other subsystems: while DT maintainers pick up OF code, they only
> provide review of DT bindings without applying these.
>
> All three DT bindings maintainers rely currently on Patchwork and due to
> enormous amount of emails per day, regardless how much DT maintainers
> try, they cannot read all the emails.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Saravana Kannan <saravanak@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> I expect patch to be picked up by Rob, after review.
>
> Changes in v3:
> 1. Add also F: entry
>
> Changes in v2:
> 1. Correct typos and trailing white spaces.
> 2. Fix order of P: after C: in maintainers.
> ---
>  .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  3 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/process/maintainer-devicetree.rst
>
> diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentat=
ion/process/maintainer-devicetree.rst
> new file mode 100644
> index 000000000000..d8ffe752bf5d
> --- /dev/null
> +++ b/Documentation/process/maintainer-devicetree.rst
> @@ -0,0 +1,70 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Devicetree and Open Firmware Subsystem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Other Process Documents
> +-----------------------
> +
> +Please see the documents in Documentation/devicetree/bindings/ for infor=
mation
> +on how to write proper Devicetree bindings and how to submit patches.
> +
> +Patch Review and Handling
> +-------------------------
> +
> +Patches handled by Devicetree maintainers are processed differently depe=
nding
> +on the patch type:
> +
> +1. Core OF driver code, e.g. drivers/of/:
> +   patches are reviewed and applied by DT maintainers.
> +
> +2. Devicetree bindings:
> +   patches are reviewed by DT maintainers but, except in certain cases, =
should
> +   be applied by subsystem maintainers.  See also *For kernel maintainer=
s* in
> +   Documentation/devicetree/bindings/submitting-patches.rst.

I would reword:

patches are reviewed by DT maintainers, but should be applied by
subsystem maintainers except in certain cases.

> +
> +3. DTS and drivers:
> +   DT maintainers might provide comments, but review is generally not ex=
pected.

For DTS, we expect to pass schema checks or at least not add new warnings.

I can address these 2 when applying.

Rob
