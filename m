Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375B430C35C;
	Tue,  7 Jul 2026 01:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387661; cv=none; b=Zy6iQAGRIu/3+1viORL3xp6RO3Ez2+xoljNfhS9AFq80Pb78xO1b79A6mRLgnK3iCiWPlczEB3Ni37+zpkTfVvk9GKiorGpSm0fO7Ceb26GBmvK5zebCu8FzMW1aPpAGW1/GcBj+K9uQeB11ByNPNWBkHLgsMNQ6egLao9FiQlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387661; c=relaxed/simple;
	bh=lKikNrtn2777NWOdi7L/a9lLw0ZwNS1KP78s50iyAn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QIwDHAyqk0PIheVY4LHIQiiooY70eH+cQ2C5osjqTlsIDHMtWY5mWj2py4AKN/E9sTM/G9h55jfnoONOrnyL+oEF2THeI7QHnJPy1G6L46PDl3geYmBA2NVFSTjXZEMUCKXNk38Lwrko3brOjpvO24WnDfBmWzOYfxrL0ePhG68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVhezJT/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVhezJT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3EF1F00A3E;
	Tue,  7 Jul 2026 01:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387660;
	bh=8T7mAhMd2hZIAwS0kzUHwDM4YFKtP4qsdivwQ61CtYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VVhezJT/gCAwKzjeyiVeMXaUaaAFWLII7V39YuVlLH97mC07jJDhrvyE0tWggS+jm
	 lN86TgeNVcU+8RCEY7cptdZ0AgBMDS2PTbC/lnRHzWoll4J8UkE9w5TXd5isoQJA9q
	 y+E7h/W/mLz29Z+Y95dLAXvM2cVOJfDqvtlqde55QtLP3fdxhRSsqihURYpwK4co2E
	 ggEhsNIHuVcoA1odtukQEp/PFxD2xM6uAr2p2AE9baQycHwvVk1CGV/+IWYMkChNYr
	 tsh8HLNHmxlLuRf5mcpNVGfmppmCdYSeYhUWPimKoaPt95MaFPpM9KErrXUOjbbCHQ
	 AglGREOc0t9Hw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Add missing properties to usb controller
Date: Mon,  6 Jul 2026 20:27:22 -0500
Message-ID: <178338764547.1558388.6699989052444946976.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
References: <20260702184440.442037-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jul 2026 00:14:40 +0530, Krishna Kurapati wrote:
> USB controller on Kaanapali SoC is capable of switching role betwen device
> and host and also is a wakeup capable device. Add usb-role-switch and
> wakeup-source properties to the controller node accordingly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Add missing properties to usb controller
      commit: c09cd72be7fdfc348ceecfe414ff9698bc3561f3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
