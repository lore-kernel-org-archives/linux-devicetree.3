Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C724442FB2
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618462; cv=pass; b=DEcWlKyPJdS9tZID9wAmfRRN1gyzNTn3H6GKYOLsOzMxdSYhp6lxj6br+NBcysQd2xmDY3vjvPOOylUoPsrm7hJUP0WcJtTtjSNdoLrNEwBXhmas4rILfTJuiyfVIR60blZlnpm5fWLAiEmcUGgPNeQqwB2b+3ol0tH+uyHdWQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618462; c=relaxed/simple;
	bh=5E8lDhTSGdjryohzQJuTz4NjAIscyItLw5M5ZySDIfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5EP6MtEV/est1W9cY+LOHvzZDNfhQwVc6RY1hSSyiiT+3R/HckwCzB5yYSlJQe7obv93/OUu2t7/YemEkIrVM+He8bt4u+Br1Mic6hUIqfXWzfrgYeEurQYFBljQroZ4Z5siuRWCh1xmIRcBs+Zl0ei2HPFbxSKwKgNoplYyUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejUyZDGm; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejUyZDGm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so649204a91.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 03:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786618449; cv=none;
        d=google.com; s=arc-20260327;
        b=bg1ahjoMW9WDr8wlYalaJqahasRa5T13pUldmzQPdtTX1Cxjqz/CflEG3SGPgHWEgP
         GCgCO17AnKmDNdhyslL2F4GTdvCeIYBevRoDoowhh2Vk+P4XqC4QD0uwUXwZDagB3kO0
         /CzrvBe8ZU0c4Ll3qBOJAm0guaD61p/2Ng1lblTKdQE93O/F9mxLjIvuUgVk6nGVhwnt
         uJZz2Ux9dN6Qq/kWOlrBWCZzTx4ONXuBrIL4zWB/wdcG9xcG1Mwi10SB5XLgLvtKYxaJ
         uinzvO2/AsUtuBoUihPk65U1yFKbHMFh2c6gkBP8pMGn8njTBd76NWR3LjF2hPBSDa7j
         zRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucjmi31stySKpq8sayBZo6yeaMDgZDDCZ61xnVduxj0=;
        fh=iHdD4x+f/YFwqMzqma9QShBy6ZWCqNNMdWGz7gpZHyE=;
        b=nUNJHpdWbt8PIlv04dupAo5maMAjwf3olyhd651MoQ7hNMKXkq6GDBis/rnRNH52jt
         Agh3rnjlm+7nKQiU/GdBp7LfUzJC4yOZMWevkNjHzPmQk8qGePoz6KK9SltnSaXMyNDd
         ZnwvfOGCTtGMnnUECPbBGgLQQmupoRL2xBdC2ZRIsjkv0v6iKmmV/cBhrsELmbSn6c3C
         zMiD4bYRBblE52kY2FxbF7jzHbCspAe5flwW3c9TtfPgTZ8nJ4/oSLhRBvELAPtx68sA
         vwbg5tcy8CMOpJx/3r7nVAyT+zKX5YTF1RYyD8qAPGWsdSOMs4qhOxWRMbcSH5vClK5i
         vlww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786618449; x=1787223249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ucjmi31stySKpq8sayBZo6yeaMDgZDDCZ61xnVduxj0=;
        b=ejUyZDGmPD84Ur4iHftFFFNYWDpuH9Oy+1HsEwZ382OURmUm+mYyQdiY3U6OhiZmp/
         B9DRSMTUSI+g1r/ceMrdJsZBuGgt4GGcrE7UzDjnKnP/7LwjqVVQNjn+0X23AnlfBWIP
         8gCDfFgmmY3HFJ1GLlud6ZRKmrRCi+zYs06qJvxaqp8NnPNkr6hFnSypIpp1uIoGBkKX
         dU0m3b12ft5vdJsEHc/6ljjHFsdVLKjh4sj3p+iuT9bOVSw5zL8hXTCbGvimiMvhlTQC
         R2LrmMk6yEH8afsCHxJiaUqq6y2v447w2yi30sMbDO0MkJfG9l/4ZHXDNamOHAmKbrnp
         xa/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618449; x=1787223249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucjmi31stySKpq8sayBZo6yeaMDgZDDCZ61xnVduxj0=;
        b=B92AbtT2x0vTr8rPGS71FV8yMtuvhPnZBwkUUlNTLF/vvIKYMZ4ti+rI+QVK0CqBWR
         i7C+DoLdOcxSjH5PyTuKbZ5zvbemKcKI23vdd5ipZyaNEc2cwhMfzhJaC5VZHzDRQ7Sy
         KLXr9c51zXvnc9EmagCrnMYnfH5IZ5We08k/S+P4sG7hRARWXPPmNOt/SRdaf8/odDw/
         IXYuHcd2epkmfaSn00n5vy5gCSi14YYPZ0S3FKeEYFhUfRv+YBh1gQZfTGfOb4bwyBK4
         /If4jVg6M8qpwfJmGf6JCMjFW5ucYIaL1lQ20M1wYw106HZUyHmz69m2PhZvLsV+npzi
         NQQw==
X-Forwarded-Encrypted: i=1; AHgh+RqcucM0Y3HqJC/F7f0XR9yGFdvTrz1l/PdfJgn8wb23Q0IqEIxmPIsbsoUpSG6rvCz6frMRDzXExSX6@vger.kernel.org
X-Gm-Message-State: AOJu0YykdLKshQBJOP7KcCRJZsv9gx52EUrk+t3RSlw7iFD0ICaqh6Jn
	ya8me+a00Tn5fPekBGb9HEGwuvzIUgRRkHoGfelX7SpREEMVHlv1vekkw8XGg5gD94/ORYcX/RT
	5MM+/ZxiST1nlzwJATxm7Hz9P3CWwW20=
X-Gm-Gg: AR+sD12atSlg144D2w2fAYqs0kOzmk4bjoxD184UFUWftvke+5p863kTe344+F+ob4k
	rmhCPhkzl6zhRwl6iutLbBRUarN8hE/LsVFlTRAPttKxyfgVdMQP5jSLpR4wIdSJLMs13ayZTgl
	86nDKfwmTq/p0cUv7gju+XJ6W8BEvILIymMe52OByIhhhdwtgRab8BHKWXWJrG69qCS++w7J0Z0
	WUxk0ppRaUSq5FlWT5TGu9EvEa89XT38NNInnQfs5y25ALH8U3GBF+QZZwG5Zg0KW9qdOv06R30
	iFM5UX03SZ22PwMEu5rpnF9gxmSyHZ7IDsh+Zta+5AfbtlsJaw1wdT0PnrayHg==
X-Received: by 2002:a17:90b:53ce:b0:38e:4f42:d0d6 with SMTP id
 98e67ed59e1d1-3931f9126e8mr1840719a91.12.1786618448460; Thu, 13 Aug 2026
 03:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812132755.32585-1-zajec5@gmail.com>
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
From: Semih Baskan <strst.gs@gmail.com>
Date: Thu, 13 Aug 2026 13:53:56 +0300
X-Gm-Features: AUfX_mwvfJgoJzaqHfueN-LQn7bH3GneBJt2tzTAZG8zD1CSNA7ePCjt5jSH6b4
Message-ID: <CAAsRjRn4Pfv3LzQtVbeBzw49fN3Fk+M4JGwKkKq6pvo5Uk-fpQ@mail.gmail.com>
Subject: Re: [PATCH V3 1/4 net] net: dsa: b53: deal with Northstar devices
 using CPU port 5 or 7
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	Hauke Mehrtens <hauke@hauke-m.de>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rafa=C5=82,

Tested on an Asus RT-N18U (BCM47081 + BCM53011 rev 5), with a local
DTS change enabling ports 7 and 8 like your 4/4 does for the R8000
(the in-tree bcm-ns.dtsi state). With patches 1 and 2 applied:

- The op works as designed: DSA picks port 8, the conduit is gmac2,
  the 1/4 warning stays silent, and management over the bridged LAN
  ports runs through the port 8 path with no issues.
- Trap delivery is restored: 20 of 20 BPDUs injected into a front port
  reach the CPU. On the port 5 topology the same probe measured 0 across
  every front port.

With all three CPU ports enabled, GMNGCFG ends up in dual IMP mode
(0xc2 read back). In that mode a tagged frame whose VID is missing
from the VLAN table is delivered to no CPU port at all: an 8021q
upper on a standalone port receives 0 of 7 tagged probes, whether
the port 5 conduit is up or down. With port 8 as the only enabled
CPU port in the DT, where GMNGCFG reads 0b10, the same frames were
delivered. So the preferred CPU port alone does not revive
standalone 8021q uppers on DTs that enable all three ports.

The same effect touches 4/4: the R8000 today has ports 5 and 7
disabled, the single IMP configuration, and enabling them lands the
switch in dual IMP mode through the same driver path. If its switch
behaves like this BCM53011, standalone 8021q uppers on the R8000
stop receiving with 4/4 applied.

On the RT-N18U the boot firmware provisions a MAC only for gmac0,
so gmac2 comes up with a random MAC and the bridge inherits it,
changing per boot.

Best regards,
Semih
