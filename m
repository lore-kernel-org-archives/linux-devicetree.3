Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044D378814;
	Mon, 30 Mar 2026 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886514; cv=none; b=uV3qSSE2JKZkLjNV1tITqgArBZI9nEWXyKgT2ssWf6A3FGnSrm1OKkskpqJ/5e7KtHxxCUo4xDzxyeQI+4rx3tYE9lF3o9Vbcn8sCCBAFD0IIrNHKI7wsev84S7Bb34IrQYOvBL2c2fr+afP3B7ksjdCByORqxkhh9Xmdx4RArY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886514; c=relaxed/simple;
	bh=EdOpxJovDyjdlExD1y28OWTPI4DYUhC6fBBfsNwnHag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VPKQ67IuRNpLwWdCNwsr/EadhTGveLjz1ve6+BVduq/VfqX1ozc3XZ9M1Uq3iUfdZl/SVcXJK52EBBaljfGUEiOXsErqTuwEkmYv5ez2fT63/lpcroYvipvRL8whtU4FMjdyodGFNQfWCJptVLRxWTxgJoP1HWNHV0Giugt33KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtRASXSK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtRASXSK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226DDC4CEF7;
	Mon, 30 Mar 2026 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774886513;
	bh=EdOpxJovDyjdlExD1y28OWTPI4DYUhC6fBBfsNwnHag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NtRASXSKpW5wmL3xzfgZb8S6JxKO3UmSnC9abfUTEzm7uGOS+DTaxoGD6AtqHbhKK
	 iIKI5gMMo+XEmWm4W87RQzK66tYeZthb7mg7EvljOq1S8eXtAvAaXW1x4Q34fPTwUT
	 AATmIOd6nLVXiB6cwKU0db2w8wehDAfC/PT3ClNVTisldzPhq0BXCFrD/9cuHlraIg
	 zew0t/uFZLRKYuqpWkRD5qJyAXgFEcFxa6HzZN1AgroU2AfuSHohvvkfbWvolmO6aX
	 NNr6dBJVGxuI6DTjyr5aWBUsOvqXOaom7LfdLO3SPUrtQ/y5pcPpEVrmVISt0/ZrJe
	 JPjO84seH9NOw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201 and GL3590
Date: Mon, 30 Mar 2026 11:01:13 -0500
Message-ID: <177488647749.633011.4177279204840350077.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 23 Mar 2026 21:32:39 -0500, Bjorn Andersson wrote:
> The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> interface.
> 
> The Renesas chip is powered by two regulators controlled through PM7250B
> GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> The Genesys chip power is always-on, but the reset pin is controlled
> through TLMM GPIO 162.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201 and GL3590
      commit: cde64269eeb8099b4405aef8b19b90892a05352e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
