Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6400480335;
	Mon, 18 May 2026 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109494; cv=none; b=s5RypmfCIUrXiuETpMGk4pQsHuNXM/8+0K4LCyjZJc46hdbpSLt9/8Kvd1yV34mthMC5UmPcCmdrtwKjNFquRsoioCTV2PHtdBeAA4nO6HnYf62SucWI/56c/6nB2KzvlBuZZq07akrxmHmIIGgU4AqnpnyxxyrreDoR2T8H2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109494; c=relaxed/simple;
	bh=nXkhtK9o0AaX4l76E13gOxjL/F9EGYtWCFU097U+jXg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J87we8NoLwgu04tfSYsSNEOCZcSUAzCLp6R+tRjU2HPR00w0ralcyuCWJPyHv5kltBGQQmrWtYLgaAPaBYOppqdSPNY9IT8U9gCaMVR7nGtAf2sb2oQMMhYz1phR3yOxVusIrUnXmGzU9/8riuquANgH5He77tsFbbGJCZPlf1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=az5fxu+W; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="az5fxu+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779109490;
	bh=nXkhtK9o0AaX4l76E13gOxjL/F9EGYtWCFU097U+jXg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=az5fxu+WtwmRgdyYCSie3SYKy39NyWthj6rK5dElNf+5B0N8CGToFYyhG99At1O9e
	 TjvDbKAw4yoOsjqj4QrEFMaRpIN5/1s/OJSl7CYnWYn0GwgiWNf+hIIij3sdIzp6dM
	 O2IMaoiSRqRNTXdWHFeXesxk8npBhzPGRRPAEVTIWyJKFkPIHZPzq/vUtTSREj+N9p
	 SzL60lusfzJSqrGnyyq7EndvF5ff7bKmRoPZZyC7yRPW7YJ3tZ9DfvzRM99SiRFEfs
	 n6pABejzCPgJJUAITQSxaZRM4k2mTkU9XfBF3n3HjxW7nMXf/ZoKDrZfolJp1dMhPw
	 j3Swt9tUd916w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 74A306025D;
	Mon, 18 May 2026 21:04:50 +0800 (AWST)
Message-ID: <1d06a4ee2ca6cec68ca241812b2a90c1fd4e153d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: g6: Add missing uart nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 22:34:50 +0930
In-Reply-To: <20260327-upstream_g6_dts_uart-v1-1-26e72b47bc97@aspeedtech.com>
References: <20260327-upstream_g6_dts_uart-v1-1-26e72b47bc97@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jammy,

Sorry for the delay.

On Fri, 2026-03-27 at 09:58 +0800, Jammy Huang wrote:
> Add nodes for uart10/11/12/13.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 56 ++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 56 insertions(+)

Do you mind rebasing this on bmc/linux.git aspeed/arm/dt to fix the
conflict and re-sending it?

Cheers,

Andrew
