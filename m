Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54AD377EAC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166062; cv=none; b=u96MQHmcwEFFkprLTxFZCKJzZ/LAO0Q8TEhZ8T0mV4E6TyjiwdcIHdl+qdHmyeLXH9P7nzq2lnLjqwQLThaGjF7wo7QJ9o4Ixp3bb6XT+OZJCS6vxz3X4W8HglWjNb5r2E+nasdzfHR4gp1GDX74CLxcjm3eFUFpnOz8cZIW61o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166062; c=relaxed/simple;
	bh=OdEKgro4DUDPb8Ko08QQEH38Ak6tb9z6xDfigAPw7do=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFWShYu/aFcFVuYSObLmAOTepaCPzHvOU99y/ulT/LvbZIuna+FIz53qR/eyvDKtzR1bVCslW9e4Sa56ThuyQxepCf7h9KojjxGkRTuv5OhIdZZDL5gsCIJ1oyDgnOjpDzBEqYXzBuUsS+hXSZdIMaBsMcpxJuRRlQHc1KdHEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hV3/Jj2u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hV3/Jj2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B8561F0089A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166060;
	bh=OdEKgro4DUDPb8Ko08QQEH38Ak6tb9z6xDfigAPw7do=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=hV3/Jj2u9lM0OmOzmvK5rItANUjOls0tCbllb5f0jpXETjH2ZOOn5R+/iwupRfQhL
	 BgZZMwqGimk7lHFrM5QQmJi1julXAAOYvfYTW9u5IJD89UePVlqDyjP2kk5+BpC4uX
	 ZXNDV4/4g/VT91PdZ/ue+nI0lZvIPF41icwbOupgCcm2YwVB0TioiIs9riuubScW2P
	 PQ1/sqGRsA6lyeMZI8DUFai/SWw8CK6ySNsilqToQZ9sdqxLqPXpigwQsGxs8eHaKU
	 1mdigJ/n2n/KpISns10S3s0Gll66/SrHiIfDGVo1U4yKfMLQmidj5i1yo8W84+MPHd
	 LEd9EQLmgjRoQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3965eab14cfso58800771fa.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:21:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8PqbU9TGu9U1rzmwxjevZpT6Tl0icmdSaFfs/UTLcmnPs8StYTeJRYe1yB3nI5Bn+h+A2mtepS0rlS@vger.kernel.org
X-Gm-Message-State: AOJu0YxCV25y+nE2XvAIbMn52DHuHM1vJLsG/Xe/mz3Zj1klJKkuWlT8
	FISrsMUgQlcooPn9ARNBWUCWChr9hB/ekpHfQBv8WG3kw9Vj53GVVwdQB+OGlGgsGp+lbcEQHGt
	E+jnaq07JyX6SCwkAisiXtGPJpS254NdMeFIrpNwzHg==
X-Received: by 2002:a2e:ad0a:0:b0:396:73ed:695d with SMTP id
 38308e7fff4ca-3991a062724mr4519671fa.11.1781166059198; Thu, 11 Jun 2026
 01:20:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:20:58 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 04:20:58 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ailxrP-_9_NL8qnN@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local>
Date: Thu, 11 Jun 2026 04:20:58 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
X-Gm-Features: AVVi8Cdazg-zIlFzKBbJynoz26wIhVLSYD08zrFVf0wIQqHs_X42tMa6pqa8MG0
Message-ID: <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
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
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
>> When a USB hub port is connected to a connector in a firmware node
>> graph, the port itself has a node in the graph.
>>
>> Associate the port's firmware node with the USB port's device,
>> usb_port::dev. This is used in later changes for the M.2 slot power
>> sequencing provider to match against the requesting port.
>
> Okay, would this affect ACPI-based systems? if so, how?
> Can you elaborate on that, please?
>

Is it possible that there's an ACPI device node associated with the port like
on some DT systems? I don't think so and there should be no impact IMO but I
also don't know enough about ACPI.

Bart
