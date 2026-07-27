Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405742CB02;
	Mon, 27 Jul 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171269; cv=none; b=EbrjqevO1M2vKtl55/QR3TJ+7q1UTq5GuFZ9EWrFVQp6lVyUuMcR2YSbRutvnbLdktqJUw2YqrwyiILy1VTHh5TffpS2STnF/Ya4JuWo/sw3TJavHvYFYq+VCXqut0ooyLBMZxJRur3jvaXdlFG5b+gUB2Y7dLbrYRiy2QRYTyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171269; c=relaxed/simple;
	bh=ITwqBTnMUTxn5aS9pdWWj5KaaXl3b3z95rNNRj6ttGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eCXJue5TQqA4+koa/Ukm73eiuT1JSP80I/U/m3J1L6X0tZWP26qDUsTyGRSaTj+x9ALVLDaT7NQ/0Cl+5UBCHvSw/hODbn8Nhjlub8U08z69yh0rldVOrQCGUt7+WvW/WmCMn7c25kA7F+4dHirvKnCV3B+M1nP9EBPckMSoq70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iOqsmOOm; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iOqsmOOm"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A2297C0000CB;
	Mon, 27 Jul 2026 09:54:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A2297C0000CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785171266;
	bh=ITwqBTnMUTxn5aS9pdWWj5KaaXl3b3z95rNNRj6ttGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iOqsmOOm9hDVqKAlkYrQlBUzkkmV5qh2Gctqz0v1wurcedHouT1UDpIKk8HUp4KO2
	 lVfkrVh6BrzhAlL6yCPkOmmnY+FRFta0K0yLS/lTqh0tZOwwIyNdctMbD57njdAlAV
	 65aNG9rIvyVUzmVnJYWAdrrTErQ3rZOCkGtnTuEk=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 75A90ACC;
	Mon, 27 Jul 2026 09:54:26 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
Date: Mon, 27 Jul 2026 09:54:26 -0700
Message-ID: <20260727165426.11987-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725215722.9323-1-rosenp@gmail.com>
References: <20260725215722.9323-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 25 Jul 2026 14:57:22 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> PCIe controller 2 has interrupts 0-4 mapping to GIC SPI 138-142. The
> mapping for interrupt 1 was incorrectly set to 138 due to a copy-paste
> error. Fix it to 139.
> 
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian
