Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EB3EC6B3
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 22:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787006920; cv=pass; b=jWdi7nqgrOi+ijXcRuj4glnfJuXm83M3U6lm3c2Irj6AdlSkL9R6J7he/x1j/gxbe6VIJDgqtdLwZ+rY2yRutXFFYVAn+273AXtKMh/JMFWinBpb4VbEHbkzzpJmXm1bZL3s1e4OToG7isqXRl/8RxHv4yICJJY+46Y9kpbim8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787006920; c=relaxed/simple;
	bh=q8RULe1QAJd8R3K15o5RctOMaBUubC8V5OsER/7e59o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hALQlZF1CGvmUI6UPn32C56Y1Z3ynuYZvDuQsj84oOBIZru2BOlXZOrPvufbj5Y0tArwlrV/IOnUw7NiyVbHcJuqigFoFJ50L1SB9V5wOlfFVMltXIOIhjbJwbvDEQ6CjDfh8eAZ4dBqVsfyxwlXwPSZXlq+02qXaiby67lRV0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzDYYo1L; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzDYYo1L"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20e70a0962so523614566b.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787006917; cv=none;
        d=google.com; s=arc-20260327;
        b=rV6u5huG0PyDc3Gk0/UL7xwdr6PcwgDdrzpKNWi7ymeJNckEUBl0z4IgADhLMyzW+1
         PiaDfBT20Tvthvo5VYrknrd2cmzQc1GUFlQMyHTw/ITxp4u1py+dzl670f/Mo9XMLPHP
         LqagMZGZIQC9w3kwGtRscaVbGwFQaEtKgPbowqcidB6qvAC9j9FxTOlVzCCx1IeDPIep
         Hvu3te1zLxRB5mrjV+V9ol0AtAY4DWt72lEYjTLw3wXOKWs/beO8rOTysr0D/9UHpysX
         fH0MFdYzsnKUg+x4Ccd5DSXoiUlnM4n29bYA/XfVKL2H82titC4DhIACpOjllRv6m8n1
         d/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q8RULe1QAJd8R3K15o5RctOMaBUubC8V5OsER/7e59o=;
        fh=KE0Xm1F1u/CHbyL6kVgy0XcX0flq2kekByYHomFS9TM=;
        b=UhTT5XA9hJyc/AVffNFPPIohN6kRFDAdaCn0clHtKWshRP+70qh0IGQjki4GzkPvsf
         IWbIIppYuic7vL8ihrTLQUkeR6C0Rfx2TprWnYsI3WJJsUytaioig6wdB1Qwjfj5bLGx
         jg5vHuLQX94RfG9bIfJ7RuXLM4PS7rQlRn6oJi+UCOMzAKV/WEwST3oEgcu5RIglvo82
         50uaP3g/1MGEv/xw+uBekK+aGbnD/0ZvzOJgvHkyxT9duClgKP18kChAw2EgyTXLXyAx
         2llE0Di1T8Dae7WLznfGpAeMN9J5pvmwzRuhhZp9IYMqtTPk51XAay5C8DWJbIB8MzLX
         nQ7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787006917; x=1787611717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8RULe1QAJd8R3K15o5RctOMaBUubC8V5OsER/7e59o=;
        b=dzDYYo1LEmDAAtEoyETmq9YTwfuqkzZRIA6redFFfixVdtFns9rruf9LIWI6A+aHGW
         +2CKSWycMizrbqMTu1dYPcg5X4XMqNbnfgABZERu83/dvrs2rJKy7CmsBdyUVyKrlLN9
         G35+TQtKM0a5Bl7LyF2HAHILHGqFAMsTXZIJqxT2WIdY7tB+KFWCUyvkuBt+yOWYzVWb
         gSR9TrpfJg5I6iHUJVCXgDijnBXC5pmZqOQlfZODACmTudd4ItIrQ7FFNBduGFQGNlbv
         NYY/svFewepxwJDPQsndBELegWRaTiPbd4Np2WBrFC2UEiZu054J9xBEFjBk3n5zP0pg
         Vo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787006917; x=1787611717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q8RULe1QAJd8R3K15o5RctOMaBUubC8V5OsER/7e59o=;
        b=sSkFM6c+SQHvQ2yI6VQai/t7iD2dOgaqxgmWUkCWTOSIu5cE5Hdgum4vDYGgTQAkfL
         4PbCFgCNPbJTkmP8kxVqXHK1rxKdkXqiRZpu3AKhxDBzdP5B67IrSycWnQ9SYYKTwjnG
         bDxjlwNAguhiLz0WwlK0RoVt1GMvWY2BxwUf4om9rmUNMfi3I8niyAExMf048o+2KBSG
         g2WBI33XOCpvB5rKk0lh1qtob+1F/cE2qCrf7C+r3deG5G5HcNm/8rqAZL4yHLjCOoF2
         2XLFQ9uUTGzEgSi/d2lRcbtpIqD53aKNSVCSG1ekzxtF60FJCyAbKBZsf9dveQouj/2P
         o7Dw==
X-Forwarded-Encrypted: i=1; AHgh+RqG6tRoZdikDbtusyCMy6nd3GoJg66hbOE+4jA69VVYDj5izoBK/SSHacg2IyD+4xb/koPJpfoaLA+h@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYp5vCk5aKIfuENSCf63DZUsIE2Xacd5LM/jGPbVmNVCoZrDO
	283Pyg2CB6P5v/WCIloeGJTwWmNMU+X7jaToMQRcMEd0RsVAMRqCM/Que5Os8XnW1gGaUKTD8po
	ZnJvaCgghFgArWg+4Ph1XbUJux3IpID8=
X-Gm-Gg: AR+sD13fUxyzTpEeTYZz9GoaYgJhgGl6IIlQB/dAJ2pIiWeJ+cLJuMbXunIWizEHw6x
	i74W3H1Blqs72nY6XYGG+SvHvxZ0hf+//2TzE7XbTJwExiZFgZkbBpF7DbpPSYj1Y6irU2XwWeC
	74itb/3CAbrXbRFLboL2D3zKTDCfA7z8/EQutRwgiGqNR6dRqtnpMwScesb+eDnwQnXw0pbpVf3
	nmSmPPNx/dsCxsO6whvm9gzXxtC4HgLmp1frXyRR9SMniS4IiUOK+vtReAu62lFgNr01vtfopZB
	OG0+2cYKTs+8375ToodLzfFxJqk8P0+m8gx9h/9vqga+/94oIJhLVUKI
X-Received: by 2002:a17:906:ef0a:b0:c21:61a6:8825 with SMTP id
 a640c23a62f3a-c218880200dmr169252666b.22.1787006916867; Mon, 17 Aug 2026
 15:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731215043.30392-1-maximpedraza@gmail.com>
 <am2mvECnCcO9IxuI@monoceros> <0219df57-06e3-4776-afb1-d167cad2e795@gmx.de>
 <CAEUXW=GUY+x1A72n99i1Cpgy03jTYv3FPAX5nY3DCHqmeq9YVg@mail.gmail.com>
 <20260810-devout-pig-of-performance-595ccc@houat> <CAEUXW=GuHypVE5Xre8AQBmkrcUbPQxh03Lq8os=kjcLeGahOgw@mail.gmail.com>
 <20260812-neon-asp-of-completion-e9349e@houat> <CAEUXW=H-o+fqBjH1UQG7=UTm5x1a9Cj++XJM7twvFU4vJC4UrQ@mail.gmail.com>
 <20260814155325.GB516994@ravnborg.org>
In-Reply-To: <20260814155325.GB516994@ravnborg.org>
From: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Date: Tue, 18 Aug 2026 00:48:21 +0200
X-Gm-Features: AcwNN1VaOzcnJmtGbApjtL8xLM_RPNeMVubTf0qJSVEHqCGDhHuSQ3SwYRF67bI
Message-ID: <CAEUXW=Ffs+WKsQrNc3zjwtfAO=FKTf_7jQFovD+yjmD_yJuY2Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Boot logo supplied by the device tree
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <mripard@kernel.org>, Helge Deller <deller@gmx.de>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
	Francesco Valla <francesco@valla.it>
Content-Type: text/plain; charset="UTF-8"

Hi Sam,

Thank you -- that's a useful pointer, and it settles the question of how
a splash should be drawn without fbcon: a DRM client at
drm_client_setup(), next to drm_log, not a drm_fb_helper hook.

Francesco's series is genuinely inspiring work, and it would be very
useful to me if it could take a CLUT224 image -- unfortunately it can't.
It only accepts an uncompressed 24-bit RGB888 BMP, whereas our logo is
paletted, which is what keeps it small: 17 KiB for 800x480 rather than
around a megabyte. So as it stands the format doesn't line up with what
we carry.

Reading it did make the distinction clearer to me, though. drm_splash
*draws* an image into a fresh buffer, which means a first modeset and the
blanking that comes with it. What our hardware leaves us with is a
framebuffer U-Boot has already drawn and a CRTC still scanning it out, so
for our case the natural thing is to *adopt* that state rather than
redraw it -- which is what hardware state readout does, with no redraw
and no flicker.

Where drm_splash is the right tool is the case with no state to adopt --
Falcon boot, where U-Boot proper never runs, or a handover where the
buffer doesn't survive. I'll follow Francesco's series for that.

Thanks again -- it helped me draw the line between the two.

Max
