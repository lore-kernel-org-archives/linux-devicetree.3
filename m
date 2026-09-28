Received: from relay.smtp-ext.broadcom.com (lpdvsmtp10.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322492798F8
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790620041; cv=none; b=Lwsu/C0OsfRuzfNIeupjxFbbu8yhNiLBh4NJcE1HadjZLRbX6T+oJS8DJmTYVs8rMkzI7f0x+U0QawS/1yz5spGI731gdBSkTrCmvV6LRt503rpIkAz3yPbkwWbh+d8NKNq6PMm0zbVCO+nMOugkFMEKS41zoyPXbD1nK/5FNVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790620041; c=relaxed/simple;
	bh=JjjBmWktjdoJv05RbzHhroU2fEeisbv1xo0hT/+ewT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KoNHF/qyiHMyc0zXFz07fFyXlrV611n/ilY3ZQz76pnd0IZ4dzb9tt4VKtoHbeToYax0ERNv2j4uVJjEOEAdjH/lFo5VsopAxjFSv+ax8OiqbsvlVUM6xbPXApTQg0lCzmpyYJn+MuYecsrYRrmnsjapybLqjKVBQz/EkXTGBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=u79k51rr; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="u79k51rr"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0CEB1C0003E2;
	Mon, 28 Sep 2026 11:27:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0CEB1C0003E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1790620033;
	bh=JjjBmWktjdoJv05RbzHhroU2fEeisbv1xo0hT/+ewT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u79k51rrwQNZGS1jg8Vdxl2LfY1lVOSMquxi36lxQVKAbGQAt229tvel0elbOLqYn
	 j19N2pcDHbkfw0b9vOG7T1B31zdeAF+FPtI0WwhfefcknegPAMgMIOYJvgR4+oRYzH
	 MX7GbOdhV/+wcYj5po4IE4lIBwDz6twS8PYpfX6Y=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id A028DACC;
	Mon, 28 Sep 2026 11:27:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm: dts: bcm2711: Add wakeup and alias to cm4 rtc
Date: Mon, 28 Sep 2026 11:27:12 -0700
Message-ID: <20260928182712.1268776-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925065400.2248660-1-pbrobinson@gmail.com>
References: <20260925065400.2248660-1-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Fri, 25 Sep 2026 07:53:48 +0100, Peter Robinson <pbrobinson@gmail.com> wrote:
> The pcf85063 on the CM4 IO carrier board is capable of wake up
> so set the parameter, also add it as an alias to rtc0.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
