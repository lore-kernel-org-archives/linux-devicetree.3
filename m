Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AD14FDE71
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458616; cv=none; b=ahUlyKa+4nyu9rkk9Bk8SM+6pReAyU793lMPdfkfcnjJX+XPGrPZ1bVs6KYWKYOBrXxJwteNkrvBSauQi3gjc0jVd5jWFYq00mxrhv8Z4JGNmMaKK3EO9qGce62kEvLUXuf/ChhFu7P3tXWXizfsST+Tq4tUXOk3b5WDtB/g0y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458616; c=relaxed/simple;
	bh=CwdE3Okoch7xrLK/qUNZUvKvP/5GRURsBtqJNWxxv0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TlyOaVcEygahZGWGQtCiaPF3szh+UcvOJVn513avt3BPFKL95Y18gleS/UFSe7AwYbDon/wcvfMYJ9ZNoPemrHbeg3P3zIoUQAF8tTqUlzzk0oFtE85OsiK8Cn0XwywGzOLLDlEZGgvsrmF/oWZTx4p+bncP7lP3jhHXPjqhUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q97oVDOF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tH6oOTLL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q97oVDOF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tH6oOTLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788458613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JoPfOCY29A3Y3qiUx94yvtnxEMXNVAH5t6LGehu/9c=;
	b=Q97oVDOFvac96hQSz6RBs0mkt0XprPphY6nhFatagOwMJiwL5W47iieG1SclyoPgI6ItZw
	xSPMWoyoloqMKBsi+lUahrXfM/oVOaq0ZO8bSpk+YGB2Ce9Yf8EZN6MBjGxGNpH8/bb5vS
	XNVpBqYgWofbQtvTt4gomAxiCy2qBGk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-BYXkBtcBMQKqkpX4CslhfQ-1; Thu, 03 Sep 2026 14:03:32 -0400
X-MC-Unique: BYXkBtcBMQKqkpX4CslhfQ-1
X-Mimecast-MFC-AGG-ID: BYXkBtcBMQKqkpX4CslhfQ_1788458612
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ffe24490bso4747691cf.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788458612; x=1789063412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JoPfOCY29A3Y3qiUx94yvtnxEMXNVAH5t6LGehu/9c=;
        b=tH6oOTLLnentvSYgVc3HKcjaXdiewAxBw78Po2ye2l7OJhMx8mF+/PRLBG2nbL+Mop
         4Q4u7I+4+4mSQF4tgwyZML/O6Hxe841tTQLZsFAx8xD1A6UdqsaXMDEoOkyLFR0YQCqw
         EuZv+IbQydeEOiYeU1cpuM4r0JAO5bv1pJ8ArjMKIrNIcQqjmJtdyAU5rVJ39T/jIFGu
         Ko/fgUGKNZihQLdSvBEg7xIuVY2KJCFRHaHmfKjaxEi9KR8lAysje24jAX4TtvtlVkj5
         JoEBdxsRssRO94Ap7ilDzbfENJhLrQFMgb+nSl5RSDdtYM3f0z107ADbtObZtaQhOnqu
         AZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458612; x=1789063412;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JoPfOCY29A3Y3qiUx94yvtnxEMXNVAH5t6LGehu/9c=;
        b=IZPybqc+NFTA/gm+CpgO6pYwwtjQmaVDRb4bzNH0MX39lMakhzg0oOXlKeqy0+b+V7
         FgRgaG1S5VVjbB4SciUDuUvtY+D9rrMWZc/fyGPjxxFIPF+h2jjPf0OlQzjnNqGn+Oca
         znWg4LKMIu6xeWdTdpcCI7vCEvKHZbmQeWxyNKQlQx8uHISEGJMmjaVHTqVF3U9tvGPN
         wAi4aG31wrzZGlV9MCdHImRxl47qrBGjHVoskF5BsNs3rBuvxb/XZKCYIjhSeWD/OlCV
         d6mOLLykJXFEyaj8UfvUiit9Dw6jnNRMmYu2OroRscZBryyFKBpGYhAwT6rcIatlurGs
         dimg==
X-Forwarded-Encrypted: i=1; AKwUvBwtAjO5SShKZyubt0dA/XWGYDTJLfi60XQJ0x1h+hqSReGBqNof7cpDPca84qcBJBC+ImcgmRbmQXvc@vger.kernel.org
X-Gm-Message-State: AFuF++l1xPjPx1270Wbq+DKxm2iXQMBveXSFn0nWHlXtID1rons8vXOb
	n8dpc0ZMXDJ4KgNHc3eoP2qIu8XplL063vr1OGHzBCNTc7RJp055BmqblYeF+Yj3EyFWPSXhOrF
	f6otulxTxOsjyWlmXVK5YhVwl4G9x9z+UG1QroN6aocmH5FIsFngRO7rs24Gz7fY=
X-Gm-Gg: AYBFou3z3gara0ALuQV/u59v4QWUVrNfxGHWAxNfXhuNDKBa62Q1MYE72hf+FFxl3jU
	Fln4rjxpWyT5w29E2Z/SDG03by+qJJnY0k/OrNN4KXUzkM1sN6uqxzCiHEQMwDPgBljPXvx8udw
	TqLcCwlDkhBeH63aKdmVevKp8PUUiejk9BLnd8XHEYoLtQISmvmVtlsCpqupPlBQBINrDrZUdks
	vXUHxLVbrmTU1upBe5gDFmIwZien8jX9d3rZeqfHSlt9yZ5kQFzhD35WKJOPKQpXNvsHDGNI9BI
	SLcxQ6kIjWEQ/EcYZ+MUGMTGGS8H1x4uTd92PmIiKV1/Gpo/bMIZgJwYaSukpuFBRPLFOGeCcCH
	s+g/QxYBhQ3jCfa2rqb89028ZlaQOFiwuYv95CYY=
X-Received: by 2002:ac8:570f:0:b0:530:3526:9ad4 with SMTP id d75a77b69052e-53054944a04mr6121251cf.27.1788458611977;
        Thu, 03 Sep 2026 11:03:31 -0700 (PDT)
X-Received: by 2002:ac8:570f:0:b0:530:3526:9ad4 with SMTP id d75a77b69052e-53054944a04mr6119851cf.27.1788458611330;
        Thu, 03 Sep 2026 11:03:31 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305418950fsm2243051cf.20.2026.09.03.11.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:03:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Fran Li <Frank.li@oss.nxp.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Frank Li <Frank.Li@nxp.com>, Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
Subject: Re: [PATCH v5 0/7] clk: Add support for clock nexus
Message-Id: <178845859345.51586.16050131783608017430.b4-ty@b4>
Date: Thu, 03 Sep 2026 14:03:13 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=8F+i4KUetkQ+0aPX5fdnN3d1y2UwrIbldYxHlQ8YsOA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmbsvrsqsrqnh3r4VvUyAD82fFh/bmeQsLNe/Ir70bc
 c5hsuXajlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaS7sfI8KQ4oviW9cWfXiom
 6mJPO0VeXjjhVn5N4WtfTN/DKT3y3YwMkzx2fd6e/WTvlJATFjmTdp5wlr47od1tvURCaZt3a7I
 vCwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 07 Aug 2026 17:24:01 +0200, Miquel Raynal (Schneider Electric) wrote:
> clk: Add support for clock nexus
> 
> Adding support for clock nexus had some prerequisites requested by
> Stephen, such as adding new selftests, the initial discussions come
> from:
> 
> Link: https://lore.kernel.org/linux-clk/20260129201003.288605-1-miquel.raynal@bootlin.com/
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: clock: Introduce nexus nodes
      commit: e0be7b4eedd3b7c6d1a3db0dd76babc35ff89bc6
[2/7] clk: tests: Add clk_parse_clkspec() Kunit testing
      commit: d0a15b827251de65bd39ce0555d656d5563c41dc
[3/7] clk: tests: Add Kunit testing for of_clk_get_parent_name()
      commit: 32d4598a48d63003e732f2de3608fcd184aa8061
[4/7] clk: Improve a couple of comments
      commit: 4ee1e9e1d614a6b3a6264bac5b070c67a89ce19a
[5/7] clk: Use the generic OF phandle parsing in only one place
      commit: 57d728b4ab15a8af890013bb0f302e7733f7c1c6
[6/7] clk: Add support for clock nexus dt bindings
      commit: aacc54c67869effe89c92c0d54bea40148c53475
[7/7] clk: tests: Add Kunit testing for nexus nodes
      commit: 91b1b8d437abe0cd83210d8f257b785a63047aa9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

