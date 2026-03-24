Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA3C30AAA9;
	Tue, 24 Mar 2026 19:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382047; cv=none; b=U5nM50oi5Zq+qHpygwHaxzMJTtISwhWC+3Jqmr49A/5wk4YLNf6g3RJqRMpXuDEeSXGL3+wERmCE2YQLpkljeGWGK35qtqOv9rbAoCDyMC+epDwfUvzjbHy9/lWI97pKxD1IRFqh+F5pAuZvfY10FdkRlAkr+MCm7+XuVpMEZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382047; c=relaxed/simple;
	bh=u4eEkSQGgtjz0aZZqXJ4ubhMTfGnaDdFxFFCMbDWd0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMstaTQT5hBH2Tbz5k2XNZ/2zqd0IA4xj5qEP5u5xzTGkw+Zbc+/L9GR5+vF6aDJ5vz9uEB4jBQ5Ssg/HrKIzoyknhSsgHKqL8qdBOPV3SILANEd6vRavjVs/HhQgQof7zgozGOcEyhZ8gy6gzRethfVYLWPgZxZlaZfg38ebec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=FmdE7+7Z; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="FmdE7+7Z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=BmyvvqpA+3a7QNkSRtg2hYz7ys9jbAoSkQkaOVx2QHM=; b=FmdE7+7ZFuqHGQ1eoEPmRfwWHc
	gDSuY7MlFYtFqYrLvbQAxRsTpBRF2kOqvvzn1etrChow06IyZ9VYIkSvw8wNjqHpNn/P5PIYv2Ttv
	CUKejrMgFjCTbUYk51KfetfnCmrCzOEMZjXU8hMVIK9RY7s/Yt1ZvBMx5SKEk6GXTtD7iV6zdJwfm
	4DBB71jvEuDF0Rj6jNmeV72HVnujsV5+LnvDuz5hhAkmyQiY9AhDelYi9VMNcjiWlEc7SF4RHsg1+
	KB4KbBvmaef+QShBwAbrMtcxPkjMQTwLq9gSi2zaTAgqYvnAMdRTcpwXryCKa7owqRVrGPE/DmitM
	JDDZGqlQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] arm64: dts: rockchip: add SD/eMMC aliases for ArmSom Sige5
Date: Tue, 24 Mar 2026 20:53:56 +0100
Message-ID: <177438200681.818857.12277446311254915277.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317-sige5-mmc-aliases-v1-1-ee93a1571802@collabora.com>
References: <20260317-sige5-mmc-aliases-v1-1-ee93a1571802@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Mar 2026 15:39:30 +0100, Sebastian Reichel wrote:
> Provide aliases for the SD and eMMC interfaces, so that the operating
> system can assign stable interface names.
> 
> On Linux this is only relevant when booting without partition UUID
> based root device identification, e.g. when booting without an
> initramfs. In that case booting with e.g. root=/dev/mmcblk0p2 is
> unreliable without this patch as the device numbers changed based
> on device probe order.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: add SD/eMMC aliases for ArmSom Sige5
      commit: 6f7f44169bdef6e10b8d174079a155d02b87d2dc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
