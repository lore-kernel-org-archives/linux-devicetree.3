Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608242;
	b=vKbWedL7Gjthi62KOwhbw7ZNWG5ih4U57sL5G1F4CQSKPpdoPtCb0kNNpCRcMhIIa3qt
	 yPG+MoqSbVfSVMkWJ2LFYAWf8NXRDLTGXy3U+F4hwV9tF56j7SL0tESMIAz6uuhVAKEz/
	 hf9+xv7TH5kJBHJnccQ5iySSFNbGHUXGDX1zROKhmx1bRsOoYgVvO0hqqrTe/hKw7ncMk
	 nM5ULnLVe+4mEr+U+sEAuQ7wbL4QOvtoRkoAbkAvWR8EWIdx0IWjLedX1Iaxoa83hAeUf
	 lfJtazqHk1bRQI9MPmITZ+M/StrYW91YEFyk0lNjU8aqwVFCr4AxK56b6Z5RY1ECyRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608242;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=j7oozhXP7o7JHSAq9seMPaxoR+x+pTI3aXKrd1zOlgw=;
	b=inJ2hQVqXdeUG9B4L4icvO39VU4Z/XBDpO96ChOq9Mxey52r3CAF0RrLy89eEHmXuNgu
	 yCfutjo54f3zbQf86m9WCHiRLXGNLqogd6Pt9PtGjGjyE1iAHeTaeQXJ8lYy1xB9s4xwF
	 MCHtORV4L1vOeshkcKaCRteelfijdugx0ovRuWP1cWIc84ybnjdQyUAQIgfxbPcuZA6F+
	 Wkj35UgEX6cU6eygS6tuGZ+BIjF9t6CIxfYHYWYvEwThFgsoJ4xhS6cu7QbT8TCpdsUHo
	 fRBWbPRe0kM0r2vogYfIiWrtbthxpzQNBntLlk485oBCOehjZB58qdeYCEe9g3KXqhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jxbVNSeL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC36606A31E;
	Wed, 25 Nov 2026 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jxbVNSeL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E931F000C6;
	Wed, 25 Nov 2026 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608241;
	bh=j7oozhXP7o7JHSAq9seMPaxoR+x+pTI3aXKrd1zOlgw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jxbVNSeL7KM5rmUQJ3KYbgPsXoY9SwfaKOy6WulxUVchAKgCQjtz4KLtUhqddFJ40
	 OPgax1yt+sC4l96bi84v//2DqifBOtKrjtVW26KcOP6yZh1ulGmh/FZkJtAdu+seJe
	 G/E0HrsANHccKroHhB3RtTjZ3/NRxIk+iQiuFzYVgfWhIWklRRM6F7UcpB9jHMQST0
	 9GOTPhsy0iDGQEWbT57UZXwsjCIyRdHVKUkFzaX1Y6h4Edrvy0R5Yp9/OtzHtjW4+O
	 Lrblvw9GGrNnfiFuQFeD/Ado5fNfmfCe8If228+Qgh7wyviMubGSNLyBK8PA/NiiR4
	 teB98pxq/PaeQ==
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
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: qcom: document the Lenovo
 Legion Y700 Gen4
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
 mitltlatltl@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261125091309.124354-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261125091309.124354-2-xiaqinghuan@mail.ustc.edu.cn>
Date: Wed, 25 Nov 2026 13:03:59 +0100
Message-Id: <179560823932.84329.556031734688243707.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-25 17:13 +0800, Qianhui Xu wrote:
> The Lenovo Legion Y700 Gen4 is an SM8750 tablet that ships with the
> lenovo,elden board compatible. Add it to the SM8750 section of the
> Qualcomm board binding.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
