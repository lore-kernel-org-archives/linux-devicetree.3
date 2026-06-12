Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53738366DC1
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255869; cv=pass; b=HPjbGv6WgWhWuOOiunJanL4IZNvMXwrvKk+bMGbu//HlK2QMcaUM22I3ZqYbQ5M4yPzU5VgBFq3kVo67O1MjLq6dCfMyMQX8oQp4UugbRAFGlXfttBHMjA60Dm2VuTrPmT3Y+6xfsUVDjvih88+DbNehxJ5OwjXnzRIK6rKCGTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255869; c=relaxed/simple;
	bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0OXPM4lVlpcq/COA20diY5L6gK2ACqqY4W1L+55NnVVPpX5NOprhYbv0/m/njAB9X7tHzmWHYscIVGU+YIWXspxyASXnpEjcqGBuvKasJt3e0x59CMT6FcdfEjlDW6NIt9MPfTCDx/rew3X+l8lkM3X9OtBboZEAtgtRtkmw5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cp45EbXQ; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cp45EbXQ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7f4f1c27e61so4962297b3.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255867; cv=none;
        d=google.com; s=arc-20240605;
        b=bFVmLgjTqZSO3xrRuwRJIFCQEu6sECyzLhrzwExDGh+2lGnzoaMepHXrqOTSKkGbV6
         lEbSlC9QITXAEmeePSw6RamAgiOiyru5HQ1RR+dpJfwpntEa1V4kMa/9lPA0dUgcM9on
         wKLOF+8WfqhnHOKO94DylL2K+5osZdZ3y1HXBJJGzhu7uqjoBflB6p1BE6odev1J5vhk
         SKqF3tJbiqB6Sb0+tICHJCrpZGH5GiJ9VIrrqKywg3YOeS6GOhXd6VAtXKM8w9np3Uh5
         PDPACkoqBWf9P0EPRynbyOQMW6Hk90irvpfh9y9kNwvZZgQ8oXs0CInyWPo9xEzuKYtr
         824g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        fh=5rdw9V9uFBEGGd+8qpVoWx/BRodQKo3offLnIz7hhQM=;
        b=QfH1ptD+39Fwh1wC0AeIkRy4NT6hOZQejRIToI9deOFcsA80FMySWKY2r3b5UNR1h1
         VFxL5ROf0eon8Bd5fpPk6JX78OhS8THpZ3QHjRcpvR2A/R93rHspZSZd3ymKpjMUscaI
         SEyG8Lic1IAkCjcPwHVZ6LsIYu2os2PR6XPn+FHuo2GH29KMw6UPXNHnDpZ+DMuhnqj9
         afjhgl0Wkh49SxAVDfU5eMw/zxNqyTFvOYvUDnrUsZIeKp0exgwitti8lEJ6yAxQW1M4
         AwLX/kc7hMdPww4W9Zox/L2I94P4VblVE8oSd3qYv+XAtbrZ/qWx66A5FOzsIYqirquo
         q+ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255867; x=1781860667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=Cp45EbXQPotQHJV6pD9Z1tRcMMw/E1UVxgnMhXoZBjFie5UhROaMkWEwt2QF5D70y8
         YOD/NxeL/50JCSOtVLg3QZOu3/P+oUy7rMUa01zQtjLxNz547rc1kAL0UpiWXQfOIV15
         NmZbH96i2TJi0/uf3Vwh2QluHzpV4IczZXOAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255867; x=1781860667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=g5jwGJDDvgbGELc7sPia7fQNnmAGS2NORaDXy9J0u4Bb9e7E159uH3zBrvAP0JKKeK
         cDh/ymYKXbcWGym9BKlz4lZ83zVCk11YypEo0vP/NyAMzdfouxoOwe1ovjWqJolGzPlz
         rDCwlEZGHXzItOLz7bBf/9lYoMmyUM1zlmM6jWidlR7mFFGZ71sPCF6py4Vu5SKRI6/T
         YHolA1q7J01SbBHXkG/V7bujjr7U/Mqv5+mD4GWLoV1jo68+nsmVVZiuc1lmnzamDVBG
         NZVEy8gXs+C9QcRpUNF9Xx3pCAt3M8OzY3M5UBz8OR8gS4KfGE9Q9N69MIGtCWz8sCYX
         sUbw==
X-Forwarded-Encrypted: i=1; AFNElJ8Zu+YRO+7UUODfrmn/cKe0glz7PTofS6ByQuNfxuTZU6QE49DLAntJuh0IHnMyY1w7VtaazvT3Ii8i@vger.kernel.org
X-Gm-Message-State: AOJu0YzvJgFZc+AMrEKwQu+WsvoABh+5HiadVk1ttjqacjTGLC3+P8C+
	yEXh473G9mE9Jgdo8TEUKITLjEHJegnU7YdkbZLUB6oXKJRBpMgesV486pe9nTL5dbnNKsg16LN
	TlTy7ObWMVDisuYm7RFu+IfgW3ernqdf8ujwrdHtF
X-Gm-Gg: Acq92OHChLdD04OkAdRUDUCuoZ7qip7R6tgGIaXcnjuf57sWAkA4P7dpr7qIC5oVxm9
	R/fIsPhNkP63PTkKTGCl+PUqXNm5LIhcc+rs/9PrzkoT8vv18dWs6wlqg902yRKJSU+FeGFd0UC
	Gfue0VSx4N1S50p08vQ/8B0DLlCRjhREGbQQpi8x3IA3SqdooH7a3uzrxbefWN4uS+2jEEZ13vG
	yfw3SmbMgvQlmFJrjjNUU0w7dEKU/xR1n5BFQvjS4N8BkTCjG4VzZ8CDNkM0T4gcRivbjyA9ROB
	AdEtxJoO
X-Received: by 2002:a05:690c:3a0:b0:7cf:af41:50b0 with SMTP id
 00721157ae682-7f7b8d248damr20618557b3.36.1781255867482; Fri, 12 Jun 2026
 02:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-12-wenst@chromium.org>
 <ail2VcubjT7HNGUC@ashevche-desk.local>
In-Reply-To: <ail2VcubjT7HNGUC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:17:35 +0900
X-Gm-Features: AVVi8CeDuG6qw5zFxFcHgtnnMaKWsSajO4ZT4D-k-SPwtRIr1WJR_hE6bMB1VZI
Message-ID: <CAGXv+5GNfWFinO1E=5X46xnBsQpY-_i45mq60eeQu=U3Z0MtDA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:45PM +0800, Chen-Yu Tsai wrote:
> > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> > UART for BT. Currently the driver only supports PCIe and UART.
> >
> > Add power sequencing targets for SDIO and USB. To avoid adding a
> > complicated dependency tree, rename the existing power sequencing units
> > "pcie" and "uart" to "wifi" and "bt". The existing target names are lef=
t
> > untouched. The new "sdio" and "usb" targets just point to the renamed
> > "wifi" and "bt" units.
>
> Why can we do that? No breakage? Only internal names? No ABI affected?
> Please, clarify all this in the commit message.

Will do.

In short, the target names (which are not modified) are used by the
consumer, while the unit names are internal only.


ChenYu
