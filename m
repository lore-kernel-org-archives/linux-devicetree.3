Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762D83803C3
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307268; cv=none; b=on98BG4nOOsBi+xW/0jpIAs/CEKneQRKyvNerobtH1qjuYLZjBeuEooUkOb2Vrk2UyPyppUMH1t12XPR8xIVIKw7ByQAVxKF8/Ihm0k2FGV8qep7qtrUmHinZHtsSo6RMiiegX+UYz5rAOTz30AVx3hyFMyQwJF67coa3u4XxbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307268; c=relaxed/simple;
	bh=Dm4u4C0mB5op9qaZTgebzihhht99CMEurS1Nf+yKzBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CC8V9K8CryQmInVnJonRqdlnwT705LI2k1LQ0bpFHcMYN8Fei7BexN160ifCkvwOwjyxyskEiTexIrBrVo3ZT9rXXgIoufdQ71+EkihUtnBkNi0GldMrJJK+EblstRsvuRxOgvHhwA5i9fll40VFuNYGdEpw8iBhDK1D9GpvrT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9fjA4Nf; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9fjA4Nf"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so7826316a91.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784307267; x=1784912067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dUDqsx4fzu9ykyz4+5jViAQF0ipxfzs3eZMGfKTlNcI=;
        b=G9fjA4NfabI0rXZXEqxY/ZRAlCwz1sLfNBi1cEIjcl1AhHFyFmwkc+O0WE/olS/2dz
         rXf26PCDyOka9pfPYwm6XzVJAb/jbZDr3uXaooaq1SdzfV+LqELCxFnogyaqZOp7rni3
         JizL0SoMkU/uHiOGzXATAI2vxwI9QEifBdOUt2796a0o0nqDWarn2cRF5RVWFeba4Tl5
         oe4D0kODtXekMlp3FFKIkSE0j8Dbx/y1K/8Ax3y8GD+bS+BH8PaXcpgSczIuLdK3nnTJ
         6lUsbIKsoVnpTuXFPULEDjysFUqdDRfxYS3qrW4fCKMMqll92mO1MDePDfJN5BCdJhDx
         TvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307267; x=1784912067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUDqsx4fzu9ykyz4+5jViAQF0ipxfzs3eZMGfKTlNcI=;
        b=H7r85/5h1NNYV+yiS7Q4+RTZU6uueKRdAIVQxvTN/2s1BfBOHiQpbDWkZLY6XUH1lQ
         OQGtN7cMkWdhZR6t+BC1KBfkVzChsskOO0rrBEwFu6jbmUuUe7tJ6OVz9tXvHnXqnt0N
         dH6/Zi2vuyoBQlv8pZ6hYhXeCnZLTotT6nXppklD8LzHpKhMaCVrgWa4J+mvtBOEGC6U
         U9r7eIyL1ewJgTuDsZs1/+0nPiW8cK3wP43X3DmrxO80Q9TyjgXvLs3b62fPJVYecs1+
         i9uy88CUL/V1AmMuztx1ikpGo/CJ95WXHC8a2/GEjvVZ/SRhjLZlG9F2//f9b0mqXzrn
         G0Fw==
X-Forwarded-Encrypted: i=1; AHgh+RpONASyWsJRLxLx+EU0FiLJ/e2D11y2VYKGEtwH2Auj2wrbAWk0RC3tNBpc66k+Fn2h/jbSo7X62Jce@vger.kernel.org
X-Gm-Message-State: AOJu0YwbUwVKrtwL3u2ufHxUIGOYKMQlo3MulNvnffdAd64KfMiRIbG9
	xBym3yo8kRhMWvrObMcvJ7KqUrWqwYUZ0aVHMyMJy5zJ5Gv4+bOoFxIM
X-Gm-Gg: AfdE7cmbl6QFWAKg5eB0IMDDS3/RNVSZ0w/R7g8ocwiAOLWEc3lheZnIfjDeXimsVNJ
	HMPa6kQmcNbvP8WZ6neJ0vyXPU/SWMq7E5snXexjs2EwyZGObrOjk+p55aAMXiZsuyVEKE5qFYo
	sIHddhIzaw6SPP+rnepumu6a2EfzyN5yKYCDvVkrCKPb5f/aKyo4JIzYSWrJYVGBAqPetb08hKe
	KCW/7lXxWzNCYJyx4jNVoD0oAFXlpe+apnIJRoJCr4KPkCDIMNzXTymH8bK9X75PVpIWMpgPbMY
	ocKVmGhfRCs65MXY9VWWHS6qviY3pS/MXLiAZRxKwis4MASa8bXCQZpBsDE9ZhwLHwh06T3Dhcv
	GcdQJZao9jgX6M0ye3EVBBpcJ6ogA5sEO/pWFnfhulM8H4NPihW93iwdFHwKSwHSPPD2vNMhRBL
	dv6RpQNXULFfJ8NAGMw5+H75WMOU403y0bJDnOeCEfui0=
X-Received: by 2002:a17:90a:f950:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38e4b5a8c70mr3205921a91.39.1784307266731;
        Fri, 17 Jul 2026 09:54:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7638:3cbc:f1c5:2eeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm9233723eec.0.2026.07.17.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:54:25 -0700 (PDT)
Date: Fri, 17 Jul 2026 09:54:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: input: focaltech,ft8112: Add
 focaltech,ft3d81 compatible
Message-ID: <alpeO7hgp3H9ydmt@google.com>
References: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-0-5dd091e25801@oss.qualcomm.com>
 <20260717-add_focaltech_ft3d81_touchscreen_support-v4-1-5dd091e25801@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-add_focaltech_ft3d81_touchscreen_support-v4-1-5dd091e25801@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 05:28:34PM +0530, Pradyot Kumar Nayak wrote:
> The Focaltech ft3d81 is fully compatible with the ft8112 i.e.
> it uses the same I2C-HID protocol and the same power-on/reset sequencing,
> DT nodes for boards carrying an ft3d81,can therefore bind to the existing
> ft8112 driver without any additional changes.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>

Applied, thank you.

-- 
Dmitry
