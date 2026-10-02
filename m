Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CF83E7151
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 19:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968249; cv=none; b=Bhj2JLZxhYioqAlsz4jPMSf+9eAaUSUIbNv+bWWXjslF2AcctE5YtXZ0/U+FS0nnsa2r4MH8psNRmUVbABj11Ne16W9qdtTyKYLwaKWIu8FO8pi/N/1Mvv4qDU/9STM7Yn5MMzo281sAc0ZXjg1N76DQwlcoX/TerI+9TDn0vgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968249; c=relaxed/simple;
	bh=38O0AiYv7sXZCfgiUvA0Jw+V6OPDeMpifWbiiyBPEcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bPsyyzfDS6yrST3n4HbRMcJDHIPPoucJ7ba00mQB/QGvcMdIHA4nQfIkG+TJr6TKALhxY8DfD+WMfjhZUn2L5bSIqp+/IK9Ibb2sdD02dze7/ssv2kaKhNUrtl9gs7HLXZLjhAgrdIIL2ZlX3q1rr1Wwuv2gMFhWMws84c9IA0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O1s8x/Wb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i9tukCWK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O1s8x/Wb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i9tukCWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790968243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SqOef5FaraL1edtYgsKupndEumwwwfe19d9XZdXNw+I=;
	b=O1s8x/WbHLcJT6nmwv0KDAgyJw9/yYj7aTCHTPt5rFcx8UUf4oPmbM1+O5OOoZkBAPjtIC
	UjZ/IyWoDOQL9GCUSBD1EdZ7EPQn0h9BgkS6iWJ08r8A82VdcEBpw0+tJoE+ulYjF+QXqn
	EMFV3oOq5JmpIpCaZbJSrwRToaRk3Fc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-44zdKuanPruDSjE7ZWfB4w-1; Fri, 02 Oct 2026 15:10:42 -0400
X-MC-Unique: 44zdKuanPruDSjE7ZWfB4w-1
X-Mimecast-MFC-AGG-ID: 44zdKuanPruDSjE7ZWfB4w_1790968242
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so200171985a.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 12:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790968242; x=1791573042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SqOef5FaraL1edtYgsKupndEumwwwfe19d9XZdXNw+I=;
        b=i9tukCWK8tTrAx3Eq7Gidiyg3HaP9rWy6Q+eoK4pCmG8TeZNn3vwWqkiemcK9JDZKj
         hWzXRXGsOwNR4wFxebn7mrUwvMvzDphDsEZyK1CaSW7YWGEZUSa80r4kI/efX8NNzy+l
         pjVFa4b18gBkFtY3ayeJynx5JO747j7BPHYMeKP4fch+zDDvinwSgml1RNiyBFVXLsmm
         o8Z0TMMSBbLUjeR6K47GfHmCw1z0KBHBbEQ7iDT73u95Z8L3YfkoO3guQ0KoJmwXEmlf
         Zmwi6hpO9BrLB7h1EXnygrb9ycKxNSpIQ44VZWz9LDdYvKKLy1FDK6moFiypnSlZZrSW
         Z6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968242; x=1791573042;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SqOef5FaraL1edtYgsKupndEumwwwfe19d9XZdXNw+I=;
        b=aFS+SQBWNscw3kUO1bk263dqVQybylT4xvKQsCq3gwy6Iyi98rJ8NlZSMdMS7iY4id
         jMSURmSRHAuekPjIRaDANeFIQq2OtcIO5WyusRfmvoMVNU4nWgzEUoinvtIfnGu30QbI
         Zn2I+Sz0zxQyYfCFI9ffBZix0l5SOt/4xCMJeIWBI8f0h+PUr700EdNm9F691TtSEFpK
         82Sn+18XNB8m1l7aKg9x2ICxavgRlN06T1Bkm1tX0nvkuVWZOAoKKOVCNEeIGsSfWG8Q
         Tsd4Cx9+p004ZNdKRev7Put1tEd0cz/rb4ILHenl6FujdRfRfvfHpiiPEbRmu0XyPb7R
         6rfw==
X-Forwarded-Encrypted: i=1; AKwUvBz2hqYBbyd4suRfKhGI70hFZmwM16DvcqDaITKtO3Wsz3WlcLu7tBlnwBVOLVoSVnV6B5KAyiGrzGeZ@vger.kernel.org
X-Gm-Message-State: AFuF++nEHtUX55bpJupVBH6uQZeeMaObFREdQ0crNv0aR+YIdCutLbEQ
	EeeD4LWJ2FsdwJhTSHZ/HQSNF0+MU84a+YBJRIKoS8Rqrgm93Mq0G/xLGThI/zhPne8pGH8SwtQ
	fxxKNyYKPqrILIimqJrjCV+pvpoEEq625ByHS7JzjHkf9Fx0oYui8kYT9LHTF7J0=
X-Gm-Gg: AYBFou2N3L5Rk7M4Eg8wUxp5Hv3+d1KenAnS87j22sQKhIURCUqjyI0Mnj1g6Rdf/Be
	S2JW1y+opmhpVwXRXTdT45efYs7pz46w3ePq0wy7pIeFlc8rvfLdqM3P7p8kHPVbGMcCuXSwcDw
	J3G3cFVuSQgeOgq5msdonxNNq3ycqQkqoA9bSgl1t2rNsrTyOkZwO1w4rRxnCQCkGQdhJ87JVo3
	gP5ce/y7gvD8badEYPMWdzvrQeTzMB+XKhHydd8zkHfSYNo4KZQWe0vyj2hM67VazZcOxCn3fPV
	Uv5K6adBgkc00YvRcoKSApYbs28PcyFNz24PitqawpTqTo+D7+zg0kWcNV+k4HadbgV6kfNl1KW
	jy4QytqqFWY5tMQ==
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr663874585a.65.1790968241772;
        Fri, 02 Oct 2026 12:10:41 -0700 (PDT)
X-Received: by 2002:a05:620a:278a:b0:93b:d7a0:d9e7 with SMTP id af79cd13be357-93cf19d98b0mr663869285a.65.1790968241277;
        Fri, 02 Oct 2026 12:10:41 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e457a4e20sm177796785a.40.2026.10.02.12.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:10:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
Subject: Re: (subset) [PATCH v2 0/2] riscv: dts: anlogic: dr1v90: fix clock
 dtbs_check errors
Message-Id: <179096822701.834873.13625187278784966753.b4-ty@b4>
Date: Fri, 02 Oct 2026 15:10:27 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=638; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CgnHm+pOx1EqQqkPIiwdM7WFpAfZXzamTaQBTcq0Abw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIOMK67m3Ay+Nfj4xaHN4q8WRyRc17z+nwBXWfeqNKTg
 S/i4v5HdZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRnzwMf/g6Vd3Fj0zZvYw5
 59vrz2JdzDF6dxfteFI0a+OuPs7sxhpGhusXj6rYutcsk9M9XGoSrvh16X6Tc91XZQUFWH/3ipZ
 KcwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sat, 03 Oct 2026 00:28:38 +0800, Junhui Liu wrote:
> riscv: dts: anlogic: dr1v90: fix clock dtbs_check errors
> 
> The external CAN and watchdog clocks are optional board-level inputs to
> the DR1V90 CRU. The current binding requires both inputs, causing the
> common SoC device tree to provide fixed-clock placeholders without the
> required clock-frequency property. Consequently, dtbs_check reports:
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: anlogic,dr1v90-cru: make external clocks optional
      commit: ca4983a301063d9cf8d0ef556883f90a94a0bd32

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

