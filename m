Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151863161A2;
	Tue,  7 Jul 2026 01:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387663; cv=none; b=Ov465hLy86bV3CmumhnbzAyRYRzP11q4NAS1yRHfLVK/X6s0S0acFa6QRNTBoQNY54O/cmYYI7tLxP4tMdmcpimU1mFdHGXq8t/5K+VW9xP1FV4c1uTV2+mq0jNs6IQ8Nbt/V845T5nMauxGs0YL4s9BqnUekfC0i5vqionnkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387663; c=relaxed/simple;
	bh=dwNpSMECq9gYVh+Eo6yucJmIIh57a4o7wTKks07Y5RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sf2uzY/mKF5PZ8NObKWVQHEg5GX+oCa1GFgIV766GAB7ISsOnDXgkMbgFFMfql8ypxiVqHkG4gqzz8kAKGY2MAWtL26m1q0p5qK9qBXyWwmqA5seyyp+3weLIPGD2BKjAIquNfA30ctZ1v87FzVwcEPvTeeTccfZHSlWYIY0MVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhVZLcrJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhVZLcrJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548A01F000E9;
	Tue,  7 Jul 2026 01:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387661;
	bh=3PbBPhtx9PJtDL0zN5XogJ97GElbZdrfIuaDp68YGI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bhVZLcrJwg9ZphUYQLdJM9q3B3K1s3M+Kw+jkueXv/vnemg8wUuthCuFRYEl0jmsN
	 wKuGm/U4hupmcdq7n5Xe7Dp/Fa6zpbRzL8VZ/XCpAUnUN6nTEcAnCl2Bej7p+sHkbL
	 DTYrrJnOGJpq/SLnpSSJx0JaWchHQCkBLH0NPgvP6ccIbPYzqklm8sE6n8DZDFGzgG
	 EdU3j9U6P2Z4mcLOpfPSzZ2RKi5PQHVDyG6hckww/Eesl+/kGBkteIXWn8OVzXAQGu
	 jX+w64UcYNDS8ZBEXbp/cFeQXafi3w74chvLOq0RLKfeiZUEwT7emjmhQ/Dt6lZzOs
	 m33bm4C80hEBQ==
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
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add wakeup-source property to usb controller
Date: Mon,  6 Jul 2026 20:27:23 -0500
Message-ID: <178338764547.1558388.12259202020411719156.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
References: <20260702184511.442129-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jul 2026 00:15:11 +0530, Krishna Kurapati wrote:
> USB controller on SM8750 can be configured as a wakeup capable device.
> Add wakeup-source property indicating the same.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750: Add wakeup-source property to usb controller
      commit: 2f57d03ea7b78fe24fe6f965d65fe1ff9eac60ed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
