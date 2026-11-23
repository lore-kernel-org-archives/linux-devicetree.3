Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435753;
	b=vKB03CYiI2KKtdAKXKA6jMYhUCNdRjE16EEptH6EnPswTLHtqQzL4wuz6gRJ0B2SKwVO
	 nI2O9OJ+594c0teN3Xqxv73vT2ulqvwdJQx/dm9RYbSTelMf3PwhoQPsAF6WzfT3X9E42
	 tb2ShKAQheSnY55bnfRBBHej+nI5q0PNF9/hf8+7jvGrTDev2ER6ldpvr2Y2NfMROWiV4
	 j6neHwVO/7IXBa+fynKtLZLb74U6oM7Lie90+cQ5Lj0EAPNOUevMunTX2DPyRGeRDMiir
	 5ueu16MKMu+pjGTymPffjxwPqFjr3rj92Wg/0AUglORxxX++LsMw+GjjuppuDp8DpHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435753;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jVlva3tLXdBvj0xTe4FKUpeZOW8lUXKWogIklw4JJwM=;
	b=2WcoOK1swM24W62TFa4Ansiw/Bm+xVx78WU1+ycAgwjRFt8vDn6x8fX+CQv4ghH+Zml8
	 SfmhO1SwhhxJ0SFbjj4AtaoPaapj7c1iJfZAwlArAGL1SQjxlg4lYJQUY+vuYzEB6O1YQ
	 jsR/MZPYBjQDyO+DaXIy9Xw1fT5yq54mYz2JlRMRmgFEI6xOq9Uw16OPfVxg8t+CxxC7w
	 n9IM6J1yr++8i2G0at+I/M4Iph+blntaBTinXzEeZU023wklGqkKK+vRgO4iwIcW/uKxO
	 J0ZjXJmOvjQxQT20LupTgvUMDio0VN6dbNRRotaB/CJ5nnJw6pt5ZHkQiXX1Ag+Y5HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dk2QAjiR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689C8606A31E;
	Mon, 23 Nov 2026 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dk2QAjiR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82331F000CF;
	Mon, 23 Nov 2026 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435752;
	bh=jVlva3tLXdBvj0xTe4FKUpeZOW8lUXKWogIklw4JJwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dk2QAjiRAqck4u5mgcf43nHan6L+gOBuX9pht3YrjJTiNTsU9Zp1iVx94SEsBM5wt
	 ELbvLjdSGKZSLvTL6UAhw9MMMH247X6kI14+OIKt6kBsgbBn4NpNBKRA/AUnwdw9c4
	 KzCpgReRLOEfXyzQPS0VRCbjaw+RiI62FG5hD9hu/9j0QXNRHDOcyTG5+IyDvN6Upo
	 HwaP0VL+MyB1O8afnqzeAAPVyFPoOEPVJ6jEJV0BQKfFh1eSBp4ENpoLrrqJKsNU+i
	 LJp++Z/x/IEO0zTGIZDswSK6OFFbSUlHCGOpQJug7tXCr3Z9UoNWU4g2L1du3qONWK
	 Xw65fHkoW6bRQ==
Date: Mon, 23 Nov 2026 17:39:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Dominique Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Byron Stanoszek <gandalf@winds.org>, OOHehir <oo.hehir@gmail.com>
Subject: Re: [PATCH v7 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI PHY
Message-ID: <awQs5JgFZko9rTo9@parshuram>
References: <CGME20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb@eucas1p1.samsung.com>
 <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
 <b6dc6c36-9ce1-49dd-bae5-245d983610bc@samsung.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6dc6c36-9ce1-49dd-bae5-245d983610bc@samsung.com>

On 20-11-26, 14:43, Michal Wilczynski wrote:

> Gentle ping on this series.
> 
> Is there anything else needed from my side ?

Can you please resolve the shasiko issues reported

-- 
~Vinod
