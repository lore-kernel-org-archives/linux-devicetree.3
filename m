Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583380;
	b=HtJYyDarYWHCy8pZ7l3xFL6xQM9zhqzsf5s8tHlxyux3NV7PYP1z7sc2lonFqNayK/WY
	 MngkaNXVk2nTNvzbDWkqdo72twqKJX7w+/RIjGoFHT3IhG7E/HWn8ezH1USaCSV6aaBDv
	 xHKUjpZeA7rQAhJ9+X9vPoyWzEMS2Lb8t4jkTnMeCmeEq50JdMFfeQRYiRM0cEBYknCGg
	 n+cTdisw9HuoOaIhc8Rx13dNj1bhhiKUF6x0rimwsXSuIcOjM9GuRbuGWOvonYlRngKei
	 TxbNpAo61foNVBNAYZ15s28p1tTuJ0PsCMHCTNOglXe/9mjollM7AUYeocyRBos+FZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
	b=MKSvh33Fp9WBXYGDmbnaMSwI4iCbX6sdJLhcXUfqUcAys2ChtR3cy0ANgen327lXqQjx
	 YnJMIH0IR5t4VuWn4sn8iDgIaAuiwZ5O8XZNVRzoZYZoSSjkT/Ed3+fvLMQApRQoINpNb
	 JIIryMkjMl7FuLAPE7mQoYtBaSV4cuS+Xs+0j83I8YmttS8oadr6a537Ni6jZVMtJGICo
	 gq2phxFuiLx9TsgjXWVZqDNRuq3ujdN7urHjAMLL14wtQkW7bq7CBwoLBFcI2vSAON9Og
	 +XcU2ARuAqKC9krETnLC5fAEjgIVcLnDd29suo3POv7wGjQ0eLb4Z8TKo/E9enWHpeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="Z4j/Mghi";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5955606A327
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 15:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5955606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Z4j/Mghi
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so16850525e9.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 07:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794583378; x=1795188178; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
        b=Z4j/MghiCfLl4geHxV/1zp0iqZFNnntdJLs/GhAqDGduqb9DsAilkkq7STQnBeZ0um
         RhRvKy/5eCZ7/YOf4I6ESuLz+SNm9tkajr2e8phIKwLpPUNrxEs8ow/NIQakyHXKpUNB
         wPRM4oSCycrLGiF2jbCbowm/BJ1BtJIjJDTObxah1B0fXda8R77uAxdV6HE+5EK+QdF0
         ZQ/ACHOwMrY+sj8numw/aMHMwEY/vMqvifjApBhJUHkH1EPJavyUdNHLq4MyAxwPC7SK
         kmDg9bJ14RbAv6hk4/IhmI1flTTg7vsqzz+2ixhoxgveX2xQhoYUeoYm2BbSsiArcb0j
         7a9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583378; x=1795188178;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIqcVrxwFlf/MOw6E2I1r/DVGSQU9l7E6EGdUXXdXtE=;
        b=Q8XqxmBXsCtZCn4bIUPi0f+K7Z1m/Mt8v54hsTF7UzktL6soDg0VUSpb/YBd3Iti/G
         r6BcwwVayjR573ZxWPho1Fbpar2j9wT2RizWlP/DdXnt5a2aQyf9TiHe0HeqzGaZftBk
         iav1+CI4aMDiS4p+/UKqX59dXzMKXCQV9RgxmMuW8X2DqusnlH6qy0viy/zYy/jQNfj7
         K8Q8nNlufgNw77dPDi4PrQRuAP050jU0bKyTe+3fThnTQmDK7RNg/Yl/8Z7IUkECQjYb
         2nk1QHS5+RupX00aGmBYBHn6leKMlTGm/nw5jLkFHIy4IgEhJZ5qnuF6cdOM+p99mpeA
         npdw==
X-Forwarded-Encrypted: i=1; AL+hErGtXKz/U6MbHmZWGKCR6CAulAkzxM6kzu3n/V/naw8hBtup9Ym+KUvwfylpPgmcJ7bzS0DLIHv7MNgy@vger.kernel.org
X-Gm-Message-State: APuU4Z9Es4pWAodYzSX0BK8G2fI07SSM0yuvLQulwnxh3925w4C0KBDN
	C6gD9xo8KGjTNFtqYPEX8Cd6hXpyrNikTdjTyHhFEVx++1n5AxrEAC+B2E2Ka5Cq9AE=
X-Gm-Gg: AYBFou2fpRAC4V6zZPIKjSZq6LASHjEKwuLne8K6ErQNAa1o0Ypg40FQnepSxkmbVFF
	9f9v8Bj3lz64x4sT9X3+whJLLqn+6jXgQ9Rhrn+1SZyaE/koHQjpY2s5ghbdkvO/Z7Pt2nibyfe
	GGBtO2skozNh5Pa+DsYcLR9H/Wc/x/j8ZteJvTE/u8nwA6mlq5Fbm098C8wd1plx5QSXoH3O39K
	GyYXAUTq7k0G7/dMYgQ58B7VztgjdyUQ0USDwxvtM47fNEoBUWwxaOCnstiU+aR5LvOQwUfPFnd
	/UY03OJ4YCRhnwMNMz82o5BvhtLt5lno5bzMK+0NIXg1+4OR/8kmzjfFHMgx30epMK8bKJ3QB66
	s0ohpPjD1OzVk+hZL/2kZuv2qIgfMy4jHIcUOE/E1/lc3l/mz4TKuQ+wqk5Nzds0CMpOZS8rP3N
	9Kx0EgmTy3jlYEBIJrgCiKXr3om+ePuLnnYGPzTc/1VhxWLL7MILfTbzSctFtXfP344ZnO/NgGs
	HWErC+ln14tOgnXVGeBpgGL38tp94SVr3iNm+czOrJQV+IJPoktZ/VBXytKRS0LGCBVM3zaeslr
	912XnhQVDkuXwJj55aWgV0pxSQqzKCMdJTUqk4M9Qk7GBVoB
X-Received: by 2002:a05:600c:470a:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4bb55a44996mr54909955e9.11.1794583378164;
        Fri, 13 Nov 2026 07:22:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm169848395e9.2.2026.11.13.07.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:22:57 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
From: Jerome Brunet <jbrunet@baylibre.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
 <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:22:56 +0100
Message-Id: <179458337623.3308909.8679910347462508471.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3271; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=n9gjeLxQD41dq62t9Q1UDoH8EzTxjE0oy5fasIAenSY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFnftQNYFjZnu9ws4l/TOn1RRddMPbttkjGdaTOj796rf
 TLVYhFvRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZiVMDI0GWS98twnrmegNbD
 XZYWZY3fVXqXcW6esoxPSy1QcfHdMEaGC//MfS5kr/0fcIBJuSN16412sdN5/5b/Mpj7ZUnLzj5
 3PgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-09 15:06 +0100, Konrad Dybcio wrote:
> On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> > On 10/23/26 12:35 PM, Jerome Brunet wrote:
> >>> Preparing a clock protects its current requirements, not the resources
> >>> needed while changing its rate or parent. A transition can temporarily
> >>> use both parents or access an unprepared clock, and a parent rate change
> >>> can cause other clocks to be programmed too. Raising resources one clock
> >>> at a time leaves those operations exposed to insufficient power.
> >>>
> >>> Failures make this worse: hardware may already have changed when the
> >>> operation returns an error. A matching cached rate is then not proof
> >>> that resource reconciliation finished. Retaining a temporary enable
> >>> reference without a corresponding prepare reference also breaks a
> >>> consumer's normal disable/unprepare sequence after a failed reparent.
> >>>
> >>> Make CCF acquire the affected tree's and parent paths' resources before
> >>> notifiers or programming, and reconcile them only when the walk stops.
> >>> Keep fault recovery independent of rate shortcuts and subsequent
> >>> consumer reference-count changes. Require explicit recovery of an
> >>> ancestor's uncertain parent selection rather than reporting success
> >>> from a descendant request.
> >>
> >> I don't think all this is necessary to address the problem described
> >> here and in the cover letter.
> >>
> >> IMO a new provider API is the wrong layer. The framework already has
> >> the hook a provider needs: the rate change notifiers. What the core
> >> should do instead is fix those notifiers, which do have a few issues.
> >> You are fixing one in patch 1. Another fix, about setting the parent,
> >> was sent recently:
> >>
> >> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> >>
> >> You want to act on some changes before anything is programmed. PRE
> >> notifiers are the right tool for this. The user of this change in
> >> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> >> it, ABORT drops it.
> >>
> >> Also, what is acquired here follows the requested clock. When an
> >> ancestor switches parent, the chain of its new parent is not acquired,
> >> although it feeds the whole subtree after the switch.
> >>
> >> With notifiers, the parent fault state is not needed either. As it is,
> >> it blocks every request on or below the clock until the same switch is
> >> retried.
> >>
> >> Could you tell me what you need from this approach that cannot be done
> >> with (fixed) notifiers?
> > 
> > I'm a little worried about the ordering there, since some device
> > drivers may also be registering listeners in parallel, so we don't
> > get a clean split of what PRE means ("has power for sure " or "may
> > not have power")
> 
> Do you have any thoughts on this? I'd like to proceed with this
> series in one way or another.

As I have replied before, if there are things to fix in notifiers, we surely
can discuss it but, at the moment, I don't think the complexity of what you
are proposing here is justified.

Please allow some time for Brian to have a look.

-- 
Jerome

