Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105457;
	b=sfnafw69WI74ZL/9RnY/O1ZCpugpBiYI/3MMp28ksTG26ipSHSp544poBRlz6vv+jVA6
	 /1vwpQqA/MVa5PFAW3l+hGp1cA+NKhD2dMLF6yCVl6PuAVhe5FuPFzX8LuUDBNYarSoTk
	 ICD8L7x6iWj6LSDHW/ko0Jp0abF0MfHbgff7PzpePjkNMvtjLb9Hw1vtV7wyT6jLsBnYU
	 aol4ZTxLh/oWzo9xW00G8dkGo5qCXyCszdLWRIOJ4+TV9sYRFaQY1d1DFanjDtRfhKwIP
	 kfMlqW+SFRwG4ALMKS1c6Q5qsYeaZmtJiGcacgYGXjF0iI/ZleV9tXJhtk61abK0iXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105457;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=JLDwz9ycOu6YbPPABd6Tj3z/LQdgz4tnvknkVWOgRsQ=;
	b=lS+1JQpf65BGUgC5//0p6Ok186n6wB/IEtGKLU2FbsIgBAn+18tGM9B6kY1rrlP2eTVj
	 dE/FdGJe4H/lVf0FkQP+0olVq7ZBb1kgZpJxE4GxMhCq/cnsUwRGI9JxNqo3G3jHIlMfG
	 r+kEZb7TK9TOUCSVVmr7R7YAMn6wGhTgTJtZnh1nGs0fsMhtrqufhvJnmLu95LM++LDA2
	 013ZH2DJUCzdRDlAhnlF6Jej0wAbts2fZPfZc6PV0XxhcA7qyFpl8v2acgXyuvAJfasVD
	 tkmQ4es3QgVnGOwfn+G9cCOojFqravysH+I3fAq20GMZkJ5ow23yNn3Q3v+c1m5f3lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmrLOcUN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D45C606A326;
	Thu, 19 Nov 2026 16:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmrLOcUN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F2F1F000D0;
	Thu, 19 Nov 2026 16:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795105457;
	bh=JLDwz9ycOu6YbPPABd6Tj3z/LQdgz4tnvknkVWOgRsQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JmrLOcUNIdhcWji9htOEaYTUTjtKET7j3eWYLNuEK0sAfR8Mwn6y14IFmALE1Tz7t
	 f8Sc8A3Ts/rcpx1jDWQ3wfbWnvlkpvBOsyl8cy7UBHfzI8+8kwjjGTVVhY6jVhHljh
	 a4JJC6eu8K0zC3RI8099ph3HFaMQZSaeEGxJ8Nbds7Uc7JhRRFvn2aGtgtXJ0cON1u
	 aVDMEAWZNdS5DKQ0kyKu/ntQy6CthDfkBsVFDkFIYrhhtMHXSdDjl4DAf7w3IO/2aC
	 27bomEi/Or9kDpyYP4OKNsYRCxRV6d8LIkkeuem9sm0lPnoVPp8P1ucSOw6qqmQZpA
	 wdxsDO8axBDVw==
From: Vinod Koul <vkoul@kernel.org>
To: neil.armstrong@linaro.org, mani@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, gary.yang@cixtech.com, 
 fugang.duan@cixtech.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Luo Liu <Luo.Liu@cixtech.com>
Cc: cix-kernel-upstream@cixtech.com, p.zabel@pengutronix.de, 
 linux-kernel@vger.kernel.org, Wuyi.Shen@cixtech.com, 
 EastLake.Yang@cixtech.com
In-Reply-To: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
References: <20261116073800.2396894-1-Luo.Liu@cixtech.com>
Subject: Re: (subset) [PATCH v5 0/3] phy: cix: Add Sky1 DisplayPort PHY
Message-Id: <179510545262.1370333.17988639888921284371.b4-ty@kernel.org>
Date: Thu, 19 Nov 2026 21:54:12 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 16 Nov 2026 15:37:57 +0800, Luo Liu wrote:
> Add the CIX Sky1 dedicated DisplayPort PHY: the binding, the driver,
> and the Sky1 devicetree node.
> 
> Changes in v5:
> 
> The binding and the devicetree node are unchanged. The driver changes
> address review comments:
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
      commit: 804eb94ad72b4b896fde5c629f8f1b5f06301f96
[2/3] phy: cix: Add Sky1 DP PHY driver
      commit: 1ad6145fb8536810c25f8d9ee539a83b01296635

Best regards,
-- 
~Vinod


