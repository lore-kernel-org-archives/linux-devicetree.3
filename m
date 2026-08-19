Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D353859EC
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148171; cv=none; b=qugXxYu+3M1oKz2iTgMsDI5e0Z1h6KywmUl3Foly5qXl8pummWI4u8o9J8qJ3+EUuvCU25w3kxoNewkZsa0RixsZOROQNMeJbd2eOQdc/CpGDB99mgVc63lnclyGHwe4hXJISgyPlfza8w/wODSoY7HZnYkSdJ8mOGwC3I8VW/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148171; c=relaxed/simple;
	bh=dlXJOH7EU0a51dAApmdxSA9IP84RNY0Lan2Iu+swRps=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KDKfy47WBGr0EamtoJAoNbyuy59uxLjMAi9VpvvJMJLucSVzVeQarp8XHIfxTGdmfv3qJC9+EX4Pquudgh8Dy93aTDay8r8UohksW9QAPgiOTzH+BEbEaieMtza8Fyb6H77nuxeY5J8egkJUt6trVAZUggMPb8RHJ1mRcQ2LIA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=I+/PiMJQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="I+/PiMJQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso12172235e9.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787148168; x=1787752968; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6HUNEom2bL9x12H58ozzx5ab5h2GR4Ct4g1sEt5gJ2k=;
        b=I+/PiMJQJv0XawfDuNp57y9GkpvVNTMB8xLKF4+LKK8FtXU9E9KcKa5ObGN5gXi9O8
         mqjnEBtgsLPVludn0DA7UOpO0Xe/xu1a0P6otNZvXocnDW1dIJXtQzQbXEzNUx6+WuaC
         eT86qngvLPshW7Vh0H3ULeGheFXTuVP+iXQ3lffYfwRkJZ4KTacL+sC6vZSxZeYFJtaS
         oDTYuIIUMn6QVGw2DJczLwIBfW76N7jhYCsOwI9+HiYXN95lPpZOCMu3Hzou1RqHYyjL
         7FcaVwnG5qt+JtA+7Uipc5XzMSnkkjfMk2kyyo5a400eu6ceNWoZzlcByLP5khku8Zd3
         0kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148168; x=1787752968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6HUNEom2bL9x12H58ozzx5ab5h2GR4Ct4g1sEt5gJ2k=;
        b=qi+9a6TTuCLV365IgSPHA3fT4JguCkGKnJ0/9wFKSpJn7ZDB9OtFmcO0avJEkoEYUD
         XbvIOyAXh4IQDJChV3yjRR3tiuDfVVkh/87BAPAmnWPtPToUGBE6BR9Al24YJXq2iiHz
         wzPd7c5cAAxlYd5fHSLfKPBN5z3o84gg2GHzzsn8pY25JH7q2RPGD/xLD089RbkhJX3a
         OTreGlBxun7vuu/E0FhujPQrlpnFhqNG0cvdAqHBjX6q0n0aScjTGegFl/g0janMYZ4t
         YKTT2+OBHRuFXpYq5C3GUnPFA/yBfinEnhwDReFWV5xk96SUui5aZ2bPrf0r9wGPLxDv
         GNBw==
X-Forwarded-Encrypted: i=1; AHgh+RoULb4nA+SK/QYs3icKUGa/2WyrGlF/2T0nKp2aF7Jje2vDOpsypfyny9qZI8Iar+PngjAEBYnbUUC2@vger.kernel.org
X-Gm-Message-State: AOJu0YzjjZQZfvoLmZ71KAyynzieAwYxu7UHv3bh3Hn0OpE71QOYop2s
	qcu3hyXkm1ZyugkbVHeCTQ//1Ztok5PNcIFCGLMXgKXwOiVZH1EF/vmjmImcxxjxKrs=
X-Gm-Gg: AR+sD11KW0UsA5jkIR7x028YSbjxxsSVZpmifep3H5cRzaGTbVThZjs4+/LFVUzmS2+
	D/SFoQw6ygu3fDFEhgK5Sd10P4EBnd1t5aD61/bjUd565hlvxpnyweLcrMwlX9DBWVlZvMlHJ6e
	2zo/75EwZZK4ZQz3rOKty1PUDba5nzIRGzeDRU1bWG7D2sgxRFHVYYg5vHjH8yUfeDXuJ845Bnj
	7if0Qwx7J/mDu6rtEyuA+Es1sApmkhWdp6gdKWfHTvRv5UkZxaJgf6Xj5l/oKrhyBo2TPDQWWDH
	DqY5oyPnskf5uoA2zsH1elNT3He3ZUMP7I80Kszzth3FKsZ1luuIkwbr5sDHfyDr8wdZRgRsE9+
	jUyCtg5wfWqzUNII8OkNzcjM/1I7w0xCkofFOBXnW0099ssjFJ/vEp2jtYhsBlCT22wGsLaEqaw
	BX0owYgtcAFArIQoKB1XQ5XdgVoC9CV/f63IO/v8qnsE3D/ssNHF0qz+DL2mGMIvFVrxyKRydRa
	nyAly4=
X-Received: by 2002:a05:600c:4eca:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-499aa1a7a53mr77553585e9.7.1787148167637;
        Wed, 19 Aug 2026 07:02:47 -0700 (PDT)
Received: from [10.0.5.39] ([2a01:599:445:d261:4474:9672:b73d:5481])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111a7sm65896975e9.6.2026.08.19.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, mfd@lists.linux.dev, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com
In-Reply-To: <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-6-fd7cc0b338ea@9elements.com>
Date: Wed, 19 Aug 2026 16:02:33 +0200
Message-Id: <178714815309.32179.8598674853319251320.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787148161; l=396;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=dlXJOH7EU0a51dAApmdxSA9IP84RNY0Lan2Iu+swRps=;
 b=c/KerOBtBLlU7G268kqzunbiL/W9hE013JTk3ATgEU/VaHaT/LXB+PpH0Ob3QlfkpPx+mFF/z
 EYquBWAhiQTBMj721ke3wRMepR8gy9yQ4WznJiFfSG2PvjnXP2qnlLi
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

Hi,

On 8/18/26 12:29 PM, Grégoire Layet wrote:
> The VUART 3 and 4 are VUART over PCI.
> Set this flag to indicate this information.
> Also set the scu-syscon phandle.
> 
> Added lines are compliant with dt-style strict mode

nit: no need to add this explanation about dt-style strict mode.

Other than that, changes are fine.

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>
