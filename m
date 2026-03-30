Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6639527A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854773; cv=none; b=CT2RK46FP5v5IpH/5E+by8PE93NjVORwYWw2oBdJy/D0kUXb3BTqtGjta8+UUvOXOsajVnftyYD0JrLECe9oNv/eA6onPUH1bdpOggh9wr37O0K1cpBGwDstXixzPD9mNrLKIR5feMDd37svH36BRPteJnnyE2o65heBD73N29w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854773; c=relaxed/simple;
	bh=rZRZNnj+SWl+nEX6p5ljgjH/OFu8jr4+GWCEBdSVUQA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=b7YPwLxg7oPk3u9VqyFmIR+g+fKhDu5znwqBvd40ojXT3YdI/edZVy8HRRuwjjhP3MEBHLRAwu+fYDr2WtvbNb79UORhGpj3mMwKIXRmvstoM0tNHnSl8LTiZQ87Hauq3Tldj3oULvy/WLHUr/e5lCkuHE1HmeOK64+xp0aXWJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas1t1774854731t870t42468
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.227.224.139])
X-QQ-SSF:0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 968294333165646595
To: <patchwork-bot+netdevbpf@kernel.org>,
	"'Conor Dooley'" <conor@kernel.org>,
	"'Conor Dooley'" <conor@kernel.org>
Cc: <netdev@vger.kernel.org>,
	<conor.dooley@microchip.com>,
	<Valentina.FernandezAlanis@microchip.com>,
	<andrew+netdev@lunn.ch>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<robh@kernel.org>,
	<krzk+dt@kernel.org>,
	<conor+dt@kernel.org>,
	<daire.mcnamara@microchip.com>,
	<pjw@kernel.org>,
	<palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>,
	<nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>,
	<richardcochran@gmail.com>,
	<samuel.holland@sifive.com>,
	<devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>,
	<dave.stevenson@raspberrypi.com>,
	<sean.anderson@linux.dev>,
	<vineeth.karumanchi@amd.com>,
	<abin.joseph@amd.com>,
	<theo.lebrun@bootlin.com>,
	<Ryan.Wanner@microchip.com>,
	<haokexin@gmail.com>,
	<netdev@vger.kernel.org>,
	<conor.dooley@microchip.com>,
	<Valentina.FernandezAlanis@microchip.com>,
	<andrew+netdev@lunn.ch>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<robh@kernel.org>,
	<krzk+dt@kernel.org>,
	<conor+dt@kernel.org>,
	<daire.mcnamara@microchip.com>,
	<pjw@kernel.org>,
	<palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>,
	<nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>,
	<richardcochran@gmail.com>,
	<samuel.holland@sifive.com>,
	<devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>,
	<dave.stevenson@raspberrypi.com>,
	<sean.anderson@linux.dev>,
	<vineeth.karumanchi@amd.com>,
	<abin.joseph@amd.com>,
	<theo.lebrun@bootlin.com>,
	<Ryan.Wanner@microchip.com>,
	<haokexin@gmail.com>
References: <20260325-unsterile-flail-4c7729750dc4@spud>  <177482042554.472023.12757157452690281696.git-patchwork-notify@kernel.org>
In-Reply-To:  <177482042554.472023.12757157452690281696.git-patchwork-notify@kernel.org>
Subject: RE: [PATCH net-next v5 00/14] macb usrio/tsu patches
Date: Mon, 30 Mar 2026 15:12:10 +0800
Message-ID: <06a701dcc014$86def5b0$949ce110$@trustnetic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQF0vN16QhDCAi1TInuOp+Z4l0ZKlwGT8tMStooKEUA=
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MkOjZ/hwdQd+OTBDlGnYreVuM1f5VMv7gm7wKA+A3589TLw2tQpbtCfE
	Ab8WOr+YFEtpkUdAvQgRw8zmQFC7dv+hdsnz8k/oJTVJguK5/YNvxG7PoPRyQTMI56jh/Sw
	+3sDGDdRPTOXCVOK4yvJMiTz8ZJHCPw0sSpJlJkuY1/bnF5TGSHvL8kQW+lSd7CxJZvzuQc
	LT6fnncjvcbv3Bz7lFM2wJdLelPWHhxeV+y/oSsuh+TPeAV4rHCk26YEIfIyJhX7nttY9VM
	3/IQitpnSD27Mb1xCAHUoO/L44Dq984fWgm9wSbM3MXH4erKWGpaoGea2wZHxmbuvG1Qpc4
	50KU1eYIyRbJ/rLQv3f2dHvjI9fZR65Cz77rGB/OoZZvGxYW4quoql5FwZC0IShfRxLOPDV
	O1HCI1WjIRnvdqEY4PXwcdWOC82u0wRsh82NhEEyhmauw7NEE0cYxs0gxn4G1geT1acLc/A
	ahz86pJskkLgWd2f/m1+FQZRWZEgp1iEq8f98gMPwrt2nP/NeIjmlktaKNCVTWHk0NwmO+0
	c++ajJAbWshy4/lUW1oc60ZPjGUrJq8uUBWZ2lrCqusmNYGqztpFu8y3IenNN/ZqJBORYfq
	PR6l1qyA0x5o83C3/Aiirw/KnsAv6cs7NaYdo2y7ylGZSlRD79dLqtFVU1Kr2O+VlcrEbDh
	JVsCLQOtJMQZmQoaa1qg3vwJ1etb85v0rXzA8dz6HyiwXuKSRcWFkv3NyMSOntHIv+5TL2Q
	HbeXMP0hiiLebHJGXiNipzZB3GhTYRR/WuDqRDgMkOpufl/rx53KtuqdiLLXKejvcOi5pW3
	TsdUQHkYdW+U9oC9b9HuKdpAwZiQs/6x2rZ+GOFpLkgeHj1zW7lutUr0vduk5LXBsf5FzQw
	50ekR/1UpvaPZqBGUllo75aJnf8FtgPnVj/N5N0ozlvSneLwDJQchwI7Ae3lJv4VPirN6Hg
	q/vEHCaSP+alzOCI4/FyO+ER1ayWC0XwkQo1VzCEaHsFckYvhy9x2MtmqX5aQ2aWkYTcPOJ
	LePYqHeANJLlu1lasMk+k0Mq1tamm9zMsC6eXk2g==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

> Hello:
>=20
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
>=20
> On Wed, 25 Mar 2026 16:28:04 +0000 you wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Hey folks,
> >
> > At the very least, it'd be good of the soc vendor folks could check
> > their platforms and see if their usrio stuff actually lines up with =
what
> > the driver currently calls "macb_default_usrio". Ours didn't and it =
was
> > a nasty surprise.
> >
> > [...]
>=20
> Here is the summary with links:
>   - [net-next,v5,01/14] Revert "net: macb: Clean up the .usrio =
settings in macb_config instances"
>     https://git.kernel.org/netdev/net-next/c/8ccf062c6770
>   - [net-next,v5,02/14] net: macb: rename macb_default_usrio to =
at91_default_usrio as not all platforms have mii mode control in
> usrio
>     https://git.kernel.org/netdev/net-next/c/a17871778ee2
>   - [net-next,v5,03/14] net: macb: split USRIO_HAS_CLKEN capability in =
two
>     https://git.kernel.org/netdev/net-next/c/039f185a0060
>   - [net-next,v5,04/14] dt-bindings: net: cdns,macb: replace =
cdns,refclk-ext with cdns,refclk-source
>     https://git.kernel.org/netdev/net-next/c/dfa36d7e860c
>   - [net-next,v5,05/14] net: macb: rework usrio refclk selection code
>     https://git.kernel.org/netdev/net-next/c/6c5b565d7d41
>   - [net-next,v5,06/14] net: macb: np4 doesn't need a usrio pointer
>     https://git.kernel.org/netdev/net-next/c/826cbe636e10
>   - [net-next,v5,07/14] net: macb: add mpfs specific usrio =
configuration
>     https://git.kernel.org/netdev/net-next/c/c711311d6ba3
>   - [net-next,v5,08/14] net: macb: warn on pclk use as a tsu_clk =
fallback
>     https://git.kernel.org/netdev/net-next/c/3fe13d858f83
>   - [net-next,v5,09/14] net: macb: clean up tsu clk rate acquisition
>     https://git.kernel.org/netdev/net-next/c/b698a1e397ab
>   - [net-next,v5,10/14] dt-bindings: net: macb: add property =
indicating timer adjust mode
>     https://git.kernel.org/netdev/net-next/c/09a6164a4f1d
>   - [net-next,v5,11/14] net: macb: timer adjust mode is not supported
>     https://git.kernel.org/netdev/net-next/c/41adda8764fd
>   - [net-next,v5,12/14] net: macb: runtime detect =
MACB_CAPS_USRIO_DISABLED
>     https://git.kernel.org/netdev/net-next/c/47c86c463612
>   - [net-next,v5,13/14] net: macb: set MACB_CAPS_USRIO_DISABLED if no =
usrio config is provided
>     https://git.kernel.org/netdev/net-next/c/32fc6a9f6e75
>   - [net-next,v5,14/14] net: macb: drop usrio pointer on EyeQ5 config
>     https://git.kernel.org/netdev/net-next/c/cd1082a96f9a
>=20
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html

Hi,

There are compilation errors after merging this patch set.
I believe the error occurred where the CONFIG_OF is not set.

root@w-MS-7E16:~/net-next# make C=3D1 W=3D1
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC [M]  drivers/net/ethernet/cadence/macb_main.o
drivers/net/ethernet/cadence/macb_main.c:5755:19: error: =
=E2=80=98at91_default_usrio=E2=80=99 undeclared here (not in a function)
 5755 |         .usrio =3D &at91_default_usrio,
      |                   ^~~~~~~~~~~~~~~~~~
make[6]: *** [scripts/Makefile.build:289: =
drivers/net/ethernet/cadence/macb_main.o] Error 1
make[5]: *** [scripts/Makefile.build:548: drivers/net/ethernet/cadence] =
Error 2
make[4]: *** [scripts/Makefile.build:548: drivers/net/ethernet] Error 2
make[3]: *** [scripts/Makefile.build:548: drivers/net] Error 2
make[2]: *** [scripts/Makefile.build:548: drivers] Error 2
make[1]: *** [/root/net-next/Makefile:2105: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

