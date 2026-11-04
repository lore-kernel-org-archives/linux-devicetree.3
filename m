Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779113;
	b=Du2kvPgHuCVAJ2+Lp5SHYExOEb8+wF09whYq4PXiAXVcxSHSxbirhWOOqt6w0lw+31au
	 EBtaQakwhwPr3gbBILUIhRRJ2RGIM2natSmqLLWI1m9OigJ0c3DUu++aluJIPOZMc1nuH
	 G8siypAEvtGsS6NY2ZbbtkeRtgPdlg87KOUnpM6LKV3W6/yKL/xNMIjXyhiZgUT/lzMqs
	 ZIh++t2BVuHkN7H/S7WA+a/aUQde3+msmKHtwB85alVJh/nr+IFLn0VC0set29kGrpjZ1
	 jZIlkUx7vWV2Bob6E9zS/YHDLzAVcOJdCSA3yOPRv/pdAh0b6wFALeJeC7NIUnqLgfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779113;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yzs3TvTUyCNgvkC1v8i5/KukWGuWF2PDxlQsJeMPHXU=;
	b=HdWZeVm21aolYjhlNLLa2Xt3FDsMk/i1Bt3aGVP79pQ+zRVlZP2XXN1+b7CujwrEVBYY
	 ElNCJ8q5Gxa0FgG0vVue03AX4lWR/PrY4Iz5hL26awUOrRejkE8+w8BUt4MiKJTabmTcJ
	 Qsck0MUqCHHbboUPHL1fQJHr5UDuiuPOKKXh9REoo21z0oUHkN2y8mon31AZnV/Rc67kr
	 McdZ43A/UgkO0fCZD3KgDndKU5EnfBUJaIeRyFQNsYwRJC6Gyl7+lHMqKSVvGy6OGat9e
	 n9eAJrPF+Teeg/Odw47lc1MClGoWIoIM3676ZAm6rmDAv9XYu+LmK+ihYTROvzqrrww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APD3QMfW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08CD606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=APD3QMfW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE551F00A1E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779112;
	bh=Yzs3TvTUyCNgvkC1v8i5/KukWGuWF2PDxlQsJeMPHXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=APD3QMfWSKD1BEqDuFPXE3+ohbtpJ6xbOkKF6/O6IX/sFmf/WP6tCTDPkk7Blzesk
	 9AEVKiwcntw99HFpLfc/vRRK6t0gNxTIHcHq6gE7VkH0GGGP9gA6kD74UuMoPnvQ0d
	 aeM08aciNUWSsTLf6qfTtyp8IerYG5yHTVghZ8eNRM61BcV9BHFMi22/mNmPB4rybU
	 KF5Nvz87trX80hDjstvXlqRP/RjVqVM6sTq+llZVdRujHeg3C+ozXR41e2+7gr+L2C
	 Kwjz4N1LwdZIcYXIK4HaVufFg8C/SwduBh5RJqtnmLsAfz/WtWsIWMBcNzUdGkFzHC
	 5L2yR8fY5rTXA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso463677a12.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 23:58:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwuolXPikojgKH40kXnTI2ZY83NLQ8tne2/uNognKH/0sPQvQnVo2+bnge3iMC5v60GrtZV5T58RhC7@vger.kernel.org
X-Gm-Message-State: APuU4Z/P/yxvPNEB6tw7U4AU9AapdWJ1cLwa5U2g4TExDo8CzWgFS1n4
	nfmzQV+cmPimFLv2ed62oEONP+lzFrXatehjdW/cp5FnUhkmdfwYvmneZE8rcvrJOeoaH3Ta52A
	VnhzsLcp8+gpertkDpSU+jGi3ZMFxylo=
X-Received: by 2002:a05:6402:4608:b0:6b3:dd6e:3dca with SMTP id
 4fb4d7f45d1cf-6b4d4d82589mr10723248a12.28.1793779111329; Tue, 03 Nov 2026
 23:58:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793776192.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1793776192.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 4 Nov 2026 15:58:19 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5xomk3dwDScquwWWCD3_FCoJG8dur0b09j68QUqPT3VQ@mail.gmail.com>
X-Gm-Features: AclHuK9cpjirvuwWJw1GRdeY1qyvEyu7MaMSjIH4ln9noIFTiQtqfBK6yL3oNPQ
Message-ID: <CAAhV-H5xomk3dwDScquwWWCD3_FCoJG8dur0b09j68QUqPT3VQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] serial: 8250: Add Loongson-2K0300 and Loongson-2K3000
 UART support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Haowei Zheng <zhenghaowei@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For this series:

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Nov 4, 2026 at 3:46=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> This series adds UART support for two Loongson SoCs.
>
> The Loongson-2K0300 UART is the same as the one found on the
> Loongson-2K1500, so it is documented as falling back to
> "loongson,ls2k1500-uart" and then "ns16550a". No driver changes are
> needed.
>
> The Loongson-2K3000 UART differs from earlier Loongson UARTs in that it
> does not require MCR/MSR signal inversion. It also supports a fractional
> baud rate divisor. A dedicated compatible and driver data are added so
> the driver can distinguish it.
>
> Thanks.
> Binbin
>
> Binbin Zhou (3):
>   dt-bindings: serial: 8250: Document Loongson-2K0300 UART compatible
>   dt-bindings: serial: 8250: Add dedicated Loongson-2K3000 UART
>     compatible
>   serial: 8250_loongson: Add Loongson-2K3000 UART support
>
>  Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
>  drivers/tty/serial/8250/8250_loongson.c            | 7 +++++++
>  2 files changed, 11 insertions(+)
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.52.0
>
