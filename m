Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913686;
	b=MvnzI0kKR8e2onCQ/mlJoRsEqb4eN2v56oeRG0DfEDVwLSlmzbpnAkZ1PaE6Q25r1cE5
	 ZDEK+LkYf9dR+Q+fT4GCjy//JOC1ocssdE7N9VXGcrGr8vvPkfNCc6nI0WkxSErm821iq
	 wi6ipV3DD+mnxT8Z/AGmDUVqb77RRv0wwTfera5NXxwaVDSKXcOn+i6til0URfoCH3U+R
	 jQ/IFUa/p7ix+KaEPgaQ/rUFbd1Isdfu0Eu09dn0jBvQ7+5LphPtTea4MeSnkBNIpfV4+
	 3kApRNhwszHHmUjf3lw5hof9IPCfCbvYXKjIgotxuKO2m3O/a6QjhMDyld9NuibGv9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913686;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=mYhI2qcOKmJVw5RCTn0YfKflDeIKtBajzcEsykn+w90=;
	b=P/GwVq7c+M/ZpNvIDgwDJsZHQLotXV61v/VBz4H5Wx8uvyNhhiN4BtBAOf0H3733IpaU
	 XPL4Ye76ysO4yLpxTa+qe1cFYXgJWXbjDlb+dakNJV4n6T3GDlZYq/ippag0rj+iTZJNL
	 6YhQ7AtfzZLRJihVizfX6dSUOln/t/5V4dM1FYCSKYT6zjtCt4SAnYKvsDDn3YCY8LcXr
	 8eg2RJjkHWXINNaNCY378O4t7/+F5+tLY54UuTNtctjDNl1V1xGt2m2z9Ua4e7XImPDvy
	 VMU82dsckziUbaAyvyQNFgx53vo8IdOgqJH3WeHmAFq8iw1ztrRB8lwq/71aQMxsCzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAAD606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEAAD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so1579810a91.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913685; x=1794518485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mYhI2qcOKmJVw5RCTn0YfKflDeIKtBajzcEsykn+w90=;
        b=imju26PMqZpPCEJcqGk7f/yPu5u0z6icC1um2w7KqJIzP+KhauEMhFql1UBLBF0bNG
         /gyfNEAyFSYLMuAicqHDw4h+GqRPaYgBHEtcMTjkpHiKR+oOmBovvwdBWvHigM+IBhH6
         8K4OGoP3YzHqp+4PKlDbNMFk5En7sG/OSM3KLZsPr2o12y8tE1IONzH2NgJ3HAy3zD7W
         Th7Eg7HX4b5P1tu3XayThVLmc08IORuFYyrZhJZzrG6NERk4T7oleOtBrGfYLkgNySJr
         Xy/bPIIZOjM+cuorBd8zVkK+/blYxIgkd+panB6Yt5i4HstrphA2JIBYv7jTUcE65BV1
         ojfg==
X-Gm-Message-State: APuU4Z9vI74kzUn5imuCdySmCPZIY7oigFfvL5EWKNd7cW12WlK4LT3a
	BfmB+9gf4OihFHZZV4cO32tiL3pxyeiEp1DZdtGBU0DOj5AOBxWUgPL3cqow0A==
X-Gm-Gg: AYBFou0oy+3axsJzAjtmyIRNZ6Y/69Ov0LovclMRNsNOhBURCb3pXLemSIyd4czzl6U
	qI/aLFpISqsjOtuSJI4FAFutTdMGTla+2adwsYYcB6pU/di7cWY0Avt+9CrDBNcmC/8gdfJQG75
	fjH0nFYyF+0L1OAz/fvVtcL/uPrq6xr+RvbDzSjav4PTDzfXhJQ5C90OLKAjGktAz3QH21vOsa7
	eI/CxDNdPVze95ZUvN3Fskc09hZgSZOAAJJzRe+RxsiX9zY8c5sLwwUKPbRiCotpcA3Da4fSI0q
	cdy3zflm0k4XvSkdfm4ItGk4O4+r1czU5I9WWjGfIzdYLDHDXt6shGKVIVujoq4yzFAEalGqMuw
	iyblmxoZzZJEfyILptM+9nP04s2jRW7fOsW6gHnLBqzHnHhlMlB7Ng9/PAESFLamM5TNXjnVpu6
	g8zYBRDzMpZSrUWSSi6XHV1B+mWGTS8qXBkOhanGwOHwA4EFRinAJAOs0iPYReiYP4So0/KUv4y
	yZsbntyp255Ab5a3K+kgeXHS3ftHZU7gukAaeq8K3snxCnnIktfMtGY4BMKNtbhBuWRZRr77GCO
	CiPNQJ7VQXoLp+vsHsw+LY2CjCnFRjavzyFGfW1oLicRcjLm2rB/uu/djAW7cxTg0QhJjI+/cN5
	pTimg+g+9KZMvBv/W/OzEXUVel7l8xNul77siMBB1k4s=
X-Received: by 2002:a17:90b:314e:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b0db70531fmr280808a91.52.1793913685175;
        Thu, 05 Nov 2026 13:21:25 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8f2f0sm711655a91.11.2026.11.05.13.21.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:21:24 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3835136eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:21:24 -0800 (PST)
X-Received: by 2002:a05:7301:fc0c:b0:369:9af5:7bc9 with SMTP id
 5a478bee46e88-36f75f25cecmr496793eec.23.1793913684120; Thu, 05 Nov 2026
 13:21:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-mxl-gsw1xx-reset-v1-0-53839bf5c88e@telaak.dev>
 <20261104-mxl-gsw1xx-reset-v1-1-53839bf5c88e@telaak.dev> <sashiko-outbox-198649@kernel.org>
In-Reply-To: <sashiko-outbox-198649@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 16:21:13 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Yd4Kh06mE-vFMdZYTX4k+2oRxSgya77PDr-WB_Ha2Mg@mail.gmail.com>
X-Gm-Features: AclHuK-Q-qGfrbnTxlEBViO6tL6sp-oj8M4F9597oktfM7WAx2-aqOXdw9ZfnJE
Message-ID: <CAPY4CJ6Yd4Kh06mE-vFMdZYTX4k+2oRxSgya77PDr-WB_Ha2Mg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: lantiq,gswip: add reset-gpios
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Instead of adding more variant-specific exclusions to this conditional, would
> it make sense to split the standalone GSW1xx and SoC-integrated GSWIP bindings
> into separate schema files?

This follows how the schema already limits reg, reg-names, mdio and
gphy-fw per variant. Splitting the schema would be a separate cleanup,
so I'll leave it out of this series.
