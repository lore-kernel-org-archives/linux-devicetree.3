Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516329;
	b=vzwnNBHAt7Q9RrqcWBYc2hhjsHIr0REPws5Aqqqp8wpBkXY5o9qnhjKx+2VWAKBPQpKQ
	 NnFz01zldpvPUglIZc5dg7htUMu6vyRqc5q6mmoXQscUsOBmPcyMyZma8ussG0gJMO6i+
	 FBNsVX934sUnwCVZhML6gGiDFn8JqNOsG09w/1Onop30qvs6/38Ga2QUq1fDZ2/UAShlb
	 tPAjxiCWUFGM182xFpaOyYUYVumg6iSiSpTQLHQY7bEhIJQne/R5Pj0Dz+Y2Y2cAwpo+f
	 kqfDPjbJ5PDmPKtQGTtElbnOKuf3OKjKlxFDPJyzXxVLeHQ4k5j2Pq41/byL6mDjPKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
	b=eSZmJiEIdKFT1fPi9Njwx5QuDIzGoMVVqwEn27p9Xvqs43T0J3UoIspqr5pd+yBAqxXX
	 sy4ou1i9lhBYqCwGy+a9V+ZTbTTu9D5EkDCk7sEKymKgE5uWpct0EoGRlQRHTJHAmxB8R
	 RxuTX3mG7bQK5utkbL12OCbbJOVJYFz11GUmDJl4fqbT+wqWYpDxC9SA/ge5gT4UPm2XJ
	 keBXRWu0Ya2dSdjvYEErsbAN0I/qzOmUvJuC9puj/Rb8k0P5eymsXoQAl6Z8JO98L1hFN
	 8i5w5hS9joEIQVnLML7evGC4s3XvHeppUAy3h2P2172TNeJzgxcv2VjYYuugy8lEs9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxYtZjny;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF3606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECF3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxYtZjny
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae85add512so35158591fa.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795516327; x=1796121127; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
        b=jxYtZjnytvxvCfLSD14Mjy8gdnPqOnkGAD8oV/RDjwN3Jq1OKzV470i6aqaho1R4rh
         4Z5JCBcHy7QYAFrknXmkiKXtnooQS32SNGm3d+o3kZ4CxPckt1AntXrrsZQA8v3zafII
         dILBm8eyY4rqPoE5DEZJ/d0foS6n5PTS5uZxJMgx561EYe2xox8+Ib+COdeoMEwORsvK
         MnJJgtI+PTigIutZQkV3pJFaRYKImIsbYr+FfeaASJaIfcYsX45nG8700Yq6VBixF8Ck
         njHV6e+E5HJLJNBUTM/UUnfa6gEKDmKlNE+rnTeoP64AIsVFQec+R1Zqg/WCrAOrTqeA
         87wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516327; x=1796121127;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
        b=pRXJHW3qbuJtByZzIfx6CtY0iv+equ/mxfoErKVv4NHRqhbJs7ll4ahV588RgLftZI
         BCpHyFjgiYtK7soFfi2Tx9m+LECfNVpvexzQ/KYILwTI7gWzMPzNjoC4yMw+kT8fhZUv
         /9MhNXP1WF0E8ESo+HsR1RGP7KcjZ+mYsSUgLtPS0RIcJt9ix9ZMryUK4ceL3UovT5dX
         CXPpv3nqee897W2h/VgsFKRg22DwYml0GTpu7+r6vmDjqvVNYp9Lch4gCAcKrG85JaCd
         Z8zmFr/8c4l5yFHA0UvfPVec7+vWA/oKG+Llv2bfcN22rE09Ao6T0ZxpMeyGHcWRyuMh
         CHcg==
X-Forwarded-Encrypted: i=1; AL+hErG4WQRS4C4ZFk/8pL+mmM+oTyMiYaFsWxARA34MGEPzA1vbtmN+5Ubg+3+4iEG+IzdK4hZ3IYWmJNFc@vger.kernel.org
X-Gm-Message-State: APuU4Z8hLBuIhg2jWinNuNIlNgqVnZdm3R8vS+tmMMwb6Ga86HkvE2b3
	uZqZxac4UIbmQTQdHa7bqJpejqIR0Q3BQiQZslufZh5skhqkGxBUTCPq
X-Gm-Gg: AZFdTZeRpGIwGVFPdju5XzqmXagjI2+/GDXxVOSdO1loOVZUwGmKZqfw6ygKFBLxBVP
	9aIorXupQ6JYq0rroKFbo/KA+pAFuBIuHt+OOGbsjcyb1ScRj5Bi5SrG1GS983y2AGOJFPomKU7
	cnYZLaAfQMgGYdIAy+4qbWBk2RtEgZL2yvYPEMCXXeycfssRqj0wAXpMxfE54ERwlMxQ5nmgFc9
	22L7s+xBCyrzhAcosBRD8kWHvL2STMyyccivuMKAkjm5QF8VStiUcFh92cLqVyka5+F+DlF2X25
	lW6OEbjpP7nzxQE5T3b0ueihIj4eLtOJSLzWIwyoy0IrB0nyWNUXb0twVRbRoXTLWVyI8PHekvU
	rAgxx3x2NZA3s9rDfsnvvTHgZQyfqGYiYnnGOLM7FNBsQq8b22MHVsZCc7lsGQPw4wTyisPezOK
	A865+vfQQjMqPxOcW3Ipgtgh8zxkFjRp/uv9LZPR7vdbn1IMBRQT56AS0NrK65PhMDmA8FLUgmG
	7cuLygF2jem5HdgU79R8RITq6MLSXacqHouMfd3tMYYrzowaOSN8+iLcQ+vOm6aRW0Yv269WOy5
	HORXyFxf3PGQCE5an+706PJMYJizvuzI+fAWzvbifk+Gm2Z+ok76AE8=
X-Received: by 2002:a05:6512:3d0f:b0:5c0:4cb:2415 with SMTP id 2adb3069b0e04-5c1bc7c9a8bmr4202658e87.28.1795516327013;
        Tue, 24 Nov 2026 02:32:07 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332c9sm3680542e87.7.2026.11.24.02.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:32:06 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] PCI: cs7542: Add CS7542 PCIe host support
In-Reply-To: <f5d30781ae9502cd76ee2b6757f96a0e5ffa8b71.camel@pengutronix.de>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
 <20261123-b4-cs7542-pcie-v2-7-f589a9cd0bef@gmail.com>
 <f5d30781ae9502cd76ee2b6757f96a0e5ffa8b71.camel@pengutronix.de>
Date: Tue, 24 Nov 2026 13:31:25 +0300
Message-ID: <179551628581.3.13614361091709904582@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Philipp,

I'll drop the PCIe host's select of RESET_CONTROLLER. The host only
uses the consumer API.

I looked at reset_control_pulse(). The CS7542 host asserts its
exclusive reset before enabling the clock and powering up the PHY.
The PHY has separate reset bits and leaves the host reset asserted.
I'll keep it asserted for 10 ms after phy_power_on(), deassert it,
then wait another 10 ms before accessing the host registers.

The helper would cover the assertion and hold time for a standalone
pulse. Here the line is already asserted across PHY setup and the
controller also needs the delay after deassertion, so I'll use the
explicit sequence in the host.

Thanks,
Fil

