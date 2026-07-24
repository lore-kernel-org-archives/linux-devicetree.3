Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16B0315D3E
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891395; cv=none; b=d0YVPvtT+sVFXcpfccowoxf3dRHrRS+5mdYB+TovYinXnPnushc/5P3zm8jAtHdDjq1Buhl05b+yLMJOn739xgX7YnBK40SdKW2CnTKHcXwnpJnPmwvG9EuwL5TeQ6BIxqErJanpCwUyz5lWJlQEIuzqWeePHn5qIOjP49ibIhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891395; c=relaxed/simple;
	bh=GQ+KH6/Owg7d0XhCktRva+QCZoo/0HA00/3GV4nmC8s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5m/yJf0AKyn0zzfYj+9NLEiGiLm9F/uQ3WM/X74oaoZqof8mNI8wXcwmvgFqb50EXsuM91kVQ36UMRkhZPXlOwy+GedeMeXlJ8MrsOxOjSESdjnyhPFMsZI6bBEqUu08I3/ImfZIIYpMD8unzbbZ54+sIu1g35jK8vTZaYHk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJJUlWLO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJJUlWLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE9F1F04280
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784891393;
	bh=GQ+KH6/Owg7d0XhCktRva+QCZoo/0HA00/3GV4nmC8s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UJJUlWLOVXOeCmcSW84m67zYdnKUKmMGfrnvqHp6qCvbxBiU2+49GTxixI96xOQA/
	 7N7iXlEMvS1O21GL50BBPAUXELLhcHdlMPE/VW6acs9kKTZnru4L1PxgfXPPsm39cR
	 QGjXvaNelrxzx7zOfioXWqNoowXej7DrJuCCc04inumEFN41WrcJMVoecS6rH2BNdK
	 MExrX/jRqM3/3tThzO+OjhfVBEXq2DZDjrfCl/Z2slG6/mpyuVTV54kaAI7/lqjupN
	 zh15uOXFKEHriV0V27rcfzSI2LuAekkPlHpEBVjunfc0j6oAlly44wywe+pS1FDDLA
	 PxT35lP7eLoDA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c83acb86eso2445321fa.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 04:09:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RocEYHIXqqnM5oK/EmCvhaG8YlGktKziwpNjn1b+9r6SElwbvlUsddb4wt+MAMrlkC/jvtUZJDjRXXz@vger.kernel.org
X-Gm-Message-State: AOJu0YwW0JlJSnWV4bESaSsIGcELh33Jzx932o1TF+bdZN55UWh6fbAb
	OhWVgZlEKiB69ttnrIyLYgZaPxpJjnHrlj0+8RDcjb0erfrLZBsCnqUMJ6MGmLiKXQTaqh0A/OK
	MgmypVvhxWVcmGxO3dYsNJSvazIaztXpBWJKRDC4Mvg==
X-Received: by 2002:a05:6512:128a:b0:5b0:e14:777c with SMTP id
 2adb3069b0e04-5b2b2f667a1mr1625122e87.22.1784891391963; Fri, 24 Jul 2026
 04:09:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 04:09:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 04:09:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724084328.3943997-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org> <20260724084328.3943997-4-wenst@chromium.org>
Date: Fri, 24 Jul 2026 04:09:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfV7SeG-jJ8YdS=aRabCUvP0PV5=8QL=AdCCsnzyKq1QA@mail.gmail.com>
X-Gm-Features: AUfX_mwiB4kLYEiWsY_exPz74ryChUmU7NeF3R9wpx0QdX4G4TNw4501T3DhVLY
Message-ID: <CAMRc=MfV7SeG-jJ8YdS=aRabCUvP0PV5=8QL=AdCCsnzyKq1QA@mail.gmail.com>
Subject: Re: [PATCH v7 03/16] power: sequencing: Add pwrseq_get_state()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 10:43:12 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_get_state()
> so that they don't have to reimplement it locally.
>
> Instead of just on/off and error codes, the function can also return
> "unknown" state. This is in anticipation for "uncontrollable" power
> sequencers (such as GPIOs left unconnected).
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

I'd have dropped my Ack with a change that significant but it looks good now
so:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
