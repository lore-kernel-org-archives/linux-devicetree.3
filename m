Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14463321C2
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.246.85.4
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913691; cv=pass; b=AmYoALawUUJYKowYMC6Y+FxSzbHOfxRh+mYMmx2nFqXdbMgLEf40s/cxlr/GKFgNeuNtF9qcaedQsw4Ry50EuS7tn++WfTEMRdClQ9MbhAnYaDpsqbaGcZ3Lnfa1lbiT6ugBypk8d62s8KcPPRj3C5Ljh8HdCCZUIxZIX7eYD/M=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913691; c=relaxed/simple;
	bh=syDXF0AioumUFpHMrKgYwR5vPezhWmd4BlaBPHWX4BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQ7Dbd3H0DpMQrGlZDBCxR8N1vgQSYtBiCQwCQCONzJBsvFapJUit8BBq2IwBwcdMwDTHJ06JJoxKM7djqqkgxVTi9yZsChB4WWxCIjebPpssAm3nhkZGCLUnArPPf41xVYkMhgao6ZOMmbFABb5wqyBAaneLewcUipRQiS0J9g=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2umHtGb/; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wFc7OAmY; arc=none smtp.client-ip=185.246.84.56; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; arc=pass smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2umHtGb/";
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wFc7OAmY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 176524E4120F
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:48:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE63360362
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 17:48:04 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 61F8D11D71756; Tue, 13 Oct 2026 19:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:list-id:list-unsubscribe:list-subscribe;
	bh=vB6F8gVRv6cs22SSGpo1/RFu98lnOw2jLJ3nHA3QKNU=;
	b=2umHtGb/WX87p9b3JZRkPzZeYSX6jH9c7uGGspZJ0cRtfzGdGo7r1p4gqaJ1XOyI2xiM+b
	fYwbbG9bIOFfJHBR6KAZcSiBCFSWntDTOl1sDvbkWLsNZ1RKMX1QhXv4nlk2gca3aOdXIu
	lUrREY4h2wk3L74DfAK2dp+/bmtAIe0HpzCWS4lrLRcuHl8K9E2h3rNALr9UTMZiVts921
	EplJgm6Bfu3Kf/RdTkFtQsdlVymNFdFCRraQZPCyFNK0HQ77iXtVU2pEx0WsvSCFkh0j5q
	rsmzdfIFqO726CE4tk3ckbThu+JeXy8FHbKj4fYhrAd/1xcMF4lZVNnvOqNUXg==
Authentication-Results: mail.galae.net;
	arc=pass ("bootlin.com:s=dkim:i=2")
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id SCjqHQsEyWrwGioAtaWaaQ
	(envelope-from <linux-rtc+bounces-8411-alexandre.belloni=bootlin.com@vger.kernel.org>)
	for <alexandre.belloni@bootlin.com>; Fri, 09 Oct 2026 17:11:07 +0200
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id CE8F511D70825
	for <alexandre.belloni@bootlin.com>; Fri,  9 Oct 2026 17:11:06 +0200 (CEST)
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791558667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=vB6F8gVRv6cs22SSGpo1/RFu98lnOw2jLJ3nHA3QKNU=;
	b=r3W0e9OQ0k+LaTpbBz7Qgc0y8JruXj+wT9I3+A+PYH9WqIbrdstK545yivuF75Q9V055hh
	Pny4B+vDKyVcepdIBTs9WIgbdSmv//qeHyNmHBeXesJtqSXJS2IpGf5AFPIipLTQko1R/V
	Rvs6TVHfApE4MclhbZz/6E0x/xp/wI5pnLguJfLnkWSJ9Xyk8xnWRyqmYOQ8BYn4/dWuT+
	wvTqIsmGj591OauU4i+qUR4kuZdOntGvQU9kdLPfvutMABlghUrrB9Jw8SyyMXXOzsukRD
	/FYwKFwe+LCPxPwuCfD4PYQmzmvx7mwSt4jVYgkryqJgKbFecbaYvmZel2uTKw==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=wFc7OAmY;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "linux-rtc+bounces-8411-alexandre.belloni=bootlin.com@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-8411-alexandre.belloni=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791558667; a=rsa-sha256; cv=pass;
	b=VjtSOL9+lBiSVaAF+AcF+OaViEc89UD/4foU8RRvBhwe3b1KHm2EU28mib/MLuO3uouQQW
	/jtxD/F2vhPl43g0TPcxf+Nl3mHR1aExXP6sDnSWFZHb0NJohTdcsAZHHvE7LuKrs+azbG
	VPeYMck4pM/XnU+mwHxNdljVlOeFmp9ib4XZoREpLvK98NKTEnspfSPkSbU3gOsAXzNISo
	bvCZkWxEgOyGkuj8yC4raNOmjsSCF4eGOmkayPr/EDR08S3O4JFdCuJSDzuoGRc3yTJ1ip
	f9yeKnE1AApaC08N+v6gcxIQUswdUKm2IgIoKyMXBJ6EedRX6oCvG/WjBamQTw==
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 0BAE0343200
	for <alexandre.belloni@bootlin.com>; Fri,  9 Oct 2026 15:11:06 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AF6135EB0
	for <alexandre.belloni@bootlin.com>; Fri,  9 Oct 2026 15:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4E84E50D4;
	Fri,  9 Oct 2026 15:07:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AD23BBFDD;
	Fri,  9 Oct 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558424; cv=none; b=fnDp9yROX12bOQ4hiRWcXKBezUBKcUVlwdO4IHJHnc6Ruby4HMIjjA97TsZ8xzMoAXaQCXVMxsOHTOZvEMp71ZvqM0Rf0z35azi82F5MFO/fcE3AWwugmd9Zwm+bM+aoH9XIvu1Ae3/ItlG7Ch0My6V0Kvmpfynkrbm3CtDLYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558424; c=relaxed/simple;
	bh=syDXF0AioumUFpHMrKgYwR5vPezhWmd4BlaBPHWX4BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCgv6dqB/q7Xddi0XJZbrPZ95VT2DMiR89OH8RWbfqTqApHZs4xU5B4pF7yTAXWlITLJfpSGQVZHNhqVBkwG8Hj2kqokMaKUQKl1qRy4Ox5p6+7UftrA0YQ2VyhsvTKga3T3Ry/1jDymBuedgqdYstl9uVIkKeOkhGY+6E1BNWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wFc7OAmY; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EC8781A11AF;
	Fri,  9 Oct 2026 15:06:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B575E60754;
	Fri,  9 Oct 2026 15:06:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B5ED11D708AF;
	Fri,  9 Oct 2026 17:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791558417; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vB6F8gVRv6cs22SSGpo1/RFu98lnOw2jLJ3nHA3QKNU=;
	b=wFc7OAmYHc66rvEuPys7D9osHIaK7zW3U1iLjK2Zikib9x88BNkMsHPpbMkenaReakBAVq
	Cqy9Cz/05xniWrIcCRo7eBQp8wrs6jA9aR2tuviDBY0LLSY051XlhtA9AqPYK5B+mlw2Bx
	V097LOffWzTlS+mPEzXf+olUoDk5wC+/ktFfaFrp16oxRQfyEqRny114juJYR/E0nZN/le
	JBlIyoDJXZj18kGV2q40Z6CyM578wz3wbAXjw+lcyRFd8j5GhtACvHwt5i9DHHskpuimhY
	KY3oZnj7NPEXGB/X4hBnRDKW6yJn/KwRylrzd5hIazpgCN6oKHlwwlyKwLyzIA==
Date: Fri, 9 Oct 2026 17:06:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/9] rtc: abx80x: add support for abx81x
Message-ID: <179155837260.478260.9249464271707316286.b4-ty@b4>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
Precedence: bulk
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916205138.16771-1-apokusinski01@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 61F8D11D71756
X-Spamd-Result: default: False [-2.31 / 30.00];
	BAYES_HAM(-2.65)[91.29%];
	DATE_IN_PAST(1.00)[98];
	ARC_ALLOW(-1.00)[bootlin.com:s=dkim:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	FORWARDED(0.00)[alexandre.belloni@bootlin.com];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]

On Wed, 16 Sep 2026 22:51:29 +0200, Antoni Pokusinski wrote:
> This patch series adds support for the ABX81X RTCs, which are essentially
> SPI versions of the ABX80X RTCs. The first patches (P2-P4) contain bug fixes
> (added after sashiko's review in v1-v5), then (P5-P8) we have some cleanup and
> reorganization changes (converting the driver to use the regmap API was
> needed for this), followed by the actual ABX81X support.
> 
> Kind regards,
> Antoni Pokusinski
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: rtc: abx80x: document ABX81X RTCs
      https://git.kernel.org/abelloni/c/953c3d2b5836
[2/9] rtc: abx80x: fix error check after i2c_smbus_read in read_alarm()
      https://git.kernel.org/abelloni/c/07c57022afb3
[3/9] rtc: abx80x: add mutex protection for register writes
      https://git.kernel.org/abelloni/c/74bff654a4ce
[4/9] rtc: abx80x: properly handle shared IRQs
      https://git.kernel.org/abelloni/c/632916c7bde3
[5/9] rtc: abx80x: add irq to struct abx80x_priv
      https://git.kernel.org/abelloni/c/00b978f8008e
[6/9] rtc: abx80x: use regmap instead of I2C specific API
      https://git.kernel.org/abelloni/c/724320a61325
[7/9] rtc: abx80x: replace read-modify-write pattern with regmap helpers
      https://git.kernel.org/abelloni/c/0ba70c2b1e3e
[8/9] rtc: abx80x: create abx80x_i2c_probe()
      https://git.kernel.org/abelloni/c/3fcf5a97957b
[9/9] rtc: abx80x: add support for ABX81X
      https://git.kernel.org/abelloni/c/8a017ab98412

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

