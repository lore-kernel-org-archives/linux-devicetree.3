Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A33B71BE;
	Tue,  7 Jul 2026 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453489; cv=none; b=BIpShylHjOph8b3CkLTkg7PpnDIPAkGxgvWxiMYJ6WpDBhVZJiya2Iz3x685SrE55S3Kxi/sPl3THV2tbNzQ1/0aCCpwjBFbpU5esV9itgMnWTQ0da+PxWcO+mq6yordNbHXfze8KpjFQg8qK1bdF8TvtW6dI/yqDuudH+aNfJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453489; c=relaxed/simple;
	bh=w68QtZ4yOpk8U2rpdz0LpLoO0QDEIMkMVU3WmdCU0to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3HZ3HmVCTQVJjUwMv5MjmoxzGadOz9Pvc5fm+LqE7Gv9XC/ZvTCy4nJWQLfa7EklX51IgS/KUA0XTNqJ2f98d3fjzRgjTtE26nJ3Xqnc894t9H0CXA/+w4dCInkuHgWSeOIKB8LDPXgc9e0BqmJVMD2y8nBcarteF9C2ZOsCD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QlaTUEzW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QlaTUEzW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9ij1iSA9fklslnNcgneWEKunccclcxZxRrXNrqVXuxo=; b=QlaTUEzWqoph4tNYXOWo/S/OP4
	huKUpcksH82KeEOGVOr5gtkikchYjdGQSuuoJgJqm768E/zH390u5xJF7rQrhC2Eeocmp1ZNOy+gB
	um5IukqbyaskBRC2xcnxE1jC2fcIdqApAeiR9wgWXtIKoU+Iibl1/ddQEtC7U6z6Tv9TobFAYU9Ao
	UAXJYiAs6gPWabnOQctuHkXOn2GmxWgwDWLvWUMUW3xvcAYd5BoV5x4rO8BKka5EpgBHildVcXm4d
	ChG2A0QJbNNWEhZAH7T63hqesyzkDuQHiaUGP2SBVVz7LKIpkYZvPTXLH4fFXmmP+hsDOElD7vsl6
	H3o+Gbrw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Petry <petry103@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Vsevolod Kozlov <zaba@mm.st>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fan speed control for FriendlyELEC CM3588 NAS
Date: Tue,  7 Jul 2026 21:44:34 +0200
Message-ID: <178345345844.664858.3572226528191999006.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <akkAvJap-MtbKp8B@Vsevolods-MacBook-Pro.local>
References: <akkAvJap-MtbKp8B@Vsevolods-MacBook-Pro.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 04 Jul 2026 15:46:52 +0300, Vsevolod Kozlov wrote:
> The FriendlyELEC CM3588 NAS kit is often supplied with a case and a fan.
> Enable control of the speed of the fan using the trip points and cooling
> maps from rk3588-nanopc-t6.dtsi as a reference.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: fan speed control for FriendlyELEC CM3588 NAS
      commit: 2035369f672fed6ec8430e8876de38b2f5d3f7c1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
