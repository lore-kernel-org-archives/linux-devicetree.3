Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DED37472F;
	Fri, 17 Jul 2026 03:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258614; cv=none; b=aRdxepI+UmaZw6QRN3YEiWGx5RIBNb+DtIpCgtAUnN+7njHjgpuP1K+EIZomOd52ZWFMbRKqLuTY1YBU+hcD1L9SDiOf6yFPwZDvrBlc1ryvrBlnigJhE+6jYg1Vy2ulKhEraCeikJGFP6oNafnVJVwD7Vs4mjNQmRquLrJ3tDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258614; c=relaxed/simple;
	bh=avYVlncwf1oYpbp5S4zFZVmKdFw2/OKOUl00tovFIRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7ac8kMiDm69XZrkiCamPWVQ3elv1k5vWQsDpsn2CTuy+JrdMhuOwV9NiMgLVm/pmPo398m/laAiZtyp58+kVSgwvC63HwrjqdNg2/UJqDXtyaOzI7TyU52BCLz5e+QDo+anuXQ7fsNTzGIRTxpzxlQqTFOhdJXznhwu/eqLK3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc9z9uCZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc9z9uCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ECA1F000E9;
	Fri, 17 Jul 2026 03:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784258613;
	bh=mg1lOxDj0UuYWtFFnn0rnObUzFJsZMLbSuRKelWl85M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hc9z9uCZ1yhM8TI6gz25pznMY+ndxH/2ixf1oR53xQH3JtXrwkHnM9R56bEX6OOob
	 WK8rUga9e2maV5xtCgLwFdN+5bQ/TwQMcayoWSDb/Md8fy77wgy3xocv8tSUlrn4iU
	 9IYIMH9PmYty8n1CpAoFHi/ZBxkOxqTYMXKIsEif8gVFCEbdaeKzYzOzfawnZUTxT6
	 3u781o7nfmCULgbt7FupiovrSmZLGSD/jxgiHEOPhU3jsWXPkGRCc+M9am6B3MzWm1
	 obIxWS+b6F3Cm8JuyFwtZKoTqaxsJtbQbJjqS80uOAX5NKi3EoAovX1QAflpzIef2+
	 WBEUpC95xLiBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Enable touchscreen
Date: Thu, 16 Jul 2026 22:23:23 -0500
Message-ID: <178425854598.1084804.6274686639393427870.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
References: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Jul 2026 13:18:26 +0300, Abel Vesa wrote:
> The Eliza MTP uses a Goodix GT9916 touchscreen controller connected
> over SPI.
> 
> Describe the controller, its power supply, interrupt and reset GPIOs to
> enable touchscreen support.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: eliza-mtp: Enable touchscreen
      commit: f61fdd70f112ec5226f7adde3c29cf7aa55c6a42

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
