Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9936414A17
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347498; cv=none; b=NB+HPQCkLauc4uFEjEZSo7ogmdGjv+ZLhU1HuBPWFd2GZ3COwjoZVD6IJwU7FaFKubWNc3MMD8F07U1TBUDReNYwCyQ7Q/ajS03/LS/Qy8XD0MIqjqOrSHw+X5/UOcO0fFNLsA2s3RIsFdKQj4C8WbzQ2ADbI5WDXzRP9rbQmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347498; c=relaxed/simple;
	bh=XJO1vjhYSDeWBPkg3YYnGzb0GcDDrCEz+T4jTu9R6eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oY4zpo6eExFzGz1fUp5WlNip+GT5BWkZbCKA7LFWhBdEcmq7Zx/vetoGm0pKS9LoXFS65r23MBG6e/ti/n18Fx7gVhmFnYKQ+KxH2wNvcKG3B20rqwGye/ydn9FzAR8Fd/6iGDVfgRArQD/LMfj4w6LKJ40kwdva4Rgr4Gh25l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=FfWx4cIt; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="FfWx4cIt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AyaK26Ptgx390jYMKP5UA2BOwNGHG3d3gScBpsx41+k=; b=FfWx4cItWs2s5UF6Tb7NER2JXE
	4G+cDPXLCh3zJxlwkKb1jrImRx4bf/JL0EtnVQf4VTI0b9l4AoIYVD6VBsww1PSQt5y118udmBv1f
	Az5ryLSO38wnBLtHqDf7x7EQrnXMbsPZx1Eid4qZd3+Y2OXat0ndSjXhw6K0PWWnhC5XSmgJxKR3k
	gnQ6ie6kDaRlGI5i/Ah8nKGa/I+kj0ZcYSJijpC+K0HowVVeYLxntEnC63BDv8IOq+N1wi8TWdKTl
	nsrZwIQckf74kmAMnHZEo+V0Avu6/S8UlfX8b/5upeYji/8peAK0mw0n6SXQ1DHjIPNkirZmW336+
	gRvRFQvw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Correct Device Orientation
Date: Wed,  2 Sep 2026 13:11:16 +0200
Message-ID: <178834747215.2268650.152877514658857375.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828205331.78185-1-macroalpha82@gmail.com>
References: <20260828205331.78185-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Aug 2026 15:53:31 -0500, Chris Morgan wrote:
> The display, touchscreen, and IMU are currently not oriented
> consistently. The touchscreen is 90 degrees offset and the IMU is using
> the default mount matrix which is 180 degrees offset.
> 
> Fix the touchscreen alignment and add a mount matrix for the IMU. When
> the device is held vertically relative to the display hardware, the
> touchscreen 0,0 position is in the top left corner of the display
> (next to the home button), and the IMU reads the correct orientation.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Correct Device Orientation
      commit: 0d170ee38e7a943248082cdb4b3e40b45a96e2f6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
