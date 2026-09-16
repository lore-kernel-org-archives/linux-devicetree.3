Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462383BC69D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 03:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528361; cv=pass; b=R9sLRm+xioZfuYssRRxWRkVmIKUGLnj5XpPp2u4JGzQYKXLcnPo9G9B3GZ/3LQkeDiW4SDHT3M23nfKmczh6Kc7mDFreOu1D3zcGdC+dxt60fmLhisvqBPvgbVPGoMriMa++5/NMGYyxbt/x/q4RtzXhFVAM3ACr8vItRFiOPVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528361; c=relaxed/simple;
	bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtfsCrgR46GAj/3y0Zsb2zaM7oIa7PK+YUEY7bxSpAdu4E7fYlvMO3Z8T2jlxaLhtg/SRcCZB6Sn4UuKs/t8f3KE+UWISfcKAJdJ187H+0ay1UeSV+BYOFfQqWEKIhNcPqR9bHFU4S+qmdsl5Oo3kj8+GWhBIkJAb4vOol6xpuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6bxraIy; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6bxraIy"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso259832e0c.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789528355; cv=none;
        d=google.com; s=arc-20260327;
        b=LrnRue8afbwYQFzsiQ7IxB31pvitimnqxBjE9bI/L8I/IKLnjzYmgny0owWcy2BLjS
         aw/9QU5hustHEyLhxtDqAAPn7gkw4hAKJvwTPKe/vPnbwFf4Vd2wQv77nm7mtrsMQ5rU
         Ucvf7Ee/PatxBbL75czKC5WEfqhV6OCx+8PO168QU3diJHeQjZiDRhoEkufYKl87Bw8q
         4dvxq8EjU1ZAVXLV550+YD3CYHMIDevZLuEI7F1QeINOUMn53MNGjEsr6YgPsH9x0MTE
         FBYhD53jcRbXoAH+0E2ejFWx+VdVb8B3TlMmJTLPTq40+FyXBXbAJTjpp0l6qlRN0sOv
         OoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        fh=4BOLh0rzCqZJWZzzH/aZe/3ZKJPdAOx5F9L33WdsXb0=;
        b=lz6hj5E6bWcyjdKMq71GkJwCH0FXWW50HkQWkQbAyNXA8gDpzZ1TUIGOQyJmzXFe35
         626lB4gwm6uDVJa7M+uG5SMP03zNa1sEH/d3+I6WzjcPrhSjKKn2KkXpsmlwlviClVnk
         xDVz+ySuW4lRI3KYrBOQyewWS91x0RwBXOn8K0rIlw6nRm53X5WCy7u2t/C9Ibo0aGos
         l/gQV+diangFMpsxzRofvG8Z9lo1OWImwNouGRp1QMKzpeptGE8tN7AvK9T5wNJ5pHma
         E0Sib4XRwEUA7NdG5HlRmBqFB2TAfPQBK5SqY4krPVxgkRnpR4ubo/1BOEJlAdLaqSIa
         8cYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789528355; x=1790133155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        b=m6bxraIyTcGI9du0PoSBP2t6QxvgZ9A02mIlBBD3zA0gUDm01z653PkvQFqEgiLUYa
         nucedVD6qrIk1Jeem3rRD/YUqYsonICn7IHpfsXJS4SvPHNet9CG4u3dafStbV9JFSDj
         oKZSIbMxwrtqbj/fsEY15fJQzs5yq7ftsONkHFcddSN8wwqAe91vi7fK29ycnd9GYIFi
         dqciC7bFsFnP8PXZsGkPsIu2c7fvAAt/lovDmFbyi5Tl25pRAmeqoeoiV5LPRzs/qQT7
         GU/Z4F1TYKSYIQxP690pkto6rFnNDCV6YBEdfPx4tM87g8DGE8/sLzD8FeC58kWG7AKI
         aOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528355; x=1790133155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOA+W2OAbrZJ/yGP7NnAmIaJwzKfjJWJXYt5I5goVnU=;
        b=iBvBhQdU216RfMwv8ggHN8Y2PuHR4Qh8m2ucwzsNxckrkDeKMZ1CviPYGFtjFFtUzX
         9bSMdM+p5tjtIL67BASX4LAbQRIqm5GkKKZfYq3N89ohMQlwyx7J4ntOfldrawTYJ6nD
         twmK1cyL+mNRcuoMSTwuYfX4Rsyc3yDjzhw61boQRdRIxKBggDGzXJvF7TeENKo0AsuF
         D8jpodibkDbGw6rdNBp0zI9qkJATJyDbXr5p5NkbjJ+4xqAc9GFI6LOdM3OvWydlIrfw
         3BquKheovnPEPxi+sTjvFnHY5R1lgJnKjz/Y5W74sne1htkGpfHJOco8SsUSomU8m75k
         lD0w==
X-Forwarded-Encrypted: i=1; AKwUvBxO7nLde2y6u2hyOj4ZvNopmU6ynNR0aRU0zj9NHC/p0vuEHtjevPfXXTnISI2VnXytL8eC15hY6VS1@vger.kernel.org
X-Gm-Message-State: AFuF++l9QwV1u1j3enJ8jlmHH+I7mEF6wkShGvMDGrCaBu+DHY01g/QK
	DKKql/Me86QTqB91oQpfyI58VmwRoQO9s0suPAEtcWCpFWJlMP/klo4A0YhbvetNHW/hUABy9fq
	OM09ApDechPfSlxO0ymKeQECD4m//r5M=
X-Gm-Gg: AYBFou3t63Ix0omR06g3dMEWM3/C15ACL+xyBPdO78WexZmjO0cT9jaQ9Z4bYDtQD24
	01nfT50AOWLBdEI4/W1hkfcGf9hraFWj4bNlEr3vDNpi6i6YLCjzVaO+nvUFnhUnzRdQv9bSkDB
	XfmeAqz5Tn00ZiOrpeMzEeT/s7ABll+PPM8514kgJPdtZq+gxWiwOLOkywq+EnNiefRaWkwFEdt
	/WFKTKqjVAgQyYjU+8PY9j+6kJLnD56G1U2sIsdVHjl2/rk+Mh2fR1O9YRAT/Ie2Cl3Lq6Zx4W5
	3RcvA+JhxQL93y8QxpdwlmOMGIP1Io1WYGVwLGEnBBFTSExNti/HXPmAm3otkxuLaj3TurKjJVg
	JyoES2MdOrdKcNvxhwd0Ho08EjZzajE5UEFRw15cyPme50TM46/WlOMmrhM/RJusgBlciye3h/x
	wFReA53dQ4f4TJogEOlpxfV55OdPJuoSAyxtYOU9TG8oqi
X-Received: by 2002:a05:6122:8b11:b0:5c6:64ac:d6f3 with SMTP id
 71dfb90a1353d-5c99accf34amr894249e0c.3.1789528355167; Tue, 15 Sep 2026
 20:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
 <20260915-submit-h616-emac1-v1-v1-1-195de0bb1f8a@gmail.com> <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
In-Reply-To: <5df35a3e-d2c6-4576-868f-d3194de3deb0@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 21:12:22 -0600
X-Gm-Features: AcwNN1VnOu-2I6GbVq8WQF9CNqEg1e8Y093roZVmrwYp1oBZ-wfj7f7of1XAwLo
Message-ID: <CADvTj4p6RRcr7jb5hJCveeniHC81gkzHxLrPA0T53+VVUrKAZA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 2:33=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi James,
>
> On 9/15/26 21:03, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> >
> > Constrain the PHY interface mode to RMII, matching the hardware. The
> > EMAC1 clock register also retains the three-bit TX and five-bit RX dela=
y
> > chains, so allow the existing Allwinner delay properties for this
> > compatible.
>
> I don't think there's such a thing as RMII delays. RMII has a single
> clock, contrary to RGMII that has a TX and a RX clock with a 2ns delay
> between clock and data.
>
> I think it's just a leftover in this IP from the other variants that
> can do RGMII ? You should just be able to drop the comment changes here,
> and same goes for the dwmac patch.

Yeah, looks like most but not all vendor driver variants had RMII delays
configured here, I did test and it doesn't seem to be needed so I went
ahead and dropped the delays in my v2. So yeah, seems to have been
just a leftover config.

>
> Maxime
>
