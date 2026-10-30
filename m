Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371758;
	b=rjiyS1YgcphxzRz/Cqk+sl/JHg9OxbMRkRSCvV0Z5fawybTlzYRapUun6tOB/Z7t185T
	 9Ph+Rum2glXfeOyLkx0GS+7e5P/gQGCZL/D9b/82IAhqJTiIKeYEf2nFMcYMEMTcmz+s4
	 /a88TSAue63rbIA25AuBOUW4cYbYYGPXSEjq/Vu2ALZBc60fjE8rQWpqbFISXU8l04ocM
	 HACBLhOykTbja71JPGYEKbx8qn6Cue0eV9kX9FlMUw1dkzRcYFOlMBMq/2CEjbtszCMHU
	 YIRz2BbR+2xW7/NOtRoNr/XJtBPWvqjYXa2/c0jtbaPU7dchg+eN/uO5WG8PFAHq9gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XAhfjhspXsxJ6CWCwtPR3SrtCWMLYo0xmkxFNwdbO+Y=;
	b=IS5+LejCKTocFYXIlDItVz7I57IpJSStui/oJSywqx1dvfqHxwnTGFPfXzScFKEeztxe
	 fjWZRAUBrWg9aEWh1xffFJg+zgDNeh55Obk+6cwxxOs7JIqgKN518ktNLskLW6j7ugQSA
	 f0ChX7yUYBksTywC3rClvSsadWQH7S+FW52ZXHHgY6zM+17ufd6/wODjYVFEANLn1GokZ
	 +gqipesq4QvInonXqYVSvSrJje+g/hzRbGvWc1evOxFfABUCv/ZyQ5QVSR/8p8S3P1qVG
	 eB5wiBclrAiaBCC0cbwEoGRxAExYq5hTeULyaZ2CQg+sge1MRrTHINAjV4so0Wyff4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLL6pRrb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37722606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 14:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37722606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLL6pRrb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1472650eec.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371756; x=1793976556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAhfjhspXsxJ6CWCwtPR3SrtCWMLYo0xmkxFNwdbO+Y=;
        b=fLL6pRrbqEA9REVxZgdPYFuV4mpkG12//IIS8MuGk/YWbAjfVpf7m2Uwl7mePYqMg6
         wInSrMPoF1sKTEBpo3v0DNLmDQ0iMiWuz6ukBxtmzFz/0iDzothz+jZh9IxP+VhushIu
         2RMsm8OTgGdouwJwKlbFBlNK+5xGmAHrkmJYp/8hep+CbXS4sHzDlHSXbna8QdL3KmSD
         4bvBybRNEobe8D+Ho8qLCBpb/juA9fsjt68zobYEsvTvXV/BEVNwIFgxASEn6Dem6SxS
         vtgaiSbRNiAYFumjzwYSyH/INmnEiJ77e8VN6mfp8FA82n38IWUbwjJUDQleFanBPi1x
         u9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371756; x=1793976556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAhfjhspXsxJ6CWCwtPR3SrtCWMLYo0xmkxFNwdbO+Y=;
        b=2gMtE0IHIMfpITBHFoiISpcswF3nwpJx2OPdGXJ1/JfFJCDCBfGLv28VtS0RlD94CI
         CoOIkA7t2Lu2YN/Xn1LJdYoFuRKqyQoqVBTpNfdyGpapu+8AMMR1MCBf/Ynt3OCYWYss
         IfqAjWEmu1Eut2YCqNkSJwhkngJ/dJnyKW2cfwqSqLt1VuwzTHbxCOiexv0+ld20qQl8
         RfWcfSMMkDZWH0GS5+V7iGy2whwg4zRrq98d0nhNhc6HK7aj9FHZn1HybNdM+3rng6EL
         Ktosiz9V538TeZoDAm8P/Gkwrh0Y9PBmluMryQsHo4auUQUINmEkf1BAD8kEM/mzl1B1
         szJA==
X-Forwarded-Encrypted: i=1; AKwUvBz81qkrgGQ1dJAUqoeb4ccYG9FFAxuKZXb51HdkMcNMHINOfiDjO/3PSzyzCLFwkDjoI9AOQJsAUWw5@vger.kernel.org
X-Gm-Message-State: AFq9FYLjtcTZvs0UyeuNOsLY2V0OxoF6Xje9oFelqukRVZRO2C+XAAnm
	1lEmnh2zY8iYc3VL0O3TQMHjfMVfMyfQJNfVaWifpWmVF6ILyd0mNRPQOA+R6VS0
X-Gm-Gg: AYBFou0U/COIVVa2ZHoJ/UPvNo0MM74k2yyq11T8/1PSaQ/QSOXCmgzQcM0+oBbxno0
	XHsKlK+eCkVftX6/SC2LWqcemjLxh4uAFfNv/THPAiNu87FRVcPZqQe4gfKwbwh4nNobU+5hqDa
	2H7OwInMBIYgpeuhmjidyUtfPCYW7G4C5IkoFREgGSu7ELu+T41UiJWDFVFLNL2MvUVk6OCqD1m
	T4d76pWYD3kMoEY7oQVFQk2GKRwlCp/m5JrSSQSNaCqf3cJB7RKk/Rw9h9OIaj58aUkmBP2vHxn
	/TvPDh6K2c7/dCWpQjxiWUxo+jJmezakfUfim1wsPdfPXYaswdTsuJ9CqHjJA5EOi2ckrBY8zY1
	kvP6pLMA91z7sOdDXX8w7AdqZAR5aRZm0vLDGniXClkMBYtGlE2u+kbwfL1Lk7jmOslX4vbRWJE
	3NYiUg32JcLbjhnh9pAedaO7EIWIU7pu2l2qJ3hXpBmh4iTLIDVrOa53bvsp4w/vs5ebGSkS79v
	j45lDJOFVZqW++xsUtmvb1FNQ/Cftyf3ItgaRXW4B2T5VGJUAjc7XXXaP6Dh9c5pp76TJtw0XC+
	h1WhSr7BjA+24rwtABTls1aXYNGbPv3QPkYWpGa4jsldk1lmeZ+W8v9SjIz+N1m0aPtgNvoDW4i
	Zk0F0TnEXuvEpUz1f1xn3cQMgUR4umPMITZGbPA==
X-Received: by 2002:a05:7301:6183:20b0:36a:1089:9836 with SMTP id 5a478bee46e88-36a423c8988mr3537014eec.15.1793371756093;
        Fri, 30 Oct 2026 07:49:16 -0700 (PDT)
Received: from m.tailc35649.ts.net ([2401:4900:1c0f:329b:addb:f0d6:4274:b5ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm7975547eec.0.2026.10.30.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:49:14 -0700 (PDT)
From: Mrigendra Chaubey <mrigendra.chaubey@gmail.com>
To: sashiko-bot@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Enable HDMI display
Date: Fri, 30 Oct 2026 20:19:10 +0530
Message-ID: <20261030144910.44353-1-mrigendra.chaubey@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-186080@kernel.org>
References: <sashiko-outbox-186080@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 27, 2026 at 04:29 UTC, sashiko-bot wrote:
> none of the included .dtsi files (such as k3-am62p-j722s-common-main.dtsi or
> k3-j722s-main.dtsi) define the dss1 node or label yet, because the
> prerequisite AM62P/J722S DSS series noted in the patch commentary is not
> applied in this tree. As a result, referencing &dss1 here causes dtc to fail
> with an unresolved label error during a dtbs build.
>
> Should the prerequisite patch defining the dss1 node be applied before this
> change?

Yes, this is expected. The patch depends on the J722S DSS nodes
(including the dss1 label) from the AM62P display series, as noted
below the "---":

https://lore.kernel.org/all/20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com/

With patches 1-5 and 14 of that series applied, k3-j722s-evm.dtb builds
and passes dtbs_check on next-20261026. I'll resend once that series
is merged, unless the maintainers prefer otherwise.

Thanks,
Mrigendra
