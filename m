Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88517361DDC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 02:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874351; cv=none; b=Kbm80AQpqOH+keoPZsavs8YxmW7MO2CCciCOtjrVhPiw5NqAkHJD0qp6IPIHP+l2w0obS65ieWHkCL/wYzZdt00beRGq5MCYOjmYdAtFPdJTAPW0VK/17FY9/HgBx9cNbWI1OMDWF6UdSF2iajKF95ljkuP34H3EhLLaTXhExX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874351; c=relaxed/simple;
	bh=44fzqAqAQmZd82SGPw6u9V6YlwHz0Bp/+M2HOF6SWEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkELf16m9KXap7bzvb37uaS3gAUdIAXk9yrCW32PqSud09vBgMJT7PxiNbkhTLNx3I8zs7mwOpheSgLr8pvxPDwdv8Z0e5WEtvwAzauGzUWsqJTpRluMumiA9k2BO9JlDigbzfW9h4CSdT8EqdSiIWNP9X7KOvzB8705/kCJlaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7fkYCtB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7fkYCtB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso986055ad.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 19:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782874350; x=1783479150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeV9JaadQ+vcl6bqJUQYCDM0J8gadbyefPmolbV0kvs=;
        b=G7fkYCtBmsyFfbrh4Lf3JgEuZwHnLXrNgrjI9rOFlRAiU72l3bTNytFfL1JkZZSs3l
         mpmU+ErGzHzCVTYkrvWBiCC+SReFyF+WY6VB6RUYML3YWBtI2TwLbVjKGEQRYEtf3ex6
         G9aHM7uZP+WyqOuOlHMxSrMMyNDSUYccYif1QIO/InPMbGVx8xAlH5aAjFzJhKod+uIV
         o7kusXCuth5su7NRATn957eA4hFYRn/jjFGi2zvVxC5pscQZ8AfziKRCd/0Eqw1iePv6
         iHi5WWK0RfeRoq3F4H1IwE6/hehdmzcBpM2c1+IXtyOeHa4bEcNr6foz0Q+mNGlnrQtD
         gm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782874350; x=1783479150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JeV9JaadQ+vcl6bqJUQYCDM0J8gadbyefPmolbV0kvs=;
        b=VPOo+eAe6ir/REwY0L8XRS1/cJ1W097fbbMfbpqpMcHIhasOPnPZG5hhb2pI0c+PVQ
         cByKonZcOG77iBzFn57OQXqDh72vLH7Ck2c15GrpwcPip+rVfQKhSpJC6qty1JlV9ZhL
         +jJcXAow9YUmmUJpmybYGTCQylgVp9hncckWYgSBb7y527LFc7sJYLCXdrWwN8nN1zRA
         Uc1mq6jwydQSIPRV/7ZR96igIwzjqPH8U8KwUUEUdKeRy+BCiIw7yHqkg8dYEEAbGiAd
         7fSZ4THmHf73qqqmIzUzX/rPjwGNiuSdKTEVV7BgoWAkMrF9ucDaM7eW4zhwXY6tvLE8
         6C9A==
X-Forwarded-Encrypted: i=1; AFNElJ/08AOfinDa2buDaATJw6xPMHUJvFe/qfcJSh7zQZSb7mJ7PVUCLNUljm9KsyX8EncKkAV4W2PH1vPa@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbgcTVmKGMvAM5MMi0sflu23tNp1v1LhvIbS0QGYcSEfFBOXq
	H45U5o3AzprA5nGMUpoLZ/2TKLDUY/seSk7Pn6OpgRth1p3W4HRjYzNG
X-Gm-Gg: AfdE7cleXdvro4Onq48igRPkWkpax2lgcJBC8pKuQ3qLfQ/RCmJBg+XHKUMuK3siZJl
	7G1ZGYnaxFwpkuzcNPpU8ZBsBxb1gsmNsvGly4xQ9Y6y3xfT2PN/mWXfdEReE0oycnu8VyxQOES
	kqHhyjsjc0pz1Tt+t8QC71dKxxR3P7UYJX68mwLNGGfXe4Vc0sEcAVccuul2Sh7gam3u+8K5Czu
	f4e/AE3tdIZh3VgDl1ivElJBv7ZU0QshBi3FBDtHvB/tvLdtIlyw9SMOvNVF99DXPnPScXAb25P
	BceOejgnW0EYzumj+09RiaG4X0ae7PLVubPbfLw2qKqd9S+wiuoK2ErFBsXhtlgC/BFg1l62gVJ
	xLUQX/XF8/4Gn0XSz/3nAR+wz1XMkmlG7lglpXa65o1Y4iQtKwiGc9UYG30v0IdH1+5RTvJECgl
	90Au4jTtyY4TzKsyzrAbrYouMzBA==
X-Received: by 2002:a17:903:1c1:b0:2c9:97a7:328c with SMTP id d9443c01a7336-2ca2ee8e0d5mr49499495ad.46.1782874349751;
        Tue, 30 Jun 2026 19:52:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382abefdsm24200385ad.59.2026.06.30.19.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:52:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Jun 2026 19:52:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Message-ID: <1c055984-0ed3-4cd7-bd70-a333f7a9e353@roeck-us.net>
References: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
 <20260630091122.1462-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630091122.1462-1-dongxuyang@eswincomputing.com>

On Tue, Jun 30, 2026 at 05:11:22PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
> 
> Add device tree binding documentation for ESWIN EIC7700 Voltage and
> Temperature sensor.
> 
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
> 
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Applied.

Thanks,
Guenter
