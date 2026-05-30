Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54432C187
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780147068; cv=none; b=l4pVDXTwp2zwPaE5azUZ4L+XmrHOZT5KIuK/VcdTOxDLWZ+YQhiOhUG03T3IxO4S+m5WzgZsG/vbEM1m+QD4M2sZfeiIOYNKPzob6L6HbK2lE/XfOIxJXqte6/LfcmiGJ3z+jRlTG5oWvk3uiuBx9snLY/I8XmoC67CKbCIPBXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780147068; c=relaxed/simple;
	bh=6lhgdaPHynf395aIFWky3glvQKAaQVBrok8WLSUt6r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q27gd3qK5ZjcoWFIYGNx4ltxOzEegd8RgKTGmukEry6EjjG7azeecMr9uSbZRvI/GiLefvuZrxZ1e8hVmTdmMRC2uihx1/pugxpw3s6DaQ3oeXfhZsWjfImKlKM82V6V2nxbk4+QO1FYsrCmrk11UzI7YJojm2F7Hf6Xb9PPsjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuX3B8qp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuX3B8qp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F661F00893;
	Sat, 30 May 2026 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780147067;
	bh=t2oLA32n49fw6YC2BTNEdxQuVC72zm9QzG8dufL6sQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AuX3B8qp2vK2JzGouTZHgXfIYXJvMcaIRuKiLFgBb+7iicYWZgc0cjdWjQD+sEVpV
	 ltAftx06JlgaOc4xhYQXcHjlPVKEd5vn+gQWd/Nj8ahx0T8r1Gx5PhDtDJRnjW4foC
	 GzYEGmJxg5oxQIiYuxpBnwaeEQLYJblpPKqAqFaxok8kDGfdw5azZdqiLfe3pJ8PU/
	 rcF3kOd9cOUMe+GJsR463yCJjgIw+lS0jptKSlVT8USufJgzHVUJ9I1kDIV7Cn/a/F
	 Oe4FJhplsohnWrpLK4ub+z5DRImEs/UMd74KD1VkK2aMOUVzQCzY3pmKjL0gDBkbTb
	 Srw2OwBZMX4Kw==
Date: Sat, 30 May 2026 20:58:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: i3c: dw: Add apb reset
Message-ID: <ahre-7YdlcOZkwS1@xhacker>
References: <20260525140018.19598-1-jszhang@kernel.org>
 <20260525140018.19598-3-jszhang@kernel.org>
 <f8efa4ae-76e8-4082-a445-ca5f6d230bf3@kernel.org>
 <ahZwl3uXjyOZRvGW@xhacker>
 <4a8539d3-704b-4433-b4d6-e5acfe22d512@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4a8539d3-704b-4433-b4d6-e5acfe22d512@kernel.org>

On Wed, May 27, 2026 at 09:53:16AM +0200, Krzysztof Kozlowski wrote:
> On 27/05/2026 06:18, Jisheng Zhang wrote:
> > On Mon, May 25, 2026 at 05:25:45PM +0200, Krzysztof Kozlowski wrote:
> >> On 25/05/2026 16:00, Jisheng Zhang wrote:
> >>> Add dt-binding for support of apb reset which is to reset the APB
> >>> interface.
> >>
> >> And this is ABI break, so you must explain WHY breaking ABI is worth
> > 
> > This just adds an optional apb reset, it doesn't break any exisiting
> > ABI. Kindly let me know whether adding new optional binding is also
> > an ABI break.
> 
> It does. One reset was before. Now all devices must have two resets.
> Clear ABI impact.

I checked the dts with only one reset by manual dt_binding_check
and dtbs_check, it still work, so I'm not sure why those dts "must have
two resets". Kindly let me know what's wrong.

> 
> > 
> >> doing that or what is the impact. Additionally you should explain which
> >> devices have it. Does Altera have it? You really lack explanation WHY
> >> you are doing it and which hardware you exactly describe.
> > 
> > I'm preparing one of synaptics SoCs support to uptream, it needs this
> > apb reset signal for i3c. So you mean I delay this series until the SoC
> > upstream series come, right?
> 
> No. You just sent patch which basically says that Altera has two resets,
> without any explanation of that.

I guess you mixed other series/patches with mine here, no? I didn't
mention Altera at all ;) What my series mentioned is adding apb reset
which is to reset the APB interface.


> 
> Write explicit patches with answers WHY you re doing and WHY its impact
> is correct.
> 
> 
> Best regards,
> Krzysztof
