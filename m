Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6412C3F3281;
	Thu, 23 Jul 2026 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796236; cv=none; b=Y0O5Zio0rWMiswHmcK1desHc5S6K88A4JiE4SAyW2FFLkwSfk29fq8FbtntFXFW0ue2lW3jTrvX9QwX1LBLzpmZgbvx8YcLh3AjV5twWVF3HSR+eNHlTBaRs52m03NwG1yJNbkWShHi948NCWKIKE4RODbMMuDUUj/SSZaECVgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796236; c=relaxed/simple;
	bh=MbYf/ZoeXVKzg7+gTuKuwNe9MxhBwlWpmaBjrVhd2ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnxNpWV6tYeto/OzxYrUh5RzVmeIuJSKi4ca76sJlvT7eDLUcYv5TBV4VFJXHer3Kz6jEIcLVYpCypz0TtMyK59tCXDuOS4/2QxwugSHhcQT09+h/9DosbgLEJInBxRc5Hqhgx80C7Bue9yGZVbga6yyrTF69NhH4cVCKziknmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.114])
	by APP-05 (Coremail) with SMTP id zQCowAAHOEIp1GFqdib2AA--.64522S2;
	Thu, 23 Jul 2026 16:43:22 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Fu <wefu@redhat.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 0/2] phy: add support for TH1520 USB PHY
Date: Thu, 23 Jul 2026 16:43:14 +0800
Message-ID: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHOEIp1GFqdib2AA--.64522S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy7Wry3Gr43XryDAFy7ZFb_yoW3CrgEk3
	W8urW7A3WDua4kGFWjyr1xXrWqyF42qFykJF1Fqry3Zrn7Z34Yv348uF13WF4DGr45GFn3
	J348ZF18ArnrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

This patchset is splitted from the "Add TH1520 USB support" patchset,
with only the PHY binding/driver part.

Icenowy Zheng (2):
  dt-bindings: phy: add binding for T-Head TH1520 USB PHY
  phy: add a driver for T-Head TH1520 USB PHY

 .../bindings/phy/thead,th1520-usb-phy.yaml    |  73 +++++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/thead/Kconfig                     |  11 ++
 drivers/phy/thead/Makefile                    |   2 +
 drivers/phy/thead/phy-th1520-usb.c            | 180 ++++++++++++++++++
 6 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
 create mode 100644 drivers/phy/thead/Kconfig
 create mode 100644 drivers/phy/thead/Makefile
 create mode 100644 drivers/phy/thead/phy-th1520-usb.c

-- 
2.52.0

