Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29FB409277;
	Wed,  8 Jul 2026 14:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522662; cv=none; b=Z5z3XYHmQ8fe66OZCSUe2ecj4+GDqH+nf6hj+ApM6Oh8yBq1dCJpzl0v/+u4FFpgU7pA7lHoP13VAvafoBRvX4VJT83XPUACl6h2ndEUQksAuvOtPut/B+66Bg8ILTGvGeUUQS1yIPUq0Gi8huSuZfc8py+Iw/TKQ6WZ9zViQRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522662; c=relaxed/simple;
	bh=vwqGU/T15mmo6PbTDneM2EdEf1IaneXg2hCnQjbTik4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhrKpE+2zlG1Zz5cxJbJAcMXCfRk7gcZ2OyRgE19YDVvvlxM9+xv3fp+E+EY+LrdaCdROAMAIsst0H1HwTS/Gqz+87oc58rHsbO/0zH5Mj5py8HzvnKbfPFfctPlXGctW+5+Nl5EsOF7pi/NdCHYgtSU3CfilAPrFZah/sQuZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdezOzaW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdezOzaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073311F00A3E;
	Wed,  8 Jul 2026 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522661;
	bh=mGbQTLNsdqA2GH3o4N6Hc0dQr6ltnVnSxzUAfMQ8sgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XdezOzaWH/AGlEoByr46JpAXqgc1biqJ7UePDNLTaC2eCz7Hc8+zrSAtPwcPi0LKI
	 RIjpnzU6M7EW66+3bIqUW3p4u6N7Dw+n99njMEboSld1x67xk+ZRZ67GzEqnAG6C/x
	 BG2LOyanLFOIGAZ5S6YSTMgqYjVefPqZZrnrgzwilYMLvEPTT5lnwDH5RMEDSIkbOY
	 diLYdhAcrjygkH7xxgoMN/6OQoRWzlPMDdOYnqIuXvN3X31lSgnJJwce7NnB5aCjzz
	 joDGqk6Oyzq3O1yf00kpPrgXchvNSEpskiKMhVAyBVl66Oihj5wuWnSXKKSBTWGAbS
	 +CWb4EHPrA1sw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: monaco-arduino-monza: Add fan controller and thermal cooling
Date: Wed,  8 Jul 2026 09:56:42 -0500
Message-ID: <178352261594.2235436.7436176077831520820.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609091206.522331-1-loic.poulain@oss.qualcomm.com>
References: <20260609091206.522331-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Jun 2026 11:12:06 +0200, Loic Poulain wrote:
> Enable the CCI1 bus and add support for the Microchip EMC2305 fan
> controller on the Monaco Arduino Monza board. The controller is
> virtually implemented by the onboard MCU.
> 
> Add a new active trip point to the cpuss0 thermal zone and
> associate it with onboard fan cooling. The CPU subsystem sensor is
> used as the thermal reference until support for a more appropriate
> onboard/skin sensor becomes available (via spmi-adc5-gen3).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-arduino-monza: Add fan controller and thermal cooling
      commit: 07d76600a3c59e01430c9a793dc646941be423b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
