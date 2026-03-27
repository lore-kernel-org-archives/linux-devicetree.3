Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B300133DEC0
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607674; cv=none; b=C4bTDu8TVfILjTqF86KGHu0LWIuzG88Y4EcFf0qU//B1RJDeGX6E2/ZHq1RCBq3wGIMUb8kEN6zWWy0WdzHgsPgmkBubTHW9wLKG7v+ERAbbqRlI3DGeCHYQua3oQv50PLeaQfEfj6pr9D46bN93OFcATPnpqqGWSCiTd8Kcxak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607674; c=relaxed/simple;
	bh=BCw/Xc+yPQOPqxvqPfk22LM6xF38n2ci3+5e8iEcT1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1+0xv0Dqe+JJ+Gbme2emeFO+b9rmL/FcboRYNloDi+J1UM7Mc0m+mUwiKbUUs5pzt6vAEq7yo3kxHLVBx1MsvApwlx9q6gFZfBZ/m7vbUy+ULmRzws84BK/ebKRpusRvmJiYQLO89JS+Ess+Vb7Ppy69eYIP2OJn6orp2px3L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bNQtNCVP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mg3HBhMS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bNQtNCVP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mg3HBhMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774607671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DVZ0ZiCH5gLAQgROkR7a+AA1Jb2BcwfjDddpxmGZHU=;
	b=bNQtNCVPIgZcKF6PsNVDY/zkOqQQtG+21gXCY/tq1NpMaSwD5ja4VbPVb23JuVI9JvaD0r
	4E3TEVeV9ib1jjKPXgw1/kJcNWdGbC1K3qVLyR0TalywV+RFE/7joxC/P5bi5ORrAzLWgZ
	9EI5F7LGPzhUNDFrAm+atcJ4Bn0tBxA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-YB2Pr-rFM0m7TwLz28Upng-1; Fri, 27 Mar 2026 06:34:30 -0400
X-MC-Unique: YB2Pr-rFM0m7TwLz28Upng-1
X-Mimecast-MFC-AGG-ID: YB2Pr-rFM0m7TwLz28Upng_1774607669
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4853b5b0fafso28485405e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774607669; x=1775212469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9DVZ0ZiCH5gLAQgROkR7a+AA1Jb2BcwfjDddpxmGZHU=;
        b=Mg3HBhMSafW1oZKQLv7JLuMYm/Zn9EoVgIgOica1fTsYht5G43xp+PQVEpZcDnbkEc
         UrbKDAz96T2jM041we/gGovGKVfVFe6GBeqDLqdw5RpE59WDqwY6CwT2lcZzEHKurdS5
         mW6d5AKQ0/hYHHxTigDebTwSFZBMP+XArLS5hN/SbVl4vYoG0RP98qwxBGFC4HEOFBJ9
         u2D2L5A3Lq0iSvHpkDw7sVWOJaLTZ/7okAafKoNzsZ6joLhstjBrea6Z2qIGn6xft+OB
         WyuLVUfayT62wzD8FHBs4zxgpY1HAMuvdWiMUFQEewxLs6riTo/6AxxDmV0bwwub0wbf
         5hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607669; x=1775212469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DVZ0ZiCH5gLAQgROkR7a+AA1Jb2BcwfjDddpxmGZHU=;
        b=mWzEfKa/OpzdpMPPG4Vyqkj+uWvf2TiHY9E2k64LPFpFojENkhlMQV2FJt2KhFfZIk
         E/QUDnqV+Etmg7LkuMgmOBX3XpxEv1PpF0yl7KtkU2hlw31Jle272rj3jRBoCIHPK7QS
         hzjFFmsUSW7aoacWcVUPhoc+jioaKzY26EK1r+d4OIbal2Upy2LQHyAbfw6X/htsE2Ny
         aRFGkqVkwfp5OkRvuq6GrbmcVY/4mDrFQ21pJVWuOibYBQVeYlWHb9ZKXz2rMdf11FQ2
         r5V57XGLOnqyqzJdxZtvFzVmkDgVg0mqacTtxzl/1d0tQJg7TryMT8jATAi9lYpgQ8BV
         CWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbzVKfhUZC8Bsg02azoFkbGZUKvjr7wMpVFribhD4ZTYRIxqVeFb7xxYaR7bwWoMi45IOx1fyl0OyB@vger.kernel.org
X-Gm-Message-State: AOJu0YyJBru7s8K69Th7/hrdk8XNrjgP5/tq1OzhbAncg17Q82cqymg3
	fidL/eg/y4UrxbdB3ovvfLsTHgRcwmY45PVIoh0DuC0g8SokRE/Rx5FRqDrA7p+5OAg7r/tHMmX
	XP+70+IwcLt40/m0y/XJPkL20qTJb2eMHdL/yEbm60/vfuNJ7g2ECkX5dFi5PRuE=
X-Gm-Gg: ATEYQzw3yXqukqPhteSK81/G+X9sOQO+Nli/QRMTes28TLBbHKr4PwfRrdimdC7bheb
	UncWzX33upokOGZuTkTK5dR8kAtrYcAHlWaICcO1YdZCYFwGUAAb8oYXwri0yQk1v3kyZj8nWQL
	bRy1yFAhGj7qB1uBycRb44a+ReZEPYRMvzf5weBdCkEbm3xG3lxkePzr5eoGLM3F8GUFXTrTaOd
	IpiUR+RNZ5G7DCwOnOQnsOers9BYoI3eya2de0LW2oxychmudLTPfFZVggdkgVM4rdlFmjADuiW
	4GJIPT1WViRroBKeaIUYGejxVVbUDlRX69OpXV1TTrqxuP1i5ePJqQbRb87VFL57/8ohHvJ/GFe
	pgd04bFwgEmX7aWemeocm
X-Received: by 2002:a05:600c:a010:b0:485:ae14:8192 with SMTP id 5b1f17b1804b1-48727d4588cmr33714605e9.7.1774607669041;
        Fri, 27 Mar 2026 03:34:29 -0700 (PDT)
X-Received: by 2002:a05:600c:a010:b0:485:ae14:8192 with SMTP id 5b1f17b1804b1-48727d4588cmr33713955e9.7.1774607668538;
        Fri, 27 Mar 2026 03:34:28 -0700 (PDT)
Received: from [192.168.2.83] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c65989sm139918865e9.2.2026.03.27.03.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 03:34:27 -0700 (PDT)
Message-ID: <416f5f4f-93a8-41f7-93f5-fdf1fc0f7768@redhat.com>
Date: Fri, 27 Mar 2026 11:34:25 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/5] dpll: zl3073x: add ref-sync pair support
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Michal Schmidt <mschmidt@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Simon Horman <horms@kernel.org>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Pasi Vaananen <pvaanane@redhat.com>
References: <20260319174826.7623-1-ivecera@redhat.com>
 <20260319174826.7623-6-ivecera@redhat.com>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20260319174826.7623-6-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Add support for ref-sync pair registration using the 'ref-sync-sources'
> phandle property from device tree. A ref-sync pair consists of a clock
> reference and a low-frequency sync signal where the DPLL locks to the
> clock reference but phase-aligns to the sync reference.
>
> The implementation:
> - Stores fwnode handle in zl3073x_dpll_pin during pin registration
> - Adds ref_sync_get/set callbacks to read and write the sync control
>    mode and pair registers
> - Validates ref-sync frequency constraints: sync signal must be 8 kHz
>    or less, clock reference must be 1 kHz or more and higher than sync
> - Excludes sync source from automatic reference selection by setting
>    its priority to NONE on connect; on disconnect the priority is left
>    as NONE and the user must explicitly make the pin selectable again
> - Iterates ref-sync-sources phandles to register declared pairings
>    via dpll_pin_ref_sync_pair_add()
>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/zl3073x/dpll.c | 207 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 206 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
> index 276f0a92db0b1..8010e2635f641 100644
> --- a/drivers/dpll/zl3073x/dpll.c
> +++ b/drivers/dpll/zl3073x/dpll.c
> @@ -13,6 +13,7 @@
>   #include <linux/module.h>
>   #include <linux/netlink.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
>   #include <linux/slab.h>
>   #include <linux/sprintf.h>
>   
> @@ -30,6 +31,7 @@
>    * @dpll: DPLL the pin is registered to
>    * @dpll_pin: pointer to registered dpll_pin
>    * @tracker: tracking object for the acquired reference
> + * @fwnode: firmware node handle
>    * @label: package label
>    * @dir: pin direction
>    * @id: pin id
> @@ -45,6 +47,7 @@ struct zl3073x_dpll_pin {
>   	struct zl3073x_dpll	*dpll;
>   	struct dpll_pin		*dpll_pin;
>   	dpll_tracker		tracker;
> +	struct fwnode_handle	*fwnode;
>   	char			label[8];
>   	enum dpll_pin_direction	dir;
>   	u8			id;
> @@ -184,6 +187,109 @@ zl3073x_dpll_input_pin_esync_set(const struct dpll_pin *dpll_pin,
>   	return zl3073x_ref_state_set(zldev, ref_id, &ref);
>   }
>   
> +static int
> +zl3073x_dpll_input_pin_ref_sync_get(const struct dpll_pin *dpll_pin,
> +				    void *pin_priv,
> +				    const struct dpll_pin *ref_sync_pin,
> +				    void *ref_sync_pin_priv,
> +				    enum dpll_pin_state *state,
> +				    struct netlink_ext_ack *extack)
> +{
> +	struct zl3073x_dpll_pin *sync_pin = ref_sync_pin_priv;
> +	struct zl3073x_dpll_pin *pin = pin_priv;
> +	struct zl3073x_dpll *zldpll = pin->dpll;
> +	struct zl3073x_dev *zldev = zldpll->dev;
> +	const struct zl3073x_ref *ref;
> +	u8 ref_id, mode, pair;
> +
> +	ref_id = zl3073x_input_pin_ref_get(pin->id);
> +	ref = zl3073x_ref_state_get(zldev, ref_id);
> +	mode = zl3073x_ref_sync_mode_get(ref);
> +	pair = zl3073x_ref_sync_pair_get(ref);
> +
> +	if (mode == ZL_REF_SYNC_CTRL_MODE_REFSYNC_PAIR &&
> +	    pair == zl3073x_input_pin_ref_get(sync_pin->id))
> +		*state = DPLL_PIN_STATE_CONNECTED;
> +	else
> +		*state = DPLL_PIN_STATE_DISCONNECTED;
> +
> +	return 0;
> +}
> +
> +static int
> +zl3073x_dpll_input_pin_ref_sync_set(const struct dpll_pin *dpll_pin,
> +				    void *pin_priv,
> +				    const struct dpll_pin *ref_sync_pin,
> +				    void *ref_sync_pin_priv,
> +				    const enum dpll_pin_state state,
> +				    struct netlink_ext_ack *extack)
> +{
> +	struct zl3073x_dpll_pin *sync_pin = ref_sync_pin_priv;
> +	struct zl3073x_dpll_pin *pin = pin_priv;
> +	struct zl3073x_dpll *zldpll = pin->dpll;
> +	struct zl3073x_dev *zldev = zldpll->dev;
> +	u8 mode, ref_id, sync_ref_id;
> +	struct zl3073x_chan chan;
> +	struct zl3073x_ref ref;
> +	int rc;
> +
> +	ref_id = zl3073x_input_pin_ref_get(pin->id);
> +	sync_ref_id = zl3073x_input_pin_ref_get(sync_pin->id);
> +	ref = *zl3073x_ref_state_get(zldev, ref_id);
> +
> +	if (state == DPLL_PIN_STATE_CONNECTED) {
> +		const struct zl3073x_ref *sync_ref;
> +		u32 ref_freq, sync_freq;
> +
> +		sync_ref = zl3073x_ref_state_get(zldev, sync_ref_id);
> +		ref_freq = zl3073x_ref_freq_get(&ref);
> +		sync_freq = zl3073x_ref_freq_get(sync_ref);
> +
> +		/* Sync signal must be 8 kHz or less and clock reference
> +		 * must be 1 kHz or more and higher than the sync signal.
> +		 */
> +		if (sync_freq > 8000) {
> +			NL_SET_ERR_MSG(extack,
> +				       "sync frequency must be 8 kHz or less");
> +			return -EINVAL;
> +		}
> +		if (ref_freq < 1000) {
> +			NL_SET_ERR_MSG(extack,
> +				       "clock frequency must be 1 kHz or more");
> +			return -EINVAL;
> +		}
> +		if (ref_freq <= sync_freq) {
> +			NL_SET_ERR_MSG(extack,
> +				       "clock frequency must be higher than sync frequency");
> +			return -EINVAL;
> +		}
> +
> +		zl3073x_ref_sync_pair_set(&ref, sync_ref_id);
> +		mode = ZL_REF_SYNC_CTRL_MODE_REFSYNC_PAIR;
> +	} else {
> +		mode = ZL_REF_SYNC_CTRL_MODE_REFSYNC_PAIR_OFF;
> +	}
> +
> +	zl3073x_ref_sync_mode_set(&ref, mode);
> +
> +	rc = zl3073x_ref_state_set(zldev, ref_id, &ref);
> +	if (rc)
> +		return rc;
> +
> +	/* Exclude sync source from automatic reference selection by setting
> +	 * its priority to NONE. On disconnect the priority is left as NONE
> +	 * and the user must explicitly make the pin selectable again.
> +	 */
> +	if (state == DPLL_PIN_STATE_CONNECTED) {
> +		chan = *zl3073x_chan_state_get(zldev, zldpll->id);
> +		zl3073x_chan_ref_prio_set(&chan, sync_ref_id,
> +					  ZL_DPLL_REF_PRIO_NONE);
> +		return zl3073x_chan_state_set(zldev, zldpll->id, &chan);
> +	}
> +
> +	return 0;
> +}
> +
>   static int
>   zl3073x_dpll_input_pin_ffo_get(const struct dpll_pin *dpll_pin, void *pin_priv,
>   			       const struct dpll_device *dpll, void *dpll_priv,
> @@ -1100,6 +1206,8 @@ static const struct dpll_pin_ops zl3073x_dpll_input_pin_ops = {
>   	.phase_adjust_set = zl3073x_dpll_input_pin_phase_adjust_set,
>   	.prio_get = zl3073x_dpll_input_pin_prio_get,
>   	.prio_set = zl3073x_dpll_input_pin_prio_set,
> +	.ref_sync_get = zl3073x_dpll_input_pin_ref_sync_get,
> +	.ref_sync_set = zl3073x_dpll_input_pin_ref_sync_set,
>   	.state_on_dpll_get = zl3073x_dpll_input_pin_state_on_dpll_get,
>   	.state_on_dpll_set = zl3073x_dpll_input_pin_state_on_dpll_set,
>   };
> @@ -1190,8 +1298,11 @@ zl3073x_dpll_pin_register(struct zl3073x_dpll_pin *pin, u32 index)
>   	if (IS_ERR(props))
>   		return PTR_ERR(props);
>   
> -	/* Save package label, esync capability and phase adjust granularity */
> +	/* Save package label, fwnode, esync capability and phase adjust
> +	 * granularity.
> +	 */
>   	strscpy(pin->label, props->package_label);
> +	pin->fwnode = fwnode_handle_get(props->fwnode);
>   	pin->esync_control = props->esync_control;
>   	pin->phase_gran = props->dpll_props.phase_gran;
>   
> @@ -1236,6 +1347,8 @@ zl3073x_dpll_pin_register(struct zl3073x_dpll_pin *pin, u32 index)
>   	dpll_pin_put(pin->dpll_pin, &pin->tracker);
>   	pin->dpll_pin = NULL;
>   err_pin_get:
> +	fwnode_handle_put(pin->fwnode);
> +	pin->fwnode = NULL;
>   	zl3073x_pin_props_put(props);
>   
>   	return rc;
> @@ -1265,6 +1378,9 @@ zl3073x_dpll_pin_unregister(struct zl3073x_dpll_pin *pin)
>   
>   	dpll_pin_put(pin->dpll_pin, &pin->tracker);
>   	pin->dpll_pin = NULL;
> +
> +	fwnode_handle_put(pin->fwnode);
> +	pin->fwnode = NULL;
>   }
>   
>   /**
> @@ -1735,6 +1851,88 @@ zl3073x_dpll_free(struct zl3073x_dpll *zldpll)
>   	kfree(zldpll);
>   }
>   
> +/**
> + * zl3073x_dpll_ref_sync_pair_register - register ref_sync pairs for a pin
> + * @pin: pointer to zl3073x_dpll_pin structure
> + *
> + * Iterates 'ref-sync-sources' phandles in the pin's firmware node and
> + * registers each declared pairing.
> + *
> + * Return: 0 on success, <0 on error
> + */
> +static int
> +zl3073x_dpll_ref_sync_pair_register(struct zl3073x_dpll_pin *pin)
> +{
> +	struct zl3073x_dev *zldev = pin->dpll->dev;
> +	struct fwnode_handle *fwnode;
> +	struct dpll_pin *sync_pin;
> +	dpll_tracker tracker;
> +	int n, rc;
> +
> +	for (n = 0; ; n++) {
> +		/* Get n'th ref-sync source */
> +		fwnode = fwnode_find_reference(pin->fwnode, "ref-sync-sources",
> +					       n);
> +		if (IS_ERR(fwnode)) {
> +			rc = PTR_ERR(fwnode);
> +			break;
> +		}
> +
> +		/* Find associated dpll pin */
> +		sync_pin = fwnode_dpll_pin_find(fwnode, &tracker);
> +		fwnode_handle_put(fwnode);
> +		if (!sync_pin) {
> +			dev_warn(zldev->dev, "%s: ref-sync source %d not found",
> +				 pin->label, n);
> +			continue;
> +		}
> +
> +		/* Register new ref-sync pair */
> +		rc = dpll_pin_ref_sync_pair_add(pin->dpll_pin, sync_pin);
> +		dpll_pin_put(sync_pin, &tracker);
> +
> +		/* -EBUSY means pairing already exists from another DPLL's
> +		 * registration.
> +		 */
> +		if (rc && rc != -EBUSY) {
> +			dev_err(zldev->dev,
> +				"%s: failed to add ref-sync source %d: %pe",
> +				pin->label, n, ERR_PTR(rc));
> +			break;
> +		}
> +	}
> +
> +	return rc != -ENOENT ? rc : 0;
> +}
> +
> +/**
> + * zl3073x_dpll_ref_sync_pairs_register - register ref_sync pairs for a DPLL
> + * @zldpll: pointer to zl3073x_dpll structure
> + *
> + * Iterates all registered input pins of the given DPLL and establishes
> + * ref_sync pairings declared by 'ref-sync-sources' phandles in the
> + * device tree.
> + *
> + * Return: 0 on success, <0 on error
> + */
> +static int
> +zl3073x_dpll_ref_sync_pairs_register(struct zl3073x_dpll *zldpll)
> +{
> +	struct zl3073x_dpll_pin *pin;
> +	int rc;
> +
> +	list_for_each_entry(pin, &zldpll->pins, list) {
> +		if (!zl3073x_dpll_is_input_pin(pin) || !pin->fwnode)
> +			continue;
> +
> +		rc = zl3073x_dpll_ref_sync_pair_register(pin);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * zl3073x_dpll_register - register DPLL device and all its pins
>    * @zldpll: pointer to zl3073x_dpll structure
> @@ -1758,6 +1956,13 @@ zl3073x_dpll_register(struct zl3073x_dpll *zldpll)
>   		return rc;
>   	}
>   
> +	rc = zl3073x_dpll_ref_sync_pairs_register(zldpll);
> +	if (rc) {
> +		zl3073x_dpll_pins_unregister(zldpll);
> +		zl3073x_dpll_device_unregister(zldpll);
> +		return rc;
> +	}
> +
>   	return 0;
>   }
>   

LGTM.


Reviewed-by: Petr Oros <poros@redhat.com>

