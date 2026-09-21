Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20274B2031
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004897; cv=none; b=CIuLNL3agN3LtZbAw3if0afTGCC4zSA+R/h20BKNFD5W2XiG8ztEum89YnX2VRSamLo0nbQ8+9O/sctx5hneQDuODxSG1PMfPrEJY/0Ny16embF1+3481wYjtRur+7yiOXCkxfminM0ZP7IIxoghZqBaM7Ybq5zJI89g8w05K1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004897; c=relaxed/simple;
	bh=gQ9HLzwkRf6QOXsIWrvc5d/32H7BThXeoPixPzN15yU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NjnPtEyGSbLAaky56mUGuGOFe/bAIl79mgxzcgBE32pNqBCp/WD45tiQugWiP5tFHh5bTntqoNT5vytGzqYrqpBK7exiLNc0ExMsNaw9/g0sWYZn4vBl8BKEvoBg1W1MMjdykXn6W9H0/pBzH6D7MpBUyeyQGBChgIr0B+TteC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fx3qB3Q7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0a/Rq4D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fx3qB3Q7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0a/Rq4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790004894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yeWM3XnXvJtdimC0VqruCK0K1hFumXylSD+TDkMJQUQ=;
	b=Fx3qB3Q73S4YzCbaxs7W5w90fmFpuPDSmB7FwspXCwhtBqTgRFsPLVR9f2oZgpNGczRnEK
	5JG/ZDAKlUyZdCQ5WlITTPj6H8vCiBtfdOm3kjqUfD6OlUAix+btAoq0NkgxlKM2QlSreS
	C3SdLbGmJQyOwfITYu86qKfkWvAwcdU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-kCPHioXJM_C04jgwd-tAAA-1; Mon, 21 Sep 2026 11:34:53 -0400
X-MC-Unique: kCPHioXJM_C04jgwd-tAAA-1
X-Mimecast-MFC-AGG-ID: kCPHioXJM_C04jgwd-tAAA_1790004892
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9123c523d0cso38387736d6.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790004892; x=1790609692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeWM3XnXvJtdimC0VqruCK0K1hFumXylSD+TDkMJQUQ=;
        b=X0a/Rq4DAY3LYdH00U6chD/8M6cEZXWoWG4pP41T4xA5M5CWNK6VzKj43EDP0v4YWi
         bql8hEgAgxpEhlCagzGQDXZcckyRtseCRRgwcHjWPsRIKfwxJvVRDgxA6gjWr9LNTUlm
         AsQS93PzT52WU/kf0eUASIrS6ZbLxcW9shajE+HGr0zU+u5EHR5DmnY6AH/ErRbZjxRy
         7NbsrRUhebJlvhYY74axiEawgziQFhmhRdCojCnN+vGLhXFQxOlj/AkS8rZJNf9g756+
         NWdxGcZ0nNrkSzBVDIINI4OXh0YuMrCLLBnd7tW7qQ/gK4bLz3tbtgDS9H7HuBRm5Gja
         MC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004892; x=1790609692;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeWM3XnXvJtdimC0VqruCK0K1hFumXylSD+TDkMJQUQ=;
        b=G/RNG3f2Mln2RPB6d+dwwkwRKlj6FjdA9j7CiZrV241QXfiFXLRBHs40Lghca8+imW
         fVInHvdJPNNixaOUVMcfPEuTouT66i3vewtBSI7IpU+8hwheQnSdGBNuVaQ0o28rG6hT
         2a2BfXF6EZt/PBWJ4HkpF64PD4n60KufasAYaN1siRGlFIlZx8G4KpRpiF+RvP5pFWI2
         UFT2ZW5HS3KjmgnZnXG6xbA60SHWbHIs0HiHEm+331eRw3DI8nb5nQZsQ6JOM7hzsw3P
         qe18QB/gEKGDAAOdhX/XE0AkJGV9prdUnmxwlWDelnBIexxlIWQlpZ2fWxVcA3eZVQ64
         PHgw==
X-Forwarded-Encrypted: i=1; AKwUvBw0LPngyigj0+p+kMKt4lJ3rYbuK51CY9s4CKOSS6C8YP/24fDGSUKW0iiy+Y4GDsREESWkUXTp7Zdo@vger.kernel.org
X-Gm-Message-State: AFuF++nuvxItMH3/Jgqiuoe05VpXhKhlOfnNJacnL3I9sPKxbF3Wgg0o
	ZvLCZzwgshCI8KqXOqsV86fzxCiQueQwymCWM1AbY5aou9VUjRYARtGgyMV+bg1e47pM9zI3Swe
	mW0p48t7nl7RmTLWLG+bJxlYIog6njfi0tJBEKzvPovO9PDiYGfvCXG+5g+gjsrDkl5GruYM=
X-Gm-Gg: AYBFou0iHtScRXw6aJIbDAqQFRzwkQ3IEX9vFso/55oU5+Bp0CCvNhsU3i7dsc6gQ6d
	DlRezT9okRraLEI4CL7saUlPjAFooBZ73tV3bB/4dFt5FOhKYvfHN0K5QGAKjbM1oNd6lRYeInX
	66/KDMFN9Yvaanh05KVBl6rDsp2/kgeMb3pLHE0u3EbYRUlMdMxgPIzAE/O2ct0KCTAbmMqWzt/
	yhaL+NdSMb00oYIZDfPFagtwqRGo6C1J8xQ3bj1XYjDJS9mJzGX/DWafi/9eTODlpFA5ERYfcem
	UxYoP535sByDozxiTot9XCIHvvEq2JxvR5S9o8oNIAMDRB1l22Vl58e/mtzhINznVRS5WkGD99O
	jTFOCMd3FCc+P9/luryyn/D+mL+hMnM+jw58gzBM=
X-Received: by 2002:a05:6214:19c7:b0:910:44e5:8a46 with SMTP id 6a1803df08f44-913fc94f703mr12187176d6.37.1790004892399;
        Mon, 21 Sep 2026 08:34:52 -0700 (PDT)
X-Received: by 2002:a05:6214:19c7:b0:910:44e5:8a46 with SMTP id 6a1803df08f44-913fc94f703mr12186736d6.37.1790004891712;
        Mon, 21 Sep 2026 08:34:51 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a3204csm72842046d6.16.2026.09.21.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:34:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20260915125226.20579-1-ansuelsmth@gmail.com>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU
 serdes
Message-Id: <179000484817.707534.5059164498545591038.b4-ty@b4>
Date: Mon, 21 Sep 2026 11:34:08 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Kj6cZ+k4kLRXD9ezE+CrbD5I4uWbOp8bViEeVEq7+Jo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLI2+k3OOiwT7XlxtlWu55nX8cwF95IOLIlbenKeR+VOl
 XoTjdNXOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIpRMjQ/udJd1Bm590/bXg
 bFzNf9u7PqyoPvp/DsvKqGTDj2G8Pxl+MZ/13fhC6FiE0kwJSYMJHXM55a9ZPz5gwfFJQ2Cq2rq
 9fAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> clk: en7523: Add support for selecting SCU serdes
> 
> This small series is a split from the Airoha AN7581 USB PHY series [1].
> 
> [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> 
> Changes v2:
> - Rebase on top of linux-next
> - Add review tag for Documentation patch
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
      commit: 11952173d8a180ac05641775f80bd6946327478f
[2/2] clk: en7523: Add support for selecting the Serdes port in SCU
      commit: 4e39820b601221997cb2220edc830f92367cdfc2

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

