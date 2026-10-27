Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142346;
	b=K/TV5cfxVVp7KkcERR4lgTEQ7CS2BuV+WitWXE6BtrTswf/gUKm9YO973Ny1QMhoNYwH
	 jOO8/vjw423UuqeU8S+paLI7kBIMcCdcGwY2lfy6/Ov95K0X76Xv2Qov1W+B9ZPlIXYyY
	 3JN6W+kky/eNVxnniK277/7f5GpUwquMjl3py/DwLEPoSzQP9ZRMsZ6RcSkhwSnYBzc/j
	 g1fh1NLJmX8PF8Ay+34q81JEAzY63x7iwSRBtsutGu+MtC+eNn7i0WLNBgEIqgS0HSizu
	 jpuP4pRXzSH00UwpxHQLps6SrxrlOvw0LAEWuI1f+jg+zM0CFopqNpXpQAuBQt7AX/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
	b=MvrVvnMCMNWOPaUYQq+5kMX3FroFCH7YLaQajm5LcJEAEGFh+VipAvQZGCe8umtaTUQu
	 0QnsnPnNyIQ3U5483lNiPBq9G+0gRzCdt0AN51O6XU1TVqFhQdrxVSBmT50SYAqALIqCp
	 G901VLeUBwN1jm/okTHbjlRIKKJQEkNAdbyDUMZFfsMsUnTvpEoqyELShkoqsyI7gZCga
	 ry71X+QUGCLpP+nn43ZBCXsMl9xupqYyw2mKyKF3bf2EdYtFUSvncbFqzlfVgX4W8y7xq
	 fP9apeHI5iNGDNyWGP3MNqD0ccokZ04hLp9Dh4iOEFXnISHgS/LZdhGAm5MpmpjYmqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOQXg17p;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15090606A32C
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15090606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOQXg17p
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-84a2bea315dso269584a34.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 16:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142345; x=1793747145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
        b=zOQXg17pd26tyfvfpbNs5AXAS4UhyOdKIZ+Y+ZF9psjBSHnacYTi2kXSOPJq1GxC9M
         TfXgHvwG7pQ8phSXSTU9p/xnkbDNTTi45MBmd9TeQDSOe5K+5GtqMk7i8gGnOW/g8nfw
         pLD2FsCVkWy/4+rN/t9m+M+nb+NDNxRvdOeh+Y6nJ5kOZdxhcdljftKF6qM8T/x3gaVn
         O5LdCzYeJbL6NzgJbbdqdEFmm99hHvHI0SPtq++bPRMZ4uKurdWX+jPVKp8wC0pCsjCf
         6qgjGHYneMMJk/RusWRjh8JV5MpxcbqpC6uZ81DgtvoFPCibFJTjeYDg0dBaVglMzgoJ
         KA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142345; x=1793747145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUDm3Xp9Etw97Pip2kF/VAmErAZUiFyUqD481xySoOQ=;
        b=vWktryARILW1CsQndfDvEO+yvsPzt6mgKnUeCx3S9BN+uMT0O6jkYwJIpHQE/Nr372
         +ygh8V+KSs0ZDGbAfbZ10psaTy2BALUohP/AUzH+vujY5IgiifSj/hI5IZo5c30n6ZuM
         jva3ekRBbno8u9KnKCOmJF8Gef2lLoqm4Muk4tQXmPmlliESVuEEUEp5ru99pnPwdQ9P
         FWb80EJi76ewTMon3hEArqu2pJRL2Qqw6Po/LVxTlcy7zUHzoo8mDaqUpczwsO630tGW
         7RjXKdYH4o/NE4yHzkvW0Xs3iHO+6kxkv3Y8lgI5r8WiDcO+wwKICFv6xegrbqB042ia
         Skbg==
X-Forwarded-Encrypted: i=1; AKwUvByectJ5x5tAlUrznLvciJi4XUNmYc+LwWAaFT9SfMTnDC0yKMZdqfiT8VKk4xHanQmsm9w8bck/8fTv@vger.kernel.org
X-Gm-Message-State: AFq9FYJiJPJVY6rzYX54QpuCSQjGVl0xa/XiFYuDW1LrcEBDoCx1UDfh
	kQu+IXFsjZj8CUkme9i7oK8iRzGEbW9sEp99FoYU4QKXusomPUzarBi+
X-Gm-Gg: AYBFou3lAvsZvakui5LUGjOuItAzugehTXUpR/DMnP2ci8uoFKCplQmBXK0p/HoGLbs
	10Gc6R08PiGztajBgu9Eclt0/PMqRSQkZ8rVBcG/fmPdDKbYYfjy8aYRl8p27vWaYhJ5ICU+HaH
	ZWygOyEdmiRLTTldxq0tKmcXmxiaQqjRsqHYfpYDnAZQ5VnjIVaZlpkQCH+p5nqo1JgeVd5Vhyw
	mO7lpGG4dlZPBfy3A29iQaF/PyW5aSxmydD/5UmHBeKL1+VI32ujUIZ/97u4bNw+xjKtRAbef+x
	4CTrjlMz76zkfaLKKHNXQVu3cT/W7yDtIVwPsiB2yQmTF6aRdGF3LKvZmqiKrw9j229jJCXfc7Z
	wrlq2pg3rknHNLlgUlsO/wv3epOO/B7efR6vi4m6Igx3Xkd98yx9M/h0wd7A4GEZ8NG9Bu2PL6M
	VVfW/s149Kmc4UIdjaARd7/dwlwudh5w6ZKelAvwcVAUQtU3kyRfrw+tKNW4PzarQhNR2xkghAE
	lk55n+HwBzH1Dn2XjEOQD13u7yFxjZX65zU9E/PQ5XyAn3MpXBuTrcHh0UpeXIlfT3VkNw/yz9j
	988IJjPTOYzar7lvDmR/x9aiBeLyXPOtZupHp4NBrBVWxnSfvqb+suys9KVBRXyYqttop5/UZbR
	v/0gCnYAK7+BsK6xS3Wnbi+xgyGaq+QWAfu2spNS6N1ZlzZyYG+oyXWlUnsOAa5tixfjwpp/1+s
	RW1Q==
X-Received: by 2002:a05:6830:4411:b0:829:9992:20f0 with SMTP id 46e09a7af769-85ac0fd0da4mr851500a34.28.1793142344897;
        Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:29 -0600
Subject: [PATCH v4 1/5] serial: 8250_dw: select port setup through platform
 data
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-1-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered.

Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
Octeon continues to skip optional-register probing while retaining its DMA
setup; on 32-bit builds it retains the generic setup. Keep generic setup
for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 44 +++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..1351523f0c47 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	void (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -631,6 +630,33 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO. */
+	if (!p->fifosize)
+		return;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+}
+
+static void dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
+static void dw8250_octeon_setup(struct uart_port *p)
+{
+	if (!IS_ENABLED(CONFIG_64BIT))
+		dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +791,14 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		data->pdata->setup(p);
+	else
+		dw8250_setup(p);
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
-	}
-
 	data->data.uport = serial8250_register_8250_port(up);
 	if (IS_ERR(data->data.uport))
 		return PTR_ERR(data->data.uport);
@@ -860,6 +881,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

