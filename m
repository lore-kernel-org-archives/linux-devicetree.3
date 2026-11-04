Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781646;
	b=Ug2jYqxdaJ5wgxEaawoGlGAy6Zf7Je+a6wtPEL/7TQxk3s51IW/94pxJdBBqGZyBhOXU
	 gl34JoxegEOol1AowyEzHstflBHht/2AYnu4qMVv3RQC9q5bp7+ribQV2suudvkfhBt92
	 s2hhiDbG7eHJ+dzbyKZVIK9VQdwcAlLT1uZVHxFRH253ZteHanrQ9DFitNsDjjv+UfGP9
	 5sm3gR4+pw0wo+HMOUuc7TCfQnUe4+UHWT3hxyAJu6l2Y0OlU6L+ZbWApXciOgyzw12b3
	 Umi2R6+WrAjD8REc/oQDVkncTN+DwuQwlWam0oNSGGpG2FNTIWwJDr8MjRK03+SvJbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781646;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=bKYL0tIwOuQrMDxrCyv61nKmyjjc86ptxINLaNUCb9M=;
	b=iYJLxq3HK76HggopQalsiIzmFVLvpxNn+SfO9VKqug4dakBj22JaXAr01oZnBmBQnaBV
	 bLBrFDJIntU99gnwMgIGIDCkDIt4HX/2Kv5tDQtsFVcabXJL7CULDFFXgFiBjSi7UB3rZ
	 iMQJpYWm+SMKC5bXfIpzaV0gb2WeRkG5soPixOokM/b4H3oVro4XlJYN1VBvam9J48Tza
	 QRiJbZKJcB+Ht/7J0JwwvtPxPMs5zCifa/XC5WbC1oHdKd6pvU8hDbc35kdnJe9/PLKwQ
	 zTQa6kUTssQcY6Azd30c+uziVcD88B5MPYVpCNdJBtjGajw0FbIAizwwFuLK9QadouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD53606A330
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD53606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso2645565ad.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781646; x=1794386446;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bKYL0tIwOuQrMDxrCyv61nKmyjjc86ptxINLaNUCb9M=;
        b=rBfCG5sG1QfD0MMBUvs2Dv3pcFrfAa09s29SRQ2o4dGOCCw3JtTb2u9I/pkuqDvVJU
         6ahg/B56RJ9Po/LtW8z3F0jFh3FWysEEswB5tvgnwsExD9VBI+QD+mQt1gWaUQ0rcwZl
         Dk7ZigEwh1BUgdo5CYQncuuRSVMCCJOs0m3I8/6IyQ5J8e3RlRYNqQ/24z44ega+gwOk
         MzYsHq378x3GhJcI9XAG5WDjcC3rs1ONE1Wii66j6dNYt4P5Dn5nHRe+EGTIO4VwaF99
         eaoAJSXuQh3djFwyscoGrOCyAtGYt9s8uSjkLL8uIjhuyqzwSeCibDUclFod9AC9CGVi
         wBNw==
X-Forwarded-Encrypted: i=1; AKwUvBwI5mlERrGjBPLSpAZKyxRkj/HBWTOjSsr8IXwJVQyiQJWu0ZJLiutpSmBZw+Y+4pnP0DFzJzPOpsG4@vger.kernel.org
X-Gm-Message-State: APuU4Z9keMMgTgAeuxQOoCg7Veb9NHfxWHNbzIRalF6Pe0MTnfBvTfVO
	J/IPQardPQifhwMJeKjRXdJgWnIW3DxUZolD1k19opTzpaPVu8UGroobYG2wMeYY
X-Gm-Gg: AYBFou33iYnBwG+63S3CWPYK4Hfmrz4glksRmHxi27xnKXQTQ+DzmIJWc6B1SW8nmFQ
	42Ndl+s5Kc4gaKORwu/1VNu/YjtSU1gfYPCSkXSX3tSEbf1SWXPkAcwvS7wlJbDRjGQa0l93W78
	snHtGXeDLouCPTUReSzsrM910GPrQpQ0Vvk4zxZtYyx3RpTU55on7pr1O9dWneUaqmIUaK9Jw6C
	LbGnwni3DHSyLMXXcsOgnuFxWw9VsrF2ab1jYV1jzb1AAZFmauFnVsVoTkOlcLL4SIpe6cD9AqX
	fxPo1+3GfwBxjEnzK3DBeYhOidMvfHgKODc0Uq7c6kGuHkfhNhDys7faqivpSYkLQEqGjWIeQs0
	EzUbalQPewhgVdQ9Nu5uaC3KRhxWjxBuIUk6WxCnpaa86n6jOz71/6q6WVDSfr3Az1SVjsVTVXS
	ZYvJSH2xf4symw6XFpkDKZe498RMQ4XlnY5ekTM1aXm/dIQQcGAGISL259qL1wX4QQUPXKb5Ufy
	nY5BOB6F5MdlnTglw99Qd0j1RWLJvUcWH6MNqRM5ttFHudsMgWVJ/iSKPZvjoAdxKgm4bEOC6Wl
	JApXrZQIAoiZwxBtPA96ZDvXbYrPmv76Umkhotig/tfj6BENtE0o4IJpF1kAeDbzXMV1llBUeeV
	ix/Uwe5GWAZqGEF0z71p4dx8joa7alimSkACXvP+NwQmmuA==
X-Received: by 2002:a17:902:e946:b0:2ea:19bc:2fd3 with SMTP id d9443c01a7336-2eb369df346mr144808445ad.24.1793781645715;
        Wed, 04 Nov 2026 00:40:45 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090a08aesm4641655ad.40.2026.11.04.00.40.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:40:45 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so620618eec.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:40:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxWVP39XLJgCA/jsPhfdagYV6CHbco199vxc1qwwRjuaLJD2Q7uh4l+4cusTwR8zVMAptBlYlCgOE7i@vger.kernel.org
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id
 5a478bee46e88-36a7b3c4f8dmr7297124eec.24.1793781644445; Wed, 04 Nov 2026
 00:40:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-2-a15965a49574@telaak.dev> <6e8d69e3-9404-4a80-874e-0133f942229e@bootlin.com>
In-Reply-To: <6e8d69e3-9404-4a80-874e-0133f942229e@bootlin.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:40:32 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5RZFkQh5G0BbgC7FesQQbQ53AJQv6pYoK+YEVo8k62bA@mail.gmail.com>
X-Gm-Features: AclHuK9Odzf_wS7Gr7Do7DU0hVIY-1521pU5hfzHYwAlyguOls_NqIQeDv60H-0
Message-ID: <CAPY4CJ5RZFkQh5G0BbgC7FesQQbQ53AJQv6pYoK+YEVo8k62bA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: Add Siflower SF19A2890 glue
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> This is only used during the probe sequence, you can simply pass it as
> function parameters, this avoids using up memory to store that :)

Thanks, v2 will pass the device to the delay helpers and drop the
member.
