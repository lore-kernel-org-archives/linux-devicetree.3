Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795166653;
	b=u+ZMNUbgSXtHX/mGy3f6uf8aL5kLDz2XbYh+MW56voeZo1y4N/H892DjkDDC9SxcoDde
	 hXHvEsmgCRe5CVKgQDxJLxsamv8G3/tYq2RwLtE3tlKGAez/Pd15wA4ZfIQ1CoDnnBfUX
	 +0d8t1Bo9qXT7Q/UFuUliDs7F6S7Imrr5HzsbZrzjW2a7py1SdjdbdwFOQnUxvZ80NTVT
	 XmLMjyaXZ/QnxDuMywL+Vz50je9EnbwcIwmaGvU+jaHYUGqc3oCySJqyFibWreQEdMX/J
	 6+ljj9jEFb9gc2oBn+HdeVPj72r7pubqDwKAxZ+Dl0zKxaSoumJUW1UvGP26sb4vINg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166653;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=bxRh8/Ig7IzCfU7/DVmWmCoFk3Y96FP99HnA29Hqeq8=;
	b=V9PnLzP3poK7SV6XKTZvm0rsHR3XJKvU2h9pQ+0G9vHGNZrI9oaZ64FQbpN5gf4jjCBA
	 SRh4dm0hH5rsxkG8Uc1ybAUhIW0DK/RF7Cke3ptAGIBxBQXCgUDAPksAwHyC1M/l1vW6H
	 0wkjEMCP8xAWe/y4VF5vi9fEjcvzw2od1zOgjSXn+7dwQAri5InQ36S6lUldGLCPAUcb8
	 aCHn3/k+OToWV+w7MHivZYFbcbul2qlZiKTMB/fLBHbUhWE/payoss3t3gPfEIRo4TjPM
	 f9TqrFFTJlwFC/DKQwSe/bF+Dtxkfazcv3rDiniBVaGKrlZDByK9tTO0sRi2swtupvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmXoVska;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7C606A333;
	Fri, 20 Nov 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UmXoVska
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795166653;
	b=jfmVmB7NFjEeOMrFOLx1IJsoP9N76rrpHpmYKL9Zm5sGAkMnsnkvmlHBHYBvHLsgtvhJ
	 M0X/ZAfM02ZKl6S+0Ru1Vx1RThMO85j5XEdH6itwXD94rUjkxhYrGx+PkCFidAUbhLGXw
	 VStkWiYyo6TZiIMhYfRUfG8ewj49u4LXojcVTiy7m1qoaFPJHFlApkFtB1Frh4rd4KMvU
	 bHIohURms1X6+LL7zE9J51l0GuU8SwQUDuyJfR+iKIH9VIkOofPWKVolgiwp1q1wbqsN+
	 qry+dTub3Rp7emfZryJXLLyu3COXOHMCIfhQoLRLn7tcbFhfx5I6SZtO+xfPwBXhxng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795166653;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=bxRh8/Ig7IzCfU7/DVmWmCoFk3Y96FP99HnA29Hqeq8=;
	b=YWQ6WxAmNL7WWkLDYXxv1K6gYQVWZa5TSW6dzzZDuXW4PB5R7AaddBqyVMD6K+Cdkc5S
	 doDdMGgbzqKSrVKzXMEB8qlcOOaR0xSeh9gA78etqOY0pM9+kujVfeIODDfHWnPJRCUp6
	 WFXbwq6/wcxGC8Iyekzpz/3Qk9M8iArsMzw/fnjP6P+lafWS8qCcv/zRGKSem3xlauXYZ
	 TufEmj22lqGNhDzggkrXqWVm1+XwDEaNmhJPGdQ4Eim1ygSeiABwcbCUx7iMz+5n3Abgg
	 Sj0ti84bWAVwiOANeLuZqT+tDXxnpDcXZBJcj6RZgj3UyuT0tO6g+HYyVCbCT6fJJXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53A881F000CA;
	Fri, 20 Nov 2026 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166653;
	bh=bxRh8/Ig7IzCfU7/DVmWmCoFk3Y96FP99HnA29Hqeq8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=UmXoVskaQoqNyhqvP/8y9VmPn9Xsgqn7uf4MQlTKQIQRUgJ6BiO6RoZ0Tx4N1vXX+
	 y6wZ/mqW90ksC3mjCI2Oe6YegzqVP09kn1zmvzBymbQg8ZLJZYRGrbsXmN+Rs3WNEH
	 WBIi6m/YbHVEnhweqSWT6U/zhMUmVUWPwxoODnTz56RZGf/hsTfj8WWN1OC6nmCGCO
	 mZbwmS4S8IZ/rJ673OUA8vlc5S73SiXpRCTRGN6tHpqKW7zxASGUwjp0JnN2HQvgQD
	 f3N7z+26v32CkcgSCPwiMOfX5CcKMRnTfLCH/doGh8TEX0dlag589HQXokXt3VFtr7
	 BCB3/EuddqeZw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C9D94497C9;
	Fri, 20 Nov 2026 09:24:11 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v3 0/2] Add Altera timeout bridge driver
Date: Fri, 20 Nov 2026 09:24:02 +0000
Message-Id: <20261120-feature-timeout-ip-v3-0-affcc644af5e@bruker.com>
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
X-B4-Tracking: v=1; b=H4sIALIRAGsC/33NTQrCMBCG4auUrI1kEtokrryHuEjb0Q7SH5I0K
 KV3N+1KQVy+H8wzCwvoCQM7FQvzmCjQOORQh4I1nRvuyKnNzaSQFQih+A1dnD3ySD2Oc+Q0ce2
 sqpRoUVrL8uHk8UbPHb1cc3cU4uhf+48E2/qXS8AFN0bpRgG0pYZz7ecH+mMz9mzzkvwwJPw0Z
 DacULpGYWwJ5stY1/UNE6lLbPkAAAA=
X-Change-ID: 20261003-feature-timeout-ip-7a93630de299
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166651; l=1799;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=kYSfZpE9Q+XmwjPs5z2U1miPr1VgSlYB6FBVbeLyHgc=;
 b=tlzWrqVpZgqD8x7PyspcJbSCH8wS6Ge0GP9idKN5hKUMvT96Lu2MfUkCwHwEr442kKMjnWp4w
 O1c7/HWedHWACtb2NAo/411xv8pC/Y9Ah4Y1EAxknqRXuLIqfu56Rod
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

This series adds support for the Altera's AXI Timeout Bridge IP. 

The timeout bridge connects an Axi bus to the HPS and provides a
downstream address space for devices implemented in the FPGA. The
bridge also exposes status information and generates an interrupt when
a timeout occurs.

The driver registers the timeout bridge as a bus and allows child
devices behind the bridge to be described as the child nodes in the
device tree.

The latest bridge documentation (as of November 2026):
https://docs.altera.com/r/docs/683609/26.1/quartus-prime-pro-edition-user-guide-platform-designer/axi-timeout-bridge-ip

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Changes in v3:
- Addressed sashiko findings.
- Link to v2: https://lore.kernel.org/r/20261021-feature-timeout-ip-v2-0-a037be089518@bruker.com

Changes in v2:
- Address review notes
- Simplify error handling
- Provide better description for DT Schema
- Link to v1: https://lore.kernel.org/r/20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com

---
Vyacheslav Yurkov (2):
      dt-bindings: bus: Add Altera AXI Timeout Bridge
      bus: Add Altera AXI Timeout Bridge driver

 .../ABI/testing/sysfs-driver-altera-timeout-bridge |  21 +++
 .../bindings/bus/altr,axi-timeout-bridge-1.0.yaml  |  86 ++++++++++
 MAINTAINERS                                        |   7 +
 drivers/bus/Kconfig                                |  13 ++
 drivers/bus/Makefile                               |   1 +
 drivers/bus/altera-timeout-bridge.c                | 184 +++++++++++++++++++++
 6 files changed, 312 insertions(+)
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
change-id: 20261003-feature-timeout-ip-7a93630de299

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


