Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9EC43E9C3
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537467; cv=pass; b=lie4GQ6gmzDsqt0L4MCL0JvUGNSfXQUJ4sjZRAuamqQ8/BuBJTbBzea7O7n0YXVNZgamuOAfDHe3gkHPl+ev6Hd3CqDErw5pJAbV+c/hYV1slUd9gimmJ1R/LuFkY8yMT1C1JM4N0tWhSJAnGqfBwtBq198OzNQs3wbZ6/TAbGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537467; c=relaxed/simple;
	bh=k7YkQ+Bc7EQX0qDaijrFEUTuOpQfKm59tZjQohvjtGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dm7Y6YUVmRL/stoYl5kZru8LTPFmA3UqTrS4Bk0mI28QBSaypVJpIxlHwb2l5QTWxfbQapFHwv6GsDBi3GqNkC3GSyJpvZouxV9BfKihpHLzY787ufnQDxvxpkd/Q1v2Kshs48pA4WmeksYwW7taHunryQFfpHpUTWG71QYwFWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSSqV61v; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSSqV61v"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69fdfd98eb8so106225a12.0
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786537464; cv=none;
        d=google.com; s=arc-20260327;
        b=DLKpW+PQRTORymNWVNdEvMJ2+sC3zSwLNtdak7O18MDXD57G8c0/RApCzi2wziwse+
         0FxZ5ZQ4Ri9IMYSURLnUMLoxI9D3kL9Qb5epZUQYgR0ZwBbuKQ59XWvKnFzqUMr6cSZN
         gdSKAAVthCnU8kpyLTVxsvzMmcvAF0OlNsDCHXJDP7xtCUHI6sy8eS7LioIIIVKW5ZCx
         PhlpG824DnihSLqNDIv/thmVjTRXxexkcjuGmX4ZzmJM0hRFU2HB6mOgLmUU7KmdQXny
         DVyeOqTSPs9yazQdQCxwXakqJl5QNtG6o1aXb0nY3yrbfE0gD1I3ZGy3PSyY9pAwiMRz
         73Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7YkQ+Bc7EQX0qDaijrFEUTuOpQfKm59tZjQohvjtGA=;
        fh=msX1PH7JV/O5eVjpmu5VpDpX3hH8ZJyU/aoFx6JGkLs=;
        b=dbztHDN/gQIs/7m9Y6Jq5wO2Adkv3/sfLMt7d6YeOQTZ8f85cAh1eP1K4Z8ZoF0eJ3
         3xT0/jyvEB1zNbmPzn3Enk4rgTWPI9iz8c+/nMJD9Lf2oOwHSmuKWDuq77pwI2PeAHbV
         byzW/HQXHinerUg+ysg5OneutyArqx3el7v8GsiDLq5zoWDBeh+ZyCy1MfU23wPTXR7C
         QDV2o+Jok9zs73BQnx1u8s5zT0ovk8rt7yETMQGDZmiKfMQk6+29ymDevWg/BWXUUX03
         bmP1n4VWqdaSqkfdqJ9CdffBd2wY8hI0BVVK0gF1oZ9kIheYipXv7tg9SHcbCj9+GyXf
         AjbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786537464; x=1787142264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7YkQ+Bc7EQX0qDaijrFEUTuOpQfKm59tZjQohvjtGA=;
        b=nSSqV61vfBWYfLNfA3mC+X2QycVSAbNWt9kpkq7V3Sq99vGcutO7yYopvUNPs/vA3T
         FduCSUsn7nuGUeYiBqbIvQXHnmn3iT+h3ph/btfCDs+LWALCJdKR9I7Fv/+iHQ4xhgn7
         olu9litee6F2QKo9PzTFPiVGFnY+660+0Zutc16jhM/NzR24hgg5OuONiIIGHVCt+RrG
         YjhV65sfhrmew6K4cBXRWvxYqee9iBBRwFgbhldxXRJF7XxIVp0pg5TEe2hnCdgqsUW0
         mmj8u5mfRNSD9iJEWQsO4Nvagw0I+ESv+cAtE7TA/KLH+5jmYpoAJ77H0nnfzGAe8x5f
         siDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537464; x=1787142264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7YkQ+Bc7EQX0qDaijrFEUTuOpQfKm59tZjQohvjtGA=;
        b=MImevqejU9RNCsIMHwFh8CtaohbOTPa41ek5XFRIRQJf89+qRacrg8GST3tCecF7P3
         AjGaPVrLPNSPo3Ja1tQl5MJ7tpM6kPl5H/JnhfXt9uhEIphBIwxTCgxrPVJFqE/2eUOv
         p7aTi5SFFLaX/1ZMUtrUG7lt6FE6OV4PRSIGQ3hX0OehxKLQp6K415YmijrYikOAhfIO
         Wi9V4Ms6ToutXudXZxmjRbvDymU3OM+EQCpXU4fzwoLC+cTceX6F9RtJ9Wg5LdpFgQrG
         iHUPkVLEf3s6MVyLFZbwBsQ0ZVvhJtvC/9gcUQ1SexuxBRyyakZHLO5RI96hhYOoBZ7M
         CInA==
X-Forwarded-Encrypted: i=1; AHgh+RrgQwvUf06guAxYYk8rvEbvraKY7u6iDI9sDYEH+jvI0062gbAaFu+rwT7hCBVIZPYmVbb4fZfG+m8U@vger.kernel.org
X-Gm-Message-State: AOJu0YzFfrZMs/0YlxJNzNo1xU+eSxlebYUbP5GzjxiggvjACpZkT4hb
	bkUjf/NL3vtSG1VLdbww65vzba8naSuOy8maZ8lPD8VrYjpMJ2zrZ0wf3P/fNHZF77rgXl8c7tb
	eNVm4BA0lxba8pJaz+gwXJ0emGz/XiFg=
X-Gm-Gg: AR+sD12R6QmFECsoEChewH1pjbTFToyHyxZMy4w2jXzicuWPA8e2j3M7xdFkaKKpnEg
	OYCbvVIHuG/XOw6o1eU/3nn6u+1MsbbcEJ2FWeA+rlInfpgf/TUtHcX68tLEwyPzICpwkF8theh
	xBbjrmrEE0alk12U4bEYhtzSiHEecO3lfs86uQfmHk0SUyxiAva9Ni6SPUBi+JLee9dsBVMWnB2
	r0PH4q7yelWfLv0gZ+sKXFdi0qZHFfXBe2YK7sckVLgGX+luW3k5nysI9H47nCK0zxnPB6Kzf+8
	0E7Z0hxzE8VT7IrHEWhTilj52oUv92Ys8RMYWpu5levxiQ==
X-Received: by 2002:a05:6402:5515:b0:6a3:72bc:7bca with SMTP id
 4fb4d7f45d1cf-6a375f517b5mr853527a12.3.1786537463007; Wed, 12 Aug 2026
 05:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com> <20260812-refreshing-rampant-gecko-b38ef9@quoll>
In-Reply-To: <20260812-refreshing-rampant-gecko-b38ef9@quoll>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Wed, 12 Aug 2026 20:24:11 +0800
X-Gm-Features: AUfX_mz6P0tpS0X_aTP21idLy0_k0ZDj4Fov-0axes74Vj1me73dhQSiZbhCnY0
Message-ID: <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

> I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> Isn't DPHY implying it is DSI?

I see your point, and I did not explain this clearly enough in the previous
version.

D-PHY only describes the electrical layer, and both MIPI DSI and MIPI CSI-2
can run on top of it. A CSI-2 receiver's PHY is a D-PHY just as much as a
DSI transmitter's is, so PHY_TYPE_DPHY alone does not tell us which one the
consumer is asking for.

That is the problem here. The RK3588 DC-PHY exposes both a transmitter and
a receiver from a single PHY block, which can be used by two independent
consumers at the same time. This is not a theoretical concern: on this
board a DSI panel is scanning out while the same PHY receives CSI-2 frames
from a camera. With only the electrical layer to identify the PHY, both
consumers would end up with the same phandle cell:

dsi@fde20000 {
phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the TX */
};

csi2@fdd10000 {
phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the RX */
};

There is then nothing in .of_xlate() to distinguish the two requests.

I will make this clearer in the v4 commit message and include the example
above so that the reasoning is easier to follow.

For context, v2 described the direction with a Rockchip-private
RK_DCPHY_DIR_* enum. Michael Riesch suggested using generic constants
instead [1], and Vinod agreed [2].

[1] https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabor=
a.com
[2] https://lore.kernel.org/r/anSuxfeitSqmSHNr@vaman

> Your tag goes the last.

Sure, I will fix this in v4. The Signed-off-by tag will come last, and I
will check the whole series again.

> Two simple defines needed Claude.

Yes, I agree that these two defines themselves are simple and do not really
need AI assistance.

I added the Assisted-by tag because I used AI during the development of the
series as a whole, including cross-checking the code, writing additional
test cases, and looking up the relevant sections of the TRM. (I checked the
corresponding sections in the TRM myself, reviewed the test cases, and
re-ran them on the hardware before sending the series.)

I also checked the current mainline guidance in
Documentation/process/submitting-patches.rst and
Documentation/process/coding-assistants.rst. Since I was not sure how much
AI involvement should warrant tagging individual patches, I chose to mark
the whole series consistently.

That said, I am happy to drop the tag from this patch in v4 if you prefer -
I wrote these two lines myself.

Thanks,
Jason


Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8812=
=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:51=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Mon, Aug 10, 2026 at 08:10:09PM +0800, Jason Yang wrote:
> > MIPI D-PHY and C-PHY blocks are increasingly direction-agnostic: the
> > same PHY IP can drive a MIPI DSI display or receive from a MIPI CSI-2
> > camera, and combo blocks like the Samsung IP on RK3588 expose both
> > directions to independent consumers at the same time. A binding that
> > needs to tell the two consumers apart has nothing generic to reach
> > for: most constants in this header name a protocol (PHY_TYPE_USB3,
> > PHY_TYPE_DP, ...), while the MIPI entries name only the electrical
> > layer.
> >
> > Add PHY_TYPE_DSI and PHY_TYPE_CSI to select a PHY by the MIPI
> > protocol it speaks, which also implies the direction. They do not
> > replace PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice
> > where the cell selects the electrical layer. First user is the
> > Rockchip RK3588 MIPI DC-PHY binding.
>
> I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> Isn't DPHY implying it is DSI?
>
> >
> > Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> > Signed-off-by: Jason Yang <jason98166@gmail.com>
>
> Your tag goes the last.
>
> > Assisted-by: Claude:claude-fable-5
>
> Two simple defines needed Claude. Great, that probably makes AI
> conglomerates very happy that we do not type even two lines anymore and
> need their resource-hungry data centers to do that for us.
>
> Best regards,
> Krzysztof
>
