Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105443;
	b=LZBdu7TKmfmkXmghxERZsmpkivOO1HqiZduV3gl9XSweMBqNq1ytiJdYgfkAry9YOI5/
	 uegzKsOf3d+WdS29A+plH3KsunR5DC38teQKmXd5HEMd/Oz0jyxJEtQLcaAsQqVzda0Q2
	 k6G3l3iTfuG4LGDtg6dgZfYIjue0FphYt6tTKwg9sDpko525DWD/U/nkz7kVu9K9ASRHH
	 RPplGQWlCIo9AM/NS8UgC0/lK8jxXgOhk5V5ESfFWl6bDz6k8sOCOU31rfD1YasUFFZUP
	 2Lp/F49oUWyq7HJYm2sdhZXAmcqA5rqN3yArUI3LjZvKl3r5v8OK9AqaMXNdDbXp5RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105443;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=1pbHZ/UD3rUQYraKB5VVEpOEj7pJU3t0iXhesNJaed0=;
	b=r28YBeKHs4zlpPiQw7XROCvVYWi374fjbvJtosmHoB/vWBdm4MNlbiudX0i6r7cT8jkR
	 6GIZIkPzL2oUUbO8Hv+wFB1gqaPxu5FzTlBLoj0ep2uKvrXXcjT0s/omHFkbtsrygbMpU
	 dEfmx2UpmWbSKs0rbQjBpR8Io4ybQNLdSfDA42jdp2VP29q+lvBXCzqsIV6nVHvP7Q/Ho
	 n4TG2AayU7dHH1Pe3fSOB8AzRIL3wMa9xs5ysxCstTR21cNhyQ8fRi6jVMFXco57DZSCW
	 BiSHcn5q6QFNw41Ib6dmC5BA30U0WcCKzfyUH465nMXG0H+XGJVvI72dCI5DsYh320A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rc5ivXsE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CCA606A332
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rc5ivXsE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34F91F000C5;
	Thu, 19 Nov 2026 16:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105443;
	bh=1pbHZ/UD3rUQYraKB5VVEpOEj7pJU3t0iXhesNJaed0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rc5ivXsEeR2w3rU7JQDOz4iYCapl+O/BWbDN5F+XKB/CZyCzHDR0p2OzE1xPA64pU
	 yqWSTHDyMNnNLsGcAwgSYVknFBOMytGmp5OjRnaU1obcOECQrfnNp4pv33gAhfLZgX
	 HLw8G0q+9/i8UVyfBQqi95WAo04ar003E70hsfsxMF2aJPLsbSuXcyIhvrym62pwrl
	 JlmynBi15yUTStZRK5k86N9TocCIqcgRbH7hB/Gkuq3hk3jjfo5x3W5UdSkSkQsCEP
	 asD4H2HnsN7dlNcFXMZWsaA8i76320hsbUdZjcs2JVAB8uWr6/PoWGQSKYxof8RJs2
	 d8M+hLS/MAcjA==
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 Samuel Holland <samuel@sholland.org>, Coia Prant <coiaprant@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
In-Reply-To: <20261102015236.3844843-1-shawn.lin@rock-chips.com>
References: <20261102015236.3844843-1-shawn.lin@rock-chips.com>
Subject: Re: [PATCH v3 0/2] Support updating the PCIe3 PHY firmware on
 RK3568
Message-Id: <179510543955.1370333.11289386216403807541.b4-ty@kernel.org>
Date: Thu, 19 Nov 2026 21:53:59 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 02 Nov 2026 09:52:34 +0800, Shawn Lin wrote:
> The RK3568 PCIe3 PHY contains a small controller that runs microcode
> from an internal SRAM. The microcode present in the PHY is not always
> the latest one; with a stale version the PHY may fail to establish a
> stable link or come up with other issues that are otherwise very hard
> to diagnose from the host side.
> 
> The firmware stays optional: when firmware-name is not described in DT
> (older DTBs) or the file cannot be requested, the driver keeps the
> existing behaviour and runs with the microcode already present in the
> PHY, so there is no new hard dependency for existing boards.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: rockchip,pcie3-phy: Document firmware-name
      commit: 3b93911c3e311584e01e5ceb7f2cde8b77842bd6
[2/2] phy: rockchip: snps-pcie3: Load updated PHY firmware on RK3568
      commit: 8f7b319cc91e61ff9144bd9d72df4d508dbf5e93

Best regards,
-- 
~Vinod


