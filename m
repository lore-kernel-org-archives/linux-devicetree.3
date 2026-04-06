Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E692EAD15
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 15:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489919; cv=none; b=MaF+vD1xQCWgDtsC/RK72gKGVgRz8WEmATB7hAOrP79Dc3SbF6KEy9nk9twU4cXnNj22iPRa6aGd3JtEPPUe6NSpawvx+qwjhnKInB62hEWzVVjNmqhqR3fXOJ9bauvnQc4eXIYfJ1tmWHIxZpfKBMutBFdfOVa6Q1dTQdJ6OrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489919; c=relaxed/simple;
	bh=49+ciCmPwibB8Kivb7U6s7rioMxVkCMH2tw+szOi/dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EH6feIzEy11i77tQQuVhlRP25OpvfD2LikAYX1yFuLLu9G3mVd4xAVIuzvodUFo6cPrGdKLHMvFaxhpBMCIJqJIuTn8HXl1cHTXMv5QDsY8fAh5u/IlMdnirIsdhfBE0QGehK1izZ/YQcaWI56dS46+XOu4+Qb7zyS3baqAm3Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hE+7lcrb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p9c/4YdS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hE+7lcrb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p9c/4YdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775489915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5Zet8J4rK0+1tdnDTvli0Ek2YpzZgM64BeAXaz+iIs=;
	b=hE+7lcrbCIrCYPnUlAOayIuHYA0ZZAqTbwNHHNawG47tsx7WuJYbcqTJ7Vf3SkjK8Rk5Ya
	KUG52t90s2y+XWkJLQX4y9DqPCYVWsDHz3r3Hpi2Is47QQftsVW6gpoAsw3IxrBvPZKoBT
	lyd5e2DVpLeTJAffyTD7Y+bHeDDxdtY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-G2_DlorYMNSyjtmbyKVWJg-1; Mon, 06 Apr 2026 11:38:34 -0400
X-MC-Unique: G2_DlorYMNSyjtmbyKVWJg-1
X-Mimecast-MFC-AGG-ID: G2_DlorYMNSyjtmbyKVWJg_1775489914
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d60fca52b9so341950385a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 08:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775489914; x=1776094714; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5Zet8J4rK0+1tdnDTvli0Ek2YpzZgM64BeAXaz+iIs=;
        b=p9c/4YdSmbaz/BYOo4azgYDqeaHh4Nzc4tdTb2T3AwKbb2PWYCQuS1KbEp+qe0qUN6
         0sSCP6oj2PUHdF75z2PHXenbAU6B37i5WStrMkfcaPRz7itFP2jIiGQ3Z57jiN00G9kd
         nUHYpLZntphglHXlJe1BNxFQpzobCNv6ZWsCysUfjYsC88CBtplPcxwo8GngcPAQs4y6
         QE0bgWor6HoKNYrEaPhkJ1XGzTu4o3kTljtE99u32eandYrruF/bcUXLvE8y7Ep2Kj/F
         cMvMOoCb6UIflmqUSOihBYZCP5AgqT+Df69dNarmA9PSdKBuu4MeHpiMWhDGHtrT23/Z
         qG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775489914; x=1776094714;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5Zet8J4rK0+1tdnDTvli0Ek2YpzZgM64BeAXaz+iIs=;
        b=b6kPU3kr4Z4enk5Gch3Dt0g0TSbjTz5PIXZFTLwijrwZNnu7ggD9lgT4Jw/TTKMJaB
         sCMpPU5vBy8M5jBb5s8POmghZS1nzWBFeSO4zL655MxmzspBmvqS/WToh06EYYL70+wG
         sR1fNHF4UJs1gTCvsFqKpZAT1LJxZRC8kyuVpF2MHjkPnerlXX5oXcNbWi/RLRCIBEz4
         kkBCZ6l77OKz7Q1tH1qDAinSIkt/650IfQClpkF+FgVS0TXmx6S/fco+pLoHy6UyQ3Qi
         D+GFjVH72jQhyCn3YtM9P0M18OOzxv4B7lzozVFoZofbip2u84aso0DUl2TpciYEBTka
         UBnw==
X-Forwarded-Encrypted: i=1; AJvYcCU0b48RFGW/xTw838B3eIDJADuRCpVGFIp+oRQFtETFxJLv93OgpeX6yznQGmCuL1xmYzhoVHBjVRQl@vger.kernel.org
X-Gm-Message-State: AOJu0YzYXZzTxJH/g2smcDLm5dUtdnYZynx8QVM8whPIXX/cHYoc58dk
	auHTd0J4Jb80bEsNsh5cNSiZF25SiUkHAQ+f9X+5lteeZynxE9HLxL7ArSz9fURsJCXu/XdI5au
	7yN0xBAHSG5yDVHo/Ca1zlCN0z9exRMzM+hTJt5ayG1RIjGA7k2LuDxJD4LVdmDQ=
X-Gm-Gg: AeBDiesKXBwhqsOkxXquFhSSoABThpzWyilBlYNOr+cEna9ixghjya8YQ2hXoasmQPk
	JRr2QxPsrYnsOJ6+J6tPuOqLc0HTKcckJH9aO1ZRoiNoiUA3AcsLzY0W+OqadgQ2GkG9icbd22c
	x4PmBcFM7eJ7a+igZ/+1HLtMaRrp87JI1OpPhjIN1LjodGJhxvfnBAZyryZNSSWO5nJRkEuqGVQ
	411rsoZg2M8jAZgcFD+U/S/o9jU57h4+V6Lw760hFdFksalXCr1g2lqVLQW1C6q/3101mE9/iYW
	YFlMO6NICCRSYhZXBm8HBJ9hsMCMRKeOZKzc/De3ejrCgj5bis1xG4OPv0FaaoI2n9UjGxjuCVm
	k3//4z3IZ9tJR6tFRdVc2SOilL+OlpxyKUHd/lP5gRipiGlthqjF2rtfK
X-Received: by 2002:a05:620a:4490:b0:8cf:d510:3b5f with SMTP id af79cd13be357-8d41c8a82a0mr1883134785a.31.1775489913888;
        Mon, 06 Apr 2026 08:38:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4490:b0:8cf:d510:3b5f with SMTP id af79cd13be357-8d41c8a82a0mr1883128785a.31.1775489913310;
        Mon, 06 Apr 2026 08:38:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a5393a07sm1099166585a.4.2026.04.06.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:38:32 -0700 (PDT)
Date: Mon, 6 Apr 2026 11:38:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/2] clk: scmi: =?utf-8?Q?D?=
 =?utf-8?Q?T_support_for_SCMI_clock_rate_rounding_modes_=28per=E2=80=91clo?=
 =?utf-8?Q?ck?= policy)
Message-ID: <adPTdg4RJpkjc4Cg@redhat.com>
References: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306-scmi-clk-round-v1-0-61e2a5df9051@nxp.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Peng,

On Fri, Mar 06, 2026 at 02:20:11PM +0800, Peng Fan (OSS) wrote:
> The ARM SCMI specification (DEN0056E) defines rounding‑mode flags for the
> CLOCK_RATE_SET command, allowing a client to request that the firmware
> round a requested clock rate down, up, or autonomously choose the
> closest achievable rate.
> This series introduces DT support in the SCMI clock provider to carry a
> per‑clock rounding policy from the device tree into the SCMI protocol.
> 
> Patch 1 adds dt‑bindings constants for rounding modes:
> ROUND_DOWN, ROUND_UP, ROUND_AUTO.
> 
> Patch 2 extends the SCMI clock provider to optionally support
> "#clock-cells = <2>", where the second cell encodes the rounding mode.
> The first consumer that references a given clock latches the per‑clock
> policy. Subsequent consumers of the same clock must specify the same
> mode; otherwise, the request is rejected to avoid non‑deterministic
> behavior. The selected mode is passed through to the SCMI Clock protocol
> and mapped to the corresponding CLOCK_SET_* flag.
> 
> Patch 2 includes changes to drivers/clk/clk-scmi.c and drivers/firmware
> arm_scmi/clock.c, it is hard to separate the changes without breaking,
> so I put the changes in one patch.
> 
> This design adopts a per‑clock policy model, not per‑consumer. The rounding
> mode is applied by the provider per clock (index).
> All consumers of the same clock must agree on the rounding mode.
> Conflicting per‑consumer requests for the same clock are invalid and
> are rejected during phandle translation.
> 
> This avoids silent clobbering and preserves deterministic behavior.
> 
> Existing device trees using #clock-cells = <1> continue to work and
> default to ROUND_DOWN, exactly as before.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

My high level feedback about this:

1) Since you are making changes to the DT schema for the clock-cells,
   does the SCMI DT schema document also need to be updated to allow
   clock-cells to be 1 or 2?

2) For the ROUND_XXX constants, I would prefix them with something
   since the existing ROUND names are fairly generic sounding. Maybe
   CLK_SCMI_?

Brian

