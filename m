Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449977;
	b=vUo+9uVcwDfqs1QWapB/hZO1FUu+xc92UBoivMw9q/Zm9tS8YfGKNwsudU/7Xng3XhGZ
	 ZqAZA5sIXA4DVZDajxTvYwFukMIGcVRQU+CQzrg8Hn7DBlRgYgD5Q5FfEvSkOVfSgGiDb
	 Q9n805+VqL7KPTjHoIA29hHeoXQ8qbCgVesm07PzdE5BsdIqCXA96bMaaA8yKb7qa9DmJ
	 BiKINytomFxrYbSscE57EUiVeJUrSiB7xZRyvo/Ju+BQjLRGPo2x8belWtptT9xRHLob9
	 KhpSjhyFt04tpcKhphjqgIA2B2EEL0/Zj72Qnw2MQb9FYF82bqW0CDTP/hoJI4R5yMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449977;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=0aJ5NufMkA0oD7AZywus5LCK/c7Fmr+e+ufWOzcP874=;
	b=Mxzf7Tge5oM18foQtlRY7d7f1qSDmrnT9CO0z9/VhLFHWCffUQE4/pr3NPSUMxWR3sYb
	 bCe98fOdEbLJ/QBZ7lCP5sGOeK9trVirnJTJRiz3pueZllf3oZbohfq1JdkynvODiMmAI
	 Xsy4pNSxrzQJpLQOTN8mT7VSq7FRUVfzot4cvC6UhTnOIHGWUJeFnawMD1qc8KsWrvnTo
	 sA8XwN3i3AWV9ObdQJvQiEEGTIDrRBwZ1Kikb/qaxFJCiEaOengHEGWXPuVgmV53dfKKS
	 SHEbf5rmbqJTE2Nb5oNQ9oH7iPtejMcezF31kjxKeQHgaIRHGOR+SzpCfzmVFQK/sKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhSYPe9l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA05D606A31A;
	Mon, 23 Nov 2026 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhSYPe9l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8AB1F000C6;
	Mon, 23 Nov 2026 16:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449977;
	bh=0aJ5NufMkA0oD7AZywus5LCK/c7Fmr+e+ufWOzcP874=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NhSYPe9lfkgnjIr0bn0lVFAu74Gql+ImttqV88SSuZvfqujeqgyPWhfkEFENt/3r1
	 ljaq1vYZcEqdY0QaOOL0xJ4faDwMsTQWFhuc/DLEh7F5S53TUi76y7pRy5/2KBJ/Do
	 R/AaittP7TCCqVaLAbG5/xg6ENb9TGCtEL+H/GAXsuuZOXoKaJz8LwIN0Ih2Sz6fQq
	 SG7WQ/80to5vqtqJf8jhdVTBv1i7WdongDEm5KiOJKob1tyqgknECSUJa6CRaEcXdy
	 YQjXCHSPa4xaMWqbotNc8S9Xm+c8go1+kbdWfwbW/aLlsp9GODhkQTb7wDZfjNFCul
	 ywN2gZCgmj4mw==
From: Vinod Koul <vkoul@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006162807.2843858-1-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
Subject: Re: [PATCH v13 0/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
Message-Id: <179544997369.275844.18034015183144679963.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 21:36:13 +0530
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


On Wed, 07 Oct 2026 00:28:04 +0800, Coia Prant wrote:
> Changes since v12:
> 
> - Only write pipe_sgmii_mac_sel when the property is present, leaving the
>   routing unchanged otherwise (Shawn).
> - Validate the value in the driver and reject anything other than 0 or 1
>   (Shawn).
> - Drop "default: 1" from the binding; the property is tri-state, so no
>   'default' in the schema is appropriate (Rob).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property
      commit: 0451ac710ad1627f48116204f6fcf3aec72cc87b
[2/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
      commit: 7827b62741ea75d24b3db1ad01d09b6d15423a62

Best regards,
-- 
~Vinod


