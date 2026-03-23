Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A293AB277
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272946; cv=none; b=EQOelKjvtFgXSkpfiTu7Rv9zRExga3ioEr69HNJwav0hwe/7YAjntaeWrWKG7QBhZQbwtA5cO9aObko+cY8orOvjjocNmfItrzvupHgpRQly9/udXYUhAvOU0YdWSwH8xeufpVo/eJ8J14JvoC33pnxI0vwUTLo7XEPE3Jltc+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272946; c=relaxed/simple;
	bh=jtB7kP8zR4IxGcS+9890mR6ITqxzSg9FjsqZu9mJ5E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRbh1ahJVpKISKYaM2wZjLkMe/DnWvzS1XpPB774xznpdxfQbJ5lVhMpolg9CqXcTZl70X1VVvZVaNlIL3/nlDErwI4/rDnUNwScYDwus7tB0kbdmBPglq/DPF+Y8SqMtYQRo22aGeCXPN5BmzJut2C8fGMSBapwVjAaNe/J9Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkTXeqSf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkTXeqSf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580F7C2BCB5
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272946;
	bh=jtB7kP8zR4IxGcS+9890mR6ITqxzSg9FjsqZu9mJ5E0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TkTXeqSfYX/QgliFlyaqO3wSJpfh/5OR+PZAjCC+hAJ/etEm1UmEhahqZFO2HDPg3
	 kPnBwASFf7pWakOyoMS1vYXHTcnM5DVC/e1DNG0oM2tYvZguDmvI27uNOqfJ/uAokM
	 Mr9s8ZVFugl3ehByhXPZ2SGKbRw+uHYHdf9l80o2J/fssKYv4Zy1eb5JDbBYyG8pgc
	 A0NZ8P7eCeKfi1F1C18xJmY0Zhz+ILIJwRp3NxX2YvMBKrHRPTyyNMpvKFVdh+g3gf
	 1l05QBIpUI8PECDJYqgNMouXZ6zTBvvbbtJmj4eWKwpHjBLhxeteZxa5rRHrrulFwb
	 wNAsQDbpy3XWw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-668e8df29b5so188010a12.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:35:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVni3XcPpkjDY+tfayIlhqU7W235M99gOMrTJysqrMn0d7ZC52q6MNLMloiO/uiKbE16DWGbRLI+0hI@vger.kernel.org
X-Gm-Message-State: AOJu0YyTbBTDLArKd6bTc5eV0Fh/zoL9vz86819HaUSKzRF8sNHqpdnl
	TQTtcQhqe5zfGxyQJE/Fpk2gFd4SioV4nvbe3GxiMPIlAS70wmguQlFSZmJEDWiAaJyvRN6ArmJ
	/N7Cp7N+U6srC3D41dexKHzMok8QLOQ==
X-Received: by 2002:a17:907:180a:b0:b98:c0a:cb9e with SMTP id
 a640c23a62f3a-b982f0c816dmr818642066b.8.1774272944793; Mon, 23 Mar 2026
 06:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322-mailbox-v1-1-c6251f18187c@gmail.com>
In-Reply-To: <20260322-mailbox-v1-1-c6251f18187c@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Mar 2026 08:35:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1gjj8XkPRA@mail.gmail.com>
X-Gm-Features: AQROBzAGYjLLGwPA6RtslPtMCL0nL_WTrxkn2uspysuzLPfGbFkB0VgpU2EMZWw
Message-ID: <CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1gjj8XkPRA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: dt-bindings: mailbox: Convert to DT-SCHEMA
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 4:20=E2=80=AFPM Atharv Dubey <atharvd440@gmail.com>=
 wrote:
>
> Convert the Generic Mailbox Controller and Client
> binding from text format to DT schema format.
>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>  .../devicetree/bindings/mailbox/mailbox.txt        | 60 ----------------=
-
>  .../devicetree/bindings/mailbox/mailbox.yaml       | 78 ++++++++++++++++=
++++++
>  2 files changed, 78 insertions(+), 60 deletions(-)

This already exists within dtschema with other core schemas. Probably
some of the description is missing, but moving those requires
re-licensing permission from the original authors.

Rob
