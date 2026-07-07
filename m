Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153D3B6BF7;
	Tue,  7 Jul 2026 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453488; cv=none; b=nYI8Z6AdexBqldoUeVd9Qtp38QOYCROVlh+0aPtvG8ag7V51+odF/XdQLPwBkAu6Vl5Lm222m0qcPQRfOJPJhAgKRqU9+zUSHYKHOGXVsW63sDZtEKMcF3YxSKfzZrqwI7A2UKeQCQoiOkpcT4wv29el16Nx9KJOD+v4pl5+u6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453488; c=relaxed/simple;
	bh=OjM1dIpzhhegsiKikn5et/JVUcGRuXRAzMRdH+7j2Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fC79nYz6eK/BtnmM+zlCHOfg/6ATJB2oVTgMb6j7KGoyMfjTCWfFEIpYvadLzteWWhrvTJzQE2WiBuNcTwUWxSPoRnmHe/esxiBKpW1c/qgV1dJ+IGzbvfww9EarEFL1GMXmbiHYbC3hNCdivCg3iGzpjhQKKChHpGVY4oZEkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Rj8hJ71k; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Rj8hJ71k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9f9Cvj2KSde9fRau9nU9jeL+1j23YWkk4574iWOOJXo=; b=Rj8hJ71k4borJmrIC2KxsgFdTq
	+VkuMIyJ6mIo+3jqjiZNA9vj5VGc5v2xlHI7v0oVYGk/TWj9fGWhUGNy3UKtTJjaGC/yedWsazSuf
	1tGfQtAO7TT62+yz+ZrmAlhUUIy4iIEQZAN9rzIZi00Zvp5SD652+4/PbLI14CCzaeWVkEoEZmKey
	mGeogaKNdETJ5MEyzvhplzHnDsxIVQe1nsApHqVWNccYqsjMTtLdAlPA8SsxwF5ye9ZfJ6xuM64zH
	JA+mMrCO82B13/5Z7VuZ/l4JZ29th/06P0dbjAc5cyBrZBk0HEMRJpTcI6USmfumsHpXKkQ0fyatr
	8XSfkNJg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] dt-bindings: rockchip: pmu: Narrow definition of reboot-mode
Date: Tue,  7 Jul 2026 21:44:32 +0200
Message-ID: <178345345848.664858.15922395581813500396.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Jul 2026 12:58:50 +0200, Krzysztof Kozlowski wrote:
> The 'reboot-mode' child of PMU node must be a syscon-reboot-mode one, so
> add missing $ref to enforce the validation and disallow other
> reboot-mode handlers.
> Defining 'type: object' is on the other hand not necessary when other
> schema is referenced.
> 
> This can be further restricted to match hardware/firmware:
> syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
> a subset actually makes sense and is valid.  Provide negative look-ahead
> pattern to disallow any modes not supported by the device, which
> tightens the binding.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: rockchip: pmu: Narrow definition of reboot-mode
      commit: c63037c69a5173dd87efde82bfa4c339adefd72e
[2/2] dt-bindings: rockchip: grf: Narrow allowed reboot modes
      commit: 39eace59ac826465fae0788d0a6b304ec94f9944

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
