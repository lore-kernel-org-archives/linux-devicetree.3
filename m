Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9572A3A6EFA
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338102; cv=pass; b=T8JcdKHl+UsglaCbEfxJxk+phJjKcQnMwoE/3yEn62pYGSlRNI3TGjgci23b/Jq9W8Lpl8u0uJOXa4d0aKHXUmTAAzX8DwEhD2MzEOaPs3acq9D3HgM8MCw9e8iu9BEmpaVZvS9sChm5hAnKTbEFPi+znsA3BM1dDFXb2/qVuxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338102; c=relaxed/simple;
	bh=qP68Jrnbqvxfi+YiKfJ2QG2j9PgNyniNDllkv4faoBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCG2httS1up6OUr1NPp3lTdVlb+cUTNcHDgg5bIhxBrrrN8ExkGFVn9IvFgCEYnGrOFOl+DzaT74KTw9hqskU9ilMLl11FwSap5JGu0npGG3VC5IzowhE2EB6Pe7riCBVhtiURr/jn6KpWsL8+Nz9bUb1amvXQUhu6Ocu8MK4cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=MRv+ziI7; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="MRv+ziI7"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-41c47bc8052so831790fac.2
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 04:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776338098; cv=none;
        d=google.com; s=arc-20240605;
        b=N9H9ai+iwcCXQ2HUZKjU4jDMwei/ZyF01JOvmwJSPTGvB2ttLM/xigt2q8xeMTJ/ek
         tgry+brymjnePrr9HOv4Yd8Ko/dfR1LXCVqmrOFCix20Kw/OlgkXefjVfHDTBQCIDpUS
         kx+llpK6sqC1RchzLbZTXzhYhoAT/zIsLIWwcZeAW2vNQFp3aoJJojM/gwNaprV0BlAL
         0Fj309YWbS3QhugOQMzxWjqYUsF+f8ElzuBkVbcf8GrYLiEdsmgQ1A9e9dYYEq/188aU
         LHDl2FnPSFPG7AFKz5dwlsQiv5EMq6bCc5dxkNDznKBSRDkOWGVHLqphnhVs0r7GB9z2
         Jqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qP68Jrnbqvxfi+YiKfJ2QG2j9PgNyniNDllkv4faoBM=;
        fh=432FEf5E0mirFV2BjNWO4teVWMrVrBrlCH2sF+eqtI8=;
        b=VY3+vFFMKp65IZbhpuwwZZT74h6LruD896S4yIf1JiViOtg1nBn3KGgJY9JhuLY7Gj
         pRRTJh/+/grFJxg+yXf5cf5P6sD3yWcOEq3LLs11Aj5Di55A/VNky5ImaHpn3ad+WVYY
         d2n6PhRhMhw5+JHGvWxomhhYUJleX/l1VSbLsvhNwWMQVY1pd1pmqKCQ+bqvdnEYabRa
         CwShncVVyEQtmkSnnvU4zJGFjV0jmAXGhSqrls7taTFP0BqtxWk6ajpX6rHg6Kh/7Q71
         SOm5L+4//hqP+V6eRCL8PJRAAvwQdKSHsgBJTe3feEU/Q2+4/zAdDtKHuZ99j3UzJGvA
         ic7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776338098; x=1776942898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP68Jrnbqvxfi+YiKfJ2QG2j9PgNyniNDllkv4faoBM=;
        b=MRv+ziI7lNcO/sWCqah3PVn1HYy/htruGU97Cig+NwwrgAwZj+ioGYFJzCvgLM0coV
         RsyoALN9lJ5MJoPkbjwfkd5rB2Z2aQg5Fnab2okfrBhzOyFDGeCk9VWy2i4Yq5KcujW+
         j72TEWtdPsKQRJZ40xowowfBn3rX4cRQ7X8kwpSqOGi3WcZRrEfH3Wu0nfmygHIwHPmd
         ghkP3d4129aD7ue3T8/+nzX1fk45SzY6I6e/3QTlhG9AG2F8nVt6ytJMmy3xGmmxHTqc
         w5RHljY5tnJx0mbbnRAezoLh9u89XbJd85THHatANOlVI9k+J9hftZU6Nk6IqtBmGStZ
         sxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776338098; x=1776942898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qP68Jrnbqvxfi+YiKfJ2QG2j9PgNyniNDllkv4faoBM=;
        b=jrt+aLdTepS5GswWUU2jlGuWSGnKXlqadRCID53mAFieZsAtgp1sPrd/YASTLFk0xw
         IhcVXhxiMYUeffp5jv112Ijs2c4P71neX853+7ACZF7Op5VfS4Ej7o5nnih4Q6W/vkuq
         Vz/weDR3R10DNQL1CyP51Mc3dAS6xbMlGzdQw1kPveYg6Uatxfauk/Qz3WUAXu/y1o+i
         zsiT7+vRSCGKD512vHiJq45iS2HCT2HDnvYkXeKcQwhIbGbe2TRGCeofYp8z6O6rKIOW
         iojWSNf+ZpI6CoZCF2/WyWp1ngFTre2/yu7M1f/pXGskEkdYpVzL7VzGdrO7WWV4l7DS
         qdtw==
X-Forwarded-Encrypted: i=1; AFNElJ/MIDNiRFZDcAfTfOuXesERs+ewQTbKFv8a3A74KzEFRIMbn3hJwVj0oISs9WP6wnkNnq6wUwqLDdC2@vger.kernel.org
X-Gm-Message-State: AOJu0YySEADWLOu+D7fmVlb4N6Op74xGbu9tyBDI93LMWeNU8qEi9FVK
	4Zmc7c0lOYyNz0GzSHvjf6dYSfU4DnsOCkTm3ws+KFieAf7FDCv910tUoyuzgiURf+qPHejZ9g4
	iZHr+wLCEuV8JgJwQT5zmnlXRU5Nlw6GpaofLdc3pgaSTRXItxquJcqP7VNJSvw==
X-Gm-Gg: AeBDietb2m3xKa2beXyisPNXm/TTO5cKrPRn4Uc5kJ6qVjRIL1SpQZ3gdPO6LGtk9K6
	VXLFtn5KMfoToaAvQ2f2lHdl5gM6GZc2cntGybb3Jt7gQdO8abFOI1rETWA6RjcY9gImdOzAzl1
	AHAhNCXTpWSGNlcUlh/TX/NO9mDv/VXFfLhRP5jxJTInv/vNQzQA8P0YYN3qVAXWW3Gm9Mlc94q
	/l3mz/Xx04D1jxX7P2h76QhoFaArVfRCESKHOe6vQ3mGtPTD7DgsLwscsK3ucM9A91s3j/N1JhV
	fFCOySpY9jUl5p9NZ/tpc5JlAoyruYm+rQQXudTgNA==
X-Received: by 2002:a05:6870:eca2:b0:417:3414:3ce6 with SMTP id
 586e51a60fabf-42813a70f59mr680899fac.0.1776338098368; Thu, 16 Apr 2026
 04:14:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416092414.3210383-1-adriana@arista.com> <20260416095706.3212158-1-adriana@arista.com>
 <20260416095706.3212158-2-adriana@arista.com> <89bb6063-d473-498e-bca5-0185325608c3@kernel.org>
In-Reply-To: <89bb6063-d473-498e-bca5-0185325608c3@kernel.org>
From: Adriana Nicolae <adriana@arista.com>
Date: Thu, 16 Apr 2026 14:14:47 +0300
X-Gm-Features: AQROBzCFCGs6bn6qdgFdMqeO4xeOIwgmQaiXCM5o1sprYuY5YgEhIxJrKxK-Yr4
Message-ID: <CAERbo5x6nyQS9nm39q=9cY6y2bn-w4_e86U0OgXO1=+tSOKa+A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ti,bq32k: Add delay on rtc reads
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 2:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/04/2026 11:57, Adriana Stancu wrote:
> > Add a configurable "ti,read-settle-us" property to resolve a limitation
> > where aggressive I2C polling prevents the BQ32000's internal register t=
o
> > update. This ensures the hardware has sufficient idle time to update it=
s
> > buffer, preventing stale data reads on systems where the "interrupts" a=
re
> > not configured.
>
> And why does the value different between each board layouts? Same
> device, different board and you need different value?
>
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830
>
You are right, the delay should be specific to the RTC chip, not the
board layout. I will drop the dt property and send a v3 that
implements a fixed 2ms delay in the driver.
This will be applied only when an interrupt is not present, because
this is when the userspace will use polling.

Best regards,
Adriana
