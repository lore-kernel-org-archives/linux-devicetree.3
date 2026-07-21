Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C2380FC2;
	Tue, 21 Jul 2026 14:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642831; cv=none; b=Rmg6EhuRgK8FtxjdiCliC9LyooEnH00xjVY/0etAF8AcoSd1aymqBbaUVFdSPNAtJZIP0Avh6oIhRJPF+QRjvS0HXYOagAlVn14ASa/KdspgpZBHwZVATupg6yVZsRkMn8uD7ElF5jTsJWk6vpce+DTHSJjQjoC6vIC4G5uxsbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642831; c=relaxed/simple;
	bh=E/OdF88mxvddTtxytfXA2HKZoPpv95mOBASNujlLtzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FO7c1X3vuGl5bzXQ98AuhWvqnfbBGRfKFdFU5O0u6r6B4PwKdTPUrG5j2Nq0PfkETHoBQzEnhRh9TMWkdEfOvV17cwhNQnySdYx7shtlwdDpwVhLF0WfMC22c1jNNGw3KR4ivo4c0w2fGn/3OgxITfaYyx8VkUPDddOmiGAWMag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSDVMSsn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSDVMSsn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BED41F000E9;
	Tue, 21 Jul 2026 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642830;
	bh=JFEeyIepb6Rg+p/Y7T1CAWsZb+1nM25JG5ji/VtiM1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LSDVMSsneoJ7dCkDJ9QDO78xty572Qf6pWJVeEhjn2nXen8JtWY5YBPoQXiovpo4U
	 bL3HST80IVG7RLwvSYd1En4A4r90Fsu9mBwMk5FW0Xv3IsWs4bnyqAubGSw+9fQFVc
	 cLmRuXJhQxx778+kcCGAaIzhruaqGzgt0MtylMPrXF4mCTKDo8U5mtcF3E/Lb0EPxv
	 HPIWLbtMZQ7iboZA3brcbR/QKrzGMjW5C7GzB8sjqJdUZZk+UpjkV3izXlqtKZ7MgP
	 7Rip6pM/ug2E7dRuPFg4DX0TQoWfjUglR9pbxUF09nvM/yCGzEIq1bpYiK8C6v1jkP
	 RE8LdWJzZuJoA==
Date: Tue, 21 Jul 2026 09:07:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, m-chawdhry@ti.com,
	devicetree@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@ti.com>,
	linux-kernel@vger.kernel.org, daniel.baluta@gmail.com,
	simona.toaca@nxp.com, goledhruva@gmail.com,
	Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] dt-bindings: extcon: ti,extcon-palmas: Convert to DT
 schema
Message-ID: <178464282938.3584237.7639159420132002251.robh@kernel.org>
References: <20260721-ti-extcon-palmas-v1-1-cd4071f0b9d9@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-ti-extcon-palmas-v1-1-cd4071f0b9d9@gmail.com>


On Tue, 21 Jul 2026 01:51:39 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments Palmas USB Comparator from legacy text to DT
> schema.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/extcon/extcon-palmas.txt   | 22 -------
>  .../bindings/extcon/ti,extcon-palmas.yaml          | 74 ++++++++++++++++++++++
>  2 files changed, 74 insertions(+), 22 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

