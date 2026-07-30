Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC037E5D9;
	Thu, 30 Jul 2026 23:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453952; cv=none; b=Au2UhzfsAuSE7OcBxufhzleWDdyC4+UdQRdMNUaGEvRi0to9rtfYoIR4znjKJ25Tq2Wf93VnXaIW2wQAD/3rUb99zKP4oyQiAGE+2UoHk/Ty0HFyMTe2gKqzXeeadNw01G0cN/xNmd1p/IrwsWAH1mQ6+G6ik3CI5XuXL7DpgMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453952; c=relaxed/simple;
	bh=ZfVGlwDXqmEwhF/1zQwM5kRPmjjkS0ApWwpqdprns1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpxFxOV7AVpreLAqIuArhRgiq5mAjIqbt7TI/yp88BjOs2bifjCVKfHzQsskjQsbFgNSY+AtJ5u0kQ1uXeUKPbAlTzNSKz8g9XQdIx0UoIyL0TIpQb0XItIm1nBKC5pkPRF2tsjlkkA5CrrnfXOmGMiKwGT7TT+ZwUkMuDvtgQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F5zP4M/a; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F5zP4M/a"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7B584C0003EC;
	Thu, 30 Jul 2026 16:25:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7B584C0003EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453944;
	bh=ZfVGlwDXqmEwhF/1zQwM5kRPmjjkS0ApWwpqdprns1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5zP4M/a1gHl9+04AsxBpyfdokbga/s3DJqzXVHgmTFSKYCp5VrlwCU9Fv5ALaLi8
	 RT2YuyT47GkbkCR2UNOLY1vcxLDzXBW6B462EsDhAV2+qVHQWAyzbvsdvSQJufcoo8
	 Ci0WjTv1fWoRWx1o1Qgd5i+hv1W16GXAuGo39hYM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 171E0AD9;
	Thu, 30 Jul 2026 16:25:44 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Rosen Penev <rosenp@gmail.com>,
	devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:BROADCOM BCM53573 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: AC9: set WAN MAC from nvram
Date: Thu, 30 Jul 2026 16:25:43 -0700
Message-ID: <20260730232543.2706653-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727202630.21572-1-rosenp@gmail.com>
References: <20260727202630.21572-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 27 Jul 2026 13:26:30 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
> userspace.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
