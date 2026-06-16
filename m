Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D178F386426
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620658; cv=none; b=Dovmrtcc7wxeTk7mns7D3cgG91qR1p/oNuWy+Kk5joyH7WOrrd75z/x2m3mgyrEknEzykuyCTdSAMp6JWpxnKN8UCMxUh1jIBlrdPVioAzL6fP8Es58x7QZ5Md6gxp2JO+gScEq7qHebeqA1d11xNK46VfXXdViYt9fLSMTQ87s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620658; c=relaxed/simple;
	bh=FfugnIQHm5unZ1sPR1Y/dZuhbcMyf+Hu3CPQK9MdeHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtkMPRtboAE1co51NgXqcDsmpQ5jI446ddYnFXzyHPywdH44Y3f01q7IrcUnEnZk4WpvLqMYWpsjDpAKZ3ukXQJ+g0o8w5E80gCeWbnWZIiSokWO8IDUXiICRpZLmOht4S9U6OArEwGH/OgkyHYnL7HWlzpo1TUTd9H7d8rmgI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD6KhlVl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD6KhlVl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ac357c55so44397135e9.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781620655; x=1782225455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=j5+URZt3Wu1iRceLE2DPySkKJNC2rK90kTRHgoMPIB8=;
        b=LD6KhlVlHlwayDjDAR7n7v6Y4dplTfNFAimIfTXZLXetf3revKu7W/sGFuDAe9JAb9
         Z6SfCwrYCI50699JAjL10HwWrGQhnZ2jan8dh0jyVGY6CLpixBZL0ZN3UvGb/0R5ooD2
         8trGIoCX3YFzOHSj64taYDS62KbPiA0flRYHVZx6jxewInu9F53dLj69nfM2YzriQdRU
         BVSO222j71YZ5hirvvWlC1sH2d7u8S8YXJW+Y1Qtx8vVlihOe2VO+vU2uI6OYbiKKCWo
         StAyqvtj+Cf0BhWWvCaeekXK7Y9P2Gd+2CluXmt9WfmWKZ1RVjuAQU2EgjMWrZUXSUcd
         qTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620655; x=1782225455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5+URZt3Wu1iRceLE2DPySkKJNC2rK90kTRHgoMPIB8=;
        b=EwX5EtXdkjNR8DjnwA94wDh3ZknnjcAps4WP4fN7HYbw+N2VkoY55+DbyFe+/os46R
         owGLr+s2gBtfMu4yLJRUl/VSZnScp5b0BymvhxBm7wej3tS3bFytYnbWGsPUcFRpLM0X
         07IJM2yyhwhuO9XcANS5GzMNyl1AyJ2CNZQyGqzbSRcpJhdPUn7jKrOS1vOcGhjINTVk
         OFx2fNlMdTHVvUO3f473efAGR35GGsms/e1u4BZjj7XzRp2/8/KDPHq2z05TJZFg7vT9
         5Rlv33zm7xX9of2NhZdg549BnXPybV+Or8/ea2OLNUACCrTQwV5IgjCJkI7t3tmBfU8q
         7IaA==
X-Forwarded-Encrypted: i=1; AFNElJ8TtD51i1OArlv1DSR2YfWIGOY7vt+8hN9qrHk+Xu+iBYXUEc3uffVKkCC2I9fC63YnVy5Js9OUOsp4@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzXl3KMz2qnS3lBWkeCPi4Ry7kgpIOEAOrXTk0IkjvNqLW2F2
	2rBMuw6+REtldcN6cnaK7ybVoDNJPxekJIv7RR7qlTLFr1dZ404aNRgv
X-Gm-Gg: Acq92OFdQetaiOn2QUr6Bi3dvUS83kKIV03aWL4VIKlmRDuBwvLma4ePdDT9aiGDpEe
	K7+vnabhvkOkD5xxDLfk0uYOnn5AyRXR0J3OyIPl0LNtbfbkDRLKB6AAOgWm/KwUwRn/8ap2x/E
	SSeZVr7GBXRZowWNrqc9CrSAjlYCSunEAmGT7rrmICef81BU+Z0DI/+JhhzFkLxHqmL8+9r6xro
	TmNMSHhbvuhbql1Q0gHqJ1QS9TFrD6Ka37jOsSTC08ldsO4Ar7s82jvWXSk9fx8/kyjxUD07um9
	FUPgjvd+jjMkwAmdBBUzXbsY96t2+32hjezNO0PrkixxB3wgehlgVmOijFt/FRzcRdcboRUqcka
	JRWnIPjEn4FcjblIULplRk0RSml5eGWk1qrciF/ldjN7CqiNqV3BzOJ2sGRNZ5lPt/gNnzzhuSW
	7uED9BaWMQzy3Va1/ynqOKdaD8Ys5CC/C2F7KPCTqblCAwPJHNFLkXKgHvbVxcmZJ2W1HNMMp8m
	VX4AukIRVGdDvKh5qaSDbOuS8LALQ==
X-Received: by 2002:a05:600c:3543:b0:492:3071:1db7 with SMTP id 5b1f17b1804b1-49230711dc1mr53184075e9.28.1781620655013;
        Tue, 16 Jun 2026 07:37:35 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461eaa0d1c7sm1813947f8f.7.2026.06.16.07.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:37:34 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <18c34b11-04eb-4e01-aad2-8c18fbe26efa@gmail.com>
Date: Tue, 16 Jun 2026 15:37:33 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
 Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fenglin,

On 6/16/26 11:08, Fenglin Wu wrote:

> +config INPUT_QCOM_SPMI_HAPTICS
> +	tristate "Qualcomm SPMI PMIC haptics support"
> +	depends on INPUT && MFD_SPMI_PMIC

The dependency on INPUT is unnecessary, all config options in this
Kconfig file already depend on INPUT due to an 'if INPUT..endif' in
drivers/input/Kconfig

(Yes, a few of the other config options in this file also have this
duplicate dependency on INPUT due to an explicit 'depends on'
attribute, but this file is in need of a cleanup.)

- Julian Braha
