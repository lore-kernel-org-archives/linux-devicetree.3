Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878333C343C;
	Thu, 14 May 2026 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778759158; cv=none; b=DskyojaZA891+F++C/9+HvwBn/0RxciIdey9KUjTASAEtw68tNfH+OzL6wKw48htFErtxpa7pbhx/1dbdwogRSDDoQ/hZ4qYmnjAirDkXuFJwmpjucVTruM7GYKtSRSaROCj6xNfLJDoLi5UDodDWHyvDMplnXOiPotz/F6rw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778759158; c=relaxed/simple;
	bh=2qY+QrMvacCd0TNq2vMKYHt/7+sltOZK495vCl1gMrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g22Qglh6/vC5rBfvh2B7jNPaobIs77PVqsT7JigGF8wxn7lhjqS7YQfSBF7+Q4fjVv8SquzB2rhJpXqCiPnADnCDenHClUaF7ZEyg1cBidmt3spwpwRpyddDTp1esLTxP5uwI+0w1hU3Zbnv7wYlRqQXzbQzYXEhWFpP9+Pjrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7HJM3Uh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7HJM3Uh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB66C2BCB3;
	Thu, 14 May 2026 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759158;
	bh=2qY+QrMvacCd0TNq2vMKYHt/7+sltOZK495vCl1gMrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7HJM3UhSyxbHLmMV58PGUYajjFrgyPXrNAmfLHOY65Frnr3xSrYJCWygNqusOeco
	 6CeZAJw1n09L3Wj6Oe6Ps83sKMtZXUat3PA4xOY4XhMJctyD2f3ZWa1Z9s/SoWLgcg
	 qLDoBdpy+nCgUG086euRS14/HNnZoazSP+JXltdav4o3nP1ElfldjfJpjkwMXGbnTk
	 kF8n4Rtc4G/XWko662oc+pmMKB/cSv4NO0IPkkzruHVL7/TakExqmsnWu2w7x+mjTr
	 NAQs0plgY/WgdwbOb05WNWMSoaEGx603k+80/4q4eNwJlhmIedyPvatmK1wi3eAViq
	 oTB5ByaEVyZ2w==
Date: Thu, 14 May 2026 13:45:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Davis <afd@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Message-ID: <20260514-jumping-futuristic-condor-9f0503@quoll>
References: <20260513233447.2713737-1-jm@ti.com>
 <20260513233447.2713737-2-jm@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513233447.2713737-2-jm@ti.com>

On Wed, May 13, 2026 at 06:34:45PM -0500, Judith Mendez wrote:
> This board is based on ti,am62l3.
> 
> https://beagleboard.org

Drop, it's just vendor website.

> https://github.com/beagleboard/BeagleBadge

Missing blank line. Please follow standard patch format.

Maybe that was supposed to be tag?

Best regards,
Krzysztof

