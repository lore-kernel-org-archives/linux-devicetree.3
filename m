Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91740421885
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010699; cv=none; b=Q3f8cLZwno3/u7qNXzLTzEKwmD2m1LEncsEdjdGgS1o9rnA6wKQTK7bxphXfw0+0ZGnpRLlHO5DRL7AL7YQr8XRsuh9kEj/EdU3w1my29lPLv81Xt2blKfnmLy9acP1emCVfREuVNZvLJvt2AdXtZsLxOGG5rrBYB+vmPpK+B2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010699; c=relaxed/simple;
	bh=WyAKduLCMGnVe3az+1XfuhfLUA7dhySTaltQNSFgz9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxcOjiNBjqh47MN/Fr75w/sw7CE27bQkwhDXvbpFLV49SrKu44nyC1azTbR9Enni1TYPQhg1xzNgAtVImOosTIRFUR5Nzyux2+C0lK3AKCj1fD2Mtix8H5jlMqrxJbTqy2Ajx3WuHnfbUMJV15z4m2vPNzb3NMx+U+YD/xhLRdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrsTH6UY; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrsTH6UY"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36da8439078so4897629a91.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010698; x=1781615498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xcify0Qdew30KpnZXUI6haw96MR9x54buI9R3b+UtY=;
        b=VrsTH6UYg/jqJKs9uik6YNWvGN5L2oPnf5L0OkjxApecuJjTMdKX4c2kTZ/atn7VND
         5UshTj3heA0Ou+LavsGtUiyOzN/CcKjsYdtQdbH7H0qSlli1b+IbJA783pHzASl+obAc
         n9j2+cKTaXKe2pJ/73Fggszhcwt19v+gAEoDzE/72VQRViVpBI3wMdXOvf/xN2PbUja+
         5DGd/SPF++ZjB6Fh1jiJdg4EZ3gVojNpa6an9VOXeFe8ihvuf+lo7el8thhpBf0lZPZl
         8rIY6VNinec7g5QdCwrxTf7qFbkhoyqTpEx+Xs5mAvjwZ7XrCwaQN1+5OtnXxFyttBI5
         XisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010698; x=1781615498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5xcify0Qdew30KpnZXUI6haw96MR9x54buI9R3b+UtY=;
        b=HckmqedgJ1uAbpXBWrQ8Zx1aA71byGqsqKUGwZWztcvbF2v1ltr/HRB3onwUf4DBe0
         1wuE80xN5iaA00eSbtfXA6Gx9ejFXwmVhHC/jL2cw/gWBdHht1MDp61HEjclLtpB/5w7
         Mu/0iPy/tPEFzfYMb+INCLwe731XEWRi7djB35YGibRrjayakQnhs4wa9d5vTzQKwUvg
         NUdlDfyAg3pyYxjbIKJH1Ubj9/km1fBvOCe5lPvE7uqS8uMTMLV8er+EVFOt4NDv3sjK
         3dtgDBCGGGaCKxW+9Tb2QgvsSqbcVwT8Pgb1zthoUtS02nEIEiA2imafXk2bZYAZZQm/
         6+Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+ea47hazz6e67ZF7xY0b5EP6JxF84bk/NiNkSxmsy3XGrnLVxM4Y/z3vnU6SErVsBw64sd4wIw2V86@vger.kernel.org
X-Gm-Message-State: AOJu0YxSZWnPQrETKFz9usYDDdK7P4P/WVArnGX245jWXEn7Q0LQNDud
	eYiyZbzvXbaKF2BvzHlSE7uAT8YdBPwfLicfTxyDhSrv1CebrK9oGuI9
X-Gm-Gg: Acq92OFBFqm6v1cgNC8LjIKh4mJeta0/HkdQZERyy1ye8zq/04XifTpZ6twippHaLdO
	4c0yokQ3MzNlYIeq5tbLVawHavGohPFz+JLfaylDmssCSIVp+NUuT4U/tPwxPANBt2CKQ2bN4qS
	oIv3RJLduhBL5xxy3o0XPKlF9rkL9y3Vod77yWA6Qqejjs8rceRQBmsCjxKkCw5mjOeQ0KX0jXT
	9VbWkt0rahV5F6ZW12D0dpO9Qsof5Zfr7yQhYCrrGmWXTt79yRxjFwGhJTx7oASSWmrUdgP+ChD
	XmViSHeWYRAmbvcmna9Mr58G/Ssm3Dhq9u2M+Y7A6EqO8cjrKpOTdWkSEXbMSu+bNIpNr4+v4b8
	fEX6jSJ511gm9rH0KT5fM7gP/nUwmiHYK1HDJkGnSUYIeQhxIxYAOW1SiMRG2JNrrAjdP951Ere
	64UDaaThzLhul0hXD9FFTdAuMYU17dgg5F5E+LZd9qggywELI=
X-Received: by 2002:a17:903:291:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c1e821dde8mr241031805ad.16.1781010697863;
        Tue, 09 Jun 2026 06:11:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df6esm232985455ad.48.2026.06.09.06.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:11:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 06:11:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Message-ID: <f55678dd-3979-48d1-8df9-650af1935e37@roeck-us.net>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
 <20260609072231.15486-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609072231.15486-2-Ashish.Yadav@infineon.com>

On Tue, Jun 09, 2026 at 12:52:29PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add documentation for the device tree binding of the XDP730 eFuse.
> Rename node to efuse to accurately reflect its hardware function.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
