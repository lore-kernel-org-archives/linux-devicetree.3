Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3F4D2EDE;
	Wed,  8 Jul 2026 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522642; cv=none; b=eNiqp5RKQKag3nwJQLJYpO3bem920To9ligZq4GFSOhg6z1cTGymZ8/fRKTl6OXDh1lRmyS3Qo7NBn8YymCvCundgOqBXUzwydsdaJVorkRq15kbwgc5H2+t58NRau8pGFTCsAh4OUrKpBYIE9oGeVv3VqjT2x/0Os0bs/wfrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522642; c=relaxed/simple;
	bh=C39h4EoX5rwyA4ScaxvfnwlTBOmGN4/JZovrS/bVO2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pockPj8UAggczEMlqsCPprWFCZJ1JS9WKhY3SFLh9xl47w4PM28BLOHunBTthkFRfBR6rHat0oC2Ma84oUzB+sWyw2CU7NgSGELMqDV80Fgvb7KrjHLIjXz2s23LdCtGtt8xBv1GuSWtT8zNd7KjWaMdh9vcPoLFdy40Bvx164o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inhPbYKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inhPbYKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B621F00AC4;
	Wed,  8 Jul 2026 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522641;
	bh=S0HXdlCKUOPyCD1hYmyUZ4r9fNQqrS3h+fV68YzAwBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=inhPbYKea8diHFadvyybo30wFczOSxrAAJXgW52adwsx/CF64kUyDAREDQBMzliou
	 xMVjeJ9qBUDbl5aLTtgd7b5RA+k662PBsJrML+ljWL8ll0kb/UNKuiXT69ju7hc+OM
	 J+yFdRFxBdrviCUnxjF+zWLxE4tbCvkijVU6RctudANKFD3HdbFCWKjA//KPsN2zLZ
	 e1miiUqf97oy7FSUxoHOBBKXaSwX7yVcl8AK6zu04nv7rWrnbe06AA1XPJnjae9YCz
	 zjRfH7IoGB/ebGYbIwsdVxFmAldlvde/09jqf0mXrAIzoTaVi5+X2UHOaxySGfz0kJ
	 +/Ydp8chZKqYg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/1] Add support for Microsoft Surface Pro 12in
Date: Wed,  8 Jul 2026 09:56:22 -0500
Message-ID: <178352261633.2235436.7857749386725006103.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609145906.40854-1-harrison.vanderbyl@gmail.com>
References: <20260609145906.40854-1-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Jun 2026 00:59:04 +1000, Harrison Vanderbyl wrote:
> Changes in v4:
> Device tree:
>  - Fixed some formatting nits in the device tree
>  - Clarified NFC only available on business sku.
> 
> Changes in v3:
> Rebase:
>  - Rebased on next-20260528
>  - Removed ice device tree changes
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Add Microsoft Surface Pro 12in
      commit: 447f8053b1849b22bbf6f71a2cbb1a81fb931d48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
