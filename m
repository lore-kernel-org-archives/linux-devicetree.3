Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B73C3421;
	Tue, 12 May 2026 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617420; cv=none; b=BZ0aTODkFFXc7sdWCXkfiqE6TWVB91gMGdJ6NRHiQyKOnICrjdYFnsHrtzlzsyRXQLIlBjHevSj1FDmvaudyzTq7wUYsRRTijEO+43jZoKj+lBLXZPiDfgYsAn26PtiUgD8ddhW7VDg8EmrtljLQrWWvW3aV9ocpPrz4xOJiHVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617420; c=relaxed/simple;
	bh=uWKoWg2MHHVrhNzRzzhhqvXKIGmDj/rq8549qtD8Ihk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sn/TouGdZpUMzKSHR1wmEC/cSjjb/HQQdSvteXc0lequYeQsTkRAgkqZE5tm+hw6dAYWueyEJVKy60AHyb3AWiZQU3owHWM0IYkwBg2Sl74US61f5RYBYD4mW1XdjNmOE5oNc0cSCu45xBME1iG+lxICMcycrG988DjrVQg80xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UURlCEaR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UURlCEaR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F86BC2BCFA;
	Tue, 12 May 2026 20:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617419;
	bh=uWKoWg2MHHVrhNzRzzhhqvXKIGmDj/rq8549qtD8Ihk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UURlCEaRGi1Tl/KXKFQz41Ewz6zqxoDneciyCBVE7u6BQCMLEX9vLHezs9O8nC+kI
	 YXUjBt5PADXDp8cg8OcwCGsKk/nalneWaCV0O2hAFIHA34Syhx+8geINWpL3yDTKhw
	 xNC+vWkxfhoAay0+VnRFMkqWJlAcbiWx6+S98Tt0S35elJqtFqNOY8kiNaW5yoftOf
	 3EwmhGmtC8ePnc/2r2OrAe+WjLcZyP0QuWUMtcVcGlZnn9C7iVbUQcwCNaDiDaoEL/
	 0z0XiKRJzQaiJOg85lQHQ/PLsrLzJRkpQ7EusSb8OLTVBT8qGeRk752IA6ZxKbkgiM
	 dNi9tsOMF5pyw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9650: add watchdog node
Date: Tue, 12 May 2026 15:22:50 -0500
Message-ID: <177861739385.1242344.12122044208596913937.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511-ipq9650_wdt-v1-1-1948934c1e12@oss.qualcomm.com>
References: <20260511-ipq9650_wdt-v1-1-1948934c1e12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 May 2026 22:24:54 +0530, Kathiravan Thirumoorthy wrote:
> Add the watchdog device node for IPQ9650 SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9650: add watchdog node
      commit: c50080d313d35a54c7847536ce9e27ad62546251

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
