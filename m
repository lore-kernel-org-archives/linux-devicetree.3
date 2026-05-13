Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3333A3E8E;
	Wed, 13 May 2026 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692631; cv=none; b=ebGMpAgMJwlse4Mo5crsYeDIlsoR5piYnAemrX96CAXZu3UQyJuIUgruvWsjSfiCY9ArmVgHtJLUMs9tRXEd+oSkcdQvS0ypOjZHAaWZI1TxTnh9sXsvKPb1IktfBQ4bT+KNqOKWlsw0tGIGT0Ha9LKuu0umnYmF+8VfZJoYxtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692631; c=relaxed/simple;
	bh=gQool408l4gMm/6emufuT088Y5cuxk1gS7/KqLZUW24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9y7QNDdih4qttaagNdoLjXo+SCErjvH6v9Uai1NrNxAwn5XzLrRlMZjwVVqJF6WQasaZXJFQPfu6cXVAJxj0s9SVbvqIkYgwk0bkQ9+aUlnuU8TG2RPVzMCEbtj59KiNk/VuLHJPZcMpyMpXABSGpK9W2FVA38oRCgJFsfGBUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3ThsJ6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3ThsJ6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A418C2BCFA;
	Wed, 13 May 2026 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778692630;
	bh=gQool408l4gMm/6emufuT088Y5cuxk1gS7/KqLZUW24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3ThsJ6uakmRAlORwNtN6mSAMxhV73vUJkp6B5Qil6QDn3YQ7x34MH22Dlqe4Mdin
	 1rgI5npXFzL1kUITxOb/QUXd55yfmuVJCOPvRhVaUbJDRDsB9MjUdIiC4DoPkSPtff
	 TyPJ+fE17FGQh+wAi6qT5UKhti4Q1A/JDeYbIvpNns9WVQECBuztgxPWtgwzSj0Yzg
	 +EoIqq6NTlwWHnJwiK7HdUE+5hYEb7lfg0J7fZgLx/swTbW3b78FRIGR4uNs0cQlTl
	 nj+SZ2euZvMfr0qJuteGgd2okGaT2BdyeMXz7aSsxq0e/RZqEIWnoEtRXhtw3E2RLm
	 OuL5ZeoWUFoTg==
Date: Wed, 13 May 2026 12:17:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anup Patel <anup@brainfault.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <pjw@kernel.org>, Ian Rogers <irogers@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Atish Patra <atish.patra@linux.dev>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: Add RISC-V trace component bindings
Message-ID: <177869262677.1393813.17216118016558034806.robh@kernel.org>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-2-anup.patel@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-2-anup.patel@oss.qualcomm.com>


On Wed, 29 Apr 2026 18:21:24 +0530, Anup Patel wrote:
> Add device tree bindings for the memory mapped RISC-V trace components
> which support both the RISC-V efficient trace (E-trace) protocol and
> the RISC-V Nexus-based trace (N-trace) protocol.
> 
> The RISC-V trace components are defined by the RISC-V trace control
> interface specification.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  .../bindings/riscv/riscv,trace-component.yaml | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

