Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2573D6463;
	Fri, 20 Mar 2026 17:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027614; cv=none; b=MdJFPBjmVkaND1iuVYZhYIv1ewlr2xQhPlytetAanDSw3CJ2gqHF4Qfahu14V6KOkk5dGKBLCbi/SVncKiAlbNDhT5x1DPSwuDkxFnu8HFysp5LNH+etOP7/+qRYzbxEjHYr5jM2y8Bl70jTKp+ZsU4tChlgHkggGDo2keMkxb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027614; c=relaxed/simple;
	bh=nE/vW2D+wEn7UJ/6B88/Ij7aHIhwCj42B79kzM0zOss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ji7v0A7mc+Vq6vcBsAcXxMLKuJ4WB7YFj79YH6AI6YpyygHufIrykRlBIrUOgpQTJ6jdVRiIQ3yCPF3xpxVVx2ZbKcAdk3UOeApYNlVpJzrfb3hdsvBd696sdMltgbAg9XpVI+hcYAZaeaB1GkNLoo38i4qF5RLRXg85eFPRLvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=beyFpBvH; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="beyFpBvH"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8772FC000813;
	Fri, 20 Mar 2026 10:26:46 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8772FC000813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027606;
	bh=nE/vW2D+wEn7UJ/6B88/Ij7aHIhwCj42B79kzM0zOss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=beyFpBvH7wwfdJXoJ+/OfeEcCfM93BpTzuQewv5hJkXaYQYVejGuonarhbde6OAJo
	 s7eJAX1J8My511QRCyuUg616CfNz6Bdb4rWL9oe8+fructPPo3TJeGMXq2pfoxyXSE
	 wFTKS2SANVdjMgz9kp8oWma9kChTEP+vJqRvRB1k=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2A959A83;
	Fri, 20 Mar 2026 10:26:46 -0700 (PDT)
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
Subject: Re: [PATCH 6/6] ARM: dts: BCM5301X: EA9200: set MAC from nvram
Date: Fri, 20 Mar 2026 10:26:45 -0700
Message-ID: <20260320172645.3072323-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319035324.269905-7-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-7-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Mar 2026 20:53:24 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Especially needed for the WAN port, which is part of the switch and
> inherits the MAC from GMAC2. Added extra definitions for the wifi
> interfaces to make everything clear.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
