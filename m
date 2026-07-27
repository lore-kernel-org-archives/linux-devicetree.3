Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4376373BE6
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139645; cv=none; b=ilqegF7BNu2OvyGKOYhu9+pz+8uxe4R9poMIFDFVIvSxVjw3EwoVrvoWkGK/KZbT5TpAdxZ0vAihhI4TUu+KLoPkIVRiIXBVRuW/Km08VaHiyWSQhwe5Xre4W83dI7TBiTukcV5oZRec2s0ekhLYVPekEYbxGPWTguJhU4Mf+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139645; c=relaxed/simple;
	bh=sIwJk27WEuAQCULvtqHvdnpQme4JQckj+NCOjuIZG8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gl9F5hUvswqoyimM+zi3UTqIWoSQnBCtjGXeE2higAkyPv4Lbuj7Z3a8awGJYEC05m4cM7dQDa2l3rt+ChFKC+8NxS07Mv/YxBcJbdGClsN5cRRTOqCgsspE/wuzDNcoR/GAuPszj05tQlgqbvcPGoLAZMI4HFQ/MD5e0kKJwYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fhcETGIs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fhcETGIs"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so1460343f8f.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139641; x=1785744441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NYx3ZWuQAWq92kKvbpPhBV69sCnwOArYo0fU9lJodk=;
        b=fhcETGIssuns6qEh1m5PCmkIkZ4tzE/KxmBgWnXaXjcxSfXz/H9jYILW3qy7EQqvw9
         fi5K+v0ZO1TN89zMeuLyaACLt6f5zJnY1S991/+KRZGkEsI0K1PFrDu9AUzrLLvTNjVH
         GCw5m0ROF+hATnRpUYvCO29XPM9e8eWmm0s1L8JZxff5NOE5dDKuwqlZudAW/U6Bi2/g
         5fuT0krAM3+Ni+mI9OhUc3C11TjT/0NZKLNDUzWT+g1pkEMNZy4rDxgwdaboPvYzN8BJ
         6BVyPtW+4KheiusGdsXswxgUQmzihKNiWNv/mZX+IMB9xsTsLDDrdt7dxO5t3XUH5End
         Ct7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139641; x=1785744441;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NYx3ZWuQAWq92kKvbpPhBV69sCnwOArYo0fU9lJodk=;
        b=YDncBerhXH+ajQ7buYfCWwWJJiNghGOmF5E0dLE5zzWEjqKVLsVKCJSqbZXjzq0kDY
         seT1tuaa0pIQYbGm05tJ7eaisbQlfwpL2L3RxlpY3yNbNDHTstn4Sem6ookYPGn078Ex
         ANtYXPclJn27AmnMCV01Su/1TJ/nVEfZnIcEr7zbaVmjsMgvH2x7LdNaKAKBDc/ph5e1
         cos5TeIHnpB+bd6VRuMg3yvJD7V+fGdfDhPzelWPjy0kyvW/1l/XXZwOK71gLkzuAgEO
         WE4jPI/VoRCoSNhk9D9U3BttSO1sfdYZKlbr6thrXMC/dGbhh9hBnBLvUX+7RDZUrOLz
         az7A==
X-Forwarded-Encrypted: i=1; AHgh+RoeS8lZ/EIyDcwoRRPtFToIPl00Y72JRQLDWcwr6XSmFsyFwcne80knuhYmyh5LKLoDVzvraP3W/y7u@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbb5PGdxlA0nVWbarDWLIjsVN9b2X+SIwtF8A0CMwTSsf2cqR7
	n6/jizbun2G6n62NseguDbgmWtfcvFFSKubyFxkaMrQo/I/VLM2hxSmx91u6KvuZyf4=
X-Gm-Gg: AR+sD13Ptd3XPSexx80r70xU+8n3+rc4Zc2CWVBPeUW0VrnO6e/w5FfK1jjVhBJbGe2
	Leyk5UswCcVmckaCbSlV4zKvuh8FJxkAGKSJdVdNG3E0CbQ8e1wb1D6333RBK0HPp7pBfo9giEZ
	IQ/flxE7A4afDxU2fBOY2ksaIiMeiK6B1G88UC8Pny1rSNzIF6iGcuytXptZxzMdDJnDVtAraZ9
	6xPNmGJzr6aYV5NzA43S3Zk/gfW+L3gX1t+u8E9B5rslZ+DP9+ykmbr1Xw9zDMbO0yiGks1Mh2t
	F1CvdBuVlD3VDhpLId6MXuz7U8C+K++8j3f2uVIPxHW0Y5bm2dmmXat4gpswWa+XxVcPjY/P0JO
	dBE0FvrmmlhqvDXX/RLzZQ8asDMAN2rAwmVOLCAMge9WWeYCycPf5/Ms6Fyfje1ypkndvoQod1m
	NlqhGUa1j2uLcJIa/JMmOVq/k=
X-Received: by 2002:a5d:64ef:0:b0:46e:6201:3ebc with SMTP id ffacd0b85a97d-47f9feabc2dmr9624775f8f.41.1785139641456;
        Mon, 27 Jul 2026 01:07:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43834608f8f.10.2026.07.27.01.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:07:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Paul Louvel <paul.louvel@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260723-support-am-800480n3tzqw-00h-v1-0-6a4ae0575a19@bootlin.com>
References: <20260723-support-am-800480n3tzqw-00h-v1-0-6a4ae0575a19@bootlin.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add support for Ampire
 AM-800480N3TZQW-00H TFT panel
Message-Id: <178513964072.2733676.2524147426229678619.b4-ty@b4>
Date: Mon, 27 Jul 2026 10:07:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Thu, 23 Jul 2026 18:31:48 +0200, Paul Louvel wrote:
> This series add the support for the Ampire AM-800480N3TZQW-00H 5" WVGA
> TFT LCD panel.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Ampire AM-800480N3TZQW-00H
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/108a73346f52e5c6dc01f545dae5355482ec3ab1
[2/2] drm/panel: simple: Add Ampire AM-800480N3TZQW-00H
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e1bde8ef0abe4e299fd14694cb2d557d5807c864

-- 
Neil

