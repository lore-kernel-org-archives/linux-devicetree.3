Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802437C932;
	Tue,  7 Jul 2026 03:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=dB7OkJYECXFEKT0IlKuj3fdPnj9SlxI5MNqAE9M9EyhYmheRKjrQBMjRMK25MG9d4SlppEFYKl3KUYPbVjS1ttSOkXjPCKjSCTvqLv3lMEryG2PjgqDtVGhDHijLbxrLXtGYLdRKuGC2kzPy7NwvwgATtfQZUDL2liNBNlrit6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=AzISUhyU8ls8tWJIuvglVArxyb0Iz1Q8GmdDSUYdfgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASJLD11fvksrXubXaUimOpW+CfnSvtRrlem+0RNEuGMa89qtWfCJ6y6sCiM0b+N3Iyya0ndCLhXahh6CJZvq9wNcT40DnR1f8XZRwCYTgC0EVfhIT7pyvxDalaIaAKY9swzwSuERvxjMxCemi9v5xROXB3ePlqLZOI2Oh0QmKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5WPserH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5WPserH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267921F00ACF;
	Tue,  7 Jul 2026 03:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394523;
	bh=r2m81evNFFaSA8QGN8H8zohHgVNrqJF2vk7UbAR8rP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A5WPserHDtGF6cBsrpSqkDSlsRcdxocukw8n+zBPp+GeKPooaN+cefqXLsaHo+WY0
	 9ZaxxbXVHLEiA3+LwTSoIe8IaO/OlSN72FGKD6QbieRQKZNzZT6TiQ3w2VpTfNKvB4
	 dZed19aCwMX81J+wj/iyYLnnkkZPy3o5FMF9avqTxAlwjqi8bxIEripAd6MHW1FT4x
	 hmENYT8zcGJpDxVN0l6LYAbbFJnWWXUhdlsCG09B5rwcX0A1CCtcveA9b7J94U65PR
	 5oX3gOChR8vOyx9BkFntlJ7x8LkLunHNx4xAj5WIKPIrkkjkgg3URx62/aClSMapFF
	 6woyo+le7nn9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake GPIOs to PCIe port nodes
Date: Mon,  6 Jul 2026 22:21:37 -0500
Message-ID: <178339449890.1938770.7066889850779071034.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
References: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 May 2026 22:16:07 +0800, Xilin Wu wrote:
> Since describing the PCIe PHY directly under the RC node is now
> deprecated, move the references to the respective PCIe port nodes.
> 
> And also move the PCIe PERST and wake GPIOs from the controller nodes to
> the corresponding PCIe port nodes on sc8280xp-based platforms:
> 
>  - sa8295p-adp
>  - sa8540p-ride
>  - sc8280xp-crd
>  - sc8280xp-huawei-gaokun3
>  - sc8280xp-lenovo-thinkpad-x13s
>  - sc8280xp-microsoft-arcata
>  - sc8280xp-microsoft-blackrock
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake GPIOs to PCIe port nodes
      commit: a8fd72fcf305534f0a8da095de2cce467b73e66c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
