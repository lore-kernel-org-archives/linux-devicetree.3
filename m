Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488537;
	b=iS+Mr41/LwmjtZ9PqwQN+BWa0GivVv6u4dn4cjP+0Edpb67RB4BPS4muQxFT3H4FZpg+
	 33Asrpbn3qaAWzH5O26exPHoIgrPR1W/tHE+NCFSzDf4852hhgEF7zLRj6FWleUKNTeJW
	 Pov8TaeL5trENNaD9UtE8hRjcrAvplcNql/AEDzOyOoh9/pXBtzFrp/38c525Ly0rmjnr
	 aryd+8/ZnUTafh+zQsVZ7M1HDlvOhZ6xZvCL775SRH5W6hBDLyx9xItbAfBToqkhj5dGu
	 LxM04GnqFqZ0hoiJQ08fOYV7VEWc1ORk6+RGuAgEIxHfv+sV1e0a7LD3iocnv2OaMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488537;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=VmuMDemC3+M/eObReh66WalmerBYQJEfNi6T5xBgx4Q=;
	b=hLije5vLGmtA9r880pmR0mq7TQmhOPPqJar+AZbAbjAM7wProorsAlrMgCYURRCea5Jk
	 DRCo+9O3ujTnreKOaP0GXH2MIyMWmc83As/35l6AVoRp+Jtbx6iVIw6TQ2Lyu4b9qWPqk
	 JajWntl5RJk3c4rBLB4txXEHkXwnYYr6TlX8KQFjaYdaAWCIW8gGYP+oE/DuHv4qMRRmE
	 ffTJthxwyUtRQk/KFtBlGmqHSm+lsfHZMhg+nYfG5cblE3epP+Xxd48/b3W5Bgcr2M7jn
	 METGqTaeelm0GvDoLKRA5gj7Rp9sMGZzX6XFSzvASLqW4WSQ+FJyQU5EMwN7sgPo5Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUCGl2dF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E5606A882
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUCGl2dF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A7E1F00A14
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488536;
	bh=VmuMDemC3+M/eObReh66WalmerBYQJEfNi6T5xBgx4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fUCGl2dFWSGc1o5SOIb84Q5A55k28fIqKGJKoKr/aJ5Am0cn96bC3+8V41fSA3PK4
	 MD+A0iOk0TBqGiSXU72vUYCMb/g6DXTqwTtHqnLJbXn+QpeYNeo8RIuXp8TjtS9ixl
	 qPF8O7RzTkO0TYq7UkFERDRcZcue3ePOVdxhnVtCZjNIte3xQxTkqtNeinJXoQC3VE
	 Ycon9RwQyIf1Won7XlDw7bFfgchO7r3dgHg6P7WXzIBCTV6qMhaWmO/KESdOITf0cO
	 Li8uxCaRDOY0GNDGueQJtj5ABrAmb6t82k6otSvTfVC53p+k4WrcpRj0/NNzYYS5MC
	 pq4PMaTX67xNA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso2918622e87.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:02:16 -0800 (PST)
X-Gm-Message-State: APuU4Z8q4P7wg8it15anntt/PBtTGRdVn9QW1lGKYv/QCX4oSpGcGfSR
	i+dgTb5S29jvjDpAVh0rL+Mf9i0alnHCJla2kB26HmHvvUrQESLdj+ucK3SVlrl7yNgA9s7rZIY
	uWeK3t86vUicEUGVW8Xf71IhKdd2drzU=
X-Received: by 2002:a05:6512:1286:b0:5c1:5703:46f4 with SMTP id
 2adb3069b0e04-5c15d58a858mr1893022e87.7.1794488535300; Thu, 12 Nov 2026
 05:02:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-samsung-s6e63m0-esd-v1-1-ab5c252c9646@kernel.org>
In-Reply-To: <20261108-b4-samsung-s6e63m0-esd-v1-1-ab5c252c9646@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 14:02:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLnfM0gN=v_xWM2uZjcCUCo0rv3-QgVLTGirxdqC00N5bw@mail.gmail.com>
X-Gm-Features: AclHuK_Is6Bfqmku9qYPnPMZqVJRQwYvDrobSZILBCmQKCUAeMXnL1JCTV33yJU
Message-ID: <CAD++jLnfM0gN=v_xWM2uZjcCUCo0rv3-QgVLTGirxdqC00N5bw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: panel: samsung,s6e63m0: Describe
 ESD interrupt
To: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Bakker <xc-racer2@live.ca>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 1:41=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:

> The Samsung Golden device tree wires the panel electrostatic discharge
> (ESD) indication to GPIO82 and names the interrupt "esd". The binding
> does not describe these properties, so CHECK_DTBS=3D1 reports them as
> unexpected.
>
> Describe the optional interrupt and its existing name, and expand ESD
> in the property description.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Patch applied to drm-misc-next.

Yours,
Linus Walleij
