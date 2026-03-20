Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8B43D4120;
	Fri, 20 Mar 2026 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027590; cv=none; b=Ttuj3Fg8VwYlX7xxxNvnKQZ4URPmBQ8asCLI/d1XNMxbw+e/FzQJyA4U5eL3sysXK5CbkrET4nLE1qZN1svjlRSPxu5QuLgOfQBEtmBQhhCtrjm9nRafzNpeiz4lWlpw0N0YbY4l2OmxpyHrePn2xCCh0Vc4Uv3QR8QU9OoRC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027590; c=relaxed/simple;
	bh=QzSerOQE3YcWTbMDw2emPRtzfM/jMtTOQUibYR9tuJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AuXvV03qP8be84SM9j56KdIm9DrHoCY8y9Eu3/xNkLl+BEkE3WT5qCDXZ/24bWns+hhTa00BF2mmJDBoDZ2hTdpH08TQ6g6b1vliEG2n2Opg+0Cp3/PhufOoVL9fP9rNLXg3N9VWJ+TRkt8wsYQsYHbrsn1hoEhUjUYbvZvQTYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BW4e4/Jg; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BW4e4/Jg"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 851C0C0000E0;
	Fri, 20 Mar 2026 10:26:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 851C0C0000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027583;
	bh=QzSerOQE3YcWTbMDw2emPRtzfM/jMtTOQUibYR9tuJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BW4e4/Jg92KCz83wbaVY4tqZ5V1wZtGDoEVwK3SnhprvUF2VbbGyIVuBtIdqZ1SEM
	 v/XnEEMCUsj4cvIu8Xa9fF/0CZs34eT4F9dwYNsgjvLhZoNHHS0nSgW7CdUWGRPOSq
	 NMRr8v+Cg9cgxt5iTAO7ZrJ1DNX1mpaR+UvO7cuI=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 5C534A83;
	Fri, 20 Mar 2026 10:26:23 -0700 (PDT)
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
Subject: Re: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
Date: Fri, 20 Mar 2026 10:26:23 -0700
Message-ID: <20260320172623.3072147-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319035324.269905-5-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-5-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Mar 2026 20:53:22 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
> some of them for proper operation.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
