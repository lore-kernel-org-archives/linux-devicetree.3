Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806083D3304;
	Fri, 20 Mar 2026 17:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027575; cv=none; b=t9uILsFoY8FXI1rnFJ46uF8L5SarwND3KvltKp4IWaDDqIxguChy4cVSCQx52WbKQ0/+XBZykUMZ69djCOLI2lJaTxqRIs2b1jYiGqL/BA4EXkEsH7yzJeRKVdJmFxmV1yV6RuWaWKVZWAwvy+oy9g1PG9oO42796Tiw6LXl80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027575; c=relaxed/simple;
	bh=6eBNpMAGRD93SmpD5k3GaFuop0ER4TJWzSaFC1cwH8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLQ/IcTaarfXA1om7DKqL4wy9ssYCH5WQ8FvFt0hbuaab2aNZNOlhyJ1fb7m4+JvG7V17JxbuIUMYjFEiQkKm0DjkaTMMCfKqx8dwYnk7FoTSEJyfNFE6cnLIzkHoA7tlFPYXgXJCcyevwUWwqZ7Nk6QJ2scXQohbgP1bTR9A6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=kY1QRwQ3; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="kY1QRwQ3"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8B1DEC0000E0;
	Fri, 20 Mar 2026 10:26:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8B1DEC0000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027566;
	bh=6eBNpMAGRD93SmpD5k3GaFuop0ER4TJWzSaFC1cwH8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kY1QRwQ3w5muBNVhyvtPfAB5OFosGF8i56QPvclc957xvUY3Zhj2bqack9JrjXdNZ
	 LkUZ/vr7SsteZt6ETfSly8fwNuvlgcJ9hna5LEZTHWjl/qOj4SveCbZChGhwXyN5Lf
	 th+uYNilDRqSS62ohJcA3aDUxDq4C2kOGpzibkEY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 61C92A83;
	Fri, 20 Mar 2026 10:26:06 -0700 (PDT)
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
Subject: Re: [PATCH 2/6] ARM: dts: BCM5301X: EA9200: add USB GPIOs
Date: Fri, 20 Mar 2026 10:26:06 -0700
Message-ID: <20260320172606.3071957-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319035324.269905-3-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-3-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Mar 2026 20:53:20 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Allows at least halt to turn the USB ports off.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
