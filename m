Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794942724;
	b=e2bW9W/Lm3PSutpk09ohcrVhEv1aTqSm8xaI4wbtDUAN4JDxgxq7mhOibFfrw1hjk8lJ
	 EPbQrJ0/CXUbRRloRLf7cFa+8MNHXZUw07hNbmh9Ok0ofaozDqQmdkOMMvpulLLNac9gj
	 Sp6G8hQ6+5jM14PwhIuulyF90mTliM6ZY3xMhmqPKjks2Dm3E6WvahWpdHHu3chx2ROOj
	 ntRLN5Wm3BceevJEoKQMlnJks58SDrteJTaS2rlmGg9TcyqaZDaoe/4ZUPdxF1SPjgFla
	 jIgClyqW+A92xWbIRcq2A4mrblUK7dqJK9V6mlvYDOa3UNzExIVMOz7biY6/S7wl/UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
	b=shU+3/GF8/slKyaySmXXZwheY1CgF74AZbyR5IrFxBk6ZpfgOLqfS76uoC/dsXAn+PzM
	 fARODXcJGQA0GpL0YfaJBVTC0HAbctxk1h7U1CN1qFXebuB+JAV//pw6uaJsbup4pYnbr
	 VoXJnC5d7u0GbkEoOB8vmNNkoqfATeIcxfnlyIZLhAaz50QnMCb1crKBRDvvHR5H+6Gse
	 7nHIB+4vfUA7YvDCZp9JSVhMGXNWHn2TDSJwfM8kI6ARFerRXWNpLFYuaI7FThLpKBkXu
	 GfyfdR3OEgpIDWs57fPfT3gSRiNRs53GvEpYtAKsCIEQjLsfcornlhySef8FWrwzjAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTxJVUPY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6E606A338
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB6E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTxJVUPY
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so293064a12.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794942723; cv=none;
        d=google.com; s=arc-20260327;
        b=aSzM0qk88mngvZe2iwKPtFitFsm6dz53HdYXG3zUBA9dc+adEDNs+K30w1AOhU48N3
         aQ5t17aCFftlg/E5ronGxjlhjOJxO7yt6r7xS6/axRjjtPq+tkbC46Y6IWwmjTQWFnDK
         e6c3+Ge0dQlspXfMfLQvzBCkm6DYoplIdn/NCGIH/Uh352WSxlk5k3fDYBwsfS+hpxNX
         QNGNbkZdpqXb+8ZGZqh64/PmnMxM/q0jeuddb3eXbx5bWTNbrzZanZT6THiT8BvPQqB3
         VnXPBTRCvLLfgHQj++ns0TiPyOSZtVVzyR/yG0M2JszrAz68ojlIfVaU7GpLqgbA/q4H
         T+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        fh=zwQH+aTVydHThzotjixwaXESxH50YvjOqhlB5n7MqB8=;
        b=mYjwNHPFfsZlHpAhbVgM6dQyGLumcxU/PftSkRjlIOaWP1SVFYbmqQfep6CM40vbCC
         DmK9GOQ3eBKSGVqrVUjjUDWxuYhwK7Po4Z9cAnJGG6pYL7elBmCDfpvLNutm3d/vaaZs
         o2C/x9deaTmBzsIJbNseNscTLnZnMPu5gOL0hJsdh+9Ae1rEHoZfK0zakyVRqxrd6cog
         1vAeN7HkgGXMa4bdLq/z0LRyqPOY7HbtbFZQECW9KBOu3JoKipddFr1tlulDKJES4PGh
         YGnqqB8Vy9EvJ+7He76qMr/I37v7xwYWY5GrjJLhZ0Is79SRk7pocY7R2DUKQc+PFY64
         hryA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942723; x=1795547523; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        b=eTxJVUPYQeNVqYvPNfQ/zIVr91hEoyVYtGXi47xK5LJlVK2HmqlU0pTukuNssTl9wQ
         Wzc6U4MrBTPIvjXrct3384he7nd9RNucOc+BbzW49GIztEguygjsUjuGvli3rZ5MBFN0
         CXI4h5J3BS8TvpASfKs7+j2yUdBmoVf4H+/zk6Nxn2kx541JD9GUVglZW7kT//OC3EvW
         Z0gIN7aXEg9YDS6J8K1fgvCIGZBAk1X+i/FJSij5oHoJsww58itTGvnbFcPqxKm3zNbp
         cN6uKiy6XgnpUIvaxJnK3yUzdjDNMUwXq1mvN6zw/qvnt1vXxSbCZrFe7rEic+SU3qXl
         s2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942723; x=1795547523;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        b=E2vRiPCb7RgfpRUPzesjQXfBgtEFnJF4ih7pi//rC0+fZYSBQbjc4xO4zXZ6t4TqM4
         xfFAJWyOQvl19WKHDdixAVMal0yypEfX6FYGGXYKJfqQ0NO0NQPTyb0aTXurhQ7ubyRx
         dSMU5kDyCqDZ2EkiHjaXXn+fZWAvCbcNMlL2tPnQ1hfMq34O9/AEq2elBcPdqFLLPT05
         K6utH+LqMSiFrS//JNP07UPl3mbraclhjjlXbowllz1Xfoeaie0MfNIGJSQ/he+H9Au6
         9xst7X6FYloOdTuOgjgkT0/c82XPOKvLVbTbDkDT0jDIFLN5ipWTTzTMAWIfkUaQ2eVv
         gC9A==
X-Forwarded-Encrypted: i=1; AL+hErF+ago87hKoREg5epzQyE079bv2qnZIZksDF4N5tGLdICrBuKSLL8ziZYScpigoY0RH64KZmbFoCSIK@vger.kernel.org
X-Gm-Message-State: APuU4Z8l1P6RgEBnt2QWpQtGT9GuWrCjoO+SUhH6KVpmkK+c/Y7ULQoK
	CKIAAFL7ERtrzTvwXF4zUnDuFvxmHfAe+pac8YscbVhgE6xgbBSsKZxoqAVPAL1Xe/dgjDM6N0Y
	Q215I9BcBeaEJiguOpdKfWLlGPLbaLrc=
X-Gm-Gg: AYBFou2Kqly09Ozs9BO9YCVC7hyhioGQ4Ge0ecKWJ93WW9Li2lSIxgqSdzEQy/z8StL
	QESOSaMoi39K++nJ/Z0nL/1CfoUY+dTIPuHrqNJKJqSyaDB3MfTO4JIHijeDYMyiLtN0GiPN9uw
	UNmD+Qx9qiV79/68hsW8PKimVikcQqP1K5c9Of3N1J7UVpxao8aVWqFtQcmZ+9Vs97YxXECg3dH
	yKygYjChzXLxyiBd+H7cRTsMavQfQwl0+HufSGa5kmvEW1r9ty/TuQY1fp9+MEZAHjksubEbGHA
	P6YMbv/4xwxjWP2TPAEdc7yyom1Z4Q4WcCRdsjEjUAVaGHZjavVPygX8Zob3cGyc2ZXCkKqrCdd
	UHjJ5r0FWMI9Pj6fjPhNWI5QM87sOAdaFXPQ=
X-Received: by 2002:a05:6402:2805:b0:6b8:7775:515b with SMTP id
 4fb4d7f45d1cf-6b887e52cc5mr201512a12.8.1794942722510; Tue, 17 Nov 2026
 11:12:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
 <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org> <CAORyz2+wF=VDTFkRFU7jBu-zNTW7T8mnPrJZAj8ZVD-Yyr2b6A@mail.gmail.com>
 <53298044-3595-4231-a498-d78052799727@kernel.org>
In-Reply-To: <53298044-3595-4231-a498-d78052799727@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 20:11:50 +0100
X-Gm-Features: AclHuK_tAaAmV8XPp2n_nIuVB_4g8FKHhKrmOBsZ4DZheY4_R5_9zza4TO_AcK8
Message-ID: <CAORyz2J9HrKr5JU1rigB7apEUpHg-P_ke=STWz-_sn64afqQgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> bindings and DTS should be complete

Thank you for your patience, I understand now.

According to the current mediatek-drm code, aliases are not really
required unless there's multiple instances of the same block type [1].
On mt8167 this only happens for the dpi1 block and the rdma1 block. It
should be possible to introduce main display support without the
aliases with a couple of changes:

- rdma1 drives the secondary display pipeline; it can be omitted from
the DTS while still having the primary display pipeline work;
- dpi1 is used to drive HDMI output (not upstreamed yet). I can omit
it from the DTS for now, adding only the dpi0 node.

With this approach the DPI bindings would remain as submitted. Once an
appropriate mechanism to describe the blocks' indexing is in place
those two nodes can be reintroduced without having to change any other
component.
I have done a quick test on my devices and the approach seems to work.

Please let me know if you can see any issue with this idea, meanwhile
I'll run more rigorous device and DT tests.
Thank you for your help
--
Luca

[1] https://github.com/torvalds/linux/blob/666539eecdf4db623f5e3c3e55cf9f2dfad24aa4/drivers/gpu/drm/mediatek/mtk_ddp_comp.c#L566
