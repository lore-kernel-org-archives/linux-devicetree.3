Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626845;
	b=F3mvgfFlUvoUQfDAb7xSuubxRCxzTGl3ztkc4aB7Z+4bUI3cDQmM9FgTNSstBJT4amja
	 2B55R6rwhKi5Wnn/AV+IaXlTDQi7hv7mJqQm/R9T8LwicCxVmF9StonbYfIO4HeO1GgVB
	 aGIcL85+q7i1C2DTpococMTS3HaiFe/7wd8Zrwgkw3/B8lh7G0nxmWDzO3zjlqqt9lW2d
	 0QXAgbF1KIHpZfmaGf8zgG658iVeyHET+gxRkoda3lRcadUjEUNbA1Iy7OWGZtbJ6T59q
	 E2O0fO/I44P7CqnQWwOXnZx3hN/H2h4/GUBoxrI+Iyb9S4trQ+JZjJBWOHr5b0z1REg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
	b=MgSjSf1BZvkZDW5PFw/PYMQ8xVP3KKZwCm9XhquccTfYiq5BdyMlKZHFk2OjP+YXyc9B
	 fI+wIshPiSHNUA0WyrubLm/45hzFztIvp2x3APjqxvk3doUtCuF1E3jzRWJekkqMxBZCg
	 uA2HP2tmJJrfr+X1fBXohg/C6qpaWQ1U1A/fMIrByjnp//+vMvujLIMi4wf3+x8l3Lpp2
	 8j9kUUZRfG9/7r84LAMwqYV0G48dB+cecWOAUohPUZBr4TQwMlf7Q/It7HWRR77BRs1Ua
	 SiavzLdhBbnPfhQocunbtvwt+RqyITn8UwHAWwc1SLoZvU+hlZf4+E/0XSyBgIfyTLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6MyQrtd;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED2D60A2621
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED2D60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6MyQrtd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so13370445e9.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626844; x=1794231644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
        b=L6MyQrtdRgTojq4Da8UNcdHLYgW40/lqqyejq6Ba2wWQQ77JV/8AbrZFrQQilEQG52
         vp0IXvOuuYFNG6czey/PnETBySbY0jG2C0kEDXfvy9AsvFKyHAzaSAKV9FaByaa926Sj
         vWLwz4YpVQIxjiN31GSXSeLGpxjrmvDyooV/8VnRgRLXGknMkeqFGI6WpmvHHbniWyuB
         4doj3edxKYyVA9z+hde5r8T9w3n7J2mtRiMiu3hLPt+Z2ZFUQrkPAhvigbEk9z8n9xUg
         AS4Tug3xzuDf4E5+IuuVWsnj5ZlSaa9Tz1PVw04MbkJCEcDRTnoixavrXvzI5VgVthkl
         JGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626844; x=1794231644;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
        b=krSX4caB3wxj0K/Hv1fXDEmDi8AWnCbxmgk4BYJf76mdblXO/FHxwlMN5N6lz6dBam
         f4g3e1SjgOEQXpXWFFPT3PaGQeGiQWT8BsifB0RI3ILHI+ouCSkstN55ciAGa5qgMRO3
         6EcfZJxHNecneL2B3YFCVpQH0c2VPmx63h3iI8yca4WI8H+YhL1Srmdnbk6NjW7C2RYB
         HbnIHuoI7YZ5HCeX0zXT9UXeYlV3dLjdSF6TqpU122LpCpTgKtgoel2I3BasZLf7JgP0
         NZ8Cc4fK8b1lpozvh6VoPdOn+h2nYNmzQQBIx2RMykZNFFpaQSGfbS6eSUuMwe89ejng
         pOWQ==
X-Forwarded-Encrypted: i=1; AKwUvByHJm1QQsEqNBAgMI655ArD+CmRiVz2YCoHrwJKfDkCMOXYNJ8C/QVxmgW0pAnZPvfOA/FIXF2GtX7j@vger.kernel.org
X-Gm-Message-State: AFq9FYINj0R0mmjX/Zz7BFu42k+iuu7bjWw/8bM1seI7ageRR1S7vRjH
	hOisssJS4e/50DZfLsa/Ve4zjP6KDDkwkqF4MM4MXKNin1xY9wnAMLv+SIn3u471RZo=
X-Gm-Gg: AYBFou2yJ+AWr7JswYduwnPiVMTBN7KGCFU8YvvKxRJkJiLUa8W8saymE40+FIQ/J/s
	P8cQxlCEMBpWEf/M5p/xecSJI7JchTGQyeQtOVjaTaxWCxA1DlCEFAPRxNAkN2exS9pwg0P8fov
	KDuNWSXwrXXrEKEIBiC/YB30s9aCwzAQw4NtEvePBpSvUGuhYvF0MYdzCRUkguDXspfNbbwK1J7
	MLUpz12CuB8oFxDHpUCuu6+gRLThK4kZYmma+DMsodSePJrgEHlhPdj4T4+hk35fPjZ+mZbkwsV
	VAI6lj3C9UFym2Vd6F1NIBPn09a/HPeaQ3sg5JwAkyiTPCqYyw0RfkXi9Y7Jjwiaijj6KwqQUFY
	4tU+nTmU4esuGS5GwXN4bV4sBcaN5C1ewWCgitaIf6NOU9X5ipMlqlpYNWw5nST8RN+eyiDQ1gb
	hrDcNSCjXLBDwIUlvZWqVcpy+4nGwbSsd4zc3RsRP0UZKmUuTgr7g1VbiNScumwol2h7YFCi2se
	ZQ9xTSXAxcL+RmPy5pVYWPU95QgJWZSIkrRR0zs0ceCSLxfhm2VHqSndO265y6NGID/lU7MFls/
	lpC3Dqxo65SjiKER3Zr+5u/Zq9imgo5Wo9ghDBKETUt0Q5f93Q==
X-Received: by 2002:a05:600c:6214:b0:4a2:9cda:57cb with SMTP id 5b1f17b1804b1-4ac151a9077mr246967155e9.1.1793626843602;
        Mon, 02 Nov 2026 05:40:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] arm64: dts: qcom: support SDM845 HDK
Message-Id: <179362684245.3310106.2514816704767701626.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:42 +0100
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

On Mon, 19 Oct 2026 12:18:02 +0300, Dmitry Baryshkov wrote:
> Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
> for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
> version of the chip (SDA845) and provides a rich set of the peripherals
> and connectors. The DSI panel is an optional addon, so it is being split
> to a separate overlay. To (hopefully) ease merging, the overlay is split
> to a separate patch as it depends on the panel. The base DT doesn't have
> external dependencies.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: display: panel: add Truly NT36850 WQHD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/79e6e49d681714aec69bdc24a4d1cb592aea4adf
[2/5] drm/panel: add Novatek NT36850 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cf022beccbd43c27b1e9a4b03ace28bd39504d7d

-- 
Neil

