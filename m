Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444A24DBD74
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221168; cv=none; b=Njsy+ByiU0a92stlvZIokhlY2NKMMoccj5Hbd3nwLv9Ym+QWvAxt5eIlD2Ubo0kbvTR7zLFPzCdBlETqp0vc2wE/oaPFxOwtARr+rw3wPPpkfQbD2OZEL8dgRIAU9VZHSLVvaT1NU/SO7Uf2PvG+Mkch5J7boFbyA9H6ljMk9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221168; c=relaxed/simple;
	bh=0tlu23Wb+fnBd//rKVf7iA12CVAByRfBiHkTg/vcoM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+E7FNUZlURiYz1FJ26/BrhYwpOiscMjLI9Ot4SeHEzfPDnBojCONPW4DKaenj5LFxsqn8XAKcNHTikVdobG87tblS6vE5tg3cHl2gVBHzFjEp58XLfVLpv17634LTW7LREeUNV3Y3OJmEEZyWIPEkI85Kd+j1Jb4mJEEZ1sNRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4PAApbf; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4PAApbf"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677c1fc082bso1565990d50.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221165; x=1791825965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSg+xg0GISK2TLhhUpUId1buzLRTI6rIxrwQhAMstEk=;
        b=s4PAApbfY21QX23KWxHio34rm6HlbMcddSM7pYE7WIYfSGuVV06/NIXwg0olbnDk8j
         EOFOpGW7dos9algdEj0QXMU5C5KDV0Ew1bSrFlDazwT7iVlC/1djNpFGuLOhHuaCSWO5
         Eei1XEN3/sLhU2+w6j0qcQaIve1+r+G2GsS78bQlMnCy+fv0ycF6yuHIbkTzmUGqw5fG
         rcQ4/lYWWKMQxwiLnPFR0C5tWwTfqxuzzrp3LpppvL9/Uf+yea4QYtxcmMpRyE2bDcI9
         KNuELPvSFKuN6Ch6v4vilCq7vdm/Do786DhXLfMaQpIhPvBovw7AFgsBS/e036KfLacu
         1hPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221165; x=1791825965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSg+xg0GISK2TLhhUpUId1buzLRTI6rIxrwQhAMstEk=;
        b=Dw7EGEEQxTKqhg8zW1pF+0AgWhu1zpRvlX8qs3cCSLJUO0/UiVogyhKF8I9KGQQLCr
         zZ+7RTIvWj//ZarpsgO4krlUUuqPWJ31Bs0IxVi2UkCf5Iym9prp9alSuh8CemSqI2Ui
         5SgGE7KcHE5aFqTx3v/+SZLxRhV5LPAgLwJrV5mtOth/nRJxRHM1uAcIQlabMvR6jEd/
         A4MrTxyjzpGgtDEN+LeO3CbVm57QxcvC17QDUFbdN6vZTOojKZobwvl8Ne1TyZxvhJbk
         qSJGF0su4h86NoJAlwcTMSdb5eDQvL2DdM6XOOxPcxkAqjNVs9Cad38ENIi7XrZgcwXI
         2U4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCZ5PuhOrT0dlpKQe90DE33aXZBnwWRCjzlKKRR67qL+uZBNg74FPRDMy/WKWMKTaTJPtF7Pbv5JOh@vger.kernel.org
X-Gm-Message-State: AFq9FYLcGVXHvIuf4A4tlJy3ndvwpTCfKHTPLSWdeESvDabQxGEssQ6q
	Kib59j26fEVDBO+NTGGvTDkUDBZAC0zFU/f8CBgxGcVH2/7uNE87stRX7gZxPXN+VGc=
X-Gm-Gg: AYBFou1gcwOgPDEuFF9ib3pSvwlulemQiM19xgbVvi+9SkUs4XishFLevD7pJX3Fx5t
	a+Da9cDvEIt8hZjXQcBPhXrO/bOhoaJ3BOyAhAeZpfXSbdKbxQxg3sAHtxYGqY0Xs9Z14LMWzgW
	tKq21koSTe787gZ1mPPaLLDXKaRmKHPxy+D7Y0QLya3GxhWdsAczromT/ulM+yR9o01nx2MyPhJ
	OZ1gx9gX8D5ZayWazitYsvX4WGjEyPx2umD2eUAzbLtFjdpfKTChrNsk0T/2SelM42H7DF3wqql
	8XQMLCRJJOaniI97rp9fw17iNMSeKQkdktjjpxqkt4+Daei/35MEjfi1wHo/3xUO0bjGNweAZHA
	xGhopIAANFiCbgbJEFzAXviuI4TTTc9o6997bbk7H/Yq8fLjXaseeQRo80RZy7PCaqNWRok+G1D
	lOUYOcXYD6UKml5NTGs5/yeq+svVnWk3pTecu+EEZJGa0wEo02Tt6JxwbWw34qAtaPwyBtYX2A7
	hihTvINUOpCDZG35wbYRr6GtDLDfl8JCUxp1MGDS2rjAYix3wyI/qBbV+ceIm2JHRlmaOajCK93
	UlvPbQ==
X-Received: by 2002:a05:690e:4006:b0:676:97e6:d7a9 with SMTP id 956f58d0204a3-677bd338f18mr3368433d50.40.1791221165074;
        Mon, 05 Oct 2026 10:26:05 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:26:04 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Mon,  5 Oct 2026 14:25:36 -0300
Message-ID: <20261005172538.398522-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dw8250_probe() installs dw8250_set_divisor(), which brackets the
DLAB/DLL/DLH sequence with dw8250_idle_enter()/dw8250_idle_exit() so that
a BUSY UART cannot drop the divisor LCR write. dw8250_setup_port() runs
afterwards and replaces that hook with the dwlib one whenever it detects
a DLF register. The dwlib hook programs the divisor through
serial8250_do_set_divisor() without entering idle.

When termios changes while the UART is transmitting, the LCR|DLAB write
is ignored and dw8250_check_lcr() retries it between
dw8250_idle_enter() and dw8250_idle_exit(). dw8250_idle_exit() restores
IER while DLAB is still set, so the value lands in DLH. The real IER
keeps the zero written by dw8250_idle_enter(), and the port gets no
further TX or RX interrupts while up->ier says they're enabled.

Program DLF from dw8250_set_divisor() inside the idle section and keep
that hook after dw8250_setup_port().

Observed on an Allwinner A733 (Radxa Cubie A7Z): the first interactive
tcsetattr() during console output left hardware IER at 0 and up->ier at
0x07. The shell never printed its prompt or read input. With this change
alone the same boot reached the prompt and echoed input, and hardware
IER matched up->ier afterwards.

Fixes: a7b9ce39fbe4 ("serial: 8250_dw: Ensure BUSY is deasserted")
Cc: stable@vger.kernel.org
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
The A733 has no real DLF. Offset 0xc0 is an RS485 control register that
dw8250_setup_port() mistakes for one (patch 3), which is how this path
was reached. The new DLF write hasn't been tested on a UART with a real
DLF register.

 drivers/tty/serial/8250/8250_dw.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 0ab558230370..ba414306c98a 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -189,6 +189,7 @@ static int dw8250_idle_enter(struct uart_port *p)
 static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 			       unsigned int quot, unsigned int quot_frac)
 {
+	struct dw8250_data *d = to_dw8250_data(p->private_data);
 	struct uart_8250_port *up = up_to_u8250p(p);
 	int ret;
 
@@ -196,6 +197,9 @@ static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 	if (ret < 0)
 		return;
 
+	if (d->data.dlf_size)
+		dw8250_writel_ext(p, DW_UART_DLF, quot_frac);
+
 	serial_port_out(p, UART_LCR, up->lcr | UART_LCR_DLAB);
 	if (!(serial_port_in(p, UART_LCR) & UART_LCR_DLAB))
 		goto idle_failed;
@@ -650,7 +654,6 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	p->set_ldisc	= dw8250_set_ldisc;
 	p->set_termios	= dw8250_set_termios;
-	p->set_divisor	= dw8250_set_divisor;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -767,6 +770,13 @@ static int dw8250_probe(struct platform_device *pdev)
 	if (!data->skip_autocfg)
 		dw8250_setup_port(p);
 
+	/*
+	 * dw8250_setup_port() installs the library divisor hook when it finds
+	 * DLF. Keep the BUSY-safe hook instead: it also programs DLF, and it
+	 * must own DLAB so that a BUSY UART never drops the divisor LCR write.
+	 */
+	p->set_divisor = dw8250_set_divisor;
+
 	/* If we have a valid fifosize, try hooking up DMA */
 	if (p->fifosize) {
 		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-- 
2.43.0

