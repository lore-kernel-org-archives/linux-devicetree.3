Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169438;
	b=1XMjg8lqeanQtXDRsx/VSMhPABwz8apMEqqn3it/LZ0zMEdnMU0zLvCcfPeqvlIHZEEh
	 FcjgxnFE24I83T+fV6pRFL+iVcSKQBzNCfO1mj3G4oZZcI+hVjAk4+e6qXFZfRo/Nqdth
	 VclvqCMyYrUp5c83W/ztCqtldLryjHqs+2r3xKc609/5T7hQzY7z5cxUiYyvXiGPcC28x
	 +XNb5uxRg59AkvTojFK4j/H5qE1CiZIE09mTLPWczUzfAAN1SOY0m7EArxYAVVdVN0o75
	 z8ZrhUWaopdQWZ6gelXPaq9xCqAImcOvH3brLD9LxUdlpe6dJD7OgFh+VWQRsT84Ttg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169438;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dTdrK8MuQRjPFiY73PZo3257dz4/IrE7dUKf2OP1v1g=;
	b=o+CzBPdz9/9hBzQ91Tgk+xarnSkBnBLAoo1n5AP1l1dbdZx4UqLu+xLWdXuRiDV48HSY
	 fAjmMF5ulJM4Upst80lkWfUHovdl1SYP8kpWMQDb8XAvwL/N32dfYML8BvQKpOqFMnm+p
	 1tqx10tbZsc+JAYeCI15Dh0iWixYjqPGxhipX927wMjos2shTM/ZaH5E1pqWtDiz4OVBF
	 hennRtaZshqof+Mehrw/89bO3lahBfGzzJs39ytwZxbKrFE9JO8Oej22tbxEwAiDW+MqP
	 u1FjMApVd/meeTLxPOP60FLbAC0IK29sN3+89mHeslG3oW9l6f3kEtN8ujgtwVr2VeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ernIW5tK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DC160759B7;
	Sun,  8 Nov 2026 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ernIW5tK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD8D1F0089F;
	Sun,  8 Nov 2026 20:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169438;
	bh=dTdrK8MuQRjPFiY73PZo3257dz4/IrE7dUKf2OP1v1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ernIW5tKT4u+uSest0gkGySuwkQNDbO1DgV2KEj9dQsonC4ONPRi/6rt/AKxXAqke
	 zI9kFmiQfttjTHEYh/+C69r63sT7k5Fi8B/nk3TxnoiKNgvfMNxBCSSKr+OXOMmESJ
	 4QxNhLZHS8tOunRWWoCYNb/QaoLKAK/5aR4Xacx9HBmQyPx3aBvZqyzd9L4h+T0WDW
	 PXKeIpJv8eAjs94Hh0ccfAffSXNfvgqnKl3YO6gNqbbqY/HK+e2GrUNQRlapmx/LN2
	 crrj6xvp0q7s0Q6m2od5KxDuNCReC4u4xYOEMdHuDmfYrD7T7FKtiE6bjpW8QI0Iv4
	 aIj6G5QRBWRrA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roger Shimizu <rosh@debian.org>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>,
	Christopher Obbard <chris.obbard@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware memory reserved
Date: Sun,  8 Nov 2026 14:20:37 -0600
Message-ID: <179416929461.628393.11232917376914155525.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022085844.768508-1-m.szyprowski@samsung.com>
References: <20261022085844.768508-1-m.szyprowski@samsung.com>
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
Content-Transfer-Encoding: 8bit


On Thu, 22 Oct 2026 10:58:43 +0200, Marek Szyprowski wrote:
> The board dts deletes the wlan_fw_mem reserved-memory node inherited from
> kodiak.dtsi, because RUBIK Pi 3 has no WPSS and uses an external WLAN
> chip. However the firmware still keeps the 0x80c00000-0x817fffff carve-out
> protected. Linux treats that range as ordinary System RAM and the first
> access to any page from it triggers a synchronous external abort.
> 
> This has been observed when the dynamically placed adsp-rpc-remote-heap
> CMA pool ended up at 0x80c00000 and the remaining 4 MiB of the carve-out
> was given to the page allocator. The first allocation from that part
> (a qcom_tzmem pool page at 0x81400000, allocated during fastrpc probe)
> faulted on the initial memset:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rubikpi3: Keep WLAN firmware memory reserved
      commit: 8a98dfc758b1a3b0e768e9e0926cd44cb43540ad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
