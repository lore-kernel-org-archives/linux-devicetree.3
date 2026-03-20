Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A503D411D;
	Fri, 20 Mar 2026 17:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027563; cv=none; b=kq0DHZzfAFBcDd/99BBP1loWu6g3QjvbzjU6biWDEOL+kcEJzuUeACUdFQCVaMOvyiPipSzYyof6s1tpzWEdBtfa3+3+UfF6Swoo6vLTrIlNa7Ywm6EUhl9ty3TJ6n0sYVv28W9hU5NknW6aPDOaQcgJVl5sImqJb87XkzWB+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027563; c=relaxed/simple;
	bh=/XMeHZ6qvs7D3lGMK/WEllUqbHqF/t1j641AeGfbbwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EP1cD2MLyvkkCj5WLXpbH77Oa7BkNPqshPoU+FzIwqQ1DRJGKqm9NR+y7pv2xR9gO2424RLtVCtvzkyRl5RRBGbpvue8uejBtQMIqI1isJaZ2F9bzXd9u0mOFb8S8xEJi8szo9XrvPMoT58a5pcqxJiFb9X82CPzwsum6mpLiXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Lh7mwEbU; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Lh7mwEbU"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4A0B1C000810;
	Fri, 20 Mar 2026 10:25:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4A0B1C000810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027549;
	bh=/XMeHZ6qvs7D3lGMK/WEllUqbHqF/t1j641AeGfbbwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lh7mwEbU7dy5aa9UOkB/mykNk9+0w7+DESvvGQYqM2LnSkWgDfQsupaIn/Bj5nabQ
	 FK4hFKnJZxUYsdVt0MXmzdakKtMXF8mSFINc8IDFw5ArmkcKvsEVXCzw8ep3aU2f0I
	 rk/O3qyv/wopstFoTPOW/ZmXVEqVSfZG8toSWwas=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E2F2CA83;
	Fri, 20 Mar 2026 10:25:48 -0700 (PDT)
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
Subject: Re: [PATCH 1/6] ARM: dts: BCM5301X: EA9200: add WiFi button
Date: Fri, 20 Mar 2026 10:25:48 -0700
Message-ID: <20260320172548.3071862-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319035324.269905-2-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-2-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Mar 2026 20:53:19 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Adds ability to configure the WiFi button.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
