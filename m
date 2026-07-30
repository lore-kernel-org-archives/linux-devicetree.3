Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F83470110;
	Thu, 30 Jul 2026 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454003; cv=none; b=n33AeMScem+ApzQC1skFdJ8rcX6UYxv1zN2gH+InuhZEKDCz10jORjdUzcgEHCbOIZnQuZhWg22PzHpC2GnRqFDQTD2tJjykKv7DH8P/elDCg7HxvhUL+I17Xk4knvRGC3+ZB8sSUbAqRXs2td7/vWhLNr0vV3qb9ZEGcdKqF+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454003; c=relaxed/simple;
	bh=x09/5qC7zCH4AEATkKJvdGKeAGwMUMYzOJHttrM4C7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOdJ67XlklQYYUQsua4hb3Z6Uk3mk5CknRAdHFZfvjR9Ng0SVP7aHvThJdflbYh4ufRx/cX3EO2caTMCOkU7OHEXYTEXM4kJI8m6U7tm0DcGNdpVzCET2H8zmRU+c6mOiOfFWC/V3KbQfZrsHTiLBrr40LMALwKMr81ydSU20h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Gv/t0Rz4; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Gv/t0Rz4"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7B732C0003F9;
	Thu, 30 Jul 2026 16:26:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7B732C0003F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453997;
	bh=x09/5qC7zCH4AEATkKJvdGKeAGwMUMYzOJHttrM4C7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gv/t0Rz4d8OcPOl3klbO9iWGRWy97ttHp1czKHv09xY42n48KHYGBs2smpaz3qx6M
	 B6VVXJ2ILCUSr5FK2mdf1c/UaP9cjaUUjqeR4OdrOJ/ZXps3ACE7xRkJyFW3o0Z9wb
	 GG/yH9sHGXYDhfxOEq2mp6WlLKZWCSNi7Wga0xFw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 28903AD9;
	Thu, 30 Jul 2026 16:26:37 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add missing phy-mode and fixed-link to DSA switch ports
Date: Thu, 30 Jul 2026 16:26:36 -0700
Message-ID: <20260730232636.2706946-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727221728.40811-1-rosenp@gmail.com>
References: <20260727221728.40811-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 27 Jul 2026 15:17:28 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Ports 5, 7 and 8 in the BCM5301x SRAB switch node carry an 'ethernet'
> property linking them to GMACs, but lack the required 'phy-mode' and
> 'fixed-link' properties. The DSA port schema (dsa-port.yaml) mandates
> that any port with an 'ethernet' property must also have 'phy-mode'
> and one of 'fixed-link', 'phy-handle', or 'managed'.
> 
> Add phy-mode = "internal" and a fixed-link subnode to ports 5, 7
> and 8, matching the properties already present on their respective
> GMAC nodes (gmac0, gmac1, gmac2). This resolves dtbs_check schema
> validation warnings for all BCM5301x-based board DTBs.
> 
> Assisted-by: Opencode:Big-Pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
