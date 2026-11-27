Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780185;
	b=UA0bCR3ARHgWleNTbjk17VOgpPKlGH2aXm5VjA05GMxmDbPfz4xwuVGo6Rpjo7+zAkqf
	 97QgKLfe72YNARifjHKWLUoTT5Dmvnx28Gd9sIlA1OwSkv0jBUwJg20I0AjeIXLcnaqpl
	 sXgMOwWiHywTMCYvfxSgqOYwe/4n48W8CvSGSDuI8nPVOM9jVTjDaRe2m0x3s44OfEMNU
	 vTFbM/zVEolDbttZb1ZzVLuyb+o+FPAU+7V3o9mwIy0gO51LCMUuNT16DbQ9K0Nh/z/Xs
	 PS4h629cG7SgMS9mJx56NwzctnkSPNFeF0o0QJKuUZlqsr14+gkRWTUrC1+68unyz7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780185;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rbv+ZRY1hTgFi9Mxq720ChCJPJCjxkl+y9N2215YurY=;
	b=cdybdUPDutzzV3GKGvLp0KOYTsaVJuLgqhd4hA3DtaSK4oZLEa4ic3P0TT1PSvUxPEv/
	 ANiwMNq2Z+hoqklAj/nTLqH34vC0v/C9pYu/c+BM1IRicwfMTdW5DSxRXpLs7wrKFlwPS
	 G1ylM1ZV4+0JntQbISpghriHKF4H7N2gNp7u7WVtWSD/RCwpWeJG6c9LSvBhzN8MXkbl4
	 2KML7Ld1yaEUVnsJ5I8m6hdhLO1+56B5BO3svDLf/LVq9YWbT2XkB/CHLITF4uoXAK7AQ
	 rKO2J3IJtEusFQGaRH1JDFUAuSNyCRxRXr3XEaKX0upl4Hz0pRiXHEekW7QvfzmjnRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxR2vhDR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9B606A31E;
	Fri, 27 Nov 2026 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UxR2vhDR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815F41F00924;
	Fri, 27 Nov 2026 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780184;
	bh=rbv+ZRY1hTgFi9Mxq720ChCJPJCjxkl+y9N2215YurY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UxR2vhDRywY79DDAA2y0cedu5zYYZnFBdG3Ba60dbX0Kcqw5c9PTLZ8f/ncyWRaYN
	 +akFjXqC933cJSwv7ellA+Prq0zERTZFtE8WfDzetzpPXgd3fNanuSndGq9yeNcSQE
	 qrwpoAgEJ3snK9AkDKOQW1NaQHjTiCqRmlO859e4sUJsOO2rh+tf35R6cgCxgDRSTh
	 iQM42Fv7ej6+XwcgQ1Fm9lUCNHCKtokGJ1xJmU7DS8RCPwvCftXM0oqK2AHompRvQu
	 QHBb27sUvllo0f4HpPIhadlrkZPa5e1ZZjEymKcGfLL7/SXSlvZgcjVeWmbbmqmL5X
	 VA4LdRlY5HsPA==
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
Subject: Re: [PATCH v2 0/2] phy: ath79-usb: support the AR934x+ analog
 reset
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Alban Bedel <albeu@free.fr>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20261109040451.114135-1-rosenp@gmail.com>
References: <20261109040451.114135-1-rosenp@gmail.com>
Date: Fri, 27 Nov 2026 17:19:35 +0530
Message-Id: <179578017595.13164.12126141982607510391.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=852; i=mani@kernel.org;
 h=from:subject:message-id; bh=YoghiWzFJcixHIuszTbMYEyp9OVk+H3Z0m1P5peQhCg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCW5TdC9l9EDr+zJSIg8Q0ZCrgt3WrPfh+JgRS
 J3BxjuTs5aJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawluUwAKCRBVnxHm/pHO
 9WqDB/9JUiSmwgBQ94I2WV0UeoOrbHmW8u44q3Njrr7PENGP90okGCmNIpn/fHdHZPxaZkfBgyd
 csqLE2r5pvEt/teRhQUFchF2rcqXcEm8o91e0gClhw6iY9soTpw/cl4gXxhsMVoYuFiiI5B083g
 xhnxPkSff3CYfU7DeBkXi+iitmuCmDPCyD1MQS/k5f7ZLqZeYjmSpvv2rGH+7vR+aLaUkuPHY3r
 fm5P9ucZHbjV0qwle5wrQk1aMoL+cchK8sid5oEQ3UtJimPRXQ2OtxiSiyA897Zxtc6uSrUNH4t
 bzH5xdf8pMS4BdRM+L2HQKQrVwSfMa29pwOMypR+IaUfDFC+
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-08 20:04 -0800, Rosen Penev wrote:
> From AR934x on, the analog part of the ath79 USB PHY has its own reset,
> which the old platform code handled outside the PHY driver. Patch 1
> adds the optional third "phy-analog" reset to the binding, along with
> AR9340 and QCA9550 compatibles that require it. Patch 2 makes the
> driver take and sequence that reset.
> 
> Changes in v2:
> - Send the binding and driver changes together as one series. v1 sent
>   the driver patch alone, so it used a "phy-analog" reset name that the
>   binding on the list did not yet document.
> - No code changes.
> 
> Claude Code (Claude Opus 5.5) was used while preparing this series.
> I reviewed and tested every change and take responsibility for it.
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


