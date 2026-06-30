Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743FC2E413;
	Tue, 30 Jun 2026 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841905; cv=none; b=jTF0K3IJcGEyR68UYzP0aFVHx5apk7kTMJeteDk0/9BE2gyNHFQMtt89eQY37XGkdt5FwFAYIrHXQWkdbh/4v2GlZFNliMyRCJx9CIIz6I04wQ/ovd2ec+qMa8ZDgINUaVSenL1lCOB5V9cBHyj0yfBYfyyRPABUwHIt0Rfvfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841905; c=relaxed/simple;
	bh=f+UWvjCxeJsepejPaXfU1bGD2DrlBdQP9cz60nzBfQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iC7p1FkPOop6A7hxM/tJ6pJ2POhNvkMS/3atrfVhErFAZzJAO/mhRNCYu1JvcR66y5Z/gzdP/u53hbIObaxTf3QZtph+cCHNWNvD1HbLDh3wY+QXFcox+hXGES5GHQDmdP2/QrUdlmukOL7ktJ31v99hISCP3+I9ZOILFT7SsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJCQ722M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJCQ722M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFF11F000E9;
	Tue, 30 Jun 2026 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841904;
	bh=rpVzYJiD4uvUrnHrs1i+rq74dWRX/dxoOQRnlJsTbJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJCQ722MxU+MHC23BSrdoiEHDRw9Ql9TrNC02wM9iluQIfFS2pL7HTm4DMoIfgXor
	 sZPsO5fe+UCnhgLboo8vr0TxYlvWoSm+8RdtT2FaMnWx7JPw0TX2lNogNtAM5ZteTw
	 1kPr6vuoJgOVYliMJqn+WxyV5po2NSC7PUY1wPojHU/iIW2U9UbFEofK+nGj/7RIjd
	 3DSwICjJtI0nh+5j6ehuYBM+m0cJZgkyxCrI7fDAXrV/x7GCwCEd9pXhsyxB0HIQJu
	 iSdfJvxZ1SPFEXVsbW8oYXCvLLbzRKpZuZq4gN4PrBGSb4ybV8zVkVSfUroRrLgIN0
	 CwPpm9MKm8V3Q==
Date: Tue, 30 Jun 2026 12:51:43 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: yc_hsieh@aspeedtech.com, Corey Minyard <corey@minyard.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH 3/4] dt-bindings: ipmi: Add optional LPC properties to
 ASPEED BT devices
Message-ID: <20260630175143.GA4129206-robh@kernel.org>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
 <20260629-aspeed-bt-bmc-multichannel-v1-3-fc23ee337f7a@aspeedtech.com>
 <35a8e3b3-7725-4d1b-8667-84e6fa24b2ca@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35a8e3b3-7725-4d1b-8667-84e6fa24b2ca@kernel.org>

On Tue, Jun 30, 2026 at 08:11:34AM +0200, Krzysztof Kozlowski wrote:
> On 29/06/2026 08:49, Yu-Che Hsieh via B4 Relay wrote:
> > From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
> > 
> > Allocating IO and IRQ resources to LPC devices is in-theory an operation
> > 
> > for the host, however ASPEED systems describe these resources through
> > 
> > BMC-internal configuration, as already supported by the ASPEED KCS BMC
> 
> What
> 
> is
> 
> with
> 
> this
> 
> line breaks?

I've seen Codex do this... It amazes me how hard it is to get it to 
write properly formatted commit messages and then not forget how to 
write them.

Rob
