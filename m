Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DAE449EAB;
	Tue, 30 Jun 2026 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836411; cv=none; b=Ye3B9+xpL2qPMY0advDYoivJK0r2DqViTVhjKp2WxmOiHXEuOO5vVxDwgeqofEgU42ZpsUjvvBh3Hwtc1qauFYXwmjtEDTq+eOemCpJcJs3pQwGumhVyAmUowbWWDXTe3wXWv+9QhZGhoM7vgppUB6fJrTbPWgfdUV3kW9LIl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836411; c=relaxed/simple;
	bh=F1R20fkgS9FDrCRbd2sWvfAZ9KG3366EjNWV5FBU0Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXklkHt7JBCi/J3h3w0ajVmVC5NjN2MdygjDrPTiRM1tgEOsECnyi7amy8bnFJb0KW/U8JvouHwNWjLMo32kBnfDoB52DSdLI6MSjJBsC7ih1z3tKWk/xpovgtHZDxVQGriCQ8taAnQMz56NA5iwjO0quZCv7MaSL0qDWX/4q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdzZmh0Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdzZmh0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8B51F000E9;
	Tue, 30 Jun 2026 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836409;
	bh=RIKcw/f2bT0GqSnRajEH7CZYQM6HSzTz6ME60t/gtQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdzZmh0ZbzrOs27gRa2si5fjlstmsgb2i/4j3qwr45jTpwtmNsvKbvDO5UwPywlLG
	 lcjXLh8y4BofgKZFLgXPDKHy6QbYmg/9HylXkeL2EBqnwCHWB0TjM/u/fQiQYG7Q5/
	 w9ojReR26j9eCcbWKNWRsO5I87KluFHS+rmvNXSQ8ZbvSjqKzXiEHrkHVYHttjtEpn
	 9LFeF2NFcJ0h2b410nnMbm0BDHrqDNsGSUE2odchTTTGXw17ASayO44kS/P1N4rObG
	 1M9iztZvbdhi90GJHyn6/6Ma2BwDNOQoiidykvw0Z7VQ16i/3jvOg1Cye1Dqaxu1VR
	 c2+Qvq8hqkOsA==
Date: Tue, 30 Jun 2026 11:20:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 02/19] dt-bindings: sram: qcom,imem: Add minidump-sram
 pattern property
Message-ID: <178283640850.3845930.5376012844259706282.robh@kernel.org>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624190830.3131112-3-mukesh.ojha@oss.qualcomm.com>


On Thu, 25 Jun 2026 00:38:13 +0530, Mukesh Ojha wrote:
> The qcom,imem binding describes a single word in always-on SRAM shared
> between the operating system (OS) and boot firmware. Before DDR is
> initialized on the warm reset following a crash, firmware reads this
> word to decide where to deliver the minidump, and the OS is expected to
> select one of the destinations: either USB upload to a host PC or save
> to on-device storage. If nothing is selected by the OS, USB is the
> default.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sram/qcom,imem.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

