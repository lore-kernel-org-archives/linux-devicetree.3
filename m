Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490774;
	b=2MXm90u29M/sPePQnkrD2uYp8gVIDc+VcGi+80bLGGtyY8mfQ1GrvXOs+4UbfJfIhS3T
	 5D4DNQrwQUr/9svN+3FffTBzAf3jfUVlnZLonGNwOBUrnAyofiOQ86dyDTMfg6D5+KLw/
	 6jFqJv8RpOjyxbLJXgM0bRGCJ5DtdI/02qqwfSDkKd6FlM3thUj4liD7JPsKtA8sy4pTy
	 xvos3gaeAQgj8OPX2CZoSCA4mwbedupi0FfnH7s5N99TFnu911KXMyQrmMCPa5vIOTxPc
	 E86dxSTjj8lpAHdLGs3O3WTH+vjRbeh6AoWq/pbDyV2GJ6zEGizxRl5L6YigmkAqoeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
	b=ApcS47V3y2Y9fpzc0jaU3CWT/Q6tNZ6AVnki7nCM9gv0AVjFOi1zA9qweijBYYURjpaV
	 AQlvWCQzDvM85nHPAnCE7RrUc9rwg6AzHY+BWFMVJRJKzHCTZL4snZfu4ClGFe4WBrnxA
	 4xybJoAtG76UBD1RVekRCxUnBwDB6J+2uUPuavFWG6oTWkchn8sGmj2yqyCrR14VZtyRs
	 5Qmgi5XX7R0xEjLhF5JHgg4T91JQ37xkt9gUSZO0zPDX+lz8lUQU2USyROMUplPTVTo6A
	 VeLf1etuIHUDLhYbU24SbWzH+qYJvinL0guo1afZDBWjsX/xEnGz1cwyruhuXqF85FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3+kfEWc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC903606A33B
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC903606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o3+kfEWc
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e940d5d2beso16947815ad.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490772; cv=none;
        d=google.com; s=arc-20260327;
        b=IlgzOgNk9Xs32rlR02rTaSK4VgeKoXtbsiGJuhAMKSm0mMMp2hB6B3LCU3xWtGxGiu
         0Qw3eHFKs0TVcahVQZpJ/UB80vNjBJOED0ubOZmHJlnCwM04Nv2YfAf/GoWVdc9icpvw
         OIjHWz9g/rQTOyHVj07hoh5hZ9NaZSJE3flSXqkSgcCdMPHrk7pnXNLLgGjSVpr65lHR
         2GAaPSYeDe+gzWWea6Xfl6F/B5n/ANIqUCfIJfF0ViM3rOOjL+BeKCg6J2RktdajuL7r
         t1JVw/hniG7pARsihwsiuh3Xs0YUeHRFZgsmYIEV5cSh32lSPqo9ebjksCp2ZHfOkeCc
         0mDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        fh=mkLMSh4RUUOywosBnZ4RINdpISMO7BMWNFmgJqnyrKc=;
        b=VTsutcxniZWnDzNTIC8KEL/VBfIT1sF1WlUoTyJrzR9Spx89ihlBacUaTbYc/jcPP3
         8CmSae0JtrneD1NEDU1Egx408r5K2XqqOKc4xtUxWyQc/t9279Fothv4EqF37za5O+ZJ
         PRC1mZncjSJzzIoO4PnmeUUETK0EECUt7VMEfnROVD0cmHVvqbsgmC17Gcl4mIG/xDKH
         Jeja4qc9TDkjC9gtsR1DBYZ16SmlaMDaAEHDUWgZTmudV6X2UOfCJencbS0eyKVXNJg+
         zyfP1uS5QpAvOd+asWwyJwpMfom9AEIhTjEZDnuTwD9IdpYz0xgKtWjSaQ7GtStUSl7Y
         Td+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490772; x=1795095572; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        b=o3+kfEWcRSjRpnaVC5BXZKuL2kXjIQHclfzpt6+dHbhdh4Q6hf9C3pmuQuds+9EpGv
         XaxNNfh0D9MQ4cnsO6NytlHcJUL0RE6lWpqnrCQ+3QkxlmdR++71qXfGEXWn+N6dngcb
         bwAgvGl+3PYQ0cvL7dvepdIKzygBCUJqWR5ktSitplquzfJdrhZBFAF6oeC0H+IQ3zMh
         yHqyDIYw1v3VnagA0ZNV3r0N31Qb97+qe9VWSSm+I+AWbGmhoty5fvU1SQSIDm7H+bkg
         /ahGhTUYTNYcBepjiuZOI6JrH+7kYfWkSsHHi+vRV67EhJrWZUT04BfCTjUKF4RYk6uo
         InnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490772; x=1795095572;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hinaE5bXyUrpJk+LwEFRwoOnfVOGtmBFwj0E2lD/oHg=;
        b=KixLOoVU71iMkV7TJqCgmgWMWIlnFuXMJEfjHU/Ee+FuxloTkw9AUlA91bTUB9fU4V
         l306o0xZDMOXdYeYQQ+xf4DO6+rggfMJfZprhdCmnYgXrqeWK3upxs43IfR2lwb97Aui
         m9J0JIRbIfo34JBn8C6NoSA1LEeJivb95X4rzyCH12Ey1Z976cO+w2XmWeBP2D7E+Ydr
         SRG79YhOah0OLwqOPlDw1xoVwKuTMPW4wbXJsZHeN59u0TbbvQF4eipWxnVPa6RMD145
         qXvjSBrwZ9ZuxE7exPxc6jtAQfC8a3g9Y7UiJcVJY+WsDCCoOqZvVDjHwGRH4+QfxDbg
         nzvw==
X-Forwarded-Encrypted: i=1; AL+hErGGAS3EII4gCDo4SV3tkPBSOdEpqDsJOsCv0FaoUBwJGDqZPR1uJZ46kLZe80MVp4xZt3uCYYxiUE8a@vger.kernel.org
X-Gm-Message-State: APuU4Z+qCEoGqvTieYO/Oshar4cKW8Oxks1/Ds6iJj4HsEZg/Xcv/OuW
	Tus5QIg3ZXloFg+lUw2OLZa+XL6LgMoiuz1c28ob/lwSqo8bl9LVYsCS1AbxIHGiV9UUDus0MyK
	tqAGJIn40tyEyvKedlXxX103UAG4Asw==
X-Gm-Gg: AYBFou1qidgZfbvtP9riJX9oZ5Dol0eouwDWgpWEUDQ9exZac5C+gAjYdwbqEyUu6Xc
	jgUfbyhxbFS4pqA6wyqAoR4gapG2JcLrdvc4VctjSvNHxTvoggsK63jmeAYarUNBk+dZ90y3SiC
	8Ok4a+uCsO6Uzm095N8aTXsTaItfNo32Lfhe3CFgs3IH2q9wgnss6Tfj1QDJzekJjj28i0RV7ZM
	HiOiNRrYsY+JYPyY0RX35V5hQUXhpSMSf4EXSdXeoxq3CnwYiTLkx2MlwjJx3172WB2JHkc2/7O
	oCh2MKr3fTzAvuyQBVZsVjuJ3BzGI50AXQEaLRehJLRrPcXNzrUefZ2rqYdWbBYaMF2ybdplIcC
	Nk3fj1cq9glfAWFm0dUZxVnaAx6HtuhPflMwx
X-Received: by 2002:a17:903:3c2b:b0:2e9:723a:cf30 with SMTP id
 d9443c01a7336-2edd747589amr58537755ad.2.1794490772460; Thu, 12 Nov 2026
 05:39:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-m52xq-dts-v2-0-063289405882@gmail.com>
 <20261111-m52xq-dts-v2-2-063289405882@gmail.com> <20261112-sophisticated-peculiar-husky-c8ce51@quoll>
In-Reply-To: <20261112-sophisticated-peculiar-husky-c8ce51@quoll>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Thu, 12 Nov 2026 15:39:21 +0200
X-Gm-Features: AclHuK9wD85pxbo8x4o0sO-zJHkPTBWQEPCcLtvvrU2Ak_t5O0goATrr7wKH0Tw
Message-ID: <CAARotkfQxp0xE_XnixLeRLrcdrWx2PgC78BKv46e2NJiVnmmBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: nfc: samsung,s3fwrn5: Add pvdd-supply
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for the review.

Who will pick up patches 2/4 and 3/4 (the s3fwrn5 binding and driver change)?
Should I resend them as a separate series to netdev with the net-next prefix,
or will you take them with the tags as they are?

Patch 1/4 and 4/4 are the Qualcomm side (arm,qcom binding and the DTS), so I
assume they go through the Qualcomm tree separately. Please correct me if the
split should be different.

Best regards,
Asdlerto Korry
