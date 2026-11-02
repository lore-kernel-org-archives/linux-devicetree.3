Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626842;
	b=eEYF2tAtB7aTd8OMm150fh23GXS6sltuC1RBIbuOCQenMpTm/2Ku83Q55bcJwFkNBsXn
	 VEBeaweCF2ipXg0tpP1R4Br+0ZJxS+7aJ3p7N2KGllDrN+PI9l3TmVTG10mphavoycNr+
	 A9OrFKVtqtoPjaqH+Z82tV2rjo720rtGfZGdWudZlRXOjsdPbFaZgrKtdI0ua1DP1vclE
	 9ExatY90F8AMCWsN1m7LmPhRrBvsEgUULZcrMGpRcg1l8xS5nciHDuy3nQuqhkRbZAyYy
	 TjgwB+gWxNqiW0xhvTgYkgLkBgFkTLfAYwilSWU+4yB9OlTgG7tom0Sq0VoXMInwmMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
	b=3j5mvCJVKijInGSzmd74ZcGFxKxTHDOvbqE5Ewa5QOf0YATV7FrqPraOlPcvDNpiyjoK
	 +wZs5tXGwqKUjmAcGTOyX9uLBEHUssdqOpeDWy73j10VpPBWxhWOG/iULBCPHeZgIjyxM
	 qK/QJ16l5G/pykTHddX+rZ4auo4Fd0Kgn+5TCJiR38G393NceMFcqbyR4vDKjhbi/VbHN
	 GyWWgsluY6vmQq5eHHYJJhZjEouPpi2VLzzlO4dpCb6xWP6aMBaaOH43VyOVFuVMQ6tw8
	 wJZ9AzGy2Z5g08oDIYtLrzC6V/O8jGyMIoYgxFkerSBzhV8ASw7t4tKPsaGIT4fmgKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I2qGGkHV;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BFB60A262C
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7BFB60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I2qGGkHV
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so25672075e9.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626840; x=1794231640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
        b=I2qGGkHVM4HOQZrV0J9GsfZjA1PIAXAjcif1FjfLQhtZnQs4/DCNQ/EY9a5LgSrzgJ
         Z0DSLQsudURUez4E0NvnsFmBHuSDyc6X+eaTj7IxYPC2h69jy0iO7Gh20XAewo/iBLzm
         GxMNurdLGea3F1McaXdinIeDuCpkfqgRAri9wGBroMPjU3nzOFceCtR97AZhPgCZk1wu
         gwPuXoDMC+ifI9WHgnrBvHvxVfb+YyOwjKyDqjBasw3ovSkk7JW4b8hrNOIF13b0OJAz
         eA2v3FUVws+AirBAw+ekXENF4yDmNP3UcD1PyTwMSIJPIqUhCWpA60w/4OPEa7jT8XrM
         rptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626840; x=1794231640;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8K5TXnmWR8LIG5Tp7mnH1kUMA0OkWMON+TeHwvlViVY=;
        b=oco47ql87Dm8clN4YLib1tK/NSLOoPajdBQbjcr6QmVwfhKsErCWuEM/n3cCAUAJ/N
         1oQKFA0S/Al+DEVK/CjCBdpESNWVsi/6e/VaOVlnVkWMt1QNe+JD1PUOwqsQx8tK8bHN
         HOK041QnXyJ9y2z8QppLOga77C4Nyoc2pws+cEnFB4xxRtQ9Ol7o0WhNdX3cExkSwU/B
         +8Oe66ex3eTM7O2KXDfHQu/Wsag5x8Y6n+UM6wCYc9YBTStC8CY52gHJcjRa19lrolP9
         rCJ1sKkKwJCsxEGx3QyiNbjd5s/yQ36dkmL/3zN6+RBHD4n0UoEfKXHVYJdRy/ys8kJD
         4x3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwHcYHzmL/PG1yjxwJCL83XFnD8rzFEUfd8PyQ4+QmMa2k9+77dk5DKGUziHAPFJf4f9l37cLy2Exbb@vger.kernel.org
X-Gm-Message-State: AFq9FYJrr6q56R/tSvUvTaGQkk2Z3HRtN0ReAJa07m0+XAQHEV33DyEO
	LD5RgbmI7YZk1falTMRqxyqxenGitMeFVNV3Tw1gbCXF/V/n+/hZj8m/tNeCDXsWOeE=
X-Gm-Gg: AYBFou15PQh70i5HIHAzZrrwZ0WLem8zVueeBIyBj8IwQLg7kYMAqMKxWYsx7FYtP3L
	Nb0Hpd1HPJRv/EROTP97sgIqneSvd+FQNmo5597HjU/nODQnZqxmP42NJ0zupZZS4DJomZW2U9f
	Bnw2hAr1UlBiDgvWWnPZel63DjmvW99/uryp+/53Ob8KV6lKcChxJF6m5Mg9WEhZ4+K918pTDg7
	cvB0BYgA2yBNscVCIUGXQYxpyXddVrl6K8XkfR7mZgeVgBFdPTl60tI0gyUO7Q5k63e6fSoxmqw
	zi5gIW2rs+lmoQSKkXwpXX/KtZbGtEfAEmjLzOrC8d6SAqNl3aLc0mLf3q0BNuy43VLybkW/Gcl
	3MipbmvSbB1t2sjV4B8/wkJAiVdTo9T2G9MBtslgq6QOARXM+UzKgmL1OIuK2vVtLZ9xC6QyMkt
	H/2Vajx8HXmiCAZD13GK3rA0Dc62l+d15bLjlZSPS89HwRo+5hmOjZn9g/qL+d+z6YlHQbewrw2
	TmR/Q7CPJEURkQJ03sx0bMCZbRVON25UlsJQhgPGaENRzk7xdMprizCXnP17AnG+DO3IUU6wfhY
	Di1HzXd8K8fyvwMolBDvEDVbtMQDKNhStyxgh4R2DZetB5WdOg==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ac14fbdd04mr230324575e9.4.1793626839961;
        Mon, 02 Nov 2026 05:40:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
Subject: Re: (subset) [PATCH v4 0/4] Add Novatek NT37705 panel driver for
 Fairphone (Gen. 6)
Message-Id: <179362683894.3310106.5892756542563969007.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:38 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Fri, 09 Oct 2026 13:24:59 +0200, Luca Weiss wrote:
> Add bindings and a panel driver for the NT37705, and then enable display
> on the Fairphone (Gen. 6).

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Add Novatek NT37705
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8ddbace1197498d7e32d36db66641b7e1dff868e
[2/4] drm/panel: Add driver for Novatek NT37705 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9ffe0df0262b573c276cc17089d15a08b9b4306d

-- 
Neil

