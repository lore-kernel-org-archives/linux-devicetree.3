Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750B305692
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091496; cv=none; b=uG3Y3v8P0LFXRCDV1SNmi7c47IU1FDdD7XzO2gnn43Vh1AtX8gN6zX3QR4cdoly26VA8SGSekCSTA8/AERtfq/aTjhEJJJEJDrdjWJH7/U0iz8MFpi+wHRG4rtxeFpZKfeOSMNcU0iJiKL74SW/7LMMhoHWq87y5SXNlvrlwD0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091496; c=relaxed/simple;
	bh=IgWeAA0q81uEMtscWHxL7SWJO/Ks4JEhZ0vz8uGK9wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYto7fYZLNFdORMqLpslTWwYNZjACXBDvjqUE6YU72r2o5GSGFYgw3P7uGpvKszxUVfbk6SVV4YMhtrndOgGGo0+ulR9BUvPi0wkMB6AM/nMKHBxn4HeOqQoYIbWRBj42k1BlyyAHxW3+Wuxb5FkjfEykjXrUEQGYkUBBXqn6NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elft96o4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elft96o4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9771F00A3E
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786091480;
	bh=IgWeAA0q81uEMtscWHxL7SWJO/Ks4JEhZ0vz8uGK9wE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=elft96o4yMBNuH6EQW/0e26ANRdMZECDIJIDE9Kcu3p59H8qejFoKHi7gfuajHM3y
	 xhwAsbJVDwio7qWGj0vCjN/3bKEjIBgQJTCn61N+F/A0XcJEk7rnNFcuvKlrLIq+LG
	 tFBTzslRXF21JESdHkMn1VnVGlLT8oK0jb86aBWq2fWjNcdmDRjPj0qJKpx9s4yvXF
	 87paoM+VDA8ICRB5sNmNOGOdsxVa3ZZf9Ad6u3fqJ0YYGZjklodWrxgtXD27lUg4Mn
	 ZrACNYgOafY9E9wZs9aP9kwhRxbCntWAHkVe75+n+qzPNGSPsZDT9C3G4gtxfG0okd
	 IMP6yJ5qB+TCw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso3836320e87.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:31:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RplO92yBDtNFQE2QgxMTNcB+2q2fhz0rtpZ7eUFDqDtgJQTrJsuLc6WDUpCv+m1qdH+T3wQU7dFt3tn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsv3+lYoG0qfMMygE8eQrpSw37hs2rNAOu4TXILof4S6rrbl8b
	e2zVG9nVjMDjW743iwQ7TOhJYUmQQQQ3FdgLCY8yos7j0mfL/gv2Ywgv2Nn+NHRl8MbjBqrUC7F
	JuhjEQl4KSJ7flovneTu0arkVNsALqdQ=
X-Received: by 2002:a05:6512:1156:b0:5b0:eda:de2d with SMTP id
 2adb3069b0e04-5b2f4c9ba12mr3805874e87.19.1786091478882; Fri, 07 Aug 2026
 01:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-ti-iodelay-v2-1-995f55f605bf@gmail.com>
In-Reply-To: <20260722-ti-iodelay-v2-1-995f55f605bf@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 10:31:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmUtZxMyYn252FydiauZo=z3FwLyfFN=hGrG6ZyUtDhxA@mail.gmail.com>
X-Gm-Features: AUfX_mwbOoXWHLBy9X1_71vxqsW2a-FpUarVS2yR_8BHzr0tmLL4s763qUnh5R0
Message-ID: <CAD++jLmUtZxMyYn252FydiauZo=z3FwLyfFN=hGrG6ZyUtDhxA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
	simona.toaca@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 6:46=E2=80=AFPM Bhargav Joshi <j.bhargav.u@gmail.co=
m> wrote:

> Convert TI IODELAY controller from text to DT schema. Document child
> properties missing from text bindings for proper validation.
>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Patch applied!

Yours,
Linus Walleij
