Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A75728B7DA
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059200; cv=pass; b=nlP3ntknoZHqZPIgvjk446xVPQ+RZmo2RvTBzV+YY9bGYvZaEqJRcWDS7RDWRaoJisB4GwykvExV9a7rgaOHws5Wc5EOSZVWgbNdzVPG7lydfJ7/2ORbPc118cW0yYHbAayJ0jibx/2Yl8YdN6Pl65V4+heAfT0esEfN+MqyhPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059200; c=relaxed/simple;
	bh=532+dLG2bbDU5qhM1SXwnloFiDTZfwwoA/4+UkT/VQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTfWF8oqDKoSVO64ovBWEeEq7tUHEhQfLysJoar1eBRa+aY/2Zavsyl1FuFrJFDEq93h4PJGVFdC9XQya4FpaMIvgW+Etv8UZ0ysRQW1yl1eTfm1jVUJBkVd2ZVY+cCQ9lzcTyLFNbkdT7n5GURpnXY51/fqsg2kkO4nMWcYm1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6cudlLX; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6cudlLX"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304545f5206so10699198eec.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780059198; cv=none;
        d=google.com; s=arc-20240605;
        b=Y26pNqNVwKtfqwupXuU44/wdwfs2gtebYSbuGOeg7WZ8TSIjd1MosAi8sZzBOIlpYd
         TdKSkXQoa+8WDxgOYaE3DwJXmxaU7ckZvcxxa4bTUHflAlx5MQR4ZLM28Erbb1YB+yjg
         0qBbhBjy531mNLVGdnXsZCY24YbMBf92BMi6CdS+TZ14RdG/C5L/BcXYQehDGTACgTkI
         DQC8UzIcuuSE++/syZm93Jx50L6ip2U55TTfB53hfSJGBoRmbMTfUD3UYkfZksvtFGnV
         0vOf/wfQw4Eoxp2x9TbPxCrP7E0W6iGfS5+Dk3fn9AUNGheF0J9dfYfGjPqIuWA/oNQm
         8XsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4hkrvbEDQ7S/ccYzMc9b/sSg1UxvqgRfRv2D5+QoUYc=;
        fh=oRRFdW3Ej/+D7VGsqPMbuj8ASssbYXWRRU70XivVYAA=;
        b=LmXgMfJF1wdDTZ1tp6XKWw+1AJ7596WNki/yv+QsicrFmPI5Hw/xsAxCD1/scvixAb
         jMZF/fXBhcCk43TOHC/3VbZ9DuCMvM93GwTcqcHuHzF9shtW+CrCM81mvKGLWaYai3pf
         nvie655nayQOWvMIbBfUdgEhNcGb/MNuJNg2cKx8ycUQ3LuqGfvinGf1mKVVL6slI30z
         H3YK1tMEYTumsHPvyhMID8o/FqvVGIfKFmQ9A2nkjNy0CU1O4B5qImC9kqGZEHe4KgBw
         9B1WF10UjLsQNslWtF/CQ3r1WxHgvMjhCyMskkwKymCKPYluxNEVFMGxxa5BsH8bpKdj
         PCRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780059198; x=1780663998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4hkrvbEDQ7S/ccYzMc9b/sSg1UxvqgRfRv2D5+QoUYc=;
        b=U6cudlLXv2JjG82mE+rJwRAbLqPeJT/u33TZ4rosOyMQQDj/xMAo3F+Ad/TpaEYh9p
         rLH83ElBwJ1jJc/DPqQ1NMvPpyxdzWNcPQ62ch/dGQXN40H/LWD25PHa0a33r7Vys8I2
         cwK6GgLtZiN821PCXVXi+HxZ11SPlverzmn6jhaGu1F4m40FCYM11Q1kPJOewmUlcCLP
         s07OsPWJMrPazFX1yFpEERLB6cRrMT+HG/32dyFGssxK39WaD87nK6GERO5sjH6Ber0p
         nKshgGGp3HnQ1/OMckRkbhITshCgTHj1Kbqfws2aNnZXcDFfRKzQNn0tWAD+4rHO9rIb
         oDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059198; x=1780663998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hkrvbEDQ7S/ccYzMc9b/sSg1UxvqgRfRv2D5+QoUYc=;
        b=YbT/jWQlpK4C8TtHn14VyI9EuwZzFsPruFH1y69dmF/vd2iTc4kvkUgBwbtxWPe1dT
         623dft/Ja3MmgCLRbR52ErfaWI4/kuCzMWthA1AqCwUJTCmW5kq0T4b2OXShlelcu4II
         enfZiJe/J25NPvUUeTE/Sztz5XE6nqEMxQg2vsNFX69GSF1Rl0JWY18cn/NTd7NjSXl7
         CVU7oEkbGFohJ3sLaFO6q2lVlOWVw5/E6RbKJit0B5zLAXvM9L/ShpRP4fsjgtxTWzIE
         Jt6T575muS9i6QHszzdq/6nUFcoKMUD4FwIqL4VPgzCAIoA1aWdbgbmpfs5BlbeA2EcJ
         5kRA==
X-Forwarded-Encrypted: i=1; AFNElJ+74RzRSDJYM1oNw8UJJh4z5uI+xulVIXBZ8vccgTE/sqGJd6NgHkDqhjysCHKDsoUsDT5BMdpoz3Mq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0oElx+e5u2vLR7lm/X4jU0BZAKCjwEugvx4wyaXaqxNX9ShRb
	vgLcyJiYNQBoyNHGxsOUQ7Ym6m1pPHIOFcmPmjdU/MQgFBjRYTm8gGn1EBSNTPYKo2QWx47kW47
	L8Jp4qu7TQCuWvChRQg61a+oISUamA+4=
X-Gm-Gg: Acq92OGzlbOEi+/9/fGcTLqC88mC/Vru+pFJwd2TVCcTE2CR3lnh3Blzeq/xQH9ZHmW
	OtiuQHdANFFsMhmp0SAY9KwC2EIfFk25ou4lF+Z9aqh2eLTjvR0jhUXQ8iJhtivhyL/Z3HdYUh8
	+oChlUVCjPARRoWYJZO1WJZyUy7Y4E9V825RubAjaNEUuw36dAJ939FjoKGC21c2xOydxDC98Wb
	NVQF9KyPSsF4YqI4xEDaQQdSfctWQ7bV9nQE/4l6q+yMRSQxeN8W/RolKylUa590L5o9fFkBXzi
	fB3u3dQVda2nnD6+CuoC6n8aAyC7QdCuG0MbwqYqxA2WNjUEjV7mjSHL3F4uKyRpcIm2rEqtWX4
	sn7BYzA==
X-Received: by 2002:a05:7300:2316:b0:303:a1af:5042 with SMTP id
 5a478bee46e88-304eacd38acmr1536564eec.0.1780059198197; Fri, 29 May 2026
 05:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524085312.15369-1-kimjinseob88@gmail.com>
 <20260524085312.15369-4-kimjinseob88@gmail.com> <20260528144853.354a71e7@jic23-huawei>
 <CALMSew+wUH1H-2MTtexCFgyD4Y+upFuSfFzTWBn3VGN6CWYFNQ@mail.gmail.com>
In-Reply-To: <CALMSew+wUH1H-2MTtexCFgyD4Y+upFuSfFzTWBn3VGN6CWYFNQ@mail.gmail.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Fri, 29 May 2026 21:53:06 +0900
X-Gm-Features: AVHnY4IPPhh4OolSzIGZ_CRDIofNCpXhPUVz-GCUtgihrVwln8rbJd6WVtVvqI4
Message-ID: <CALMSewJk7Kt-o99MJVFLEHbLwRqcnJ81XHbrfs3dy8VFgssTsQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/7] iio: osf: add protocol v0 decoding
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry, resending in plain text.

On Thu, May 28, 2026 at 10:49:00PM +0100, Jonathan Cameron wrote:
> https://sashiko.dev/#/patchset/20260524085312.15369-1-kimjinseob88%40gmail.com
> Has some perhaps useful feedback. Please make sure to either exclude
> them as false positives or address for next version.
>
> Quite a bit of the feedback in here is about which checks are actually
> useful. Normal kernel practice is assume we didn't shoot outselves in the
> foot but hardware and userspace may have done. So we defend only against
> things in their control.

Addressed in RFC v3.

I reworked the decoder to focus validation on device-controlled fields. The
v3 decoder now validates sensor_type, sample_format, channel_count, reserved
fields, and payload length overflow cases.

I also removed unnecessary internal-only caller checks where the call path
already guarantees the arguments, while keeping protocol and stream boundary
checks.

> Similar on whether this defensive code makes sense

Addressed in RFC v3. I removed the remaining internal-only defensive checks
where the caller already guarantees valid arguments.

> I guess it might change in future, but for now why not make samples an s32 *

For the variable sample data I kept the wire-format decoding explicit because
the payload is little-endian data from the device and may not be naturally
aligned. The v3 code validates the format and channel count before the sample
data is consumed.

> Similar sanity check questions.
>
> If that happens seems like something went very wrong elsewhere so
> seems unlikely defense makes sense here.

Addressed in RFC v3. I trimmed the redundant internal consistency checks and
kept the checks that validate frame and payload data received from the device.

> This one does belong in here.

Kept in RFC v3. Payload length validation remains part of the decoder.

> This check is fine as picks up on bad hardware, but why keep
> the value of reserved?

Addressed in RFC v3. Reserved fields are now validate-only. The decoder checks
them for protocol compliance but does not keep them in the decoded driver
structures.

> I'm not sure if there is a way to get here with any of those failing.
> Generally for kernel code we defend against this sort of thing at higher levels.
>
> Same applies to all this parser.
>
> Likewise, I'd expect this to only be called on one that exists. This
> defensive stuff costs us in complexity so only do it if needed. Do however
> defend against values that are coming from the device where possible to
> ensure they are consistent.

Addressed in RFC v3. I removed unnecessary internal-only checks and kept the
validation for values that come from the device.

> Why keep it?

Addressed in RFC v3. Reserved values are no longer stored after validation.

> I think you are setting them all, so would be neater as a designated
> inializer:
>         *entry = (struct osf_capbility_entry) {
>                 .sensor_type = get_unaligned_le16(payload),
>                 .sensor_index = get_unaligned_le16(payload + 2),
>         };
>
> Same applies to some of the other structures filled in here.

Addressed in RFC v3 where it made the code clearer. I also reduced the amount
of field-by-field copying where the decoded data did not need to be retained.

> We don't need to match types with original data so
> nice to use the named enums if possible.  Will need
> to check limits though when decoding.

Addressed in RFC v3 by validating decoded values before accepting them from
the device. The decoder now rejects unsupported sensor_type, sample_format, and
channel_count combinations.

> Compared to capabilities this one seems trickier for
> types given it's variable size. Still nice to use something
> that indicates the type if we can.

For the variable sample data I kept the wire-format decoding explicit because
the payload is little-endian data from the device and may not be naturally
aligned.

> Are these not struct osf_capability_entry?
> If they are then use that not a u8.
>
> I'd not bother with a const marking.
> With that type fixed you should be able to use
> __counted_by_ptr(capability_count)  to make that relationship
> clear.

I reviewed this while preparing RFC v3. The capability payload is still decoded
from the wire format, but v3 now validates the capability entry contents more
strictly and avoids keeping reserved fields after validation.

Thanks,

Jinseob
