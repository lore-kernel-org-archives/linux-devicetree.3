Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880942D73B9
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 22:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783809490; cv=none; b=IRhenX9LPsgfX1JZSuHYv4k2Ti2ke20ziPaaEURekHVqSlPKUAOaz0BKHffl+tpbfppLVf+tkLbxAQom+FXULzmZQRkuT6iyLbHiZc8Mvp+Cjg92iw87DS4BstAbFD0BbqQrKG4Oe3Ttqo6ScrdWzGmuALAUQR3AUH8FtrzVLY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783809490; c=relaxed/simple;
	bh=gFJIFfZC74dTnQhStAtZ40JhdQJB8P2mLxpqJV/R7JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3nRt5o/r0oVYuWKFRF5A5ruroEsTC4c4CnXcgxldxj9Grk8HDGD3ztyNSLxr95FsozN6cXaEYp8yhY4+CmfzwwDvp914nup6q1XvE6Ni43aQV5A1BlBWkkhdFZqX7zjZEDqaw9UZ22mATGWTfng3Fqr9wJNazF5cIFoqrWWpYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC4MxzzP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC4MxzzP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cab973140bso22984115ad.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 15:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783809489; x=1784414289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LK/eR0dn8wsRcSyjgbh8eBn+ks5A4wiJWyj0VcjPLy0=;
        b=mC4MxzzPWVw/3dHbG/yH7bUg/NJ/kW7/SppUabZ5DCD51DvpPKEIYigSUeYdgYICLq
         l1yAKiiCpfVqw+FUHv2mTMlbpgygUOUT/vayctOuYmeyv8v1rscibA+/a4pgCm+jmj0W
         3bZFeOFunHZwweDUtbKAjQDpQViedFU1PS76+JBsdoJqF4fJzG/TON5tE6FSbBDqV0/s
         VH0UzDJyFUu7lGJyMVixtt5fjH0HltWiNbZHO2sUsM7+yolbRHPWOUUcjeqf9nUKcDGV
         mSRzGglnxVDNt6uAmjkZIQ3uUJUF6IWvocHYNntcQD+tTSKhC/e5wGAkZNVkxe7Y9UQt
         AZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783809489; x=1784414289;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LK/eR0dn8wsRcSyjgbh8eBn+ks5A4wiJWyj0VcjPLy0=;
        b=XkJiQeqDURCTqs8n8Toh0y6Qi5zTyN4L9Zrd5kgye4PCVErMvf0MUJoVs4VRtUtBZo
         xruBLzUN0MiAka+t8TOXsMkZOL3wb2cXQ4sFKD4rtV54vx4fFQ4Ptl/hmnXLQPH1Q5zt
         FprIxDNa7v4V5E2A3tXTckl/LSF4FBCyNYg+vKW6jieyg6jQiwbVGE72GQuHXB9I4iNM
         Wv4CM9H04t0O0fQhEV7b/hX38S55OIlVck9HmezlHN+tXlnELPwQLOq3gQz3GlWO1uH4
         alpuH+azX09VWFf+8qdLceR7glPcTg/v8Wmn7AmdGeUhkPR1WETp5IiFXSvHSwHD0Rp/
         0cSg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+/ExZIEC6M+H8LOa+I70myRe/tQJyiMIHBRpZPBIgHdEW0/Sa7y0b46K7DkG/XNaPW7lPqoysps96@vger.kernel.org
X-Gm-Message-State: AOJu0YybjU832VLrcqMpRmb8gBspqD7DGTdxjM7yR9vx8rmFgCqYZE1d
	1nw+Ksz/Vcmg/XUfa35k60AmT/MtpBiz8ZtMuGUjXJy0Q8YAe4Z79eH6
X-Gm-Gg: AfdE7clcc0/MVxz7XBWYtE8fMAKD6ZshifzeYQfVty6uv8Mt1G+fOQjN2RjFJ4xMJ2U
	SiGtU+fYiKgwih5Fk+WACbsXSamlwSCCtda+VJDGsaJzGReB7nm939BEAKfpfWLpNbQPXe44iDs
	gX8fgC8/m5SP0kjUR6BxxgIJD12FefsVHSXBsBL0NW8snE7wZ9L/ic+/zDIF1SpAhgJ8uT/uDeL
	OPcvHt4k0QNJbBWZfLohdo5GAxymVCzT8wGi4NNEaWtKiSHZMnDU2JX8QNlzlQ7CtjQy4n7aDe/
	y11oThJ/Goe6OgY0fXmjWtDJIaoqi3XQ4lvcKEiDm8mZaiDVpFYdhQ3qEBeuusdWfIbJ7YR5kop
	n0Nh0tXWMLTgYU+UNTSI1vpfqLu5/yd/B3d99xAOcycU0kB6TgVMRvfDADoxuphzvqvq9o6ZgyK
	lE87c/LuzYdR3hZGm9XrukhTDIz+ZjlupmQBNaIhiyPgd4a2cLV9JKrk7mk3coLwE=
X-Received: by 2002:a05:6a20:6f87:b0:3b4:6cae:4a50 with SMTP id adf61e73a8af0-3c11018d8bfmr4787107637.20.1783809488862;
        Sat, 11 Jul 2026 15:38:08 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c63e:9756:a95c:c75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm36008593eec.24.2026.07.11.15.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 15:38:08 -0700 (PDT)
Date: Sat, 11 Jul 2026 15:38:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: fix bracket
Message-ID: <alLFySs8e5s4DGvt@google.com>
References: <20260710090153.431170-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710090153.431170-2-manuelebner@mailbox.org>

On Fri, Jul 10, 2026 at 11:01:53AM +0200, Manuel Ebner wrote:
> Add missing '('.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Applied, thank you.

-- 
Dmitry
