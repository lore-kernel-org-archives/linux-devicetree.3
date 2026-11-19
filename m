Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081235;
	b=HWIbFemG+/Bpr02b7BmiA3TjqCr/hBJfg4adwfPksltrJweYtsyje1uNZNIH758Az2ol
	 ypV6TtOWKCnhOmE73TDT0d41E/r8MELtBvl7p6Kbs26FxXuWKwPRMKn+JCFFY3ftCygrN
	 B1DnBZPH3rb0V1xRQgh6J1rnRJhLQxcHpfVFu54anVYGWoE9xcEHkC9XP0foOVkSM3AXd
	 vzJmiL0cucfmcBgZfA+wl66kqQs7crF2ajBSmkt3sGe8Zs0ynLINVF7oorIu9ifZxluI+
	 eWGZ9F8SpvnvAqhcMu/CXud6RkSEPtgw/F9yvROuBz4FH1P2baOVF9BQ4iE1mR2gOhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081235;
	h=DMARC-Filter:DKIM-Signature:References:Received:X-Lms-Return-Path:
	 Date:Subject:In-Reply-To:Cc:X-Original-From:Content-Type:
	 Content-Transfer-Encoding:Message-Id:From:Mime-Version:X-Mailer:To;
	bh=9Rhlrsd3szVwXHApQsxbvat4ytGyJqWvh7lnq+1BZZk=;
	b=DmU5/i9AD3IYXw3OTIoJTruUKvLenPsX56dUroBQTnVxOjLxypHhnwT8e4DSXtCvh0PI
	 4iR5le0xtKgHG6hWUChtNkyoZBTVQEwoM3Gi9IyA3qK2Nif8SSGzgBe/8o2aRBUGuWVVu
	 jFt2qkxGaoT3w+y9C8XlKeOY/9d6TCB8oxFk9ojRPy+UKr8oMKkzA5+KIE+yMBghsJkUq
	 wXfN6gcT3TQnGVkPpjfej79Ky78DJ8nRk4d4+iSazeHi3O7zMLf/Ykab7Xr+ukPVNBjCa
	 jHiADjIK6/RuYM0dYtcHxn1ro48c8ccgTOEp8WKDxIIEzcbs/F0bU8qAxlkm4bPwndQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rMj0eB1N;
	arc=none smtp.remote-ip=209.127.231.38
Received: from va-2-38.ptr.blmpb.com (va-2-38.ptr.blmpb.com [209.127.231.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2975B606A326
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2975B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rMj0eB1N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1795081230;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=9Rhlrsd3szVwXHApQsxbvat4ytGyJqWvh7lnq+1BZZk=;
 b=rMj0eB1NfVtEKTaQ++TCwT67NBWyuEc8bCg33V2kewYMsFGXFrT/NSNF3PvgoLia7Ent9G
 X7LRyIAEsHtzsQWcD1vjFe74VqApVjuYjPbuUXdk2fQ+7YpCGgeeK0YD+/C3a23T44eE+y
 NQCGUoZInrtaFRL5g0pJ962hSDMZk/DMQGZrV5iGKcPbdXi4Q4vdcNhfkcXJBUThmg8+WF
 +XvT8PUsu3XMUEVsbpkrK84zpE4msLqIvIIPHRhOTKtYqaxHt8A8kNgz6iWxvVAUHZCwn+
 rkHNaWYFNKgoyxsspQm+vw54S3LV2U60yHzflwPHuuNqftbAs1VJDjJLdsoUYA==
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io> <20261118085742.1817536-4-yang.wang@deepcomputing.io> <av4UUyCtDBJNU0h5@aurel32.net>
Received: from ubuntu.. ([183.23.99.162]) by smtp.feishu.cn with ESMTPS; Thu, 19 Nov 2026 17:40:27 +0800
X-Lms-Return-Path: <lba+26afec40c+ecdd95+vger.kernel.org+yang.wang@deepcomputing.io>
Date: Thu, 19 Nov 2026 17:40:20 +0800
Subject: Re: [PATCH 3/9] bus: Add SpacemiT K3 eSPI controller support
In-Reply-To: <av4UUyCtDBJNU0h5@aurel32.net>
Cc: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-Id: <20261119094020.1888153-1-yang.wang@deepcomputing.io>
From: "Wang Yang" <yang.wang@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
To: "Aurelien Jarno" <aurelien@aurel32.net>

Hi Aurelien,

Thank you for pointing out the AMD RFC. I missed it during the
initial search.

I have now looked through the RFC and its follow-up discussion.
I am still checking how K3's CPU-mapped Peripheral Channel window,
device enumeration and link recovery could fit into that framework.
I will take this work into account before posting the next revision.

Thanks also for pointing out the EC on SpacemiT's K3 Pico-ITX
development board. I understand that its EC uses the same eSPI
hardware interface as the EC on FML13V05. Keeping the controller
separate from the EC transport should allow the support to be
shared between the two boards. My validation so far has been
limited to FML13V05.

Regards,
Wang Yang
