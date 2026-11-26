Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691941;
	b=KkxL0eYMU3noic5Bhf5ZAZgAaDgvDu8pwurBT52U0fUSunTfoYiVR8PxtkKWGTPGTH4w
	 kcYRminAURP7rS13sXWh8NA8yAjLj7CmjqoexJo2N92DoFnrSrWEOmBU5fFHnvNRBmzAG
	 72ailt/DMEhnL0LrQCrL2NJd7cECJohOpMsWtF9RUDsa2Vadb6EAhF/NPP1b5HvzfuSEd
	 JEK/v8h1y/vxszKA6Acg98u3ZLmz74qa6T/M0a4wcFnXLGwy6DYxyNhrIcVdqcEZ9qk0y
	 XxeeLwsB88PmSj2Q2alb8a0Ya/fS/UVQVNdAONJscRzN5U23slT89ggtkqzLyYmMT+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GnDQFeTzByRSH3a0f558isd9M/5paBCYJe8HXi4k8w4=;
	b=pJORMBYlFTZgt/a7vZN33yO9g0wfwfd4djEbVpYSR5F9zmwDgds3xuKvWZ5vBRLplWtc
	 EQoZuq0uRSajtpU9RqDbiWJVn9YohbhWwqDjesx/eVw+Pqb0VdhuqkuZ4acitXk0kBNbw
	 MeTMqNwT2paBO6fUZCcro6DSuA2BAv3OnvvKlgWxYbEVGEZhqb2fNTkugfGpfgZGSXQqA
	 Bg0CnyWtU5KQlpMhlgqC8OvArC/2ZUMvzohRyS8yqpnhwVNJhLMYzVSMKTWYEraDnz7MU
	 OMqqf5Q61aJo2AkvsuDN7Cg1G4A7HBdqRD6Pyr8jy7y3vI+w1m60kzOpjPxHRGIpvBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOrFnJP8;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318A9606A330
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318A9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xOrFnJP8
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cddac941ed1so3096325a12.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691940; x=1796296740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GnDQFeTzByRSH3a0f558isd9M/5paBCYJe8HXi4k8w4=;
        b=xOrFnJP8JcRkdi0mUTD1ku955kmOlhNtLkDUQdCudcoJbV23nJeWco0i0E99tgGalN
         8MkdYNy6DXJHnsfhS5vgioMT/dw0XYpiKEna0SWtXgWasKoIq8Ww1sRp/mD1E5ywEWvy
         jeCE4ULcfSrvkYCAgnpR2e183PTn0KMfC7Cq8T5XpGQu5zbzBsjwmK7fnUBVjWzu5gTQ
         wBHtXl8slfZwjNVVNre/iSfypZ3dS6ehi9l4rIZDkITjkbZhNSNS+2WcpzBCO+ta8r51
         4IQodr3tPBOZcU5lTxkUBQKMNDnlNEjIXauebANOjeGfm1pnhKlfsmY6OhURWgdA271Q
         pBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691940; x=1796296740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnDQFeTzByRSH3a0f558isd9M/5paBCYJe8HXi4k8w4=;
        b=MCywpMEp/ZZrXFXGn1nq4z7RSlK2FcbU1vOTxywd5w6avdyatOFhg2VQgakWmLzaZs
         rCdNuWz8sVnmcSepTpoOlNZVds+VItZq/4qklaoUD6uE1XnKXVki3a8+UTY+7/5sbIIa
         owjUSljiIn54S7SrWT/5CSVIRbnXJdbd4GCHmvtI8W9Xs4nnaJ6ETtWwF9ZL23xNdPVA
         VNsaMQKV+d7acObqImeyXOCh4LLGADanZ6BXt7D45n/K8ed7AiWb0MjBFPZc61Wh3M83
         aaU3SzKyg8WP0ok1va1lg9+ZiAsr4HDetq/50Bneb0+aWWvKazpXMZQccJ/P8X7ziisF
         rc3g==
X-Gm-Message-State: APuU4Z/IaWZ+96KjWo9XegYc8MQxxv69bfLFfK+Pg4478Q0Siaebz9xc
	2IuHBmaw35K4y44CHVPLAhoSdFYGDLm0r3UDZ+6EkzQZtme5gB6x0hbO
X-Gm-Gg: AZFdTZcHDN4DcCkLW9kaCG99Bxe4M8MH8+qqUN5iBaOX0GqDvg5Shs+D0/wqCxruJ8u
	XV0EfMZ8WWBnLkIx1b9Pq5IL1Cx88nlP2jATMLlIgm12F65YSXADSzcp265o02Xw5d/5d7er42P
	Qv8g8YrMZb5mbUbUucIi9/fslw7Wn72AsDDHtqBUFMzHfSQj/fK5HWo3mQlY5Nc9MIYbSFKHbGu
	ew3knE8oa75LOWApOV9Uehuo70B7VTywNjatWMh1UW+nhrFBMehufFNBf1a7vm4BAGBZWfQBAln
	z7yJkyOcKfVF84iem/mbnRIMCp1CTTzTnt0Y2xTNwz6mFE2+2jBS8rl5zNk8bVV14sSrcqQotwW
	CcgUHDD/GvMLZQsu1AbQp/QxOXtb/iYL4Vn3ljijeLOh28UbS7kHlqccEbYmStcGHTutoCEvuu2
	3mvQqPsJo3ghQ/RreBpZKDHmqurxoY2wsNPtjYqxlpDuXyQv9YM9hce1xeULB/E1gFFBNQ+NVae
	P8zcHcIfpZVJNtRx/D9j+95YPuts5nhdezgUzXghfNxffoGRF6DEQLqaqoQMqgxJrEdXsE+NDFX
	pBNr0JmmjCuQ86gO51xiG8NvVtXRZc4IyaelXDXvqxnkvnwdIGhXp+O20E/I1/C78DBrO4UdDQ=
	=
X-Received: by 2002:a17:90b:2cce:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3b41c982ee6mr20203831a91.46.1795691940411;
        Thu, 26 Nov 2026 03:19:00 -0800 (PST)
Received: from localhost.localdomain ([2406:da1e:5db:e000:2565:a988:ec63:8010])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm35575930a91.2.2026.11.26.03.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:19:00 -0800 (PST)
Date: Thu, 26 Nov 2026 19:18:52 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sm8250-elish: Distinguish
 display panel variants
Message-ID: <awgVnFUK7_-O3b3U@localhost.localdomain>
References: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
 <20261126063056.2276703-3-liujianfeng1994@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126063056.2276703-3-liujianfeng1994@gmail.com>

The commit title should be arm64: dts: qcom: sm8250-xiaomi-elish: Distinguish display panel variants

