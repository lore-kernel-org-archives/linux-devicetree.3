Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A6121E097;
	Sat, 30 May 2026 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140018; cv=none; b=nu7u55SGqxpK2G29iv5efg15LI2WjKsE6Lpi2/OMBprN6Q+Cv0d6wDZqdjlv0LOxQu5tVfu4hKWIAZFmT64++6v0PSupRcO3/EXD25WG9a06s1FnQEdGb1HhLUFoVy8AA6cmfFk1gnXLcoq96dJB1dMdFNodisa458ErEjwmhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140018; c=relaxed/simple;
	bh=cHhx+MN9+XvSAhxRbv4CmSPSPYw4S6GSlXAs3cjago0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oybHmuhmt8OG89zxG983HqRM7Ym0OdBfJw9cshPCRt6Okesn72PUF8a0Hs3YM/5f2DwLQ55cMGp9wzNpJ7LfEggEbgU3xA9Bd57O2+U8+zq94QrbsPGAEm/eZvRX175xKGMWxnxebCIAJd7cL2mesVW01B0ZyJTzP8kBRJqNzRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUhpNEzQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUhpNEzQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2771F00893;
	Sat, 30 May 2026 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140017;
	bh=bTTIrZBmCxm27x7l5/yVhHeLULKx99g4jNoxoWktCU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUhpNEzQljMJVhIih74sco6BT6TTexle0n5qOLWlzaF/WcDqHeNdbXh9le6TwfK7k
	 EhiH/7aoKwlzHMUTQBczQ8anKaQzi0rnNty0Ny2fyN0ssYnwoLl7lYKEMa0qvSHwod
	 ORbzy+kNZ94VZaugFh/zoODVPbMc0n6LezqpC9K4xBMUyhjVUb0UuFxkxCFPjdq7/q
	 lY5ctwa+t4R318JRoBWuzihIvnqtvrVe46sAPRXYz5+FlEkCeoLuAdW8LmyyWAAyF2
	 WBz4BknRMf2+Fa0rkrD1OlxqhQ0AJqSL4vA3oNIvD2xWM6skdwWZFeQ4lpt/Ew8mhk
	 WmjFyyULIlUQA==
Date: Sat, 30 May 2026 13:20:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Amol Maheshwari <amahesh@qti.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Message-ID: <20260530-wise-discreet-woodpecker-3c7d0c@quoll>
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
 <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
 <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
 <moeb7zqqhengrd2nrqyuqydyq4pk4imd2uylmr4tf2ypn65h34@z33iifvtf7al>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <moeb7zqqhengrd2nrqyuqydyq4pk4imd2uylmr4tf2ypn65h34@z33iifvtf7al>

On Mon, May 25, 2026 at 01:08:54PM +0300, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 05:37:23PM +0800, Yijie Yang wrote:
> > 
> > 
> > On 5/25/2026 4:37 PM, Dmitry Baryshkov wrote:
> > > On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
> > > > Document compatible string for the FastRPC interface on the Qualcomm Maili
> > > > SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> > > > fallback to Kaanapali.
> > > 
> > > Can I assume that it has the same bus width as Kaanapali?
> > 
> > Yes, the DMA width for CDSP and ADSP is the same. If you were referring to
> > something other than the DMA width, please let me know.
> 
> Thanks for the confirmation.
> 
> > 
> > > 
> > > > 
> > > > Assisted-by: Claude:claude-opus-4-6
> > > 
> > > Claude assisting to write a one-liner patch? It's becoming ridiculous.
> > 
> > This patch was generated alongside a set of Maili-related patches and was
> > not created specifically on its own.
> 
> Okay...

If a human cannot write and validate this one, I see as putting effort
on maintainers.

Dropping from patchwork.

Best regards,
Krzysztof

