Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689244;
	b=r2+62+jXMCzMbJOvVgTP73DriHYSX+LF5/VMR6YtE0KxOWxPbVwFNNsDITq5kmPYzaDR
	 RrGCBV2dAIZ4gOWO+jfg2+agifopB84hmV4zS0L6fHCyRxnqj9B/J90FIog8uJsoJRcED
	 Fshy/MoA8Q3/N2StkIIxjnPkAmy21Rd4sHU4A5P/zGEQRFkYJqb3rVoJgVjQAXQSpZ6Dk
	 l4ir/AXEcRPtAP/ptWS8iVnYm7T3e9uTWdw727lOrxo+9x5o4I6+xl+tXJ7UudB4r8s/5
	 Ftf+mtQAjNVqhllSN70ihdBj8w6nX5BFYkTiupcL6hAuNmGPDuYg9z0CtsFHKZV/glg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
	b=e316nxWY6bBLlnoVSEa+PvUt86yTWEiZFehM2q6chWlfFbMluzCxvrj/ZH+MKK+t9367
	 diXT40QoWdXgMAPLcIRz7MtkSOf+mcuWf9FT/o5/YlozliA86mbI2/trdb2vFHH5WA2Rw
	 6UuCqiXxKVF6il76DowNumgw7f5pZuOF8slGqjjbjkY82Rn1O+nPMdIVk/CUZfbNL6td1
	 JfYxbmIaxmmE8WvIpqB06kdZiZ4vkynk2/z+5FLGtPdqoVzuqV0uh2RbV+4Nsrf8W5OsW
	 FvQwLpVQEtUgq/3+BZUvWlI0fVu64OxbY5FEVxV6fH1eCJ84wYstN4pppOszswJH0ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5Dm8yJq;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D485606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D485606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F5Dm8yJq
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so2534275eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795689244; x=1796294044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=F5Dm8yJqZJ/eIFY4KXNhFuQ/PKsgI8ojbyn4Qk/Mv4AzNggmrVvBIXclzBnaw0Ihf3
         TAqc4T9s57gJ7Lq9gix1mZwarusULJYDrwY9qHV0IQhC6ZxMrrPZ0rCKn5ENv7LAIbUk
         Qd94p7yYd/mLJOckfK+3i/vF/51N/1jaVo5XPtSFXmoW/AfxALbT6BzDP7CbsZk+Mdii
         s9Alx9xyBDo8JoWEUTRl+c7vn48WMLXwuOWQH2lrvec3sDhIsL4poAdHPhkEfNY1Fm/G
         Oo3G4H7+tu2Xl5TJzpdBCNcKTBDXxFhHYwOTYsJO9HM0r+7+vNkQngffTDm8PHyhojAe
         EPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689244; x=1796294044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=qBNp2uImYZo2wr0477KgXkA8b/5finaWNH1SiaSEqH2Id6Vw91cAkhMEljyA/hLfUJ
         MdhFQ312gwVa/XuQ+aMTqaTXJfhxz7erVG4BI/xQXl1kTv3Z/jCHmy1CjOmkpGEIp2Qg
         0ADm/0ej/5EbeyLp7MUVoxgNcywhtb0it45iW8pm5spL7uYB7FpkgnDjmzmFIPfHD/rt
         7ZTulNpcf/RkUsSYmuZiJ3JWMDGkT4gMuLC5ZuS7C+ZwO4V9ORY9xZy8GD+WRMkbq/+k
         34B0jXQ05ZYT/RoYf5d3OUiR9oHQJm9zZAopgVUlOh6KeUCzn5z6hsvk03XGYDaK7eGD
         HHZQ==
X-Forwarded-Encrypted: i=1; AL+hErGTe7YG3KdBcBlU/yfiO30v4q0zHVI9Si4lhOmFPLRoQRILYII9i8FL2rdEZgBbBcCkdOuYRblEJ1Wk@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pb3nzd1s7Qo2eQnxtt7ilXsD0N6P3uAZXftMmSSkND5aBrd//
	HRLhrPQANITKMtNAOBellHUUyg7iQH7IBx5GEFUbT3MnSIQTBAM29q/223r0e+1ReBA=
X-Gm-Gg: AZFdTZdTQ4BORVZMVlBSnADTYe5F93KdHiS+xfD91hc3mE1iPIfqd7yJhhS8uqs6bNd
	leiVdaMmHKmnX1HgA8TM6ZEEgWVsi38RX67JVIVsTOC/SvT+euMKvrX1J5SarOZp/EvTLWdsdku
	fmyf+G4YxNDSNPSrD0ErgwWZWC+zvCD1bYznb/uTdZMIQGH8D1XXpaXruYWkrTxdSWsYCMMIWPB
	iBx5u02lu0vgd1wNzMe9MngBkPvwMwNmMZe77RHclDoUjkPRoe4PNOPdAnpXqpRYJn7NuRNbqmZ
	+90/jJIhI61srMu/L00/RrAku+geHnJdqbYiOYqhU5iwUC8xbRjD5YfajiUfbkMLwSCOtDih/bx
	8Rx9c2YVK8ngAZ2bVE+LdpF+fypFM1orvxhZu3xd7MV7w1ztAj0g4KSnnsrfppAeWbtUFJacAPH
	rcJwvbKt0YJGfqTPlHwnBtngojrQxr3YVzysonU7xsqdnXpa1lap3O2OVSXseVu8aZ3zhCfXxZw
	wDwpaN71ISCzIaPTTUB38qsxx/+okhnadQpRveIn5J7sWQPmVPMWkyQ7u9sFOrF3kJiinqJEIQX
	MJO+/ikbipAG8F4t3iOXZxlDp3qipA==
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr4653486eec.13.1795689243454;
        Thu, 26 Nov 2026 02:34:03 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm76487652eec.11.2026.11.26.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:34:02 -0800 (PST)
Date: Thu, 26 Nov 2026 16:04:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	christian.koever-draxl@student.uibk.ac.at,
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awgLGFpH73_fcnbC@vireshk-B250M-D3H>
References: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
 <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
 <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>
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
In-Reply-To: <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>

On 26-11-26, 17:49, Chuan Liu wrote:
> Yes, as shown in this patch [1], I forced the above two
> "assert_single_clk()" to "assert_clk_index()" and it worked.

Maybe this is the right thing to do:

Functions using assert_single_clk(fixed-index-0), can be converted to
assert_clk_index(fixed-index-0). Lets make this change in the OPP core (in a
separate patch).

-- 
viresh
