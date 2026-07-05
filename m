Received: from mail.mdapi.ch (mail.mdapi.ch [31.3.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844442848A1;
	Sun,  5 Jul 2026 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.3.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783277742; cv=none; b=heFnfjp+RYeh12naRBaxqJc8KwSL5nYOlU9GaBXFjfMQrhqG6D4wjtMyBYB8ImNiLCkkz46eC2yguyC0sJ1bjai83s6X5T1FOkA9ag0N6oeVKu4Wek89Pc9YHsfNcciv98OJY4FpfcSoN45Vwa7ZJ0PejcndR2nzA7igjJQikGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783277742; c=relaxed/simple;
	bh=hIRVAbhVg74ibPgDqMroiyMfd0QBQnj3/npAxSfKpyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsxN12tYyDrT3+nZbujBgWMRKl/UI6AkeuQGcHazuFzzVnzgGTGLDfKp92wMxOmWPBfeNVFFNstEhKqEG1oMQG66GQpb0AEuyxwuEjPfKERAWD6ym8ie49HGvdPkQxyS9jn/sWK7H2qIL7LJC8vMzxM6SafdUq8/bbp2dt8naPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch; spf=pass smtp.mailfrom=tillo.ch; dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b=DZ53J28f; arc=none smtp.client-ip=31.3.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tillo.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tillo.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tillo.ch header.i=@tillo.ch header.b="DZ53J28f"
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1783277738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIRVAbhVg74ibPgDqMroiyMfd0QBQnj3/npAxSfKpyU=;
	b=DZ53J28fOH+t2GJWaDWNiWzmumVZO1A89FRjDM36zr7fT2zgsqfBfcZFb4paIoBLW6Hvps
	Iw3w10VgxAQ2IKFOYW0zB+OdMONm78C+xbMUxuKkIM6IHX1DVeYBzZwIVnVSSBA04t/z4O
	oM66GuOtGJ89gjUSYEP+bRQExw9mr4NWYHBylcR1s/qJA+TQ4WsSkoEeRYJLyzSwnOfRsc
	poj/JdFTb53ZVIVHxZeYH+8QgCUGXqGnzBUcizgcB77QQjn7lZ7efa3YlC5dQBFSAi1a3/
	2dcWZAtaQcV6NR2TcbRLkHBH537VlbuKrD7Krk5JrDvDP+zY1qKyuItQ3drUTA==
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martino Dell'Ambrogio <tillo@tillo.ch>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Sun,  5 Jul 2026 20:55:32 +0200
Message-ID: <20260705185532.139292-1-tillo@tillo.ch>
In-Reply-To: <20260528123655.2650868-1-tillo@tillo.ch>
References: <20260528123655.2650868-1-tillo@tillo.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping - is there anything I should improve on this one?

The matching BPI-R4 (mt7988a) patch is at:
https://lore.kernel.org/all/20260528123645.2650085-1-tillo@tillo.ch/

Thanks!
Martino
