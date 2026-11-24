Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560210;
	b=SzV07yHKxazQg2RyMHDZasnT/FY3J5I5dQvSGWdS1AXGh0vWqybzMc+eCQb4NxvIlnOM
	 28S033pJNgJeRDIU4cjreIIbW/rs302462N7SzsFieJZuLz1qf1U1mGen99yWFFqR5Wwm
	 yxSNQsozFsCAxwPEJDSMGghJh5HB8PutV1v6+Z8K/LkNM+4hZGHWZQDtr3whkvl5VomIN
	 PptvSELj2Nbzn47mipJebPUS89KA46o9GiBnXpnXVQNBAOnLgxSjthiRKmX/rSTUbdOp/
	 an2f2BQ6wsUqYK80tmczdsYyl8NqxdDW3+lUrkFkA2y+Yv0zbsOh8ZsB2rouzGZzjRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=;
	b=AeRbZ1rKCN39PIxMFhWc/GUNjR8yME0jIwhdSxM3I7Cy22LdPSUEryvR8qr3yGvGJEXg
	 2QVNxd1M7UIY0CkPSeMQ4lTUdk6mD0OvvJAvqmrVQxJGxQZtFE63bvk5AFCywDZH0OQpx
	 n1JMNmUtgszwcNDB6ybWnQSDbJKaBTxaYSRdGoEOkjgIRR+DHglICzUNIZ8ZHVroX+utD
	 cQ1x1H9Mp8EWUSQ3X6TULy6GY8Rs5tqWpNyAzQRclhbIi47nJVUfl6GRGh2aQ2FOyqvFW
	 nbuLEr0g2mug6wqOvdDMxmRilwSY6CbriTpqA0N4Yid74qGf57tz56jaW7nnPkpEbWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6Y87bUf;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D958E606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D958E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6Y87bUf
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49412eb1474so3282411f8f.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560208; x=1796165008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=;
        b=m6Y87bUfvZ0KQCkyx5b+doVux65ENRQbe3y00a6qqXDpIz/zXXVYLO+bfiyn2MEAJB
         Y4Is4frgh3smtjB336R3Q+HCp2qG7TD5KxfWZfPlJYfX2lEei84e+y1ABKVg/B1nGsY0
         C+shhsVYhA6Iy63v/N8iVADN4fHNumlTUb95W6WyBUHHDui9UWOjGZgd4kkugaqzuMex
         hPNmjrpsW3isvGLb0ylhIo1UVODUXkFHRt5zl//MxlBIj9BxhWbKG83wihLEbOm3o/km
         OmQ/D/wikGQkzqcFEFoo1Y5ibNe/wgxqElzR4wpL/ajmOJlvK6dp26p8oBqkiytF1SQW
         sT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560208; x=1796165008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UeYF1YhxOBA70+hLap1314b1v8sPAVWV79jWbpYOTzM=;
        b=fgcruTRGB++QRX8P+JjqrwRhWzPRRrSRADP0iqSqWoUIRGAVTyAQcA3LzMmuMXJFaO
         cN7BXFiKs66CBGRUbstro9f7zyjzqIFBwVHuKWFW6SiHvCM032Bcpp9jr5Hw5ICaQfbl
         hnFObZHeCt5h3ZgKid+dwmIyKFX7KTS2Ki+rRCEJP1R4HM3xqpek9N35FunqyRDe3oUa
         ZDfYOnF3ryg+6gkykXzEPNZiWcdmc3ah3DwHmdvLzhojqy3f71aez+TbB9uUrEVdY9Mi
         TlxrPaei6AWEedblOsi+202DtTAxJcMPPvjokCqFIoxhQ7ijakl5vb0K3p9M5JeNI1oc
         z7fQ==
X-Forwarded-Encrypted: i=1; AL+hErEGk+Nbbvq3lg7leKNeD56xSHMdiPOom+DSM0dbYOh7nTj3c+pevH5pn0fNjyo2TIvGbvnUm0aDcn3c@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZsTRMDyzMFozlBxU2q2EvfyBgScuAqpVuPNlGEQWjdC3mwoLX
	MOgqMZuj50NX4b1BNdMV0vxOp/YZcrp2yLtZtNTrpREvc2y08AD6AuAi
X-Gm-Gg: AZFdTZdqlVOMvzPDomOeRMkS6wjSBbGCgBFT2hmUUFPVmwALWKRw6G79do7+LCsKbME
	1d8/zsmyQ8tcG80k4R/dBmofBiTYmOjAYuj7CpXCzgxHRcg6CeYgZuMW0MAPc2lW9yI/48S8OLw
	FibN2t4M/EBIeTS/nskjr7A1lqZHH+icraKaoRidcvW/Ppxg0jBaygCAHWDmLgFJC9Ykwnspe+d
	3kY4U0W2OJTBzTUC05vripIrlE8XLtLYbDYGgNkmsWwHKOxT/z9XQ0CRdesqhX1lalt9/ImMfdn
	7LuWA7S9H/X5i9JoYArLJ8d0sC8Ulq3nWRhHMfhPtw5Jzvs+848VObHJ5TbDfWlGuLP+cP65wrt
	s4cQi69pJifPdb4wMcsEo3WgzFXZeW34JIPx9PkX1i7Ypji4LyEt8bWG2CC5KEJs3WaXO0nGQ4l
	YqxQeIdd8npS9DLU0H7MMA0xW+H0pnHAnEPUE4FIc26ggWdPW3Wc1BSR/kb5xwG4HS4evdMFNJd
	nT9r7nFuuC3NFVtamPT8r+CQ2swm5c7KYgpCSD/eCO+EQN+pOcHoy22YjhSDrIOA0sCIcSXFjJA
	mQKhq0I3ttNeBK0fRuIQgAFrX8LnWbjJ/c15j0he0Z7qhFqoK85OhWxYcfOcVi36LV5ajSSnYsN
	9sb8=
X-Received: by 2002:a05:6000:2906:b0:4a3:777a:a964 with SMTP id ffacd0b85a97d-4aba58de987mr30782702f8f.0.1795560208068;
        Tue, 24 Nov 2026 14:43:28 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm30900915f8f.58.2026.11.24.14.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:43:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] phy: airoha: add support for AN7583 PCIe PHY driver
Date: Tue, 24 Nov 2026 23:43:14 +0100
Message-ID: <20261124224318.227478-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce support for Airoha AN7583 Gen3 PCIe PHY.

It's not possible to reuse the EN7581 code as the register changed between
the 2 SoC and also the setup method changed (different calibration logic)

Putting the PHY in a dedicated directory is also needed for other series
current pending that will add USB PHY support.

Also a dedicated schema is added as the register names is entirely
different compared to EN7581.

Changes v6:
- Rebase on top of phy/next
- Address suggestion by sashiko bot

Changes v5:
- Rebase on top of phy/next
- Add Review tag

Changes v4:
- Add REGMAP_MMIO to kconfig
- Better handle exit
- Add additional info on QPHY usage

Changes v3:
- Improve example for Documentation patch
- Deinit G3 PHY on QPHY error

Changes v2:
- Drop move patch (handled in different series)
- Rework to regmap implementation
- Rename files to more specific name
- Add .exit logic
- Drop QPHY in favor of external PHY handling
- Update schema with new requirement and improve example
  Link: https://lore.kernel.org/all/20260827122127.18874-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: phy: airoha: Document support for AN7583 Gen3 PCIe PHY
  phy: airoha: add support for AN7583 Gen3 PCIe PHY driver

 .../phy/airoha,an7583-pcie-gen3-phy.yaml      |  65 ++
 MAINTAINERS                                   |   8 +
 drivers/phy/airoha/Kconfig                    |  11 +
 drivers/phy/airoha/Makefile                   |   1 +
 drivers/phy/airoha/phy-an7583-pcie-regs.h     | 377 ++++++++
 drivers/phy/airoha/phy-an7583-pcie.c          | 831 ++++++++++++++++++
 6 files changed, 1293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7583-pcie-gen3-phy.yaml
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie-regs.h
 create mode 100644 drivers/phy/airoha/phy-an7583-pcie.c

-- 
2.55.0

