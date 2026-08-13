Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A032D0F5;
	Thu, 13 Aug 2026 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612860; cv=none; b=RM1Qd2OLmG7Ne4ttM2KNPeTey/P1cOjv+y5uixNZs09glnHkFkO4bjqZ7iyz4ZHgKVZ50Q9/1VdF6+kFtoS0mdymP36MnspSy223HvalvhX9OKxPR7K5ttWNh4lMXi2QEk59cdYNr8uwtBdUH2jA/KyZ9rympuALvoOKOeXM5BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612860; c=relaxed/simple;
	bh=fBG787ZrfOWFJzcLXfNTYcPsRFXojDYOOpcevdlIKUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfhGHHSrv1uGS0rM7+dqU5X35EW9eKqM8rJzCRyeawN3y8WtE7851MJ7CuOH04UpwdCnXWXr0gQUrN5lAXuWYaNZPti+u+S7/geAxdrSkEERhsW3UlWhEPM9v+K66PUg5bW8PZkw/oPcACCvgklSZD763Sm5M1diesQdeiCRNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SezHRJlz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SezHRJlz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD211F000E9;
	Thu, 13 Aug 2026 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786612859;
	bh=XgjuLJL2VaKvoAjqatHJidPQTkBd5lUKbVgfJVe4sC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SezHRJlza0vTXVyRPL4JqbMMghsMsT6QRCD9RfMiDLuto4E+gw+MMAF60qE+yBOjb
	 OWZK1yvhNgBK/Yi6jGuxCgIY4edf9G+Xy4aPIe+1HSseDCYrwLVZPe0C6lWIi4opUT
	 f617v8uJ2MWkhz36C38O0RIjmlPc9BViZjHJWBAtrxATZqPb09yZBgWVggt59ooIeA
	 r1/EPiU90ajG+YEiTGF4DFO/HGTl4v8/dJTBSjfrShSL7NnDNEK8lXnC25SSyMAq9s
	 il8F4y5vmCfrHJtiry2jotpDwaXHnx7Fl1fEX0EZRBAsnK4lafcQ1STxyRC57257hv
	 qHaKcDTCpBKCw==
Date: Thu, 13 Aug 2026 11:20:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Retroid Pocket
Message-ID: <20260813-casual-fortunate-serval-11bddd@quoll>
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-1-a5a365ba3dc5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260808-rp-qcs8550-v1-1-a5a365ba3dc5@gmail.com>

On Sat, Aug 08, 2026 at 12:37:55PM -0500, Aaron Kling wrote:
> Add an entry for Retroid Pocket (https://www.goretroid.com/)
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

