Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F83F4830;
	Sat, 25 Jul 2026 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997167; cv=none; b=sowtdekfGleqFEq1zgQZBr7HNr18bGWA8e9KM+xbu+oS64noxFWMISalKl1B+z2gfXl8cVC/aZyWNuhLpwad52Zd4MKXwgvbQgxa/2Rfmenpy38D4hsyfq5fPWRl0WsXmN0bmcF2yv/cW23baj1sJeCp1f9rJtkyS8eafgk5YEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997167; c=relaxed/simple;
	bh=GYG5bdiB5NkbEfZCdt5aFo2i6Vzlq2OFTV4HlNtgRik=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eGxiAgv0vsJOMf+l70CwZMKbZdozGY6uau2TJDVXkE4A6tl723oZR3DzOvOWT3gzWIRQTb84JW5TVbNqBMeq1W+wpMDHNhWVP/uqrt0bWFd/6NcWqFNcZRwbr0mOZk/u0YCZ2/yBLDFd+Bvrxupvrn3DNVefb2/7GGmOOsFTBtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Blh3Kg3c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Blh3Kg3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBD21F000E9;
	Sat, 25 Jul 2026 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997164;
	bh=PbuOFMkRxVms7r3kOq3uKHo3i0x3RXBbHFMyv0ZkPOY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Blh3Kg3cpyk2cVpsB/dGUXJYZFf1ZXEnLLQqr+x4JWAO2kprTrUYGX9rkH//iAqaf
	 mr1M2s0Fif4uPhmA49xKX8Vh5J7k21ZUzxbOcnKoKUdqs6wmt3T4Lt7BfiB1qdMdAj
	 yHiYIxnSoywZALOls02EXBZpD9twbc8Ukzk8g65OtRn+vp5h1+tYARiKMUn0pEm+xp
	 jaBf+bHzis7jZ6yuZLrDli1/JnexlgKGqRkmfYcdQReYBBb0vPi55Rs3b4y4CtoC6V
	 02Wh26942jtBEDpXbu7w1hQNrxLMrdGtPUN5UsfSRf+AqsS8hD57KGZz3A1KHbXwhp
	 9BOWVAjfpfj/g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: arm: Correct indentation
Message-Id: <178499716080.107055.11425228685012031040.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:32:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 06 Jul 2026 12:19:43 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: arm: Correct indentation
      https://git.kernel.org/krzk/linux-dt/c/14f816138bdcb0e0c00f4b82be75d0485af22b30

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

