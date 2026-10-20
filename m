Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523051;
	b=IEqf4pf2kXVDfTLntyN7YXQC9o+H3SIgJKIH2jG1mY8zGyJssyawL4PueceSnmOQBTbJ
	 eG9xz653p0TwUIhYT/wYUgx3pX4asAGrOoMefJ1EFo1kmWTvxSaXlAAlZTaKsUDA3DV4h
	 ntTJUNbFl6Y1yssTsHq2m3mPMHntK7q2DB7+B3LjdZUJUReLzoPwfEVFzi95003nwiVxW
	 qoYHAAhEPWGo95ttoK4cRKKZWFfjjtiEGcwwD4DfivFQS8z791TkE7QZjq6ZCCHVp7ETp
	 DGJs59FRyrdRnO6Dpwi+LxJcBtIC99eliU7wEcuJUpgJBQj1XICcRfe4GNoNnSUauPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
	b=g1nbRqK52KS5hRmcQuYPjb5vGCoLpVABI+JJhEa4HKsm8ZLt9EOi/d74sNic+b9pKYBw
	 iZivInlCtKlqoCLiVO16siGFHihtNkXFwvASl4fjJdurlLSpDyI2iXncE74r33nqcYeMr
	 geU4+JxnppWuyEFtXzJFHSM6uNM3jJKO4+JmDc1E9IER+yCKVJl0St9HSc+uNZkksc7xR
	 ruqLDs7O5RygwCws4sWu/mUYt4naZ06IiCXaZls8gKinzvFfkTF9wcxqxyRbGjeaED5Qm
	 99F1TtRCkQj1XH4Sb1nmj2ughXHxlI7X36snWqpIUMT/oOPfwIyidhlWiW1/h9jdhDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLr4Pt+J;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B48606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 19:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B48606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hLr4Pt+J
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so4511499c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523050; x=1793127850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
        b=hLr4Pt+JNnJwfVdSIiwSzVwN2M1EdektMGoj8qGvTIg2MHi43g6P3LOjqDktLIrXJc
         /LbjGbnm0fv1Cio5pJKxGcmBKzdvQ1Bf8jSuV8V5JJip79CY3ECKV2x7PotCCn1kvzCQ
         4YaZ8G9IpdE+7Ow3oYO6+adNmYfrSPrPRZiHksLbJk7N1fryAL33UOp5jSq6Nup2ngpH
         wOl0+Aik0n+dpNKqrXJHKnb8BU2rkXjhhP8rhu7nQdn7ktiO6XlCo5a1Jmr294bKdHsr
         TPkfN5DqX8YEfDV0yTlKP0LpctSqRfqyj58P+bLiOitnTlcAmXRX4sdFHQMGgmS5yS9g
         opWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523050; x=1793127850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
        b=aiMHRur60792UWRdfo3RP4AB+TUfY3Xn0c1cuBt2OSd4XooPJFw8a2h7pRppZUamxE
         +ANxxf48nKcoGNiJODdp78CpWxbx/RHs/yaeA90pAxSFWe5cJcrymAOZLq4PETDcxt/k
         bwb2HuMC53FU9Aqq+ZwNRDuGBEyQMkWqxq5J3/luxr84xMbgcG8X+vuiEhckQ29Tn7mR
         iCwDxIouUIVqkhhjBw1Vndfv5XxmJqOZgtBNCxvYNJvsF1/cqJofzJuu3JyzsPtcS7Km
         dbBYEzQWKFXWTsdXImyV5wwoJLPixeTDfUyEdCgd9jzPHCLFGUeS/tC/TvPAYwHxDJQo
         vicA==
X-Forwarded-Encrypted: i=1; AKwUvBzZTnkylJwR+J94yedFNdUcrCQatfbLbRQugGmmqQFZKPORQH9Wod7smw6U0v4/7jbiynEVnhxLDO1A@vger.kernel.org
X-Gm-Message-State: AFq9FYJo0+B1KZQsiMly1GYeKzjRy1En0a2LbHgPvtexehT/xbt7tUdC
	/vuAqjl+DpHPh+0xC7mInK0zEaHXSjLb4ViBVr8tOBwnPbQL9tF92xsA
X-Gm-Gg: AYBFou3f6Eo43Hb9nHJiD8EuRJcVEk5H2RFJGsAxURqJCT0v/5RbJgBQy/ZvGAcnNEU
	TQYTOHv//f2T9UMfDCz567vIu3a7xIUGURroVQfzX173QrvTSX4BORGDG8zEcw9VSW2DbkYZKiR
	r2iK4PmuUJp/A1jQJqtEiWlPQ3NUq8aadq8Cnh7qv092lLHVbRxzTkImCII+jItOM1VCdeqOp64
	jM2iNUq9VkDTgOK0CpLOIrrKMh8VA196M95ztXSYoaHsfyySaYEt6JORDxxSajZ/tSr2jI44cFZ
	Fpn0IjWvhg8wJdkmOJUnABUUhCPxpMma5WY+xGf1AbkAgkxsxTmAx289hRDdtbGNRB98/i1SbrO
	u6EPMUzYQ1eiUn6pWOYGvBWMG84q6gBdg2WuBvf+CqGBu5W0X41BTAgob8BjmzLjljYkBew/MIK
	aaWyWbudHCps5v9WOjhKQm/Spa3kyqb5Cs4/g3caPPwiXk2zioZUEL4rp57lx8Z3mqHEljE3e/U
	DTKcTYC19mYesyNqjHJEjaO989E6dzAJk6gQ8FkrQzpE/m5LMY=
X-Received: by 2002:a05:7022:e804:b0:13b:3132:6e99 with SMTP id a92af1059eb24-18512c38164mr17695167c88.20.1792523049985;
        Tue, 20 Oct 2026 12:04:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aefe90asm552320c88.9.2026.10.20.12.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:04:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
Message-ID: <ate5K6ZdrSoBUI08@google.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-4-clamor95@gmail.com>
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
In-Reply-To: <20261019100406.103687-4-clamor95@gmail.com>

On Mon, Oct 19, 2026 at 01:04:02PM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add input driver for ASUS Transformer dock keyboard and touchpad.
> 
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> +static int asus_ec_kbc_probe(struct platform_device *pdev)
> +{
> +	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
> +	struct asus_ec_kbc_data *priv;
> +	int error;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->ec = ec;
> +	priv->parent = to_i2c_client(pdev->dev.parent);
> +
> +	error = asus_ec_register_serio(pdev, 0, "Keyboard", 0);
> +	if (error)
> +		return error;
> +
> +	error = asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_AUX_SEND);
> +	if (error)
> +		return error;
> +
> +	priv->nb.notifier_call = asus_ec_kbc_notify;
> +
> +	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
> +	if (error)
> +		return dev_err_probe(&pdev->dev, error,
> +				     "failed to register blocking notifier chain");

I think sashiko is right that we need to register the notifier first,
and in it check if serio ports are ready/registered or not. For that we
probably need a lock and set pointers or flags in serio's start()/stop()
or open()/close() methods.

This can be done as a followup I think.

Thanks.

-- 
Dmitry
