Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E79D4B1B3D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788321; cv=none; b=FY55c5Vp5cIoJhlMjRuuYWLdh9If55uqiLhLjEEaI1am+9nigO4yPmx04m25NIM6cYDs1KnjoF3JKWvNRThyjpJNwS7OlIYGSHNNr1WcJqdZXzcZLY2m+Zio9rrTQgPl32WmIUDx1SGaI9pbvil79QCddWM2S8AJQCObP1G7rhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788321; c=relaxed/simple;
	bh=iaMpImiqRfMHj6DqEGiyzWM4yVp5IzapU9WS4TDmgCI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=nyZifUh6tAi6Ll8VT2VLI3oIgS89LVzWCH4FSou6jM5rBJxFwtpJgGREJyMdraX0bfTfFig/xoxW3Mm7FZvVg8s69qMMJeZGBurxQxL4C893gMrpo1+sugmtmq1ebF94K9fEdqRarsG3l37SrKVed14Rs4PIOVCKmhDhYCQV1kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=CDotD+3c; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="CDotD+3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788788318;
 bh=slBfEXfmlFqojlsYQ0rgM6V/6N10xUVb/4TTHC5BcLU=;
 b=CDotD+3cCRzL9MBL8BtQwVRbJaOZoIzpcsANd4A2ColkmDrJ5Vt9pHA//fjWyxQbOVzmCE/P/
 ij+Erry7l4ebi53LMSQ34mi7RTrkW73A1oSUrXczOXyJI91tGDO6ZqOZPmNYBaEFmJZDQQOZeMH
 qljNLTbJ7mq1GqZZCtP+MFm3q/yc9OteO8eCHQ2YS2QIDHHTeQJiJUVHKfWOuotcBq2N49/mca0
 EiNiVvkV2SDSlKvNknANl+2B6RlecvVBpiUVNJZvJkc04MRyHHMKHirijqNJSTzm1/F0FZoPDIh
 ZOEWWpNEzl/Jze2eRNGij6msiRyzpuYMw9XpbEEb7lJA==
X-Forward-Email-ID: 6a9ebe5670f4b45aa0d06668
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 07 Sep 2026 09:38:28 -0400
Message-Id: <DL94J88RKZ3S.2EX69YJ6JOX4P@ubuntu.com>
Subject: Re: [PATCH v2 11/22] thunderbolt: Find Apple VSE capability during
 startup
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Andreas
 Noever" <andreas.noever@gmail.com>, "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-11-1f80085f93fb@kernel.org>

On Sun Sep 6, 2026 at 2:36 PM EDT, Sven Peter wrote:
> Only Apple Silicon host routers have the Apple vendor-specific extended
> capability. Look it up when the software connection manager starts and
> store its offset in the root switch.
>
> The Apple NHI driver can then use the stored offset when programming
> cable information without searching the router capabilities itself.
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/thunderbolt/tb.c      | 4 ++++
>  drivers/thunderbolt/tb.h      | 2 ++
>  drivers/thunderbolt/tb_regs.h | 1 +
>  3 files changed, 7 insertions(+)
>
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index bf1c192ec10a..d2832323cc36 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3025,6 +3025,10 @@ static int tb_start(struct tb *tb, bool reset)
>  		return dev_err_probe(tb->nhi->dev, PTR_ERR(tb->root_switch),
>  				     "failed to allocate host router\n");
> =20
> +	ret =3D tb_switch_find_vse_cap(tb->root_switch, TB_VSE_CAP_APPLE);
> +	if (ret > 0)
> +		tb->root_switch->cap_vsec_apple =3D ret;
> +

Nitpick: I *think* based on the surrounding code that this can be
simplified to "if (ret)"

-Josh
