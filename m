Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974984;
	b=ZpNuIn1dn9LPxjsD1OX2VbZ0fyLilgaZbqTx/HhAAYwy2S784wg3ZKf7KQjPdaNY8o4G
	 PKh6wh5b72IJCTvRdMtxm5HHFCJsLSdDGrhUpqrN3kpKOFAsefk6Qk40LPJEg1avyQi6Z
	 812GJj8oppic4Y0MZK8rZ2P0tMXG9PbTeb2AfvyfYUEvMSgqQXmV5+8fcbb+cDEqRHeVl
	 ppGlGwLSLaXdVFebDVwM1VuSWZaRYcsZ+Glp+LuH80icEM5zUrQawAHo0COWL6YhpeIc2
	 iDhaHQ5uzka8Vzvixj7jScW+7gyceb3cHvbqmEt0wrwzuv5ouGm01LrgONIH6ZTUZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
	b=oXRtIH5vjsJ2bCUvUFtOqwtFPlQkFAgHbWOgCuLOH6jmodcc2U4pXOglFphyxf2xJk9x
	 qDFUB00NsuFpHlleaa1x9+gUs//ldr6UE4delm3vK7bn06LNW8rp7Tr2oEVdbXtqTp/ik
	 z0Z72MVjVRaV+1hR6q1hjSB4ryV8wcRHGtso48EgGdkFazJmH6fCtG8sCfNypPDzaQOey
	 mxcT/NubZQGWRayXRxnq113JkbEeFC0mXbzO3reqGYJIFKT+1xEL1UnnQyvpelHTeizwx
	 IDn7P+L9tk3fLSjQC8pDsC7VGGHck5xuxeebDc2adLemTWGwcY/CZbeiLKa0PPeGp1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="A/k/dzgx";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3CA606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE3CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A/k/dzgx
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso1562979b3a.2
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974983; x=1793579783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
        b=A/k/dzgxFGHZlnRPKB0uFI6RamiDqcObc53ls5NqfEmj2xDJOQswLIvnDVWhoUj/1S
         OOsihDiG+3Gv4PBnR6VH4yMr/F6jxy0aYVKrnXYEqnVrf/XCqBhlqhLjIMbZGiHXjYRQ
         TtFUzok0tjLSq+9JtQbSdfjYDhk0oezU8aS86CtASqyVE9eXcAL02GPUsjSEuE3Ig2i+
         2mCLr88OhzqJtBR8P4dYjmec6q2utQ7jzwRnurfkrYWsPB3Siqmm8WkE0Ahey105KuHw
         1jD0MT7SCTK+x0qX4z41EntpYGV3zofbXUldvJVBFsJrr0C5UVQlqm8MTu2dQnz4eACE
         Stgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974983; x=1793579783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKp+d3bHeDhxK2cX/G/plq+5MAzOmIHe2O0mVksp/JE=;
        b=UiH/zXdRsCmfyi4Rcj6SR3+S1hZ3Hos4MzVtue/o+G7W5MbeX53Md450e6aHoWnoCN
         Ff+BBbqF4D7YukhiehN8AoKU/ZxIxa5yAaLcQzjMOt988JpdGsXigLNIJkAsU0eLYafg
         Gb6qFM0+FsmOKQKpO8nyxsrs0peSjDEzX5B6mLI5HQLIej1k6LJFcUgvEeIKB7snotyl
         Ydyoh4QrlT1e8SGXLMFkgJB2ZG0xT2Q/25zUAX4xiY7nCt2DPgUjNklx2U/9HXW0J9h7
         u4N4FG0o1pIfazsW9F3F5uehgbY4TZ93N1LSs0OLetLoPBXCj3Cewegbi0M1OiOayfOh
         IdaA==
X-Forwarded-Encrypted: i=1; AKwUvBzm1WJkZzI2R2CG4imMEDhoMhg92767ZahhoMi210I2K16Qtus6rd9ixp/e0SPPhgXHdjmjpoW5XDkb@vger.kernel.org
X-Gm-Message-State: AFq9FYLYmFvbBtiDONNfRMjM/mIL1g6PMqLlS6iYdScXOWghaQyJoHSr
	HgoMsfKKWOYnJKSC6cpa6EoruRYhsGc8qTGyaaU1l5xgz/tibZ/NHrwG
X-Gm-Gg: AYBFou1WYRnsLh8TqlVxPl90JW1A395NSXCByCpFo5JtPrV2yhp+bthVd2rxYxyJEm4
	QAe7MlyZTu5qd4kzyh6Tdkt1+Doa3BrJvpUWsNgpEeT0UOg78NpFXmN4+23lsWy27wpFa1UgO+7
	TMxYtoLlip08tf8MZLzwj+Rv9+W8uRX1ulax9efxaOHn3g2maoWvogEpOY4/ip7o/78V24Gtl06
	eZrMUV8Dvey6XE0iD2o5lihrX95CTdwm4YXQzyIZT/VkQMiOTCenIoBsXYsx4OiTFPFeslC8Xla
	8iVCB8tRUWhUEq4Uz3RaTJFWBdQ/PX6zHnAbiDOZjkuWhj/OXHMk1YWuWWXZWfyuU2a7BzHp0Dm
	Gg3v4JV8MKZ1L4LwyGuWuLFLoz37a9qZgMQ3ReS867BDi9HPkdqAkQYx7g9fPI+Whk+F6Dv5Kbd
	zQQm96bYftj7o/p+8kXyA2nTY1zIj+c132SAS51eIZ+KmTSvDMuENm/v0Rp1f1kt2CPHuKj+hAG
	cNU3G8oM4ZGKoWLbObt3fAWPbPydiihdb1QZMGEELkGIB1QLeRrE+fOGuM5/DvXW7qylA==
X-Received: by 2002:a05:6a20:ef1b:b0:3e1:c08e:38f1 with SMTP id adf61e73a8af0-3e7cd4d9f61mr3858101637.14.1792974983056;
        Sun, 25 Oct 2026 17:36:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d86790sm804169b3a.1.2026.10.25.17.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:36:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:36:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
Message-ID: <b5298436-ed79-40dc-996c-887b2d4bca73@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
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
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:06PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
> interface. They need only a reg property, so document them as trivial
> devices.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
