Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2316E3B6C1D;
	Mon, 17 Aug 2026 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950975; cv=none; b=fqAxIL7xjBrG82DFvgYXu3XG+T5UjJ1kncm4iDM4IvR4dyDyMm14OFKwTvt6VFXoarm+StTNEeq7s+qTPIul7k2i1dYe6L4tCzx7vFqG9RWFQ/zcMwzIwSNC6mAFQ+QLZYlQKPndy3bDJUQJNhqcPULi0nY32imAU5v3WlYDgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950975; c=relaxed/simple;
	bh=kMKlIBl3NAuuM6jvx30dD/Hizd+fyHJnLS0PwEyzfBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIH/zBYcPyUUEp15AZNuF3ltBItSUlcrNt1H9EUQS3VktJcK/05vc2zWiby8ofTLMJ78ko7nryWWWrsIRWZq7Ymy9gyp5yj7m2jFC7OWbdAF8YanRPW0x8+qEWFL0McUxkkgcxmdJM9DINqY++jp9HQwNL7W0s8M840CCzypDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls9iI2r+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls9iI2r+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA681F000E9;
	Mon, 17 Aug 2026 07:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786950972;
	bh=kMKlIBl3NAuuM6jvx30dD/Hizd+fyHJnLS0PwEyzfBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ls9iI2r+IlBlLw9a/a2pq380+4Uj4p8CPg37Pz3IGZq7RfdNs64ygbmNAoFmBPYZQ
	 XCupHoFDg7lHseSajml1GcWDUKKp53Ug/1m/d4VR2KXi0EnaQu6tJnA8z1OMyC8jua
	 ncy8dUte2S9BS/+u3r99QD8JIW6Ne649nZpSqlJakA38BclnVUN55lVUrfkFcAUfkm
	 gtEELzBCzyBaFe4YKFlAgVwc7AcBN/D/7zZ/xWaMgZYoq4Xoub9qIYsH2veCwMJ7Do
	 Dfd+C4Rvovr72/qUTDNsH9uraVuRBIa/um8PE01cWRDUPzspnQhOoz2NGfeIllKLnt
	 5hWhphvCtM8Wg==
Date: Mon, 17 Aug 2026 09:16:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard <corey@minyard.net>, 
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jammy_huang@aspeedtech.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: aspeed-lpc: Document lpcN alias
 for multi-instance SoCs
Message-ID: <20260817-icy-peridot-mouse-ad50f6@quoll>
References: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
 <20260813-upstream_kcs_multiple_lpc-v2-1-775b1db3fe95@aspeedtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-upstream_kcs_multiple_lpc-v2-1-775b1db3fe95@aspeedtech.com>

On Thu, Aug 13, 2026 at 02:42:31PM +0800, Yu-Che Hsieh wrote:
> Some SoCs (e.g. AST2700) expose more than one physical LPC controller
> instance. Downstream devices such as KCS channels need a stable,

We do not care about downstream devices.

> globally-unique index derived from which LPC controller instance they
> belong to, so document the "lpcN" alias convention on the LPC

New aliases are generally not accepted and if your reason is
"downstream", then answer is simple:

NAK

Best regards,
Krzysztof

