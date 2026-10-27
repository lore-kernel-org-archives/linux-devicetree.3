Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793143327;
	b=q/1d9UizVtASF5RFRGB72nMFzjDNthahs/29NubRJ+El1yyqLf9ArtKCIS1Sto3DPT4F
	 MVwBSYbJdEp9EOlPlMcnhqlAl82e4OKCWFDfB2GePlg93iavfx67SagIwjUrEJeRrY7g/
	 ETYAzoNVwJQjRPh7FTSwsiZ0w/UlI914uzN2XMQj5KuHghqCAjffAir4iC7UZI4S+Mgxz
	 DL9HFC/4ZzgSn+V2F+Prtq9nc2de0A47IZw2Y55MDcuPekyBbj9GwBVA6hijy9MvkpdPU
	 TbblbfmAyihZdD/iIO+AOn+L2BZLNVvIUttw0Vr2PUTCWAI7RSEls/DUpDPttYEKBlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793143327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
	b=XXveuS5UIawTppNceeh31+8GQyAplO4L5QGO2BFDVJRbOVLVstLHc2LnBxXvnD7grwL5
	 zgR1leCGOt2AolGSI/omF7Iu74f045Ob2v48d4zQFgNfedRvGh32aOf3pZXDQno1CjG2N
	 4M0yvwIaTYMcnnUJXk1wF20YrDKTW7JWC/ak/y0/Md0e5xzdq0a5p9/yQkSTBlu89yxMz
	 RB9qVT3rEamMnnkMcCx3MVwa+jr+4dxLmIqaz4XOw2yaVoCt+XwSX3PJxm4YNT4hgwTkv
	 Br8D2rjKJW4zFHL3Z3PvdbhzcRDgXJ6gMniKqKspRDRmXZSlRtkfniLyTEqQMywrk8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=cnpHGUZb;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BEB606A322
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32BEB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=cnpHGUZb
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so852625c88.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 16:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793143326; x=1793748126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
        b=cnpHGUZbIKXsy7Jf8Ah8l/Y9ojHH0W/E2odwf9XisvJjDJI63dzMH3uQl4gs4gJ3zY
         xhYKKpqUSuwcBBIh7xhZMANRcfsp+FfY4S38Hc4kh4FtJ2GLgyHF28dPPi44q1COF8sA
         zcMhITryXJ0kjjf3S5BAUvlvehHxdXi0Y/2ipK8ASxMw5IqYCcNugp9iKd2sJMGxs6kE
         lMVFRaQdI25EEajy5Ab/zvquzVQL264Nq6TdiuavjD/KbJkv/cXQrfhW1ZWEloSXP0SX
         efAbTyBrke7ELIcdyFBRh+pzX7DvyVPJ+NdqDSc6RzNVirCSxg5pfATeR2I40+ii9OCA
         yWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793143326; x=1793748126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YtzWIw2tmWzRFpwiGfEGzs4PBBxO5+sgv4xgYivcggQ=;
        b=LoxAP8QSx3YqfeoJBl7y0ycKnVFcy0eKtnO9drFagqVrov8ioSNgBisLKJjHWVfSzE
         557AmpRLb9BC4kp8uizs+St6+jUy7vroIgeCw8sIYIPmCRBjQgXp/WXqBc0Xki5ASu/s
         Pnp3DPcU2F77OYhOMybLGxPs/hl2AfpgnJ7nti86jMorFpjdJTyvz0KT4MCx6Uh8GbBi
         ghEhIxKjorPTL2yQeJ4beqjEbDtw4rFB8UvGz5xm/Ug7PxzQFZ9zz7cEjpiDeMbLWAnl
         3JQKvNGiQeoeae0mdShZ3cY5C+3l9dCElV5ppm3fwD0CLeY4sgSbyhaExlxDODtzJFVF
         9Qzg==
X-Forwarded-Encrypted: i=1; AKwUvBw2kGWfNmuoDmd+cHLxoTBs9oCOPiA8v9Ln/EyLzQmtO98FeKD6xnuAvuQBYuySQstJflWKmA9mkbKD@vger.kernel.org
X-Gm-Message-State: AFq9FYIDHNaKNcQtR2mwxvGogk37pcS2mkh+nK86uZzXMnfhyc8OmG0w
	tBJibpIbEnxcJHIisaEZU6iGf9ImlzCGgdoeD5kV+bGvNkGzt7+tnQJfCQEgboMyR4Q=
X-Gm-Gg: AYBFou2WB7W6xTie6Ugu4nfVJzMg461GjoDK2Ao9+C6iK0A9KB3hAmlBqqJDzdPuuuo
	tVAQPPRMdeZ96RV/tYKIftZkSK2K3pV1VS11wsFvXibB8pHhbug1eQ4DyR7bEDuXotNdiRTXtaI
	GR8KbcXuuoafSKqNk3nbQiHTxFXSkZKi4nYgsdtWrMEsRb7Z4kpL8v0R9pPY7KhNKLZL+tOS/kX
	HWFRjpzNAOQOg9c1JVv72TKwDrnNE/8Aq4XpnTMcGKxRvS7EycGh8UZg+nczju9pDTGNk+4ry20
	w0F6wzu/2sOw8cRqaZ4hrJ/BmqpQflAA/r5AaAAqTO/nrVg6HaW9k6zo3T4lka2ylTICmXgxP++
	d/TRUTGvyuPclOPUXe5AFw26D/gQxmqZ9sj/YJIvro93oCvckX8wF5sotVh3FSm6AaC13pl/OSM
	Bzx4l7R1u7nqaE81Jq8aZEsNfTgb9M5/Fk2lE10za2+R2m/BY24VXkf9Xzz/4/TXCKSkCCmJlq1
	pT9w8pQUNGCAhTH+P9OCFR5f07957vwoT843LcpH+WNz7lt4I+C/XMIMrkxE0N51V+M+TZyIT88
	LaDN9RbwaLQT15A=
X-Received: by 2002:a05:693c:8946:10b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a20407ad2mr1240160eec.25.1793143326214;
        Tue, 27 Oct 2026 16:22:06 -0700 (PDT)
Received: from kevin.us-west-1.nexthop.ai ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm73101eec.8.2026.10.27.16.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:22:05 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters
Date: Tue, 27 Oct 2026 23:21:57 +0000
Message-ID: <20261027232157.3395142-1-kjia@nexthop.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
References: <20261020-fs1603-v2-3-0986107a5cd2@nexthop.ai> <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 26, 2026 at 03:04:45PM -0700, Guenter Roeck wrote:
> > +static const struct of_device_id fs1603_of_match[] = {
> > +	{ .compatible = "tdk,fs1603", .data = &fs1603_models[fs1603] },
> > +	{ .compatible = "tdk,fs1604", .data = &fs1603_models[fs1604] },
> > +	{ .compatible = "tdk,fs1606", .data = &fs1603_models[fs1606] },
> > +	{ .compatible = "tdk,fs1606-0600",
> > +	  .data = &fs1603_models[fs1606_0600] },
> > +	{ .compatible = "tdk,fs1606-2500",
> > +	  .data = &fs1603_models[fs1606_2500] },
> > +	{ .compatible = "tdk,fs1006-5000",
> > +	  .data = &fs1603_models[fs1006] },
> > +	{ .compatible = "tdk,fs1006-3300",
> > +	  .data = &fs1603_models[fs1006] },
>
> Why those extra compatibles ? I can see that -0600 and -2500 are
> needed, but the others could just use tdk,fs1606.

The FS1606 reports in 10 mV steps from a 300 mV base, while the FS1603,
FS1604 and FS1006 report in 20 mV steps from a 600 mV base, so they can't
use tdk,fs1606. They do encode telemetry the same way as each other, as
does the FS1606-2500.

So for v3, I'd like to move the bindings to a dedicated tdk,fs1603.yaml,
where the FS1604, FS1006-3300, FS1006-5000 and FS1606-2500 list
tdk,fs1603 as a fallback. The driver would then only match tdk,fs1603,
tdk,fs1606 and tdk,fs1606-0600, with three sets of model data. I'd also
drop the OCSet check and patch 1/3.

How does that sound? And is there anything else you'd like me to change
before I send v3?

Thanks,
Kevin
