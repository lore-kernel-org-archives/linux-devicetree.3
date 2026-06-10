Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB33381AF1;
	Wed, 10 Jun 2026 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074479; cv=none; b=E787Nvrv6FuzluqW/MPLb/E0JDnCMmyUrEzTIAMU1ihD4wLrvOx7JLSt3fFezIoJvQjOc9ZDMCQVwgmWYx0QF0mLw3Os6pzQ9pPMKyAhRSEexpGK6L+eUrNiIdciTtznXu7JevRLik4DEbyT2FDiMy/DdhoB5h3c8DX4YpXEXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074479; c=relaxed/simple;
	bh=yUZ2FNzT+IYNS4EXEgUYbhO7SjVmvuP26QhIH9STW/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb0Pf8wG5ZzbSRGn48RTZzwHxizsYqUXGHi3TUUhCbuVwQJ4suKBAs/cWjqffYFJtILTqmQ1PjOqUERaICmr48hbZJZhzLi3udWmDUxICh0Kn+8OznQt8g0VRy53KMsg+/IZuR+pd5r9zQblZcCfu37zQbsQILPED6QBMvqboKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=yLjllAxQ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="yLjllAxQ"
Received: from francesco-nb (unknown [185.12.129.182])
	by mail11.truemail.it (Postfix) with ESMTPA id 3850A1F9B9;
	Wed, 10 Jun 2026 08:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781073987;
	bh=Oc1LefQiZLWZj6cHXjnSZFfsCcTG4RfNhHfPJWqAbq0=; h=From:To:Subject;
	b=yLjllAxQSH7rTGTwI3339Bqg2dotiVr3CpnTdi+1Njva9u2m2aX0rlh+ByvYSqvHK
	 4FBtg/PY7tIfw/NJ/Ght3zmhCAwkURMrCir/8hYlBRGl4BZHgSkkEut0d6zi54OreU
	 aFToKaBjM8jTzELTSpYmqTwUiaU03I88Rm7xv0AfgY+j6zZxGgUh4amvv8X+j+X+hY
	 oQ7Sy/nOcluUfUqXE8+5bMmUkaW6bPPyfiFmL8G5VaslNJEolAHdv1M4IpIUIVEGmE
	 C2EUSlRruDEd3FxbDtDyUlsk8Y7AbGHnAMa1otKCc+m6u2zZUw7NxCXTukdFBFq5dj
	 ijrISiAIY5/wQ==
Date: Wed, 10 Jun 2026 08:46:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am62p-verdin: Add device tree
 overlays
Message-ID: <20260610064621.GA23935@francesco-nb>
References: <20260602141311.1366818-5-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602141311.1366818-5-ivitro@gmail.com>

On Tue, Jun 02, 2026 at 03:13:10PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays for the Toradex Verdin AM62P,
> bringing it in line with the overlay support already present for the
> Verdin AM62.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

