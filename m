Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37750329E6C
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463516; cv=none; b=uICrlb0tcy2EBP8mmcZ/kXHkt2/3USUJZKBXMmAtatYlYk7d4Ihw5Ap+w70gbUWlGTKesPuLRQ69FZfBZ6QcMdhg9e184US2ffOVf3PLvMZU1tp3vlub6i3r/E2VCCBnM2q3jawffI4xjuFv7jPBur37kUgC/vJTA7PGKzsB1jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463516; c=relaxed/simple;
	bh=4xuZhglcoJDA/BrhgaQMDHF2urWeAaGI1Z1eNAwKbsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7xH4zT38rFRgv8a2VLI3EGVuWAIEh5xiH5A+D5SL4W0QrvnMeq9TmlpOW5ovgyKO3w5ULZy2s6d90yk6N7/tsUq3sNB0/pzEwgOl5+dFzKchJU67QwrMNtGStiRlsT3Qj8agVCXKvlcjobIDwqSiXHlss9QY5dpAfmBT5P9PDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJLSN20a; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJLSN20a"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35c0e7b751aso141908a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774463514; x=1775068314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gy65ZJCUKrHKtVo+Gt/tJ26gW+mdGsVi4ZKpe38qdBs=;
        b=qJLSN20aIAzHJK9Jlp5ZX/9di1iuEJhQdyHNljf/sbAwyPV2gV3Ye/HsjdXPRODv5P
         LQRflbaFBVCHkjw34XscIWOOv6YUYBFyo8PvNuM9K5YhPWz3YQOgM/uqJE7Fvfg5aWKE
         IOhJvMc/yb0P7zFp+QBP58MlkzAXAk+JfG1Mx/xBgRRrg7cKCOfHmyeVuBGUwoIAY9ih
         rgyGVyGoumPAVLJTvA+pwnznjg62xHETSjKBgkHueX/esefLYmhJ2k+POnG9/4CO4pSC
         4i4ihdBjHnoz1/PWTKyLo4vqyC9UiX9sLBzrUqYdV2QTCzQodqVyuQE0anlC74hlheho
         qMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463514; x=1775068314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gy65ZJCUKrHKtVo+Gt/tJ26gW+mdGsVi4ZKpe38qdBs=;
        b=bw9c1b/XL48Leeo5AIbQuWL7bfXmH8OjYJnTmIMjoAp1zUXpIdQ5pf1vlKxfdBODr7
         6C2qNZmjM7GaJYMWqOdaAWPlKfZbmZuT1rwinZp40UoOqREx+SpvmwVMLiA/PoRGcW+D
         aq/2OYE8A0Kx3uYBpgS83TFnNbHgbbioZpdHHi1JyqL+VoogBb9ubnBoKdE1q4zJhuvE
         QU5NVTQ5lm6rC1lZli2C3MSBoawobeYMjKzr5s62SJqiMj/Ae7I0uIpNqBiWio4e0RRf
         hxEEOLivciRWbtiYO0Wb4SCyweuiZCn8DS7b+X5urugkZacI00yim0aXL+FD7axIbcIZ
         GPAw==
X-Forwarded-Encrypted: i=1; AJvYcCUse0otvi7Yq/A1+d4mxzH5R/jw1Mmld7u+TA4IGM9JOampBl0/TnAFZ1tv5kgHBxrt1JfPW+TeV3Tm@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5XCAlTO3h+r/CqCxrU5I8Qk68MVNqqB4y5SmIbHdsSL4lFXh
	9RBquyPzOTGskDZxugbb2bcN4ewLkiZzeF0a4Iqn8hWYGJso9bpF/OWH
X-Gm-Gg: ATEYQzxWkra577kmFmzkkEwH+rS+JI0xMORX4L8qGImxOpahV1PAUcYb/V1VkfIDScq
	QZ1YSpXWjTuULcMPQvET90jZaifQ6PfeP1ac8FNXcQ27zRSIBjK4NNPi3VcLmkHHroQZVhzC1w0
	Ye79WVqqPdvU5b3Wl+B2fi+dzSG9HqAIgadSRlkfaC15TAVMWE6sJQ34LgtEEx5kCJtE67aWXMV
	hWp6UukRk9AzaVLBugX4EWhoapf2PVC90JkWJevyMHhRjHs6Q+5PVFSUmSww35iq7T/j3RXQIKZ
	Fxj6npPi9+Y/Wyen78VUbnqL9BiXVeNUkLSsXiCMMiFNeUk0LyizsPn8CROUXZkf6o8gCd4kFV4
	eH2MK0pIwFzY2LiXAIItwcVMaWxMiWuG7qY1rz8SqH905MZqUt+5nh8oCAtcTgAaHUGhyhJG7FW
	pQYEMXyNA5S83nDjzcuJTbvUk=
X-Received: by 2002:a17:90b:5305:b0:35b:e519:213b with SMTP id 98e67ed59e1d1-35c0dd85d0fmr4311947a91.30.1774463514471;
        Wed, 25 Mar 2026 11:31:54 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:22d3:4161:93a:b87c:36eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0e954ba9sm1336724a91.5.2026.03.25.11.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:31:54 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:01:47 +0530
From: ShiHao <i.shihao.999@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andi.shyti@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: intel,ixp4xx-i2c: Convert to Dt schema
Message-ID: <acQqE-iW51fOJnTJ@fedora>
References: <20260324135010.17730-1-i.shihao.999@gmail.com>
 <20260325-bulky-mushroom-of-science-8c95c4@quoll>
 <acP69aM-euL7wl87@fedora>
 <c9b68d56-48f1-4ade-8711-fedd8acf0666@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9b68d56-48f1-4ade-8711-fedd8acf0666@kernel.org>

On Wed, Mar 25, 2026 at 04:15:39PM +0100, Krzysztof Kozlowski wrote:
> I don't understand this at all.
> 
> You did not run checkpatch. Neither with --strict nor without --strict.
> The --strict does not matter, why are you even mentioning it if you did
> not run the checkpatch in the first place?
> 
> Best regards,
> Krzysztof

Although I did run it, I think it might be best to pause this thread here.
I will send the next version in the coming days after properly running the
checkpatch.pl script. Also, you mentioned some guidelines regarding GSoC
could you please let me know where I can read them?

Thanks
Shihao

