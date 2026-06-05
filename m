Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D04A4192E9;
	Fri,  5 Jun 2026 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654510; cv=none; b=BtS4+YaaXHsTyV2z5RzwelhORLLz2KAkwMv+8RSi+Id5uvOnVDCvzHtbytsgPFb/KAGjlk4AoqBaWvMXiXlmNm9WttPh3/ceR6LE4fSFGu+eLccZofQvr213jjr96TzVapFuMzGaWkXqLKd/YXnYQB/+66phKyoJalrpge5RzTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654510; c=relaxed/simple;
	bh=2vtnnUMDPCFL+1Dz3rP8KzqD3Wrs3s9xjJ2/0k7D80M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odC7wivfLYkGx1G/od1tvqETKWQ8t0LSnv8SUy7vi9B0gXYcEtbFmM62i8eaL/l7u91gjsTMhwb6g7qb1Dh1Nqe0g2LAZKBTVqSI76FmiChuaAIcTDbVnMtvwK5u2k4mNUlSl4rAiR8bDotx/FwiMEqyUmOt9e3HJVXSUrNxPz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F82/u//5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F82/u//5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2124B1F00893;
	Fri,  5 Jun 2026 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780654509;
	bh=r7y2qdW5Y46qla434jE+ACDcxuUp7VYaUzScisOjV1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F82/u//5JDX2dTDcRFEv9je27+ld+9WY+9ZCskT7v2oJXptF382qOUzVClTmsuo+V
	 xeHRgOMpeotK49P6LPZtnH9DZCpKTIkoV9xp2zPH4/JfizCqH3kkc5Py2+r/Hfl5ij
	 iMXNQbp+gjntUH458ZSsJS+vCgTDmrXgY1cBvfXn84kMXV/sDadXvxQDem17HEAUgO
	 yib3mv6czHrFlBXlPtf2fcT85vFWz79w551fanyRDlTVQFsIbaIJWdZFjzOWSt0dLT
	 Ml7+94C0eJn8igOLHJmy/mN3LWuY6/ftO5IyTqCfNXk2MpSanrgeuFCRgbSPVxfuWr
	 ZY7+QTyhcNZpg==
Date: Fri, 5 Jun 2026 12:15:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] arm64: dts: rockchip: add Vicharak Axon board
 support
Message-ID: <20260605-supportive-exuberant-serval-cc42c0@quoll>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601162143.170030-1-hrushirajg23@gmail.com>

On Mon, Jun 01, 2026 at 09:51:39PM +0530, Hrushiraj Gandhi wrote:
> This series adds initial device tree support for the Vicharak Axon
> single-board computer, which is based on the Rockchip RK3588 SoC.
> 
> The Vicharak Axon is a feature-rich SBC targeting developer and embedded
> use cases. It ships with:

Slow down, please. One patchset per 24h.

Best regards,
Krzysztof

