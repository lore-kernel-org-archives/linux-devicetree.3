Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F51431E5B;
	Thu,  2 Jul 2026 00:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782951993; cv=none; b=DD69ZaPyO7rveCX8tfwQJGONLl+1hX6eUuPWuweoOiI1ReYCXikWZiVXna/IlZIaYohE+iibnPIKiFgf3Z9XOWZahvmNz/b3NawRWHQhhaQ56AKBomn7xfneBZZQARD8xilRkrVInY3W7KemfSjXIxFgQc7GBuKOGqjHJGERzoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782951993; c=relaxed/simple;
	bh=ggKY+PiY/XL/TlUzVFfVrI+1Nd0wMZ3GupLpt3JkIXU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G7ajdEq8Mbic6TZUx/hs43iYcwq5uTPh4nAqjy0Rx2WItgRtaJKeSAWLM25mx4eFue+wF/5UmJ3IetSakMAGTTQOVczfNqri4WYCiXDpJO6aQgYxUoohbq8zRyelSBg2hUNo401a2ZIqek/Y0eWz4IDGVn8ardg+OO7BhYx6NBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=MKVkLHEq; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="MKVkLHEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1782951990;
	bh=ggKY+PiY/XL/TlUzVFfVrI+1Nd0wMZ3GupLpt3JkIXU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MKVkLHEqSw5DimCEOHwHKrc1/BWkRhGWgS5Xuz4jz5WMGFWR1Q3qEDr9EIkT0aFS/
	 tCNZJOe6YNAuZaJ2pEPzl2Az7jcdQa/+9sDSgdDBKiSuiwZjRC0SUDD8Hia5/OTPUq
	 9wxuDAcDZb0QZ5GAChaGAcBgBKksNBOb4ebOcb1EzxsoCylDdLUqLE8ZXuSs1HE17C
	 kfFJJD3CePZ864ZkvjomXdPbKrcy/Bufc9Ee/efDWB0lOaftHpiNqnrYG1fvPZxzs9
	 D5fS8nS8s1S5Ebax96vEavxOR1pKpPhV/qv8nCw66ABV0yc2K6znE/Z5Rm+NUwf7om
	 Ab8Kw0tL+Y2pA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B84EF65871;
	Thu,  2 Jul 2026 08:26:29 +0800 (AWST)
Message-ID: <906cd5f479fe4b80ea3d66c236f259bdd644bf78.camel@codeconstruct.com.au>
Subject: Re: [PATCH v8 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 09:56:29 +0930
In-Reply-To: <CAF7HswP25GXigSqL+bGBz=0=RST2XjS7fNmkKcsy-qjxfg_1jQ@mail.gmail.com>
References: <20260615-ventura2_initial_dts-v8-0-c89f92c80447@gmail.com>
	 <CAF7HswP25GXigSqL+bGBz=0=RST2XjS7fNmkKcsy-qjxfg_1jQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kyle,

On Thu, 2026-06-25 at 13:35 +0800, Kyle Hsieh wrote:
> Hi Maintainers,
>=20
> Just a gentle ping on this v8 series.
> All review comments from the previous versions have been addressed.
> Please let me know if there is anything else needed for this to be
> applied.
>=20

Sorry for the delay. Your series is in my queue of patches to review,
but it's competing with other priorities.

Thanks,

Andrew
