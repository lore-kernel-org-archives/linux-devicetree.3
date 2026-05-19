Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772723DCD8E;
	Tue, 19 May 2026 08:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178889; cv=none; b=rACzCTnnGzHlec0OX/sIa07tsLNqLtgOEUsa4JFq1CzvTjo66ly0jauk+znSlPHt+iMGC0kSThl6KNs41Q9Zi95t/Q2Mr98LhZtLob2m+n6AXJ8EGG0mM2q6tkItlVAVZDpYlQmSvtwEdXBdVCAGro0Qc0f1OoBu4xD9efeZKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178889; c=relaxed/simple;
	bh=JwBi822Ajj19x+g1eK7MyFsiB0V4T6lj6bJTx+9LSY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnVleBxfUek8rjoEJvCNyxggtzCU1FDjZGQkzb3jJWAzM3kmTcatKIMIlGOslETYIEtQncLlC8Ewp2WEWm5Z0zBS4/QcqY26GjIf4hNcbDa0HC7BjIcz4P9sqC5jSy3z29tzLy8M7epV3GKKiZ2ZwdwK8pQzWzeClwmkNASGjNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sirw/sWH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sirw/sWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5011C2BCB3;
	Tue, 19 May 2026 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178889;
	bh=JwBi822Ajj19x+g1eK7MyFsiB0V4T6lj6bJTx+9LSY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sirw/sWHYHpTcXCini08w2/3dB2nWyi30APscd2B8jDjYO+H5RlUHLxNfi24ncXxw
	 N3evP8grBnH/AjKwjESK/uASbYJujai4zKepbzalV6KcqxUVQMSlrvPQfD1tcZUXMv
	 qkGYNYUFkY0kkB9ealyDtNyy7XqYVe5B5hIuLRt/EulXhWxa+dXKQRTy8Uqiwab4GQ
	 zCc3oQR39juUjIj4c/LEh6rfka+Wl0QIePym5iCvXB97j4NHZD/Sx7pxKOmDx6wCZp
	 NqCE+bT+hrJq2xG+rR5bhv2EDW1UMRaFlrJRJai+67sy8ZAZ7lQT0dUYMbHbLr0/d1
	 hZRhd96/zE6/Q==
Date: Tue, 19 May 2026 10:21:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for
 Vicharak
Message-ID: <20260519-elite-invaluable-zebu-8c7afb@quoll>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
 <20260518173039.20592-2-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518173039.20592-2-blfizzyy@gmail.com>

On Mon, May 18, 2026 at 11:00:37PM +0530, Ajit Singh wrote:
> Vicharak develops computing platforms and manufactures single-board
> computers, including FPGA-integrated SBCs. Add a vendor prefix for
> them.
> 
> Link: https://vicharak.in/
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/submitting-patches.rst#L830

Best regards,
Krzysztof

