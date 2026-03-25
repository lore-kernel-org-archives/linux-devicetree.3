Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA052882D7
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774407781; cv=none; b=J5wXBGgX52A/uvIHUaFiYG9gdqOBdeaZLtaCtVO7vZO98t9q9v7vZPyA85bePz2K+bFhaXytpjR8VZKEws2K3RW3DSmmk6bgOOmiXDUT/9/5YHmMPcsp8oVX4Rz+uAoMXC1tGIcjI41/ecyXxnJBm2ixL+6B4fZto9t1PnF6Cd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774407781; c=relaxed/simple;
	bh=ciVx9jHFNYrHDZGtnQDQQLsYePwgjL7ss9dD+19+xhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9B+BUx6jZmw7SBxz2L3vLKi761YdmkW6EgC0Z09HctG/pGrayhPrdSPTTOuZ1DWFtzBcEk98IeidPAeN2Sen36T95GkYRkymnp8wILBNw0a7yUeLdVfaAC2Spseydo6l5aU5eUZMuqtZXnA4mX8oLuhMvHk5cs37KX7KuINvDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQB/6zPb; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQB/6zPb"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128b9b7e3edso10759190c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774407780; x=1775012580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvHvghd1xcxSMrHBMQMHxfVnj6Gwc5uE+5un2zwivFw=;
        b=VQB/6zPbQ+7iYZFFKaIugChTNATN3trHWSSag4oY9X2/OUIRQ/JOqUlCOC9J/WUxJq
         sfNRP8JyW6F4e6zXJHc43Dlby2F4mEOQebrSHMm3wAQNiQbIOGbnMZsWQWSH3lyOIp0J
         sqqZnZmlgW+kEhga65LDOttj6jxrlXEQWY1+LTYgudntehde0cTPx9Uc/08CtNsUMYEt
         VCl5E57E+CaxKggjXbLNmJzQkV+FTqbGiCZshXRgy51zuZFtQZ2tpnuQO2d1GIbO7qkK
         Hp+cVQ/+hzOnGN7JUjDdYkLIP1gl4SkQon8UF8au+O7ZGxEBpKwti35KPjurE9QTBc7a
         v6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774407780; x=1775012580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvHvghd1xcxSMrHBMQMHxfVnj6Gwc5uE+5un2zwivFw=;
        b=lHx4nLs50ATLDTdR9TiHlg/ou00sL5+rM2Q/FBf2mNrg42iig+UwR7Y5drPKCdjiHs
         dgzvRpVv3D9UYk9kCVlKmnr0PqAissl4JXDy3+fadT6b1zO7um6A7WNakLzuhsuJhbTu
         fbKDWBzg0WemVu9H4KEd9h/l0JHc1oz8oPRjJ+0TYr9WYsFcJ3jBfPCtTqM8zuZx2vMt
         KwQUZQx3OIcSCkcPXqK8XM7Lwsn6R60yTCwEH6VQsqzIiWeZobC+MqZirfhCgD6DtJpy
         jzjgKFX1as2OKdIdr1kwQtspFJsoMKEFcReG6xW5vrpMUVWbNy25R20G08XBnt1GBuT2
         hkHg==
X-Forwarded-Encrypted: i=1; AJvYcCUemmvyoNEUs1zkw/3TNiFFif+w5rIJOEbDak87EzEFb+cMbeu9Q9O53aJcKDaTZMunEKOWxbpETZCy@vger.kernel.org
X-Gm-Message-State: AOJu0YyDrSjxAqIenpuaymtC/kmyVgjzdeXocU4uK/b9qFOtTsx7HdbM
	bJ9CltkWh8tdTlRxwJ/8ixSYoaC8aoRslYCPDRW8dB4PCCHFfWEJqkW9
X-Gm-Gg: ATEYQzzl07zpMjhkZaMOWTk4+cfnpAsb0baGa3oqr7y/zQTxfiFOwL+nz2sh1iGc8fM
	icQzGtBayXaK65a9Xcu4CmiA1HAtPnMuBvsx1MkVTQNcmieN/XKfmr9DPJmInNplVwR5Na8HCR+
	sHB0xiqvEDQeA2YGPnvP3aktZC771YxR6lRzTxMGZ3qnPQbTQFbwJjdMqMAAQrROQTF60VMcUig
	m/IdgIRonlEZuauC3tdZJeKOFyVFx5cKJOVS+qowQqo5L6n4XUeJvuc833qj4KLgT+px0cMkeV/
	qpHmkUBVjuYh1pFmhdjceMPZsMjw+KUlR3yavlvwcwmCGjdUYu/JoNV/sGpVDHidq5ocHcA8jwQ
	K4zRuTcE24dqxFLNmEEIYHSDDETGBlfeKeu9PjuUGxqh/3MJfOTCTQIFX9oo2oXRZsuhUoSDLiO
	l7c+Trgi5GeYWjJO/W3eONWct0SulP56xPfKsfYIrfQffPLcEtmJv448yhIYP/AZqW
X-Received: by 2002:a05:7022:2220:b0:11b:ec5f:1c37 with SMTP id a92af1059eb24-12a96e6afe6mr1029426c88.18.1774407779571;
        Tue, 24 Mar 2026 20:02:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm22668916eec.4.2026.03.24.20.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:02:58 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:02:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3519
Message-ID: <acNQW9d_S1Zvjtgj@google.com>
References: <20260314-edt-ft3519-v3-1-5ee91b408ed6@machinesoul.in>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314-edt-ft3519-v3-1-5ee91b408ed6@machinesoul.in>

On Sat, Mar 14, 2026 at 08:27:58PM +0530, Bhushan Shah wrote:
> Document FocalTech FT3519 support by adding the compatible. It's 10
> point touchscreen, which is compatible with FT3518
> 
> Signed-off-by: Bhushan Shah <bhushan.shah@machinesoul.in>

Applied, thank you.

-- 
Dmitry
