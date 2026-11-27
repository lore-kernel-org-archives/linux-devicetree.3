Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776964;
	b=uoC1lu/CPsELAVEafHe/nlhIp87PvsLDtxLYGGUaxelQpLee7QSBzDfOSplyIYn+rKIR
	 wjF2d8k/NRpKEsC83petLRwgoWnZVHBE7R/1CZ1y+kzgQ2Uv6PCvrRXuXdsfPZdAMAgAS
	 oB/VIvuQLbIvXC1ZOrk0N3ueOTVaRJiP3ANnxT5nRKtWY03WQGkNrgCObaOk81A2FZgdx
	 /Pp0iOwyBPG+yW107oIv7GJStGnG4NV/M7pCe/qWQVFiytEAWRUXvUz39G/6tSypZDdEF
	 3wcrCJZASX5g4gSeMu8hSXfTwQXGbsS7mg1rxUnwg/Q6O4Gq32IwXkd3tNR4AH8Xoaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776964;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZlegVpC4N6/+DVa9XykpigNYuit2LZU6A1aITfV+CFo=;
	b=IFYX3RbxSUFTQ0LUXRH+L3E4DybKzHZVgaNOi5IselVZomtHyRednVxLH7j5YvEBjgPD
	 w1KadTrWEnpNfUvH7uUPSbxx+ysMOK9p6/PP079OJIxI3KCSjnhvapvrcEkYGoWWCtLuI
	 a2OC574/OVeb+9Vadi4a+c9364PnPNeYvYoeefJofqfUeSKTyytG31CDbpzoBXY8cxnUh
	 pwaa0WjVEUemcURUIcoa9CAMPja/cFe3x421uHNgW05qO1NFXN5RSPfzCCsTOfEV5XN9J
	 pYe0nckPesduXbiQ9E3woNaS8gF05DTbPyIo5F5Pt3FwH2WCD9K2zd/ZdapsWLxqlAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SnoD6zoT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F4606A31C;
	Fri, 27 Nov 2026 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SnoD6zoT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341621F0089A;
	Fri, 27 Nov 2026 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795776963;
	bh=ZlegVpC4N6/+DVa9XykpigNYuit2LZU6A1aITfV+CFo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SnoD6zoT5DtXHoebBCaOXk5dnNGkPNYHPT1HRJWuuFhbdR4XpY93ug/4Gq5M8FFrN
	 RLYY42k7RBR8m3r+XFy2JpaJ+RZ+rwdHraquLB0kt/emxtwdYX+bbxVk95X912+pwq
	 YNckXLfN6Ep6DIrJTVjZ7zch4E3C9C6REPgucdlDjskd9jxpgXGTxUoxVs9KYEVmEn
	 RQO+s5CutE/ZRQ5MnHxn/IM5IP9OyIt74hi5OupI9t5hhYIFyQIn+7huJcNjkV/iLL
	 /9I8a8cuOeHmEJ7sSOKa6uFNwOH4IHWRGg0+TZAX10nKk7ZvLfJX9/XNUTEU2+2Uwi
	 dsSzx4j6rw4xQ==
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
Subject: Re: [PATCH v2 0/2] phy: cix: add Sky1 USB/DP combo PHY support
From: Manivannan Sadhasivam <mani@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fugang Duan <fugang.duan@cixtech.com>, 
 Luo Liu <Luo.Liu@cixtech.com>, 
 CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261117083434.3414417-1-gary.yang@cixtech.com>
References: <20261102082112.2306326-1-gary.yang@cixtech.com>
 <20261117083434.3414417-1-gary.yang@cixtech.com>
Date: Fri, 27 Nov 2026 16:25:55 +0530
Message-Id: <179577695532.3421.8058975724074009117.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=mani@kernel.org;
 h=from:subject:message-id; bh=nQgG+FcHfk3RKk15uM6aPDgBtFBZFTK+R8FuOdfx2EU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWG+tZ0DzfyeE6LZq3Ollpps4poHntGS6zVri
 6cieyG3DoaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlhvgAKCRBVnxHm/pHO
 9SCaB/0QJA8FHipnJ95yVOBHp69LW3UvgkIeZhg5eSq9UaD4QhZwPoXl9N3B88zeqm9YiQgq4ju
 YdR9S3ADS5fa0M9iLKDDdHve6YPHPiXBVQjmY+1eqq614mCKHl6m1IfhWGmpCYjfP+lRTvDP5Ct
 XuYEaR2ZPTI4bA7R5i0bjkSpwBv+46FrLFAyEBrDrqSu0r5GKquGUA+FNsMEKmbvIOApgSLLcGY
 YvZnHL3VIfmviMb+6HREGJKBwFfK9GT1W7kZb2vZTEzpIlsRsjqQcwR0vKH88/E/hmYaYWA8Kqc
 a1bhnXnj4wYnMYDugM9AwO0oHG4Y5+zt3TnW711HugfIkIHE
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-17 16:34 +0800, Gary Yang wrote:
> This series adds support for the USB/DP combo PHY of the CIX Sky1 SoC.
> Each PHY instance drives one SuperSpeedPlus USB lane and up to four
> DisplayPort lanes of a USB Type-C port. The USB and the DP controller get
> their own PHY through the PHY_TYPE_USB3 and PHY_TYPE_DP cells. Plug
> orientation and the USB/DP mode decision are taken by the Type-C connector
> driver; the PHY consumes them through the Type-C switch and mux API.
> 
> The USB and the DisplayPort controllers and the Type-C connector are not
> yet described in the CIX device trees. The graph links and the consumers
> will be added together with them.
> 
> Patch 1 adds the binding and patch 2 the driver. The SoC and board nodes
> are sent separately as a follow-up, since they go through the SoC tree.
> 
> Patch 2 builds on Luo Liu's "Add Sky1 DisplayPort PHY support" series:
> 
> https://lore.kernel.org/linux-phy/20261102030425.1957585-1-Luo.Liu@cixtech.com
> 
> That series creates drivers/phy/cix/ together with the PHY_CIX_DP Kconfig
> symbol and the CIX SKY1 DISPLAYPORT PHY DRIVER MAINTAINERS entry. This
> series adds the PHY_CIX_USBDP symbol and the new binding, and renames the
> entry to CIX SKY1 PHY DRIVERS. It should be applied on top of Luo's series
> to avoid conflicts in drivers/phy/cix/{Kconfig,Makefile} and MAINTAINERS.
> 

Please do not send new versions as a reply to the previous version. It makes it
harder to spot new revisions.

- Mani


