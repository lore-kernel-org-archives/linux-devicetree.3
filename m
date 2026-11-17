Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794945613;
	b=kCPZRuFMqwAjhI6GgPrvKeJGcnyZHJ7Yw0wJn+dLmfDnjabdnL4MIzrUBDWibRk7Yitl
	 qVGm52CFwAje9YX3syT+uIbL2M/0JTGU7h/JPNpFZgH0rrekPtR0Ot8vugfKEADOFZ61J
	 2AC5UMbPf5UAq8LmLX0GW/w7mCSN/7RqNLxG38DDHDpAJmthTGeNGcB71alXLL0t7PbqE
	 ajgi4MYIYwRhXbvmA0iNgACEztgtLdogpRTzoQuyTAQMI8RtaBtYT7YTtBWry+OqFgM6C
	 kbQqEa0YA2YdWt6co/vRZZJ05tastiFqFuKNOGig6aRAA8B0hjgTOx6IGW1kCuntkBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945613;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=W7wzKrMIF5A35pVBIgo5N/n+mM8H4di7DwvtH1jtWd0=;
	b=iT1tpcH3/tt6/WAF0gt2rGmbxTv0lB0/eQmyzMu5Jt5wFlhZOFLHURxF7lg5zukTS7RV
	 m2lxbW5eT0MmIrzqUHqJO6ERRwPZw7OHE8Jc9S3t41UcLcdddnoTrvJzE5jOW3kjqbbIe
	 IQrrmVFF2Pa6+jovmScR5p8Zinfmn6UYZpSFAVHM67Cisil6AxvqNDweRdAHg05oJXD3b
	 K0L28RdQXzTBg63F+8NLyaFHmtwvV7uyS/ekfPGOI/Egw1iW0rMyzG2C9Ov3qlXntrfZf
	 K0QUJSTZKxwUMLELTZDp/Wb1vJc6SGFKT+OG2wyscO9sUWdsnks3tkEM+CIrheJPrDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rf0hdqbX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91823606A31C;
	Tue, 17 Nov 2026 20:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rf0hdqbX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945613;
	b=wPg5yaoqEa43xiaocJD0UVn39PqiS107pB2u7EnaeE8Aox0IWvu3ufTK1lluibOJUc2x
	 gLAIqxcGufa5ypa2+PaFiCeJaJ1RAGVKu+JVSTsZrG1mCLg+glIzgYZnMamHDifRz59yL
	 jK51azOXeVVUzeBmnsMemHKXkqvrkGguVqudKYDnODfRWwmI61SqmLYjqCa/NdQoFL1NQ
	 QOyvbY7Jq5i1BmYNGcfapANhd8FSWPjV9nkg1/moIYpqUBqGpMfF9vBzNnFmbjgwXrJ+4
	 Na3AET0BZ72mZ9oV9w2FW7WT3lttTGbJP4UztPX+jvgmTKNpiYAj5YaF5QDO23Jm/+w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945613;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=W7wzKrMIF5A35pVBIgo5N/n+mM8H4di7DwvtH1jtWd0=;
	b=vludeIvKLCbfkq5tkJAdBCw28bpJ42VbwvsKT5lefuxPzOnStfff8qZ6nBQN/QwuWcyj
	 d2XE2BRnxn3/jEBngWCxvboJKpYxkNWLN8g//8CaNYTjzU4tGjftwfpBu+md+pjqQEVfM
	 ZTknSD3IxN3S2lia5pDvcP5Hvw8kDPcpkRHNbhpbHY5Ncj5O2MBXut9EkvEWJdUtPa7mi
	 AONtyyX1dRy7G/2yMDysD//R6Chf13vhlDnjYk/4ofKnKC8bSKHnw5AoDhIwVj6MYmMQl
	 Ky9ltclgEUuPXn9jMzpUis6Uuia34FWbdKiGDaMk/KTvoOR9tV3qvFiqQ8VnTf3QJuA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD6661F000C6;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945613;
	bh=W7wzKrMIF5A35pVBIgo5N/n+mM8H4di7DwvtH1jtWd0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Rf0hdqbX0upqMT5UR5QBpBzcCmSXS+VTRSzxqVUM2kh9KE1i0HISxC1U4b+rDNy+a
	 NxvF6gyRqhFIBsrsUcn2/YH7XtG9LwXpKQRe4KiCAEmX1Py3Gz9QszZp9Ox30AgUyc
	 dkBAL2ooxrB5aQhaO3tAxbz759cScvgtBqBiUfLRVznOg6IEJyIDYR7EY8XD9HXljg
	 YC0h2ai8Ptz1n61L0MCridP6Ql24qd6XMQzP2CdtVieCbZAK2oEKR4UAt5qJA6xvM2
	 KYpFXh6NiM0Ny/OsBTFV30B1x7TMwv6vtg/RJNc2YVlFxZWV6Ov/8nhHN+Mg1Jm0Rc
	 QWwJTO/5kfl0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2A7CF4AAA2;
	Tue, 17 Nov 2026 20:00:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH v2 0/2] riscv: eswin: Add Milk-V Megrez board support
Date: Wed, 18 Nov 2026 04:00:04 +0800
Message-Id: <20261118-eic7700-megrez-v2-0-0113ebc5b670@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIAESy/GoC/3WMQQ7CIBBFr9LMWhqgFoir3sN0gdOhnYWtAUPUh
 ruL3bv5yfvJezskikwJLs0OkTIn3tYK+tQALn6dSfBUGbTURinlBDFaK6W40xzpI5SRvcWApp8
 CVOkRKfDrCF7Hygun5xbfRz+r3/s3lZWQwgfXdeebq2sGTuhT67HFFcZSyhcfUkbtrgAAAA==
X-Change-ID: 20261118-eic7700-megrez-16057cfc65df
To: Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794945611; l=896;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=SDt48WVWTll6uo/OVctZfZyhSoQdBdTCZ/44sy5DSzI=;
 b=u5au61AgyaWYlf2mfOXaHopJIw1oONJFU2rD9aw2fH8nLvUaYZf7YKoTbyIlrss08dQoklfXs
 7Yv3lOtbYLZBGcS5QEURKWrlRcLkeXHdR2VxU/wmaD4Bvvo9CpuMYKl
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

The Milk-V Megrez is a Mini-ITX board based on the ESWIN EIC7700X SoC.

This series documents the board compatible and adds a minimal device
tree that enables UART0 on the USB-C debug port as the serial console.

Changes in v2:
- Add missing email to the copyright line.
- Link to v1: https://lore.kernel.org/r/20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn

---
Han Gao (2):
      dt-bindings: riscv: eswin: Add Milk-V Megrez
      riscv: dts: eswin: Add Milk-V Megrez board

 Documentation/devicetree/bindings/riscv/eswin.yaml |  1 +
 arch/riscv/boot/dts/eswin/Makefile                 |  1 +
 arch/riscv/boot/dts/eswin/eic7700-milkv-megrez.dts | 25 ++++++++++++++++++++++
 3 files changed, 27 insertions(+)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-eic7700-megrez-16057cfc65df

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


