Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C02480DF7;
	Wed,  8 Jul 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522653; cv=none; b=EknwW8iLlK1E07OWxj1/jThwKNA9K5cdP/MDei9LivgOd/hLBbgg3jyQ29ZVxyO8fC2uALCMly/B7uw7xiWGL3Yd7Py6g548eZk2f3zmnbnn8yny+v8gTI66EtOmFCIvSFPKLvKSwDtdlbSmJdsc80fSwLwh0oFVPctYt0U3584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522653; c=relaxed/simple;
	bh=wumjCprAjjcTWsnWT10UXJXwin9qKCyloFM1PN9YTl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s+kvxEBuQLy7/h/wICiFodkHIZxqQrg21k63gZjr8cahlQSHoKmtYVl22OJpL6OOaav8l8Dct80zReBh/n1GFMTX6isHuqi7pxgB1Ev+COB1hxSJCYdiMt6pWulXba5lf/TLoh3VfP7b+X1td7utb+IXvW6Cz8zbvNIhLoT0jwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll5GY6RH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll5GY6RH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85E31F00A3A;
	Wed,  8 Jul 2026 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522651;
	bh=Oqi+e3rgaS9iDop7BcUIQJVZqw9Ytj4N3F7TOzeOzQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ll5GY6RH//SWAfVG7wN+Y/hR5c3GX64w6+mBzr4QZON/kqTxr8sMZ4VY4HIypkAxe
	 n7vsmi4sPhZzcbv1yGy7cgpzGiB0fSYHrZOMZHYHlOMZOszdSkTB0C3NSZgbW4gkgL
	 D+RyVZxKF/us8GBXHutN1G3sqAmhXg+VQpiTb5EeOXnnJpWiHHkuNreVNQ2jmLQ2hs
	 rYrFOzbKjp+6sfzVdbQ1uWnlcsBJaEr9U+S2E6gBtvZ+PQC2RgyWgMbEN1Muf6yFV7
	 Sg0i3+ubl+mRFB00hFUXvqhLWKX82SoCgJQiLNVW2APaBXPCjv8m+L5l80p2TtkZT4
	 N+sp9BYdgyW2Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
Date: Wed,  8 Jul 2026 09:56:31 -0500
Message-ID: <178352261617.2235436.12290927660650329664.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
References: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jun 2026 22:28:27 +0530, Kathiravan Thirumoorthy wrote:
> IPQ9574 also has the dedicated 'global' IRQ line for each PCIe controller.
> Add the same.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
      commit: 0b967a82e7b3c575af7f71df68d56e7786ab533e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
