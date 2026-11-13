Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794575003;
	b=XE1CmU1g9BTxE49OszzhAXWGhzoR4KMKwavrLB3Ha9JbKQpz7bZR+7iGloEiLx4IMFoB
	 yy/5lLBOe95v5dZjBAMjlCrXMsWOPZaw8ViY44op2lbx3mKJ9Vq2K1zkwMuzeQYbkkefF
	 l/VNyo2sszL5Fn+Lz8kPrp6A5E5E9rvV9ZC+237zXVcSxL9Zvu+m8oWGxp+/hyM5wE1uv
	 xIQGpRc/eKmbuX6VBbQNOW/WG+m3LzpGrFc8ls+0nePaJORQkbcij5hKunr50V/9+T4ks
	 3gZYuUrHCXf/HGI7Gb8zWx5s70E/PBGi+oos6fmGqT1RFskg1kZSyOm1pknotORJJaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
	b=3bMrQpBfZm120hvXF1jPUHIui+NwV1kaK0iijK/0ygMRxdjn5juXFUDjxbcbILIt5APh
	 Nrp3nNM/nMC4K1iYVhd1cr0vZPuQbShQ+IDvompJh10UDwbrwQ/SS7Jp0wK8TVNz3LIN6
	 kA0v4xLfIVM95Fk+EtBF9R3ZR2a3ZLEsg3x+LJLQCIpHZGfD5KtyGVjAoGDX1opWRExMa
	 dwgrGd5omyxXiwlVj9OJ7H9xDU0Wc+IBD9o1d4C+3YoXwuPbSYDOJMxuNWsp8jVhdOjSp
	 jps4Khswqj4kjSMWAZzHucfmexj2Jv4k1LDi3osExiJ9KYqJlaZVsGVncnAzhKNL1Gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aJ5s+LOD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42391606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42391606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aJ5s+LOD
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1917753a12.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575002; cv=none;
        d=google.com; s=arc-20260327;
        b=LYBcuQ/CiRjETUW6Jv++T6625o9FiBhKSON7OubNxxZEk9h47UEqOj2q9pQlqi2BP3
         i0X93BVwR/8NSxC2I5JH3vYLLKhLsFAxvBQnlCIMj16dKyTdUWgF8OMwA31DVfAYoaPr
         c8QxIVph4EJ/Ll7oTrmILLQgqBOH2S/ZNTUVC/w0XotLWtJzwk92DHW9XF59yeCjrKrP
         NcxHJA8Eb0Z2JpFz8EaIKl9BMxOmmK5IuJPNaaRnp3Jpw2OhfO4uvwWBcKbvdtobmPRT
         sAmBiADDxmyh9f/JHVlEjkJ4AFi69zQSmzZClXt1ky/ReJHUEG2D8cUSVnT+CWc9HwWr
         iJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        fh=sTEkzM4Rkgv+dZs3iPA9L8iKSOpdbE2bYLOKyXIt97M=;
        b=m8krZi5cDe2lI51P9E/5wd8D3PKvZqYOQUmaVGeAo++USgSkeFh2K5pHT4iFj6Pnf1
         yXCCjoDQQgQxo8wPgmVEKGvjgfUNyb4RBC5ZVighoEstfT2gUnXXeqChxWiFwkVCmTEG
         2TCSu7SyUUfvhfNpUHUT/PgtaxNUdcqkWJnqc5euUVpFa0J390CUNca5HvBdQWQBihl+
         xtJ9wZmgs8N0DbSoXT8XhlldXkVscoRHh9miE/dlMfux8JQ06mJvW2EXY27kmYF7/wgS
         rXXCS3O89rkJ2aC0xUeDulUq9N/hb6LxcWlQy0c5W+oAZRxB1GqQLtQ/1qSg+PWqrn8w
         N4xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794575002; x=1795179802; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=aJ5s+LODrTBmRhVW9mdEBuV0ItjC6oE9WnU0EAlypd9HUuGd33Rc9jHB0ESw55qLVE
         XCHFjKB1r5N8neiJ9MkAxutTT1CFEwL1EexRpPanr+PWI0CLkLZUvTvsVvTxN6blv6g8
         rIek8Vm3FiaW4AzOw7hRkyyD2IOjQI0n1C6iMlUMin4QYzjCbRbbMm6j5pXCwSDAOA1/
         Pl//oWlOy1pK3ECO+xlcOdE532VuYbUsD54UwyDhX4HFHx0IflHDnq4yKGfDbgTzCN24
         fkcSziJ7sCoIKdYIj4YfCbDXBjw8CbH9PrRIRffFgxdKSHpvAj+KGbH5x5+Fy6yaTLdp
         oRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575002; x=1795179802;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=HA7vYe/DpKQlJ5FAVsaeR23T/E/8yEOpXwA9JafrH8GjpgL9uFw7OSCTFIS2gQ8zu5
         7a2glLj2Xj0eZQq6AJOKDarZKVSF69LCLUxY0jzW+LSSxLfxi3Q0d0sxr3r+YKP1V6ce
         CYhcb3W7HclRm+Z9llbjQyZ+4p4DTbiNjOsiLHib/qxiUjat7k4Q2W+yy/DQexIjgvIm
         kFwTI1ruht8B/4rMsQaJxuHS4HoNWfSv0XQQsfqrLuBYABao4Wrq1aPW2FndJj0lT/n3
         XJyLs5nKREkeDmnRSz1nD6yF7us05UblPWCcLi94GEPBw+ye2Jw2Q15/Bb1IaKfTLjZH
         1A1w==
X-Forwarded-Encrypted: i=1; AL+hErGsZ51IXgH8tQYIPq0EV9/w3trKQDbd4jLn1ZSq/AgyCSwQtW2VdEjF9crx+wzyZLqa/apm4uMWW+YN@vger.kernel.org
X-Gm-Message-State: APuU4Z9XoPPWAWp5iHWpoI1lYiCsu0rQ+Fc1IH+VdH/KAeaG705sZio0
	P+vbgoIZjeLBhWViEyDrGoXUMwRCdOOlHbItz7mbqnSCWao0/C+5azF6N3ODVdo95KTa5Hwm43e
	z56LCICfA5Iaz5rZXN7KQHhBavREkbuNMrtHPdvrY/w==
X-Gm-Gg: AYBFou1zoRpNsD40MmYnrLOqcoJuLepHVntafnqjn1cxIVnOa1c0DsuU3sChyioPrPl
	kHLNSdDF2UEcmYAj/C3ifScIEYguPVlIm9k1A1UhjRH2YtcEnJRljvvffcVUAQmDyteB0w7rO7+
	VuS96IVxV2ArKic2RdmstxsFje3K1vo03JUK9gVOutbD6e24alx6vRlktt5K288QPioBnfEvnW4
	VThWxiTa+LHTqzx/RRja4klHGtN555rG1kHdQtaE/YJmHrtDbWfwnOfhTkTU0PD6utP6x5uKevV
	yraKuaWjmonW2a8BppstyK7E0D3hKDlkApZCoJvO4Pqfp9UwpgJd9cgkam8nlecoPn3HLCtqLFW
	mBnmemat58vwEYbAqkKNopcuzhzji60BvSDoMe4RPpRYvVyJMzEHaFVzm51Ai5n/uJvpmOJtBSO
	bSsI4hjI00Poq/4BA=
X-Received: by 2002:a05:6402:c517:10b0:6b3:d0e9:2e87 with SMTP id
 4fb4d7f45d1cf-6b7c08b0a8cmr1544223a12.5.1794575001558; Fri, 13 Nov 2026
 05:03:21 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-11-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-11-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:03:10 +0000
X-Gm-Features: AclHuK8TI6TajdXfbmO4ZfXjIUyzkcLZWaP_zfTUGkQ09RFX-UNUsATe86j4dT8
Message-ID: <CADrjBPpUGoWPfmS1Ne6=KnXoGM_vc_X3510xF2zwmqKkGzms3Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/14 RESEND] clk: samsung: exynos8855: add block usb
 clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_USB, this provides clocks for USB
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Same comments apply here as for the other CMUs in my previous email.

Peter
