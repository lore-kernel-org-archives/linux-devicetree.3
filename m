Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794222117;
	b=eqcOGbDy/3RLpsW43RMQ6/UQW0q45qSS4+WJ2PoZmVPGj1h66km61fopPnN11nRgHEyr
	 Y69sESi0WTD6EpJeQr2xc6dijaoySSqgj5CETteGftsHOCpLJ6WUAQPdNrGiwQpxfuv3y
	 P5XMJtQjlETSCclNmxzPNKmfsFdKf+z7OQwd8nWPdCBCNL2bH7pdg3nMGMWAheHuLn124
	 sNShoZN6vYaANUzbq323eLkiNioS3pfUHZ3Haqw2PJPlBbqsBhvFBTJjDDymGBvPxOofd
	 uE1pxcWZ6na9azNfjTBpWItNxjnURiCCf/536HnV2Z+KiIX5dhXGkMyD9sfbU4NuolA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
	b=t7Zt9fCH+30jmGRiVZBNWlOTAMrZJQOBii0FZGQHky6g7xN8D13uK3AzHWpMTXJhsf3V
	 l5fNbqucdONWs0xQl+FEKUHMYGOwY52YAQ/mk+O4jVRIywDQtU0Lyhk0PaYNwN8h1qLYh
	 VSAtqGHpDDPDxIOiih30gs02ul07JMdV1A5qBjX/yBdEJB2BUyYfnhJp1O3Ad7c9oKGuC
	 9kvCKTBv5OalozmsYnZBcVcDemTQ4vqQwJu1SPn6gpchHTxZ6rfMFxHJ+5GUJwUspCYr6
	 Sq07DLH4o/iuVORZkVg4Dr3C3IVlJDEHUaJIQRty144G0PCBUIUmGiz10Ddz1J0Bv9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qz0aakdO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE9A606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE9A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qz0aakdO
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so395448b3a.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 03:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222117; cv=none;
        d=google.com; s=arc-20260327;
        b=S3zHASEj76gE+e6HHL1OQz13B7rZ94mdS1TWiqJcVRsBaFljRHMkfM5/SIRrSWmSQz
         YZ36fL0FTvDERIxJM7aFVvSqj7CwkzPm4olKv+UK5F9NE1cjEzKdAHMdgIsZu0N0pJ8S
         JNyau3e4XwpRISsQD8wKtDDjjWYYAMzKPWvNLerFcqitJaZNUiOWV2dmRfoUHtZeXM11
         Po2I+va8jKL8jpbt9Gn/7jv9zwDXb9DxnURc7NbqddtHr29m5V9SmP5QB+Z+HN2JsL71
         sQxP3n8pqj5IPwUvdK4yKTn0kREYW89c1cyrJPg5Qnz1/lv2q/KvxJ6bgJGfKwRdqHue
         1QCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        fh=xcoejqkDYCz6TsihjFXOXenzNj2gXiVqNGHSIeualDA=;
        b=a1XWBP3MrZfV9BD/2hBqB+GQKTr7u83F1CIj9To5SCf6qjdQnee8Jy1Vn9400dBdJT
         XutDbnc+jSboBeVtoFpyYAjvJxqRYPSjPVgeXWX4LsFPJF5f7vBHuT+2pArlM7GGaG9T
         BXZG9C4palntq9peZEjMju2ijX4YmAKbqQNgN3vjgpdrsACi5WulEVk64VLpjT/JMRpM
         I2iiqDfcDDexiCGqNLZmDoCqtIlOjsBWAxOwAGh9FhRmspn9gNC/ouECxHxT6LVogc8G
         MIwqu6ZN8mBKA6ZjvbJuCbBzI5u5zYvCUhH/aIvJXT+DQVkBfN1RQUaADZ8WKdbesASH
         rsCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222117; x=1794826917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=Qz0aakdOjLfz4kVdVmKCIVf3uozBAYOxMMfTdisyhalGjGpAUbIE5nIDFlTaneqlQa
         JnyRSEBugy+xfC1TYsOhfPVBxgON4rte2A69iGCEWmrd3k6dUbCpHMJr66o+9kwqPHGy
         fJzTLeOw3BRnqaEWozIgxOYxkS/naax96d3bteA4lZ3aOVUTkeKKt2zVY8+Btpl+ulhT
         UzismSBemMwcnru7vTkmp1bf+KnjcGfw/8HpaZtGjHtvShnA6UwwiR2gBG/3AtyGMUeG
         KArnIjEulOj/BboUkGMtkfY/lyXsPrRvsjRpkIFZmctJcPoQAck0ZCcMDIFzJD8Yp9Wb
         5nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222117; x=1794826917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=Hc3H/tBgqn3cdo3SaGusb/IJjlHVqYuwJ9W2qLd1d8VpQELpbW+Gi4I7ZK3NwJtQMz
         f4KcAvCbqY5EvFM9ZfR+off6xDyQn4uZ9CSNEtyBaZi4tsLVnVyMBkF91cic83C2YhmQ
         U2FHYQ3SOAfFiceUbdUXkc99TTpsDpTWNNYpIjKmqbl4uuAYVdaq2S0sQ4f+0OWxnEaI
         ZY9xFkQUYLVyalaRpoQ1gqZqO+zMx8wParINTgAVnQjlF0gTj6n+xDu5TRPm7JQBjWB5
         p+l92fudgGrCunmXrw7JAsFVDza24O89skMpoNx3f/nzkF2p+Skmnwdez1z0CLs1iGLY
         hbcg==
X-Forwarded-Encrypted: i=1; AL+hErFR7gyq40s/lLtpwtPqXszg5ii3DiqLfS54yYV1CidBVLrzo4gfqTTfLrL6FDxp0hjaubjwI6rIhVta@vger.kernel.org
X-Gm-Message-State: APuU4Z+XjG+OOSerguhbyoWCgeG0FQkqrJvRMWQVZwmnDegoBE+u0bgm
	boZScxiJTpGZWuuOAdtHA2AJKPl/irq+VSToweoWBc8N1YE9AlbN0QEVyrMw9bviE2+5CZmhpua
	QJWqYVs9SKm4MIndgTk1RyY/ztI8KC9Y=
X-Gm-Gg: AYBFou1MFsnbfyNbTebGGezwi8PtEK30uP3U1AbXvlz1VH07lLa81joSOmop55yn5US
	eDVSWG5KQjfIZoGvdAfF1ttTvn1cSFBq2nivlmUMcmlMpN5d4Qn1XsB8IzM35EgC7bOvYZ2CmNJ
	BSTKf2PdY5V8skyA/ksvm0g89s2/DCOV/LTKv6PTCQEXDZ3N1mPUL9g3SpvnBjNGi2W7iMkOwtA
	BUBjMLAcHIYeBHni7apZBpsiS50a3CymBFf08Pgmx7C6Q3bpmdJwksWAwxfXytKgx7gtcVaKNFR
	OFm26ylftvuZFqe+lj85yO/TL9VEGGK4aNL2izE4guIHrz/OgOIJvUuIgMz764sSS2YffT+aYz5
	b5bJ2C2WAIH1X/vbq4RyWu2lx3a8MSfwbMLlzSQ==
X-Received: by 2002:a05:6a00:3c8f:b0:882:d8c4:17c9 with SMTP id
 d2e1a72fcca58-8b66e343903mr3314714b3a.23.1794222116824; Mon, 09 Nov 2026
 03:01:56 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
 <80990ab6-5072-43a2-b829-177c956080c6@kernel.org> <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
In-Reply-To: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 19:01:45 +0800
X-Gm-Features: AclHuK-vLDzqpNnq7WjP_EKkxW9CPBRL2HdSB_SqKuNRWnq2UdqsNh8iwWDBhD4
Message-ID: <CAA+D8APyfdLR8cvq3GMuF9UdQ5yM6LNSwwuvt+7rYaMFPk1Y8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:40=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > On 09/11/2026 03:22, Shengjiu Wang wrote:
> > > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >>
> > >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com =
wrote:
> > >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >>>
> > >>> The HiFi4 DSP provides a separate reset control for its debug logic=
.
> > >>> Keep this reset deasserted so that an external debug agent can acce=
ss
> > >>> the DSP and perform debug operations.
> > >>>
> > >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> > >>
> > >> That's ABI break without explanation.
> > >>
> > >
> > > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This ser=
ies
> > > adds the DSP node for the first time, so there should be no existing =
upstream
> > > DT relying on this compatible without the reset properties.
> >
> > That does not change the fact that you break ABI, does it?
> >
>
> Yes, it changes the binding ABI. However, these reset controls are
> required for the
>  i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
> incomplete without
>  them. I will add this explanation to the commit message.
>

I also think it would be better to split the i.MX8ULP reset requirement
into a separate patch. Does that make sense to you?

Best regards
Shengjiu Wang
