Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07387375ACF;
	Fri, 17 Jul 2026 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258619; cv=none; b=JcbWp418nSbPo5laqYDaOpfkiZ1nA3+gUwtbRgtcaXI9MThQF7HyoVWrw5KzlxA2LS1C9t7FKrLzbrqtvMkrtD0Hx4ejwd/aObMcK8doAFrTVWpWPTCXHoxVBIFMN+r7r9ZigIA4BSaXWjJihvfDhLa/p71TdbRuPMVOn63X6zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258619; c=relaxed/simple;
	bh=dVPIzkNQ0xfxuJs+q+mW+abHL/1LoGtl6BTXN7UaBZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cOwDomF2kCsoExhQprxs9I147knrTtODVysfxDEhQ8BgE5Wfgh0lBE/+oqwm+BNKCcEtrUFtP5jpaWuOLDmciY25vBpYpFqeX4yjbUKW0eUWOfvZYR9h0fFRNuTY1OxVqy8tRgfZAxICkcnFVqbRifHX9oCIlY5ar7aiYqIyovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hsn6gs9u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hsn6gs9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C06C1F00A3D;
	Fri, 17 Jul 2026 03:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784258617;
	bh=P9uEHET5svEHgTM77cxV8IJv3xgUF+VNm18x/wDGJQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hsn6gs9uhy2NmC9cUMnBb4XmSSn1dKXCEEDF/MMqkg4K2ikDzwSUFHnBWNmMKMeNH
	 /EIY+W0eZ2GoKoZA6x/xZs3vKTFq+wWax039RI3boYxHdGes7RFpvDCUezCsEZHhBI
	 BtPlGCXDUfhDPj0/839Uv+VFc0ZbX8eb2j/XXODHMv/UWU8kOf2vhCUxRz8gGYais7
	 JTHmTW/6x23n3HqSdJP2twOt8CrU9rrjsd+oeA5mrQNsuaI6z2v6tu8C0+T1cd/Z2t
	 My1dSufBvBPWRx7cV6SCObCRQBmh/xDZSsKwPxnO7O+bmcH4FtdaI5uzCpLxUhLi+m
	 fcG1HLIiIuyvA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Document Hawi SoC and its reference boards
Date: Thu, 16 Jul 2026 22:23:27 -0500
Message-ID: <178425854589.1084804.7917336329123608673.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
References: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 17 Jun 2026 20:46:02 +0530, Mukesh Ojha wrote:
> Add Hawi SoC and its reference boards to the Qualcomm binding.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: qcom: Document Hawi SoC and its reference boards
      commit: ff24f055eb3e1f617e5790bf07c4c71aeef10b0d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
