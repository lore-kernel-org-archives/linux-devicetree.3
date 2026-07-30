Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802F23E4C7F;
	Thu, 30 Jul 2026 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453954; cv=none; b=D2d3WyMYV/T1KVz6PNWpfe5wsRcUTuExgxRJBKNnPPz1A8y1U5wqWrijD2GIt/1I2AqI5WLHvJKuMv38g5jQ2eXJHVzVKKHsqDXuQTMpLKdCi0x0kcb2p16BnHtxsEbx0QTgt8Gm8zAuWmn4meiMQDpzCGFCYLGqsQIJ9osa1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453954; c=relaxed/simple;
	bh=nia8VyEJ648pKqEegOAQM+wyrOIIRDihZ07lbhi9ZoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTVeFYnJqMzRRy97nQTZL3mGT8Gj10P38TNrlNddYTHYFKtKojwWJdt0/d8D+GWtfviyOpS7i9oRFxoDWtU5grEzy+/Shs0ug6kt+BE3ea18/3/ABUMPxVyNS32wyK7MDSNHsGWYoIkn4flK6ohaZJhF7k/EauPygnWWj2+7FuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=d1A/v0sw; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="d1A/v0sw"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 915E9C0000DB;
	Thu, 30 Jul 2026 16:25:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 915E9C0000DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1785453952;
	bh=nia8VyEJ648pKqEegOAQM+wyrOIIRDihZ07lbhi9ZoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d1A/v0swLLqbFNZ914HLWo7CWSoXrkH4P+uDxpn7IIrhrh7MWZOEYqitioaOuE1Tr
	 gOUg9m4oOm6D+s42bRO4LE+TAtHc2Upw6W2S+azzWdKcT3Pb25HSXfzn1egbgah8Of
	 eb+l3OIl1nvYphYpwJk1T4uFcFjsYMI1QvSWY6w0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 679C3AD9;
	Thu, 30 Jul 2026 16:25:52 -0700 (PDT)
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
Subject: Re: [PATCH] ARM: dts: BCM5301X: DIR-890L: set WAN MAC from nvram
Date: Thu, 30 Jul 2026 16:25:52 -0700
Message-ID: <20260730232552.2706739-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727202737.21862-1-rosenp@gmail.com>
References: <20260727202737.21862-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 27 Jul 2026 13:27:37 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The WAN MAC is offset by 1 from et0macaddr, same as DIR-885L.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
