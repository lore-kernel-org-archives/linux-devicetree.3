Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135504;
	b=3cctWJ9Q+J1YEsTSTZaiTrjRrUDrSe0itMIH2iynyJ7at8HRR4nN5ut/EK52wsJEFK18
	 G+b/gcpDEW9DFN2HUijtNo19bwiLQOSAXEaoFuhH6oz+2h0dTYx3tplYOK3D/uo0sftq7
	 95B0kPHERlU0nrZlz/reBmobwxdGJcBdAkO3Qqq8rJs4m4cvrbfvg/HAPnMMTe1h/K+tD
	 jkz2ybbF4hf2436kBJ6R/qiaFhY67c5N+ecoZTcGnHVf7g/TfVVWZW2kSoFWd67syE5bO
	 +4bHCfp9DiBMQLv2qZrUN5GKOu499wZ8J4nQcUl+C1HQ7SWhGOLLt2b+Vd9KWs965gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
	b=bW05tM/IN4qSadDOlpQmWtAN2HFaIvXp0o1uHElgmtpHlOCdg64cQkla9n1ROqQv8GuL
	 uQFp/fSdkUPmoLvtVsrp0TPqMyrzJXiEUSsF0IMc0wSPQanAz2E9hMFItZo8RRZYqU+QE
	 KxJ5xMyauIagQu+UQilRFwzzo/Bn/riqGq0TcfYtPeSVamFJZ2APZF2z+PFPTTuoYD4GH
	 l3+6aUtMh8hxwaFwqKDXzcvoAOWcJt2ffnVx4+fUwWDz+nhCUyp8e0gs3ZeNsRtBWynrE
	 QcH+iIeEP50W18ssOIKfVCwcL+AoBzsQHatGe9m++wRjdiH7QfqsCSKzFc/VPRxfkWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihBLXm4E;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D5606A337
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 622D5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihBLXm4E
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4aa5833c263so227727f8f.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135502; x=1795740302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
        b=ihBLXm4EXEgDv69ppDtXRHTWiCY1l0QwWi/p+mM+6LQibxEmZg2zTSvdbRQkXHIhBK
         d4IamreYYdxlCyWO2KioPjuwB6VO/cujps5G8L24+i4+L3Dsopu+2aLJEXMYxMBWq4Am
         e2jZFtIP6YzRYU2Zf4LboxWDah/0toYjfhsp25Ddb6jbqn1RTYBmnnyq1TLNCf0uEJnk
         iXrVu0gHy8dMrUJVil7ONFT/IM1wJbAsI+lDggt6AS279MdTjkpZoRaY7pNgvFExtQya
         G2bjvI5yNlQR3yX1O4wVeiayvYJ0eFzpBbxhqmS9s53IosmDV9Oj48hKfNnNIYlbDA9Y
         xt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135502; x=1795740302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
        b=D4OJkEQABhx0veXUPPoU1s++pASNR1wzE7MkS1c2hpCbyM6L67uPf2kRWw2t12JnaR
         cTsOwXU5l+G0FjZXTX+4ECoZj6c7EuFE5M/Qz5gN6+OmkfbnFjpyoQsN6XhxzJlSpbXC
         dB4cLsrpA1MpbjNCp9kKkcm3eJn36l6LMXDHBEKZZkyCl3McePWLzEjD/n8MwbaqO0xA
         /hP8/MxHcZJ3cN3XJM0O5ld1DATihiehPF41JyhiFJkrlJholIrOgUXXfuPlBoRj6Bbh
         fht56rITkiu4p2QsMhDNxunbC5ghNDDGsWBT3nqu7XxlCx5Dw9NdvUsMgU/VXbitD18s
         fnNw==
X-Forwarded-Encrypted: i=1; AL+hErHHayxLYphVEyWgwuUVphEoLSB5g1IVk6JBAesoc0bbO8PCkkCa7alD+ielNDbMUwt127pggTTzAROl@vger.kernel.org
X-Gm-Message-State: APuU4Z/iAAAmru+P7Fn45VAFRS+y87tVrG7V22mhgxOpcf/j6gmZIRds
	jNb35dSGHzMQtDlxPXTHis8NukEhm/hDILUCDGBFzgDgIKzwM7tZVrlg
X-Gm-Gg: AZFdTZe1CXNgz6TBB2tRdhrrkYKWiVe2fcYGVnJ6LEWO0E/B1+aRc54ifK+qVaaw8+M
	w+uBOc3jXnZCMK3ia0E1R2JnAp+MzWtqlRLQEtqWvYmSnYMkXOOnh443WewtLh9gcmpEGPlcxPm
	R9kmxTSdGHLfkNGYjAOB06LwtKHPfqM2ALaxUMqmZtHdmfFVF1Zwe0kljyilZz/bSUn8vl7D4Tx
	u3zo0YhXAkwkiFTEo2XiM+8hSz/JMQhNWabzdaxr5a6R8Q8+yzWCZSQ/f0LerPakwKEKxFRZ5x6
	6ZCRT0ZHxu6LeTeKxZdhHoSONYMrQrhg22LwFpU2Oxs48hOsl2phmYoJtLicJ+PQ+F/NoGFLmEp
	M3pkEqw1vwtZFeBvQROC5TKqreUgeS9bTnDm0oYW/VGakJBK4x9n2NNSmhMu4jdzWzwP+uxjawK
	k/S9REoUoCMtAncawLpSM5qVq/Dw/gDebo2iIPMgulooTrOmdPQPCd70w0Z/hMSE5yRbtAv+x+0
	XyVhE5SYoZnRkpdyMyDcNig0cneoMqAd05xQP6XbgmGCWBWzb+NeJC4yGqsngLpd3CkpFZevOsS
	HgIOhWmuh64DRORcK5Z/3Fj5kdvtvpFqTMJ5rg==
X-Received: by 2002:a5d:5308:0:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4abb36786femr1837057f8f.32.1795135501619;
        Thu, 19 Nov 2026 16:45:01 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm2438480f8f.51.2026.11.19.16.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:45:01 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Fri, 20 Nov 2026 01:44:39 +0100
Message-ID: <20261120004442.1687225-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20260719-furious-wine-tuna-f4acb8@quoll>
References: <20260719-furious-wine-tuna-f4acb8@quoll>
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

On Sun, Jul 19, 2026 at 10:33:15AM +0200, Krzysztof Kozlowski wrote:
> This paragraph does not look useful in commit log. This is part of
> changelog rather.

Moved to the changelog in v4.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks. I did not carry it to v4 because the binding changed:
reset-gpios and interrupts take one entry per reg entry, ti,asi-port
is new, ti,imon-slot-nos/ti,vmon-slot-nos are gone (the register they
were written to only holds the I-sense scale) and firmware-name is
required for two chips.

Gianluca
