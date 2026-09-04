Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F3437F72E
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 02:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488088; cv=pass; b=Ml6LS1X/CY8vo6+ZuOJGMhHtKbhgoNNl7h2AUmWk91cNmL4fwNJ5IAbyqx1ChFSCHJOVxVKQjWo89mcAURgbMlB8ZSN1XOBhZ5ZkAPVQZbeQVOJcGAO1T2dZ80k7MrHWVBXKjMrUvC19DvN+aY148MuY8msx6+e0LxE4/86d38s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488088; c=relaxed/simple;
	bh=Pzqdbi3RRHpe0N553BflvowJSQBmzpYfCdEfpxpl/D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSltgFtEXY1IzfmgXYw4GHfp5/wsOEIvjfvIaiZBYJKQtACQNxeUJNbu/VRhA/xswlKjeL0TZMiiG7rT5vtjOcDL54zES2vWnbwdS9U8DeFm5QKxTVxJbarWISrwOFnwlX9q2ThzL46i27l25+fmZmphvVEap7AxxWAaxjrSVO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClmNP4yT; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClmNP4yT"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so693537a12.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 19:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788488085; cv=none;
        d=google.com; s=arc-20260327;
        b=bq7eppHt8J5GwCcOtzSd3LKaDb0iQb+zJRuXZuY5iEIQNpu/HlfRTvqsHCpm0p36TY
         Q4LTijQLGcBPtXs8yPQJbpzATmvcK+99rE8Gvub8DMkRNnLVr+xo+lPwjpgBhLa5w3Ie
         FQDLOu9DmfTZN6fv3YCP/RAm2wOG2Vd3OMO5nt/XdY70OQ15Z1IOE/pViVy+uatlib8D
         kfFdGU3oPfH5hKS0WiSqK4VcEYVY40IF5EVk3EOeh53lyHU7pUN2KLaYTq+smnmXYvV1
         W7xYwYWjZecxIcHzGgkgCL0hHjh02xx9EyYimDPqlj8q551Cwd/pv7spkVZ61eJPT1Ec
         GkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uqa1DV0xpH1IjJX1eyvqKAnrnqlF+OorXYNgzbrOl8=;
        fh=7QPukzynYzqqSQvtxlQg1Ey5bXBLJhfEjsukx7vWtiM=;
        b=N9pOJPrI9fbPrOfoiFwFxYh+VyXvQd0hkJdJppFdKeSs/d4s2u15qiYR5UgumMK01s
         liRXVEGzn8jEsV3X0x6f/sFOXV910fBsbjoEKXWWrRliXeDJ94pZ+7tQzimHA5S9s5TC
         RtSyAQoBlRYa3640E/AHIOVRX8p9Tq/fedvfaQMloSEEkZWRWDLSECEgL2pVlwCn/fO2
         GPSMUUNU1BnWJymOjDzH6VzRHei209/oAT7wUQ7V395O47zWOgAiIBLxaDu7At7zMyxn
         SYjRYUvD1GuffD+hStitgiQsphm7hYSAvzss1NfpI5uAc4t7ata6U9FFxYlqmIDLNG+s
         4kHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788488085; x=1789092885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uqa1DV0xpH1IjJX1eyvqKAnrnqlF+OorXYNgzbrOl8=;
        b=ClmNP4yTrAiKAXJupYPx4gseGkSuVeT+z9K0V+2vEfdSiPwsHGFgzuYBSKj68Uq3Qt
         NY2dfv7Lndc1hsol3NVhHgxnspOXfj+F5+S9Yd00CPCRvGtmOmcfOgCHRlM8ZBoXmtvO
         f1Tmi6EnW6b0zJc0dG1/lViKd+vbpxlCLcwSGd75zlEUEWy1eHlUyGWhOCeHEY1oml56
         EM9bvboqIGBfHXxZqqL5F4Ik2ELK+3f0czGb8OPkFkArjvFN6js71DSZThfdvG0NVHu0
         fejCNIUqs5vU6vMN12yJZucWIcCizYFKWK/xGn1sOlc+ZW90wHOGQ+np/4O9zBmmo6HU
         CR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488085; x=1789092885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uqa1DV0xpH1IjJX1eyvqKAnrnqlF+OorXYNgzbrOl8=;
        b=QTUkbrud1S/QwkCP/Q1MIoqU288QWAauTWourtJ/dNxtWWj8gHXeoFs+6UyR0+meqn
         CUqWaMjuUq66QvvUnEPqPsn9SPbA7qCob0FyRhWmH1adkIR39yIYKMDY7hoCdLrUeDKl
         Zxct7F6s4N7OeE3J7IifWhEYVuJyo7stY7QFDFX4RIdeKDJ7OUB+sTpExTW9DxR6GSG7
         YgHc55iH1s8fW/3vvzjwTgbGjMJ9eQL4fXYKlKc/weLZZ0ibtHCSe1DuZ4SSGw0M+otu
         8qz/dcIc/Vu95xLRtowg9Ps2/pDhw4ngHz7h0xqFBvbHGKZgOdBR5UYaFlkgEuZM7sQi
         jJmw==
X-Forwarded-Encrypted: i=1; AKwUvBxmrUDca0/mDm3p98Mm4c+/7ybYj55lGnawaG3rYCBX4+/pqYhsy4mgdJrEok6xVvI2QaCtqXfOfJBo@vger.kernel.org
X-Gm-Message-State: AFuF++mMDffknxff42SMDuGS+rNlT2J0Kv0WL0ml2EBWkJrf1onqlMdV
	dRYI2fJdXPplUgVnICNRIbA2gJP58sk9QRgcEro4PRrcbXp0QEGq7O6YosWnHTPisRyChMFlQLl
	Ul8mUpoAW5wZYxKVdB7i2N1JuXOvY0iA=
X-Gm-Gg: AYBFou0eXsrMpsOH7p1Cy1y+M4d/zQNkTUtuHkHPiSfZZOaCGZ136sdnTlb2LJkNQu5
	X0j64MWN7VGDqrYuLvhSvKCPxCgldO1qvkA2pQKYBAYUj+af+rdy8J0pRgCKhqN4vtYLBfJi2iD
	cn/9oXf/3e3sasXjg2hD821GhZ2jWEJRoIThWwyQ7Z19SyQwkgrmbxbG0imnbfuZcqUa78RRQQn
	2qGQoZ7gE3lxRHjBgfzoB1xzxWOBr0T/bBnmPCDfNth5mN/gwpkFWgc8FDh7oyhCOPKpjoTlC79
	ASKrVquxD1Ke/KKKQ6jY5ItHEklhT+629c9gNRThDo43xQ==
X-Received: by 2002:a17:907:7b88:b0:c25:88e2:fe25 with SMTP id
 a640c23a62f3a-c260c8dbb76mr156120766b.7.1788488084563; Thu, 03 Sep 2026
 19:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785829933.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1785829933.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 4 Sep 2026 10:14:31 +0800
X-Gm-Features: AcwNN1UTRYLjNgbLbTslfZ_vzrwWXhv-Ow5jOs1gk9GCuNsbLMOBe9sFATKRyzQ
Message-ID: <CAMpQs4KWvDg6nnpNS4t0jCkrHVc7RniLkr61BznxdNzZy=EmFw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] thermal: loongson2: Add support for
 Loongson-2K0300 SoC
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, zhanghongchen <zhanghongchen@loongson.cn>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi:

On Tue, Aug 4, 2026 at 8:41=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> This patch series adds thermal zone support for the Loongson-2K0300 SoC.
>
> The Loongson-2K0300's thermal sensor is generally compatible with the
> existing Loongson-2K series, but it features several key differences:
> 1. It has an independent CPU ID register for reading chip version
> information.
> 2. The raw temperature output field has been extended from 8 bits to 11
> bits.
> 3. The temperature calculation formula has been updated to incorporate a
> correction factor based on the version information.
>
> To ensure robustness on older hardware revisions, a fallback mechanism
> is included: if the calculated temperature falls outside the valid range
> (-55 TO 125),  the driver falls back to a simpler calculation and prints
> a warning.
>
> The patches have been validated on the Loongson-2K0300 development board.
>
> Thanks.
> Binbin
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> V4:
>  - Rebase on linux-mfd/for-mfd-next;
> Patch (3/5):
>  - Remove the `compatible` adding to the `select` node.
>
> Link to V3:
> https://lore.kernel.org/all/cover.1785480242.git.zhoubinbin@loongson.cn/


Gentle ping.
Any comments about this patchset ?
>
> V3:
> Patch (2/5):
>  - New patch for moving thermal_ops to chip_data;
> Patch (3/5):
>  - Correct spelling errors;
> Patch (4/5):
>  - Add Acked-by from Conor, thanks;
> Patch (5/5):
>  - Keep loongson2_thermal_data->chip_data as const, and use
>    data->flags as the private data.
>  - Renmae LOONGSON2_THSENS_OUT_10B_MASK ->
>    LOONGSON2_THSENS_OUT_11B_MASK;
>
> Link to V2:
> https://lore.kernel.org/all/cover.1784619512.git.zhoubinbin@loongson.cn/
>
> V2:
> Patch (1/4):
>  - New patch form Sashiko;
> Patch (2/4):
>  - New patch for adding chipid syscon compatible;
> Patch (3/4):
>  - Use `loongson,chipid` phandle replace reg property;
> Patch (3/4):
>  - Refact `calib_offset` calculate routing;
>  - Add LS2K0300_OLD_FUSE_FLAG flag.
>
> Link to V1:
> https://lore.kernel.org/all/cover.1783670011.git.zhoubinbin@loongson.cn/
>
> Binbin Zhou (5):
>   thermal/drivers/loongson2: Correct thermal sensor registration loop
>   thermal/drivers/loongson2: Move thermal_ops to chip_data for SoC
>     scalability
>   dt-bindings: mfd: syscon: Allow syscon compatible for Loongson-2K0300
>     chip id
>   dt-bindings: thermal: loongson,ls2k-thermal: Add compatible for
>     Loongson-2K0300
>   thermal/drivers/loongson2: Add support for Loongson-2K0300
>
>  .../devicetree/bindings/mfd/syscon.yaml       |   1 +
>  .../thermal/loongson,ls2k-thermal.yaml        |  73 +++++++++---
>  drivers/thermal/loongson2_thermal.c           | 110 ++++++++++++++++--
>  3 files changed, 156 insertions(+), 28 deletions(-)
>
>
> base-commit: b1eb3de64d02cec71b419b9918d1697797fa156d
> --
> 2.52.0
>

--=20
Thanks.
Binbin
