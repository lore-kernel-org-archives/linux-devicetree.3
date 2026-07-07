Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4FD4314A6;
	Tue,  7 Jul 2026 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440178; cv=none; b=ItvFEzTI2DxwFjQzfUxnr7GmLk6Hd2ukWvn73quxsc5vQqbPMufUtg6HNYPvJf4JY46laR8T+mcy8YUQA8GFc4+D9RqAl6U7ub9OmS+R0qCMl/pedyo4BSOY69chioPF07DPW9FZr5tbWp335z/4S+PdW0axa62JsXhZ2rrEeBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440178; c=relaxed/simple;
	bh=Z/VNYRp0/l4OwyI5qYKKZhYSyF1wj51qp5CvPluJyyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/qT5uA3Td9nRn89ospAHMVdJryJeSXxj0AvEIoQejN3QwFjaOMukKtNTYGQfsXiMeTLzZoiPPSYPxqnzGjGmzGJGMaDFkLNLHu9NFEZ8kTZkeCM42bBoJW6qQyUZ015H4EMkCsKZZXtT93QAo/Ieb2TxqOHKdbPB+1m/kGWwgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPbbn0+1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPbbn0+1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AB31F000E9;
	Tue,  7 Jul 2026 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783440176;
	bh=U/kleJQ9P4AhKsgCRwcIZz+QK3cU3+20xfdwovzQhXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPbbn0+1zZuyCX0JSye6IHruhLF1bAe8FajcAXIjMeJcJOK9wUAdsBX5ed26Cy/tM
	 2OJXjD2hg2v+rCtrRIgurEjmGsEABzifLbsM4h9c3uCCr3q+foVHo+OVdh9tFdmlk1
	 QCYA4I+Vow3tU7AtC39XH9fwGb2OVNaWkYsYHIT2KPSbv7U2u2uwqJbbkr3uZkoric
	 GQPg7WPNxAjD5rauyGVrJzRYcr13CEtvz6bvsLpZKQiV8bl/ye0qGaMIA5o1XLpQNf
	 /So6HDlaZVpElKEfzVKibnwUtuDRsllr85+pnEB+/1Jj7eN8M1jI4SzjvQu5PRf1W2
	 lLpZVKUINw/2g==
Date: Tue, 7 Jul 2026 11:02:55 -0500
From: Rob Herring <robh@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: heiko@sntech.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: add Vicharak Axon board
 support
Message-ID: <20260707160255.GA3176120-robh@kernel.org>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
 <20260620053759.9841-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620053759.9841-1-hrushirajg23@gmail.com>

On Sat, Jun 20, 2026 at 11:07:59AM +0530, Hrushiraj Gandhi wrote:
> Hi Heiko,
> 
> Just a friendly ping on this series.

How about replying to the sashiko report and/or fixing the issue 
instead of sending a ping?

The .dts file also introduces a new warning:

      1 (rockchip,rk806): Unevaluated properties are not allowed ('rk806_dvs1_null', 'rk806_dvs1_pwrdn', 'rk806_dvs1_rst', 'rk806_dvs1_slp', 'rk806_dvs2_dvs', 'rk806_dvs2_gpio', 'rk806_dvs2_null', 'rk806_dvs2_pwrdn', 'rk806_dvs2_rst', 'rk806_dvs2_slp', 'rk806_dvs3_dvs', 'rk806_dvs3_gpio', 'rk806_dvs3_null', 'rk806_dvs3_pwrdn', 'rk806_dvs3_rst', 'rk806_dvs3_slp' were unexpected)

Please test your changes and send fixes for these.

Rob
