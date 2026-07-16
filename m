Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EF3363C61;
	Thu, 16 Jul 2026 19:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784229888; cv=none; b=QW+sCEK6lJBCs1mkqrBCX17yycNBYtcisOq/nnHusRe2Yf3QEMrr8l0ZqAzLAtoEP5Y1lyM+/DK8cJDSlaqVoQRK3XhguKC6V/91q9PSg2Sr3vGhVDQY18arNgWcoM6AIfRtkm9egmEZXRG8kdqaWVgcIcK9i28PK/ZwG9fKR50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784229888; c=relaxed/simple;
	bh=8gglT/d34VWMhgKIy/jZZTN716nfO5QiILpLFmblXZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ggx2cH+KzcnqsfpC1GvltSyUMIeaJApsRS/Hu6mrdskfEVz2Br36c2yUShc+ZtGtZB4jnBnCLjxwohQUGqQHzQOYtLfkAmZFf8SwayF5ywmYjIbM0fdl3wp8fDLV0KnUJA90MtXRwWAua02SsjrlTqEsiQitiHk99AgWvNOe0Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=VMpI8zO5; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="VMpI8zO5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=syf/c4xtfCw6J0qQudHZ7XrmyO59GTZhy9GPg7y846w=; b=VMpI8zO5PejSNJcUCtSLfLMhEX
	fe0fBLLbq+OfIZTzY/pM5QLK4FL0MNVf5ef11MpBxFadwotDtU18xR+4PQ4f/bmEB70NdAXiny76C
	uwhheG0+R4P09lAQTWDM8O9QzLrnXE4WHrVdmqU0iQPBiB5EP2ix1Yh+Wmu7wxmDBAw5UwMkopKgV
	MhrqVxLt/sVDN8ERKtkuEl9WJnTXHGVSCKAvRdueitSbCEJBXf4NH1pdJa/6lP4u001aRL0Ykw9Ug
	p/rsdb2LXuGvF0ClaFNjjDJL7LyLopwAVOE9cppQW/CNCd1izPfDZRpppvjXXZy/AMDoG0cjMYr3p
	vOnEvjlg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Liu Changjie <liucj1228@outlook.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
Date: Thu, 16 Jul 2026 21:24:32 +0200
Message-ID: <178422977234.2335819.5634374946197621892.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jul 2026 14:53:20 +0800, Liu Changjie wrote:
> Add the compatible and device tree for the LCKFB Taishan Pi 3M, an
> RK3576 board. The device tree is based on the published board
> schematics and only enables interfaces exercised on the hardware.
> 
> This series depends on the separate net-next series:
>   [PATCH net-next 0/2] net: phy: Add Maxio MAE0621A support
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add LCKFB Taishan Pi 3M
      commit: 2df7f27058018463e1f38a6e4c53cf551130bc4a
[2/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
      commit: f35d9eebeee5268289f0b9e424a651907a27b575

I resorted some nodes, to match the alphabetical sorting
and dropped the maxio,clk-out-frequency-hz property for now.

Please send a follow-up patch, once your phy driver series lands.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
