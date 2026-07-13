Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4837C916;
	Mon, 13 Jul 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955221; cv=none; b=Qd+3RUf8tjn+ExpLEdwgDgVUGW5F/Z461BCrHOhjTDG5FFjRFnTiyn7JpSQHgifNcW0+3cQtZtyGyQ3jXUvWILNda43VV2SZhZViCUCegS11Du4n5beFfAXZijRs6UR3HMjxBxqOlIn+CXbrA3jrPMexRmCK5hrLHLaWai++CRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955221; c=relaxed/simple;
	bh=EBaDNmd7Hn3tDarktxK83tpMv1iqvgHd4mHZxvjNTzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f22mi0KZK3qUAwdPE6v57/n9ehmzpzor5TpvpQs3tJe3zyLHlYrtp16h9apyqCtUf4TSTD/nSsOL43WD3FCou2vC9wpdodJ/c8X6wtK3SZzd9vZscS5F8BgOwr+LQzXCs4dr6LxXmAMgukjfl37zt72NqELdZzD5MYzqu26+vXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2bJuBmd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2bJuBmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532481F000E9;
	Mon, 13 Jul 2026 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955219;
	bh=zcyydug1SGybji9k71tXPpfpz6A3hgJ3Z4vNdSuzzC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S2bJuBmd6caPpTEWP90Op9omyEQVT7bnUbMvP4SnDBjeAuyAa6zy0fcgjYYkrOxUu
	 soM/Ihe3FNlJfamk4WP3P/AYxoE4bQnXdo82x8FNGSq4PaIhSiEkwOEa/onzdrHFgc
	 21FQzQQT9oTCE5QSVUMvc/vIgwzZhjuEe6FkczgoTfpzbaSGHDYsqGfHja2RF4yfT/
	 gQjxYmj8KoOrtgNKKaoqJemGC5I2qBMQRnctK4hFTf239z8cq9Xyw0++IMul5Tsjof
	 6dn/pZ+aNaeVbxeiqYzmRT4R2xL/ZVf49NC/yzmYbjWF1BER6bEgAh/6DX26LYI0AY
	 3Q25kZG3+f1cQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Switch SCMI perf protocol to use power-domain-cells
Date: Mon, 13 Jul 2026 10:06:53 -0500
Message-ID: <178395521267.422064.3583368839077096641.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
References: <20260508082729.37674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 May 2026 13:57:28 +0530, Mukesh Ojha wrote:
> The SCMI protocol@13 (Performance Domain Management) node was using
> performance/power domain, not a clock. This was using the older
> mechanism for passing the SCMI performance domain index to
> scmi-cpufreq, which predates the #power-domain-cells support added
> in commit 92b2028b00ff ("cpufreq: scmi: Add support to parse
> domain-id using #power-domain-cells").
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Switch SCMI perf protocol to use power-domain-cells
      commit: 1aa4513d4ba4f6f3d6e87a6e9bcb30139beb8a22

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
