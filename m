Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D94E50CB
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732924; cv=pass; b=C9FNEXgDCWLR4ArT5rHX7Rrli3O34YxNYe7+5unn06VSYZ89E0929ta5CYu32/k5OFa3sSh6FLvCen7citnDrYFmg7mroJGTkZ7QdxqRY22ay3i9zpAqpPIBeAB0UeZYX3dRNLNR06aRjsmhXLi0Hs1mRzf+t95brdN+zvSsxOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732924; c=relaxed/simple;
	bh=6ayaWbsmcz83d0RD1dqGD3+lcx2KhLYJ1JU2hHA60YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVVF4wiwCqQ8t1U/OCWcy0qxFjn3OzgpXhHjirwUKIQuf8JO3YOIyMJUYmMaepYx1XjRFP4tZbR1G8rHrXEPXJnI7eJ0+79V0vIKf3CmAlBNRNSc43ltRmPUP0mgFABKnDZ4s2ck3CO/7lqB+T1ziGlynRE2xftI2Ep1Q7w5lSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU1DyoUA; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU1DyoUA"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76543e1so2549791cf.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 05:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789732922; cv=none;
        d=google.com; s=arc-20260327;
        b=JrTV3Js593WUumeqrPc+BpltUZSgENwggcUHvKC0f9idwG5We6uUwgH3w+CJNHr/rU
         huC9qVLI2xJhqoTNE8uqznu6PgTks1qM4Clja3PnTKR77mD/boN+XQ242VCKiTGnP6kw
         WLYPTrMebnmK2CCgfJLSG1ICUS7wEI0Q5Ajzbz/NfvdDxktkcbVBP3r4wAeTbKffzLkS
         m5qM27wWyC6sZRjSwLlK0kd9usANsNfMP1BrcKt4Z/xCBiUw6p6Ejvfsoy/w1l/JYEUT
         2efmuiJ14HMiZzkaOqKPyIAINKh/YtnXh8z3JkXSWjrWqiyD2Aat0ryjKbNo2hvwXHvX
         W3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6ayaWbsmcz83d0RD1dqGD3+lcx2KhLYJ1JU2hHA60YM=;
        fh=8Epiy6YDHRu0meE2LD3S11daaPU7OUkevYMpLqphpVE=;
        b=OmTd6gQoYOefEz8CCjliR5XpZDmBkbk0uiGoh2itC+7lXY8WzJvJzza4jF92/ZQu9b
         xw9mRp081eCPoYK+j3wbzoaMED4bhCDuUaAhIVVcyojY9lmPqj5JFvfyKikmHMRW4btF
         iKFUA99XnY2K4P7VZmzzy4Qvkffv8U/g9zBAtQltgfVY2pLawIlFYS7OdW/mKarUwNsh
         BsrVabmwsf3/O1cDWJUntpcMhQ+AkxRPs6f73Cz7Tp2N4d3ThfzXmUpTSi8XN4nmPbVS
         MZISj5jHjt18V3ggbRkQCofG+aP0JvhRXJ+L2qB4BqXVpVXZKjuW5NpWvVv7KHuDylXy
         fuIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732922; x=1790337722; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ayaWbsmcz83d0RD1dqGD3+lcx2KhLYJ1JU2hHA60YM=;
        b=HU1DyoUA7W3ZObi2Xqt9/2fae8wZ7EEnYH+PQWyTnRYjXhp7IW+ZNKKpYuiJr76b5D
         PyeFLJ/g829YoI4RD6A8FdQ3piPTlDr9QFaLLbQ35IWhcQDEzZ34hz+nsXvtOT0IvcKV
         3JEPAt+XZ/5oCvDsLOLywp9dZ3t4L1Swq3smkgbSH3rOth1rjI2GaS2JNNUjpVBYYrX7
         /4Vm8Z6QrcMGGPftPU5CYO6YBqW3+pf1ZjasctfHTjleDSZh5UrOaDecldkPuTVHVOr4
         gVKVQ6kCf9mLp/l0mZBffjR1Q0SqfsUT2Y1qjsHzQ9IByQN3wUYVCp4QHr3p4nBtQaAv
         b/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732922; x=1790337722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ayaWbsmcz83d0RD1dqGD3+lcx2KhLYJ1JU2hHA60YM=;
        b=Fe3NGcV0+aITA0GCXSylmByIZarHlwe+AWaWMQTusVLGeOv9YbzrZcQW3Qb9xpNyUu
         F4Tt6+gAYSqbatRDz0uWm/Vd71a6wh0/ytwxWbJITC8R3BAtz8kjF5QpBWtlCPwmWBhn
         o9FiOpvowCcBzvFCNDXhhg7Kwitx4qE9/E2lW85suZYThg92g/+1HrOBG52vAfRhn6nj
         K4OTrylcqTiArqKxPykN6xYBjOCq7UzuDo0q6pSrGaNvysPd99FvnQT13R/teVM2MbY0
         OvBmZeJsKbBHzbSjKjtHx8wp/qctdNdiPQk4xGd3xnD9dHscyVBCYsFSCigYFjYM9wuM
         MhCQ==
X-Forwarded-Encrypted: i=1; AKwUvBz21n29POsMxH4HUxsDELCRH/tpGf0BE+DwHBMwxOVzdrMAzY0W/d036jvoD6x+tSI764DkxBFzl50c@vger.kernel.org
X-Gm-Message-State: AFuF++mCfj+uxZvU7y1A6k/sPTsKJWi/11PI9ejYjHlQuCxULb1+9d3C
	Q9YSJTJ+ju1HCCy3mjIWxL7vMrYwuinKO84RoBtk6sCNfuWEAxJ45SA7K/bpri22vhGEt9OnL2G
	iknVmN7ADD+f+06OJdJ8sYha47Xl8O+s=
X-Gm-Gg: AYBFou1ofv0tygZE3Ns7Eii1heBnxxm6a43F74z8QZtD9+Qvi9CjO/A9Lk5o/u7WG3c
	Gnn8CO/Ox+8yGJAJwRPEewu+dztyxKzgvmVteHdSiGFC2Tn/RWRZ7XxKJ1lOARsPMh/cJ8YnnXK
	dshwvkuC+aHuuSoMoOKo4/VVj3SFoTeWhvnFi/1lB9xJOubPL138gq3drwlmRuHoV4k6hHpDHgH
	xG026vbcfFVeRVdVeCDUM1yL/qRjKJWuGpD7lmXAprvPSHG1jhySxD13QWxelIAaBBewpr++PAo
	wn31iIVea+jDSVDBBwpyppYnwI2+d+SqfXdn8cs/nR2jAk+IDFy7sB1Jx1JaeR1SNEKl1kOduwj
	+9tpFJ7jGwYk9dwLlb666Kg==
X-Received: by 2002:a05:622a:244b:b0:530:ea8c:1b6c with SMTP id
 d75a77b69052e-5329e976b4amr30710831cf.29.1789732921860; Fri, 18 Sep 2026
 05:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917080905.7654-1-palaomer100@gmail.com> <20260918-inescapable-crafty-cat-b03a46@quoll>
In-Reply-To: <20260918-inescapable-crafty-cat-b03a46@quoll>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Fri, 18 Sep 2026 15:01:33 +0300
X-Gm-Features: AcwNN1UohY9u8D1FB3Y5bUT2HvOqBkA66e9QPA1W3DSDZ76z-GyXly1_UBbtjCo
Message-ID: <CAKhZXnqGPPFFKttTCxswx2cpSJctJxAduRLZ77NEVLTk8T3xWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: iio: accel: add adi,adis16203 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: nuno.sa@analog.com, Michael.Hennerich@analog.com, jic23@kernel.org, 
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Bindings are not for drivers, but nevertheless you clearly did not read
> the discussions I linked in your previous post.
>
> That's staging stuff. Are you again fixing some issues only because
> checkpatch told so?
>
> Best regards,
> Krzysztof

Hi Krzysztof,

You are completely right, and I apologize for missing this. I will
drop this patch since the driver is still under staging.

Thank you for your guidance and patience.

Best regards,
Omer PALA
