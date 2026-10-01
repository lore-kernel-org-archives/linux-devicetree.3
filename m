Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D814D9F7D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843159; cv=none; b=oDbgDlWVnNzZ7pVKTKdpdnwh7IHqmiBeNIrWcR1EcSirMX/WJ8tiVIQQ0DvXyU1wbsGHwyi60nv5J+fXVq+IRvb3evgXghpSRdVbr9hFVg0lPLpaENpWfc085ZZz7+jlnXvpoL00fsQ7SYgH8iAZIIX2YqvrPQwoBxowyMC/HDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843159; c=relaxed/simple;
	bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL8yWTQIuxJ60CeaM4zRSIITJ7xpxpTlm6oC4+oNukVkft1AfOvIIq6x6Zq4WnpC3bXAjTxPF+XoHkk3J8OzkNF14mP+mZZedgcwfhxeMcdohkZDKjSqLcJWClsVXxRePtskrKhkrrd/AzfecGYy/D9hTFXZBmM8NUy4Uf3KVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4zxn7b6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4zxn7b6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso64311095e9.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 01:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843151; x=1791447951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
        b=N4zxn7b6ik3XZmkw0SNQddw/ORdwIJ0lW7RMg+a9b4//ogbCekk04Ppcka/zq0l7ry
         SCCc89efjQSuIjf7kSuVZaYDgktyCC3PPMy2JKAaqS49//0JubDdKqZu++3Nf+PP3ZpT
         D1CEKJ8OD6DCr/RKuwtxsFHhFdO2bUWvYgDxYzoE9w1tNdyOC91lfkoVSiWtVSeI4Xya
         LyWzG/uuxw1OJ+yjQE7cEhAO5zCWBKXzQRWr3AgLwAxNJ86bk0+pD+ykQOkH0mnbdhvS
         Ew+44tw3+1+KR1ZPPZ7fCGLKv0ljj2lg8c7eMYm8DmP6M3/FkPm+EWTwiB1JjMdUKrMd
         Z67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843151; x=1791447951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
        b=m+CT9wusfF4BsISq3Dqp0AsyZ1h4Sot/tC9D2kGPtVZFH++7/mn97ios6BQwLWbZfV
         kJ47eDn3N+bQkeoSRHwVSH/RZ7NM9cu8GId2pqsZuyI000kPfIHwip4UvDtW7NxVOpWe
         ZdbhGHkUORgsnnKl45gfnmJxDybdODj+TMEqTewDya2Op5OrPzpiNjyy8WQfIMaXwlZF
         YBDDhYLWG4XfbUFM6fdMYd0ATqVK6HJpsT4LKV2haiZOMv6q6D3sHz5Bc6UjhIZnHztR
         FqvCNcU0V7XuDx3BujH9+IBSgCfUBkv953Yzp7Jeer95Mn3v1ScZFxFgHJgZtC1div2b
         P8PQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1IauKMumefmlxg1FZg0hin5M68Tn6yHcuEwiIp2Fx/0BgK7j/cP0WRy6i+tCa3vWAB2vD8Qb2Y6vL@vger.kernel.org
X-Gm-Message-State: AFuF++kjXxkiHPVbYLTggxs8BuD49bKKBDje5Qa6CWliyhE3x6MqOvA+
	2rPzQPo0B7HwWoOf21D0yO68+SxQ7YDq2pQ9Bniu8ZV7EyZJELgmoaJl
X-Gm-Gg: AYBFou1S3+1jK3CYY9R0cSmIRHzmVSPn/5KSGTaSniS0yp58nLUPC4WmcLccoo1wwyJ
	rNzWx/gLpZwgczr62fRRbmolURmZJUfLj4eaueynTMwF3YPfmrOIX6tC40NV6/MyrIbbVzsVPNf
	pyhppVAbZH6jQ6wcOiThQUWRSS3da04bJpWZoHASURb7/FOihgp92BQenaGQRUoRMbeykCyXQ2z
	9NlYNB8WNpsrbFI0u2cpnziojKOhvW7nuXuU6AMm3vWezZBuVvxlvDb/yE9FD3YzO2T6nC4SV7y
	+0SPZViixiNlmYxte8Iv9sk9VfsqItU/VN011wYD+7NzDaFTykVx5L0I9sI+Xvm+/VSeUfweGBd
	dIr5xlXBjbMiVKsEcLNTz1iykLWiYV9IARr8ik4oteMxLe/XqlajwP0C26xt02PmQE/82Bav5TY
	oRrwFiaKW/Nc52IS6z3sSbeDWaPaQIOkvClGLq/irTr3BSInrC3/931JOwzFc08jP93AS/2Sa4K
	cZeDzZMQ/VREcP92LjBdACOlYjb/1cbv5NofBgffCvH1Hc9mu1DbsjAJC7JPOIKXOtDk97AwQ==
X-Received: by 2002:a05:600c:a45:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-4a01afde48emr58311595e9.15.1790843151361;
        Thu, 01 Oct 2026 01:25:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f947898sm54455885e9.10.2026.10.01.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:25:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 10:25:49 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Message-ID: <rq5ndq2sqsyoqwhnbdy34etudy4xevdqpm7imgd65uu6gy55nj@wpt6jrgnq2vp>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>

Hi Frank,

Is there anything blocking this series from being picked up?

Thank you and kind regards,
Ernest
