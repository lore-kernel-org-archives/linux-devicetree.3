Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83C233D503;
	Tue,  7 Apr 2026 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580006; cv=none; b=YXTbIlXPJVSiUWwUBqzBEgPl31hvpNIhqpvvoCjIH+4jJ9bNQuG5YhXYdkzAp6So0JBzfMMB9jNNUnPICLj3ynBsRNitouU/NK4ba/fB48XDZwMX/3kNJ/KBpAQY3di2KbmPsZ7JSef+RLl3NlVOvOadthl/4jc6T5QfSIf6Fg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580006; c=relaxed/simple;
	bh=MMjTxiRt182mA+d7a01NisWAIFu2aQYhIc1cD9yuTHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoRE7RdumsheFlp0rglpSP1x2Np8/Z9yQZ06VC64iq1Js6Gn0APnrlMcR/6SkX+0SdCsObjaKV2+SNwm95Iar1eVANjW0ZJMoSzdafbX6moDdYkP22hlOhlqudcKiiN8rQ2JhpLljaq2t2YxnXxlv88NmFaeZk9c5DOeO2nlzzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrxM0ol8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrxM0ol8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47868C19424;
	Tue,  7 Apr 2026 16:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580006;
	bh=MMjTxiRt182mA+d7a01NisWAIFu2aQYhIc1cD9yuTHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrxM0ol8CZsj8NJDI8i3IHumeMUPnvV5/d+aKFk8P2d+irl/3aG2tFOknzGbXlL5B
	 TRW3hLQvNVuopxMRi7djN4HYqDOG6Ci9dGFdIrzdzQLDeaZ9YVPquIRDIVrE2382Ik
	 sA6KhKkiLfxrKkj0xm0zbjzFBK/jFVoddIjC39gY+reZvYHopkYrNRxbf8yho2HtIy
	 2/OWpoe144YCHotDsm/s/M58lmNI6ToQlkAtU3Z41n18FhtgSbUjHcOa6+h1sz33K1
	 CRgxgQfAMrm+84RJzJ7LH/7KYMiYT3Ktc5hLSZrKhy7rB1ZOz4CTGfGeMiVuAVy2Q9
	 hMR4nFG5Dbaiw==
Date: Tue, 7 Apr 2026 11:40:04 -0500
From: Rob Herring <robh@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver
Message-ID: <20260407164004.GA2715665-robh@kernel.org>
References: <20260323-ch13726a-v3-0-e28b6f97fe80@gmail.com>
 <20260323-ch13726a-v3-1-e28b6f97fe80@gmail.com>
 <20260324-dexterous-snake-of-progress-ea8783@quoll>
 <CALHNRZ-TAQmcwYr9iW+j+S5Egh11C0LpPeY1SO=hgDdvG8otqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ-TAQmcwYr9iW+j+S5Egh11C0LpPeY1SO=hgDdvG8otqQ@mail.gmail.com>

On Tue, Mar 24, 2026 at 11:01:33AM -0500, Aaron Kling wrote:
> On Tue, Mar 24, 2026 at 4:08 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Mon, Mar 23, 2026 at 12:08:32PM -0500, Aaron Kling wrote:
> > > The Chip Wealth Technology CH13726A AMOLED driver is a single chip
> > > solution for MIPI-DSI. This is used for the AYN Thor bottom panel.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  .../display/panel/chipwealth,ch13726a.yaml         | 65 ++++++++++++++++++++++
> > >  1 file changed, 65 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..5d964900795653401a871994bcf6403cdeaad64f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml
> > > @@ -0,0 +1,65 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/chipwealth,ch13726a.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Chip Wealth Technology CH13726A AMOLED driver
> > > +
> > > +maintainers:
> > > +  - Neil Armstrong <neil.armstrong@linaro.org>
> > > +
> > > +description:
> > > +  Chip Wealth Technology CH13726A is a single-chip solution
> > > +  for AMOLED connected using a MIPI-DSI video interface.
> >
> > Here you describe the hardware, including what I asked last time -
> > explain why this is ayntec thor panel, but not chipwealth,ch13726a.
> >
> > Then also name the file as the compatible. If you do not know the part
> > (model?) number, then why do you think filename should be called
> > ch13726a?
> 
> The vendor source release for the AYN Thor calls the 'panel' ch13726a,
> but per the data sheet for said part, it's a chip used in various
> panels, not a panel itself. The handling for various panels using this
> chip will share a lot of similarities since the chip is what the
> kernel driver will talk to. The alternative would be having separate
> drivers and bindings for every panel that will be mostly duplicated.
> This is the case for multiple things supported in the kernel already,
> such as the vtdr6130 which is currently described as a unique panel
> but is in fact the part number for a ddic. And I will need to refactor
> that for another device I have in the pipeline. In fact, all the
> device panels I need to submit in this context reference ddic's and
> not unique panel models. I'm waiting to see what gets approved for
> this series before sending the rest of those in.
> 
> If I add something to the description like 'This chip is not a panel
> itself, but is used to control various panels', would that be
> sufficient? Or does the kernel need a new way to describe ddic's
> separately from panels, since this seems to be common now?

So sounds like the compatible should be '"ayntec,thor-panel-bottom", 
"chipwealth,ch13726a"' with the filename being chipwealth,ch13726a.yaml. 
At least that is how we do most cases where we know the underlying chip.

Rob
