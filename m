Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984F2281525
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782131153; cv=none; b=dnz7xHwzbJizebZGz2lN3ygFFT20CGIQi+q+ls1NpT/+vvnN5fM6e1VM6/TPZhqAwMwwS0WZxdU7MUFr+fPGILRMaf9KeZ9G6FzIJxCs/3mzj7Aq/FgePuArD7dWA7KmgnL2kgsJ5wUFinMpvRrN9Ycm4Q7gwppb5i/y1/kJe2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782131153; c=relaxed/simple;
	bh=Tved8OXTIwp9xmkpx1nCKvkd7hGByULRJOyiTNkv/m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df8OnPMJVvEPqUUw8P3775IadMIqx1kQdmonk8P1VuVyJWt1zhAoyg7dClioivFFIBXQUgAy0yRaqvYvqbmCeGojJFVvLk9WKvKqp1ZeSfJk5Khgaydg6mAYI3tsOVpdFvvJz/zmweGqDVQdJt3V/fl0sb3kmtp46irLwTObNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdXgQ+Fv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdXgQ+Fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F6C1F000E9;
	Mon, 22 Jun 2026 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782131152;
	bh=SI0HXGq7FB0HOc+9hNUf3balba0LXes3NbQNPhmDLuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EdXgQ+FvtEuqNgMhWGSlHBhCBpcXfTvhXmSOb3y7f7z4j4V3lZsv3hyCSvBgVMl5C
	 IhnWobl6fwwje0bZa9x2zhtXcvxfNbXzccU0H68Kz4aULAYJ7jhFsrxoTmCkMl60NN
	 ihiAIn22cpnE+15Jmg+WOlzjzgULhMY35uwuXI9siTWN9CSj9brGhn88fdZVro2hAZ
	 9KyNJVkOj11cx+PAqb/cUBbQ4qmXTQCMXj1pxK4rzOGZ7IE1ZcoAlroC2N1JmidPwC
	 ev9OhiZFDk3ayrf9dn8Z+GJesoJBqvmjscIbUNW2axIvSU4dvAbQsqKyloNpRloJRD
	 xh09OciNGmbGw==
Date: Mon, 22 Jun 2026 14:25:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Yu <f78fk@live.com>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Add MYIR MYS-7Z020-V2
 board
Message-ID: <20260622-private-lively-bobcat-e639cc@quoll>
References: <20260619102214.223121-1-f78fk@live.com>
 <20260619132355.1776-1-f78fk@live.com>
 <SY3PPF19552C607716AE1AA440C85D348B6C7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SY3PPF19552C607716AE1AA440C85D348B6C7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>

On Fri, Jun 19, 2026 at 09:23:54PM +0800, Liu Yu wrote:
> Add compatible string for the MYIR MYS-7Z020-V2 board, based on
> the Xilinx Zynq-7000 XC7Z020 SoC.
> 
> Signed-off-by: Liu Yu <f78fk@live.com>

You should not use outlook to send messages. That platform really sucks,
meaning:
1. You might not receive answer for me, because outlook/M$ treats kernel
maintainers as spam and does not care to change it,
2. outlook rewrites message ids making threading often broken.

Recommended is to use b4 relay in such case. You have been warned...

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

