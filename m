Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA24E35C698;
	Fri, 31 Jul 2026 03:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468284; cv=none; b=rUc4h6tYNHM8Nyn7f4lkuq5wNCu06Y02F8jTBS7KDgdbY6xBkKxSmukbBUvUTvMIEsVZ15eoS1LB3E9ASjmbl/FhWcdF0MZb7Kf1FoFCsxQf1CPr7H02cNaBJk6GpwuJtLFy6SWV/Yw5aYnUmLk1tV3PgtShdrZue3bbc7ZlJbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468284; c=relaxed/simple;
	bh=5ZA643CIuYXafz8OxB2666C+iR1Lk6yF87duoO7rG9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgm6mR0DtLuBmgmyFmCNc5Sp3GBdx//RCH3IYBKjq72E229TjNM0ABUhxj8URZGsE2ySzR7DevXuaK4M0CYTmbhY+w/iMnIv4TKmzxb88hAIneiAat7f+OlqVhovITp2KrtyMEbd4MJhcO+Ph7hnRu0nlAgCBHs3W10+FCmhsrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOF83IkW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOF83IkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E33F1F000E9;
	Fri, 31 Jul 2026 03:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468282;
	bh=FvUf/krZTp7zHz3dA0Zyca2EOfnItruRX9+SOpd70GI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IOF83IkWlVGzI+NxcAIHxx0NALt6wIpjtRXEjtxFxDs5qQEfR7XYUNoO3D/8y61IH
	 jciJvVahMsGDwjheUyPjPIpbDewFYEadylZvnssrIzszRDtDjy+5mJ6WTvdjgmr1CI
	 p7DJpTmfR2gfD7eVvDAHLXo3TYq7zxYYyg6abQw6QGt4MSumHAkAsIMGkOTPj25rZg
	 HB3H0GA/5w28BzCZZCA09k1GGK2U8Akr8b8VRArDPZVc6sNOnz7ysd3hU6mAHcEllx
	 BRCtp/yM0ja9AghPBO7YK9mWypPx4tZ6SHZ4F/6WqVvt8MmkuatP0HQoLA+cVct/jc
	 Sb/A3pxfGhd4Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus frequency
Date: Thu, 30 Jul 2026 22:24:15 -0500
Message-ID: <178546826828.316815.12437493742724964968.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
References: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Jul 2026 13:48:44 +0200, Hans de Goede wrote:
> 1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
> to 400 KHz which is a more reasonable default.
> 
> 

Applied, thanks!

[1/1] arm64: dts: monaco: Fix CSI I2C controllers default bus frequency
      commit: 1c2935b75f78fa74ef9cc37d95c4f734cbc0c15f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
