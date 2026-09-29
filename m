Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942F3A9612
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672745; cv=none; b=BWeI3hpZjmRZwoNeeWKZnw62lQYqNI/J3zxjsWBs5bw9uZ7xmB9M1OGHNDmSqZesbnAwuzeqXn+cgF2H9H2ipePsNBEAVcYtu/WBCZ1I1k4G/1Qiv1MN6Wmhj015ntPUblgmg5TPvel+c8Yn7Dy5u6fuAUGMV3lwQahnFNeQDZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672745; c=relaxed/simple;
	bh=dOxCFITIjjfNlVXHpkNOWJqmhuzYBxwX52SfV4FFHZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5MlF+NLv+SNH1rSZQI0SAxxsP1J0N9ElBJLAqZBPMbDM/R9gv6sBKpP3leVpJTF9Imud/NsGQkru6GRTMD25UCutqtC5zNupQ0Ql1hZkGe23zEHPVi7OoJ86QEE8NxmMfs3AipeFeGvEnvJVRQkmSbtt4UM7ZrBI3XmH0C2ctU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd4nSPTV; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd4nSPTV"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e1330155aeso1671295ad.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672732; x=1791277532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bevleajp85eun+yxjdnuf48AUFIAcQWpSDeUosrkt8g=;
        b=dd4nSPTVjvV+YRWujSwHY6fCrK4dEmOXvgnXKZYa/KSejTHo/Y97ptN/FSNKUzz9ta
         pl2XTalgy9+bC6A1JmdgBZAxn15pyhhww3w/9PHPzQfzNaRHaNTm4Van0H20bq5zJYdo
         SzIpReHrOi/93lRUw5NnRwWRITf+G0yPJ9VIGeIfgFM0CxUAGDyYn6rG1IlDaouG7Skt
         vFde2kg7l1nXjbe373GhA9mFaA5yhuTtpJc+0rPd9SNalha4FB8IylvDw5YvP8GiJjR6
         enZLewsgXWW2eHSHcb0xITjYE2kZDnLS6qORjD1eqxKoxrhHmCXHoF7v0j4HA9p+DugG
         XSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672732; x=1791277532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bevleajp85eun+yxjdnuf48AUFIAcQWpSDeUosrkt8g=;
        b=KTS1thCHZgrrRWy7q+eQxy8A0zh8/LZ1Nl/oerFcKdhMPlb8VXMNEZ4izB7Ge3KcTF
         WeabIJ+iaYP3iuqK7WIA2M2pYzspev2DnIVDNNh5ZWtwTGMCI8FqVoo8qN9xs4/DSocK
         tp6W1cScKlPjaA8XDXHF/VL5eo4fBlLcusKoP3rfp4f/mhMoUgHt1etvv3ebkpcga73u
         yygFaiIAv8Bfd6yxcVqjKdpryzZpK2okUoXDv4xU78cSML15+ChPVsrnL83CStFRlpqn
         Q6KXQoIQuqowDW5BGRR4njEOEq5ke/EO/ztt76NKtN66vYfcKmfVHEALKm0LOrIqidxx
         0jxA==
X-Forwarded-Encrypted: i=1; AKwUvByAB/DPxEeQA+i6mKSmzNx0CpQpniNZNYNYyyrzN/i0Eg07mEoMlH0d11A086/p1Z44ENRI3Vlg4Rlm@vger.kernel.org
X-Gm-Message-State: AFuF++lFw6z0tA5JJzRwF9kh3iKxRytPRfvLZOr40n+9p1K4W0HLgPXG
	fis3dTEdBJU+mHywn/SNKRZRCjwlG5ZwXNldGq79n56Qra5/lFofA6P6
X-Gm-Gg: AYBFou2sSAIk/H6R3vaedhS234mHZYktpbw+tCiPFcNxy5eBYm5en4bLWV9W5WHICPv
	LIpu+7+SfzNlV1FsP8WJ4vslZhjf0BSO8jE23X04iDCWPalWMABoHo0ShwQ36aUwudSw/gSzV1s
	OFg7lRjs3FUkMtckoE13GuxEXVh7q/uX2xfZmqUYCrEBXW1+K7Fiz1mMmDDYE9cUGFN9KBYzRna
	wMe8dZQDKxN00yzuvz6HBApZNCCj3a/uitO86l6/73mRxtKbQM1Hg9zqRL/cVWiVi25d4olMI9c
	Bx7VtjnqvdpDI3UWiKe6IDu42I8XvhZaVVgbIKDR5arYAQV66MC+YoIcuPF4RrGLMsGUZRXnwhP
	rRT/vy+HAsvIzqrV3MSfkMWlFf/aj/0qjArIyq66j27VO7HiQ1YN/XzVf+JGQNZZ4XWwtI/3vUn
	vMDtn+TGh+H+wkzof3NQwAxseLizkYnTGND1nP1NAO3DsC4wnbZOj3j90pMzj9fPBHQ9PgSIW6O
	bBZ3s3z0SztUFk=
X-Received: by 2002:a05:6a00:4a12:b0:884:18fb:edcf with SMTP id d2e1a72fcca58-88418fc0398mr4492868b3a.0.1790672732392;
        Tue, 29 Sep 2026 02:05:32 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e163dd4dsm464701b3a.25.2026.09.29.02.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:05:31 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 17:05:27 +0800
Message-ID: <20260929090527.105522-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929-inventive-hidden-sawfly-03de2b@quoll>
References: <20260929-inventive-hidden-sawfly-03de2b@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 10:56:43 +0200, Krzysztof Kozlowski wrote:
>> ---
>> 
>> (no changes since v1)
>
>You changed the compatible, no?

Ohh, I'm really sorry about this. This should be from the v2 commit msg but
I forgot to check it when doing v3. I will update v4 to fix this.

Best regards,
Jianfeng
