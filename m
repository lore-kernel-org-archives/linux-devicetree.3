Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB052F29A
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072077; cv=pass; b=sFYHEj94PP9Klykm/vEuZp9ONGyzgf5l7bTHZUGIjDAQ0NIWbA3IptOaGz6YoNvrID+mRYGi7PseoNS+gFXXswzlDfoi8r68XQeUrvA5qAg/7+bMzuL5As1aF3yBjHB0bOE34HQBdVzDlpvAueLjW5paf/9pZxwdo3HvcA+4xg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072077; c=relaxed/simple;
	bh=MP7qOWwL+P1a6ht9RviQn5PbhcTDg1vQhBcP5eyXfGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjdT72UhmwhCYodI7fFBDizJx9nx5xyCtru14Lfrh/ebXEQh6svjZUjbFtjPf6xklfOE+5qNdOIVANg7jx5pB6GOdUz4J2GRTRKvGn49NdvUyfjqfhWNBKixEqdTFSB3V9q15hVFydwo9E+lG3rOKUNI1cvUAdhOwKx09yKGFsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABLRxbfE; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABLRxbfE"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104e54b1abso53094536d6.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790072074; cv=none;
        d=google.com; s=arc-20260327;
        b=f7A/bdtzpJSP885zloLbrNzme13A8+V1a5cBJqfsiMWgJFbq+Hhlemnt6XbTeIFmfd
         s20gyH4sTGjwEanJE6rhuGoXGXW479gq+mzjuCGkdigUEPc8GXe4CMHDlMP0l/FiNYX8
         Rkri/F5bdSB2MQT/4ZAsKNewKreiZiQyTjtQ4EccA/VJV+PlzvHcYqsBSm6p023nHewM
         1PqWLRlAkNYuMwCARe3ImMdnGTyMmxP+dyyCYxlPIbdvtPbVpz3H6dqLl5p8Cd/s5KrD
         y2rdpD9OcFVWMAcbjkNDKori9AjkK4yTBLv4ygAiuZpFqQTu/DSn6lKm3MIQWuON3d24
         756A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        fh=OUU+fZW3+2UCOXv5LWGipUPmGbvVO9MswoLjnpTOAUg=;
        b=k3dV38V15t+xFomDKeNDzg7OGPwEWBY0gldDBb4+ckj4jFPfwiintH0ItKmlabcN+e
         kV4yP0TH36A38e2g0HWjWkyT2OwJJDqIO4KYIA97Nh6e7xy7pYDBByZ/99Q5o/5LhauB
         ytKAOCe1UNEWFkC/Z6RAVN/8NVvTAkzSvBJseddLLEAIz8fd/AYF4vYCgZIda+TADguO
         1d1YOABPu2YqYhoTQWGvGEX5eGzfi8P0Px0DHk3zwF0uzQTmah1ltELWJUFKWbWtIryW
         7nWpPD6PJLJwZsBQROVOsW5rYSHiU53Pypx0w/eY/xDoFLLquJgLYVH5l6SJKJ3UeT+l
         pr9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072074; x=1790676874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=ABLRxbfE6NZ7sOy0INwd3XY4Y8s168Ra8wxGTqzrQIAqw3hou6Rq23TKQfmnHBAk4X
         v6L5jxxM+78pAkKkVrqsf+veesjFiiVPt1Nep3U00Qni+c0cyjFj0uYJGrUSfewG8tEk
         Zf33LvNghY6aF4qFJ/unoVK1XAkMLk84VEVKgrcVJmXrk7yaoFNLBl+IQxIQW8TzO/8J
         Or6asyop9L0UhvpjcU2RvrwYTH4zND9/xJckQizoWSri9lGro6occWnxQ453vWCybkQ3
         89ypd/XfD/SNnBwxfujW3QDPgn1lIyfdwNb58dmF2FPOa8jygoN1f6YPsbBzLHlJwARU
         Ga8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072074; x=1790676874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=OIqJkufV5/dUqvXnHcDm+0pvqRsDpWL6qer4O+xey1DwkELcjWDRWE2+wArhj5L71Y
         h9HrgWb8x/MFWscDRVyg+QWVMTI1QvWU4IKlPvDC+Z+8S62ZeryYIAAL3+EDFZBS0pgf
         ccluB9dIWy7N18U5UNDp+awuz2Cx77gWkreZ4TlcbyTrzUz/6SusFC/gL86KaIrJSqtx
         yyS45y0+3AYuOwto0tdkXu/UaTiEAcVzQbQbMYw5YviELPxl7gdmrn6MsHTrBWvHPjpu
         xDPoJO9AGRONWed2ljmWBQkloce6/SJt7V4Wm4iWDLA78jJ8Z2m0bQ6ClhFbyWRVhjll
         R3UA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ7GyLYPFgwGI5hAb3LSe6NNYBUYAV96weI7mRrK4JAFy+p68ALg+3KImXbn0Z9RCYE9KXTWTsfGif@vger.kernel.org
X-Gm-Message-State: AFuF++mOk05x1fT1lrPgSCCbOW5CYVS6xd7Qh4D4yQ3mmSofQ1W1iq/7
	cfl5D02fiheURi+mwzZL0SHRHmSWR4gOHJZHDNdC78l/CUzUS7XeXiBxLEtJcKxEkM0l3OwyDW4
	jd9v8hGOBPGSyTp4R2N4bRwkvom1j7QU=
X-Gm-Gg: AYBFou11zY+rHrr7LtOMIRDSEPpM6Gbx7BWNysBGxJvJQe4NkIzMoLf7h4zt2PLjEkC
	okvS9wyOlI8g/tKDHIRt4HwKLBApDYpIcCaN5otXDLk2nAlQql8d+TA4Yt/KQRYB4os0Szu7dbt
	c/HQPuOg1a8lqrSwMCYkU0+jBhqSCPc0+x4FiTOJxIGnkJN9uTkK8kZbaNcL+g4lSWSOh+jw+ew
	CGT18wsp/47YkegyPlTbVqeJ4DK17PfQcfwXAvoG8Hu6aw4hus9+6MXhdG+AKvVCob0+RpoBGi9
	KPzO8ugY6Y1Os3wqr8CxbrWqxH59oDB4RhWd9kxpUtW4JFBPa4u6D5E=
X-Received: by 2002:a05:6214:d63:b0:913:fa79:99c3 with SMTP id
 6a1803df08f44-913fc94b160mr46562816d6.43.1790072074583; Tue, 22 Sep 2026
 03:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915123812.14747-1-ansuelsmth@gmail.com> <20260915123812.14747-5-ansuelsmth@gmail.com>
 <20260921134410.13a7173c@kernel.org>
In-Reply-To: <20260921134410.13a7173c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:14:22 +0200
X-Gm-Features: AcwNN1WQadm9kZulSu2D2w98S17OkpHd-MeZLtXiKqWwHyLw9Fh6tPwUuh65TfY
Message-ID: <CA+_ehUyFH_ZSsjhp-U9WBFoRZR-ZMWnNQ5pY5vAy1LxUU5hSsw@mail.gmail.com>
Subject: Re: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il giorno lun 21 set 2026 alle ore 22:44 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 15 Sep 2026 14:38:01 +0200 Christian Marangi wrote:
> > Add support for Airoha AN8855 Switch that provide support for a DSA
> > switch and a NVMEM provider.
> >
> > Also make use of the mdio-regmap driver and register a regmap for each
> > internal PHY of the switch.
> > This is needed to handle the double usage of the PHYs as both PHY and
> > Switch accessor.
>
> GCC spews warnings:
>
> drivers/mfd/airoha-an8855.c: In function =E2=80=98an8855_mdio_register=E2=
=80=99:
> drivers/mfd/airoha-an8855.c:438:48: warning: =E2=80=98-phy=E2=80=99 direc=
tive output may be truncated writing 4 bytes into a region of size between =
1 and 61 [-Wformat-truncation=3D]
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                                ^~~~
> In function =E2=80=98an8855_phy_bus_register=E2=80=99,
>     inlined from =E2=80=98an8855_mdio_register=E2=80=99 at ../drivers/mfd=
/airoha-an8855.c:469:9:
> drivers/mfd/airoha-an8855.c:438:45: note: using the range [-2147483648, 2=
147483647] for directive argument
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                             ^~~~~~~~~~
> drivers/mfd/airoha-an8855.c:438:9: note: =E2=80=98snprintf=E2=80=99 outpu=
t between 6 and 76 bytes into a destination of size 61
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>

Hi,

 I also didn't receive the email for the AI review... Did it broke also her=
e?
If everything else is ok, should I send new revision or maybe we can pick t=
his
and I can send followup for this warning?
