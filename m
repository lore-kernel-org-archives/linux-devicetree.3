Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819546;
	b=zA5U/xhYkXU+0Dzec8n4xEeq/o/XSszm5IXkJffc6MAj9b5E9kw9S1elYM61onbDst3X
	 0L2ZHY9N9dyBwLy3V/JEPZzldmg/yBY8BacClb3zYzbXycpkpCeMI+3TKrXbYGMIrxkeI
	 MkOiSy8ujHrwzyie8aJAybs2YWTEeKUXQ4lkX3V729Zj3WF8aEofimqhAsHFTSxqBqzY1
	 sDhjkXiwFgMMmqNuwHhNqHHfSW7p0uFIBnoDLCowo3UvoZp0ho2XV/QBXe+yOIaRNvozN
	 FQ48LvC8MUqCP6YdUHeX3if7nYwjPnAzQiJRLzPv3dNsBfJr6wexfgiawYG+xr8i8nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819546;
	h=DMARC-Filter:DKIM-Signature:Date:X-Lms-Return-Path:References:
	 X-Mailer:To:Cc:Subject:Content-Transfer-Encoding:From:Received:
	 X-Original-From:In-Reply-To:Message-Id:Mime-Version:Content-Type;
	bh=XVGuat01xtbGFqMwwAT48i+lQJU6RP1WQYE+osx+dlk=;
	b=WmgMq8ffoTaF2bL0hCRyLVGbTVDl2V+w+vQych/IjI2AWfCdP+T/4yYIfLrkvhBZPMtE
	 QNgAP8NxZwERtvgHwxvyCOPs1O3ijoAUVt2ghZmXlq9ESKYVY2SFHanfI5WwVKjU5uckp
	 asSNmjwrz1JeivS18mELwfSlFy3UyrCHVi1jyjob7fkJmMYSu7kCnum8OzxHjCIOdJklf
	 sdzKzd0CX5F/4kUfkyKlAl9aIez3ut4WJj24jyRvU3OpMeTr82jZ5qrwNLKcE/mLgOYR7
	 udZ5t+qgVZrKo8MAiLiW/pfAIJ4s347TWCh2TSznzLl9jPKMpwIE0TQeuQKRovXFQVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=R15BR0HF;
	arc=none smtp.remote-ip=209.127.231.27
Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1339606A895
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1339606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=R15BR0HF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819534;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=XVGuat01xtbGFqMwwAT48i+lQJU6RP1WQYE+osx+dlk=;
 b=R15BR0HFtk4hmy78Z49KI/+1shzMrm0eVMUcQIuJwrTEsV7qTEjt3LY767PjVu3bjaW+J0
 zfmnqkcPUQh1cNPtWiZ4kJgLYN3fENeyqjyGrJwb513AHfDdoAW9qLdqllfY3M9bq9rYbQ
 AS8Ews2c8AmeAtjXZ/GBlhCxa5kw7CKGOmaxVt6dOOiiXMSB1OUt5nu9SuJxy/nbsYgjo6
 soYd8NOB7VQB9aFLTo/b5rvpREMrVf+0cAsROx/WpiIcDOwfvcOwvUZjqmjW/krosvLdX+
 3b56oTsDrejWlLuV1si16nw7uf24qrKXhqdUELNiG02P9cc2zUm4nU7CfF+8lg==
Date: Mon, 16 Nov 2026 16:58:38 +0800
X-Lms-Return-Path: <lba+26afac5cc+b2a3ab+vger.kernel.org+sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 1/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add 115200n8 to stdout-path
Content-Transfer-Encoding: 7bit
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:58:51 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Message-Id: <20261116085838.951269-1-sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Specify the console options in stdout-path so the kernel configures the
FML13V05 debug UART (uart0) at 115200 baud, 8 data bits and no parity.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 051046fe90b2..804a9e64cf6e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -15,7 +15,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	memory@100000000 {
-- 
2.43.0
