Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592465;
	b=PXGeRGRDvBYI3jNUQBQQUiDqIbvYFOF6uG5O+nnUqeGdXD+UG6zjmnM47GPpE3nWcg6f
	 gsszXNzjnw5KCzy8GtJ3vKYix0rCtQzHK3iOEXX23MVHbjU9+roloa9eYQwE34HF5Tx8G
	 anOrTrnEe8ROJN0wylYMIBuLQmzCoSXQi7VqoaBWqBHmb43LObBxm42YUhmux8Tx0wPvv
	 bj3Tycqa8qDSJG8Id7yfbLJrEsWfTQRO1N0Jfjv0B1ZzkwCr0+Y6B/bpf8/TzXtfGTYGc
	 ffCJGx6dH35B9fCV7Tloy2aZXvzGBwF8mdDOsUwLww3TR8wooIdnXSfgNeLGbRe4mDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592465;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=qzlaI5M+ETRsxiBn4jEpaxr3LhkDBBe4J2eZBN8UmVY=;
	b=yXK5arTXE2xhFRFnV+ks4A3kF8rBBtWlcH2n5yrlUSYDiN9NAAbfGH0ElJ03sM54CP5T
	 hNW1NMSPk8oRtS+/7SIvQxuQc5YbMediHLJRpmj9E3VSED0wc+DxrWJr6LUwH9Modr42J
	 RtuhseSKMFr+xqwWxHRfEsjnL/T1qQxcDJZtxXaa/ggIwQfPWwkRxlpShro+HFOKGnwug
	 YEWqDfCvdRh+U6PytL7F3iK/RrcsehxkHco7SXtBQKjesaObWI+vOmbvMkn7Uz1My0ju+
	 vVvc+APRohssPwmKTVY0L0D5t36H1rlNrG8ePeJEdrVYEeZsoD962ksrhjyJ7Z578sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfhxJecb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F3B606A31E;
	Wed, 25 Nov 2026 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfhxJecb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB971F000E0;
	Wed, 25 Nov 2026 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592464;
	bh=qzlaI5M+ETRsxiBn4jEpaxr3LhkDBBe4J2eZBN8UmVY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QfhxJecb5e99+42ceEafq0/AOPWgjFeZMWj/9dLc3FQsAqTc8A4i7CEHPY5X/ucgk
	 csmSohahbKUNkqWPnhuRCZMwxnCLhPa1+MeUxSlD9bbARAIhQFbkZxLueBdcVDtFs9
	 coTTeElW+SlMO2Z6KjYRfrUPHy+UHjnkcNkst9lJG3Sl6TF1Ru2bmLF8/00MsEUTFJ
	 66Adqok3gXuRfktQMPJUnEwMyENI52cB4cv6G0hxhah+1XaE6Qh193ldzuN/c83syP
	 j9/8m78zStLeRLosyhI3fyaWD7+hNrLU8qbsKsHjoar8sSyC151jvownKrMvcOuG5W
	 vgqDa4klCNFzQ==
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
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: qcom,ipa: add
 qcom,sc8180x-ipa compatible
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robert Ijtsma <robertijtsma@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>, 
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261125-qcom-ipa-sc8180x-v1-1-48a889acbe6b@gmail.com>
References: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
 <20261125-qcom-ipa-sc8180x-v1-1-48a889acbe6b@gmail.com>
Date: Wed, 25 Nov 2026 08:41:01 +0100
Message-Id: <179559246149.14607.2485247869587675507.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-25 00:01 +0100, Robert Ijtsma wrote:
> Document the Qualcomm SC8180X (IPA v4.1) compatible string in the
> Qualcomm IPA binding.
> 
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
