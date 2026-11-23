Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438897;
	b=ZqDxP+awoW8v6Q36RyW57OsBfeG5F9c6vt8UlAlIgUpgaKq4s9mrEgBOvqkpJxMLBzke
	 wTAH+fPKMn4D4yiHBwg7NjNvyHWKgdWF6VaRnKJWYiCfOeswteBMP/S15JMBl6aQjrglr
	 luhVhTeql3nYhVtRftZPeOKzG7obC52+NbGARgoqJ/Q3Y7a5aa5fuifFZXZyh5/SIMR0M
	 DtZxsm3/hqvhPrDqcfraEJnVYa81+4AipELYgq3MqVbJZqfA0mjuMm1Sj1ZyeZG75y/o/
	 5FKzvtNkJeNvRjOxYI6yszxVKJ0/5s0CHzvOrOdZFNzRhJ6oiBrozFMnhlKTdOEryjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438897;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=14XQKZZfi5G5+Q2IryAF0lmS9XsL+3POwzwPb7CBlk8=;
	b=FTLFpp0F0th2UwT9y24BGePe3u2SQjRzxXh/v7QrStL4KpWXWLK3d6YSGmN/lN4zvt2Y
	 Odqt+pbEY6z9ppLWawjIt/mkzTOFWuz6RgY/4FxucFzJegdOq9hoveTeV3ae28tnOvgLB
	 bavuHY7GUYtEZUbb0VEuBbNlQH88XdhYwuDaWT7+bvWynXEojoFe/ELoSF2CKNsEbhCgB
	 m37UsD3/XOxwnMBZZxTVTZOmbyZPHcYX9os6FT4A2hmr3RZXDTnyO0N83gLb/XC1xuRHS
	 5W6kZXM6vf9NnukUO5Q9MIR8TV6Bih2K3pOhtIatm3fxWksuFkmMsKHlBuea15wl23w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78D606A32C;
	Mon, 23 Nov 2026 13:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B78D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowAB3Zf8VOQRrtNSJAQ--.29336S2;
	Mon, 23 Nov 2026 21:01:11 +0800 (CST)
Message-ID: <6041ed36835d0c1c34ea590e79a2130a4352e5eb.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 0/2] phy: add support for TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Manivannan Sadhasivam	 <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Wei
 Fu <wefu@redhat.com>, Drew Fustini	 <dfustini@tenstorrent.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Han Gao
	 <rabenda.cn@gmail.com>
Date: Mon, 23 Nov 2026 21:01:09 +0800
In-Reply-To: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
References: <20261103081444.1983071-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:qwCowAB3Zf8VOQRrtNSJAQ--.29336S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF48Xr1xtr4rWr18Jw18Zrb_yoWfCrcE93
	W8urW7AayDAas5GFWUAr1xXryUtF4aqFykJF1SqFy5Zrn3AryYv348u3W3W3WDGr45GF1k
	A34rZFW8Ar9rKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF
	7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU8fpnPUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-03=E4=BA=8C=E7=9A=84 16:14 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> This patchset is split from the "Add TH1520 USB support" patchset,
> with only the PHY binding/driver part.
>=20
> Icenowy Zheng (2):
>   dt-bindings: phy: add binding for T-Head TH1520 USB PHY
>   phy: add a driver for T-Head TH1520 USB PHY

Gently ping for some review.

Thanks,
Icenowy

>=20
>  .../bindings/phy/thead,th1520-usb-phy.yaml    |  75 ++++++++
>  drivers/phy/Kconfig                           |   1 +
>  drivers/phy/Makefile                          |   1 +
>  drivers/phy/thead/Kconfig                     |  12 ++
>  drivers/phy/thead/Makefile                    |   2 +
>  drivers/phy/thead/phy-th1520-usb.c            | 179 ++++++++++++++++++
>  6 files changed, 270 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-us=
b-phy.yaml
>  create mode 100644 drivers/phy/thead/Kconfig
>  create mode 100644 drivers/phy/thead/Makefile
>  create mode 100644 drivers/phy/thead/phy-th1520-usb.c

