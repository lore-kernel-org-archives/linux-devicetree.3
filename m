Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392830;
	b=F5CPpDEkTVXe+Nfs5JjHqIIOefmsm8g8hAGVuNnmDD1nsslocbb0Xtk6KF2l8Sf9hvH/
	 UgxOHWRkxvfOqYfAVhcmvTzOPX4Sz4G+0tcj5KFcfUaF+GqK0EvhTPmgJr/7i9YPrCf8s
	 LllimgLb3xZ2LtXYub7bHfsUPrdkzmrVtemk52wyz+6iYktDRwW/JqGrSe0JfFEPA5Z51
	 nlKasFnRtU1dbzkdfpcIsZxW7Ag6ZMF90/hHeYyvuabCFcQZg06zy9qGadYpa1bOSxKKC
	 wizd7OY52UZtSTJ/P1UvPo5w1czsvqIe2UAufNFGczSexAKV6mXUo6O9iuai2WdyO2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392830;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=KtiV62Thw+FKVj+2fH8N2rvAYJ0UufPYwMtls7bTByk=;
	b=tB4IHVADGL7AI18jvXiulLVpx5kNdn2rU4T/BKGVpAYBabdZeZ+unsxKVN7Gxw1PB3hH
	 wC1WJx6BHOCHvtuMbGcdrT8l27qG/7vFlqiaROd0GjDcxpeXkokRzqYAS4EXvr06zYdBr
	 zxVE9O1vEf4b/U5SaRoWQsvTtMTp4OzQU7b/Ium3FKAZpjgnvE2JVtabbLDg7Ro869Kum
	 k3y2ro5Sqg7KFZPiRgTRRLV8J0jUQY+Ntp5I15QYaIjhyQYXcnzbu2W6yZ4zTmJeCXmEE
	 tfMA9B7Ii9Mz8n0bB+stTKxFz9BbjA4lgLxFWmQvkuq5LGSWNwXnGy3ygAKKayrF8LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EgAT+hwj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="v/2A/JDp";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EgAT+hwj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="v/2A/JDp";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27161606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27161606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EgAT+hwj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=v/2A/JDp;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EgAT+hwj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=v/2A/JDp
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2F2F11F7C3;
	Wed, 11 Nov 2026 10:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794392828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KtiV62Thw+FKVj+2fH8N2rvAYJ0UufPYwMtls7bTByk=;
	b=EgAT+hwjNOsx9MDe7xraetZiI+qq1lg648mKL1JXrck+qckY6QrdB4G1p145Fw1ve7D+59
	EzzK89hmmlOuadCTJzJERyReak4apecW8od+CLNQlZouAOVe7bELtmDfd6L0RRazt2MUU6
	tDO3zQ8c4t8Lm7Hms1gbsUunTvRDgqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794392828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KtiV62Thw+FKVj+2fH8N2rvAYJ0UufPYwMtls7bTByk=;
	b=v/2A/JDpOAbQP80BDhC9rP3izdJApRnWEOIGnQmzvChs/ba4EwWfLJRNunmjZcVIlkTTrL
	e3BLe9cftjFrFvCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794392828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KtiV62Thw+FKVj+2fH8N2rvAYJ0UufPYwMtls7bTByk=;
	b=EgAT+hwjNOsx9MDe7xraetZiI+qq1lg648mKL1JXrck+qckY6QrdB4G1p145Fw1ve7D+59
	EzzK89hmmlOuadCTJzJERyReak4apecW8od+CLNQlZouAOVe7bELtmDfd6L0RRazt2MUU6
	tDO3zQ8c4t8Lm7Hms1gbsUunTvRDgqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794392828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KtiV62Thw+FKVj+2fH8N2rvAYJ0UufPYwMtls7bTByk=;
	b=v/2A/JDpOAbQP80BDhC9rP3izdJApRnWEOIGnQmzvChs/ba4EwWfLJRNunmjZcVIlkTTrL
	e3BLe9cftjFrFvCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6D31134E5;
	Wed, 11 Nov 2026 10:27:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Zoh0GftC9GpCEwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 11 Nov 2026 10:27:07 +0000
Message-ID: <cba017db-db33-429f-a837-766200ec16ec@suse.de>
Date: Wed, 11 Nov 2026 11:27:06 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] drm: Add DRM driver for GlandaGPU (VHDL soft-IP
 GPU)
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, u.kleine-koenig@baylibre.com
References: <20261011154556.155831-1-kieweg.leander@gmail.com>
 <CAMwcS0i-RQgWGHTUTVBwj8_is94siqwLg4mjgbN6qAhvosRb5w@mail.gmail.com>
 <f06459fd-616b-4810-a8f9-cb4df2fcbd8f@suse.de>
 <CAMwcS0ii+=5LvgeFRmMkQKUm9oReQj=-t7vZ5uxCrLGi=jzvnQ@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <CAMwcS0ii+=5LvgeFRmMkQKUm9oReQj=-t7vZ5uxCrLGi=jzvnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.79 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,baylibre.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Score: -11.79

Hi

Am 10.11.26 um 18:28 schrieb Leander Kieweg:
>> Oh, I thought you wanted to send a v7. :)
>>
>> There's nothing blocking it, I think. I'll merged the driver in soon.
> Hi Thomas,
>
> thank you for the review and for merging it!

There's was bitrot in there.

   CC [M]  drivers/gpu/drm/tiny/glandagpu.o
/home/tzimmermann/Projekte/drm-upstream/src/drivers/gpu/drm/tiny/glandagpu.c:293:10: 
error: »const struct drm_crtc_funcs« hat kein Element namens »reset«
   293 |         .reset = drm_atomic_helper_crtc_reset,
       |          ^~~~~
/home/tzimmermann/Projekte/drm-upstream/src/drivers/gpu/drm/tiny/glandagpu.c:293:18: 
error: »drm_atomic_helper_crtc_reset« ist hier (außerhalb einer 
Funktion) nicht deklariert; meinten Sie »drm_atomic_helper_check_modeset«?
   293 |         .reset = drm_atomic_helper_crtc_reset,
       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |                  drm_atomic_helper_check_modeset
/home/tzimmermann/Projekte/drm-upstream/src/drivers/gpu/drm/tiny/glandagpu.c:317:10: 
error: »const struct drm_connector_funcs« hat kein Element namens »reset«
   317 |         .reset = drm_atomic_helper_connector_reset,
       |          ^~~~~
/home/tzimmermann/Projekte/drm-upstream/src/drivers/gpu/drm/tiny/glandagpu.c:317:18: 
error: »drm_atomic_helper_connector_reset« ist hier (außerhalb einer 
Funktion) nicht deklariert; meinten Sie 
»drm_atomic_helper_connector_tv_check«?
   317 |         .reset = drm_atomic_helper_connector_reset,
       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |                  drm_atomic_helper_connector_tv_check


The reset callbacks got replaced by atomic_create_state plus default 
implementation. I've fixed the patch before merging it.

>
> After Christmas I will submit the QEMU patch to get the official
> device ID. Then I will send a follow-up kernel patch to replace the
> placeholder.

Sure.

Best regards
Thomas

>
> Best regards,
> Leander

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG Nürnberg)


