Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD5B305E28
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098599; cv=none; b=mytaNxCQdjvEMj4iDeDXDFv1yjWWeOsrqOtRPPX8fJnkKy2YUIIIQuv2tNPqD4xBkd1vKJMrXjbgc+mnm3i1dgG+IvXB9wLNZy076uoOB4nogNyU7GU/ajRIMGV/X4ShktSrq0xE/mYbs8XMM98k+p4rT9VQz08sBVK4i/XDGGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098599; c=relaxed/simple;
	bh=emGfKnmIZb6rCs8OZKzdZXrwFmAuQEq6nMNa9HGSfnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zx7C3nyo7/t6cV9/VdddMmNgINqc16QtB9WVMJToonLqaDbxcdxUnZktb00l91dZ3aMkeh09a/YaPbsevmrN/w74q9AWeSjSdAnK5nPLsL+rBHTuuu8hcS8puXW8mRgqouW35tnQHGwsFxWijoslEY3+FWIhsalhKsgmnw7j0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBHB2g/e; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBHB2g/e"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493be1b9682so6601515e9.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098597; x=1783703397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BVVBWacKQnUKHRJ/kNMwnkPuIh3dvCLwl9oDeRFKEKI=;
        b=RBHB2g/e6ijufvET+gxYBqY51EkljKeCzobdWq//vxzxbADtOt1DHtWiD1jn62kxeh
         jg/sH1hNIXd2mcTRz8ZNnxRBcWrVOgZVpzjPNBCGTLXUI0C0AcdmCQ7s0hdNxeI3FNby
         j00JDfMXgQ4JADKOWr4kttn0twUAdl5Inpza4aSS+FGSJGcVBhqnXiD1k2ZbK/QjrM9Z
         5kBAsToJ5naREClrrcd9whva+qBwOpS8ehAulz5Gy4sHLyCP+JrcRF5QkeCwYlL9+gb+
         OGf0r4YVxAur1xQNYJwVrUhYZD33y7F3UnOmmd08vOrko9GurdPZCkC5Ewu/WFT9lbhi
         XohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098597; x=1783703397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVVBWacKQnUKHRJ/kNMwnkPuIh3dvCLwl9oDeRFKEKI=;
        b=Rqub/D/CJdnOmg9mmZRIng/5nRhQa76PhVx95cUAjogIcPAK9OeTCuAKoLPvkJBe69
         OIk/FOg4wu9MPjjQ4D0Tb1TiRDa4QaA7gs7WDEieqAPZjEIuMHrLLJCC9pxcXT+A6YXU
         xxVgXGqgp+k8vasMIXisCgDQBtR0Sm+zdbiqeXJcGUS9tv73AMBI8ZHDSR0iXDHqH665
         b1WNej+4/KUk2OWifbmCbfwtbd5X5H1+NC1S70TGBGTYI0IMtQBq3lXZZnUiDoUBT0Vd
         lkqd/yAhqQY6d71r/Ixm1SEPz15hmsODJBPJH/RsOBM6EVr/DNvXAD7e2IZPrq+4F5Qn
         LzQw==
X-Forwarded-Encrypted: i=1; AFNElJ94z+61nk8NQvNtbHggbg1GfNCFdkHmRMcu0snUXYiSWg5kAcovgESqe44WhFpIh6nB4gQ/5WXEYJ+b@vger.kernel.org
X-Gm-Message-State: AOJu0YztFRkE3N2ylSGkOzEv9WfmEjLtc7tZVInP5TwgCow7i/h5hzhE
	7RxTVega3PI07MqrWxKMgF96hP5109ohFSUE3l+kQBMi9RbWhjfTfoym
X-Gm-Gg: AfdE7cmGke6lVNx+Wx4AxFY1k1S+Gu8cU9B+Lc/vkiz4Wl4TZMj70EUd4v+myckEiFC
	M728LabukdOAoIqqI+7H7i6wWJUI5UmXTh6Rn7w5TuC0s19R54gNW1K3Q4L1SRq6ye+ipkuj+CW
	FxQsLKmzsubTxqpCv+39A8Z9AisJCtqLvRsBSP4jtjGBI1uoiNIUom1fNsdpthgn3V0KoiIXa5c
	gBfMSM1M45W9Dmn1WyBCgKVvFr38J0n1JL1dfphcCtifxXoXuZv69o/dppLOA9bmv6GhKIp8l3w
	Fqx8zhPT4fWCEWuuKXeCeGkT69Fef0WCkyyFdWFiK0vX5435nIE1Xj1xpc/GVSwdIk1uy/ScG4A
	drtNaEbKY7ZDIcZFY+UR7K7aM9ASXA0aPY6KbmzmvvvGz8Mo/icBYoMGHlaBmUjEKZbciRP1Bnw
	gUHv9a1j7em3Hqc0jaNSxcGtlAs9R+vk3QkILReDYJsTymtjoHpNkKEhq3G3nSON462tRRKXWv8
	pvv5Cm+
X-Received: by 2002:a05:600c:6087:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-493d11f2920mr1870605e9.25.1783098596625;
        Fri, 03 Jul 2026 10:09:56 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm919323f8f.4.2026.07.03.10.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:09:56 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <297d28ae-78ff-4a15-a4a8-0de6a9e2cfa5@gmail.com>
Date: Fri, 3 Jul 2026 18:09:54 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: Switch on ICP and BPS as make
 options
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
 <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-6-595df9e67790@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-6-595df9e67790@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 7/3/26 16:51, Bryan O'Donoghue wrote:
> +	  be called camss-icp, camss-ipe, and camss-bps, respecitvely.

Small thing: typo in your kconfig help text.

- Julian Braha
