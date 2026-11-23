Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425652;
	b=hKGGrPWcswT317OzgxgmXseCC/vFVxgguOX1RixIAouzgvmZkJd1JW5d3sCoP0k8lgE+
	 El70u4GoAgmF+wWocKrRsGpi2cz4EBOQh5sK5tmn2AKRHBj9wxljsjcIxjO419I7Gofep
	 KhOUOXZDBmAKTwktUkAJj0me/3hhwntvGDF2tHBzeF7IV3MehNuTL2oTx4MkzP6kx5SsU
	 msWHNGm6Y3PcsbjwgNtnph7jmYVkMZpZTc/yzcAjXdU5kVbICCTzJdpgrNZojsYwZZiCi
	 11snXfN+WITHVPRk2hieQVBVBLy+A+fkiiN0dFAI6hVN6KE0r+IKyw1H69afCJkFJew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=;
	b=vBshwm+ZNhYEnRkoUVlAr1R/pNF0edIKdqfbzommG4IRLACLh7D7URtPps7fNQa0A5nx
	 LplEQIAvDAbPlGfNh65HGQpsoyPDArZPMtdk5EHbqHxSk5LYO7mn8ZpwCy+oOo07hkEv/
	 YAuTBO1VzuoH9RI5iO4lwtm44cDyarOJW56T/J5OXDth3GbbCkN+6qHPQdqygik7o1G/H
	 Mbr3HEZfsB50bX4DmKFhGr1NS81k9BfAtDm37tMQ4wvk2bEtc5S+Xkd8kypZCMJO43HN3
	 WvmOhCK/L8N23psdzqe/nDmQ/j8EGtzkOcLaNrBZrs0NXExVilLTkVcsQGb+VoS/ciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZnnMHLyy;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0D606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA0D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZnnMHLyy
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so23118815e9.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425650; x=1796030450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=;
        b=ZnnMHLyyGEi85eItm4tPYEAe8+FkKV19phLWW9u/kEXQMLTfvMYy7r3G2HRniYSz3w
         7MW6uyj4mxuTe3P+B5/kK6P2ruVi/OoNcpE14GXUoA8hybNbSkAVmScSpX0J3ZXKnu9T
         yoChKBwHjhHiT5MLku9vce5ZUS8pWpYebcUpFG7qku8GUWTg/LvkjCSOqtxP4nraIB4X
         eapoyMmbQUQYcbHrTYv5hHIrHlflqQZCIxeoSqBQC1Mpx2fkmQA6k9p7J8zG1TXt47e/
         KYVBu968nHtGjDHJN2pqTjxKl00GZKuqIZa4CrgW00s4fKdMo3XtLfI+oVZJTk99r3Yv
         gOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425650; x=1796030450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=;
        b=o6hQvWx2amSS368d0/4eJ2F3qx12EI0Xjz4Kbt1Cvto1I0cgl2oV8OJCOuEsA9wtZ4
         7Z8YMPKWIsp0eeANohEc8AWtJrthQ6Rinaa4WoSl1xADYBuZRzABK3v3IlOYW83InuLs
         4UWfLACCvE5MaT4BZJbzX7ORHw3JSBECR+T7HiBcV1nI1tABfXuw8MjbPV42NZmS6o59
         xc/QzeqGk8UwgJrP/ovYB+ovvXDtr++yqIoUOP2B160+IgPYKmYICqeerOZGvNJ24F4d
         x+/9FVNKXdntY5vODzyCWCQCS/A48OeHkt7pDD4mv9UGVkIi8SzBpy64iPlJStsE6/T1
         ebOA==
X-Forwarded-Encrypted: i=1; AL+hErEHQYp7q4rs7ZGjdxoL9Z0clKw4TeZ5f9qPSwpkzKmsWvRAqlqOlBJBZM6TI/LFBLLxP9l07OnSozCF@vger.kernel.org
X-Gm-Message-State: APuU4Z9eIgNFF/9VwlKMtYH8RV8aJWtwpXo9tLisT95EjqIVQRs1tgae
	B1s2YN7AITLzAd/NXcgjwS+ICRvOU4beTiEOUAAVg2LHLiyzjwoPsK+lQnodRYoLc8o=
X-Gm-Gg: AZFdTZcVVHwgh+tfMQGhHda9dPQUI6HVmxnOu4fKJJXkmvpOIHep6CRuOsX05AxBmSX
	Z3sGFgNWdEG3TnCH2g5wWEkTDa2QXmaNRDAsa3ahWz6JtpWxCdeCu/MK1Qbxd+a2sNCBie09G5p
	Iu8F9OS0qxLvATr9vOLM93hTTszs/bZ7awFhwOzW9aqOtjWRuryGioMLkb1TBFP7nHpcxkMiN8o
	9a6xrC2U32pqgnC9nuh0WlUamgDPcAIXHuWeW5rDP0R1VyPBOcpYT980A57iP3Dv1WBPTKAVsAP
	D32NcsVo40boH4Qhoxvlbj+bALK8DqlwTeWzuoHnRd6byVo9VKjY951gh98Esl4WuXLtvkIlShZ
	0W4mcFvZ76dex95qQnpynHChKjkVmb5seCk9s/3Ic73+twcAaEM+4VdZIUsT+WeVz+mhJqtshFz
	pHxchgHQv8UKT2TcJs8bG9qjWKDgeqZH2VSX7Z1xz2bBCoy7xV7h5vlSHa+KBNkB+MUGPQvOgKJ
	7uz+1wTfZjCMAq6j2H2Gqf0NYEN1CFdzk0LUyYYnygnZq0cnv2PTpmGnO1YAUtTgu1W6X2giNUC
	Qd1C8YwMuZKkfJRnXjlU0Mr6cCnEAbHYUUQVXnWuJescsov/8cB6zHRMmeS2W+r4RCYR+lulWks
	aZwtx01DlC6EPKmdYw2aSi9n3pWeeK6vzkoJULhd7L6GyXw==
X-Received: by 2002:a05:600c:530f:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb887e220emr216644145e9.2.1795425650233;
        Mon, 23 Nov 2026 01:20:50 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:49 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/3] Describe the Amlogic S7 clock controllers
Date: Mon, 23 Nov 2026 10:20:44 +0100
Message-Id: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WNQQ7CIBQFr9KwlqSA0NKrGBfw+ShqbQVqTEzvL
 rVNXLic5L2ZN0kYAybSVW8S8RlSGO4F2K4icDb3E9LgChNec8Vq3tJpTDmi6WlqKNyu1GXqpeV
 yryRqBFKOY0QfXl/p4bhymuwFIS+mbRHxMZVaXme/WFdtKfWXEt6i8kIoyV335IvImoQUhr4Pu
 avaujFiD14zYE4zzy1aAQbQazRGt9ZJ5VjDyXGeP4a31iD5AAAA
X-Change-ID: 20261028-upstream-s7-clk-dt-f5b25465e9ec
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The S7 clocks come from the firmware, over SCMI, and from the PLL and
peripherals clock controllers. Add the SCMI node and the two clock
controllers to the S7 device tree.

This series depends on the S7 clock controllers series [1], which adds
the bindings and clock IDs used here. Jerome applied it to clk-amlogic.

[1] https://lore.kernel.org/all/20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com/

---
Carlo Caione (3):
      arm64: dts: amlogic: s7: add the SCMI firmware node
      arm64: dts: amlogic: s7: add the PLL clock controller
      arm64: dts: amlogic: s7: add the peripherals clock controller

 arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h | 27 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi       | 80 +++++++++++++++++++++++
 2 files changed, 107 insertions(+)
---
base-commit: 807a34cf91c1d91f2beb3cacef9eaa98bd56d172
change-id: 20261028-upstream-s7-clk-dt-f5b25465e9ec
prerequisite-change-id: 20261026-upstream-s7-clk-3fbe6f33652d:v2
prerequisite-patch-id: 9ce04eba818962dbb245b10f1709937eb8054600
prerequisite-patch-id: a02fe1ec065748194293c458aae0bd6f6e7f152d
prerequisite-patch-id: c04475f82637c268ace81e969b67c159a1b0ff4a
prerequisite-patch-id: 8b60ed5e40d0bda09cc368292cdd7cffc621fd8d
prerequisite-patch-id: 7e4acbe8258ab4bf7b5bfcaa0c7b764b011d8105
prerequisite-patch-id: b9efe5d77d21ce83acca108e1050c5ae1dfe9701

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

