Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3735534AB1E;
	Wed, 25 Mar 2026 21:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774475844; cv=none; b=b3jqOuyK7Ua4txrsbbWq0C2j4jGNRaO5Pyx3W6cUQG74+5BHCxZ+bSj/dgJS/QEJpx+oIJwe7Vebt8mD3vrhJiUBEaaTa1sg4LOLItKHw1a7tTrc3zQSTnMiubo1fSjz7ZxVUi8Y66EfkQTNl2g7SU1WC3bSd5KtaJ6wT+M7Sj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774475844; c=relaxed/simple;
	bh=4ookYp8NfrvQO5CddLtBdIKFZGpiutFEIETmwjM++Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dh8E68Z30YfZ5C97T2Lyg27wPP4yi2PujI4MG5DIdZfJFzioR+oPBzTYIlBpasl12IrXcOmqjugaNPlJ2quDRSJSTpeUF/srdgfkIhUQdOEGzZp2DqF/PA60aTiNX6hPQ8yYQnSojcqluk6wx8YcdGitwyj0H74P4eqNABJBSQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwVOGOrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwVOGOrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F8EC4CEF7;
	Wed, 25 Mar 2026 21:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774475843;
	bh=4ookYp8NfrvQO5CddLtBdIKFZGpiutFEIETmwjM++Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwVOGOrM+YLpZrjU3ok11DrNV1A6E9ho+SqCC54G1If/RdQzgOzs0lQVJe521dgCc
	 hqiGgviM1JuZZcUtX/O6r1ePXXt7Y4W0+ZlHZMpL0K4RbBx7HsLSw7C01YLOHPObKQ
	 aiypy9aHfpurRjIMOSdk/z11VWnkRBr6YrUaVcsuWmoXvVP6aNNshuYc/mFk1bckYd
	 Sh2Lr1wjqZnwNVOFzG5m4srSAJYIP0BEDhthneOS2Mq0pa2hniyQFHYZsGYNzjpwS8
	 pVBHBwnrlKzJL2R8yyCAcrLreWnDzaEqsjupy/HdtAJ+iS1EriU5FGj0vRScqfr22l
	 LNwkTx2A4l8Yg==
Date: Wed, 25 Mar 2026 14:57:22 -0700
From: Drew Fustini <fustini@kernel.org>
To: Robert Mazur <robert.mazur@imgtec.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: thead: beaglev-ahead: enable HDMI output
Message-ID: <acRaQgAIp6W0pWol@x1>
References: <20260325-hdmi-beaglev-ahead-v1-1-e71b41b98dca@imgtec.com>
 <acQTGPHvoMDvLtDf@x1>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acQTGPHvoMDvLtDf@x1>

On Wed, Mar 25, 2026 at 09:53:44AM -0700, Drew Fustini wrote:
> On Wed, Mar 25, 2026 at 09:18:59AM +0100, Robert Mazur wrote:
> > The BeagleV Ahead board includes a micro HDMI connector (Type-D)
> > wired to the TH1520 SoC's HDMI transmitter.
> > 
> > Enable the display pipeline by adding the HDMI connector node,
> > connecting it to the HDMI controller, and activating the DPU
> > and HDMI nodes.
> > 
> > Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
> > ---
> > This patch enables HDMI output on the BeagleV-Ahead board by wiring up
> > the DPU and HDMI nodes added in the following series:
> > 
> > Depends-on: https://lore.kernel.org/r/20260129023922.1527729-7-zhengxingda@iscas.ac.cn/
> > 
> > The patch has been tested on BeagleV-Ahead hardware with the above
> > series applied. HDMI output is functional.
> > ---
> >  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 25 ++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> 
> Thanks for getting this working for the BeagleV Ahead and sending the
> patch.

I have applied this to thead-dt-for-next:

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next

There may still be time for me to send a second v7.1 pull request for
thead dt so I'd like to have this patch in next for a few days.

Drew
