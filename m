Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087163B19D1
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781891199; cv=none; b=gqsGqgYUGZ8OyDPnRoGTAPsajBhmmad5jqGKWglvSEKxK/A932biTOON1aMrPujdaiPrFE7YJi4sthWYFR5rjOw06yKev2B3MmS8h6fIeWEACxFsAICv0HmvBlyUtJvae5UeExSHqj/fFTAIhU8OXx16c0VnuO7CGqSLf0z3VX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781891199; c=relaxed/simple;
	bh=H7f14CYwNP46ECpdeY80MJ+vB0wytZ/WUeIVEgw1f+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i03CR3On5I/ZkA6/3i2SAz9R3o4ucFB7SoDG9zMnrlrLILXZ4ABhHp6tjTEddVY0rPqEwMc8ryQywODt1aRmK34/UIwSi5jr4FkC0VE889PyRYlRIO6kCP0i3141ax2RQQtjbOBRXH8csdR14/t6pYTOr0hEXZ8xdfhCp0GSFD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/eQFjIG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/eQFjIG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b7866869so22588525e9.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781891196; x=1782495996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=H7f14CYwNP46ECpdeY80MJ+vB0wytZ/WUeIVEgw1f+A=;
        b=R/eQFjIGJOmwIPpGAgwCpcPD7gX90JNhp63BcLpbxsSmEfYWhC23L8ze/2dfcH9zMN
         KJIGipk/2pZUHiSDNn6As+WfrOIekJ+SNEGKEK6+YnM6mX47b5wMXv77XGvIN1zaqIWw
         WGUekG7wyIg7AfKUrV/HQ+VswK4gC7W4UgCknjghxhb12acvDOKqh1Ffi8QHWyUMbCnw
         mPg6vw/nkHpOJLF1wurbV8ZZPiOmTu3Stw0F5Rlyf4fUFBZ9e5RULvZG9K0yzI3mlkSA
         57owJPUssf1JYAjTUpI8kqH+VJ+GYZbxgzEgDoQWenMso/gtj/Kbh6nISmYtAn3pGASU
         WqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781891196; x=1782495996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7f14CYwNP46ECpdeY80MJ+vB0wytZ/WUeIVEgw1f+A=;
        b=mHOiNWYgUmwg2yrrXImi6FqpG+pm9CoO/X02AI1mR7FzIoJZxrVoWYdxx7pz0V1je+
         fAfDHlPZnfMlw3011XJRBCOGR8/eZyGawg6SFNIwjX3rORV/IemmLaWpdFM9rryjAD1E
         PHPoWWA7OLdPnw9SmSQeyp7WMJXlPhcKI+SCX45j1J8oh7TTV86dZ2Z4qwslii/+Hh07
         qOBs2PlcgUN/OqE6s33dpcerkcXLfhmLN51u2X6nknKoTWEo/2b3p3aJXBSCSFf6Rgmf
         oBzU3N3ZWg/xYUCNFBwq4P6YZihFtJZu7ho0I1JhskRB95L/b6CeXADvLLqBafS5ii/Q
         Y/IA==
X-Forwarded-Encrypted: i=1; AFNElJ/u2wnJ4LhY3GEYHbD/0Nq0pi89ibUoAmPYhmmdQFa4wmzrp4zU5pEC4LFay5n2g9T+E984jViBxHe4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2gOFq4ObvOXJ+Gz1GJrUoT4HwbJyu0ch6sNtNP9SRlvlYPsw+
	2I0nM8rk9bkDQkAdzQ8/ziRVPOP7T83AKf3b7uMXqckpuGDUK4rujcxK
X-Gm-Gg: AfdE7ck0hCeZujWj3sOuGHhJvqGIrliSyL2ASEEmPNhgMv0BKsdnrPiblCWoQv2eOWn
	85m1B/GKynFcD2jgA9gO5U3ZjiUS0MS2Oug7LsOjgvdOhhJs1GdYIPNMynD1RQYv2hph1ex0leh
	AeNMbDXljVERVsk9XXmg5zTZn8w2kWXr8dfXPU4n4rAhnY7mMwT5G/cmIUNLXAyWMRfnSYw50p9
	mBmCntMnTM3DmAtdrE27p2dqNvJMVqeL6xLY2Jko/gcv1bDcv0sjZRLcWemSxoWs8zAOhSRRiUT
	x7nskDl3KL7XBzvXQEElC8VNyJvYYM4I3myAIAL7i9scKtlv7IB6p3jipMcsp2b6/2PY6nyqKgQ
	3ymkOMjJRCHa8H8LE0WTKezePp/GWn4a2HhBU7twH8d5AweaUz70oIoOt5sV91U10zPUcdsa7PA
	ZhAMoA2Fyf3+cIUu7gspXcQEYI9c5wviNG6YdY7CXmMPuJlVYudI6ZSwMCGSzg8nsFwL/MiI4ph
	Fw59lM=
X-Received: by 2002:a05:600c:a15:b0:492:39b6:5a30 with SMTP id 5b1f17b1804b1-49242591d5dmr53790795e9.35.1781891196410;
        Fri, 19 Jun 2026 10:46:36 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249238bfbsm1569755e9.5.2026.06.19.10.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 10:46:36 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <84dabe49-8405-4213-8b73-433cf736ded9@gmail.com>
Date: Fri, 19 Jun 2026 18:46:34 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] ACPI: APEI: introduce GHES helper
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
 <20260617-topics-ahmtib01-ras_ffh_arm_internal_review-v6-7-91f725174aa0@arm.com>
 <58f7163f-2fce-41e9-bc35-d1d8e6f4a298@gmail.com>
 <81dd6d0d-427f-49ae-9573-fbe84dc2185a@arm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <81dd6d0d-427f-49ae-9573-fbe84dc2185a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/26 16:45, Ahmed Tiba wrote:
> GHES_CPER_HELPERS is intended for both the ACPI GHES path and the DT
> firmware-first provider, so I do not want to tie it to ACPI.

So what's the plan to fix the build error when ACPI is disabled:
https://lore.kernel.org/all/0f131ee4-d335-45d2-b6ae-49c18df1353b@gmail.com/

- Julian Braha
