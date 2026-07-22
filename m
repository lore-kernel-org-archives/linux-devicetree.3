Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5882D0605;
	Wed, 22 Jul 2026 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698945; cv=none; b=GUB8YQ3gOcrf0hmW+ut6IUIs8TKxAfA+NWZjbHyPO6bIT6r9NPmDqxek73U6Bhp42QLBQpemxoOhzAdBQW8omxDFPboUYB++xXfCu7ErIuoKVgZT2lcJkey747kIZtfxIvFMdytHs6rq1jr4Qde9EDPsQLg5v4WIXv8e5WibT6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698945; c=relaxed/simple;
	bh=HH2jmFhJQtmubMRbMzvqUFA37qZh2a93c3dqePvchig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kOHLJtdGdCZnpXxm0EslaNfuxHsgKl9lGGEr/ED8W4OwhMwv5RZNb5gSm1lUEa7TA2e9BKL3Fj409N2hgcxGqieHmomDWh037TZ8WBQnRVciX0SvFCb6aF16lIeetOlR2c1GZkpNf+IlZPpT0q49MJXIZ1nJ5Y7IBICb/hfMa1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=nIScDihU; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="nIScDihU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784698933;
	bh=hbQw3W0t7DCWGLYQc20VbVCF0idVw+jcX4clr+Pc7k0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nIScDihU9wxPUYN9bA4sZT6/4MEoB7cAybII5TNLOm4Fc+o9ccci2sNpQA/ji50gV
	 l1VNEZYBy49MJezDHQfIa1rK1xfa3xvV9kF6R67D6S4DDf/voA6PAGQbd6NKwUsURh
	 svx2rmKzC+XFEEdKvBq6Ai4w2VQMqWgS/FVoOakbuwPKk13BDlhSSJ2smYwj1LFYmY
	 X/q0ql7zj1XQbWs3vcE8rpJjCUbvT5AucOdDFHJ+G1StTzw24/hJHcldOq2bYjhksn
	 6VUbDvT2VR6mM870VlKSujo/6W3DZtuX9BwcrmqjTEvqF7BgR+sLcZRR83ByjtoBO0
	 sll7oWMTbxjWQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2EE1165B37;
	Wed, 22 Jul 2026 13:42:11 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20260721-upstream-sanmiguel-fix-fio-ioexp-intr-v1-1-8245ae0ca590@gmail.com>
References: <20260721-upstream-sanmiguel-fix-fio-ioexp-intr-v1-1-8245ae0ca590@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: sanmiguel: Fix FIO IOEXP interrupt
 pin
Message-Id: <178469893176.629993.5702015627237024967.b4-ty@b4>
Date: Wed, 22 Jul 2026 15:12:11 +0930
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 21 Jul 2026 19:01:59 +0800, Potin Lai wrote:
> The interrupt properties for fio_ioexp (pca9555 on i2c14) were incorrectly
> configured to gpio1 with ASPEED_GPIO(B, 6).
> 
> Update the interrupt-parent to gpio0 and the interrupt pin to
> ASPEED_GPIO(C, 6) according to the hardware specification.
> 
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

