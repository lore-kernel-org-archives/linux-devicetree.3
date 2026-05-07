Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA093644C4;
	Thu,  7 May 2026 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179772; cv=none; b=rgnB1lzyBmmZZWetO+wTnxmUjkQzVLpfsEETS1Fhuc/eJ14TkFQZwRciaOVhukiaIFVOs0GHgNsMdg9gjl9MfZ/oLQTm4DHveuQQT+MMBtVF9sJO69ZKvk68p5TL3/cftlNnYVKugMjX+Bh2MIpjm9W1Kd1TN/h8e9nxB4kxDD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179772; c=relaxed/simple;
	bh=rd8QBqfWteaHxlQhla7UQWaZV0DjhFhnIwRxz2SCwJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dk1Ja4W27yy5LkRKDy+lsbuKa+dUx9twVI3ZlnFI+BUbdDJDOt7mv3cF5iQ+hN3qoYmo+tyEm2D7NcVeDB/PeiBLWU/4taXazYepsy7Qaf5f5P7LrYMVONI4KPJAS4q2FPX5YL+8CzyhJat2KYAfn23qLRfAWzSR7OitY0uqN60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+AtV2AY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+AtV2AY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB80C2BCB2;
	Thu,  7 May 2026 18:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778179771;
	bh=rd8QBqfWteaHxlQhla7UQWaZV0DjhFhnIwRxz2SCwJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+AtV2AYuUl/dGfhpJetJeL9/c+S+PWyNL3eCk3QGbzrf8zDro7d9bY7OhOtj2TVB
	 GaK8pDmAuc/jzteylEXivDAGVbEylNH0d+YZ++INY5bqbLw78zw5K3yU8yxhwQ0Ah1
	 Ib1h7UBMnurzwYNyTD7smnvgzba2CRWrDLaVipAobjnmXMs5XpBPoeicZeW5GbzKx4
	 1YnTKNSp6QGLubwdVLRx3UUCEXg7yjdA2HPC8HWhYw4X9kpnH0atyZkEN6PKXWhD4f
	 IPE/djas9oSMj/eZO2TIdkUnVKzFfvYTGt3QfCvh0ZKwCN8RXW4086KrC9X8ejEEeW
	 JI/xN9jy/X+bQ==
Date: Thu, 7 May 2026 13:49:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
Message-ID: <177817976889.2243365.7227756102515315811.robh@kernel.org>
References: <20260501155612.5490-1-mail@etehtsea.me>
 <20260501155612.5490-3-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155612.5490-3-mail@etehtsea.me>


On Fri, 01 May 2026 22:56:10 +0700, Konstantin Shabanov wrote:
> Document the X1E-80-100 variant of the HONOR MagicBook Art 14.
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

