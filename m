Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7654739;
	Wed, 27 May 2026 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862802; cv=none; b=EraI7fZZbfv0uTDwL810OBgrfmsZ1xGsJK5l3OVGnwxt+dwJ2Lo/Zqjg3lq9ytddKn7UsoGWRGGK7JmcOWJ83kPDp46LGr7ttJUBDtrbuuB+mB9KpKI2t/yvUj+WLzy7xLdVNyt7hjAgeoBOwtKw7yzm0k6Mq/BswhpnB76CFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862802; c=relaxed/simple;
	bh=cPaCSVY4Z1zEsZZrp4NIssTJSeYeQHNNypRQl4ymyYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIxkV5Jz+bNPB56Mir4MobAsrj8sJzgNC7+VJPpN39lv3khIwWpqammQQxPTGyOX5GpCn7Ect9XyO8TxZD3L/JNnAvZuQfaJVWSd6I/tyPROsKRtt/rSvP4fXWh8EC874xW3JX2aSqG2pEqB0bhnl8FunlgZAAKfVYzLH3p8+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPJopVI1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPJopVI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969DB1F000E9;
	Wed, 27 May 2026 06:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779862800;
	bh=w73mQqebFVQEtS7aJRZNZMnnqvuFROifoIcEZ2e6RTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TPJopVI1iPmJq6unW+c6IrqPlOjwULmGPNLPhHK1IjZG+WuH6wkXlHoLqSU6/6ytR
	 y+HRIfKyevjt0uqFuPOArHVUsefPVlKzRlhhJvypFoU1QmjYXz1lblVwwj9pYhITDz
	 O/9LLYz32XogHFBwlgXCr8HKETsDEmGsqlQnoEjN4xwalMiH0czSKN0vNCr6UbWkz/
	 eMKHhCTsZyiEuSPRoHl1a3JxYy/LjNclk1dgOY8OphDZCADN7a5Y6sB5NXaO7MK74D
	 tl+mZOhe/Zg736mTwOa5Jo4ZQCbzMAHaXq+1u8ulSjqFFeALInZUtWINhfobSrm+CP
	 9tPCrN4IkVTBA==
Date: Wed, 27 May 2026 07:19:55 +0100
From: Lee Jones <lee@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,tcsr: Add compatible for Shikra
Message-ID: <20260527061955.GA19682@google.com>
References: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
 <20260504-pastoral-devout-jackdaw-b84ff6@quoll>
 <83fe4b80-f40b-4f74-8faf-1c6268e79648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83fe4b80-f40b-4f74-8faf-1c6268e79648@oss.qualcomm.com>

On Tue, 26 May 2026, Komal Bajaj wrote:

> On 5/4/2026 4:37 PM, Krzysztof Kozlowski wrote:
> > On Fri, May 01, 2026 at 11:31:17PM +0530, Komal Bajaj wrote:
> > > Document the qcom,shikra-tcsr compatible.
> > > 
> > > Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > ---
> > >   Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Gentle ping — patches have Reviewed-by.

Please do not send contentless pings.

Since I traverse my inbox in reverse chronological order, the only thing
you achieved here is putting yourself at the back of the queue.

-- 
Lee Jones
