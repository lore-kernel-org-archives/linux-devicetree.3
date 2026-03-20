Received: from relay.smtp-ext.broadcom.com (lpdvsmtp09.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AF28A3F8;
	Fri, 20 Mar 2026 17:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027002; cv=none; b=eAxiuteAcQQ7RnOnPFdh03x1Q2sYQKekidSE9Sh6GYZxDFKHuZg0SoxrzDkWnwu+dyKcdn8Rmb4uF+4aJVH3n6RIe7M3vtOOs+AjEsoClw6ME8ITZVSWX0XI+QB5SgkYc30RyyMsWw5yeftJHyY023UuMyDYqkDntBu58h+tt44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027002; c=relaxed/simple;
	bh=qiYZdwgOfI3LqCMeKs5cm+biwJ02w2st/zc01l5E1rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVIrWxiLck2HSysM4BGV6wyY9lTS/MSaYvnfnNF42ikyJRh+1FL9Gg3lD28KWJf/YGYHdlvIcIjDPIde4UfetIyXfBnFrgK4G+246xPs0a9AgAh8muCpLfp0M//WiY+YRzLlRnul2VaaXXWtGo7Qksn6M06lG315TJoHIcKgjqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=wCNGKBMc; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="wCNGKBMc"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 049A3C0044A8;
	Fri, 20 Mar 2026 10:16:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 049A3C0044A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774026995;
	bh=qiYZdwgOfI3LqCMeKs5cm+biwJ02w2st/zc01l5E1rk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wCNGKBMcyKcZ0Xf0DPK9RyyMgHknZU6c56xoh9Gv55wsp7rFQcoyvlv6HV69/jfjs
	 929onntp+mrF497GaJK70IcgbPaGVPC7CGE6OGpHKYDRBYRzYFzNozoJslSGdM2UJU
	 Od+pxkTAExl9xGOOwjs8n7BR2qVfxtC8p91Gzt3c=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id CA7A9A83;
	Fri, 20 Mar 2026 10:16:34 -0700 (PDT)
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
Subject: Re: [PATCH v2 1/2] ARM: dts: broadcom: bcm2835-rpi: Move non simple-bus nodes to root level
Date: Fri, 20 Mar 2026 10:16:34 -0700
Message-ID: <20260320171634.3069852-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320154809.1246064-1-robh@kernel.org>
References: <20260320154809.1246064-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 20 Mar 2026 10:48:06 -0500, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
> under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" node
> is part of the firmware, so move it under the 'rpi-firmware' node.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
