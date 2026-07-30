Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55AA344036;
	Thu, 30 Jul 2026 01:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785376550; cv=none; b=ptXcN99eOvTnNV86oF+ofkX4APQOE6TtOTQrw+YFAL9+wjiLRqrRdtDBAwyhYRvOOgLPpXS7wWQ5Df/tdJf8RTfnTSu5nixQfRvnHnp/9j07XzMX0uoilDiE78KUJsPsfU0fDrwPNIEvJ8d4an9qvKPAvveeZMPSXe5gkl6qkPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785376550; c=relaxed/simple;
	bh=hNyN7x8iVD27PhKNutfk4pSEoFeMci8ntQJANRJAy7U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jWq5dTcJDLFbt0nH7MfSnwj3/6NN/LfG4pzeNGqcfsb5Mjl+NORx1gG249fTmQRg2oQ6q1dIsCc8CT+NdU6rdG4HkhpicIlQTMzFt3noJnQMatyLxPO0pvp7F8JhixxvYZ/AbUbzJdCGUrSV5x/ZF7PvMPmNWQvZ1uJUddriWU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5Qv3ZAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5Qv3ZAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C211F00A3A;
	Thu, 30 Jul 2026 01:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785376548;
	bh=eINUcJe9e11uDyYEl6Eco8bxbPXpVwvs0GXxRlGOlc0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=f5Qv3ZASai/sk2b2xua9PF+FJg9iszkDBqQ1z8q8k28RhLbK5xxVZksfE241XE7eI
	 Z6603ewHS7sVMZivN0f3MXdbvC6OPDn+/lBYRl8Z5jlqo5DKDYJtJNrbdsraoVz0Md
	 5MXqt/Xdz74Tjdt53JjH42ik2Jikshmemtg9wW0LBZFn3edPRuRxb0MsVy9l7Pfe06
	 wOsSIHw4ona5PDLaltzzK9u/KCimes5zPX46Vaqok571xp2oo9w1ugl1Tfk/FjtZJ5
	 FnvjoSsa/LO+YBo2bBaDdlJw9sY0OjIOXYcXKPz96AP9FxyFb1zrBrprA/i9avzmZD
	 3m1l57yRWor2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate
Date: Wed, 29 Jul 2026 20:55:39 -0500
Message-ID: <178537653467.67965.5833816759757321877.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713125837.727632-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260713125837.727632-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jul 2026 14:58:38 +0200, Krzysztof Kozlowski wrote:
> The DSI PHY CXO clock input is the SoC CXO divided by two.  DSI0 already
> uses correct one, but DSI1 got copy-paste from SM8750, which had same
> problem and copy-pasted code from SM8650.  Wrong clock parent will cause
> incorrect DSI1 PHY PLL frequencies to be used making the DSI panel
> non-working, although there is no upstream user of DSI1.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Fix DSI1 phy reference clock rate
      commit: a3ba349af8e1bb7e0efdcd2dd53d69282f18478a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
