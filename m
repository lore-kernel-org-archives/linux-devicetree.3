Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9263BA23A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168230; cv=none; b=ogmBxKFp3/sHljA8aHMojvZv58NvNx5DbiLNocQ6YzNk0nmXLKCMKrR6IPUxxD1Ef2StGEbhdccBktXtPUHBitmDqzl3k9w9BsVSnJru1ngLomzG/VWvLwGM2OMD4mwUgrS3ktsUdyPadyIgBdC+ZSuE9+igFQqWAmIASGaIgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168230; c=relaxed/simple;
	bh=DZUL55pfekAnXESqd14ABzPRjbkHUYXBXBngBC6u3ko=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/ACGoJQudh3YMy1Kt4+JSPmycvtgoxptdST4CLXMhT42Pz1dZGXkbsq/KO0GGieHyofMIsUdH0IvIIjgDqX9r+ZBIiLEGIR0G1qP0Yfs8Jppfs93pOzXTqWJt+sz//MP5gTFSLiibyA4x8LTRHY8ZUepnHjfzXVnd3Os3+dV9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cx8nueHu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cx8nueHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9D71F00A02
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781168228;
	bh=DZUL55pfekAnXESqd14ABzPRjbkHUYXBXBngBC6u3ko=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cx8nueHu4fYirKSLCXETsXEVv1xXfDm500rY3WLLSdyDbQhSYqJmUOojpbivEE/CT
	 vBWo6FlB+FwcBjVJ2fxzU/tv07PbSafuRUsgc3+XHWz0XOs/OyAIts4l0VVVwXoBBx
	 1nlR+LTv2okHUf/NrrroYh3AP6YF05JtVR4/JO/ZBE/M0DYnVaP00cDcRhTm8Xz5Ur
	 MeNQzpGLEOxsniUIR5sxT3BT9GuN6+WFJLRE1fG6cLump1Q3nhpsCvUttR8PjSnUGK
	 4nJzgjsOX8+nFt+hqulZmzXGi+eFB7TN5QShe60fODh3CZN25IeWzOOFy5xJHSnlh/
	 spujFhoK32ejQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3967726bc47so70656641fa.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:57:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QnZOBXszX3PR9sRmRwsB2SmJm8fUYe4NaymAREklCwr1009KmDmMXi0DxoHdlZyH3XgIquNnbZOHu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa67T+zL5z++FxnpcJxp9KAluQlALcVHUKWtx6zUnN2uXEl0r5
	JzOQoA3GcVvFElW1vkWbwAvUe7PG6C7AQvmcdQfJEk7n8RzUQxU1hFyQE2Wb+O3RLdF59Ea3QGk
	JY+52WF2RqAbHJCAIWrvevM8wMiAw2BqP21S4W4s0lg==
X-Received: by 2002:a2e:bd88:0:b0:396:954c:3536 with SMTP id
 38308e7fff4ca-3991a1d57b1mr5490001fa.28.1781168226843; Thu, 11 Jun 2026
 01:57:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:57:04 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:57:04 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610084053.2059858-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-9-wenst@chromium.org>
Date: Thu, 11 Jun 2026 04:57:04 -0400
X-Gmail-Original-Message-ID: <CAMRc=McEd7HbUsyuqM3tr6Uu6Z2hSmL_hMNXgCOT-yHTM2FAqg@mail.gmail.com>
X-Gm-Features: AVVi8CfiEyvWm7heKsTNAZ-cli_fcxMC9z08AYGILVkLB8mgt-RjTQC7sfys9CA
Message-ID: <CAMRc=McEd7HbUsyuqM3tr6Uu6Z2hSmL_hMNXgCOT-yHTM2FAqg@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add
 port for SuperSpeed EP"
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 10:40:42 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
>
> mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
> (SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
> The SSUSB controller handles the device or gadget mode. Saying that
> SSUSB handles the HS portion is wrong.
>
> Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Maybe put it in the front of the series?

Bart
