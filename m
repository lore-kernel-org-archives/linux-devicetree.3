Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com [74.125.229.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019FE1D5174
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 01:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384861; cv=none; b=fVv+evGhHx3sv7qP1rLsHhibsiY28YaGBbZE178WkQmmywaGOt6aDaaNN2juF9g7TOHNGZbR4/hCp4y4oFeiojJFRZBFIKCiBmvzGCY2vss1RCQlEqNLMr0hYUryHLC1K/z93p2ugGntxIZ7FmRXIlsbn/jfiRw3YV77dy9puHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384861; c=relaxed/simple;
	bh=upNZa3t0W2Af8aUbICzQiCV1vQp/Hwy0fTwu/8O4BTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3H7nrx9HCQlIKYd+BrhmDTyEEQjyjjrubRtLjzP6QHZMePfOavFu5GtvAaT3ZjB4eTkHMsAuas8i1YWP42oPR5tVFsiRmV7KGuxnu+0M6u/TYgHUnQb2EUOHtOspvOn3Qwj2WJoNiFb7ioo83KpMwhLbcMlO0ZvvoviTNnId9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtMtt8LV; arc=none smtp.client-ip=74.125.229.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtMtt8LV"
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so1291945c88.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384859; x=1790989659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZuMXzMudqgIHVV5MC4YBYyxnrbOVGK+M2cyTDyid7E=;
        b=PtMtt8LVpDdvMOBaSiSBQyCerRAXR8jAFeohyuYAKR6nlB2NKTphmGSI2opWT1ANor
         klb3FI721lLz3EAzunSyJUwP+Z7Y+QBCdXnraBj7Refn61ebNClpZzuKMOtLJxGa1zLJ
         basx01t5XzxwYhBla6zm5Kxwzez9cATMdPrGEkgHoYatWo4NRqOxEM3tJ/ZqpLAVyt+A
         4rHwoO5dvaBeETBLlQu4vxAm+wGs3E0iWk8bE9PVdjV8hhG7g5eGR4wp1nqpFI4qPNzk
         BKriwVD0K4rZGtT0RWECzqoXkulD2aOJAUnON6zbK7yJRPoDUaZI6Cn0BxcPz9tYJoWM
         dTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384859; x=1790989659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZuMXzMudqgIHVV5MC4YBYyxnrbOVGK+M2cyTDyid7E=;
        b=ypv1vZkei+oGX/l0xRXiOHZMLKfOjTd+d4eUuhHnIz4WMqBxNoflAWItmQsB3E+h2j
         sMwKTEhB60JA/OAT5JSjf+BDYReq9IrQhQJIcAxjsyu3aDH2wxgKkk0vbB5hJCJYnBRV
         ZE7K1T8RtQMrG5/7szMaYl6Uo6mX8yWBZFGIcnJPu/SYYp1rQ3iyuVT+CJA9h8Z4+8IP
         mVjgimN9O6iun6gUCW6d9jNuwaI1wlnwuMVKku+SPQQXLPuvMd/G3LgzyRuYWojZj0lb
         O5ZJNuUjkuuwRZ8CPkzS2cczkM/O6Dymy7sNAk0z3+LZGwFgQ0e4yFzKJ1WOPw0gTKSg
         u6nA==
X-Forwarded-Encrypted: i=1; AKwUvBxyV1UdEzkKEux9UMoleeE40fWrK1Ho7R4bA0uZmmlJQZXIDi9UdSpdyPD/KLQfKhiUjXsNNrCam/35@vger.kernel.org
X-Gm-Message-State: AFuF++lt7YW/OC+viI358tfbVOeRiml+uB9LtJiyX/8sqxrnXgi0AezK
	xkcwHxqk3X8s8ZKbttVtOPxb3XshWWbR7Gxqml5WBL9rt3H2PhgmamqU
X-Gm-Gg: AYBFou1fXpj6SL+g3ApA8IaxQzZzUz/st+LLkU1JuJfkgft6mJ94f2ApHipsUIDXemG
	hrrCSlBx38unjB1Je86pXpLTRWip+7BDEozMOs7YGWDFbjrZHJ0ecq489B0CMrKxuuAcR36SYE9
	bKWSA9tzyBJaoGDUwdVrN48FniP9f3nHa9oU6WFGE47wfvRQ8pLvGzKlM0/fdBqWkZ9LetiMrRv
	C6g0pRa8cUmdYn0wElBJIdLvfqzcH+DL1tcFtsOFpWi+aLMePFEzLLJb6un7lPtVTy4cXc1fX5j
	xOHLlIFDc2ahKAm2XRNJn+jLX5zRgdU3zEyfMSSeZumisaC4icwmcJIc4QoWJklEWflp3E/auB8
	yJf6K1XQcUMO/8u4m61fcuSbE1D2ELxVeOT94tp0Dk8kW2UuLO0OunMfvNkmMI2PvnFU3G0BJ1d
	cSqO5mr1BVghjb3fkGxLGHrVcZuV6qjp/bTKworcZlZMiQjpIZrsnwjBJR5Rf9K6s+IDuRRSfGX
	KWYdExK6S89IVToQsRDuUMQRQXAq5H2sQ3jKTNa
X-Received: by 2002:a05:701b:4589:b0:144:e246:a0d8 with SMTP id a92af1059eb24-146d0682969mr1639403c88.40.1790384858988;
        Fri, 25 Sep 2026 18:07:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm8488992c88.4.2026.09.25.18.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:07:38 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:07:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: input: Add AD7147 CapTouch schema
Message-ID: <arca0-sw5QCBrsdD@google.com>
References: <20260923191604.2213710-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923191604.2213710-1-robh@kernel.org>

On Wed, Sep 23, 2026 at 02:16:03PM -0500, Rob Herring (Arm) wrote:
> Add a schema for the Analog Devices AD7147 CapTouch controller used by
> the Microsoft Lumia 950 and Lumia 950 XL device trees. Document its I2C
> address, interrupt, and optional vcc supply.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
