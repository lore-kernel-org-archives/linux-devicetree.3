Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D54E5346
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414654; cv=none; b=ifHCir2FnwqQAc/+evDMVkWk4so6/1PgzCl+ul2Qy5ASmMJrbXcsLtsiCD5IBrDEmBRG5RlujM552jRafsu5Ue496HBj9f87aOjVnjvpcAGc0Fk0KDH1wVDW56Yj45FaAcjSLE9LrJ/fn3ivaNy0ia2mqPJE2/BbatnxwYe42Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414654; c=relaxed/simple;
	bh=DPtgRhzyzAeLmGS47IlPoFEDwn+LdYIoM5JOg6vn1jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tluk4X5GCJKefgYQ9NzS1jq1vaj8YxA2I32MS2aGunFoPUSUuZvAQMYXQ+VZzN+lVnCP9eYQPrOyL6f9c5iJ0isgaCr7o9qx99MmhwZOPPh2ZKVcT8KIuajapULpWwKxDEQqlTqNL1qKwVqn3essARvSVfscmv2IB86pvhOVbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaTdNt4o; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaTdNt4o"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so1522165f8f.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414652; x=1793019452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lf9FLL6T5/Kb7gEctiirso0+WOoWDflrhqqlYLNOZeU=;
        b=UaTdNt4oSh9tXQFDkjdXsFnCBRqQhVDjFVJE/FaqQOT9+of9Ny7rpMMZrdMSV7s0Kf
         4RusC9VjHHubQzgj/bGezsMkzlGVi/8V69ledDOWvB5C4Hjrb46wqVy7WeIRRG+r0sIv
         okaZGZx54gZTKPr01JZfl9RAer/vNimHubJ88/+pHpR6bgPHjDGnKRHf/S8ZxUIsN7L4
         rkcT50oiASX+oL6WmOpTLgwNjpBFhYUt5S/UIyMgBULFJp5a83ASOaBfA0G6XtLlRb8M
         i2BEU/xVCDQ9lua1KKdiuSSBKqR0JfPgt4HZA2ODMF9kqZPbku+7zgWJ1hShJ9hbl0X4
         kFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414652; x=1793019452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lf9FLL6T5/Kb7gEctiirso0+WOoWDflrhqqlYLNOZeU=;
        b=izalHPKAo4pK/8tZje99LB4MMG3v9g0Ca+52M5sJGg2SyDxhxH86eo2EXdU9eK2gfM
         zarD0gYyMFvM1DlpGLkVQWYHhki8Bxay8ThX5lBzG+z2GjbjCLz9PFO7cv5bQAIOCrmy
         iAT/ksdKcM3Yw1dBTK+dawSusgbDoOiO5HvQsD8R2qe2cEtKAprPesKaewRN/RFcl6WX
         psEoLQBZ62Bp3whkGXlU29cPe9l4sND6uG3QXd+wxK0wIrxiGEt+jEPV0qPKMPBPtWnB
         Oy3ZAWi1UjIRyjz+CxNeSL+VwqjQuu2dMAGTLDwiE2YcM7Ggfje+vt1IDHTAtp7XS1s/
         57cQ==
X-Forwarded-Encrypted: i=1; AKwUvBypoUIk7RdafKhhFV4DyQw8LGYX6JphCEEcZiBdizyKa003RuLRha65YEaysjo2NLNwvkQ6M4+spMoA@vger.kernel.org
X-Gm-Message-State: AFq9FYKGtfGeldlbOs+fvaQ+V8fAy8PbtL0sZmYXPtnAQ5uPjNcBXeUH
	GTFl2nzzAs7KkAWv9X5Z0/YgbYvM7q7/nNbA8aqHtRPwELLAKiQ+ZPXz
X-Gm-Gg: AYBFou325vCSN9UgGVIToC5oUDsSlFOB6/fTkiioZiH+/HCvzpBrzT64kyjnFTVVbEo
	ai0ItY38P1ao/RkVvfBuLwUpn+//zhbXiPqWhX8H4vHBFocqaeLR/dHpDoxV34L0htWcEr4jTh1
	6D6HfZx6GXI6Y4PCULrk2DYpGsgjTPQyODlHMQLD2IwZny8BXGKotPrqVG1VJMYzRAD+0f2OccS
	Xpb+oREWinmZiSi3lTGKJMirruAysa0guF50FpbIxKaXiYdq+DZlWfV9JC9iCfe6punRcKcMDaL
	ATy3g3X8vp0JDoXANh5wSRb+YMqt1oBWftYpveooKPwE5Y0OlBZjmbkEzZ7gB1hQ6/BMblgByA9
	X5Nq3c+rDeBV/5TNI59w+f/SNuaD/tR+onoOtNyDuIk5Mcna5nHrs9JAfiDIcdS0X04mys1Hms7
	dvGtu43687abYM0VcyUrbWz2E6PSzLmPnFeog1qL8VIJefdC5BUeIHhnL2R1tR6cXoDVfbXFJNL
	HbCEv9Aqv54
X-Received: by 2002:a05:6000:4b15:b0:48e:1421:ed49 with SMTP id ffacd0b85a97d-48e14220c4amr6571820f8f.18.1792414651426;
        Mon, 19 Oct 2026 05:57:31 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdcc0f20sm22643828f8f.11.2026.10.19.05.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:57:30 -0700 (PDT)
Message-ID: <2c73e54a-d2b1-48cc-827c-6c29c6664697@gmail.com>
Date: Mon, 19 Oct 2026 14:57:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Language: pl-PL
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/08/2026 22:15, Dmitry Baryshkov wrote:
> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1

Hi Dmitry,

As requested, for the series:

Tested-by: Michał Szczepaniak <m.szczepaniak.000@gmail.com> # Motorola 
Moto X 2014 (MSM8974PRO-AC)

Thanks,
Michał

