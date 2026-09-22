Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2251C065
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110945; cv=none; b=oDC3auinyT4cuffDzp2w4UUevTwOTTVL/Z78BZHQA5JC7MKHJhP8+JyXNY605rZ11D0YtZykCBWjVYMpVGl5ONgE1UW63Pbgfs4TJqVYM2oZ26bJWL2aKoIt6gf6juh8q8AD3AFbTwxoWdPX+tuu2OyoQuveXa5YYW4akZP7xzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110945; c=relaxed/simple;
	bh=mUiTpuXZ08jRjcCjuhENhAkI/h8z83dpTQbKz9it2Yg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dZ7WibFe79l6J2oy4Ba+xNHp5V2p6q3WYkPgV7QugfyDnZ6KqiMfMCyQCgUW0wU599NrfcvAU+q9PPL8E/vkawY9+Ocy8BguDB0pcETkFMvIJK2mRej6SZCvArzyHcODdmVBvSRxmeOtzrfhbKsriwlNuNYGunxMQYLz+cS9Bt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Xz3QqWbe; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Xz3QqWbe"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109f067eso28050085a.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790110930; x=1790715730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=Xz3QqWbeNe6T5XRZz5L3+ChBpuAe4QPy1Y7mRbru5/87Cowhbal5ABl6u9iE2l4eQ1
         TERdKW/fX4uCs4gZiVPwynPb23FRQYsBNj4CR5aFLLDYlKY4M3Ir9uhjDfsWygU7s5Ww
         HyvmXKfYHhu+gwetWtM7Q+Kuw3YVA3QgGhHoJXqupjIUePjx7LhiGMDtPhatKgwHLBuR
         /7YOGD3GWNNj01hLOQhodylUG4ITUQ+KcNwlGjtGpdSZ+czxVMiZLdDKSOXmGQqPATQ9
         Tu59Wo3o73/oS7jmXsm8quAeT+Tbt3jir2usiSjE27Fss38BKaM8kC/77bYr4GFs4mzq
         XnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110930; x=1790715730;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9Tj2oRUZivsRV4DF4owfEOUU+s6qPBlsbxiJLCQngg=;
        b=wIvWAuUQ1ZQ2yenpCkFbICZGAM4uPsjSmKkHmFqqdPm0gHvpG3/4y3EAuePCg3ZDhS
         +ASbNVOFHFXu7Td7sRfVYUtKGMab1ic+HJQjGcHdW6LmerOecPT1eBVVBByKyFc4GEg+
         NI1AYOq7ZpVrgY3Z2dis5BrVrx3GIOQgNt6a5DcCXqOpLScCVzlV3SY4pkaikkp1lsz5
         HjBkmFiJfnGfU8KrXJ6TrTR0OyFecBEy4BtGsf6hy4OQsvbIY9CPmkR9e5hZgFW2yaaP
         FnTOk7yL6o7x6unrY7BuiVUEjE46IdsnA8J5a/AAQC9AxcqhKi6Aa6AYCAuHs031BZ/e
         2y7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjGZ/uPMHc88LUpX/HqzXwJDT4IdojAMhGk57+kSxQ869ZrxwQRoZ2dwGwnw/RpUGZffR8Ka+TXMlX@vger.kernel.org
X-Gm-Message-State: AFuF++k7mREUE6bpp+4WdoXsfPDt4xFAnCfajwwEz/G9tVKybo3yeeam
	egGOj9vrZtmfvOY2S65N2TxzMk1VxXzNjAoK2ledLeHHCS1CFvjFDpY5knvZdyK6cBI=
X-Gm-Gg: AYBFou3A/cGeU8Egxa0/7PvYr8PZ28ev3qqscI/HdaLnlva22AcKEIad2nXq4bD6/yy
	eQ6AEKgdxQSYnrB0HRknAoTdA9OPhdNKJhx1ZhGqb5irD+mJbMSG5wnurJyu+Y0U41Ic+1LEo0K
	1l2hadQHixy88O1nTNUHqqd57Rr7clRnrtwCkaJT+1a9kFA2WFvgujYrW86zN/FUPT0rclraxUF
	CeQakthTMP2OTDnxzOs8rdf9viir0AY+DIN6tLoLdqV9XjBeF387Z1LPkFxhE5a8nwwVA2Wojjc
	/ZbU2Zqk+BF6CuoalYU6Ybd2CFq8aMFRJCImn3OVC1eD05CDC0Z/1b7ZpNzWoJ1Ox0itq0jjVgx
	uzETnBekFeEc2OapD2Rc+wR5XdAsJcpi17Aq3hEf/xtWEUUWjRgwOUcVlzyAyAEFpJQFOZykj+R
	WXpKtXYVm79CVUeamTWAn2U5UKi8v4r/KM9WTmuHLlzPgJxVsP4oDnKge8HL5fBAW5h5w/BgM=
X-Received: by 2002:a05:620a:2682:b0:93c:2419:37d6 with SMTP id af79cd13be357-93c252555e7mr100858985a.66.1790110929661;
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c24822e3asm69157885a.16.2026.09.22.14.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 14:02:09 -0700 (PDT)
Message-ID: <7e32063f-f1a4-4259-96c9-fcbdd25c7f2f@riscstar.com>
Date: Tue, 22 Sep 2026 16:02:07 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
From: Alex Elder <elder@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
 kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
 <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Language: en-US
In-Reply-To: <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 4:46 PM, Alex Elder wrote:
>> I also have doubts that this is needed - I see no updates to the misc
>> binding, which would be referencing it. But then another point would be,
>> that you do not need separate child node, which has no properties.

Krzysztof, I've done some additional work on this based on
your feedback.

I think you are correct that there is no need to define
this as a special syscon with its own compatible string.

Instead, I can simply define a simple syscon with a label:

         tc9564_config_syscon0: syscon@0 {
                 compatible = "syscon";
                 reg = <0x0 0x2000>;
         };

And then have the devices that need to use it, refer to
its label using a phandle:

         tc9564_clock0: clock@1004 {
                 compatible = "toshiba,tc9564-clock";
                 toshiba,config-syscon = <&tc9564_config_syscon0>;
                 #clock-cells = <1>;
                 #reset-cells = <1>;
         };

         tc9564_emac0: ethernet@40000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x40000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1070>;
		. . .
	};

         tc9564_emac1: ethernet@48000 {
                 compatible = "toshiba,tc9564-xgmac";
                 reg = <0x48000 0x8000>;
                 toshiba,config-syscon = <&tc9564_config_syscon0 0x1074>;
		. . .
	};

That simplifies things a bit, and requires no devicetree binding.

If you think this is incorrect, please let me know, otherwise it
is the direction I plan to go with the next version of this
series.

Thank you again for your review.

					-Alex
