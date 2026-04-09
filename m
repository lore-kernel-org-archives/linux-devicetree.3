Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED630F55F
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724441; cv=none; b=DHclwDJ7FiLo/4GAYXhJTu1wAS2mUkgOuoWbNNeceNQhJ96bGJEUDaNTtMGkoOLwO2MFMxcF5mtV+eo01jk0EpCg9gfTmBuKPjCP+XcS4hskmij6hfQp2KP339w4pLHQ0FBOQ65TLhIjEC6gpZc1Gxe5GgzM+HHUt3B8G3a/qB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724441; c=relaxed/simple;
	bh=FhoqXLreX/BLdwXmDMi/YVzFa/SUVXcXnQnOklrPkYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdNfkLVy8SAq5wa4iNmUo8hq+eemPNoYJ0YNX/HvIvyfV+tSxlG2kyjUbdLgPE6XrfJ6bkGkqn8IMMyF6+pkDF2kbbvuLI+MkDpsB0MYDfKJuDWK4hzXKvm4BIJZBbp/QG4W0QyteXv4CtiIyfXT4AhT4hLdM7kvwy6yzMRLgbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BARPx+Sm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BARPx+Sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FB0C2BCB2
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724441;
	bh=FhoqXLreX/BLdwXmDMi/YVzFa/SUVXcXnQnOklrPkYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BARPx+SmrdAjYotD8o8UZliyK2PlMQInpQpasCwiq1aI8uGW57GvEpjZT52D+AEJd
	 0wOaILYuVAWHmm0HGN88AEztH3nEFCxqLIEn+VKJb3GRcRwde5EtRASic0nBf9zHtI
	 GKqnKEhsZ4Kze/ZkF70Sw0Z04I6rWCTiKkIgz/JWutPiGdKpx32EX9hz7wMXTcLqrN
	 ki+q7WSfeFTeBziiXT1FQKxgFxSfCwe6lU/rZJJy+VBa7HIhmqtZZq4GcmMFcIBvpG
	 JG74s1nUIgwXwyeICrjjJ4ACuS1+RombSELmyirIVcA9eZCGeig6DY6KZ6Ax08WMvA
	 v23F7GS/EfnYQ==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64eb84d1e37so487299d50.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 01:47:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP5OoqWxH2XIKhe/awuvT4KN7sbnv+6NgmjouyENK6ahgW0anURgb5TLhRx9C+CmaRfEaJVdWiPdtG@vger.kernel.org
X-Gm-Message-State: AOJu0YwGAqgXNkVIszkgi+IDLEELAXMc92Z258J2AclnVQptAP2VMOCc
	NyNdjIxMkyVTOYPXkps7KxL6s0OEBh1oKjH0hta+E9KMgYRppYIcSAa4eyklr2YwlEqWph6QVrZ
	QOWLCRA8pUz3tfm3SCUl6cqKe1byWZ8M=
X-Received: by 2002:a05:690c:ed6:b0:79a:c7f8:d95c with SMTP id
 00721157ae682-7a4d5b4dc8emr230824317b3.40.1775724440989; Thu, 09 Apr 2026
 01:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406075114.25672-1-clamor95@gmail.com> <20260406075114.25672-3-clamor95@gmail.com>
In-Reply-To: <20260406075114.25672-3-clamor95@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:47:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLkTF+-qaKsmOtjajPdL0Xdt6_hiXaysUrh-qrvjU_Lgvw@mail.gmail.com>
X-Gm-Features: AQROBzBahChtljCTZBs0lkmpK4Rt75xAc3CX7ZbX_Bl5LHWdhOmPTzY0tf2nAuE
Message-ID: <CAD++jLkTF+-qaKsmOtjajPdL0Xdt6_hiXaysUrh-qrvjU_Lgvw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: pinctrl: pinctrl-max77620: convert to
 DT schema
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 9:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.com=
> wrote:

> Convert pinctrl-max77620 devicetree bindings for the MAX77620 PMIC from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Patch applied to the pinctrl tree for v7.1 in accordance with Rob's
instructions.

Yours,
Linus Walleij
