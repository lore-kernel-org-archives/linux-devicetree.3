Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7262212CDBE
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747824; cv=none; b=H5L9xSrSW3Bbruuu6XQyBa8/0U0A2FKBNwV93soiUpAEyuW9cbXzV7q+aOqW3nF4X3Wbr+MCPx2n+cGYfFAY/W2g2LUN7QYGR3D5owicUcf8D9hjumBzSxsEoAstnFvvzb8sFyzG4aymBlED82XewHLcpMtA7Ki+sUpcxdk33lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747824; c=relaxed/simple;
	bh=ufUECX5xmH2+iBPhNbY/6S75VKUiQXYWWuVZ5F61r00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HnrRuEPvtxf8vkR8tDAPT97H2w12XUBLNFi9MxtzokjoeZXdjYEBuC4erFt+rzulYKoaFZ709jZLGov1+oiOi2A0Dh5ARdIagcxyOYHT8jMjzv2BRKJoQ/0IImGlLWzroNSAfSP2TPOFVNtSBzq0Vt2aJisNE27UeqpxPOrndr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B7NblWrx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B7NblWrx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1ED58C6B3A9;
	Mon, 29 Jun 2026 15:43:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9DF35FF96;
	Mon, 29 Jun 2026 15:43:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90932106F190D;
	Mon, 29 Jun 2026 17:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782747819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ufUECX5xmH2+iBPhNbY/6S75VKUiQXYWWuVZ5F61r00=;
	b=B7NblWrxpwTHjtajkuPoFZfqR6FzekKleuqAVcNoqsHAIpJSYEoMWJFp6y7yw5vgcQUH0X
	BCWWKwIlCtn2JNl/fBU2FR7xMNQt5H+1rjjnyBB3o0GOoZM5DNmCp6XeMiREKO/XJ6mXwf
	+3yiBB+FnenAuyDSAzUJxqDr/lvHYum+4/zFdbwLK7NlvIIptqe93E3HiKGClm+iZrbRHR
	1FQnqcybEpgrCT6J7UVkiFIuHFBM5T17Tvhk/K9K3wYp2nZi9H0rplS5s33DuA95zn478M
	zd9GnDAVt9yFoqDpEyprw7XOJRP/LUPAgm4RvZiC80nRd0tijV6mg3POprzUNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v4 03/16] spi: parse spi-max-post-config-frequency into
 post_config_max_speed_hz
In-Reply-To: <20260618073725.84733-4-s-k6@ti.com> (Santhosh Kumar K.'s message
	of "Thu, 18 Jun 2026 13:07:12 +0530")
References: <20260618073725.84733-1-s-k6@ti.com>
	<20260618073725.84733-4-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 29 Jun 2026 17:43:36 +0200
Message-ID: <875x31s66v.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 18/06/2026 at 13:07:12 +0530, Santhosh Kumar K <s-k6@ti.com> wrote:

> Add post_config_max_speed_hz to struct spi_device and parse it from
> the spi-max-post-config-frequency DT property in of_spi_parse_dt().
>
> This supports SPI devices that operate at two distinct clock rates: a
> conservative rate always reachable without controller configuration,
> and a higher rate achievable only after controller-side configuration
> such as PHY tuning. With both properties set, spi-max-frequency gives
> the conservative pre-configuration rate and post_config_max_speed_hz
> carries the post-configuration target for the SPI-MEM layer.
>
> Zero when not set, preserving existing behaviour.
>
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
