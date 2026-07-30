Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9C72E8897;
	Thu, 30 Jul 2026 23:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454040; cv=none; b=toC2LLcI0OEfk20T8P4r8MW2Uh4vebQuWAxmKB/MDE4fL4fSKjTAw4hZZDdBRBzNYD3/mvNn6EpH2cokkP1zofwvuKlk4EADIVNGTCwjiy/STfuU5VxRz0XcaxeGH9U4P9EDeJs/f6OCeQh7dl/VC2lbZ0eHMBn0A8CCfrVIfA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454040; c=relaxed/simple;
	bh=JUzHp1d+axrQc5biwf37xUXaO88UNr0hscqy4oY9U8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMObmmK/cyA+dPinsvWfaHlKNNj3+l5QbnBITGLu4TYvc3TBYynZZNr5aGJLnMJJh036WrI806KCJUpWYtiyUgh1kwJxjQdOJfeNGSMsQkm535GbBQSQm+jCBeWgMX6GdFjL33n2roqveHFCuy3OHDLRwrXBxBxhnqf1+Lm+VR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XaTvHw4S; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XaTvHw4S"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2C4D2C000970;
	Thu, 30 Jul 2026 16:27:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2C4D2C000970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785454028;
	bh=JUzHp1d+axrQc5biwf37xUXaO88UNr0hscqy4oY9U8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XaTvHw4SDp0bpquhInHT9hiA9caSduealch8cFeljZX1Q967QIfuHnCLx4ZS0pWIY
	 BLeuLjfisgpmDunwaFSqcqY+NYE7zyYQQlGPSx/DPbP0jmT0UV7FbC2NWitp97yV8a
	 FmYpp9oigryavWqBG2e5HU9Nbbdf4mHFr56umNsQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 02BBEAD9;
	Thu, 30 Jul 2026 16:27:08 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: EA9200: add wifi definitions
Date: Thu, 30 Jul 2026 16:27:07 -0700
Message-ID: <20260730232707.2707061-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727225446.267097-1-rosenp@gmail.com>
References: <20260727225446.267097-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 27 Jul 2026 15:54:46 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
> some of them for proper operation.
> 
> Also add an nvmem definition for the MAC addresses.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
