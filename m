Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297510;
	b=trOlA93Gaua0LLQsGPqNIE3xU4K08hvG5RT6I7IvfM5GfETTOYA/rZFRwsecQfrVXDnD
	 NiNBVNttCLYYkFworj+ad92vXpO+RbKqJhLVZtWI3rIh3WNU+62KEx/M+yQYgcMpQ8kRB
	 xQ1tihrCrb/aYYssluS64MHFTJ/ZoArWarH4gkn7p09/hrgGOOJJAT1ahvn0jzKI06Hpu
	 2l7O9AtSkltvAow8TqfAA89MxjtKJ3KxgV/b5RXyA4GqZp1mZUirXG0EVUZl5DC1t6ud+
	 IKz3NMm2JHQW6dzQR5xc3yXjsZnscTtqt5U0SVGtVe0EouhKhYRIicTaaIg0uriSbzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297510;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l5zs4K7EH5RkB4Yfo6P+5WdFANZnUAv3i8l9r84sVso=;
	b=tM+8i446gN+pwuKv9KIYq9keOPbwTAaNJjOo94OFgfc5GeqcTL+gS61sE6vk4+1wczHM
	 Y/06pcWqW2oyqCJBGwdnHIM20BmATMus7M2aMgbJFnjq5iAJmrG530j3oP6qH/9EU0S38
	 R5BAOxcH/R1hGhjebz83v/rP46Ts7ul4tcoqtQerY/PjoJzPSS1CsEYMqWm11eZ/rsjQk
	 D3yPHEAVJWwb3M+P3VeSBjNW4K5iCwV9/bpRg34xYlU2xWN5xuknnaAon6JmU7ON7DRgL
	 DxB/owN94uxWcdp2L2lwgW0AGyuMnkcIkmCtdE15NX4oa+dUtsu1yFIOqogEJ1kHGAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lKHTetBX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DAA606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lKHTetBX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB4F1F01816;
	Thu, 29 Oct 2026 18:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793297509;
	bh=l5zs4K7EH5RkB4Yfo6P+5WdFANZnUAv3i8l9r84sVso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lKHTetBX/GIjyCJIUasdGzNzHooMQDMLeqFuMcYiU06hVdS7ISv90RsLWyT3J4IbO
	 OLXLS1xMC0LFz5ScA9MSxllgx3oWkeGwnDo8ZcoGGZu85nPpVGbc3kpDNqAC0beDOj
	 LTm+W/yLzQlEKd3Vi7kORras0/7SksmV6LGT4gpY3iUsShKrFyYaUiV/0uyuxAChGz
	 sadYJy6UbTljuZZGM7GHQHyn4y3u6SXiLLGn7juqwA6tKRCr97zn7p8KxxS1YmOs5Z
	 1/SQAmvvSaC54HJqD7bBSkI75X768EOhxk6Km6WWwRF9Q1mLt4yHLrcdQ4Zrs52c3C
	 WYf5g0li5DLaA==
Message-ID: <sashiko-outbox-189770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: tiare: describe CW2017 fuel
 gauge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kupreenko Danila" <keckerz@yandex.ru>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <179329639684.489944.11313132727575469130.cw2017-first-public-rfc-3@yandex.ru>
References: <179329639684.489944.6322623410181934358.cw2017-first-public-rfc@yandex.ru>
 <179329639684.489944.11313132727575469130.cw2017-first-public-rfc-3@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 18:11:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] power: supply: cw2017: sample invalidation in cw2017_suspend() b=
reaks resume
--

commit e63b82695c67205a9de8a30516bebe6f4181c2ad
Author: Kupreenko Danila <keckerz@yandex.ru>

arm64: dts: qcom: tiare: describe CW2017 fuel gauge

This commit enables the BLSP2 I2C1 controller and adds the CellWise CW2017
fuel gauge node at address 0x63 for the Xiaomi Redmi Go (msm8917-xiaomi-tia=
re).

> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts b/arch/arm=
64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
> index fe844230030f2..6d72a4763ac48 100644
> --- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
> @@ -14,6 +14,15 @@ / {
>  	qcom,board-id =3D <0x1000b 1>;
>  };
> =20
> +&blsp2_i2c1 {
> +	status =3D "okay";
> +
> +	fuel-gauge@63 {
> +		compatible =3D "cellwise,cw2017";
> +		reg =3D <0x63>;
> +	};
> +};

[Severity: Medium]
When binding the cellwise,cw2017 node added here to the cw2017-battery driv=
er
from earlier in this series, does invalidating cw->sample.error in
cw2017_suspend() cause -ENODATA errors and spurious uevents across system
suspend and resume?

In drivers/power/supply/cw2017_battery.c, cw2017_suspend() overwrites the
cached sample state on every suspend:

drivers/power/supply/cw2017_battery.c:cw2017_suspend() {
	struct cw2017 *cw =3D dev_get_drvdata(dev);

	cancel_delayed_work_sync(&cw->work);
	mutex_lock(&cw->lock);
	cw->sample.error =3D -ENODATA;
	mutex_unlock(&cw->lock);

	return 0;
}

On resume, cw2017_resume() queues cw->work onto system_freezable_wq:

drivers/power/supply/cw2017_battery.c:cw2017_resume() {
	struct cw2017 *cw =3D dev_get_drvdata(dev);

	cw->poll_interval_ms =3D CW2017_POLL_INTERVAL_MS;
	queue_delayed_work(system_freezable_wq, &cw->work, 0);

	return 0;
}

Because cw2017_properties includes POWER_SUPPLY_PROP_TEMP and
cw->desc.no_thermal is false, devm_power_supply_register() registers a
thermal zone via psy_register_thermal() whose callback is
power_supply_read_temp().

During resume in suspend_devices_and_enter() -> dpm_resume_end(),
dpm_complete() calls thermal_pm_complete(), which queues
thermal_zone_device_resume() on the non-freezable thermal_wq before
suspend_finish() -> suspend_thaw_processes() -> thaw_workqueues() thaws
system_freezable_wq. When __thermal_zone_device_update() ->
power_supply_read_temp() -> cw2017_get_property() runs while cw->work is
still frozen or in flight, it sees cw->sample.error =3D=3D -ENODATA, causing
thermal_zone_recheck() to log a temperature check failure (-61) and enter
error-recheck polling. Similarly, any PM_POST_SUSPEND notifier or thawed
userspace process reading battery attributes before cw2017_poll() finishes
its I2C transfers receives -ENODATA.

In addition, when cw2017_poll() completes after resume:

drivers/power/supply/cw2017_battery.c:cw2017_poll() {
	mutex_lock(&cw->lock);
	changed =3D !cw->sample.error !=3D !sample.error ||
		  (!sample.error &&
		   (cw->sample.capacity !=3D sample.capacity ||
		    cw->sample.voltage_uv !=3D sample.voltage_uv ||
		    cw->sample.temp !=3D sample.temp));
	cw->sample =3D sample;
	mutex_unlock(&cw->lock);

	if (changed)
		power_supply_changed(cw->psy);
}

Because cw2017_suspend() set cw->sample.error =3D -ENODATA, the expression
!cw->sample.error !=3D !sample.error is always true when the post-resume po=
ll
succeeds, triggering an unconditional power_supply_changed() notification on
every resume even if capacity, voltage_uv, and temp have not changed.

Should cw2017_suspend() keep the last sample intact until the post-resume
poll updates it, or refresh the sample synchronously during resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179329639684.489944=
.6322623410181934358.cw2017-first-public-rfc@yandex.ru?part=3D3
