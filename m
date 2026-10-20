Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522490;
	b=hgYMnppzaEnMoQDwQ5x/O7zeIO/OJnYVxMDx0hqGx+pzq+u35fPJN8bdpNHaSShIbjlu
	 8tTtpkjCLdMFQfxuGIkwUvCNcwfhRmf0TfFDqjOJ2zyZjDhq4EbYrk4iw2hSL4X53MSPa
	 HOMUo4wLXhhJLOae+Lf5LmKCCC5V/1253rU5OATUsFgeUtVkWyWES/FmpsizT5Dw4jhO1
	 8TJNCtNadMjRM5rB4THfCsv4Q40h5tGZo8BTPzICbSrJs21rzvAD0TXN9EqphGcQjalwg
	 JqV4W6UIyneMGJ4Te74gZLU5ewuR/09sZkPjv1KQVBjShJjfd0MCyt18H3cDltEkiqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
	b=2Q4A/h0fgPtZUKILvnCiC45GY4UYIALdPInKybLNQu/sMlkc0Ow0y1AJiSL80o2O62iS
	 1IAa738fbZas6Xad98M9N91M6Mt6dfX2QgA14uBJH0lmSOe6Z0F9dV1S0WAOtBtfTblpa
	 PyK9yZJ83f1PllLtxVoSetNcs7sc4UiuwtP6YohG/0fBX1FkouLD55RHO/z4+ddi8kEzk
	 Z7+43KLqSAvLJzcNrEXow1qO3pX/k5tbksUfW57kBexUG+5jJLw1c94w6Kt5BRqqX7YuW
	 scptXFm0R1v0kA2zNTEzQH+JVBdxVd4p5Gc9h91HGV9RW74qmjVcIYq62D7Ru8FPzPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cNpSjyVD;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F84606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 18:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F84606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cNpSjyVD
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36681e85e87so1419642eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792522488; x=1793127288; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
        b=cNpSjyVDxeZMqcqxOqB9EKCdiKtPdvBLoG6NwPB2ME90BEBUSoASCok3BTJCWRzmch
         pNWcgsLpP4PYDmJr8a0L4mKvc7JsdLL2H7n7kPI2wZkDtIaq0W1rRg/MY6hUM/gy5Uoy
         W+m7CWwruUbFTIYyqnOJmBOL0w946NXdRSpxe6jaOK0BT0sCvBvGsnj6H5fBmWcWNvLZ
         msrgSrE2dYQ/4jED9CbuOpHR4ZW8ZY384J9TEKtFsWkaRluoI3p5WBWwaKkqlP4+GRbQ
         U4HwE9gc512DhP6yTqnRZIiJQwgX36aA+yBDDi2k7JIy8yC1YZIs0MXwbGp1hJ1veg6G
         SECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522488; x=1793127288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
        b=orJn7434W7paAmVSgxRtitbUbSwMz1aXYjepIIWxxrzeFzyrqCHRvxF7g4mvc5i4BP
         v/joKx7/lWKvociy/UZvaZOE9jfyfvRmi4S687V37NKONNkS7A24vCDTGTA6+yET2Eue
         U1gXlTVPfINJ65oxsQXTkEJtOI+l31p6STjCG1o7KzGXSBpje1z/Y0HStnKpiIRg5Xjz
         ighUD3gUo+dieagf3v5+Gwe9c3cZkRMetVxAKEb6W+vk6rSsj9sFBe6uezbD8fyzFNSb
         RPGx6kGD6AFjDwQjVldNj1tNnkUsGDAgn0b4NuOGeo1/N8kRJxpr9rcD3cdUE57A3/3t
         kDjw==
X-Forwarded-Encrypted: i=1; AKwUvBxptzK8J5JFTyn6CjOVFko1YCYpElXF26Wt+bbIJzhlT7iNiWheEOpPfP1tZngMTSjMpDi/n+7IdNDC@vger.kernel.org
X-Gm-Message-State: AFq9FYLqf8CswUaTTatYhqeecOA14woZN83JCSzeXjUW7lKiPCdua694
	yOpZAD89oxMcqZ+6SO2EvUlDpJJV4NQRF9Vc8+lRMiQLCLBIEQtSGxgU
X-Gm-Gg: AYBFou1UDZW8te2X+Oocufj87a3OCwE4fbltT+BXJ9Rz1F3EParw0wCz/ST8USlCJhV
	YZLgD3Prn1aOMrPQ7G661wXj+p3+DDZu6QA1MSvF9q8Jm3vc7fflARbMqkbGKECxDaoeL4WdqH0
	ePkWLIDb4phmeLQYofhq1q+R+H8ypGQNDa7WzWdjVGkiK8deNBGctF+KV2SQfGPWa2op4tsXnuq
	LZOoHXjh8YjjhFkNeYPSjakWRR8uyodq4VkhDKOXu9aazURmkGmAidhB770qKP/OmAcumaxWypC
	eamQjv8mn75VB7sNrW4MyAFRJ/TltMpq9XNajnDzgb0inRxtOlTTS+MWscgFLkbOkap2+ZePrgr
	L+zGwYeptnKJZ29UCZXRJk+Ivc0Ww7XnTCnHiMKU/CU21yROLIrxRBBK9lwHLClZ14tmFhjXqZK
	LiHY8FwV1aHbPzmBLu/84Z0CHtwMILwwnkAW+XvKriiWCgo7hXkEzBpqvuj8x2zvn/o9aNqXr0h
	2hMAtvcOBdIADa9+zvacfWOSx+ff35WzSA+D4kU
X-Received: by 2002:a05:693c:6382:10b0:35c:de00:93d3 with SMTP id 5a478bee46e88-3674f6143a2mr134088eec.40.1792522488031;
        Tue, 20 Oct 2026 11:54:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm606896eec.5.2026.10.20.11.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:54:47 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:54:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
Message-ID: <ate3WJz8gg9LUG9u@google.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-5-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019100406.103687-5-clamor95@gmail.com>

On Mon, Oct 19, 2026 at 01:04:03PM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Only Dock keyboard input events are tracked for AltGr pressing.
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> +
> +static void asus_ec_keys_setup_keymap(struct asus_ec_keys_data *priv)
> +{
> +	struct input_dev *dev = priv->xidev;
> +	unsigned int i;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(priv->keymap) < ARRAY_SIZE(asus_ec_dock_ext_keys));
> +
> +	dev->keycode = priv->keymap;
> +	dev->keycodesize = sizeof(*priv->keymap);
> +	dev->keycodemax = ARRAY_SIZE(priv->keymap);
> +
> +	input_set_capability(dev, EV_MSC, MSC_SCAN);
> +	input_set_capability(dev, EV_KEY, KEY_UNKNOWN);
> +
> +	for (i = 0; i < ARRAY_SIZE(asus_ec_dock_ext_keys); i++) {
> +		unsigned int code = asus_ec_dock_ext_keys[i];
> +
> +		if (!code)
> +			continue;

Nit: this check is not needed, input core will remove KEY_RESERVED (0)
from the keybit when device is registered.

> +
> +		__set_bit(code, dev->keybit);
> +		priv->keymap[i] = code;
> +	}
> +}
> +
> +static int asus_ec_keys_probe(struct platform_device *pdev)
> +{
> +	struct i2c_client *parent = to_i2c_client(pdev->dev.parent);
> +	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev = &pdev->dev;
> +	struct asus_ec_keys_data *priv;
> +	int error;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->ec = ec;
> +
> +	priv->xidev = devm_input_allocate_device(dev);
> +	if (!priv->xidev)
> +		return -ENOMEM;
> +
> +	priv->xidev->name = devm_kasprintf(dev, GFP_KERNEL, "%s Keyboard Ext",
> +					   ec->model);
> +	priv->xidev->phys = devm_kasprintf(dev, GFP_KERNEL, "i2c-%u-%04x",
> +					   i2c_adapter_id(parent->adapter),
> +					   parent->addr);
> +
> +	if (!priv->xidev->name || !priv->xidev->phys)
> +		return -ENOMEM;
> +
> +	asus_ec_keys_setup_keymap(priv);
> +
> +	error = input_register_device(priv->xidev);
> +	if (error)
> +		return dev_err_probe(dev, error,
> +				     "failed to register extension keys\n");
> +
> +	priv->nb.notifier_call = asus_ec_keys_notify;
> +
> +	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
> +	if (error)
> +		return error;
> +
> +	ec->ext_keys_enabled = true;

I think this block (after input_register_device()) can go into open()
method for the input device.

> +
> +	return 0;
> +}
> +
> +static void asus_ec_keys_remove(struct platform_device *pdev)
> +{
> +	struct asus_ec_keys_data *priv = platform_get_drvdata(pdev);
> +	struct asusec_core *ec = priv->ec;
> +
> +	ec->ext_keys_enabled = false;
> +	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);

And this into close().

Thanks.

-- 
Dmitry
