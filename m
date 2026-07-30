Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE0368D70;
	Thu, 30 Jul 2026 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454155; cv=none; b=t5TOz3u1pMhUDTq5xBDd4LuBWIJviomOWCbDOMGnulUexC2cTdhpmItq0Cv586/zChH9CSLVDIBT2FojEsVm3bjhEY2QzcKr0jWxdalQZdFEJAx4w9+MA5HV0fIJt7FYpw3d1gQPKD8DaArDCFuS7Gk8H4V7QkGXddbvZHVS+hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454155; c=relaxed/simple;
	bh=ttxI4Ur9rC7uwFPeGVxcwjsocSNemkrADE7CZQ52zgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aw8cx0X8Nhijc1WpHISxD0pC4m1oJMnwcfWGoeszVGiy/4XkcGLxFg6fz4KXCJWrrKSp4cYTCiH9gnKa3Y2Hic9VePmNRwftTHfh61rVw+OcFAayZQ4sSOnTek6yDw1B07krlU2tcreRW+UHJSdq/3rHUSXlUQei34at6nPzLfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T6WmT7Wn; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T6WmT7Wn"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CFAD8C0000F8;
	Thu, 30 Jul 2026 16:29:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CFAD8C0000F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785454153;
	bh=ttxI4Ur9rC7uwFPeGVxcwjsocSNemkrADE7CZQ52zgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T6WmT7WnSa7YMW9P3Dyoa6T6gYwVV56Bd7dt9z0JlAdV7uBmUmtnYvaVKBkO2SSoh
	 IRaNUV2XrZuyS7i+MSyH+phAStQs6MEdeOA4XhGDBMJeLpsMRaJDEN9kvQqTakCGrN
	 a9JZ0SiVt85xO5p1Ebgl1EDivoVGXfcukluOS3To=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id A278AAD9;
	Thu, 30 Jul 2026 16:29:13 -0700 (PDT)
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
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: panamera: add phy-mode to switch
Date: Thu, 30 Jul 2026 16:29:13 -0700
Message-ID: <20260730232913.2707467-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729225402.775442-1-rosenp@gmail.com>
References: <20260729225402.775442-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 29 Jul 2026 15:54:02 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> phy-mode is needed for CPU ports based on the documentation.
> 
> Fixes dtbs_checks warning:
> 
> switch@0 (brcm,bcm53125): ports:port@8: 'phy-mode' is a required property
> from schema $id: http://devicetree.org/schemas/net/dsa/brcm,b53.yaml
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
