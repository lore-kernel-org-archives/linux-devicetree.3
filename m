Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1393BADB2
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 12:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476447; cv=none; b=K2CnYD+hekZLaGI4j/M/ItzZ5euV7zitlA0xXXGJI9Nh3GGwDl8fB7UB+WkG5ABiygRFlA0+fZi+LuRjdHnVNzDylbP7JFOtcgST1rabmIRJgvsbmcQAwiUtHLd1pKY2mT5fTjqhRprZ26TKG4tK8jdfFQlDORICE2vt0KG1u/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476447; c=relaxed/simple;
	bh=LNFU1MBvpof7NPzxV+BS3Cv+GOldTpuNa+rgDGA9SUI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X5xJi6nzmGCsBt2s6LUXRDQb1QBLljqpybCJBJzIPRRadF23T1u3Fpk/BsWRSFd5Uk47TePUtsXL7oqD19XPoGzLRw0OnVUEAs6b3sjaHMrAohZ7Cv8F9mLk7SrQYIHo3P/+STmHEuSGNIUm44ki6f7TunDDrNDw8GGHzOkj1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqay66Jc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqay66Jc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D981F000FF;
	Tue, 15 Sep 2026 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476445;
	bh=AcF743jMb+sO2uh/JqmPECcRpmkx5/Xnhg8uC18e1iI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hqay66JcOYVuojWRYIzbr+03Iako3s9gcE43A5l+thsgwox9g1dCBi6ihzTuMYRRx
	 h/wNzG+Qgi/chxrxGnRRMLXvMy3g4UZ2zmfsVPVv1djMUIVjI83QZQ0+zza5z0rNbL
	 zPBw5EUS+VUIYwlCLbxG7npkceTpaV8NLmWlzyLeqIrWxUZaKJhE/IJhTi2ZZkKpZs
	 ktp3BWhEzJ2CmAKdbpUuGumdavGCaQTw59kXqub1VMd8JigkrRLQ4vLJYg8hCnnVzN
	 wAvtNhhkuEu6rxYwKieHF10JkOp7gLmoZmO+GVN4EDZFLrP8jsnLiYPT9nGM6ctbqO
	 yXCspdZD41z6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI
 DSI to HDMI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: mohit.dsor@oss.qualcomm.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260915-lt9611c-v7-v15-2-88f9e9387eab@oss.qualcomm.com>
References: <20260915-lt9611c-v7-v15-0-88f9e9387eab@oss.qualcomm.com>
 <20260915-lt9611c-v7-v15-2-88f9e9387eab@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:47:24 +0000
Message-Id: <20260915124725.11D981F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/bridge: lt9611c: incorrect interrupt clear logic toggles unhan=
dled bits
- [Medium] drm/bridge: lt9611c: missing delay after reset deassertion on su=
spend error path
--

commit 1c8b096eca4758947d0ce62950c84436cc31f839
Author: Sunyun Yang <syyang@lontium.com>

drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

This commit introduces the driver for the Lontium LT9611C(EX/UXD) DSI to
HDMI bridge, supporting conversion of single or dual MIPI DSI to HDMI.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/b=
ridge/lontium-lt9611c.c
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
[ ... ]
> @@ -758,26 +758,26 @@ static irqreturn_t lt9611c_irq_thread_handler(int i=
rq, void *dev_id)
>  	if (!(irq_status & BIT(0)))
>  		return IRQ_NONE;
> =20
>  	/* Clear interrupt: hardware requires two writes with delay */
>  	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
>  	usleep_range(10000, 12000);
>  	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));

[Severity: High]
Can this second write unintentionally clear or toggle other pending
interrupts?

When clearing BIT(0), writing irq_status & (~BIT(0)) to the register
asserts the mask for any other bits that were active in irq_status
during the read. This might leave them in a partially toggled state or
inadvertently clear them without handling their events, potentially
dropping important hardware interrupts like HPD or EDID status.

> =20
>  	schedule_work(&lt9611c->work);
> =20
>  	return IRQ_HANDLED;
>  }
[ ... ]
> @@ -1193,17 +1193,17 @@ static int lt9611c_bridge_suspend(struct device *=
dev)
>  	disable_irq(lt9611c->client->irq);
>  	cancel_work_sync(&lt9611c->work);
> =20
>  	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> =20
>  	ret =3D regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->=
supplies);
>  	if (ret) {
>  		dev_err(lt9611c->dev, "regulator bulk disable failed.\n");
>  		gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
>  		enable_irq(lt9611c->client->irq);
>  		return ret;
>  	}

[Severity: Medium]
Is a delay required here before re-enabling the interrupt?

In lt9611c_reset(), the driver uses a 400ms msleep after deasserting the
reset GPIO. Re-enabling the IRQ immediately on this suspend error recovery
path might interact with an uninitialized MCU, which could trigger I2C
timeouts or IRQ storms while the system resumes.

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-lt9611c-v7=
-v15-0-88f9e9387eab@oss.qualcomm.com?part=3D2
