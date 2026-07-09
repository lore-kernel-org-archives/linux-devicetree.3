Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6C36CE03
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607840; cv=none; b=g3MwUiYwPO8FdPzghNbaVfj6VCxxBrxejeEFj+2/cbIYg0Ndexd0FBsBqVW6P041vpj7syLtJDvep3Sn9J9hIfz9ayGpStBG7MdGBBZra78vCq3Y/PkRtAVaxFBxtn1hhKlc3j9MWCom3k9bt48S61vKNxTE/GDV2UUa2P87qyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607840; c=relaxed/simple;
	bh=75HrG4MLJSXe5CIzY9OO9tqUeW5NtJ/SlJCTO82eDFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bk0dOkJNQSLc+0qbmSQRihCibIsIz/4vY1mmMM38z3g7RFvOGx1soINeVn3le7svsi8iHdPgqFCr/O5kXHuzys1bph2lv+JeGFn8ARRZOdVQgPiYdGCmYviTz8h6Q/0IwYETxVBZBb0PCeek/TIbKkcUCpXUTJ5AX14qCJRzD0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G972qtCD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G972qtCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6A11F000E9;
	Thu,  9 Jul 2026 14:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607838;
	bh=tFcSdKND7eZw6E3HhjAV0zj8EMjkTLhMy64c9T5CQnA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G972qtCDxNzXFFqWBudinULL9xMe4IJspS9Ce3Kir+ULhURF9eOJEz3OlJOw3quVu
	 DJCLVSOKLtd0eCfYeRIQcDteXxJgruPV8duZT7B8m4VP0BXt8juHOgDXiCRm8EsQco
	 JyACi/45w0fzQs6FkHk7yEzMQ2AETEYjKdclxq/GmJ4FZQSqZFTkc98BMeeb4lRP1X
	 h1n/DyLTMkvwgBiiF5jowwpJN93NciU0ufCGtRINsMjzvhobuXGIyBQh5hHJkB5KT8
	 ShmtmX2f7b0gYFdXxrxes/VWweHhy/GxUuJsOwYFJrK0ESJsiu8IE+orFCjixnc/P+
	 OxERak0fWGXAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 06/11] spi: dw: send cmd and addr to start the spi
 transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709055204.138168-7-changhuang.liang@starfivetech.com>
References: <20260709055204.138168-1-changhuang.liang@starfivetech.com>
 <20260709055204.138168-7-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:37:18 +0000
Message-Id: <20260709143718.8D6A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Incomplete implementation of enhanced SPI memory operations ca=
uses data corruption.
- [Critical] Divide-by-zero kernel panic when calculating wait cycles for d=
ummy-less SPI memory operations.
--

--- Patch [6]: [PATCH v1 06/11] spi: dw: send cmd and addr to start the spi=
 transfer ---
commit 81aa9a8a81c58018d2abaeeaaa7a7b9aed04510d
Author: Sudip Mukherjee <sudip.mukherjee@sifive.com>

spi: dw: send cmd and addr to start the spi transfer

In enhanced spi mode, read or write will start by sending the cmd
and address (if present).

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 58159e8269f53..6a52860654280 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c

[ ... ]

> @@ -895,6 +908,8 @@ static int dw_spi_exec_enh_mem_op(struct spi_mem *mem=
, const struct spi_mem_op *
> =20
>  	dw_spi_enable_chip(dws, 1);
> =20
> +	dw_spi_enh_write_cmd_addr(dws, op);
> +
>  	return 0;
>  }

[Severity: Critical]
Does this code return 0 (success) without ever transferring data (e.g., via
polling or DMA) or tearing down the transfer?

The dw_spi_exec_enh_mem_op() function configures the SPI controller, enables
the chip, and writes the command and address, but returns 0 immediately. It
omits the data transfer phase (writing outbound data to or reading inbound
data from the SPI registers).

Does this skip waiting for the operation to complete or disabling the chip
select, leaving caller buffers uninitialized on reads or writes silently
dropped?

[Severity: Critical]
When calculating wait cycles for dummy-less SPI memory operations in
dw_spi_exec_enh_mem_op(), could this cause a divide-by-zero regression?

If an enhanced SPI memory operation is executed without any dummy cycles
(op->dummy.nbytes =3D=3D 0), op->dummy.buswidth is initialized to 0.

Earlier in dw_spi_exec_enh_mem_op(), enh_cfg.wait_c is calculated as:

    enh_cfg.wait_c =3D (op->dummy.nbytes * (BITS_PER_BYTE / op->dummy.buswi=
dth));

Due to the explicit parentheses, does the division evaluate first and
unconditionally crash the kernel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709055204.1381=
68-1-changhuang.liang@starfivetech.com?part=3D6
