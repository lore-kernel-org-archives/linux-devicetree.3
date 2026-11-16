Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815704;
	b=e9WxVeH+vHt6GkjetCrq3EoZjezr7IpGGbf4juZmIPvW2Ish8NS3gR8VuniDrmYk2c8u
	 M9pCnj9Ie1D5+x3lJXebFqjjgiJJ1+cHLc1kkzOLf2JcskWkM3q+q9vgPeTeQzmn4B2/X
	 gB9XLqVrCU5dkWE5Mgf7LFb1k6D96GASvbL2io4aDTPmEFzVcNXtzC3KjlCYnP8JiktJM
	 XemRnqZn3WLm7EjHkIV1UACD+lBRrsK/EQYRjmzwGKuI6xJae2/M8iW5L9Ys63rlAIPGB
	 QCa6ArpTCbJXroK8Xo0U4YGT1ofcmyxLns7DHb5RboP58LBM+j72XPWyC8x6+aGIbWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
	b=o2Vq6YZaFzw+rRoGV2AoNb4OFOXwpE5UdBcBLUXIv11pt38MbWe0UUt3aFAkcsL/J1DD
	 iZq+3cf4bxbhxEbe+wzVesOL7lHaZfLHleIJ2LAkukGQZ5BCYrnH87Cyb1sutP31djkzA
	 ITlr10jamuyN+qXbJ5oGLiQfkmf6VcWQubjw/36K26aMZRRcew8O3D+UNYVbbw/1eH9Yt
	 M/n8YN2X3qUwz4/LUftlDFiJofy+VfQ6mtaE3JHAM+/cMTpi2obIFm3xRuW7OFpY/4Qyg
	 hUe3VNSYa9wScCIMihQswHBmsGckxMSgcXGllLGRv0EWLRQ/Jez+jbP5w9cR94Dc+aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aASt8vQf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA43606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FA43606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aASt8vQf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3776938eec.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815703; x=1795420503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
        b=aASt8vQft3vEdGQMeIlFG4pbdeaQ22pdQIz+6/E5d6SDKEus7AEz0i3o89pCm/LckY
         4L0L2PAN6mBMCwTwAIjDwQWtJOCEw8XKsJbhZrFO1nX77l9G8SWYzKfsSGIWbTAreI14
         +swN1pXsb88X1ERXrmf3FwMKtHgXPELFWcY7oXR1bV9VIsXhDwQVvyHrG1g03vU9uC1e
         AwxARZcOY9eB0Wy2gw14gnDvhqiOj4uoNFVfd1ME2pA/kiNtc0tweRSfg5+NWn+bem0k
         mw6olnXI0PnyguqcZqkL6+n0YNuPiEXg5KCpOX6yFSkagO+60OSV/WnnJ2DMvjKcdw3g
         OCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815703; x=1795420503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ygwqe1JP9A9W8L+SChmCtHtv5W7cm5qpHwTeHwLkl8=;
        b=XLjanvstcxj9CdGlquFJOpQaapYlVwRt6niOtx6WM0KmoZoojvd3iZCAc0/tP1SO5S
         PHmoef5k4ZI7vsCA0C/4tlpKi8ff0Kd8hQIcrxNTBkvmQ41cxhtQTKSJBZYHi6ZiV0Oz
         OHE1YZ7tesMgM+5a5/n16nMDgtMCp7Ks6gCmXzssFb/M6wgQVJh7VASkpxFu4dJTl3XF
         cedVTaoACfXdTlG0qFgBazUJiN9mkPGCOb0XDQyX4vILfBt8Vn3P9no2PyIyxypUGkXy
         Lox/KmLf54MkQfCHNUD3EUksLY2vcc32MzxfoFGya93ZSWeCePgcQPFLzPJgZtFFIR9o
         SZzQ==
X-Forwarded-Encrypted: i=1; AL+hErFe/uaUdvyGQjqOQlqEJDE/o0Dn4Nn9eYZQ8NPN1Wp9TxNGcTni5Tvgt646Othurc9wc8u0gdpiCaeJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+mmaReZxlaHd0mKCzVm8P75ogO/o4FZ/E8OU640EJzdBKI4h6Y
	fezfpzvP+WzITsqmovA5MAyjdXQD4pmu3icf7Xdw0v5d5Jqk5IRg14W2
X-Gm-Gg: AYBFou0LihVEijWjEsze19uNQo+Ho8uDRgapbD3bPths/Z0K3imwOXJxiptkPxc/vMk
	hI4y4Po7MO8WUKuVO6Q3E9MBQGQXR5dcYIUBWPBZ6QkvE7mmX0VNtv9Q7XWItBFA589tT/1kJbN
	Z1wrQL8G2R2lJpXhINDjrJ6lULEkkeDwHg9s0BdKjhvERIJY/0I39SZIT/r5yI9YCr7zpW6ESvF
	F3F7IUh07zWePaZ0kMbIKp7yp2a3u0iCgfgTGtnKqgvbF0AprVOSvrJCNkFPbXpIfEf7LoTS6bJ
	QERNSZtwn0sNhf7XKabeF6qa/J24V9fXdXb4hafvz7k4mt6Fhu3WxUVrjWn1E4Iqln/87QpCPKS
	8jA/hBvq5JuYXZ4eOf1f0i+tZkdJ2Wtlg884PgwTkk2Dls41Wr5RryKHjw8h0uN1/GBvm32MkMi
	l4QQ7cv/aCliNRFuikiC/snQKVy1z95f/hwOB2OA/3p4gWujgErWZDtF9/NcXbRyoWaY4+SCqZj
	3VNdlSNf3xS/UbV71aAoAl39fAgtZS6B4z3M2Y0o42aRJO3Z4o8zX8SSH95MjM5s34HjPH7Lf+t
	6TFLHHd39UHmXSAfSj6hsy/Xn/azk9jhhE5a35jBpbNvNuqvq2Uv
X-Received: by 2002:a05:7300:d584:b0:378:a35b:9e1c with SMTP id 5a478bee46e88-379684afa4cmr9309155eec.37.1794815702636;
        Sun, 15 Nov 2026 23:55:02 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:02 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v2 0/3] Add read-only SpacemiT K3 eFuse support
Date: Mon, 16 Nov 2026 15:54:20 +0800
Message-ID: <20261116075423.1519438-1-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds read-only NVMEM access to bank 0 and bank 7 of the
SpacemiT K3 eFuse controller. These banks contain temperature calibration
parameters and other configuration data.

Tested on a SpacemiT K3 COM260 Kit: shadow reload completed successfully,
and reads of both banks matched v1. Repeated reads and reads crossing
bank/keepout boundaries returned the expected data.

Changes in v2:
- Trigger a shadow reload before polling FUSE_READY; fail probe on timeout.
- Enable the clock only while accessing hardware and leave the shared
  reset deasserted on teardown.
- Explain why the root key and SSK registers are excluded.
- Use an aligned __le32 cache instead of put_unaligned_le32().
- Drop unnecessary Kconfig dependencies and the bootloader initialization
  requirement.
- Use devm_platform_ioremap_resource() and align the register definitions.
- Enable the eFuse node by default in k3.dtsi.
- Add Conor's Acked-by to the binding patch.

v1: https://lore.kernel.org/all/20261106060525.346873-1-duge1256@gmail.com/

Jiayu Du (3):
  dt-bindings: nvmem: Add SpacemiT K3 eFuse controller
  nvmem: Add read-only SpacemiT K3 eFuse support
  riscv: dts: spacemit: Add K3 eFuse and temperature trim cells

 .../bindings/nvmem/spacemit,k3-efuse.yaml     |  63 ++++++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/spacemit/k3.dtsi          |  23 ++
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   1 +
 drivers/nvmem/spacemit-k3-efuse.c             | 199 ++++++++++++++++++
 6 files changed, 303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c


base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
-- 
2.43.0

