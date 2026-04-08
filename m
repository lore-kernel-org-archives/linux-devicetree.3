Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBE635CB91;
	Wed,  8 Apr 2026 07:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633713; cv=none; b=nvFvYGDcESRfMhqdckSyFD6ek3x8/agDhXLoZAcNidMW0t/i5Ar40Ay2yjSaBwJhH5SQaz474ZHICHrhTAOliL6wWevzCZF+/bc94duOivyaC73aX4yOMv8cfH5t+4MDL8KznTVFY9tcLChtn6g0SfvqSG53snnbjCgLOLS6PtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633713; c=relaxed/simple;
	bh=3VeXiOPcQCa12/3YJO10P1V8flCxpUZkjSClJDzN5Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNzgUK7XoJ2tjbW/r1aSnmuqrc1dDz/OC2QCxWgNEqtcGEqKoq6+ZLxyyxzQJasrrNCUEQ+7VZD1uoYUOKxz+/age21Jtdo89I3ukUEU6Uq//lWhb6t1oeqf1a4Oqw0VELe4IQAUVikjA3L2fsVefAQdmZIbezCv0DGQbvgJ7VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTPwnFyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTPwnFyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772F4C19424;
	Wed,  8 Apr 2026 07:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775633713;
	bh=3VeXiOPcQCa12/3YJO10P1V8flCxpUZkjSClJDzN5Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTPwnFywnANam8tf3fRKKBKsG8n12JEOj0QasLxoun9gdGyN/r3PzHNvmtwYzknki
	 nq+RRBdNkYSO8t3kNapFBFQq3SKjtGkDnSGNgKaGoZUDBCpYN6WFJMQpftmk12w68D
	 Rz4qhpoEnlevD2hYsw140abjbvdZ0cGr8krH4V6hatnVx78nEy4bFqN9QkkW2kNwmX
	 kmzNailJRDKx8iSc7hlr3epIAj9x9m9SDAg2Bj+2IqrqLjxW3aQt+xVHAN5r6CyJ4D
	 LfvvkN3t0b8x7qMfJb9uSmM9stUCR742E6AjaqGP6jfCAyMkrtKH94j4D2uCXyGMGB
	 CW4qqO2TPxryw==
Date: Wed, 8 Apr 2026 09:35:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: bridge: lt9211: Require
 data-lanes on DSI input ports
Message-ID: <20260408-eager-millipede-of-aurora-6fcaa4@quoll>
References: <20260407203109.34302-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407203109.34302-1-marex@nabladev.com>

On Tue, Apr 07, 2026 at 10:31:03PM +0200, Marek Vasut wrote:
> The Lontium LT9211 is capable of 1..4 DSI lanes per input DSI port,
> describe the lane count for each input port in the schema.
> 
> For example Linux kernel driver does already use that information and
> fails to probe if it is missing.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

