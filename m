Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196749;
	b=uTbZqy5xmc8wMEiBo9lCPwfYIdDemuDctYTHhGkoXRunq3IXB3qncfkpzK9aXYQuGSA8
	 8aohYJDC15t17YgJVmTo3x68G9Ggv0lWcmmTuBBjVW6iK0IqlMPzrz85Tvk3Bh8XLGCss
	 jayeOXa2CGpe/CVGJ6TJ847yRIPO/ooRBkae6r4sDET2Ww7zrOy8fNo2/ol96p5azI57I
	 N2ucSccAOX8DnGowTTZa0xKo6/LEDK9mjtDuHPbz2I3AptKEt3NPhEKP0D0swtMDpc6YP
	 746RT5WYuT2n82q03jSIqXRpct5ZaZNDLwW+pfwQ55yGplsw0DjV77lEW/sNUKKSNfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=;
	b=lIlIq303Cn4Rk+DZtuRkzGiYQMVZwbJmtEJfJ+JVnRT4TayrRRa8eCNzmvVFW84Lq27r
	 V0AptxWPV79qb2HnTZm74Lcyw8XOddFpPrVpIG39bKTCXYzoPtqxSH8ILUGK7J4a37t/8
	 lZPQoH7D1RX7Tp7p7SrHWpP4XaXbGxMzISCt1YAJ3Ff6Om1gNZN2F76vILVfJ2udw13XX
	 C4H8y9cZKWtXFMrLnPW+z3bWnedGfv9mgLChyfQeKnTlVzg1guz/gBUgNEz7jMGS84gBI
	 cLC2oC2EGcFbPQrIl7ibM9eR+ZB2Krp0DScwBMGFSHl9iYjZy210BOZbTsPZV1PXrJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/87VnF5";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E31606A333
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E31606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/87VnF5
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso564809a12.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196748; x=1795801548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=;
        b=v/87VnF5tXFpuu6GALzSsOrSSjXipLKN2LQSKz8JtxW5ShYYXg1ERwBmNZyo/7pJr/
         NQZT4ctWlE9rThx1XyddGk1v/DTD7iIPy1utk6xI/+YlpZDN0Bg3z0iu2wltwx+igLwZ
         G7Y9e7DTvEg1iRQsDQGh7020PIv2zJtUk9ThS/g04QRGPp00045NJnBzNRjkRRIxUsM5
         /S/v57Df1ajy5xtiipWqtnfOqa9q67ybfggt2SOfG7FAilqEA8P3ZrRZ7dSlqkQ/OwSh
         lslnb5XfmLaX+41xVcw/pOMmL7PorzPG5yQk+fSiddyHtttl7lJZqI0qX5MwkNwYLN6x
         EadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196748; x=1795801548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLqQKB4BJytG6FOI8SN765Q87Olbs6zTh7UfW+Lz9ZU=;
        b=2GWuvJ94xn9KppdqSrj1lTowDflY8hZeGi3gTL9e7QZRVY90Rw/gOid814xqf9So6W
         dBh7eeeWQ6D+22Co6OK17DR/OJ31nnSrP9B9zYVTeCbhlUyOArgS7FfmYjAskLyabEWQ
         F8foWPTBIOtNdS2dWenpJIUBECWVzRV9yPh3Gl8inLze/JCqlsiFSyFpUTzs+oNmG0O9
         Z3FHHegpxxxSu9TrUNY4M3TOkePf2Wvtnv/XakXPG3u5WDgq+sLzIgL6CZDPkjAb3qtv
         DcjnotDhxSVUlSmWeSYryNGGUey9lR8uGxVVMOFUS8ULkc+lgw3NGAJm0WLMFNOvhdKi
         cSEw==
X-Forwarded-Encrypted: i=1; AL+hErH2KMCnxME5RUrn1xcNVMdkZOZcLNmGIe6Ub0jr+H2I9XhfgzLYC3wZEipFvUjRPvj4Mf4EiGotHKZ3@vger.kernel.org
X-Gm-Message-State: APuU4Z9VW7DPq/Tg8Nq9G7U7CqVOpb/O+9P26cpwvJD4GqUEKrc3asfq
	B6OGtMyC+Fm7M4vq3saz/GAcj8TA3C6gn6rWy2lig87MiMkpLv4ewQZ0
X-Gm-Gg: AZFdTZeG559dVeykI0PcIyr0pGCMlxl5GC5bEe74R0wrY6Bw+Uqm8+As7p36mLaedUp
	Uu9hKO3OZo2dccb1wv3zpGjGp6xonKNTO3y3wsWBpcFnsvc+2kUVOVxYHnGVcRGwzX26uDLhDyp
	I+6QCK+kqAa9CIADWezTbuoxkFWE8s6+/0fFV1fZlAw+rxMa0UCQCbKOlA/F7zLWF8cuE6N9Acy
	MXb+R2iz8O8/2vavpYNxqvtZzJwxKvZmFjL9FWP1Fxcvl8EXfNCUVR8g2rHwnZJhUIa++tG7vAq
	yB0pWjL0UZch3mEALB6s8lHItr8uRdyZqrUdPOrCX+iCUWu+RNAJqoukBWeiQjkZvFanJcu+Oyb
	GY9rBUxzbgyqJ5FZ15VqIwoxsyIg33zgo6QNW4imrU0KgJLDJ5RuSrY7lMpRLUfAcOsJkofs3MS
	+gkksdieWdD+VEQLcjq1QHspeDgPxYrUtXh/ez2tI+0E9wwgsiDDpgdxVahSUYbSxW8DNAuHW6Z
	1oLqIlSLCxbbT5QoYB0Xveh/l06bSy0L9Z/HvICWbMStaO+CWGBf9/yVrEuqeyNhvEl8193qmjs
	Wj8sbHHcWPKXE21Cz56xmR5Lpkt3x2rgAfTHzI9gdLkgMeQ=
X-Received: by 2002:a17:90b:3e81:b0:3b3:fd13:683d with SMTP id 98e67ed59e1d1-3b41cb1bc6dmr2684467a91.55.1795196748255;
        Fri, 20 Nov 2026 09:45:48 -0800 (PST)
Received: from debian.prasanth ([103.177.82.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm58052a91.1.2026.11.20.09.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:45:47 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 20 Nov 2026 23:14:38 +0530
Message-ID: <20261120174440.123487-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
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

Hi,

This series exposes permitted AST2600 OTP data through root-only NVMEM
for userspace diagnostics using raw offsets. It adds the SBC NVMEM
binding and a read-only driver adapted from ASPEED's downstream driver.

Changes since v1:
- Add the separate binding patch and rename the driver nvmem-aspeed-otp.
- Poll once after a 1-us delay; retain the 100-ms timeout and log failures.
- Initialize read mode once at probe and stop commands after a timeout.
- Use a fixed secure-prefix keepout and check the live SEC54 range on reads.
- Simplify copying, locking, configuration and Kconfig help.

Tested on B650D4U (AST2600 A3), OpenBMC Linux 6.18.24 and upstream-based
Linux 7.4-rc1: repeated reads, cross-pair reads and 40 reads from four
concurrent readers passed. A 12-byte range matched the saved ASPEED-derived
reference fingerprint. The 7.4-rc1 RAM boot used the working OpenBMC DTB
and initramfs and also passed the final-pair comparison. ARM zImage built
successfully.

AI assisted with driver revisions, validation tooling and patch text,
using the downstream code, review comments and Neal's hardware guidance.
Hardware tests were run by the submitter.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
