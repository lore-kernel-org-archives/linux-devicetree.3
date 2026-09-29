Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6605218BA
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 16:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700640; cv=none; b=QBiWFEOti/3Eym02y+AZL4byoRNnEs0IXY03Qrkz3nq3VrVaEtvD09cj/IjiFwZQ+PXycMuBEv2NBNbntOGQeHmXTsjeewkuGiNiAZSRRt7bNnk5uRY6OzMWBcJASmdCYSNyvAlW61vRdu5rHu2Wk+JkZI6/9iiYgbCg/2FDouw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700640; c=relaxed/simple;
	bh=+iUVjaJjZ1yPmy/n1mBGSq2N3Fdav7GrK5Nuqm42rSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Tqf8/ywZOVOJdWzbdABuzKNfioe3bjs3QodFTBuPGsM4ZfWT62dW9En7mY9Y31+UHkROeAL461p2Apfde/u64vwUYK9bHJuS498gcEBDV/YV9Z1s5Z4WKnME2Tuu8IZqB73IXkzoZlrIKn8p3FbrdXSNkOPxrgozH9E2xiPyY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHQGMEH7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bluIUX13; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHQGMEH7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bluIUX13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790700638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMwQUEL2z0fBdiJE0fwkPV0jsOeJv+8B2BQVgLXNy4g=;
	b=YHQGMEH7W5cyG5Q8/Sd6OkmhEgAqeJ33E/QylALEQDu88mQuQuVtavzYbJyMFuKX1lWh6t
	3Try60+yhubbRIlhbv+H5tbi4pme8saDhUgDGAXb7A+SMYgMZVy1BvhXH8l6iFcSIUqneC
	wJ6QmtS7jdtFzBsJQXM1wzCfrBXFCAI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-jtHdL4bnME60whl6E326CQ-1; Tue, 29 Sep 2026 12:50:37 -0400
X-MC-Unique: jtHdL4bnME60whl6E326CQ-1
X-Mimecast-MFC-AGG-ID: jtHdL4bnME60whl6E326CQ_1790700636
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53333acddb5so82136161cf.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790700636; x=1791305436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMwQUEL2z0fBdiJE0fwkPV0jsOeJv+8B2BQVgLXNy4g=;
        b=bluIUX13KVPLn//j5As3xtdQzZ3HIju8gOfYBgKl8BdDUS91yJ5kvSHIVRRlxj5gfY
         hcPQXyoXoLMh/+8mAAss2lw1sq1Qoh1PawCfYkMrxKgGk6bebkAMEGW/xPeCl3h3eikX
         VEVSDTHXS+m9FBXcqPWvkmuS1Xp+s5XPOTXlMoNCmHXzuKofKsbIsL6axBC1BIsuorLi
         LWOJvaXBvxQVsdAhopkvxyxfcSGGPxjRGDs7pUaprt3mWT6tyo/Bl88W/I0vuLYspo7n
         +U4DrYZ8af/F77RKpz6nHfvgDjnPBhSlqUS++J0wupUTnjup/G4Vo+bAAEcPqqXKGkFA
         ++/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700636; x=1791305436;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMwQUEL2z0fBdiJE0fwkPV0jsOeJv+8B2BQVgLXNy4g=;
        b=v2Zc3dRoFj9AMcnjkGme5ZJ2qdDcsU5+fk50Gb0LjIfibgI4RgJIhWeSN6IMSvw2Il
         F3whow6wdUdvvSN3Vfuqs4fE8B2P2/zsgfBy1II/6BBgI0VIOceqeFButVM84T6i1HJi
         zq5EO683zFrCmuCcmYlrZkuSCWI9f4MHp24KLGntOkVWPGsTuCZrA0Kpr1SxZ3BAGiT7
         ikjhq5yN2DlBZiMmp8Q4Qg1o7m7X8hg3Gm1MWv5hGoHIvDObW2ZD5VT5kAhl8NS6nxIR
         KtDI4qbW3tyk8Xba1xvbHk481aiE4Bx+V1hlq30NEEIFG9wCbz6ZFGZuDTGtPBQiMb0t
         gXZA==
X-Forwarded-Encrypted: i=1; AKwUvBxKXui+WJGV9G6ItDkZ1iemdb3dkQUs6AnCli8qQACDlwk1vE/ZA6XcxdwjHFfsOiyXpFY4M60+ri28@vger.kernel.org
X-Gm-Message-State: AFuF++mDZHiuS5U+JEadFTqc+FS1YvB1nR6J83odOZnXGdqMAEvzMsDl
	ho8KJriOKgGSiJznA0TJXG1HNLRoReTX2WJuW8malIZ19+8U8GJCwVBs5MmHmJY8o4kckw3JNuY
	VuPFROrxU0+cIr4vk8Kj2INCV+jrES1A0a9MEggEE42OIZ1lFeqQeBiNGK9FcGYomCcekA30=
X-Gm-Gg: AYBFou1XPMoEpneQ8rZXZVjHg0+lF2aaf3kyfIud/fKPehXLU4BbP2I6HVR4RPZ6kei
	3HkmjQ1g9h0ktUXsbUIK1HrntveWegAvZsSMdiiNmY8UnsLdusVAfgQrhJ/5tHh+/2iTsWvcY7g
	61XCV7Vehz+0gOErhmValv+7EYt5+Lew59a7v8aStbqt6kIhR0/oGyFFOZaTF7YndaDmFuUQUxd
	LaW7Xt5a9rsCCpXCUN6F5UVGOssBY80wXRbe8TpQd6dkg9bEGbloV3o3NZUf+5CTHh9Z1QyqBWX
	h7yeX7Q34u7KExFPZCNazquN1d1yyX1tYcVV8iAPBMdeDsITI08A141cg8Vh40IiOlunk+RvOd9
	Sn4Bt0+tQYyDUAWl+vZ1hhfujsjsuK3YbwkySI/Bvr/xMIwAS1d0=
X-Received: by 2002:a05:622a:99a:b0:533:3af3:43ba with SMTP id d75a77b69052e-5333af34e9emr150728461cf.37.1790700636088;
        Tue, 29 Sep 2026 09:50:36 -0700 (PDT)
X-Received: by 2002:a05:622a:99a:b0:533:3af3:43ba with SMTP id d75a77b69052e-5333af34e9emr150727971cf.37.1790700635522;
        Tue, 29 Sep 2026 09:50:35 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d303573sm14401716d6.11.2026.09.29.09.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:50:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: David Lechner <david@lechnology.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com
In-Reply-To: <20260906-ti-pll-v3-1-d1751f4648f0@gmail.com>
References: <20260906-ti-pll-v3-1-d1751f4648f0@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clock: ti,da850-pll: Convert to DT
 schema
Message-Id: <179070062597.199845.8971764534799721184.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:50:25 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=313; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7sbHWudVkJN1j/cQcAiFsKbxRWcoILZnVP9RoCk0sEY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2vwk/XPP95fJvi1/uPNa9MlF3bbnGkoVrt5Y/Kn1Z9
 eC/5pck/Y5SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAm4vOckeHZIfX9Pyv5Ypf6
 2ASvm6DBFy+0LvPjBOsmN6/PfNf/xP9j+O8eHDC90e7jCiXNGSxCtx09OU3/l9Su8GuwnVP5tK7
 /KA8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Sun, 06 Sep 2026 03:10:31 +0530, Bhargav Joshi wrote:
> dt-bindings: clock: ti,da850-pll: Convert to DT schema

Applied, thanks!

[1/1] dt-bindings: clock: ti,da850-pll: Convert to DT schema
      commit: 93e5dc301c87fe6b7bae0b087a15be69e521e657

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

