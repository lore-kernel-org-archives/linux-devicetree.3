Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CE438C2D1;
	Fri, 12 Jun 2026 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280321; cv=none; b=W7WkvtD87KtJ9wobh/x53khAKMaCxg0HoRxJOzR1D+rIXWvLeKdGT5AY9/V+4YUCAWBuKlMCAwPZC2ZkKtJ30ykZjhtNjzyvK//xhHD9IBULijjJuxryHMTwVqHKi01TLjQSujgHGl/sGiXZn67eF2HDXpsE99MnX5WPMkk/2EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280321; c=relaxed/simple;
	bh=a1YIu3OtEUXW0CrC+PYF/h5Grn4bylUZo87O796R0DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyxUxI9b/e2F8TmVnrDLILI+NqZlK3nI1GhyB2AEIzLzAvg7R195P/T+oGOCMbqSOhh6GcrrPGmzuPvWXxkrSJJV+ZA+UOKA3d9bJRh9MWcAVle9m5dkcv6AGLL6xB0/BuK1zzW9wkYbcaztRhsSoFnw1wR9gpJv2t/TiZ33teg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l777kD8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l777kD8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24351F00A3D;
	Fri, 12 Jun 2026 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781280319;
	bh=xD8fHD0dBqI+BHWfEGmw4yez/dwz1dD2SEmToWisjAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l777kD8VtCnF+vbkmTpbqVw2e3E1/M679W4VlXzwQeqa4kTJ/wLIFUC3feaj0o1VL
	 WjsGN+zFA1bff5XeGcbbYx+h52tYZIErrevvGi/wzafNwNuW6kXJsX2aYx6pJ6/e1x
	 Hm6bIYi8h8W5XlEnGnVODxXeNVRj43cJrK/WpatG0Tkx7mbrRCprxQSxz0ES2MjriZ
	 qKidJqMVeeFO/d9+jQZOQ7GyX/tVYsJHAD6d7AYaPEvAZ4aDEjTqBw1PFeEuNBGFek
	 TNg+rgshXRBpHq0p9RaaaZcsIUhd91sqEzXsJ1UWwP9H9Fwwn6GU/VSSnmMnSdkOIs
	 ZIyfyJpST+yZw==
Date: Fri, 12 Jun 2026 11:05:19 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	rob.clark@oss.qualcomm.com,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x Gen11
Message-ID: <20260612160519.GA1118842-robh@kernel.org>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-2-57c70c23d0d6@oss.qualcomm.com>
 <7a330941-8715-4523-9f39-10b57586c69d@kernel.org>
 <CACSVV03J7Y4-ADRNE+4qArqsWvQZ3qmTc04r7vmY64s0qDYFkw@mail.gmail.com>
 <799fea04-e7d0-4184-b9ae-4cebfdac38d5@kernel.org>
 <841a54ff-6287-48d2-a513-a7442d624ab6@oss.qualcomm.com>
 <uieb6ukjokwnppc5zfr6bjychqsnpikwmiy7j7dmt2kgk7k4zi@2stv37ijv36o>
 <ac191a18-bcb4-4fa5-a179-b72a6ac928cb@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac191a18-bcb4-4fa5-a179-b72a6ac928cb@kernel.org>

On Thu, Jun 11, 2026 at 03:48:15PM +0200, Krzysztof Kozlowski wrote:
> On 10/06/2026 15:31, Abel Vesa wrote:
> >>>>>> @@ -68,6 +68,7 @@ properties:
> >>>>>>
> >>>>>>        - items:
> >>>>>>            - enum:
> >>>>>> +              - lenovo,yoga-slim7x-gen11
> >>>>>
> >>>>> I imagine you might want different panel variants, just like T14s has
> >>>>> LCD and OLED?
> >>>>
> >>>> I expect this will be the case.
> >>>
> >>> Then better to prepare for this now, otherwise later you need to change
> >>> bindings. If unsure what other variants are, then at least make this
> >>> compatible panel-specific, e.g. lenovo,yoga-slim7x-gen11-oled-foo-bar.
> >>
> >> I took another look at psref [1] and there's only OLED SKUs (today?).
> >> There are however, two different resolutions available and both can be
> >> touch/notouch.
> > 
> > If the other SKU doesn't have touch, then you might as well mark now this
> > one with touch suffix or something like that.
> 
> 
> If you decide not to have any changes (new compatibles), then at least
> please document the above reasoning in commit msg.

If the difference is just the panel or touch, then isn't that captured 
by the panel and/or touch nodes?

OTOH, if it's different firmware builds and generally treated as 2 
different devices, then different top-level compatible is probably fine.

Rob
