Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687273;
	b=oOF3nYnn9UhX/zua5iGxx+EsbNkd1/V4D/us+AhLjaOdXcu819L/HZrYQeE2SzmwGexn
	 Z8Q3imgfUNU5Lsvn9J6zY3emzM7FEsVYlWPzftiMfgI2TChJT3jNlPLoO693Ec3gzCkiP
	 VENuGM4JoGSOhGQjppyUw5o9nj5xHPt0mOVJbCs1iqigbTEK2ciJK3Y1ekyhmvNqaxrLI
	 +84HqDpKx/eGvDJ2ZGowg/keIKfT/mv8u4EwKH9UAEvlqL//u+lFvr69V2sG2M9ovclmt
	 m1J7BXmM3cgjN37qJSf16OCRLXVV0T9nIukz5ugwqbYphF30vtyA8GLP0m0LutR60Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
	b=qOAmw0NH1T/5WobIYdG27c7Rv4Gp6hqj1hm17YnlglLESgNlrZg6jAXu7/HCf8fZicra
	 xcSgrwXi7pp+H4XUBj5nH0IfWpImjzdgWJiX5Yqbd61du14jrFD5QZNcoB2EntMMb5c4Y
	 dzzMwq3/6SKOdEly/usZIZAqatuqgRRscki0iqwyXuud0c+TDhyapUIL2gTgSfaI9HX5/
	 +u5/dgDWSj4A/rG99E1E9o6gQ+hhVsiULZQPJ9MTNV7Ky9QDGlmiUwgcxk1N0x9HDb+iY
	 quljO7KdAcFHBVRwHA5Z3aDqF7jee6Ae4C31pLG0/O7l+ewreJoGzGyg+bY7SiKNcAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LGL+MJ0O;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F9B606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F9B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LGL+MJ0O
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a594d313a3so4544385b3a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795687272; x=1796292072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
        b=LGL+MJ0OPmAso0EVacerztUnAtvIZ2EUwLYi2xOHBoMu0OVHlDiq/tSehnd7MMbLui
         e6D1rVtLQaCwky7QohNEBNr4dLcpfmQX75iASGie4sK6bgAk976ILi7busCF270voK7f
         Jb75xjmAmA44oCiHl2XhPVWYiMBEoEOl9ABB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687272; x=1796292072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPAOj8/sEiImf5Q5w0lmK7mWVF1uN6/NWzG/i3miSOs=;
        b=SCyfJw7o7ZSTF/JmJC+w3WSPtUD5BS6qFjIKdtPPHpACvDdgfP+8I1b+chDXR2oFWs
         BWC0okg/nAMwiLosB5rWXGRN5WdQA3CFp+QWkYwtPJkjZQ6Tju6v84dzi/XNouzlAEju
         Uq71ajeEBj+HW6n6rMwLpcZEMeqdCzQ0JUwc2NAgf9WojF7HDQYa/3LxEz11J4SG6RhY
         GQd5kXUpFjlPCN3e0rjmoLL081S9J3AA3R+r12Wd5Xs5l8xPwZ5ht9zraFq3QdSCqSnr
         dbm/IK6xMX4oyDrIgtiwMhWoXv4sg1zKXYjahqrVHmuY3p0lpAbx+TUrjgeBr5X2oQDR
         ZteA==
X-Forwarded-Encrypted: i=1; AL+hErHPuL7G4Gd1E/mZ2MA2SCnMaGc2ubBfdvOv/RQ9AMsJnbOruJvWvfObGwiqZJMm5pW9ueFDfPs0zy9K@vger.kernel.org
X-Gm-Message-State: APuU4Z9ke6ryC0lJySJNZXYMJ0mJmLk8UmfV5nQhzqOoun3lmJqYQsrL
	gUhWFZcG+nEWXDZnozUULo8TXBZXBOtYBUzyJ3pbxudEZ+WLzNfhfj5SsGd2i5fj8ZW0jmcn+j4
	KDFAj3Q==
X-Gm-Gg: AZFdTZfBsB6ucvHMsffQU4iXbSnqT+eY1EAJMsKj5VkJRGe3/oUbt2odx7HLGlrfCQz
	Spw0mecvWa2QN9kusicBo7dFXRzVCwqVnCfoLdRfcFa0zOdij43b60vJ69Ato4CCJV7sbH5AESf
	yGoSr9FwgfSfxwGmU9KWDrIYIeSC7S8du2P/HKB6npMhEyfeTAVzhvWQLSOwWZNDaKsMxt3ig3/
	a81ZZfJXeeQt+RBbHgbW1zxbGaUfIgM6E+Z6BvReejlO5MwPZJs37ELKZ+OIUbxQuDFw/WSSZi0
	AcgjwNvljXWMyZIWM4xiiJZQLTZuZHKCSuLnPUAhBU79bQOQGfl7xnGnshtHeOV6UBp04BtjpHA
	YW/Fy8LxA65bLFVbK0WL7xt5sCY/lvCED2dXkjbW2C6WNiRO+DsxiAkO55rqDm+/usB3AjenqiB
	a3U7iSz41l4nnJbKSPzST9jhtgUIYL/NOZnxP8vMhWr72iMDgU/tnCSba2jSg8/vUaHmh3BYUL/
	YSoRbIKPofCctf0LM7HDQACYemzsg0ITCLHN6qlghC6DsC3R0Ycw7GayO4/j8AOdoetv5NiDG9g
	5T6UsX8EAy5rm1W2hcz22ESU/Dq++F3G4pR0fxVulPiGICev+nAxPgJB2URBBWA4G6E=
X-Received: by 2002:a05:6a00:1485:b0:887:1bcc:3c25 with SMTP id d2e1a72fcca58-8c87d32ae7cmr19923341b3a.51.1795687272084;
        Thu, 26 Nov 2026 02:01:12 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm10355756b3a.13.2026.11.26.02.01.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:01:11 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4469647eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:01:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGvR9uScy7zARAUANapPrcKpjbovabI863CrXRZ2GCBexjVe7+mTl/d2r+jrNqYsCiUQ8ZXjKT7NqGd@vger.kernel.org
X-Received: by 2002:a05:7300:e9cf:10b0:386:e571:4bb4 with SMTP id
 5a478bee46e88-386e5715040mr399450eec.13.1795687269562; Thu, 26 Nov 2026
 02:01:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-36-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 18:00:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj8rJ0WJp7DcO68zyejSvzFhhB5Q_q+_jKY2itMAJ64eA@mail.gmail.com>
X-Gm-Features: Aa3M54r8mZgCPYkjyk_HhGWN4kbWoWQVSbV0f4Pj7KzdyzjM_U47c8LDiim4nPQ
Message-ID: <CAC=S1nj8rJ0WJp7DcO68zyejSvzFhhB5Q_q+_jKY2itMAJ64eA@mail.gmail.com>
Subject: Re: [PATCH v2 35/46] drm/mediatek: Add support for Display Output
 Processor component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for the Display Output Processor hardware component,
> found in the MediaTek Kompanio Ultra MT8196, Genio Pro 5100 MT8894,
> Dimensity 9400 MT6991 and others.
>
> This hardware handles the post-stage of pixel processing in the
> layer overlaying process and is also capable of performing gamma
> correction, ensuring that the per-pixel values are within the
> expected gamma range.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
>  drivers/gpu/drm/mediatek/mtk_disp_outproc.c | 247 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h      |   1 +
>  7 files changed, 281 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
>
[snip]
> +       priv->irq =3D platform_get_irq_optional(pdev, 0);
> +       if (priv->irq > 0) {
> +               ret =3D devm_request_irq(dev, priv->irq, mtk_outproc_irq_=
handler,
> +                                      IRQF_NO_AUTOEN, dev_name(dev), pri=
v);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "Failed to request=
 irq\n");
> +       }

platform_get_irq_optional() can return error codes that need to be
handled; otherwise, mtk_outproc_bind()/unbind() will pass the negative
values to enable_irq()/disable_irq():

ret =3D platform_get_irq_optional(pdev, 0);
if (ret < 0 && ret !=3D -ENXIO)
    return dev_err_probe(dev, ret, "Failed to get irq\n");
if (ret > 0) {
    priv->irq =3D ret;
    ret =3D devm_request_irq(dev, priv->irq, ...);
    ...
}

Regards,
Fei
