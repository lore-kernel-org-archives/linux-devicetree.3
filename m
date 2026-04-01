Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8B2BDC28;
	Wed,  1 Apr 2026 14:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052995; cv=none; b=GeK3u90OsZmKTlZj186lGKorbwuvTe9Y6pLYFotDre+L1ZIxDfgZmTCnR7Da1rhF65P6i7yanflMh95i1fuZQLuygXvSI3Lx5jNTUNYqpF+N7Ad10wR7UNvM5FUj8KcMqkz8EV8bIZUC02VqvisgRqyzl0supqGIMjz9PXy00do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052995; c=relaxed/simple;
	bh=l/kKl2NbggH/pZZmWsvlyPmIQF3xYezbfisa6juo6xk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Kd3Wmb515khImrs+boeRprBAlmN9r96R0yDjSbmU3nZSWv8pQxmBuU/DsSJDMUDcft0htTykaPRZ011E6pVSCycJ3OXqOQZnQL5uVeokU1gtv7l33lQN3eVexrXq5LwKCDZ/o5+AFI4wgb3rxeZ4uMpB6DeGqXFp7JE0eH/DKF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=co9Wldhh; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="co9Wldhh"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 254D025B54;
	Wed,  1 Apr 2026 16:16:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwdR6VfRREnd; Wed,  1 Apr 2026 16:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775052991; bh=l/kKl2NbggH/pZZmWsvlyPmIQF3xYezbfisa6juo6xk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=co9WldhhChMYGL0aGxYa7Ajvf5zeeUHeZEZPR23Vw45J63PCqhmu6ccCq6PfcNpVA
	 QcsR+dgG91m46cTQvk478EodHHFTqVXRjAhcXJPrU+cralUgEPgJ0+LojtLO9YSrXv
	 8/e4+kQ6mROpCmTMtuIBQIbecGtdA7MKgZbviC8j4OFfdrqjIloxMaBNF9VvnOxraq
	 h1R62jdQf90dkNJLdxgWhyuLDN96R/fH5RZgXPNpYToQ+0mmIKTXeNiV1KpzVCu16Q
	 8m7M1oHJv6OCuJnJO2X5wsqdgqZVDaotLZalLvpd3f+0qaRtXFpbWo6RXHYRjfkb0O
	 LnMH2iabY2mgw==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 01 Apr 2026 14:16:31 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stanley
 Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Zavertkin
 <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v2 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
In-Reply-To: <20260331193647.nhaej266v4gudrek@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>
 <20260327160638.15134-6-adilov@disroot.org>
 <20260330215033.ven3bllyw3jverfg@skbuf>
 <1884dee6134e1c069e9f68edb2fdcd7f@disroot.org>
 <20260331193647.nhaej266v4gudrek@skbuf>
Message-ID: <a01c9b92e70a7274ed56355fbe559828@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-03-31 19:36, Vladimir Oltean wrote:
> On Tue, Mar 31, 2026 at 04:48:08PM +0000, Rustam Adilov wrote:
>> I am personally fine with removing the "force_host_disconnect = false" and other
>> falses in rtl9607_phy_cfg but i am debating because it wouldn't line up with the rest.
> 
> You can also remove the other unnecessary initializations.

After thinking about it, removing other unnecessary initializations would be out of scope
for this patch series but i can remove unnecessary things introduced by my patch series,
i.e force_host_disconnect, and specifically things inside the rtl9607_phy_cfg.

Later on, someone else can clean up the rest as a separate patch.
