Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4E3D5249;
	Fri, 20 Mar 2026 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027604; cv=none; b=f+/oZIuc8SEQQNCtc/uUppvZnHQlyxXZ6T5NNPMiQ8fmDTghsBlGkUd/y5NSr6BiCLv1EIvdM7zhrA43AW1HJcC/jaqsA33VapigMzh8o0TNxRoGzqjJ+g3I2tkXz2OJL5GYElw4GGxMABRsYe9dNZM68wviigBdYaz/dAWBSgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027604; c=relaxed/simple;
	bh=CAkhobZtIrJyZadDckNSUKGZW5goFXvrVC1AR7eRkK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3kzccQ4Wj5JOe5HCShOuuioTq1u77rBNpvjiPlE9ZFhf170Mb+tih/x7o9965puWGNfGokZqhAfrVXxngLU2XoD3h/2cT8TezmhWgwn7otc6HCGzwmr4KIWEob7MSUWufI9M6Cl0iiRAWAjICTRhJYbMkhZN9flT2egO1Fuluo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Q9r511Tg; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Q9r511Tg"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 063C9C000521;
	Fri, 20 Mar 2026 10:26:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 063C9C000521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774027599;
	bh=CAkhobZtIrJyZadDckNSUKGZW5goFXvrVC1AR7eRkK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q9r511Tgw76h/nrigG0AUGnNBIf67HKpsvlyTgF3Cz1qZxCKO2prPEY9UET7mRH9j
	 b60ZlhZ7C55/IKvECoK/3zQBeQBvx/SKalmoS7IiXWsXIQCXbmo/fIAUSrj++jiyNT
	 0BkOx4SqjJP9ft4icCuULA63XQ9o7xAJWL1scTh4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D1392A83;
	Fri, 20 Mar 2026 10:26:38 -0700 (PDT)
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
Subject: Re: [PATCH 5/6] ARM: dts: BCM5301X: EA9200: specify partitions
Date: Fri, 20 Mar 2026 10:26:38 -0700
Message-ID: <20260320172638.3072237-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319035324.269905-6-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-6-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 18 Mar 2026 20:53:23 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> Some are needed to be specified so that linksys,ns-firmware works
> properly.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
