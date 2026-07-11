Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1493C9EDD;
	Sat, 11 Jul 2026 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788057; cv=none; b=TyaWlsIuhNa2bRh/+Ahfn42tUUjQ690TKdK0/MrsSUHiQeUDoIMPQbqbAGp5CB78dyDRgS3y7ciL7QoXqcFyBUPyROwOKtkTK1Da1k7SF/t0vH2k8m8Ae9PQ0gXjpE9JcTjH3hJ+5khrJ+fKhQebpVBTaUvzHno2LN75o0owO34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788057; c=relaxed/simple;
	bh=pKnBYKLyHuSf6ETsbZ3BteL3TvQpQYOhO3QY8f3bkw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qz8BI3Z2g/TXJMJeaYMm6WuOq6fYUSexU67jkS7bf7j5PrCY5OX4nGs2uvdOqC+aoyJ8Id5UxXyfH0SfTQWe5ZuM2nRmV0u/QDKJJu4Kbpi+oyuydfyqpkFm0P/91K/E37TEE1kYEuIhCqD3/GUUto3+4ZsFrKOLVqPrQ1r5rx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzfPEDoR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzfPEDoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5101C1F000E9;
	Sat, 11 Jul 2026 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788053;
	bh=kU8eAldMUt6BsxSC1s1flabEKxNcK0QCEFn9gZa0Cxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VzfPEDoR2W4YKDB+Z3cwXFJ7WVkvy0WZoya5EnwkNzrHapNrGf/0kazq2g1N6YOFI
	 N6gcd9IbbGt7WS1/cZvElgqKqW052NEdYL7XwlGk3bkgbP6JU42H2Rso05yeb4PB+b
	 SuRD9uDwOUsxuEXj5pmfRqDKsrLTL67mayxhD4Wren9xXemSklwC05ldMweBpiiVXj
	 jIrVQfnE8AeZQ+l83txCSJMxwNzW/4xW7/3qEItXuOsutIaPEVb/c5tlQ6/wmTYD4Q
	 kE8hkZnOZ9FyZugQkq6OZuGk4onPYzonIvm7efmNxhqVss0E74G8osASL2/5OKASDM
	 0BcJ/z1TH5O7A==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Konstantin Shabanov <mail@etehtsea.me>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro
Subject: Re: (subset) [PATCH v6 0/4] Introduce HONOR MagicBook Art 14 Snapdragon device tree
Date: Sat, 11 Jul 2026 11:40:39 -0500
Message-ID: <178378800441.138068.1778239842219741466.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629154812.9066-1-mail@etehtsea.me>
References: <20260629154812.9066-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jun 2026 22:48:08 +0700, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 Snapdragon laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].
> 
> I'm using it with two external displays connected to the HDMI port and
> DP<->USB-C (over external hub) as a daily driver.
> 
> [...]

Applied, thanks!

[4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
      commit: cfe9b47ef18bdb737be480f3e539e9561ef74078

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
