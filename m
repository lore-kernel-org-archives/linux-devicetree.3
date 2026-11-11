Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398570;
	b=reiDhQ/KJhmZ2EB8cxTznHHuHBt7lFkzwnz4/K4bG11WjD0BR943uGBmhnZRO/BuUEGo
	 DS8dNGiEfpmQDB5Yzxs6fC1lm79f7LwIQ30MOaFQlvo2cnavEtlLwOPggcg4M7Ai+tV4Y
	 NyApA2MUtM1kZgWHRacW8qvsDtkUZeBXnH2V6v4L7czQGamg9TQmRPU3n7XY46Fz60Ugi
	 QgAbVnKTQwehZF3bcOCKiCiYvhFIwFvI65w08VxKhrIm6Tt2t0fwDOynU4kLXcWjDPYYW
	 iYNAsP8GyIvpbxylkm2I9QHoHD5Go3ZU+KbTMvzEHAaHguzSZQ+irvgqhQupqjZDN4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
	b=VRuKDGsFPHbWeGPa/PKtjhb39BqCwu9dSdtdxNaNt9VnXEfrIQUDjq0f1pHBQoz7eNp4
	 Jtg2xouV6pPHmQoB2/tWn+PhKaZGLuxt3n04oQhU0IrMiPVrh16cAutpGDFjTV3gZQ5/o
	 LKyKxMcylCBhTL2awAp/tLj1cWTKPZEmqc/48gOowNqhwmIJ5xY6wJLHnFoLxYhP1R+Bh
	 NSiEZt62lJt4ZXqmKPusz83AcowJWzam8kS4lBw4bWCWNne3WnB1JOWSW1UdhTj8bAbJ5
	 7TW9nF7X2rbNWJIkK4klFkKTZz0oFmbfq8md0cURWpdT5M/YczeH/ZvrCcPfAD6SgSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Je1CYIjf;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E2E606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 12:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Je1CYIjf
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1665815f8f.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 04:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794398568; x=1795003368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
        b=Je1CYIjfuwflh3C8ZTO7fGiG3VT2JZ4/KZsAnIckMk5yyFTVUjMTyMSMVoowIwUALe
         rIx+YCcQd5d3c/Oo7ywHWhe+3KSTQ7o6rFpU0FKq7oz4uEO2xHVWkEcknh525ow1mgCu
         gWFknAYgozrE3xkB1Hf35d8etynb8NZA5amXxyEuDKuHJdX9BiOMQOk4XO6ih4oDz5ll
         jiNbUTntFWcfE3xAvdYsPO01gTShdzNlx4xruDnGGl89qAWG/eS5QeVSu9Tt1rrguObP
         WWiW9en2E3WuuFqlZwdLZQMuWBF1+OevnHMcH8EoqrsFJwJLse2YUIb6yJUacp0hHv8D
         xyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398568; x=1795003368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf3ojcAaOl5Wd2bB/OvSpA9q4iDAVUFZx+UCDfwTy74=;
        b=v7KwhFYKuMD34X+1rTMTAfX23IkD0GsyBzy85FAWLgr5goV9R1O2fBWzXskSII06qJ
         pGjwEHscb57RlDGvR0c+GhoblGe50NV+fy5Mc5YBXz/eBCmUI6UGwytDRMIZXO1atkDB
         6xzbO/8lG2NLOYLa3lcBFP07501GLYI1LjwplHJ7LcS5PHCBVFFm6Zmb5+5XHfYDow9d
         KJeoSvCH4DgiT7Hjyyc6Ng20RqCgCz2qz4POP/kcdORzTaKBhTJCRRzb3gj6YzAMJdBB
         to+ch6E4xfwrHVDgU9kZ6dhU6RVv472aXguIfeXSs2//EBigv55hJGvAeMVuMU4I332H
         o6sA==
X-Forwarded-Encrypted: i=1; AL+hErGWnJjFVg5PufvXyPegUi0Aww6MfY+OR2FQz16aakmkV/ONP+H/4yaLvlpSZB49ksXQODc50J7fa37d@vger.kernel.org
X-Gm-Message-State: APuU4Z+I697xQtu8yQzAXIn2GTA4e7JRrGVolguLRjJ9/jzfQVfFbVlw
	1IJLYeF791iegpGf149OmTjwRhPWGVBp3EdrHJ38ebVRTJBcMvm3hn5O+aWY+fMl4dE=
X-Gm-Gg: AYBFou3wnZ2qNwBlMDk0sdBcvgy3/Z6ZeeAnFLo1yo8kGN13xPAgbOKQ/roQxYxO6kM
	HKWMGrWe79pnVi5nULTzVg20LUXU6S3NwKG14hpdA3bAe+rbvlANzQ9x724j8vjLJzxJ0nsq9bs
	re0993qDUFntjmizPRyG6Gk6oioi7YuDKh4yt8xPrDOZVJFYS7FHwKq5dI3My98H9qSCsKRJ3cF
	k7fNdwiekXlh+AXMLDFA0rzd7wUOD7G21BcK4py37McqEXUWSUtUOGXLgrFJFSXvPvLbq8vTDH/
	4GAhfQoNsV+hXTo813USZC1OAUmJw8zJ/pN82fbmtesNviWNtb54VL64/fINQncBkCjMt//FN7N
	wPr8ru5+Ph73ntNXy1+T82I4piv/VYqWDmWkpnVdZgfhSqo990xJ2PcGc1SKQ3UpH2oixp4UpIC
	KWMnskoGQJUUA10psHpAUeLuW49+7mrmTFqJi8OEkxZvNQOj/UcU9qZHbIRAC81sOoFa6rMH79v
	p1asBd6qXXni3P0Dl6BTIx90LP7r0/lkqL9GY4gSfimxlsgRBbpgnr/7tUw/douQ7fqeXRwMiyH
	/yl9kJNa/Za/PcdLX0UAayKMXfFBFWev99DNrKyW
X-Received: by 2002:a05:6000:420d:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-499c86a10f6mr3780756f8f.41.1794398567805;
        Wed, 11 Nov 2026 04:02:47 -0800 (PST)
Received: from [192.168.0.167] ([109.76.11.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c377fdsm8869991f8f.21.2026.11.11.04.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 04:02:47 -0800 (PST)
Message-ID: <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Date: Wed, 11 Nov 2026 12:02:45 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
 Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Oza Pawandeep <quic_poza@quicinc.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 17:14, Vikash Garodia wrote:
> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   				}
>   				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>   
> +				if (type != IOMMU_RESV_DIRECT)
> +					continue;
> +

This change is not about requiring a reg though, which is why it should 
be a standalone patch with its own justifications.

Basically the patch should state why a mismatch is dropped instead of 
being reserved.

---
bod
