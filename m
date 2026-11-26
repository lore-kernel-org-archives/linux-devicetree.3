Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711066;
	b=f7yKXXINTcSPJBYG/vuPygspKASRKXIn+OHS+DvSzoUHfbuxQn6opt6tWJrLDFJm3YfO
	 wHzU/jCLmaZ1Rcc24Ut6xv1oAtXV1nq9LJBCNb8KhW15FNdcKPWodeWBqVKSzWChaEKa2
	 CAlx8sZqoeG9/E9XO+OHuol2jEgc8b0YyLbZsdUTUZp0I0vikiITvhJG7MDIceNTAStHq
	 0khoplzq4gPlgRx9tS7pmVm16e/5bJURE6kF2OAXDnjPtBKeQ617lGWVQxRCZE5v3NlvV
	 5wk2r4cijsJlF6MzUUKjdyolrkBznjejCU62v+i/wvrkhkJEECmGgitCLuuckBFYMxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711066;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=7N9CqDyP/26dU8hQlMN8Gw5eUjqqoWujGZFQZYS0sgs=;
	b=atvN0jwEhJeGp1+rK85TKKWhPSA1KS2V4c4nJ9eW4e1hv7TSbZmmKkt4Ad8n3KBvkgJc
	 AHXW06WeEe98Y2KHt0YYlTBdyHr/M/087rFZ12veWkBctJJY/4lKN973KBaqNrPbF67tq
	 I0MbrMijF15G0xT7eg8nK/s6pUlnA4l+pk6A5BIRt5lervb2VcxeONRMLLsoU7erRBRyX
	 NZehH60f30MzGG7G5Tw7HvbpF8KgN9ltQAleg2FrbrlPV6RNi7Wu1hROsihUYYy2zpU8q
	 2GLNyEEJYyzcUgHZYWRxBYK5Yc5dBGFSppZKXo8NpCGmq8iTOTGJiwg5trECXffFiMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=K+1sgLTx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Xg9JPNBB;
	arc=none smtp.remote-ip=103.168.172.136
Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFD2606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 16:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FFD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=K+1sgLTx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Xg9JPNBB
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 65B2A13809B3
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:37:45 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 11:37:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795711056;
	 x=1795714656; bh=7N9CqDyP/26dU8hQlMN8Gw5eUjqqoWujGZFQZYS0sgs=; b=
	K+1sgLTxn+oZBTF/0K4FnHg3YBph1wgD84vxNK6UhpqPlR/qd66zaA1hqkFw5krg
	OnszmlvpvAwYwj4hQWNwAtyZTxKCY8EhEGmBQXMAcy5PWCMssXGyVb7Hs2qzYlRO
	ZWvTtJ2Lzl5rnxvZNzrNygKD6oyDvWs/vG40fU0f9g/55g0GE1+3Q2GFpfZ4vWOY
	8aKDqIJgBvD7Wm4YhraYAQQn8MANQK3/SpDrnFNhk+tlEHUQczzY85E0IvgW4P+L
	rveJ9hngOTAD+n46LRn7JvAikvDVMBqZhBxfFM1M104Pww03jaFfyNsqXrsFwVE5
	eE8Axp9VLZ6vUweG249/bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795711056; x=
	1795714656; bh=7N9CqDyP/26dU8hQlMN8Gw5eUjqqoWujGZFQZYS0sgs=; b=X
	g9JPNBBBcLijRjk0pfY16YUtm1CBX414eOuCB1tIQRyaGvdZ1WDokwp5i8ZJ6GS0
	uICl+qh93lzuFNNHb70i3l4/MsKuT00jcqasjqytuRspXD3pHNjjyyZnuPR/x0rq
	OOKS9N2F54FoBpiyvU7sU0ih+KMDt3IX6b8qzX04R2nQgg+MWgQovtqzmdpIWNTx
	KlD34XCHWW2SzUeU6xC+xZL0L9uTBaZN8YixkWFWG0b3Jt4IwJhz7V79cpjia9Mz
	0F21yweNyBzJeY5D1IlqxTxa1FP1UHpmqHNEPZhM/UgfbCaOcKUwaXUyjx1nCCIa
	2ulCN/KRLgfn6w0leottg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795711056; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:lmRyV4zoWVawHM72B+ODGiUH9WzGYhkH0mpendV+0q447BU
	grXQVlwx09OS6lVSlq1joHT+KTCEFRlQchEWgZbiX5F5zgp0mpvmcvo+l+L1C062
	rwDGrOcPeca0kC4qoZ1TpBHpUbenJiPYBzfN0ocm3RWyheiavVEzk/0IYwsPGLU4
	w4IiRppdwbhQ5TdDRMw/dabLonPWO6OHI03lUhwwDzL+tB8Mrw82WB34EX2Q6hWl
	WMP535WPJ9yNLkzKXJWs48+x4R4eplCmlGJkSfE2qCs9K7hJtkDP90UaQSass9PX
	+i2uCt+hlutPVDeCOkfHVxVMvx55Dpd/zFwubtg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nMgMgSrmiGsCzKZ1mh2+YPrLrgLtUqzrZKX5JkCu/Sc=:wajF0TYs/efJ2/mzQNPa/JmU/kugYKouUAKN30PKxIQ=;
X-ME-Sender: <xms:SWAIa-vo0o6uA6PbFLXnTvmQzGbSU2DyOyCIj2cgNpDSp0804okIEA>
    <xme:SWAIa-QhQ6uYrJZnoijlZUgLP7GO8p6gUGyCISolMa-3vMMiUkQP1ZWYZ0DukaMRc
    xvZo4K7S61xyo3fdNO-Hq7Zg6CDLOmRDDhu8jgjLtHVKFYGU5pvunYP>
X-ME-Proxy-Cause: dmFkZTGZmBWwU3V/QNYiKM+c/hRjR19JHOGb0aomStv+4VVeJ9evFBPg7DQ1RchCV40GBP
    GftWfMqpbi5jZblGSjmujJw8BZSDlznDhVZdjnrHzRRX5Dhk2k1CqMHF/hCw98rlww5TXA
    fZS7iCk9NQk4g+LETv1JEZTe9/4Rx74QDiyh1ReQZy2x5lFlMc+PmTHhjUXJn31qoFntWR
    ER1XIwZj451kFFZxQnzpoxkk4c9wG0TjhTZT7Ko/Ug2/dYg3y+6kV/57CF+1KTT0zuIxHE
    PY1t012qkgAHPCzf/gY3qbVz3YruN8nUJZfFIKhEqWQ2v73teGB7YH+UYcXCknwQkN8GnI
    LzYBwffXBVxkMRT9FQvBtkF+g/LyuqiO8qhR+tQZFUl3/I3y3GxpV/FjUwaBbUGERyltIF
    xad+tSnyP9m+NRlXdf280RwYsSkF1VCMkkgjBpQdGhCKymBMFQVlLxGJbCh2DZSrG2oVEU
    57Sv2u64G2rihlnmVwaBxkJBzo9sEM5lIbGa9gSycPU0XXCRDYRFdhj2NGmN9uQMtDVIbP
    5v5uHHYeO8lVVC2jJ872axQwvdR/qOZeNASNbNiq6HmLdaMsGcoV0tg1fK6/EstwdX2fdf
    XIOMgTGYiO/aTJmXYni9AAJeLQvSzkc2I6PLj1qN+0WEp3S/zyUCSu8npIuQ
X-ME-Proxy: <xmx:TGAIa3iD8udm1nBOqQTyK5fznYWiC7Bv-FUyIvKEnMGR5gg-MW0c3g>
    <xmx:TGAIa1rRyPzWDwegm5fOQtq_dASWPCDYcNv0aszADYx-X8nU9VGcWQ>
    <xmx:TGAIa7LkUX9F0jyterAiu0EfmIKZ0DI9kMj8zNwSEmBe8dY7PQ_lJA>
    <xmx:TGAIa6vyf79Wq4Jm2lyKozfySWmd-Y5FGvH3IuBWwUoU2AFMk52GuQ>
    <xmx:UGAIa5J8hd4Nit4hQqmMnSHG-bDwbXFwU7hSdlk_gK9OcrGQ-O72pZ-x>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 15134F800A1; Thu, 26 Nov 2026 11:37:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AEry5dm4iUXw
Date: Thu, 26 Nov 2026 17:37:08 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: "Koichiro Den" <den@valinux.co.jp>
Cc: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 "Shawn Lin" <Shawn.lin@rock-chips.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Magnus Damm" <magnus.damm@gmail.com>,
 "Jingoo Han" <jingoohan1@gmail.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Frank Li" <Frank.Li@nxp.com>,
 "Niklas Cassel" <cassel@kernel.org>,
 "Wilfred Mallawa" <wilfred.mallawa@wdc.com>,
 "Serge Semin" <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Manivannan Sadhasivam" <mani@kernel.org>
Message-Id: <0c3d98cb-6641-47a5-9f15-0cf315979069@app.fastmail.com>
In-Reply-To: <awhXFPlyc3vnmjtC@z790sl>
References: <20261020031049.969895-1-den@valinux.co.jp>
 <20261020031049.969895-18-den@valinux.co.jp>
 <CAMuHMdWk9pZdJ+eh0dNHrZSMVDe84_rsvmrD=pC1Fjy9wEyp1Q@mail.gmail.com>
 <awhXFPlyc3vnmjtC@z790sl>
Subject: Re: [PATCH v5 17/17] arm64: dts: renesas: r8a779h0: Describe the PCIe AER
 interrupt
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Den-san,

On Thu, Nov 26, 2026, at 17:24, Koichiro Den wrote:
> On Thu, Nov 26, 2026 at 02:10:32PM +0100, Geert Uytterhoeven wrote:
>> On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
>> > The PCIe controller reports Root Port AER notifications through SPI 454,
>> > separately from the integrated MSI receiver interrupt. Describe this
>> > interrupt with the "aer" name so the controller driver can use it for
>> > Root Port error reporting.
>> >
>> > Append the new interrupt to preserve the existing interrupt indices.
>> >
>> > Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> > Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
>> 
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> i.e. will queue in renesas-devel for v7.5.
>
> Thanks, Geert. TBH I'm worried that the rest of the series might possibly not
> get picked up, in which case dtbs_check will keep warning indefinitely.
>
> Mani, mind if I ask whether the series still in your review queue (it looks so
> on patchwork [1]), or whether there's no hope of it landing for some reason?
>
> [1] https://patchwork.kernel.org/project/linux-pci/list/?series=1189393

Oops, I incorrectly assumed your DT bindings patch had been applied,
as my grep for "aer" matched Marek's addition of "aer" for R-Car Gen5
in commit 2fcb7513361b4493 ("dt-bindings: PCI: rcar-gen4-pci-host:
Replace sft_ce IRQ with AER IRQ on R-Car Gen5")...

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                                            -- Linus Torvalds
