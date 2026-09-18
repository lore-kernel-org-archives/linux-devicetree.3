Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077B4522699
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 19:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761185; cv=none; b=ZL8TBcWcSBUuflA6975GE/aaHXWkUgIWeskMJ81dYkQ4TgFyIYf7Cd7Tl5M/R9oRRs/Y06b/gc1Prcahz6ZYpT/JhkBpc9CKNXSBG4VGlns02bUzBPn9bO5xdH1mNu/PfZrvwvQxfPbDrySlu7MvN7L5+o8FTY7G0rjEQJNH454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761185; c=relaxed/simple;
	bh=3C83J2e0pNXsKbiuzw7L3H64sGGPUZHkX/EjMGwvxsg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PivQ9J6iTWbWCp2hvRHrIbLx23rDruAkXnD+djFNlfX1dBWQFEpAKeWWaoaOvQXoxxFp46xo+5qVcFqoUMKWQndZ91GgacoxC+ByN8kNMV+uKMI7dSVlW036eNpLlFde3+c4gPoZAR0Ey7PC9kHV4Fu7oaI0cFfGcgGvdWBgPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7Bqvr0j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7Bqvr0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB8F1F000FF;
	Fri, 18 Sep 2026 19:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789761183;
	bh=0nrcn6lmq1s3sZLBvvqABs/zbqGa4Bysj3PMaLHW9cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F7Bqvr0jPdH9rCZCa1lCUXgk4ys+icszIMsEh7NWAakRtBeS13FnfGIjN1zbmfw8J
	 2sED6enMJ6XCAH2Sr8oTuCRNLxg5M74xYbinIbODCzy/rQL/nA+5Ocmlhiw74VMRq/
	 R09QdXak7xF/K9UZVAAj+TewTDSpKr+J0ltjNiQkbtbOXzOs9N0LiLBm+X7nmLFGnV
	 sqhUCNklHlVCytTANKOS+4g2vPzppuGH0YrRbYs7356qFIta1xVWXux7N3vsFUB4aj
	 GGNpz0uklcpwt40v3rw15HKESA00c1InNxJnXnPFnJO7KF3HgQPGdOZlJTDm+dSMaj
	 ca/jJiMrI2/ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: iio: adc: Add dt binding to xlnx,xadc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Omer PALA" <palaomer100@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918194434.9240-1-palaomer100@gmail.com>
References: <20260918185813.5070-1-palaomer100@gmail.com>
 <20260918194434.9240-1-palaomer100@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 19:53:03 +0000
Message-Id: <20260918195303.9AB8F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: validation bypass when 'xlnx,external-mux' is omitt=
ed
--

commit 28ac615c3320e6e0d6b6715f4d23365bf3a32842
Author: Omer PALA <palaomer100@gmail.com>

dt-bindings: iio: adc: Add dt binding to xlnx,xadc

This commit converts the xilinx-xadc.txt device tree binding to YAML format
for xlnx,zynq-xadc-1.00.a, xlnx,axi-xadc-1.00.a, and
xlnx,system-management-wiz-1.3.

> diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml b/D=
ocumentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
> new file mode 100644
> index 0000000000000..388511476ca8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/xlnx,xadc.yaml
[ ... ]
> +allOf:
> +  - if:
> +      not:
> +        properties:
> +          xlnx,external-mux:
> +            enum: [single, dual]
> +    then:
> +      properties:
> +        xlnx,external-mux-channel: false

[Severity: Medium]
Will this logic correctly handle the case where xlnx,external-mux is comple=
tely
omitted?

In JSON schema, checking properties without making them required trivially
evaluates to true if the property is missing. This means if xlnx,external-m=
ux
is omitted, the properties check passes, the not keyword inverts it to fals=
e,
and the if condition fails.

Because the condition fails, the then clause is skipped entirely, which
seems to allow device trees to specify xlnx,external-mux-channel even when
xlnx,external-mux is not present.

Does this logic bypass the validation the commit is trying to enforce?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918194434.9240=
-1-palaomer100@gmail.com?part=3D1
