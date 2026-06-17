Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D0346E51
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781718010; cv=none; b=pKdIHromevkYcCvylX9y6+YRr0ztU1g1quR/j3GvSgGNsbE1WxG4fEbgOuQh2jPeoDHTIHgcvTOWVZnBX9CAFOT0BO4pEuNhdFrpzb9FzslGX47EUASVJFdlhzMU6LGX36D5dxY10ucPiWC0n/wnkW7FxZdLESiQfNumt3gtl9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781718010; c=relaxed/simple;
	bh=3H6Tx8GKVFXGcwT6woXKZw4U9eyeRFNU5j+1Z0MDS6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VdxK/YMxH2TuB6OK9jP9EIZ26L/UV0kULQsOez7x3CluZYOd7MjLas97xSSYwjCmbLC1tDMHKgchKR5gumVSy8K5aa32tZpBng54jMkCK3Ah32wVpfo0o9+ICaRcYPIkhpZjyhNK4uoGLN6rOq2VvQff1lp+t+T11u80Oa4FQZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ME3Wd1Bq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ME3Wd1Bq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so63570275e9.2
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781718007; x=1782322807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=E4aTYQpCEBfoHlNp/ih1aDYhCnw5Uq36PYKp2Wj/2Xk=;
        b=ME3Wd1BqunjbXx1jj5Nqrd4ZQ0HbyYsoc4LsCb+zo/c/DY4jbzO6IMvFSQRPn1XW4e
         0Rm+67aRIPdnLLaLgz7NbLkLKj5rdH46f8vV+PnvkM6lK+GCNg2cOk3Mmh9W/LY9syzO
         4LXczJCror55fEGYc2TEV1K33AbuuUv1TNchT2WHZe4RMQcSdb0zL5pOK5Zp2M5XAt6e
         bs/eX2UVglZKgI5FEfSaySKbWhfRHkg3TIk2G/grHGilUdo8Q7Eq48y5lPhY4Cl9KVby
         yVRXc5o1IV2ecGx+f0DpsHo8V27WjK9w1igw55HDhTLEBapvYxIl0xe15PzQTAl5hZ3k
         3hzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781718007; x=1782322807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4aTYQpCEBfoHlNp/ih1aDYhCnw5Uq36PYKp2Wj/2Xk=;
        b=DAKCWHQpaPtIWPmt3gmcV5FaKs+EoJrRuICIOhivaD39UuO8kPyZRWCkTIl8zjQtVB
         q0OoczxIaEvZxhVXWTcpwG1ERx8umRW5NDRHwhl2cgb1EDwMVPLDjLxBNzkRf2zkvN0l
         cxtNoJZG7O39EsuJ7cRXUfIc3zjfnKhsacv/mIZqb852isuqz3+mhNNTROTDMBBwPPEg
         t55U/7nCJb1k+N+hr+EaNlUvCUYP2MPMXCHWlhoBKxIYutaKSMz+cVWp3Gp8Q89SvJ4j
         iRxNWKXnSFwXZ9mGIiyNGWkgHNhrCbeWnLl/g8JICeWmP1igwdP48rAELAOyQdaDPp/u
         GeqQ==
X-Forwarded-Encrypted: i=1; AFNElJ987jhQWweltUCXmh0R1vupFshwvRxQzMgyk6SKNRewAT2UBNj60Ak9Cnxq/BgY/O8kvA9WWxnl+QI3@vger.kernel.org
X-Gm-Message-State: AOJu0YzoLGn2dBuuDRxbWK50vAYumrfH8Hmpi9gBd8KS8zoabu1bmFPp
	87mqkA07g45pVzNUQXIpTni9EpsViy157dKmK+ta3l5V/STfeqVyV1G7
X-Gm-Gg: Acq92OERURBgTUrOY0ZgAx0yBKeT0ElUJngqyxQUW0ClnL2Vp9GwFy83S6xS45Hdkib
	2VNWVaYO9isbh0EhXhR0XnE2aSAjRJN+fuuO55XbKSIz8/ZKc74/3NY2oePa8DklZ1l2EAZWTvh
	aVMaMZoPn7y/TgKuICNzNqghEjFQ0112Adcg1RubxMGs5HJCIYSIDKanZjn9Slod14/UalC5Sy2
	do9TXo3ssU3H5HJU40ce3A5B50KRVZMZ7L+C3Z9kEhezXQ/Y7e+6swnNDieXU89a708LKy+Qh8K
	h/pnsGN4OxktTf7r+u867C10kpF3VDgaDceVHwqgU5++LjsMTl0zuaofAyrNu37E4P5GLysYL7k
	xnLz7mvakQB1rWe0sTTjzuKHZ9hzkRF4vAcvtPEBnNXRmeWCxO937eGc5flG8/MCDuNRXdttGGg
	bqKNrTRv+PdS2l8oUGtKpvP44ZIOt9lkWrNoXsOfrhCtxzV78EXRPkRKmEqVNstkyUCNIIQTjqs
	jFVkhyf6lBP+boOGg==
X-Received: by 2002:a05:600c:3e1a:b0:490:e974:e01f with SMTP id 5b1f17b1804b1-492333ecb80mr88065235e9.28.1781718007311;
        Wed, 17 Jun 2026 10:40:07 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49234daafc7sm59819515e9.10.2026.06.17.10.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 10:40:06 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0f131ee4-d335-45d2-b6ae-49c18df1353b@gmail.com>
Date: Wed, 17 Jun 2026 18:40:05 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/10] RAS: add firmware-first CPER provider
To: Ahmed Tiba <ahmed.tiba@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
 Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <djbw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 acpica-devel@lists.linux.dev, linux-cxl@vger.kernel.org,
 devicetree@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com
References: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-0-91f725174aa0@arm.com>
 <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-10-91f725174aa0@arm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-10-91f725174aa0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi again Ahmed,

On 6/17/26 14:54, Ahmed Tiba wrote:
> +config RAS_CPER_ESOURCE
> +	bool "Firmware-first CPER error source block provider"
> +	select GHES_CPER_HELPERS
> +	help
> +	  Enable support for firmware-first Common Platform Error Record
> +	  (CPER) error source block providers. The current in-tree user is
> +	  described by the arm,ras-cper DeviceTree binding. The driver
> +	  reuses the existing GHES CPER helpers so the error processing
> +	  matches the ACPI code paths, but it can be built even when ACPI is
> +	  disabled.

Yep, sure enough, this patch causes a build error when you enable
RAS_CPER_ESOURCE without enabling ACPI:

drivers/firmware/efi/cper-x86.c: In function ‘cper_print_proc_ia’:
drivers/firmware/efi/cper-x86.c:352:21: error: implicit declaration of
function ‘arch_apei_report_x86_error’ [-Wimplicit-function-declaration]
  352 |                     arch_apei_report_x86_error(ctx_info,
proc->lapic_id)) {
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~

- Julian Braha
