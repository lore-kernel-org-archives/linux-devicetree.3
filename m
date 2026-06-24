Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E393323815B;
	Wed, 24 Jun 2026 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294197; cv=none; b=J5TY0ZIx+As+UH05cofHipNBGPiSt/sWHWhJwRM37nYbDOM3TIAt1vaO+HoUvYz/z5fgNhYeKCzycoolqBj+ROAEeYAm7TWYB+DEq+KGv6zuu9PblQxePMB/WPw5014Ba3E7UjUiMvoJqE/eSCA5JSeq1IWVGAa+4MH3ZDQ4Ac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294197; c=relaxed/simple;
	bh=HAjUxuTKNJxAw4ETnQWWxQKZ93F8ZWP9wcxlRVp/9dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2A42hJHzPJRwiSmB6nTEfbF3Xp4PErnl9ZnQoRmTxm8cfuTGTL3fI3V9QOWqynjPgkBQF3l9bWRNJkoN79HJVpeNPyFgQqrcgFB3mpZR0LXbshAKqYjerq1dJUJMIxWx/jAm3NWeV6U+777bo7BQloqQgmD66Bd0NvbL9f5yTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuXE8ETs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuXE8ETs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A070A1F000E9;
	Wed, 24 Jun 2026 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782294196;
	bh=CmQBt7P2Kn0Io0KbERzB0bMS4Qfw0eQOzIjOmBYJhVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RuXE8ETsiYdf/BYMy07f+nmvmgv5OeYMGl4o2FVqeg9X6ft3YXRusep8wyxM2rC+W
	 llE2wP5bjOqvWPEpakRTgk9Drf4ZhW38ubz7DOZbIQkdi36GBVHMhxElH16M6AWWby
	 q/UIbzfkf+qCpshD0jIGs5HkUNm7YgvNd8fBUxXDL50Xg6eQVucege54nFyRp3fNUA
	 ZtSlG3K2mXFwNVQNTpsmiMZNOHRuyStj66JklCq6keN/zEgxJKGcpBpeFpcRj/cGoF
	 ueM0gAXvK6VgpggwlnhUSV0VwSMGjWK2P5r5Ec8AzWctPbvYsaK1mWvFH4ChVfFqKk
	 i5MppQzcYxCVQ==
Date: Wed, 24 Jun 2026 11:43:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org, 
	jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, 
	kristo@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	thierry.reding@gmail.com, sam@ravnborg.org, leonardo.costa@toradex.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: display: panel-lvds: Add compatible for
 Opto Logic SCX1001511GGC49
Message-ID: <20260624-sociable-infrared-manatee-0e847a@quoll>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
 <20260623195741.495734-3-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623195741.495734-3-leoreis.costa@gmail.com>

On Tue, Jun 23, 2026 at 04:57:38PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> The Opto Logic SCX1001511GGC49 is a 10.1" WXGA (1280x800) TFT LCD LVDS
> panel.
> 
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

