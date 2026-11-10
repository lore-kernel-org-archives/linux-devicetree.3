Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315292;
	b=Z/i9clVDOA/+wVr1nmgAkQI2K1YqqB9ld6QzENELm3dgx5btpbWgYgt2EQg7AVqQFsX/
	 p4rWSrokPh7UMfsUV7TtlkgVtqAGOat5pFwDqHsHKrco86AvdO5CbIhf37oXVN/+V6mZa
	 k6FaoQPTpEQPFuFeoahKi75rQEPSuzTIWQ/Gsr+vGZGtoeLQsFwRlaisEBrB53cttWvuy
	 l7yLS/VnJiT92IEBozfB3RmsMoybxkHdguzGmmRQKt+gU3Ahw31CmY6Kd0cnD/zpr02JN
	 CZfni09swa3/uQCqMRF+ZdGXxhEQfwvXcUqV537COK3n6Z6HATH3y2CDeHeqyDVeikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315292;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=fxrnxJLF1V/Ug4nKMrgXtpb6TxG0TqIYaCbJFS+zDU8=;
	b=Kypppn4MGKr11HCUB+tw+h3ADo0X+q74ioIw6hmjfmPTJaxPd8mj7S41OcU1k9S3eoMG
	 F7J3pbIEduF8sm531EmNLFBiApS7JI0XdS4zjhvREF8/BQT7V7nIU37SfFtV7AtgR2EJI
	 x0RX+y/9FROkCgFdnnsmHtQ8WZYOUYAuzYGCzkGJyS6SO+26cs06aGzFWzeb65ubKrzwI
	 Y9+pe/Keugan3VzCNwxRK6Huoe2cJ3yXwmYiK/wDxnUHGE3rSH+1Ut/nZ/lpew/W9SgJV
	 xifxn1F8x9rQlkN04+wxEJk0iiY/E3CDzNLPRs9tG3cYFwvQV6Y2JlmU9gIJwZgsHEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AbKE8eq9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="bguL4U/4";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AbKE8eq9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="bguL4U/4";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7160A2628
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C7160A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AbKE8eq9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bguL4U/4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AbKE8eq9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bguL4U/4
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3204721EFD;
	Tue, 10 Nov 2026 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fxrnxJLF1V/Ug4nKMrgXtpb6TxG0TqIYaCbJFS+zDU8=;
	b=AbKE8eq9fpCyMS1on/prRofLI+mm4b42ElzxHnLIEMzVKCqCSK8rc/wkuAMHx8vQiTf+Yb
	YchlVuIGyaZnWh4h+hHOpzUvRh70LmKbF4ZtcUYDj7GiTzgtbuW9+gKQJJpzs8q4BzU4oD
	W9cy6CRWNVHphBT7ftpHiAM0P5B9IUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fxrnxJLF1V/Ug4nKMrgXtpb6TxG0TqIYaCbJFS+zDU8=;
	b=bguL4U/4dZy2f6WsWX2kV37PDxzBlg3MVcIBLsgDV9TwMYQexjHA0CsDyTe0sOwjo1E5aZ
	g2Ol+epT3c9MSWCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fxrnxJLF1V/Ug4nKMrgXtpb6TxG0TqIYaCbJFS+zDU8=;
	b=AbKE8eq9fpCyMS1on/prRofLI+mm4b42ElzxHnLIEMzVKCqCSK8rc/wkuAMHx8vQiTf+Yb
	YchlVuIGyaZnWh4h+hHOpzUvRh70LmKbF4ZtcUYDj7GiTzgtbuW9+gKQJJpzs8q4BzU4oD
	W9cy6CRWNVHphBT7ftpHiAM0P5B9IUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fxrnxJLF1V/Ug4nKMrgXtpb6TxG0TqIYaCbJFS+zDU8=;
	b=bguL4U/4dZy2f6WsWX2kV37PDxzBlg3MVcIBLsgDV9TwMYQexjHA0CsDyTe0sOwjo1E5aZ
	g2Ol+epT3c9MSWCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B893A1339F;
	Tue, 10 Nov 2026 12:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6mqOIxkU82qRQgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Nov 2026 12:54:49 +0000
Message-ID: <f06459fd-616b-4810-a8f9-cb4df2fcbd8f@suse.de>
Date: Tue, 10 Nov 2026 13:54:49 +0100
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
To: Leander Kieweg <kieweg.leander@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, u.kleine-koenig@baylibre.com
References: <20261011154556.155831-1-kieweg.leander@gmail.com>
 <CAMwcS0i-RQgWGHTUTVBwj8_is94siqwLg4mjgbN6qAhvosRb5w@mail.gmail.com>
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
In-Reply-To: <CAMwcS0i-RQgWGHTUTVBwj8_is94siqwLg4mjgbN6qAhvosRb5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,baylibre.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url]
X-Spam-Score: -11.79
X-Spam-Level: 
X-Spam-Flag: NO

Hi

Am 10.11.26 um 11:36 schrieb Leander Kieweg:
> Hi Thomas,
>
> a gentle ping on v6 of the GlandaGPU series. Is there anything else I
> should change before it can be merged?

Oh, I thought you wanted to send a v7. :)

There's nothing blocking it, I think. I'll merged the driver in soon.

Best regards
Thomas

>
> Best regards,
> Leander
>
> Am So., 11. Okt. 2026 um 17:46 Uhr schrieb Leander Kieweg
> <kieweg.leander@gmail.com>:
>> This is v6 of the GlandaGPU DRM driver series [1][2][3][4][5]. It
>> addresses review feedback from Thomas Zimmermann on v5.
>>
>> GlandaGPU is a small VHDL soft-IP 2D display controller, currently
>> targeting a Terasic DE10-Standard (Cyclone V SoC). This series has
>> been tested against a QEMU digital twin and on real hardware.
>>
>> Hardware/VHDL:   https://github.com/stiangglanda/GlandaGPU
>> QEMU fork:       https://github.com/stiangglanda/qemu-glandagpu
>> Userspace tests: https://github.com/stiangglanda/GlandaGPU-userspace-tests
>>
>> Changes since v5:
>>
>> driver core:
>> - Replace the custom glanda_crtc_atomic_flush() with
>>    drm_crtc_vblank_atomic_flush() (Thomas Zimmermann).
>>
>> On the QEMU device ID: it's currently a placeholder from the
>> experimental range, since I haven't submitted the QEMU patch to get
>> an official one yet. Is that fine to merge as is, with a follow-up
>> kernel patch once the official ID is assigned?
>>
>> [1] v1: https://lore.kernel.org/dri-devel/20260714101146.200416-1-kieweg.leander@gmail.com/T/#t
>> [2] v2: https://lore.kernel.org/dri-devel/20260730173643.256052-1-kieweg.leander@gmail.com/T/#t
>> [3] v3: https://lore.kernel.org/dri-devel/20260824195418.17707-1-kieweg.leander@gmail.com/T/#t
>> [4] v4: https://lore.kernel.org/dri-devel/20260913205007.118552-1-kieweg.leander@gmail.com/T/#t
>> [5] v5: https://lore.kernel.org/dri-devel/20260920193944.110983-1-kieweg.leander@gmail.com/T/#t
>>
>> Leander Kieweg (2):
>>    dt-bindings: display: Add GlandaGPU binding
>>    drm/glanda: Add initial DRM driver for GlandaGPU
>>
>>   .../bindings/display/kieweg,gpu.yaml          |  56 ++
>>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>   MAINTAINERS                                   |   6 +
>>   drivers/gpu/drm/tiny/Kconfig                  |  11 +
>>   drivers/gpu/drm/tiny/Makefile                 |   1 +
>>   drivers/gpu/drm/tiny/glandagpu.c              | 634 ++++++++++++++++++
>>   6 files changed, 710 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml
>>   create mode 100644 drivers/gpu/drm/tiny/glandagpu.c
>>
>> --
>> 2.43.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Stefan Gaiser, Jochen Jaser, Abhinav Puri, (HRB 36809, AG Nürnberg)


