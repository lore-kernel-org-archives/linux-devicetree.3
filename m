Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52ED23BD1D
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 02:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789181924; cv=none; b=fnhBQafcYI1VuwebSGCKF6cb+dcj23Bh5dBbr48zluNtuyGJ+7MhsVaqU2YVl7GfeGyV9NKgstZi1jq/Knx8T0kM/KgCojhmYqohtp6xz9wkTJFZYHcymxr0TWctOJCfz3TCYY01o2TiPMfOPvnN/8YWXBL+wfHvBtMcB8y6DwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789181924; c=relaxed/simple;
	bh=eSMSFNDhHcuZywdW/ntrBOBVUVUzy2Flfak8YtQJ8ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvmpXs5tY6tF44hsmryOFfNn0PHDx7dDNOLdZhtmYKRsXqGVQIQvBqLJJEHKaghS7eWORhptewEPFEyyMj29c9cyiqoWEGr5+LF/r7tk2vDtCi8Np9xWpGgiDVs5rTRvAlmSyp/ccds1vqG4gRCKKVdS79fDagxH5PJEYmy8ddQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVWXDX5G; arc=none smtp.client-ip=74.125.231.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVWXDX5G"
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-46683b030d9so439787fac.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 19:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789181922; x=1789786722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5NXJrefjVCbSoUXB82MU8b4oR/5xGZAbgRkHWjhOrg=;
        b=SVWXDX5GJtB8uYSLqkPlfycgJg8MendYM7DkvpwRDQgM2i9G5tnVpUtwa+pqxQCYPj
         pksl/ZTJkVNcHsKw0wjJRmzXJNqlwiSURbOrXCGqklz8Eb4caSzXMsG15huXY/To686R
         dytl1ia2cFehJarP8FFJ4V+DfYBjyYCK7b2EGlYFocS5HSll0xckMC3WCojUPGjcCcGT
         P4hC+F6cPqjHrJ5mYH2sycXxyLZFetv0wss8c75apJB7blsY9MLR1bZZhaocFoVqYLXy
         xGirqV4KbDcHm/w/WKjq7pp12Ts8Dg5PQIv7brQjyuVJ3nXLvxVbPkE69gsX5eXrpHIM
         v20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789181922; x=1789786722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5NXJrefjVCbSoUXB82MU8b4oR/5xGZAbgRkHWjhOrg=;
        b=sNTuWIAMhv1rPCGAdwdw9ikV/DA7bqe9HWqnnlIRKhTjAQKN74q5Dhv4iAcPrhWle+
         Rn2bzpaTzp3ssorubcpUBEV0xsWbvhhiT6K+mjH23y8Uj7BqtAQ1ZwPc5NydXmeSUjFK
         Gbr3mHW3h4onO5bqxyTQ1RO1FgVWw3fB1MaFzG6qNWe+LdR4BM6j78zpj49uJZqEgX3l
         XxBPXJa4AtjnQ5oWaL1Wo9mlUPlxkMmMacZPHD0hdGtnSr2ZwjgeWAhhGWy1u5gAfZby
         KoOkfBDRNlcGXnzlHvyj0CGOPwSNhYL429cUeIdwdbzzOYazEyTLW5L057cmuo0mcVKF
         V1NA==
X-Forwarded-Encrypted: i=1; AKwUvByGoJSwkzdwyO9yaa12je3e+pjh/UJQYs2KsL78Are9Og3IDWv4Ts/IMG9Mu93BSLIjq7vtIgyqCN8J@vger.kernel.org
X-Gm-Message-State: AFuF++n8nxm6QXfI0h/i94dxew2dJAR2Ixs9VG7YrcIbYA/BZU60Sl86
	q58mpJbjjK74yADMsZMUkyl6ZWIya5kTlWrDcoOn6G1N6wrHmBnHnJKL
X-Gm-Gg: AYBFou3PyCE32+fUwOYBMlY5ux94xDWTiTT9OmbqvkLo9GM6eUWsvcGcnHsXicW24xU
	dHHHXlGdpcTzCTEobUatVy6C0UcDAjjD3K1YAKS+lWedg3tTKZSGAJvWPyUsj3QrHJdcnDljY2b
	LZFyAPbfnicHfZb0jK9K6863a40KbC1EtJZS6hd/AX/TPOcUWKPtoT20M2CJG0ur8dKLnEHRl5J
	Y6N7vgZxHkzT1O1cEv6reRDOaNNEH1vv66HsC9iBzsbo/SfsWrv7z0KbtoqmDm76d3X5E7hEhwv
	EDm0PM71q0eYX4qVauy0kQdlk/2JBv0hLk1031zTpOCAMGhvX41px/jwMYZog1ofYH+szJTh2Zv
	f0B57GTzGKC2QuXgQnXm21xNAMe4C9ptCqHEGzteJXWd9FJux0UJXT33MsrUiWXKF9f1aKKfDAe
	ggJDSSblZouff5Hs6Xq7WrpOdx4tYV6+97cpV3n4yKs1Nd0rlN7oqoQ9gyKajcdpkWSSrXMz5Gy
	0M0HrEY1cQeJS4G
X-Received: by 2002:a05:6820:28c9:b0:6b7:46fa:1692 with SMTP id 006d021491bc7-6c0bbce6f3cmr3794765eaf.39.1789181921726;
        Fri, 11 Sep 2026 19:58:41 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm3636585fac.5.2026.09.11.19.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 19:58:40 -0700 (PDT)
Message-ID: <56dcdf77-2a82-4efc-888b-736f512e63f5@gmail.com>
Date: Fri, 11 Sep 2026 21:58:38 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Novatek NT51021 DSI panel IC driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>
References: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/11/26 10:37 AM, Nickolay Goppen wrote:
> This series adds support for Novatek NT51021-based panels
> for upcoming xiaomi-clover submission
>
> Although according to datasheet, the IС has three power rails
> in the use case of xiaomi-clover, all of them are wired to one
> fixed regulator
>
> Maybe I should create a dt option for enabling CABC for panel
>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
> Changes in v2:
> - Use devm_functions and renamed structs and functions (Neil)
> - Added delay before deasserting reset for stable initialization (Sashiko and Ryan)
> - Fixed dt-bindings (Sashiko and Neil)
> - Added a comment about set_display_on command
> - Link to v1: https://patch.msgid.link/20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org
>
> To: Nickolay Goppen <setotau@mainlining.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Jessica Zhang <jesszhan0024@gmail.com>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: ryanbrue.dev@gmail.com
>
> ---
> Nickolay Goppen (3):
>        dt-bindings: display: panel: Add bindings for Novatek NT51021
>        drivers: gpu: drm: panel: Add BOE NT51021 driver
>        MAINTAINERS: Add myself as a maintainer of NT51021 panel driver
>
>   .../bindings/display/panel/novatek,nt51021.yaml    |  89 +++
>   MAINTAINERS                                        |   6 +
>   drivers/gpu/drm/panel/Kconfig                      |   9 +
>   drivers/gpu/drm/panel/Makefile                     |   1 +
>   drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 791 +++++++++++++++++++++
>   5 files changed, 896 insertions(+)
> ---
> base-commit: 99cc957e3ef3cccd72d2119c8eacbab39af0d1d6
> change-id: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967
>
> Best regards,
> --
> Nickolay Goppen <setotau@mainlining.org>
Hi Nickolay,
I have patches ready on top of your v2 series for the Amazon Fire HD 10 
(2017)'s panel; however, given that Sashiko has found an issue with this 
series, would it be best for me to wait for a v3, or would you like my 
patches now to incorporate into your next series?

Thank you,
Ryan
