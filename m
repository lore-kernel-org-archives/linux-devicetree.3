Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883DC4D2ED4
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858241; cv=none; b=BL2vSjpVUlaHITaRCgujeQ7ahDjcWzrpqftiK04e61WKbDADYuX/kFRpX7PHtHY5+4bPx5bbGCpHq3kh7X1OuYyJFhzKg8tOWd5CzBVNPjxq/hTVqPhYDyppc9nKcMT91iPmBor3/gf6v/9DcgoUe64ZIzqEmk0ZiBPXWcVKEHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858241; c=relaxed/simple;
	bh=R3MjWBE/Ujj+rmxiiXHErWZSR+OhISnpQEQhxQQd/9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyocXQ1fA6eBdGnL2soA+ryQ0hLydYEf14RQMBKBmbk7gUjRmelSylNWXSWJ0y5IgjBq9gXsEBruo+5ETvEbIcyJNjehY3a1Y60eDqTFUdxXTqIZWrlnQu9jL9qQuGzakz5AOhmvNb7X48Imj3aRztIFBXI4OLjMZ1zIMaLoIUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eIjTo9fK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eIjTo9fK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso105615e9.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788858234; x=1789463034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gRIuOpjz7PFWZps8IhzGrnOq20eTN92kUMY6nz/xu+I=;
        b=eIjTo9fKkE0iEOnRcbbv4kLIx9iyfHQ1InHPxh1QG16VDfgp+sKrg4t4P9WL68FAwy
         kZ100Dz9I6GSZH3zJVPyQMqyQzpJQFVnHIS1uXxveM4Ywbv5iGQeTSmhXNBBy2XeaBH/
         oIL9RDG/DQh441mumWHSuuKPbFv8OmwbtwXAeDpaO6bYF+NSdsXvKXZFJ849Vc8ulxR7
         xwvtoj3lr2yr93KXDailo6yN/d6rbc0Tcl3U/PcLA9Z0GLM2/p1G7x8Vut10sB6Fc2fF
         r9uht0fN0mNh1SHkMfpWXCsKI7dW4YzPuP8oCNyDnywMf+1at4xEB65H256BycU0M0Oc
         TXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858234; x=1789463034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRIuOpjz7PFWZps8IhzGrnOq20eTN92kUMY6nz/xu+I=;
        b=WpR3g2FIcXnC7DcJH0SZ8YmXADwISMy4a/i6yuV3Gjmo7NdRjD1VwuFTzZGgA4ht9u
         8jC7lyGXBb3qFdjssJ0gHgBIKEF6kHkCE9xUIg+x1e2jpJiDK4/9ylUqWyfZgMnxorPc
         m9twtXTg9jkolcVxJN8Pge4BEaPDlHo0Za3W3eHNm2VohghJ6BA8Ac5dh4gVQUCuJYK8
         VLoqVELpFNoUcW/JP5UL+4o2s7fpHpkke/Q1XRMPJ7sU23fZG15Ez4Qv81mS+pWLYelG
         Vi1+NvBFA0sdIOAH4Lu+NKjKk8ziaPS9SikbBdi6KhB/9W34DMc/wcVJVpaXI7c86Cq3
         TebA==
X-Forwarded-Encrypted: i=1; AKwUvBwraHarz9kZZb+UQcHqSOFX4a5yuIhrmKksZElNY3phr4x7CbetP1GOHX+27bK2KD9dY8alSoR7qw4g@vger.kernel.org
X-Gm-Message-State: AFuF++lj6kcoUeJrwCYkhGzfUFLYzTogC34nT+6pYVfoVeZJYKZETMcc
	U0UFZk/pXOcb2JGAEAIxPKmTCkxRyhyvGBqEY7muC8NGuUSmiGNBv+WN0WPe5XLlnQ==
X-Gm-Gg: AYBFou3q6s3FRGRzcll9CR5BcWJhKHGgFJToA2xTRcnH4OVvkN1/ol10/e8DL6RGtpw
	8/nj9XrajIXFS/NpWb4NOYbJj4am8b6zTnHzfWwADMEW3u3u9/68bKn5kMtdads8/g7hoBIKZro
	NjWPdGWq7ZMXy2oQSmZSnsjRCuazFk9EO8LUqGVX5bdXMJCyFjSaiOwQZMmjHJGQJfUPe3l96Fa
	ptbSUduM2AIvR2ZmWLIqoAsQL9GhDHLxL8d+Wx4p4uWFb5+dn3A6Hs5OIja1+X8Gyz6rTvI6VxV
	wiETNjWOqCLafKgPZWGSHOk88RYgp+J2i8LxlaV0il1korh5IbHt0un9niF/b9LskN8HzXROeIh
	OXBHv0u7HzTWegy7WfHlLUrC10syTTV5Mm2fYaarNQlW9znpKXDSBWpPZpNzqTtRZnWW2y2Qvwt
	j5UZFXakL4HpZhP7VLfzD/b049W7CPdYmCEJLi5z5hYQHF0tEBPWLFjMncNJECOZ9IZx7IK+Fl3
	3V3ZSaN84pbSrkoi59S4tQetG2MQg==
X-Received: by 2002:a05:600c:1c20:b0:49c:e7a9:ebd6 with SMTP id 5b1f17b1804b1-49d01daafe2mr3477715e9.8.1788858233348;
        Tue, 08 Sep 2026 02:03:53 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm278107825e9.0.2026.09.08.02.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:03:52 -0700 (PDT)
Date: Tue, 8 Sep 2026 09:03:49 +0000
From: Mostafa Saleh <smostafa@google.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <ap_PdUrwLIVGJ3oG@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>

Hi Jens,

On Sat, Sep 05, 2026 at 11:28:55AM +0200, Jens Glathe via B4 Relay wrote:
> The IdeaCentre Mini 01Q8X10 (board 91B6) ships with two SoCs: Hamoa
> (X1E80100), already upstream, and Purwa (X1P42100 / X1-26-100). Same
> chassis, different silicon. Stubble and the DTB loader need distinct
> compatibles.
> 
> This series splits the board description into
> x1-lenovo-ideacentre-mini-01q8x10.dtsi and adds thin leaves. Each SKU
> keeps lenovo,ideacentre-mini-01q8x10 as fallback:
> 
>   lenovo,hamoa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
>   qcom,x1e80100
> 
>   lenovo,purwa-ideacentre-mini-01q8x10, lenovo,ideacentre-mini-01q8x10,
>   qcom,x1p42100
> 
> No qcom_scm change; the fallback is already on the allowlist.
> 
> The remaining patches fix the common DTSI for both boxes:
> 
> - Build the Hamoa EL2 DTB like the other Hamoa boards.
> - Second M.2 3V3 is PMC8380_3 GPIO5, not TLMM18. A 2 s startup delay
>   is required or pcie3 fails to probe. always-on is a hack until there
>   is a real M.2 power sequencer.
> - sound-name-prefix on the three DP ports. Enable lpass_vamacro: no
>   onboard mics, but it provides fsgen for tx_macro and rx_macro.
> - usb_mp port 1 is not populated (no PTN3222 @ 0x4f). USB-C is
>   usb_1_ss0; rear Type-A is usb_mp port 0 behind a Genesys hub.
> 
> The Genesys hub is left undescribed.
> 
> UCM [1] and AudioReach [2] topology for these devices are online, too.
> 
> Tested on:
> - IdeaCentre Mini 01Q8X10, Purwa (X1-26-100), 91B6
> - Hamoa: compile-tested only
> 
> [1]: https://github.com/alsa-project/alsa-ucm-conf/pull/843
> [2]: https://github.com/linux-msm/audioreach-topology/pull/74
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> Jens Glathe (7):
>       dt-bindings: arm: qcom: Distinguish IdeaCentre Mini 01Q8X10 SKUs
>       arm64: dts: qcom: Split IdeaCentre Mini into a common DTSI
>       arm64: dts: qcom: Add Purwa IdeaCentre Mini 01Q8X10
>       arm64: dts: qcom: ideacentre-mini: Build the Hamoa EL2 DTB
>       arm64: dts: qcom: ideacentre-mini: Fix the second M.2 3V3 rail
>       arm64: dts: qcom: ideacentre-mini: Wire up DP sound names and VA macro
>       arm64: dts: qcom: ideacentre-mini: Drop the unused USB MP port
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   11 +-
>  arch/arm64/boot/dts/qcom/Makefile                  |    8 +-
>  .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts  | 1188 +-------------------
>  .../qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts  |   42 +
>  .../qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi    | 1185 +++++++++++++++++++
>  5 files changed, 1246 insertions(+), 1188 deletions(-)
> ---
> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c

This series does not apply to ToT nor I can find this base-commit
in it.

Does that have any dependency?

Thanks,
Mostafa

> change-id: 20260905-x1-ideacentre-mini-prettify-a5d349d8954f
> 
> Best regards,
> -- 
> Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> 
