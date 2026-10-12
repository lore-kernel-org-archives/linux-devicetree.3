Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469B33CF039
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831424; cv=pass; b=tiZx2eW2d7RYOZ8xoF8FK43t/EOdyEitvMJRUVAM+quyw/HOql9KnytCdYNCrCalNEVPdkKpZxOOcFSGSikXofnLl556Wc7lg5RXfUSfUuAgY82yaYsD1bGr2DosowfZe9dWkP3sxIfHf2fqd6JBdhCr8xktGwwfcF0DUvCqjHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831424; c=relaxed/simple;
	bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4GyfatC65ObWcNxMjGQ3fjFA4gSrjZJZEJZNVUrvebfZ3WTZId9PxbBvVtOSwOR70HmXL0p4PxgcHCot2mvQmIAmW1i3WG7n1YCOXwPTRxYPAhDri5QdyZCGgMGhbByRt7gq/wYamZXqWYS0FRbsIB5Pv6icZkKdAk6ybWtLmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxEMn19X; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxEMn19X"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9cc73235so2002377a12.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831420; cv=none;
        d=google.com; s=arc-20260327;
        b=r21jlabvYYBmIA4uTB17mSuVRX/M17JHOq7kZ6L3yoMckIVagk8gJjVq3/mo949euL
         EJXhSi3auk+x2ty0vaABPdqLFrKTKe207FdYq5YLC1PbOhi7FIiAHUTynvfJlKrC1v5O
         sELiM6BrFYeJTVVJl6EOLWHhyA8uS0D+PdaXX5AB7DekTzql2PU9kLFkJ2TSHeZ8kVDw
         PCJ5xZ8SrUaCjZJzRGS+pqIgwDATWD54vI1vzzerKqQvBoIdUe+vRbmZHA5rhuJssUW5
         RNIrDapsjAcnWULAZuGv8jBtqBfvL+6AAaF3PHCfGlzNx0Woo+vE7SSwaj49W1qwEJHI
         P86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        fh=FXn6DdB7oyVcwU4z/9WEDvVpxqGoB7grSVsZlhJ1fy8=;
        b=DGPXqaYWxExm/di6dN6RP20U5tOgakQuq3HnZI5MIQDJZvmhqKvHkqEjlh5eJqjqg2
         9uIdyTvK5P55aUGdbHnazYrXm3PZy5paJT/9xtiGWvnpDFpwEjBikXJC/nXP3jDgcbE7
         kPwj7HfeP80AoI/RJM9sFA+8YGJ6sllJk+9nAnuWDIUpH1cQBF4QWqsNK6jPzj5aA806
         trqftW0vkMhnnzZIz3+z90bdvFOPe1fVpBdn5Kl8qXtKdV7tHIwI53PNAvd4ID8rHhQ1
         fXk2lel8EY20jIiDUatI1enGPaVb2ZdCO+DO0MS6m6SD2nsRWS9FWJKOZ7bO5TCSSCkM
         7jmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831420; x=1792436220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        b=bxEMn19XS52JX/QLtpdQJA5Ijg6+QkF0DfUX5HfmJeeEvv7OSmrc8vTQhSozQX8C9S
         dlfMP+XEtzvP06O9OTONNK/TTOKC/zOTdDMhuIn4Mu+1fLYEejJKTdNGHO+B9X3z0PRG
         cX5TyxSobs+n0jq71nx80h3N6zFw+4ZCTqc1FzT8z9mxCYcpEtANTWCgm4F9cGrGB1Up
         3QSkJQNF1uXoaevPsiIVOhfRZL5vH9RE6MRqZ48Isu/xOFtxN2bWWK4ZR1JVM0XaTdtm
         W5fLzrwL79Cq2tE7UtCsE4ww/2g1+EzDPW9ziaixxuKDfx8uZRJS4z7I++VcAfdVNdaR
         hkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831420; x=1792436220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        b=d4ax8wkn8EI1kFfcJdm9ZOpgw29b00xx+bWCNjhbERkJJ+puxHAl1C9lsCxlTAJMM+
         LT6KlLZshaZMG05WQGhMcLmqx3bE75rhRdVff5/9s9sWH7dwrOnINZXYCwXkC8FjlU24
         Jqux2Q/2TcvkwSADLQQsSJ3lZIuMQxCNjxWrpfRZqX7MsYJH2ue9kXMArzDQpbrRliGe
         lqiTPJA4hyl6Razv0f8NTOSzdAQ0/jaKAgoFxPWbtiFKXCAMd8JRfcPvY6rRQ8wPIoL5
         XTzfbPhTbLWGl9RVTLEQEnqEu46oADhIpyLrci8d5jvkR9jG7XhoHKZS4pR9BkB/7HHz
         Nlyw==
X-Forwarded-Encrypted: i=1; AKwUvBzm5VRuJFP88lL4Y9VGhkglSVE1gumyWAMruMxkykod4RuZctP0xl+Bcf39Vx9xhHr9hW2nuFtqeXqe@vger.kernel.org
X-Gm-Message-State: AFq9FYIEuGtGdlHmndLYusz7hLNwO2iU2pNdaWQJWx/uylTi4UGPXwuc
	ZVUg5lnteilljVZ4nDADdqF+Q+jUSwOljhQiSbPKZkVNURNieYNKoC1t+wvd1SrbVFi0SFh0vNl
	JxpFev6E49puHEJCKd8K0Ecxd9HMT6g==
X-Gm-Gg: AYBFou3e7myb/xvDbM5f32ymcU6cVhrr2X5zUE9axKYdNYv3wb3EieI+9H5kvWbz0S0
	lPCT6pAoDq7j/EvATWgiWPpAVgOwGdrQX53AjBN3wq/Rkx42tCM2vsZDdMBQ/wcbVA1Btbkd1lH
	C6gZk4vIvq5WPC+bW5Ko/aDEoYqOL2lVddpJGbTv/XbE6R1hlItgFFwpP4F1qoD9AmbJekDI59K
	NWxV2L/k81hSe784wa6ekY6JdE4fNpbXiVGbzYl95pK5AWOc8eoRFE5QOkDbpf8tLcHfrnlxAGg
	tqTDglG3tRi+nwt+bFGJYp5b6UZmlHylU8u/MIaNIsQh1ipBuYV5MQ==
X-Received: by 2002:a17:907:7b8a:b0:c2e:1e4c:35a0 with SMTP id
 a640c23a62f3a-c31a702fee2mr1083958066b.14.1791831420287; Mon, 12 Oct 2026
 11:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie> <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
 <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com> <6a90eb12-87c7-4942-9f18-6490a91cb0b7@kernel.org>
In-Reply-To: <6a90eb12-87c7-4942-9f18-6490a91cb0b7@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Mon, 12 Oct 2026 20:56:24 +0200
X-Gm-Features: AclHuK8XNRMVa5i_-1gcBHkcX16OiXLgWfJwauZ8ZsGnsvSYHUGeaNp1UtvCa9w
Message-ID: <CA+kEDGEBqMh8X=q54EkQNutxTpqutQ11QdkUr7bvJO8_iFy5JA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, "Bryan O'Donoghue" <bod.linux@nxsw.ie>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 12 oct. 2026 =C3=A0 18:53, Krzysztof Kozlowski <krzk@kernel.org> a =
=C3=A9crit :
>
> On 12/10/2026 18:38, Konrad Dybcio wrote:
> > On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
> >> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> >>> On 20/12/2025 00:21, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> >>>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >>>>
> >>>> For some devices, Wi-Fi is entirely hard blocked by default making
> >>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
> >>>> on those models.
> >
> > [...]
> >
> >>> Is this really a hardware description though ?
> >>>
> >>> Its really more of a logical/functional description. It tells the run=
time
> >>> what todo, not what the hardware is.
> >>>
> >>> You could also have a list of quirks in ath12k for this or have a use=
r-space
> >>> utility look for the appropriate platform device string name and disa=
ble
> >>> rfkill.
> >>>
> >>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ trigge=
ring on
> >>> a compat string.
> >>
> >> This is good point. Either this could be deducible from the compatible
> >> or this should actually describe the hardware and whatever is there
> >> wired/configured, not what OS should do.
> >
> > Sorry for digging up an old thread. The board-compatible change is now
>
> I don't get why exactly the board-compatible option was chosen, except
> of course finding workaround which did not need digging out the root of
> the problem. I suggested the compatible of this device or proper
> hardware description.

Could someone give an example of what a "proper hardware description"
would be in this case, to move the needle a bit? It is quite abstract for m=
e.

I guess this was chosen as a workaround since not having Wi-Fi working
for 10 months has been a major difficulty for some new users trying to
get Linux working on their SP11 / SL7.

I can only talk for my own contribution but in my case I had removed
this patch from the series as I had understood from Mani that the
connector binding would have to get merged first and it was far
from ready at the time.

Thank you,
J=C3=A9r=C3=B4me

> > I think merged into ath12k, but I'm not sure I like that, as now every
> > OS consuming this DT has to carry a table of board compatibles (hence
> > needing updates _every single time_ we want to support a new device),
> > instead of being able to convey the quirk through the property
>
> Best regards,
> Krzysztof
