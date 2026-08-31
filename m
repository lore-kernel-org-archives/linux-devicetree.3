Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F144C50B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 14:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186566; cv=none; b=uOVznV6Xlwaa2j/mRv0sVVNw4HArmGbOjul9zqmPfL0SpHyZ99sx15u4PLF8059frd20Isv1tje0ybZxsBkvt1MLyfwNmyZBRxU3bx0NZy3QddX5iVHg9thBplb0q2Wj3jJ5bQhzOWPkOWvmCmczvqakAD9bmKz+MmdWpIVVwYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186566; c=relaxed/simple;
	bh=PJxWhTWBgk9nj83PSTmBymAVfNevpAJLuTYvL9XX4gE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gPGPFymW2WBgQ2PSKDjqg4iJozXGnhElgGPCgz6Bd7cLrhmboDPP8Y5bj0BOCQP1RHCdcjTIhkC+rIcvABu+Dhv5E4snQnIC6gCsW47W5a2T4gwphnmZ4qPMwwiEo7V71ldVoWrhxQrroCF/l9Dzy2lm/Z8ej/sozzvsDfu3Pfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yb+Ko57D; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yb+Ko57D"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so24340805e9.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788186563; x=1788791363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEgwtiy+ojxDd7n5w12jJGzsilFfHyW+JCyjrGne4zQ=;
        b=yb+Ko57DHfIVsPFE9dyxTq1AAlACYpiSpwsSH+j2lMYorasS054our8J0igPQz8bjM
         +JeY+7b9pz7LJOdcGRL/X4KvXdkGiw7siO8mkduCp3sGuQcDh0pJmRV8wDwSFB3pAh4a
         ApEW4VO6v6O1AucHqg05lWWqJfvzBz6sn1BtIAxHBjU8XqFvK4aPKvrsunsyWt9FpqqU
         2L5q+x7lSogUL7NwLoe0HGuPIfpk1a8ZfVPFvWCOUSTepmBvNjYkXz0JSyZQV/hFc5dg
         f8G5IHhNDSreJ+8IKRyiYG4icQF4sxx7T6GLVgpALQ2HlwNF4JF9Mrila3UTFEgT8o4Q
         j1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186563; x=1788791363;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEgwtiy+ojxDd7n5w12jJGzsilFfHyW+JCyjrGne4zQ=;
        b=VrCEgy2TTC40VGiipX4dU/ciiBolnHt86m7OVTUAHBc6LgKyZBT56RJz/nSMFtdC18
         kYEnn+qFPdDEWyJKf7kpzY+6TR2Sh6s42GFUJxicl5SS3Np0XCpQ3r+i8dQ9iceYVVsd
         OCv4lhEzK+9t0dVkR552kJCUp8cHe7i2H4hzCJB0yqJmUsodZ3zcJuJXhQJbQjfdUReB
         BRI157kBDGTAPG+q5ENioJSFHu9rwjlG58p5S1Xps363tw8rY4up7oPsLvK3MTiwes6p
         8jmRAlcphZA05lQ3TNV/qrab+SENEAYuw9u0SHOxz2T0WL+SutX8GsDiyh5T+Ya01n5g
         xU8A==
X-Forwarded-Encrypted: i=1; AHgh+Rpjnxc5okYmDzIVoXTN+cE9vd5LexAd/PK3Psk2B/OjfXIINoKFtSfLR0HYC1HOyDDuEgklbKVZaeoC@vger.kernel.org
X-Gm-Message-State: AFuF++lNWEmdSk/HMqWLmDlEgDlRzCJh2A8+Q+rUfY8uMP8KjX05h39/
	WvHK42342mZ7gRPsZJrc4c2QHBLlgEQnMnPdYBdFv0lWX07wSfjHNSfrxovbgdKu54A=
X-Gm-Gg: AR+sD12guq//AZbUl/cc904UjnhPfMYEDyit9WbQr0wPth9mechj2a+VdiUufB9Lk3a
	hmjLn8p46k11Uy2TPR9/WgRQ/la8UtpDXV27kQ3uimTjrWu/1Ev0bhaNmfafjVSv2U/5FTrMwVN
	R7VTXhVuhR7G6alJTv/aeXGFcRVAa7L+zNSIiFcGivljy+BlCl9b/v1KG3eMCwy0Y9VtuNopFCy
	lKWyZJZBhW83bJTpTOr/zhOJDXP1hqInG1SNQJoZOKHIU6+yFf2mtMEVJteimKcg6DocZZjVzgu
	VWYB52qUWYOwD5eCVlsNTtynfXBkcEhDHsBGxYjki2nXUMnWyWkFQSMnvWDwBMfPHT2lgq6cK7H
	bhMxzO3XvgwNGBctpdRZ7DWyhiB62BP4TWqVlQdyYMLKSh4/QPOrb2zdYhXDOmx2xteUwzrKnel
	Cw36MDMfVmwPYxT4zJR7PWjmpKgrHGi/YBU1kpKU112xN+nPYT8ed8SqgkvWlJS6UJD6i/M0rsG
	Ss=
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr352107395e9.12.1788186562939;
        Mon, 31 Aug 2026 07:29:22 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm145266605e9.2.2026.08.31.07.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:29:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260818-topic-sprout_panel_warn_fix-v1-1-ded1e8d5f121@oss.qualcomm.com>
References: <20260818-topic-sprout_panel_warn_fix-v1-1-ded1e8d5f121@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: display: panel: samsung,s6e8aa5x01: Allow
 common properties
Message-Id: <178818656131.2615924.10826235312502503975.b4-ty@b4>
Date: Mon, 31 Aug 2026 16:29:21 +0200
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

On Tue, 18 Aug 2026 16:00:56 +0200, Konrad Dybcio wrote:
> Change additionalProperties to unevaluatedProperties to allow
> inheriting properties from panel-common.yaml, preventing this warning:
> 
> qcom/sm6125-xiaomi-laurel-sprout.dtb: panel@0 (samsung,s6e8fc0-m1906f9): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>         from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml
> 
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: panel: samsung,s6e8aa5x01: Allow common properties
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c3fd78f0f3624fff3dcf55d89326f90000367596

-- 
Neil

