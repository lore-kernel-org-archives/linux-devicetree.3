Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794027;
	b=kPYPew025A68ySVJityCI3KqFLIRw6tYtYhlLFj4883oQ74d+OicV8Xh6h8xJwNdAfVz
	 uyMZdDw13yrzYx5J17ap/7hy0aObFSUj4CPkiht2oEW28SPcr0fQfop5sE/5vDYD/6tmL
	 UgUJrYBQkai5JxEwqFBfLWij3LcJLdHDgJqT0BCQ5R9oxdswLgfaQwSGNoWpgH/7Zn7ZW
	 PH1O5dWBINmJmpe+wGwuGmnzKmfea+7t0gnt1ovrauKarBtLUvXfsMXL/1DGRfgRfTTVM
	 VYwLlVlsSs6ephbmRaio1aumICr2UIEWTR/5xSB1vekNoRhH99d4szyEfdoOYtLBBMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=RKs2RVj+9gsb66NQWK1/mc/w12k50POtChKJApRr/mM=;
	b=limAHBMphKQO7W97ZKWN2+5oTnse64X33PTsjLK/HGIAN+8Sb2qb4MWuWkVhJVgN4U0k
	 i4rdAsxVQr9W3mIR7KLMkJh45KW27sYW3ss6GnZMvF/V5WreCXraSlxXJgMBdZ7FOJPLS
	 EieZC0XDoTIdB/LEV3Q31rGEXV0PLNo+SFviQrvQPo3+GW5+0YNmi0G5uzUvOjSgg9q+o
	 GC1NUpdVwTQCVIyx/6GLHIWI41dAzRyVyOAe+ED5d+0zFN01a/GXpyDgUKxqBpxDm/g7M
	 jZ/5EZBRm/CRFYIgsiOmPzXKlbpjR/yqB8ipuCMeq6Oj7PreOKsNT8LdDONwVkCMR9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvdLZKxR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01926606A31F
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01926606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvdLZKxR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so83764635e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794025; x=1796398825; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKs2RVj+9gsb66NQWK1/mc/w12k50POtChKJApRr/mM=;
        b=YvdLZKxRWZfOtvrKoKKgbbAstlx7M3Zmxcdjhd2JSRj8W5nHENQ6x5JasckUS5KRws
         3sPhgDMSrrJ0wxt6xCHS9+7zztGeolAuLxH1nrMy7BFX+onJYkt6i3zeyqsSq6E4Wyf1
         zGbdA+XFto/IkXqSkErXhHHnn2LdmU73XL/FpW+gxnMV6WL26DCUuObbUJbb2V0xGAfP
         71XAAO6pxnaMu4kKZgJxILz4zHfZoZ+sbNnd71rdW+XHktAMgy6ECvOz4Ai5Z1uGKcAO
         AL4ytjhve/gXpTNqxpJi5SVk+AtJRzDJaY0dj4BpulWFzn6tlcAhrkwm85q0hI3iE8jn
         IkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794025; x=1796398825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RKs2RVj+9gsb66NQWK1/mc/w12k50POtChKJApRr/mM=;
        b=KegGZSF+4LgmiMiN+RNyrpC5SMmczeoM50oTTqELPcNj19Iu1VihoMIvQpnNmPtSUg
         5EwcYb3QYI+4vNgkmGyVo/Wy9ipHCSoAeXUc8P2eu9qaYV/45vHrL7HzHWIZrWzRCDY1
         RrkjErYmHdZ829mZqyv4csExc0lJHimTE2SDVx8z00QXIz561R6a1z5XgJZybuWxNzqy
         zlOyCy0CoCShUNbh1xTqMwws3KqugSNVytgpsKGGzZ/e9wvz4/XxHnmA6jZsJWFfnLXw
         uqf4dRoWakq8ZcTUrjTGoA+kxEu/p0tW29BuBFP1woeotrjIEavFnXCTz4auIH5Hb+uf
         p9KA==
X-Gm-Message-State: APuU4Z9eyFkBt67OY1DenTVhBkp/y3yrTwh4Mq6p3NsYFL18wMVrUeia
	qzlqPRaVmPRxAoVWeLgyht/xOWxUAWHwb1B5CahAlORQmMko9xXqMjsw
X-Gm-Gg: AZFdTZc8N6IMu0vnOeFPnUKGIq+Yn0HRdBZABWr62MAoPdu9uDTNzEee3l9RPbYKTk7
	aXmYI3BQ/Or9JlW7xNLljZO+WOMDIdtn8PvejGgDrBAKyTqxZ2AT+SDEFFeprIs7Qd2fUQgtBdl
	bGGl9UOw9IIL+smftoSOV4o4/STNF+emMfRjdz31gmQ9dU0QhrBV4/bXuRiC6FBwX71WGsPsIAC
	2x/J4rAEbdfNZM8tynFy+QvPLmtzg999RcM4n0Y6SUsskuTaz4KT7LyqmjpwqJRR9hblFuq6ZRG
	hppbI1By2EqZJomS9/f/bBBpvAG2Kd6ZpGEIX8txPMZ6Wk8DkFGVthTvkkjaR8s48WYCg24LDOY
	c+QdyQUAv7sqFubwGTUHiYAn6YXBM1Ve2lvmDltWCbAjn+DEZSg+W9DlpmAZPS80xPGmk9WaWAe
	AU4v0Q1uEveJJiGfNhrrQEZVOpB4EMAVSdGOoLaKNKSfpN0L5tU/YJHhKFqZDHtgtIRpR39KJb/
	rXNtVQNqX11cUd3K3MlUA0gG94iFqsW+ciZj+45pqbR9crSQSSofneZ35WoMQ2DBhcUUWntcrWX
	5sYYLnF+Vst0YjGfYLKXhXd3iMhYCvp7tPCSVT8vyTR6XvKX84RznfQHWJOsY/Jo4Ji/vUW3uWb
	G
X-Received: by 2002:a05:600c:6744:b0:4bb:afae:150d with SMTP id 5b1f17b1804b1-4bbafae24acmr95659035e9.33.1795794025073;
        Fri, 27 Nov 2026 07:40:25 -0800 (PST)
Received: from dom0 (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm47847939f8f.50.2026.11.27.07.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:40:24 -0800 (PST)
Date: Fri, 27 Nov 2026 15:40:22 +0000
From: =?utf-8?B?VsOtdG9y?= Hugo Silva <vitorhg20080@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH RFC 12/19] serial: esp32: Rearm TX interrupts when the
 FIFO is full
Message-ID: <awmieG6bM5iKWYzv@dom0>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
 <20261125233020.1380594-13-vitorhg20080@gmail.com>
 <sashiko-outbox-236334@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-236334@kernel.org>

On Thu, Nov 26, 2026 at 11:32:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] serial: esp32: TX IRQ storm in esp32_uart_transmit_buffer()
>   after x_char
> --
> 
> commit dad4b1d831af0fbc408461f76bacc91b367f0e67
> Author: Vítor Hugo Silva <vitorhg20080@gmail.com>
> 
> serial: esp32: Rearm TX interrupts when the FIFO is full
> 
> This commit rearms the TX FIFO empty interrupt in
> esp32_uart_transmit_buffer() whenever data or x_char is waiting to be sent
> even if the TX FIFO is full, and acquires the port lock in
> esp32_uart_txint().
> 
> > diff --git a/drivers/tty/serial/esp32_uart.c b/drivers/tty/serial/esp32_uart.c
> > index 304e1345518bd..002d6fdbd875f 100644
> > --- a/drivers/tty/serial/esp32_uart.c
> > +++ b/drivers/tty/serial/esp32_uart.c
> > @@ -354,14 +354,14 @@ static void esp32_uart_transmit_buffer(struct uart_port *port)
> >  	unsigned int pending;
> >  	u8 ch;
> >  
> > -	if (tx_fifo_used >= ESP32_UART_TX_FIFO_SIZE)
> > -		return;
> > -
> > +	tx_fifo_used = min_t(u32, tx_fifo_used, ESP32_UART_TX_FIFO_SIZE);
> >  	pending = uart_port_tx_limited(port, ch,
> >  				       ESP32_UART_TX_FIFO_SIZE - tx_fifo_used,
> >  				       true, esp32_uart_put_char(port, ch),
> >  				       ({}));
> > -	if (pending) {
> > +
> > +	/* Rearm TX even if the FIFO had no room for queued data. */
> > +	if (port->x_char || (pending && !uart_tx_stopped(port))) {
> >  		u32 int_ena;
> >  
> >  		int_ena = esp32_uart_read(port, UART_INT_ENA_REG);
> 
> [Severity: Medium]
> Can this cause a UART_TXFIFO_EMPTY_INT interrupt storm after a deferred
> port->x_char is sent while TX flow is stopped?

Yes. For v2, I'll use UART_TX_NOSTOP and let
esp32_uart_transmit_buffer() control when the TX IRQ is masked.
After sending x_char while TX is stoppped, driver masks the TX IRQ and
leaves the queued data in place until the TX resumes.

I've tested this and it works with a mocked FIFO and in the hardware
itself, where the serial console stayed normal and responsive during
normal use.

> 
> If uart_send_xchar() runs when the hardware TX FIFO is full,
> uart_tx_stopped(port) is true, and xmit_fifo is non-empty (pending > 0),
> uart_port_tx_limited() runs with count == 0 and leaves port->x_char set, so
> this check enables UART_TXFIFO_EMPTY_INT.
> 
> When the FIFO drains below the empty threshold, esp32_uart_txint() calls
> uart_port_tx_limited(), which transmits port->x_char, clears port->x_char
> to 0, and breaks out of its loop because uart_tx_stopped(port) is true.
> Because pending > 0, __uart_port_tx() does not call port->ops->stop_tx():
> 
> include/linux/serial_core.h:__uart_port_tx() {
>     ...
> 	pending = kfifo_len(&__tport->xmit_fifo);
> 	if (pending < WAKEUP_CHARS) {
> 		uart_write_wakeup(__port);
> 
> 		if (!((flags) & UART_TX_NOSTOP) && pending == 0)
> 			__port->ops->stop_tx(__port);
> 	}
>     ...
> }
> 
> Back in esp32_uart_transmit_buffer(), port->x_char is now 0 and
> uart_tx_stopped(port) is true, so nothing disables UART_TXFIFO_EMPTY_INT.
> Once that x_char shifts out, UART_TXFIFO_EMPTY_INT fires continuously in a
> hardirq storm until TX flow resumes or the port is shut down.  Adding an
> else branch that calls esp32_uart_stop_tx(port) would ensure the interrupt
> is disabled.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261125233020.1380594-1-vitorhg20080@gmail.com?part=12

Thanks,
Vítor
