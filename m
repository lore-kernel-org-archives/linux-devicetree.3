Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C612344A724
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119138; cv=none; b=qB5vNRhQY1CPCMeVexYpz843GHUor6IyF5YIF8TTOjrxWoi+VisY5Ygq6s2p50x9k19wDAmW7d3Ohm/+s9Ai2beY3sxR5A5g/t6wTUWp0t2an39WlN5IUkgDvM7VEFJuXvIYf2s5N7i3IH77Xodst0a5yhaCDm+TNONYlQG0xfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119138; c=relaxed/simple;
	bh=7iLRvv012vEEfimeszUf/71U/W8NXo3123LhPHwWSkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H9Zrk8gzigMNL1HZ2iSYgKrOeoe55tsC/BB9EkvOnApdxiSteRBmacTzzESZ8l4N2bCdugVrgu6mJL/Y3R5fGv42qdW2zr9pbdFoF06gOH2Lrl6m1NXPGzT/ewfRxTBIIrf/sp64kr9WEDTpQihXJNCEUoLmKn4mIsq6mZ405u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MhfIEuqk; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MhfIEuqk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E715B4E40DC3;
	Wed, 15 Jul 2026 12:38:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B45176035C;
	Wed, 15 Jul 2026 12:38:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89EB411BD3C48;
	Wed, 15 Jul 2026 14:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784119133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7iLRvv012vEEfimeszUf/71U/W8NXo3123LhPHwWSkY=;
	b=MhfIEuqkBg1zpnE4bsSj6H4gqGpHu5wqxe75ZNuuVT1x5WIycinEu9w/oPXAkJ+lCdYXhx
	uproAGZayfYe3B8cePfnhpy4Y91AtExlKpfBSOsz1nI++PvL7mVfwjDBpuc+CoBmJpOBtW
	EoDQZS9aOYTa7qfOMthgbNBjnCOvRPrgClFccG6Vt4VP+zcSL0evX+6OUcGd7JKPWqPeTH
	gexXqqNZ3VF5+okZMhm/qIElzwk6DbZANn0tUyrLaidjgvwvVmDdKhC8ZQfCjkEk/Dl0wB
	3YxQhdyvTCLqRSiYgQyy4n1dB+bmpQBmRFWWx33SBYhzbDCFMTOi+jWAVEeY1g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  devicetree@vger.kernel.org,
  conor+dt@kernel.org,  robh@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Introduce nexus nodes
In-Reply-To: <20260710182918.BD89C1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 10 Jul 2026 18:29:18
	+0000")
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
	<20260710-schneider-v7-2-rc1-eip201-upstream-v2-1-b4680787377e@bootlin.com>
	<20260710182918.BD89C1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 15 Jul 2026 14:38:51 +0200
Message-ID: <87tsq0e8bo.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 10/07/2026 at 18:29:18 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The clock nexus node schema omits standard nexus map
> properties (`clock-map-mask` and `clock-map-pass-thru`) and
> `#clock-cells`.

These properties have been removed on purpose following Rob's input. I
believe this comment from Sashiko can be safely disregarded.

Thanks,
Miqu=C3=A8l
