Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261B83CE48F;
	Mon,  6 Jul 2026 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783323264; cv=none; b=rnEgzXxe2E9hg8deZwit1i/uE6XfX1AvP3iS3rcCu9RV04RXxkq0eGgfqF6obIqg+JLgCgCOXfLYT19bVsOmjyYbMWB0pZC7ol3pIXn3gDs1yPOVGgCKVI0d+vbzIoBrKlXhZB2PtDcVA+INnzS7IKc3I1BrWcwJldrGnm431Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783323264; c=relaxed/simple;
	bh=u8KWHRxWTkjK/J4zbGo9m7m63tq3R8/mZw6k/tPvy8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLXVhGzRpxkGQPoy6C0pLScC3DkdJ6FI5JZ3yYJsdustiv2Hq8OuiAKa9lprUZTUY9/QqcpZTlHpocqwaX+CsErSRgxZr7T8B63QPIOQo2Yz/d9r75iwjMXBH4rcc3e1Z112lQthO9v1vp7NBDeeUtoP4PcRnZRJhSJ7ZVlnSdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xbOdLygW; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xbOdLygW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783323248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tt5w7FHENYGSmUnLysArHs7fpiW1RbH2kKIfrTPwZN0=;
	b=xbOdLygWLbvY+igbSWp7n3fp3UsfDs2b3F9HnUpn45E90k0zC1Uzi1Na4inpXzulBhPk7L
	+rla/XvyvEb9j7j5KUr3K2/9mJwb2qzGiX7QPXoBAp5vnsy/9tlCwnBIxMWB1sqU9X1Hpu
	Nop8smXRT3XPA9ktxWAHtE4h2nb4E6Y=
From: Junjie Cao <junjie.cao@linux.dev>
To: Lee Jones <lee@kernel.org>
Cc: junjie.cao@linux.dev,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update my email address for the AW99706 backlight driver
Date: Mon,  6 Jul 2026 15:33:53 +0800
Message-ID: <20260706073358.1038452-1-junjie.cao@linux.dev>
In-Reply-To: <20260703080149.GF2108533@google.com>
References: <20260701133533.32585-1-junjie.cao@linux.dev> <20260703080149.GF2108533@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Fri, 03 Jul 2026, Lee Jones wrote:
> Doesn't apply.  Please rebase onto -next or for-leds-next.

My apologies. V2 (rebased on latest linux-next) sent.

Junjie
