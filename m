Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449992;
	b=VetfWb+XuWQaOYSu2ewM/0nkwRyicEYoI82Ptgc8ZydL/oME+ynOIgiZSGrj+PdHqvvk
	 NDZLa3H4NCASZOXPSgZd0okdjk4fYx2KAoJJjziK4WDbGZ66TLiH9tbThGRPkpecS2NOC
	 LY+sOqv2JRCSQooC2yrUKq2F+xYDispMrpphf3tvvHzk91PMb9Sgj8nmC5n1T7x4z0AQT
	 K3yttZM/6qlIXCjGTtL22ie4qEEIsOSNQvEd8pXwmMozdJZkAZuQ3s0rQVwu7yZO9INwT
	 JmVKqk1JSDlWyGrmCJJ2UYZeVYo+gjfdXjQQW+sdFWlh24cjLm+cjhh4Gfs95kqqUjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449992;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=3r+hUQa+rAKmwXtdf1nQj3yrmAj5PM06tZTg7mvEGIc=;
	b=rwF+Fs2VwvhCsII83J+Tzr2PtBlzCmEKu01ClNvqey3qME2AVqtWr6192CK9fHub0TrS
	 Y/XdFRzVFgeCZvCfpZ0r9GUwb9IwD/x+Qc2IqSLWS4Z44yxFzmvZ5/GKMrhKDDuhcbIJp
	 irw6+4anHd3P4MCvqnRItupZhbsgSClJgWSdMCqT4z6UpWk4JVdTOPyRwrdZZy+V5CUFI
	 QzfTMm82ZY65GdeQlI/UKCrO1jnC/YzgIkWG0rR8GodPV5g2AvcFw2/v0MsJI378KAIT/
	 jEz7R6saaZ79VOJzfx4DswGZasdEvKevpySJUDWXiLnASpaGCbm8pA+Y4rBATqp1Z7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqgJ7d2v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B423606A31E;
	Mon, 23 Nov 2026 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QqgJ7d2v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A887F1F000EF;
	Mon, 23 Nov 2026 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449991;
	bh=3r+hUQa+rAKmwXtdf1nQj3yrmAj5PM06tZTg7mvEGIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QqgJ7d2vWDd1Bxz2cm7/D6YBpeuDuZd/TLwC9GimcjA4zKcJGl1TFB/vS1+nBe5d4
	 680Sp0UlADSTr80BWXvTIKtZf4xOcoFDPi9PqKdiUaYDQO+2GFvhhgZo5hsOYTx/2z
	 XSYwXXUI3jcy1H8H0TQStRsDaNUUn0X5JMJUTivqCkQJkUN2ph5ZZJMl/WQEYCuhXb
	 Ti1ZGej91s1q7GZaiFnb2qpcdw6+V4OWUoXHiRAaW/y1TTPoHq5yz0XH/m0cPcg6s6
	 tGVk/E8bc8e0nsa02ndV53bCs5XeNCTmh8E/hDar7mj8Cb9FJx4jHHxurNpDSRqxc6
	 jtiZfCJmWH6UQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Damon Ding <damon.ding@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Dave Jones <s.dave.jones@gmail.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261114083339.600986-1-damon.ding@rock-chips.com>
References: <20261114083339.600986-1-damon.ding@rock-chips.com>
Subject: Re: (subset) [PATCH v6 0/4] Add eDP support for RK3568
Message-Id: <179544998732.275844.17211132534453781481.b4-ty@kernel.org>
Date: Mon, 23 Nov 2026 21:36:27 +0530
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


On Sat, 14 Nov 2026 16:33:35 +0800, Damon Ding wrote:
> Picked from:
> https://lore.kernel.org/all/20261030064905.2248999-1-damon.ding@rock-chips.com/
> 
> The 'rockchip,rk3568-edp' display binding, the RK3568 support for the
> Analogix DP bridge driver and the RK3568 support for the Rockchip
> Analogix DP driver have been applied to the drm-misc-next tree.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: Add rockchip,rk3568-edp-phy
      commit: f634e1dd3528fe4341ddc7fa44ad448821afbd21
[2/4] phy: rockchip: Add support for Naneng eDP phy
      commit: ecf8bf37197560c0dd8222ae2dc8791b6271c9f8
[4/4] MAINTAINERS: Add entry for Rockchip eDP phy
      commit: 3f63ca7ce197c661bbe53fc808d0cec444b40042

Best regards,
-- 
~Vinod


