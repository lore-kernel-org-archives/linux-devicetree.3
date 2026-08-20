Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8807B388E53
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787206681; cv=none; b=TNRHVZSPBPQP9d7ZHSO4W46ySY188uPmZurXrqbOOq1ErhqXPOW/iX6G1/D4R1qiXx5fY3iCRAeuOlCwGrqLharfaF0s+yAJvMZn2Nav8PRXgHBR+ttEgsxvU0SWeXvyN2YpB7uUd6Ms284GK2fx+75QrMGH+ARnd57SW6jjVJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787206681; c=relaxed/simple;
	bh=DZQowdQRMkEhatGtt3h7tCQXrmERk83oWHHgQ6H7aXk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BipUFbLbJMNCnN0vUxtjau+TVltQvMTpay+MujrMEpBtIpLwaAWGsWL3NGUmKoUUm0eTOi9tWw5c8t01vbDes3EYmb1w6D/dVSuIBqQOij+EoNBU618e3MdGWJdNy62XdeuzMsGntVVI14/guqQAJL0SsThj98412D0POm8B9oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ls/pabZq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ls/pabZq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0DE11A1754;
	Thu, 20 Aug 2026 06:17:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 951A75FF59;
	Thu, 20 Aug 2026 06:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1AB8C11C75E10;
	Thu, 20 Aug 2026 08:17:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787206672; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uUKoy+0M/jUCGELUKt4lnzEzR/7WuJ7nQIh+marTWZc=;
	b=ls/pabZqO+j3iAv3B/c97qnLv4cry4zXXF2r3v9VWhertbYyN2w0ahdDuNm2sOtMcdhNPl
	0ZxLabhMI+kbSH45o2u4j/7RlvAVSpmZbwQ7+WnwCtU0gs2YithUI5BcJHmflTdWy/C6Qv
	wEB+VtMq6V/5QzSm7HQtOBRySw7sp8ON8Dpi2kCYZWYZa0Ot20BBjKVGx8P0Gw1mO7kesJ
	p8nA18P3dgXQT9twTUvq3LvmDzomeV8VRkKHxkM50c0B9bteLsSXsrC5/KswKS/qld7eVL
	57WTYmWqTltJUM97F2KMgoDYnxtrWI2chiv2WKw/wUhuS0uEZDb7cImCRSxAOg==
Date: Thu, 20 Aug 2026 08:17:48 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: "Rob Herring" <robh@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] of: teach overlay code to keep /aliases in sync
Message-ID: <20260820081748.5fb0d97e@bootlin.com>
In-Reply-To: <DKT4J20H0F84.17L06ULMZXN4A@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
	<20260819134923.0a67838b@bootlin.com>
	<DKT4J20H0F84.17L06ULMZXN4A@nexthop.ai>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Abdurrahman,

On Wed, 19 Aug 2026 11:15:35 -0700
"Abdurrahman Hussain" <abdurrahman@nexthop.ai> wrote:

...
 
> This series is narrowly about overlay-declared /aliases never entering
> aliases_lookup, so of_alias_get_id() returns -ENODEV and alias-based id
> pinning falls back to auto-assignment. It reproduces with no mux involved
> and doesn't depend on your talk.
> 
> In v4 I'll drop the "underlying cause" clause; I can keep [2] only as
> prior-art context or drop it entirely — whichever you'd prefer.

IMHO, the talk describing the DT overlay usage in the lan966x context
doesn't add any benefit in your use case.

I would drop it but if you prefer to keep it as a reference explaining the
lan966x use-case, no problem.

Do what you feel is best. 

Best regards,
Hervé
