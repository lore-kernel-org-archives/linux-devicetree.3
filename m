Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE123A8721
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909306; cv=none; b=JoXX6GBOzyBuwBvsSOd796BH5lO+cxCMRiK4cMSWUF2kC0Jm0wVUhQ5okNDmV+6HIiteUHGeGUNCdJ/k7zaDHqGumJK6qms4frLhww2Whvno5iLeZnWQik1NhNK9sJvE+7gGQPjkv/DcUerToEK2UXBpm0Ru0/jN+JPrHZDAeJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909306; c=relaxed/simple;
	bh=LGJeTRKsWTZd6TMNznExZMPKEFOtHdMmOsWk3k8oy6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMy5S7rZWWYsLpgYWYr8lFBhCxC1i/DCIA+/SDAyzUHUl0B5Kd7detf9e9oGDVm/wyqkaoXnlUGdPNFP9ytFpBK0fpRUEWuppd9vaMaxBvPPPWEvLKJ5PG1LxFkYASYpj1YtFjtqNok7GpV2U/BvJjNWCmx5XyOHAheknZ7B/KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xe2Kpgd6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xe2Kpgd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F591F00899
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780909304;
	bh=LGJeTRKsWTZd6TMNznExZMPKEFOtHdMmOsWk3k8oy6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xe2Kpgd6ysw9wl2YnpmSVvr3HAXiTGw9tpJSqvuB1dLcIhcvDLeZciesf414syDj3
	 ZlefxnKbXXkM1er65J8Ml1y8dYgq2GgHHnnTAt5jkitjab67Z0o2socpPV+3TlXM/2
	 WGmAX6N+tRdIgQm3Tvf4PFzNLJ5GH7MrJt9UC94Z0jnTnMaBFskEuRlOMiJ7E4vUUd
	 I5zaWO48nJQz3WuyRAJAv5HYAo6Unl0M7LYBVjdkF9zYrNymYEkaYwBNzKhRtIia9u
	 eAKGs5x5/Cx7JETdPkXaUw41Snr8SeRszR6DZrm82wLjYa77FhRSsBYD4tQ2JEJrVL
	 agFtyunFRtr3Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa68d9d4a3so4351343e87.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 02:01:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ85wgrz3Bmg9UHOiyxAdQUUanjBy6KdW8+mrWqS2pNaH6aDPb7NhojJTD3L24z7wRZjX1FCyPc7+teZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxFPl29H2MxVIiJ9VqMWVuV/maQr3cUXoDJOvW8Vkv+NE1g3wbq
	6yFgbbq25i3mhiHYvVxSRIS3k2E3upVg86nklcs3kiVK6kUdxxI1odOcUXJAGBRlRR+XRXubq4o
	45J9qDRJ2tEPJnTNV83z/Jox9Cp8UBmk=
X-Received: by 2002:a05:6512:6c1:b0:5aa:7126:c62c with SMTP id
 2adb3069b0e04-5aa87b40d20mr3965582e87.1.1780909302629; Mon, 08 Jun 2026
 02:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330110135.10316-1-khushalchitturi@gmail.com> <20260330110135.10316-3-khushalchitturi@gmail.com>
In-Reply-To: <20260330110135.10316-3-khushalchitturi@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 11:01:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLmivL9gwoH=-8ckr1_ufV0pVpeLqjNH1GwZ3q1G=v3GhQ@mail.gmail.com>
X-Gm-Features: AVVi8CcySFMrp_-u764vQiNFLySCbzgBlciziVHmIzBXSnKSliKS23ncy01nEGM
Message-ID: <CAD++jLmivL9gwoH=-8ckr1_ufV0pVpeLqjNH1GwZ3q1G=v3GhQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: gemini: Rename power controller node to poweroff
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: sre@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ulli.kroll@googlemail.com, daniel.baluta@nxp.com, simona.toaca@nxp.com, 
	d-gole@ti.com, m-chawdhry@ti.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 1:02=E2=80=AFPM Khushal Chitturi
<khushalchitturi@gmail.com> wrote:

> Update the node name for the Cortina Gemini power controller from
> power-controller to poweroff since node "power controller" is
> reserved for power domain controller.
>
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

This patch 2/2 applied to the gemini for-next branch,
sorry for missing it.

Yours,
Linus Walleij
