Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD4D47F2CA
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844986; cv=none; b=KOKLhNPVUPty9M6Oaviur/K4Tgmjyj0jdsPCF0u5zHJlxjMUSTP6bWlwiosBgIjnqd9UFwT3n945Rfv/iPqpu9VmV0wvFsYhI5NtwRMKI5eFMVVyluFVMAjkI9k4XhiIG/vzpyCiruOiLt3FdfixJoS0BXK79jK5g/bYlBMePRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844986; c=relaxed/simple;
	bh=IXit39jokJOkDKdV9ozjAq5puFGqOrTpsC39d5ly7YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZO9oKTpHhp7VFpoA14Omfqgp2RiJfKcUk1oTxCW8mT0Rp97mpd5F8hviQoX9mTyhoG1U8j0YPpcOide0eZazM9GnBKztNORJ+/B+hJfa8d84C3pYiInhr5kw7hr+A+Ko+tSmayl2286kLmdouGHQk8/GEoTK0hIurM70OjCnGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndE2+w2+; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndE2+w2+"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so138822a91.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787844984; x=1788449784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=ndE2+w2++9Cg8O4juXiYVelRJmQ8+HFiDcLp7iuv2/g7qeuZ7eILSSdAxdPszUz7Ru
         2wdqKVTcdG4fFxooYcxMwvcd48PmQYg9OnSktXlAtGgzXVuWhF7323RDH/BceKPxVGl9
         HZxfOc3C1ZZ584so24PKu3406w1E3Chggu+jPmz8dhJcJqcHPIcCJLC2HWvVoFcbxNq7
         6BcamcvNRXPIyXosEwaDEpEEAfjtdzd2gDDajE53qYvQeB46xQJIPmae0qfhglOxForA
         RZ6ubRz/zBjMWcj8WQKKz2h7UFeLPdh2FPgTU2Aig03NFM8CrzTHhUBSci1vLGA7tU4+
         Rsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844984; x=1788449784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=PgjOf4UJDBKao1VuTblUsLCa8VbWcX9nIL+6Qv7yTOTCD04LApNe9ULWaYu2/08WeP
         o3TPo8VTRFVprA+HpxjFWsZMhKV1WjBX1VpbiTYBa/KsB97RgoW+bCpZPy+9E8epwwIL
         JV1zGmVVE7PPoWDqjRYNOeH/A2RM/dyYcaD9SFdac5vA4YS6ex5/D7FTpact9TT4DabV
         lPYZ8YXj0IDTX0qAnl3nyLYLhfP5/e8G6Ox1olMtAclmhLNZIQyl2rpt0EBpxZLg9AjD
         JgRkpWndHg4vqCCqkU+gOjIUmYboqF3ZpZE4FQjPYDwwRaGbgQHOrDCbB9Ypf4B316Lj
         uGzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHt4nF590f9dbtQ502qTogQ77+/YVPDK+iPMtYbyPAlZ/Bd1FsF9rehvChYVLiyIRquCJrjqzMw4x3@vger.kernel.org
X-Gm-Message-State: AFuF++mAfGNyd4Il6R4vqqfk6tP8VLBDDE/A9hcdX3Jr05dE3TewwCLh
	er2EdaCh2iWX9s8Vq5xfDNErLBSJ7w5z7hw4U61u6I38a++WgAhP9tsuz32M5sXaSFc=
X-Gm-Gg: AR+sD126YnKy5BOzBABkzg0kZpBobEe86wyyvyDExET6dTB5MQt0qzXtNloJ4dudgEC
	EgtuP877QzcE/ILDxJFbpIsfttb1vUascohommowmOft1tshfAvNSJ/Wl8BN+fSxLCz7qCBwVSY
	LnCIDKDXNKLcfajK/bmYjGg0pVDm15gNjBvwtEzIzGTIXuUWEwzSyRlJtgHAmgD2xpMwKdSUf6k
	r6TZDvewL3wSHkzj34hXh1zSkmuhnfkw1PvhWp2SMtPzuJRz6zfu9fTxkRXICz+ZQfASyhBwrqp
	S85wAdw+VaScpL93oEfMbhUpYWGnzObBt0Wq81F1rxVVx6UQpO5TySJlaP8tkCyv1Q5YxpUlGgo
	TQL94aJzWxQxyytuaxPP4jddBacx7+ywfiMFhPU9G7KmLxdcBBUK01B22/0QIHq9wa13nj8orPM
	xHAueVxLBzwS/K9tBmCB7abdBeSF/FyV/EY+ehF+rxnrZ7hGjwM3bBEpflYt2/vdO0
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr169425a91.4.1787844984074;
        Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:887f:45b3:fb30:8d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm3187307a91.8.2026.08.27.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:36:23 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:36:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apBZdNozfoCUp515@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
 <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>

On Wed, Aug 26, 2026 at 06:36:54PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> 
> NXP Public
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, August 24, 2026 9:39 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
> > subnode support
> > > +          gpio@1 {
> > > +            compatible = "rpmsg-gpio";
> > > +            reg = <1>;
> > > +            gpio-controller;
> > > +            #gpio-cells = <2>;
> > > +            #interrupt-cells = <2>;
> > > +            interrupt-controller;
> > > +          };
> > > +        };
> >
> > As I (and Arnaud) have stated before, I don't think this is the best way to lay out
> > bindings for rpmsg-gpio nodes.  I am currently thinking about a representation
> > that aligns better with other virtio devices.
> >
> 
> Hi Mathieu,
> 
> Would you prefer that I wait until you finalize the layout before submitting the next version?
>

Let's wait until the DT format if is finalised.
 
> Shenwei
> 
> > > +      };
> > >      };
> > >  ...
> > > --
> > > 2.43.0
> > >
