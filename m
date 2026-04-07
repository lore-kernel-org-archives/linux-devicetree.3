Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCBD382389;
	Tue,  7 Apr 2026 08:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548856; cv=none; b=BxrEsyeDEGGUZeIJ/OY67Z6mWkV67JETVymHUIUYUqRmw9gAIC44DFMSRMGOWwk0wknzIRuef94Mh6DFF3FdU/CcmZp61ZqogUmlKlANGLdOT+JukrtGedsUpLK3jaWYuipfgHXemtlxdlNsji6VQDP/tnqdBg9bqRFJLrgiQ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548856; c=relaxed/simple;
	bh=iEz+dUNo81C1L3aGhMEQgTNaHtApnj+jMIi+id30px8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFsO4t2lkYSDFLmt7EIM299Js/QK6vL+HUt3g7l0KTftLcI2/zH5E2Y+kyK7GHC92anm1N15Q36Fvs1STsjFsSSL0dUZsFOs4Cz6YxQUINSHG0CpLLmBIayOnCzJtEfYv33C4RgYAREdUZkpN2JMRKa8iKDICrMJ+/3YkmeCL9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbhF+zst; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbhF+zst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EF9C116C6;
	Tue,  7 Apr 2026 08:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775548856;
	bh=iEz+dUNo81C1L3aGhMEQgTNaHtApnj+jMIi+id30px8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbhF+zst1UklscRUfT6vNhEhZoiCXnQPX1xy3tFgAqTSDi/d+k6Y4JhKnA7EHJbwv
	 bysXJr9SRzrC6vJ4OveSEsy0+G2OClLaSlCTdvlfqDZtq1vyF2DEWJWpYlEt8UxBPE
	 WmuyC/ZFUScMRJ6SfsJQWNOkSwLSUqDScMhWr7A9RspcF+nFaQ2q5vAj8WEcQJAXa7
	 Pp2N1EXniD5lQU5Td6xjjO1VAdgi5w7ycWzEo58rZ6koXaP8dC1QG528/Og2LjPMQ3
	 78tcWAbBZYtsxJ1DNSleAniMY5yEDOJX5KNlVoD3RdWMJk5lex+AH47YwBtDZbmNAw
	 +5Kb6Lx0WgeIg==
Date: Tue, 7 Apr 2026 10:00:53 +0200
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
Subject: Re: [PATCH] dt-bindings: display: bridge: lt9211: Require data-lanes
 on DSI input ports
Message-ID: <20260407-archetypal-toucan-of-drama-b495a0@quoll>
References: <20260404034123.340818-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404034123.340818-1-marex@nabladev.com>

On Sat, Apr 04, 2026 at 05:40:18AM +0200, Marek Vasut wrote:
> The Lontium LT9211 is capable of 1..4 DSI lanes per input DSI port,
> describe the lane count for each input port in the schema.

Ah, and subject does not really match what you did in the patch. It will
match when you fix the patch, though...

Best regards,
Krzysztof

