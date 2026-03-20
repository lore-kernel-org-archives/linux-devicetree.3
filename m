Received: from relay.smtp-ext.broadcom.com (lpdvsmtp12.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C1A284898;
	Fri, 20 Mar 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027059; cv=none; b=rdxnsycaWr/9v5fs2/RA2qVfQjnXWdZStmcHY+0Tu7gqfMPVe9q0w4y9GHmwXpLsFF/HURDcVSMgZquWwo2z6KDYQxQMo7cf6M1G38lvevGECtTGEJRyg1vf0YX0gPOeqgP2I2Ufd297JH/08YvE1nU3SscKQ9cwdAJ42BBv10Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027059; c=relaxed/simple;
	bh=R21t7CJG1kncbC3od1z7tRSdEb8yD9w4TggfZbdM0fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkzpLqPelB1wjSJpJwg1JpUnMrLfLxmrLsT63+LGkC91W/AsTYWoQIS4J4IlOW1L2/AgFB3d5CCSDpHkqEqbLPtc3MNbzwz6tWOtPoW/iHxG6oueKIDaJ8iNn0nunLAOLwdE9TKhbagFp4HSDK+mEh+l54dNL21l2LPKqXo5f14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=nGkfy6j3; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="nGkfy6j3"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3EC59C0005CF;
	Fri, 20 Mar 2026 10:17:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3EC59C0005CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027052;
	bh=R21t7CJG1kncbC3od1z7tRSdEb8yD9w4TggfZbdM0fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nGkfy6j3SDkUEwSHlWiYTwRENS1Fm9GGv+QFk8CX8FWC91XVRqqLV3eJzd391Wee6
	 lJx4iqf77dXbcMuMiwT5xPUstWxnGIMxDbWFKw/mJZ0hhaAhKn5ECjoNAejeMC0ICt
	 AMjfnpzx8OLDn8U38LDVunAsPog2WPxuqKdlp2Pw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D1A6CA83;
	Fri, 20 Mar 2026 10:17:31 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level
Date: Fri, 20 Mar 2026 10:17:31 -0700
Message-ID: <20260320171731.3070260-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320154809.1246064-2-robh@kernel.org>
References: <20260320154809.1246064-1-robh@kernel.org> <20260320154809.1246064-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 20 Mar 2026 10:48:07 -0500, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not
> be under a 'simple-bus', but at the root level.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
