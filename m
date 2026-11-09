Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246541;
	b=Q7qKT1BCn31bdH/STjNiXH7evK9MzyZuuCL0sQTVuQgeuaq4v2nfj3xGp5Ccf8RD0nPJ
	 JkKn+fOI9BHggujAj/TGspuQm8OhZJrCeCw8Me50PsuW/B3wIOMt6HIUXFhIlDUcaA3eK
	 ZjtHEmgXao3Mb6/qfiAZUan7ewjbPenxoNcbMgjJD44yPMHrrcYfmiv/ty5R2zHp+a4lJ
	 teZh0OhwkWL0lN38sAszl+7Jg+26b1DXmYagRwHHVLR+ieknuuOr4zJ3lIXs59ByPzwzw
	 feZvrDleJ79iAIOhUuiWfpBHpkD45y9TA+wC87CV6xRstS1Jbktn/VXhq/6wbOZM0dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
	b=hEWjdNMqMIJ80z8N6f24wHAsRXQ4PGlqI9q8nxa+II4rsPrLPyu1Vh2vzE2Yd85DYlea
	 mI8yJP7yZF0DuZ7XpDXGkXSCMdXEgOCa+ikW8UJzCmuphCSVIPtabrW9JrhASqNnac2XJ
	 mKIIyIztEU2zMhOWmLK9TwL/1HDD7emEU7iV/etwAVbXRXMfLn2p4G+VJUuLpCPrcVflB
	 fOXx145bzZyiB20ACI7TBE9D6V5P3k6yAnFPw1WlfozDFx2kpsKwSfyj2ivmoc+azDG/L
	 AzpOuNQcPiDYpYbeKnD9fi6sPTgWUWCb3rt9pLfioJb6dxU+IC0/aVUUqLzjg2c1hKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q9wQ32cP;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27619606A32A
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 17:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27619606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q9wQ32cP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so14545615e9.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246539; x=1794851339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
        b=q9wQ32cPD0so3ZqfuhtKzNTUawAwni8LAA8qq7zVdmSmiF2zoYuT7nv4t184BwaTAx
         OSusIKeJYV0aDt/JPYmkZUSgwBgqWd3VhxAejdJTZpysRLOf3WCdcgDzYXUgA73NiN4M
         qiNOwHZi/reQYemYTyQAQ/eTQ9rMsfpsbuBv9P2jbo5EhDzrw2BYaYlgQqzrh+LfNJBr
         EOwopcYxM34WU5x/tjB9XzT6iz7XSHllAYxdDpf8NzmVJVXzcliqMLHzvcmZFMMGoR/i
         g5qScX3lT6mQmHrFPjwmUrs3xEiFCQ8OeWMD/xhW81ym/Hvw9mHJsnjSi65NvzMA9CT6
         UhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246539; x=1794851339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
        b=yB/qPv2qc0obXbOK9p3EEeZZSqi1z5R/C90nFmN5TW2cOREeoNnuDnA9sK94Cl4yTN
         pS6QtE6SgU2TaMoFZw9V+4J40eo11PpPiXPV4X6KO3P2FltaeAovJPxyO2/u2WelgaCn
         fe0tfCNAlUbTUKtaw+4Bm5KgGhtSwtO/i6qHbAo6xyAUuji1v2uqxdIlZ6IXTsiAS/pv
         4E+9TBflhs4jTnmFRJNbh3wYLSItUg+xIw6ewT1sLpvLa5d/vmZSaSsvJHkz2m4bCi8q
         OjIxMONMVb/azHIwStjJzwdhVOSx+OgaLUDBx+DVpWJFmMumRT19p2fGVk0r6/ksaH6x
         UETQ==
X-Forwarded-Encrypted: i=1; AL+hErFt0rzHWVmzHRHCua1tU4weGwAJHtBQ7GWONDShZVkSKv2iQJw4uIT7dphf7JHLHNaNiUOfkToe9XZq@vger.kernel.org
X-Gm-Message-State: APuU4Z8F7nA6wY0Cd9Eqwp2riaKH3G+20511rVeSYySnd9CA6tBWMLKP
	bmuvDEtE2x6VGQhN6Xl5+kQ5SzuS/8cL0wS6kETal36K29j8Q7uLwSi0
X-Gm-Gg: AYBFou0dremhzvzwwFjWa4FmIXdy7uAQT93B45pcnOBcg1k7T0zwW03H1AaJyEyPZ22
	AFUG9taEdgvbagk+4eNRoRwj/t3WZOEa2tX7Az9lhbmqMg+8DuOmezoYrwk7qVn2oBvNXtJLCbL
	FCb73NTYUNCOOLse35tFDD03xOJgcQFiOunvjA5IAbpyB1J0Sj7Go+8ZpC+oegps9RHXBoJUc30
	ro5J88NP0mTHJScTWvFxLbAggcs95R1+ZkmyizSAD+IvjehDJ6WJQD35hSU+zCCpP/9EXD8KSxO
	7CnNKL0WmDRpPqi5lHiQetqMKvQ38q6VsdxmQxN7JLZLTF1EXMxYwtQKs4myL8lAU7rrFEG2A6h
	hQ+wJeUDDkGO33kzKrasPrypSDF1kVpBvdfnJCVgCIcwUHFAYmTDiOsjb+1tZoYdoovmp10o+e6
	qyxPndGFJFN9xtgg0xpXLvIcFRjJPWgP/IR9qijwW60IruHyl7ltbCP/lweP/8QP5Aefe/ytPDb
	e+g8w4PyCFPz1VkEMdVHfiWoYe4tmPAtwGmuR+LhIx4B6iGcgGgXSP6MbCckcwv4KzbpiWfJnph
	EUhgdjP35WaFUTzS2uwW+5lBlC4=
X-Received: by 2002:a05:600c:6218:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4b963c88030mr89979545e9.33.1794246539561;
        Mon, 09 Nov 2026 09:48:59 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d89f22sm7619465e9.3.2026.11.09.09.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:48:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Halliday interconnect provider driver
Date: Mon,  9 Nov 2026 17:48:46 +0000
Message-ID: <20261109174846.2091271-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com> <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com> <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
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

On 09/11/2026 14:30, Konrad Dybcio wrote:
> On 11/9/26 1:29 AM, Stanislav Aleksandrov wrote:
>> +static struct qcom_icc_node qhm_qup1;
>> +static struct qcom_icc_node qnm_a1noc_cfg;
>> +static struct qcom_icc_node xm_ufs_mem;
>> +static struct qcom_icc_node xm_usb3_0;
>
> Please take a look at the newest files in there, you can remove these
> forward-definitions. Otherwise, I think this looks good

Thanks, I'll drop them in v2.

Stanislav
