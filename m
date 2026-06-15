Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC9A37F01D;
	Mon, 15 Jun 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513836; cv=none; b=CgX7JDJMUtJM7T2B3f2banKe2SkFd15vcWjhQuf/Ja+mXYrQullA+JHecubZoZ2UU9g/k4db+tRSeSRt21FlXDrTzSnWht0qIgm3ipXC/R5SeO/Q8w5LiQSbc5rhuOuCBUXnd+3Yus+nMLc/UMqxHNqAaSD/fyea8euBsuXAQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513836; c=relaxed/simple;
	bh=6BgvdDWHPRU1H5UPyspACpYn39yPMM8mwxT7Ybe6RH8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ky4DZKwgAgVR50vqvvg9/vEcgCbwfMbyayfBEhI2Qur4w3w6dCm33uIb+E7UH2ZtfThFZnnlNFbFZNsfD7P/7eIErH7t088CRxskgssX/+1UCdSw6UbmMuh4TEfNDYgNABJXSNkre6/Gobs7m+ehpcrvryeKeGDwmO8talPkKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.167])
	by APP-03 (Coremail) with SMTP id rQCowADnCeFgvi9qDgfLFA--.646S2;
	Mon, 15 Jun 2026 16:57:05 +0800 (CST)
Message-ID: <62c0b8ab9b6d9f994daa8bb60b3b626688af7d5e.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 5/6] drm/verisilicon: add DCUltraLite chip identity
 to HWDB
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 15 Jun 2026 16:57:04 +0800
In-Reply-To: <20260615065003.76661-6-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
	 <20260615065003.76661-6-a0987203069@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowADnCeFgvi9qDgfLFA--.646S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1DCr1fZr15ZrWDJr4Utwb_yoW8uryxpa
	13trWqv395t3s3t3s7JrWj9Fy2kan7Ja9YqFn2kry0van8Cryjq34xGrs8uFyvgFZ7JFyS
	qF4v9FW7CF4Syr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU7veHUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-06-15=E4=B8=80=E7=9A=84 14:50 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
> Register the Nuvoton MA35D1 DCUltraLite chip identity in
> vs_chip_identities[]:
> =C2=A0 model=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0x0=C2=A0=C2=A0 (DCU=
ltraLite; Verisilicon uses 0 for this IP)
> =C2=A0 revision=C2=A0=C2=A0=C2=A0 =3D 0x5560
> =C2=A0 customer_id =3D 0x305
> =C2=A0 generation=C2=A0 =3D VSDC_GEN_DC8000
> =C2=A0 display_count =3D 1
> =C2=A0 max_cursor_size =3D 32

I suggest make this more human-readable instead of replicating the
machine-readable data of HWDB.

My proposal here:

```
The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
model number 0x0 (sic, the model name contains no number either),
revision 0x5560 and customer ID 0x305. It has a similar register map
with DC8000, only one display output and only 32x32 cursor supported.
```
>=20
> Placing this entry last makes it the gate that enables MA35D1
> hardware
> recognition only after all the supporting ops and DT binding changes
> are
> in place.

It's a little ambiguous that "last" here means whether the last in the
patchset or the last in the HWDB array, although I think it's not so
needed to explain the reason of the place in the patchset.

I propose just say `Adding it to the HWDB to enable it to be usable
with the verisilicon driver.` .

>=20
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
> index 91524d16f778..7d630a667a3f 100644
> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
> @@ -129,6 +129,16 @@ static struct vs_chip_identity
> vs_chip_identities[] =3D {
> =C2=A0		.max_cursor_size =3D 64,
> =C2=A0		.formats =3D &vs_formats_no_yuv444,
> =C2=A0	},
> +	{
> +		.model =3D 0x0,		/* DCUltraLite */
> +		.revision =3D 0x5560,
> +		.customer_id =3D 0x305,
> +
> +		.generation =3D VSDC_GEN_DC8000,
> +		.display_count =3D 1,
> +		.max_cursor_size =3D 32,
> +		.formats =3D &vs_formats_no_yuv444,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0int vs_fill_chip_identity(struct regmap *regs,

