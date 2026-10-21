Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792536614;
	b=Jk4sOVH0oqFhha0bHIXGDPdgBRvpvgWrvuIA7xyRjEWIKDj8WGEPXFGDiLzFV3KVdwEz
	 ZYuD8dATigLtQTT451NDSIPaOxN42AI8CSrp9oHoFz2d4So1mWr+b2C+ebDhBZ11N82Ft
	 P+HQEJTVT2xMfq23Cs3aRUrZaYUf+SB5aGmMQQzktYw3B82fPb7BoIqiCjGcF32R++2IN
	 tn+k1cbzJlBgdMkyfG3RgvzyFhSgLKXCvJjC6LwYW0qWdVNf0icMMm6/r0TVNcXaAc/L3
	 /d1rVnyMI48ULwLliqRE7gQvsuXDZPJyMZRkvCm7cTBogfQjQapB9/aHyOgOpaUHSNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792536614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=19wjVHCaibD5UIJAy8r6oN0ZlDD7tIr+wntuQPjoIEE=;
	b=xZdVoNGk/7dD1lfaUuNfM+QSc8xN8eWmM/pcpLLxDMaDUZoeiTHQnswznRuYpAdSlat+
	 Ynx2/IcndFFklJuBzIPHfegMcshjj2wBoF2Q5IQPWx0RNgvKErRlv4LGRvzMuV3Ig30J4
	 vTjnx2dYWOZ8WtisimUzauD4U21QlB5SGORsOHHINLIgbVEADEMyHX459hGhlDEXSJSRs
	 GpFLV7ItoIRNAy1ZhOIC/X7ZNdmnlW5bj5yC0mChak+Z73E46qTKb9Dmpdqm5RU93zNGg
	 V298fnU5oe6NdQCdG2kJVtWQStJh6SFlmbp9reUAC+wzt5euH1f9GeyOrNWD5LYSGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mRT4TwSG;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0D606A334
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 22:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB0D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mRT4TwSG
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so720935e9.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792536612; x=1793141412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=19wjVHCaibD5UIJAy8r6oN0ZlDD7tIr+wntuQPjoIEE=;
        b=mRT4TwSGWDRnuh0cCmyIEeJq7GUXr4Y6YlnO0uxDP83vepiX74FHlIlG5AOllXegw2
         ujRzkLqgBh2J87eC5U299NzqB5SVJMCYD76izGIHkBEZxk+xF4gdD/3dKcoHqUzq0IAW
         ZhBTyO5MsuLjDU19d4NlATZQZX38YBP/hG/CNu62/PvD9vFw5dzZbopFW1tQkcF/3w6Q
         mqxkGtsw7fhS5DOwDduhuK3FTYuHmYKVT1ul+AEmZlV9ebrlFqsihvw1hjuH/wMHiz2i
         FSv2w4yS0izw8n0SbrcQP1w1Lpycv89h/npTL4qRK9l7cq2cQ40dEnrbdTS35Qhdta3s
         u8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792536612; x=1793141412;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19wjVHCaibD5UIJAy8r6oN0ZlDD7tIr+wntuQPjoIEE=;
        b=u2UpHJ+lYFw0WdG+sOJaXcoSV2nCDv0xUIqLY+xQOBcdZe2vCax32JHzokTO3UKaMw
         E+yZ7uBef4QXgjLeWzGrXGb9k8iWWkliU5Td1yW5WjKHvKNvnzmQvX6rGi4y9pT8wKuX
         HxU818LJbOFxeJx9Lk7IsA5Ig3mYDgNcjiZoNiwro4gXimxyFDWqlpExi/lbav0JlGi0
         kxVGCRsdSciE2jL95vwO70XJ+MY69vPl+Tjh7SexJePFf7rAqMfwpOnbvPfI4KWXTF7w
         VEV5N0NHmZMbUeD0gSqx+1If3jSExZOANvrHwiXnncbxc9f0v0y8JTUGHpqsxFDT+CzP
         9WrA==
X-Forwarded-Encrypted: i=1; AKwUvBxkj3KKyqvXG+x7C6CFeUqKFFxllrYXkPc2CLQWjiG+UFPK42x+NUiMFJFjmQw5tHy4DdGMIbqa0uOe@vger.kernel.org
X-Gm-Message-State: AFq9FYIRHkcYBeyIH9pCAaab0GfaAU/A2g8tEGrXIAtb9O6jbDbHw//T
	HduVwK8ErBuNNXf0UIZNZpBk0uwSarBawxKsSEyJzWpZTqi+cFAUjZXjD5/blUMc
X-Gm-Gg: AYBFou13wgcgINf04bfC34Izu76YWJqt1WP5ffTO2cWoGZeO/Z5nRwFsJGuZVJnxyQ1
	sIejX8lJhuOC3ekh1olvME20WwMqr5S++ooobSnWxFN1Q/ZQ5rizH/DPlmtawMYGpjiHE0ajfsT
	Dyl22CrFuil0s4g1T1X8va5ic/hou92rN119ovc21kx4roo88uayFlMyp7F7pnpyRRiLmIa1R/t
	MWMeQAY89pH7B5yfhQ/vYCCOqlEcTHVCSLo8Xpxac+Jv6lwTx9K/VodoupWds+sJCIp62C1eYwC
	8Mf63yUmGD8m44QxqvPFROapQNjQ/CzdJcfk1GzsfNzV3GfY0l2c+JJMZDNQOcXuolBsH5meQyu
	Qk+dUOp72rVmeB6FXLnXAQqYyYqLrS9Ptjus9WhLFP5hWuMmen1BCi22dBea+4NPeB3vk3xul4I
	fXR1gDsy2dh/lqmBlboebSLq2nV7eNwCMZosA9VdJppZT7VZ0poplkdOyCNTW1s4i0vhuOP9sME
	DIiTKCzeygEvB7FVPb1Ons4
X-Received: by 2002:a05:600c:19c7:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a1fdd2f2ecmr2163415e9.16.1792536611838;
        Tue, 20 Oct 2026 15:50:11 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm17511805e9.0.2026.10.20.15.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:50:11 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/13] drm: client: add splash client
Date: Wed, 21 Oct 2026 02:50:01 +0200
Message-Id: <20261021005006.2341200-2-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <fafa7327-e624-49f2-98b2-83fd602a0ad7@suse.de>
References: <20261013093243.505776-1-maximpedraza@gmail.com> <20261013093243.505776-4-maximpedraza@gmail.com> <fafa7327-e624-49f2-98b2-83fd602a0ad7@suse.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Thanks a lot for the thorough review. I was preparing v6 when it came
in; I will hold it back and work all of this in first. Answers below.

Am 20.10.26 um 12:28 schrieb Thomas Zimmermann:
> This lengthy comment should be a list of per-revision changes, like this:
>
> v5:
> - exit when firmware BMP is missing
> - foo
> - bla
>
> and so on. We keep these in the commit message right before the tags.

Will do.

>> +	select DRM_CLIENT_LIB if DRM_CLIENT_SPLASH
>>   	select DRM_CLIENT_LIB if DRM_CLIENT_LOG
> Alphabetic order please

OK.

>> +	  The color can be overridden through the drm_client_lib.splash_color
>> +	  kernel command line parameter.
> No extra module parameters please.

[...]

> As I said, no module parameter for colors.  The color is something that
> the SoC firmware vendor would know at build-time. There is no reason for
> the user to modify this at runtime.

Sorry, I should have answered this the first time rather than keep
the parameter without a word. Let me explain why I would like to keep
the command line, for the colour and also for the parameters patch 12
adds, and you tell me whether it holds.

The build-time defaults cover what a product normally shows. The
parameters are for what is only known at boot: the bootloader finds an
update pending, a failed boot count or a recovery request, or reads the
product variant from an EEPROM, and wants the splash to say so, with
another logo or a red or amber background. Any bootloader can do that
by adding to the command line: a setenv in a U-Boot script, a recovery
entry in GRUB or systemd-boot. Changing the device tree instead needs
fdt support in the bootloader and knowledge of the node, and is not
possible at all when the device tree is signed along with the kernel
in a FIT image. On x86 with the BGRT there is no device tree, and the
command line is the only way.

There is precedent for this kind of setting: video=...,rotate=,
fbcon=rotate: and fbcon=logo-pos: are all about how the boot screen
looks, and console= wins over stdout-path the way these win over the
device tree.

So my proposal for v6: the defaults are set at build time, as you ask
(the colour already is, and the BMP's file name becomes a Kconfig
string), and the parameters stay, only to override them for one boot.
If that is still a no, I will drop them all, patch 12 included.

> How could we find out about the bmp's file name? I assume it is just a
> file in the initfs, which we have to know about?

It is requested with request_firmware_nowait(), so it is looked up like
any other firmware: built into the kernel with EXTRA_FIRMWARE, in the
initramfs, or under /lib/firmware once the root file system is there.
The name is fixed by whoever builds the image, so

> In any case, this should again not be module parameter. Please make it
> build-time configurable via Kconfig.

a Kconfig string fits it well for the default name; v6 will have it.
splash_bmp= would then only pick another file for one boot, such as
one of several images built in with EXTRA_FIRMWARE, as above.

>> +} __packed;
> These types are already in efifb.c can we move them into a header file.
> include/video/bmp.h should work.

Yes, I'll add a patch that moves them there and makes efifb use the
header. The header keeps the __le types, as BMP is little endian
whatever the CPU, so efifb will read the fields through
get_unaligned_le*() like the splash does; no change on the little
endian systems EFI runs on. That patch touches fbdev, so it will go to
Helge and Peter as well.

>> +	*data = fw->data;
>> +	*size = fw->size;
> Why does this work?
>
> We no longer hold a lock on fw. If a concurrent thread calls
> release_firmware() on splash->fw, data and size might become invalid.

The only release_firmware() on splash->fw is in
drm_splash_image_cleanup(), which runs in the render thread itself
once it has drawn, and at unregister after the thread has been
stopped. The firmware callback stores the firmware under fw_lock, or
releases it itself if the thread is already done, and never touches it
again. So nobody can release it while the thread reads from it; the
lock is only there for the hand-over from the callback. I'll put that
in a comment, since it is not obvious from the code.

>> +	drm_info(client->dev, "splash: request %s as firmware", splash_bmp);
> drm_dbg() here. drm_info() is log spam.

OK, here and in the other places you pointed out.

>> +	int i;
> format_count is an unsigned int. i should lik

OK.

> Values like px_width are deprecated because they don't work in the
> general case.  Rather pass the format as drm_format_into and do the
> px_width lookup within the drm_splash_fill().

OK.

>> +			scolor = *(const u32 *)(&sbuf8[src_offset + 3 * x]);
> Please build scolor from the individual entries in the color table. This
> type casting is fragile. It also only works on little endian with
> unaligned loads AFAIU.

Agreed. It also read one byte past the end of the image on the last
pixel. v6 already reads each pixel with get_unaligned_le24(), which
builds it from the three bytes, in this patch rather than in a later
one as in v5.

>> +	bmp_width = (s32)get_unaligned_le32(&dib_header->width);
>> +	bmp_height = (s32)get_unaligned_le32(&dib_header->height);
> Why not make these variables unsigned?

[...]

>> +	bmp_invert_y = (bmp_height > 0);
>> +	bmp_height = abs(bmp_height);
> That's the answer to my question above, i guess?   But what about bmp_width?

Yes. Both are signed in the BMP header, as in efifb's struct
bmp_dib_header. A negative width has no meaning, and keeping it signed
lets the format check reject it as such (bmp_width <= 0) rather than
see a huge width that only the size checks further down would stop.
I can read the width as unsigned and check it against S32_MAX instead
if you prefer.

>> +		 * On x86 some firmwares use a low non native resolution for
> 'Some firmware on x86 uses a non-native resolution for'
>
>> +		 * the display when they have shown some text messages. While
> 'the display if it has shown some text messages.'

OK, thanks.

> The entire if-else block below should be a function drm_splash_blit().
> Please also see my comment on using px_width.

OK. Together with your comment on patch 9, the blit will become a
function from this patch on.

> The client receives a hotplug whenever the attached display changes.
> Returning here would likely break anything after the initial one.
>
> Best is to kill the rendering thread, rebuild the list of modesets and
> reinit.

Right, today an output plugged in later stays dark, and a restore puts
back the modesets of the first hotplug. v6 will rebuild on every
hotplug, keeping the image around so that an output plugged in later
gets it too.

> Why does it use a rendering threat?  Wouldn't it be much easier to
> schedule a worker?  You can also try to put it on the power-efficient
> work queue.

The thread mostly waits: for the BMP firmware and for the next
redraw. A work item queued from the hotplug and from the firmware
callback covers both, and makes the start and stop paths simpler,
which is where v3 had its use-after-frees. I'll move it to
system_power_efficient_wq.

> I don't think this is right. (?) If there's no fb, the restore should
> disable the display. Just run the commit below.

Fair enough. The early return was there because committing modesets
that still had a mode but no framebuffer failed with -EINVAL and a
WARN. v6 already clears the mode of an output that gets no buffer;
I'll do the same when the buffers are freed, drop the early return,
and let the commit turn the outputs off.

>> +	mutex_destroy(&splash->hotplug_lock);
> This line belongs into drm_splash_client_unregister(). The free callback
> is only for free-ing the client instance.

OK.

>> +	drm_dbg(dev, "Unregistered with drm splash");
> 'free', not 'unregister'

OK.

Best regards,
Màxim
