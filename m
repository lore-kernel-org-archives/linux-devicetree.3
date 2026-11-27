Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748352;
	b=zn6i50db890TnTq6YeO+Mne5RaHocxPtUza3iHp/PRdehymmCq/cy7A7X6rydSC+aob2
	 XPWiipIdYCTcjjrmFELr6Rs+PF3rI96MtgjaZ2aCWycJKjbLvuEmnOa+GyAyAg6xsLWPM
	 7NQztpi3bnTUPzcqAPAjh264ePODQoOFTCzdoj7Ktyw/7GSX70CeohmoyxyX07XyZEXan
	 xL0EzaPVZe0jk4vFQMXKi37UERs8jbpzYeVFrW3rqrXBGSAaEqwuSS8fmELvCDdmj0jjN
	 JYjI1VhO2RJJ6oRxFnqMInx21XhsE+CSzLk+5kHUOyTN0eecr/iG9dxRUMJYzsmyz9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=;
	b=DL7EYZfq3Jl6rfOOK0IiNhoz0w7jQQ8LafkzCP9Pp6QQh3dzAC9bxrf0hjewjksm74uc
	 tQS4NfjM5qiEUIA/ZuY4EPIOhRJvDcLf3urCfYeLuo7RNO5VyAatcVFc5vIUP1PHGVMYd
	 umG2ae8+Nz08um31YyuInzrke44mqynk36iyygrcGe2eQvH3dkYrWkvwizQlK/ybfQHJs
	 iz/X1eBmEYy3nWS4EVRurR5wyNPZZXrtUm2fRYFPNEi8TY4rOr9DGTXavJh2ND+ZfsdUH
	 Fz1NnxZBOTZxjLbmmC7VJGFNDYRPMmUFb8YbyHKiThZ/rT9Sp8tGswyOe1SFs9G5skQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yiJj9l;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F98606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0yiJj9l
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so4328371eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795748351; x=1796353151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=;
        b=b0yiJj9liKtG/KBF/XftFlq5Rz284tx1BiaI0oOkTm4BOWDc8pjvKd4OjnGfIBH3dT
         zZWVqPVetb1yHamv9buz7hcY5Lwnr2A/yw1UgNYxuymWb0pi+HsPpEXB22HZsNxmpoxp
         pBGFcVjsu39wYc7qYnMIEaAcTfmddA1Jmx5bw2OgtZFlTNCOZ9jkeRw8Uh4BdcuEI+Fb
         5+uRmw7zsO75XK+zOhj0tVHUTDmO+q77YA77TQMbGQgHhsent25dW1gyBDdRchHGEZwF
         gz+jVYjzOmoZVyfioFZrbgp5MERsWaC2KVKDq7VNZibdyXYkonFXLt0a4NN75Yu7EJDM
         kjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795748351; x=1796353151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btx3limhEerqDxGaD4XQgQujXJCSxle1lIB9AKeLA2k=;
        b=LnSLPEVd52fKGWE7h50tjNYNmlzy2VxPgd+ldArGm56Pn/NvAvvWhrKI585ofQy+Cy
         3IrUZe2S2xQEUj3MNqJx7jhRbsBS2JcuqSUyANNaHDitdl/+ccbq64NDAWmrWTfqeYH6
         Fap12wAGSOMmPS3pJIrCQTAbPNILDr7CRctDoptdKf2Fu1n+mOTwkwnms/cmKdC5WEtm
         4cBQhYonLbnhTzxacXGXM8yLFx2k7RXsTjxGlXGd4zLsc6bdcQPLbf4u+dd9oEm7kQOh
         b3UNjwLSI7r8XkWyMPZIsTzEoqYORwnMlDC8XxKI4GYkNl6oKb9Xt95YbjIjQyoShRm6
         +8Tg==
X-Forwarded-Encrypted: i=1; AL+hErE4+o6XP5ksV263aPWhWz9vOVD1ZUDP19J20odY5IU06AKSd1yCfPvhjFE0DsjPrm9x64d3NNLGkm2v@vger.kernel.org
X-Gm-Message-State: APuU4Z9jfVNXRXdPCIgnxkczWaVsSK9AyYQyeGhHJ3Urn++RT89IyUbp
	7jVbXriV0Y5s1U8ySWhX08dZFBXf7t9mqhRHTgsjPQigX9D7aXHtNH+iuRt6iA==
X-Gm-Gg: AZFdTZehGnGZAro9loZPuxDVhqOnypW7oVvSlh9Tgx632jNccWBSbv04Pd7zFiPtIdK
	5fb66zUfAYi4VgoaNPbEsKpMiWKo8K6Zok4FIIoku6DiH1Iw5QzNVXtNsBcaQbRGbq1h/HI7jUt
	/F3Z3W1xxZdhPmb4Pt86b+byn2swlPpuVQvvWfzb3T5O4ZSQj3a0mU8E1kSpnZVzAKloP21KY28
	LerHMZrSofL+ufdEk23sCl0zQmAE8ILFTUojnhS7IkGA7jZvVVWdYX5Fr164c5Lfg4m6KAwg/RW
	gkxniQWzNkKBu21L8RJWtbsMFGNPSKcdql0dmHFDs2wyDty2dIdQc3EqKd5KIUKv8lHRibV41ee
	DzBLEkrh6rrubqsz1/6h++dxXVbojN9O1BBFjQ3iloyNcRpmXwVpogPJU5Q/UkZnf6UWh66AtPy
	xqdXUvN0V6sbY6vzPTZFyfvQ0lLAPoQIx1ElG6Jd5hNIvFhweGGiJSXGNs1FXqle+cMMLX+J8y4
	5UDUN/O5J2XK4mp1MJ9SFuu2RxHRMB2j4gKSdXqcVlaNcODjQ9oUkx3w+HKmd/E4GG3JauTDPqk
	3xoPl52PAyCuNcHiB/2xWC41yeqL8eMPhn3Eg+NqY8ZsCU0=
X-Received: by 2002:a05:693c:41d2:20b0:386:ebc5:4747 with SMTP id 5a478bee46e88-386ebc547e4mr1066918eec.11.1795748351083;
        Thu, 26 Nov 2026 18:59:11 -0800 (PST)
Received: from debian.prasanth ([103.183.205.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm72013313eec.14.2026.11.26.18.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:59:10 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Tan Siewert <tan.siewert@9elements.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 27 Nov 2026 08:28:15 +0530
Message-ID: <20261127025817.20090-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Expose permitted AST2600 OTP data through root-only, read-only NVMEM
for BMC bring-up diagnostics comparing raw offsets with reference reads.
The series also describes the SBC's NVMEM-provider role in its binding.

Changes since v3:
- Drop linux/mod_devicetable.h as requested by Uwe Kleine-Koenig;
  linux/platform_device.h already provides the required declaration.
- The binding patch is unchanged.

The previous v3 series passed ARM W=1 and B650D4U/A3 read validation on
upstream-based 7.4-rc1: repeated reads, pair boundaries, 40 concurrent
reads and comparison of a 12-byte range with a vendor-derived reference.
These hardware results are from v3, before the include-only change.

For v4, ARM W=1 driver-object compilation passed. Strict checkpatch
reported zero errors, warnings or checks for the binding patch, and zero
errors/checks with one new-file/MAINTAINERS warning for the driver patch.
The existing ASPEED MAINTAINERS matcher covers the driver.

Previous revision and review:
https://lore.kernel.org/all/20261121034053.39878-1-prasanth.padarthi10@gmail.com/

ASPEED hardware clarification:
https://lore.kernel.org/linux-aspeed/KL1PR0601MB3986A356BD06F98D0FF9AD5E80792@KL1PR0601MB3986.apcprd06.prod.outlook.com/

AI assistance was used for driver revisions, validation tooling and patch
text. Hardware tests were run by the submitter.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: sbc: Describe OTP NVMEM provider
  nvmem: aspeed: Add read-only AST2600 OTP support

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
