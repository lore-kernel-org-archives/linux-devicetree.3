Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522976;
	b=gnTqsHo0wUBp0gke/QaOxA92uPwSU5dYL+3709IGY0OYpV6vBcJdzWD/Q4HZqCrsynE7
	 tATg/lDJkSgm91mjOUNjuaFPH9hJxCk1HLblM3HjTXRqVqOrL9J3kEqmr+J6i98GWpiHu
	 Pg7aU6OfTq4UiKRlg9eW4g7biC+G39uxT/pHfzbN+ktzsIZCzJ1MTFPd2oyUVRr4FRlG3
	 zrqnf05kYe/Y++J41Hr+n60wa+Z4bdsE3dtT3c+2lJWJ1aGrrFWwm5h2qy3u+m11dKNqT
	 ewLt0gB0MhK6VZIYjb1t6sCoSmMp8QuMrVEWol8UunCQwzF3cuGczVlSd62Zmnj8HxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522976;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=JB7XXVrcqNhiMQO53OXYzOYPpCwhyCEvNY7bBBKJcTA=;
	b=sc8FXw7BwGzbDqwHvxIbyIidIDR+sYIDMsX0hjMAVWpVdE66RNvUPGqXFk9lB6+GmoBD
	 KTu+LaBE6XsoKumZxjCvO5EolSd2EnS+RVWJK7Pi5F50OTELEZNE1+9IGsUgH3k+/ZiZl
	 7RFBoYcGvzxIroLuGQMMzj7mAErxmp3qAJ+0brvp3QcFd6ogPicZ4ostUtoEQluyEdq3y
	 qxg62B/hUSVRByU2XOhnCoPwcf0g+NiH98SUMP3oxz6O4QBwgEZ6lCuUrd+swg/6RmIcd
	 E6fN7ZIukFSVIX1utNgFVCkyxTZV4B6FbDvd9m3hXHCKey5T8feicJ5zOFQHbiB00iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNaGY98f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74965606A31E;
	Tue, 24 Nov 2026 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNaGY98f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCED1F000C4;
	Tue, 24 Nov 2026 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522975;
	bh=JB7XXVrcqNhiMQO53OXYzOYPpCwhyCEvNY7bBBKJcTA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QNaGY98fRgb98Uz8ux0r5n7xu+AwoU73EeSruV/rkMHGFuQgHW3CRbFTzbHsVYpel
	 fCxQWJmQYDh/5rwVTYaRCaH/3HMNHPV1Y8husdoSyvfA4x4lbkbf4qe5zDU7dLBXdF
	 3KkwbbuqznP/Q8h74hO2NYwXjpo5coCnAxsQL8QII6sqPXK28A90ceYiy7q3LKuTH8
	 nsuZ7BiqPu/VuQDK958Wz5ZKcSZiUbSaz7pHG5xrUZQtIK1l9PlQjDtp2YiAdCf5/z
	 cBL8vo3FP/uI0pzMk7+5AKsr+lOTU7bgzp7yKf33qJFNxDdL894CNLbjrteD0d/pub
	 9nl7RGSh/WDUw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org, 
 Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>
In-Reply-To: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
References: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
Subject: Re: [PATCH 0/3] phy: lynx: add support for downstream retimer PHYs
Message-Id: <179552297252.405998.9355453865503403005.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 17:52:52 +0530
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


On Wed, 18 Nov 2026 18:31:31 +0200, Ioana Ciornei wrote:
> This patch set adds support in the Lynx SerDes PHY drivers for
> retimer PHYs which can be found on the board downstream of the SerDes
> lane towards any connector such as an SFP cage.
> 
> The first patch extends the Lynx 10G and Lynx 28G dt bindings so that we
> allow the phys and phy-names properties at the SerDes lane level.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: phy: lynx: allow downstream phys on the lane nodes
      commit: 5f7f673778dde3fca552cb7ad30b5f145774da3c
[2/3] phy: lynx: get the PHYs listed in the lane nodes
      commit: 9b98db3e56ded4e2990c5f1fb508cf45a78fb547
[3/3] phy: lynx: forward the phy_ops to the downstream PHYs of a lane
      commit: 3e10636038ee8a9430f791777f50f73c48afc5ad

Best regards,
-- 
~Vinod


