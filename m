Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795329417;
	b=4fqLKO02HKx0fhQHqhAjT4gqVNRELjPDK67UlkN37RTFNdqQ0Jw/5tqum2fnGYlmd8oI
	 Bi/EzUfq7n6M3Z6B246chYJ9cGAhf0w83wU+wbJbc3UistrwqXc0A31Du4xqi9EaNJQ/I
	 POzZgOOfhTpYRN3lI4ha78uLGdKsUf0qm0vwOZc3BH9Mw5gzGA37gvuPod0qx87go0z1j
	 ObU438QEcI0KtmXhKRgJzsuK92qQDKTlyobhqOqRTc6WcZPJT760SzL+w1Zgoceq37UKj
	 4cSIx4fiQ3yICvrjYlrZRpRImjqKtM1jvAHSer0PcTQ9tfRtrFccUg96GYF22RkXW9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329417;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=rcnHT8Ouj9aPKLbMZKYqkaRR8q6iYAvPvYte5WZ6Dpg=;
	b=dc411mkKjmbIYm7A6EDSQAYGLv0oYzg5Ft1Jt/vVeKjQKeffUkZs0qouKO/1fZQvxMGC
	 AJhonjDdKVkdoxnu1V+D6h9WQcHvEYFhkwY1rw4MpwjX0dvNADfdLUleSHeoW48ATpWas
	 g3ZKeKDUOaESrgMF9svQRh22Rns+nuCIkvCgFhnH5T4gxKJFKWDR+yK9l6cBY2OSlNK2z
	 C+5F9QpD4yOUzxFt75Na4RICHYnZWYrQUXSDc7L1c5dfCI91kUXq6mwdX2d//8x48UhSc
	 co/NK8hu1wEsc1qaO2NvqUM9SCgRUGRsIYMi2diBGk4XKwLRXv8Y7dYUHFbOdo5AxoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68504606A32A;
	Sun, 22 Nov 2026 06:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68504606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
	by APP-03 (Coremail) with SMTP id rQCowADX4JFJjQJrB7yNAQ--.19133S2;
	Sun, 22 Nov 2026 14:35:55 +0800 (CST)
Message-ID: <06e509d9cbfa06179cf5327ff533ae7212e23985.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 06/19] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss	 <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli	
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
 <hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>, Paul
 Walmsley <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
 Belhachemi	 <db@domibel.de>, Andy Yan <andyshrk@163.com>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Yakir Yang
 <kuankuan.y@gmail.com>, Dmitry Baryshkov	
 <dmitry.baryshkov@oss.qualcomm.com>, Conor Dooley <conor@kernel.org>, 
 William Qiu <william.qiu@starfivetech.com>, Xingyu Wu
 <xingyu.wu@starfivetech.com>, Sandy Huang	 <hjc@rock-chips.com>, Manivannan
 Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
 Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
 <maud_spierings@murena.io>, Graham Markall	 <hello@big-grey.co.uk>, Chaoyi
 Chen <chaoyi.chen@rock-chips.com>, Joshua Peisach <jpeisach@ubuntu.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sun, 22 Nov 2026 14:35:53 +0800
In-Reply-To: <20261106-jh7110-clean-send-v7-6-68f7ea9913db@samsung.com>
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
		<CGME20261106135900eucas1p17159021cc747335b62cad6b3326605be@eucas1p1.samsung.com>
	 <20261106-jh7110-clean-send-v7-6-68f7ea9913db@samsung.com>
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
X-CM-TRANSID:rQCowADX4JFJjQJrB7yNAQ--.19133S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFW7try5Zw1rGr17GrWDXFb_yoWkWwb_ua
	yxC3WUAFs8JryFga1jkrn7KF1Fqa12yw4rC3Z8tF1rG348CrZ0gF93Jw1Yyw1UZr4I9r15
	Crs3WryqgFsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxU-eHqUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-06=E4=BA=94=E7=9A=84 14:58 +0100=EF=BC=8CMichal Wilczynsk=
i=E5=86=99=E9=81=93=EF=BC=9A
> The JH7110 embeds a DC8200. The binding requires an SoC specific
> compatible ahead of the generic one, so add the JH7110 to the enum.
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Applied this patch to drm-misc-next.

Thanks,
Icenowy

> ---
>  Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yam=
l b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> index 919a9001220120054cb62d1d01b7293367266f95..05a202633cd273fec358c095c=
64584d959d96d90 100644
> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> @@ -16,6 +16,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - starfive,jh7110-dc8200
>            - thead,th1520-dc8200
>        - const: verisilicon,dc # DC IPs have discoverable ID/revision reg=
isters
> =20

