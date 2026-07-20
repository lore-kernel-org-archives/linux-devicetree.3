Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD00445AD2;
	Mon, 20 Jul 2026 17:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568080; cv=none; b=imgoWePxOctQJIk6J2cs+dQ1BBSCoaKo+abKiuvWs4VOA32WqrDBnVO1Fz3hKHF35l17qGZ+i919VLQIS3DsIfAqvshz/s/XO1h44J+4fQIMEto2I5RbXPR/jmLI7wu9JYOOHNAHKTby7lePuBis6kNFBoFYNE7Ys2oht5TxWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568080; c=relaxed/simple;
	bh=jTvzxh1HUdgVOPSwwt0nPJ5VWDWNTt68PiNBrf+qopw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDxDN1Z7ZbbYXRkLF7nPavF9+TqgIxj1vv+lkDZvyfeAUZfiZlTOAS/5TjOkyM9kKnC2sK58d1sTuu5NJxDmEb8r6PJf2nvRT6Kj3MMhwXKlh8IyB6B4tExEYmFeL+UjeA5CC/LFyPEaPyhWL0d1qJOjGwlAK65NEpnit7g2Sag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2vnBw/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2vnBw/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1561F00A3F;
	Mon, 20 Jul 2026 17:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784568076;
	bh=VF6sTx3VME1nxTHHRn1gJeR874VVVgDxfC3yt9/5My8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=m2vnBw/pLgizr1TRwS9qTtCEOE2Za2RxFWOsNhuiN9qEvN8Y0Xt9okd7ssX6LE5JV
	 tyO8vnq+ifPq3gnS14vfwqiWw1QA9KFyaJDm+BhS6ts3sorFh8KhQZUV86PnrNsfiZ
	 YQmmfRIpx45gcpLTgqkp2/IUM7Are8V8LSCpzc25LwdGiEtJVV1D/wl/fZYueWssCf
	 yGRsqWbcNbW+Q35D8zzlISyeIwq9zKuspeCRUQEdExiVexfud02NfiYLOnCmS8xlgX
	 orRFan+Qr0DQeasru32oS7/Da0V4HnTwJ5IdsiEdqasO3iq2DGqiCvg4Ii3rOlBSzU
	 LgjdZhzspyJvw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Date: Mon, 20 Jul 2026 12:21:05 -0500
Message-ID: <178456806282.1732507.13250578640647790945.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609141608.354186-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260609141608.354186-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Jun 2026 16:16:09 +0200, Krzysztof Kozlowski wrote:
> According to user manual / programming guide there is no separate PCIe
> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
> is marked as the main block with additional sub blocks for each 4-lane
> phys.
> 
> Describing the sub phys without the rest is not correct from hardware
> description, even if it works.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
      commit: d3ca4252d21ec85ada29689f78d13d4596749e3a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
