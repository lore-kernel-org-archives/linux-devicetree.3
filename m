Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145C23BBA0E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789977003; cv=none; b=hz1FQqXJJgVh9pC+Hk/6ge37ULh+vc2NDpP3RRNpzrjDR6QS9/td+so0Y2VsD7bpPyWmTo0+m0Mb0gYDWFKaJbM/IZryiGZNwmxoVq8lasg7/kMzDDZuIIJI/jbn/RxOQUh+10sos04K1pt+SXzc0MATsVC598sHdCzvAOyPS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789977003; c=relaxed/simple;
	bh=Hygh9yjLTAw14bbP362MY2rWRpJP0PkurR+442/BpWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0RFXAzYmoewXWgccMZABqWkWRKJI8YX6EvVxrowUSxdKacK1aUroP9+QeGBBfUH+d7uG9aqPdr948IllpiLY7Ipk03gv8Maa9kE5WNTI9ZappTuvilQcEUau8EgQ0j3s6TM21hGhUr63u5W8KglbAP0LF3O2RTU2kbD0e/TyQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPJoAkie; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPJoAkie"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so2186765a91.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789977001; x=1790581801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hygh9yjLTAw14bbP362MY2rWRpJP0PkurR+442/BpWU=;
        b=fPJoAkieRWZ1mglZeFgUnLsmms0D2sAUhvTUQlTx116PWPiNFlSAsBjf8USd3pDQpO
         oLV/jMYY1wgaxx421j6FUJexrvQS0dYwAfQ4rmmyK++6B1b2vec/xYox9rrRAWcNnbO7
         SkH+mIKjFHYu4aGl+iIyn3YXje+kCMgjRAPyiv7E9ySYMAm3dO7XfiTmaA/SfX8rpdt0
         r6+yznVEnfXjrj9HQCqFr7loD8Lr7w+y3QXgQGz7uDIut87B3hw8+7OJVfPoyVbI9Jtu
         uVxnHRB6gEbZUZVLxbG9ReunxK5GXOwhHyd4t9widqbh1FuCjbpLbSEZ7tX2Pl2trLFY
         jWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789977001; x=1790581801;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hygh9yjLTAw14bbP362MY2rWRpJP0PkurR+442/BpWU=;
        b=Sq59LZ1hP9gJj6kGr54B+dS35pDAnj/tpc98S8SNVT44/7SND827NDBs8PJ/ghIhK/
         Ft7OZZYsyd2lA/W94apCBz1F8/d7Sf5+08PIecnh01HxDcC6Net6TroNoAGuVdfeQSjB
         upiH8bohp0bp2fH/kz7hN5VVRhDjw7o8r7Ap3eJhq+89WdEDseQgyZQbA+iC1JWvJMI9
         zsfTlBq7c3EJWPpeKoEPhvVAPe90R8XbTtJipp7CZtqttXPVRDxMuyEUH5fRIT5y280I
         6fAqtwJN79msS01upMFl+66uI6UwsXTdMLgaeu5AJhVPuhJ67SNMskS5gaIlsrMiGWMN
         9BlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxIRdmWcF1JNwHdSHa5/G0yLdUBBza5ZymLFbutn4SFxko7hjAyNdl/T/MRKWxfrij2CIGMmdwVISr@vger.kernel.org
X-Gm-Message-State: AFuF++mXQp/jwEkDrShaHpsDMch7qqYwKCemGxKgD8s1A83TIDp7VhYw
	BbyfsMUZQp59e/iLo2jVtocoWNdSxn5kAkjV+kgC1NN5KTZT6vYInRhS
X-Gm-Gg: AYBFou3pG5mItDGYFE8/BgdXwZdK4/mBq0j2ENWO8T0MM4SFhsQGfRXBXyF8xvyeLJM
	WpdAigIcJsNWPyrGi1C0/s80c5y6ZROiO+zlGhVQiZHxVvA4axjWco3ohoZg+xgb+NYFKt/cWXK
	aXVM2fnQg9MFtAZ809ZNhD1Etb2bOwGCF1FoLd1kgC7dWpI801hrjjIpm2T6bWCWHwNrq+CN5pB
	tEA7q5tnQAFP+KojoEXUmKJyLec0bS4/0SBqBmDqV3pYiadk5wARznFxs1dlvi4AsVDof2DjGUm
	zxcvY+LJNHzYVtl3RtUfbJ8umfHx0k23NTYQmTZXQ4DvReIr1BICDfZKVG8C/GvDIP9Z9UBy+0L
	hIIl+65W53ueegA3qxBpYTGzZkEAUyqqu8aFUAiP7fQH5j192J5PRUC+BCEKuWsbyTPAhnd6BH1
	dQurrVeNjSZv+ETuvYqwtK35DTRpeiRgq9j/qXxAmp7/rIghGiDwcOYdc2vEYFb9fhrOa3sXT8T
	ZXjSArEa6n8a6L8PVk7j4NRTnG3DXVhhH8KXY9KCNHgOrjhWD8iUvlZrP/oga1o9A==
X-Received: by 2002:a17:90a:bd0:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a022be0af7mr5110747a91.2.1789977001038;
        Mon, 21 Sep 2026 00:50:01 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a041b87bfesm5623407a91.3.2026.09.21.00.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:50:00 -0700 (PDT)
Message-ID: <b589c197-2297-42c4-b017-3594cdd1cd56@gmail.com>
Date: Mon, 21 Sep 2026 15:49:56 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable
 clearing FB_EN
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260918030125.315978-1-a0987203069@gmail.com>
 <20260918030125.315978-8-a0987203069@gmail.com>
 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
 <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
 <cb30f57c0ac124aac85efad32626e6182b9f1369.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <cb30f57c0ac124aac85efad32626e6182b9f1369.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Icenowy Zheng 於 2026/9/21 下午 03:30 寫道:
> Maybe it's better to just make it the 2nd patch in this patchset, just
> after the binding change.
>
> Waiting for something into drm-misc-fixes again will need another fixes
> pull and another RC back merge, which can consume weeks and miss the
> current merging window.
>
> In addition, it's possible that `drm/verisilicon: introduce per-variant
> hardware ops table` also gets backported for a more clean primary plane
> atomic_update disabling fix.
Understood. I'll fold the FB_EN fix in as patch 2, right after the
dt-bindings patch, targeting the current vs_primary_plane.c directly,
so the ops-table patch just carries the already-corrected code forward
into vs_dc8200.c. Agreed that's faster than round-tripping.

On primary_plane_disable_ex - I'll keep the "_ex" suffix. DC8200 still
has a real per-variant operation there (clearing FB_EN + commit), while
DC8000 leaves it NULL and does nothing, so the suffix still reflects
an actual per-variant difference, not just structure introduced by the
refactor.

While testing the cursor plane, I found the same class of bug there:
the disable register write was being triggered from the plane's
atomic_update() invisible-branch using the old plane state to look up
the CRTC/output, which can be stale or NULL on a plane's very first
commit if it's already invisible then. I've fixed it locally by having
atomic_update() derive the CRTC/output from the state it already holds
before checking visibility, instead of falling through to the
old-state-based disable path. Just flagging it here for now -
vs_cursor_plane.c isn't touched by any of my patches.

Thanks.
