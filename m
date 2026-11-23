Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477338;
	b=ikaX06HJMp6UGuDRGVKdXjJc+S6w98H57/Wgkody+59icbolE45TqbwSsm2Kz5eMPZ33
	 S+2JcxxQSN4QoBh/AntuefLldfatgm8pj++lQ2eeRq2y9wMFi4ufyu6RPDywk9OyhmAtJ
	 Q59bmjEC+ye32xljxUstlzdxjICQfCdFOy++PEkdGDHOradrREDzTmMUZJp26oOigNtwx
	 60Pe3rgoeWka9ZXJDVpnUpKQpKIceIROQXP5Om9BYEV82RNE0wEvjIG9/DABzFnRJmzGg
	 MZkDhLYs+KGJTtGVLe5a16bCrsA7stIS81Z2cVQA0o6MXCjS7ZzxZPw7Gvpu8yNZuPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
	b=SiC3NmSWNnOiRjWdzZCXUt/Q2weAhb490sBAyuAmR6ipwLLnLR+J0BLp9JIYgv8WHVUL
	 Met5xojnaj7xA2+uW8mtWETI29TLCbYfitt5Qqafyxl7QLrZvTiYIwVP0DqF9wdfr5jcz
	 tnfNWL37x11xz/+k9aiVc55w0o2/NscBtRCG7w+PNbLIiBFYxwhSc2wjxLVlS5xokh1Jt
	 juY9YYDFs6SB5qsTTpfG1ptSjmcvnhpyH7CuuzCi7l2DrRuF8tqK6zcE+zqAVnDP+L6X+
	 poGWbEG9xknkOa//Dcm6GCUDKKAeSdEh2CpKqazdYJ3t/hRMIQj9NB9e3tSe1i0bs3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWaTvH2W;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65223606A326
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65223606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWaTvH2W
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2690533f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477337; x=1796082137; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
        b=hWaTvH2WvQK0Fe/ua18eZbHRadVOMI13PUO18agmTJqMB4Ee7Wry4jK5Bm0cWIHc1+
         oI7RE6JROJdaFFnAersslZHUs/VFmd5LfCLn++EVlhL3IUppbl5KsJcdiQg75nYhIOPY
         yVkcfh1q3meXYK1aNpF34VSxYZg0sIRUuixn1w0IAZdFeXMmJnxKE2B7f4Z1F/lS2kQ4
         csEh3Smr2v0KfcKkT1Rw8azuBMTPsQlVyl4uUyE8UVDk1VdHTHJo4EDKrqGQIn/kaGaO
         /k16dos1+lGtFeW4lKRAGQOvXLya9m50eftp8nWA/G1M+eDknMTwY5mr/v04q+iD0M6s
         RxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477337; x=1796082137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
        b=etUkA5ECYWmzo/D6HM/2biNV5DVO2qY0/2Ujl2T2L3turCChNGFPBbX583bu6MY6QJ
         g5nA9t0JMoQs8ydVlNv+4ugauI4dbGl/Xun2YUwtMGo7Fq++XRd7UeKoDM5T7Ea7k88p
         lP6WuwQlLxL+hkRPS5Az5ozV4je7jYdJlHHzeoLNBKquZhoiOTfstfobRMtbZ3ssYCJ3
         AHcUI87aUDqlEkIUwkXxYqjZ1R70L+ASQP2Ah1PrDq7iWHExgnzP3fz/gpRm9RHFNAA/
         iAR7yuYWOoh6oXgM3amK/UbLQpMjLqrLRkhdH0f1KOYJBWdEll6/ZvtO/3+nQxqwiKWK
         b8pg==
X-Forwarded-Encrypted: i=1; AL+hErETjqg1aPwH53d8SbM5hHzMhcjSTGKy29jFMHAUSWZCPGsMiFUZPrDQllxm3kLRaXnQZtI6PYV5xzwY@vger.kernel.org
X-Gm-Message-State: APuU4Z+fMicovwtnE/wUNJDVAbPupzEyP+or9BZsUIlHHBS6YMuQfzHv
	nh3fhKkKhGevAXli263OiyFV6xWQyOrbS3VKtRz/0gmus5yR/V9bTLJA
X-Gm-Gg: AZFdTZf8s2q5Yry64YsnjdSwUWGAgbXg0ntYshfjBpCY9lRrS+8r/4eHnB/feucoWHo
	jRc0J/Cdd8kmDQIj0LYdzrUk5zCNQcKlOBTLI018viQqBOTrCRevtQ0L0MnjaDXStd8+UAkYF93
	Pee1Hj5gap9ttn0HMjeQ9eEfmKd1p1VB1o1F9Hgk6k8QdiwwvmAVOpFadw3x5SWltDoPenR6Lj7
	MeZ1R/d9fwsLwZzEm6ehYSacbDoLSSpOmaL32IbBGrqgvIOSs8zYpTCNpQjhz1r60zcggOzFgH/
	3vryU6tIgcRq5VGhewbN5vMMyhTEQxaXNOBRFvNCTR8MCVlKGGiXeMjhMjV2jz3Dw3lF++h2qHl
	haVGzcu7E9ZIclCd2fAIHNVB5CDBNCDHxu+ezTXy7RLhAdNJhR17WwXM1c9t2dvIbF/KGOjK0R6
	G1kd+csCGKxlCxJmF/MngT4nfqVKTuxuKcI3CAZH5lWUFpdfQjY4jsoCjeYIoiekpYFmnSYHHi7
	e5xpqkeF/IChYY4JlUPkVYVYsNf8N4k9NeKOGJDEObxmjoXhq8xHkm8/fIgcOMjJejWo+PzajhX
	KAuFcAgXpgSpU2dGjlbOoWabiGUwqptIPaa9+wrWKBBv0Db+vjo4HJk=
X-Received: by 2002:a5d:5d81:0:b0:4a6:f154:b402 with SMTP id ffacd0b85a97d-4abb1baaae4mr25856543f8f.10.1795477336474;
        Mon, 23 Nov 2026 15:42:16 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm23777215f8f.40.2026.11.23.15.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:42:15 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 	Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 	Jingoo Han <jingoohan1@gmail.com>,
 	Lorenzo Pieralisi <lpieralisi@kernel.org>,
 	Krzysztof Wilczynski <kwilczynski@kernel.org>,
 	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 	Brian Masney <bmasney+clk@redhat.com>,
 	Jerome Brunet <jbrunet+clk@baylibre.com>,
 	Neil Armstrong <neil.armstrong@linaro.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] PCI: cs7542: Add CS7542 PCIe host support
Date: Mon, 23 Nov 2026 23:42:08 +0000
Message-ID: <179547732839.3.15916995856832702891@gmail.com>
In-Reply-To: <20261123222404.GA1110511@bhelgaas>
References: <20261123-b4-cs7542-pcie-v1-7-4cde5201d404@gmail.com>
 <20261123222404.GA1110511@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Bjorn,

I have worked through the two threads you linked and prepared changes,
without posting another revision. CS7542 has three independent DWC hosts,
each currently with one Root Port. The DT now has explicit Root Port
children and PERST is acquired into per-port state from that child.
Almond+ shares GPIO92 between its two Wi-Fi endpoints, so only root0
owns that GPIO; root1 must not request or pulse it independently.

The sequence now asserts endpoint/core reset before clock/PHY setup and
releases PERST in start_link, after DWC Root Port setup, with
PCIE_RESET_CONFIG_WAIT_MS before training. I also addressed the vendor
menu order, include order, constants, formatting and cleanup labels.

For the MSI address, the expression using a CPU resource was misleading.
The retained vendor value is a PCI bus match token for the DWC iMSI-RX
receiver, which consumes the matching MWr before AXI translation, as
described in pcie-designware-host.c. It need not identify CPU RAM/MMIO.
The draft names that bus token explicitly and checks that it does not
overlap a PCI MEM bus window using the resource offset. This is not a
claim that I tested non-identity hardware translation.

synchronize_irq is for the custom APP chained handler shared by INTx and
MSI: after masking/readback, an already running handler can still be
dispatching into the domains about to be freed. The locked unmask gate
also prevents a late INTx callback undoing the quiesce mask.

You are right about the physical race. The v2 lock serializes the actual
config/DBI MMIO with the IRQ latch and software quiesce; it cannot prevent
a physical link transition before the IRQ runs. I have no independent
evidence that Root Port DBI itself needs a downstream link or reset after
link loss. The confirmed hardware quirk is accesses beyond the 512-byte
RC config limit. I removed the stronger hardware claim and describe the
remaining link-loss latch as a conservative no-retrain software policy,
not a proven silicon requirement or a complete physical-race solution.

The revised sequence/layout passed Almond+ RAM testing: all six PCI
devices, Root Port MSI enable, actual xHCI MSI/INTx interrupts, host
unload/reload and actual PCI-device OF/NVMEM mapping. This does not cover
physical cable/link-loss fault injection. I will collect further review
and leave a few days before the next revision, as requested.

Thanks,
Fil
