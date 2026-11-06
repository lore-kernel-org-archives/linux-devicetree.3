Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999605;
	b=ls9txOj9W11jWfja19mX1nA1tN87cVMydJIuehs6JkxQwQr8W84HQP7MHHjMlhVEvkz8
	 jqgDVPfKp3V4EJzgoYGE2lffExXcb4okANdBRYEWoBvsH3N/n5PVj0KyK+1+z+ZphXc0Z
	 tX2/l9lC/itT2HZjEC9lZ8m77umPNAuZgJ4STjfgtSzcaBoY//Kq+ifLBn+FmeVMqZ/td
	 rGSRTitE9CatsLxdq0zbMZfoYNUHBA2OW9gq8V6PHtArOKqWQNZ5DCHFAfbQhSacFkDdP
	 S8ZfK0FyPNv++mTb38QSSOLxyWZPUsA+k7CUcZtxcrXtBeIEPN2VzzLhymtOzi6pd4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
	b=OTCrG0EzoakNKjH9yOhZaTqkXI9xGZlKjnfUYZ97u6rzxOXVXJimrqWryBELOuunrCC1
	 w3zgYuIO7ID/IvPP/sdsZ9G20PKgPVIbH+L287fPSH22GTSHh7qisRe9us1h1pN2BEa/z
	 mnojOWjkZzu+h6DXSd3932OIxOsFn2AXRqxAImCZspYWKlusYAOi5nhb9ssUuJGE28VLr
	 mHZsHT+cAqCHs+j3pDAk8Os8mOw8wLTds7H5sKEnbJzz1+Oxj4Huo84kxcbunRBqWzsUi
	 /HyXQ17Yih7szY/mvERSV6ghWfgv684bkiWphRfwrDxhGVmQZKtW9Sz4Wqzb/PezFkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Bs7/5yc0";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB8B606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 21:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB8B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bs7/5yc0
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491971ac844so973090f8f.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 13:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999604; x=1794604404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=Bs7/5yc05ayHXSEmEltmPv9usXB3iLJ0UIPKGnnUPLtEgiJXu4B8k6wHDv4TBhOAcN
         tgLilyMtppezqIKxWKh8yHwMlSFWMPilP8OKolcj+vpJG0jm6dhM9KlYIdRqsVG76ZkD
         e4bge8pSpAaR2jLhVnsVK84CAV/zEdHskcfyosoS9+FK41zPy94ZAf55XXK2sHHhB1LH
         jHtUZXNW63rzRAqFlEbuhf+zGppUs34YvdK1Yp/Z2MW/95AUzL4HxVJ8JG7bQmguzxgF
         LgC3vzv6dEL74Ceuctm0x5fGvAYFdv/bayDZCdSHS8Kh+xDM2aALyK5xxWSozuaID8Re
         ELAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999604; x=1794604404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAgB2fssjvIHHivLsh4UbVD8IvzJBAHBr6xJYRkzEJE=;
        b=rz1lELlLtQDpSuwRWBG6/l+QpmU8emvaZZ9Oj6ihl/L3uMVMzf5vu/CHVVrKblHM8C
         bBOO7I/5zMi5THFzlhjcsBoGEm1iSVDERiVXXBXsvbso4IunSb3mW76/uEuN58SpYUVQ
         pq5TygUMOt0lwPvtS/OXzk6fSBmsrYpVD5Zy3k+i2pYCb6/AOuHRW4P5qNoEYssP+W3/
         rz4OpNfMj40klCzYoZ1FiOIHYTvavIjHpdLiWacbkQ6uXA2gMXFKZcGZyDlv2Evie6q6
         p4lpWIpWcgTAND6v3+5lwGdE04hKHtgnf02XkQ8Gh6rLv/08GmoWU4kAPwPdMOyjNAwJ
         YvEA==
X-Forwarded-Encrypted: i=1; AL+hErFP/+s/U4iq3G+5ZRrlcfC6ce9B+qmr+ILRoPm0zC2V+nVpyrUlZW9FRpXp9ABEdxv3oa7o5ULu9EVW@vger.kernel.org
X-Gm-Message-State: APuU4Z9SKhdtrHwihRqDpQpCRc6cMe+O6tHIVuo6Ub+ZA9Gvtx7MfrA4
	OF12tMdl01pC3KJkw/G2dz1BEDs+61j4j4lpKbnN5p8KiLU5zCBL4FG2rCjuipVp
X-Gm-Gg: AYBFou3l8AcgHxlvRhdTF/zpSNg4x2V7OeMDyXwJotElSsvRV7ynx5r9La+38CtfExu
	g9awt/PnZ+uA6bd+V5wnlhnwMeNQ0FQF4YyS34zQXhXjOerb8M8hGnwsb1XDeWOP4M9GDdgZXZc
	OBwQU3M2ftGmPVlLTYs3hEneneYPOOCtkLc5y7vtUEDwvRM0h+53szzvG00pR8VcJjc944zEHnl
	GNGpeanZP5zwIu8G9WdO28MwuNCmHO4hWI1Y1domdwTCqZX2ulHKcvapOucMJNjdk1VgnNdVcGp
	jpLWtT4tCdRQtSa5P+niNrcXGxlPKW/5yVKbGip1h5y9A6w62L7o0jVZjryxHG/kFSkz1X67mKd
	gIW2r8qOnso4m3Ow4QulCaJa5brIS5wBnx69FuIXf+BOqJrX5GojKcKnZJjHcAQCaUiL5GPXj7R
	ZJK6rFS8smMnHPWw2NZd0lMJ2zfxxLuwvqCdF8ahY0mMaEMoGEAxXpV+ewUatRkRg+xaT8K9lmF
	zq1M1Ygyx488evQnIlRYZxeUd2AcnSxf26b3vWhBx0fPDhBX/PPMWn0O4J95gfdekOc7IIAeJHk
	AP3Ymj2Gy5+HrOjjcc21xjEzUPzw8Rtu
X-Received: by 2002:a05:6000:26c6:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-49272d1c6e0mr6959875f8f.4.1793999603662;
        Fri, 06 Nov 2026 13:13:23 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7233297sm5824696f8f.27.2026.11.06.13.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:13:18 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 21:13:11 +0000
Message-ID: <20261106211311.73460-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de> <20261106195945.4157095-1-oo.hehir@gmail.com> <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

Ok, fair point.

Conor, could you please drop this patch? Apologies for the hassle.

Owen
