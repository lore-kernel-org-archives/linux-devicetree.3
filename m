Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D25C439004;
	Mon, 27 Jul 2026 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170967; cv=none; b=TH3+vlYvBveR/ITJjgy2s6vf83zBqcoq3QB2GnU4oA4aEBiujsUMoUGrZlVdFVHqmNRVCdryxdUsyE+BYofoFCgZiuy/JeuzvvaPKkCfqDZHgKI7pxxaHiK9M5ucjtRwJwtHSPnAmp1pEnbkL2unWypR9dj0+N9z40l4uLKivz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170967; c=relaxed/simple;
	bh=bu/sRwh9lWo8gPGQ6MOlZea0bD1CNukkp1JJ5jHhRKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0HuthXsfUif4lTi/rNM0pN74bo0e+PUeNuEtn92p6h/2Spkr+N2N6flC2QaP2IyENRpIHBnCfCZQmgfg8v2lMOkzHg/iyp2XzYYpuYF0ixFTstKRa7vMXk/aLOQibrnjb6pmh110IjORObgOW69RNLkrvnPakSEX+TxGBiGqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=A6DOoXur; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="A6DOoXur"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 31B5AC0000CB;
	Mon, 27 Jul 2026 09:49:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 31B5AC0000CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785170959;
	bh=bu/sRwh9lWo8gPGQ6MOlZea0bD1CNukkp1JJ5jHhRKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6DOoXuraO5B6VcG/+INh+0f3oskgCFiDtm7Vvbu6JxWCdbUcTsj108azY5J9az0w
	 lOPYhaxkQQNaVmJsxz41/CN2rRpob6V3JzODm7CnLNlmThm2CtJ+9c65CikurlTI2C
	 RMU8kZ8Ummv2cm5zcVsOp2d/HxMGPygOFf7B2qGc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 062A0ACC;
	Mon, 27 Jul 2026 09:49:19 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break PCIe
Date: Mon, 27 Jul 2026 09:49:18 -0700
Message-ID: <20260727164918.11230-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628231156.1254012-1-rosenp@gmail.com>
References: <20260628231156.1254012-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Sun, 28 Jun 2026 16:11:56 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> These addresses overlap with DRAM on BCM5301X/BCM470X SoCs, causing the OF
> address translation code to route PCIe MMIO accesses through the AXI bus
> space instead of directly to memory, breaking PCIe. Remove the extra
> ranges to restore the original single-entry mapping that only covers the
> AXI peripheral register space.
> 
> Assisted-by: opencode:big-pickle
> Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian
