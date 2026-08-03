Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602F38839F;
	Mon,  3 Aug 2026 03:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727475; cv=none; b=AGptpRr1NwRFAPC7sP19UF1FUAOX9SDUDamBzKw8MPEgM6C1zPLr9UvW0HiQRH7mbISmpZXLf+UlDCLPsPic0gx6BXxlS/D1bsGAu3kWvqC2owUjOWE4H5+Qr+zoPAlfTxQtsmeGyDkXZeauBrjiQLAvZpFUJjGKeDpi2p4VPC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727475; c=relaxed/simple;
	bh=CDanET+eIxB3b93NqkEXIEhHYk/I32W+SWltSRW+BCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SFm99lCNG82dl6K4aRPX4Q29V5jWnX8hBOCXHQAhfYMbx/w6bJbbjo+75GiP11V02WssBWg5Y6cwnHPkCEkfLyqE6QY0srqafHp/6iCyCr1ljQ1xy00UurzK1eudb5Q6v9ySt/EeTIvQJqZC1pd9qaENqcBryejvvgxfBx+qYDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DntbEyES; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DntbEyES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B36F1F00A3E;
	Mon,  3 Aug 2026 03:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727473;
	bh=yGHXw1PdPPf7FbG8Yyuk6qAr+fwTDwoS6sm6kmhhg+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DntbEyESoccS0gBzV8NnY+v7NDwQ83GdOFyVqMFruzog8rkh+DyurEBMXTNVhekzA
	 elDoWGnkjVvFmS0PNmj1IlvcezWCXnPYi0pEPlczLzqkuK1uGDl00CZUvNBAlpYVpe
	 4eIGRZ38ZyGCALCodgks87R0yEr0LcYLDwBURWgm1maHPm2be3nhez7LffclP6LQPb
	 sd2REjdO0qV+1Qq25Ku1vHiedfzrXTOfGf7GF5aTR55MVPuCFEzh/dRsdrwmHEUxXA
	 Dwma7RjufqZoQKySLbQS5PCLHsLJ5rctNFlInFrZLLii/hPw3I4G3jeDlF/dIMhtee
	 kxHvfCTuA4/cw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to 37.5MHz
Date: Sun,  2 Aug 2026 22:24:06 -0500
Message-ID: <178572744562.408250.3011948892531028605.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
References: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 14:27:19 +0300, Vladimir Zapolskiy wrote:
> Setting CCI supply clock rate to higher value of 37.5MHz allows to
> program the controller to configure its I2C bus speed to Fast-mode plus.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Assign CCI clock rates to 37.5MHz
      commit: 2cc1076501887746f20bdcca40ae703c8c13bc7a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
