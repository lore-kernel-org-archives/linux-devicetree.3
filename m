Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656743B42D8
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 19:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995418; cv=none; b=l9P1bruJ/4Ob1ZPvDfyoxAiMCed6WkgvXeEe4QCUGXtJAA2HXBl2F6D9b74fEOGus3QwH+U/X3uhFJY1N642fBYKEERS2WBsUL4PDcD+yWJLO9G5SZMnsT/pmxeT1OoN+bh3FIH1eKwgwIY5B3pwn2QYi4rye8zHFy2ASqY6AZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995418; c=relaxed/simple;
	bh=U7VYwvIQkZMBWneU7P8B0jGhfr9ChgYFzuNuv+2yxgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=laH+e21Zv8XAR01N/E88uN9ZQD3RNlmGIFrT5PL/8HX8pep1Y6ifjS+LQmrEr0GHk1rh/KQVmcUYG+JUzkroh0SsgSpMPY03+4p898MQKhJ/3Aur+oGcRDxffT2j8XuUID5ywkQhwm6CsoJ5CxTObLzQFGy3A0JMI9AHAdb8UpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PxVfihRx; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PxVfihRx"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U7VYwvIQkZMBWneU7P8B0jGhfr9ChgYFzuNuv+2yxgg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786995413; v=1; x=1787600213;
 b=PxVfihRxGLi9KiOi3fNIR7guK16N6vzxnQ2T/tHzhddtspgaC+ZDkjqaBcL2ZCteQVFaplkO
 wdq26yeO0L1VeB+9E8Ip9I4jO5W1/LsvxuG9xYOY1AbTCLpEA+ZnYbNGLsq2+lEPoia1eNjI3aO
 qzuS4wdIYJdhLTw0kx2GotEM=
X-Envelope-To: devicetree@vger.kernel.org
Received: from castle.c.googlers.com (35.227.148.244)
	by mta11.migadu.com with ESMTPS id 12343935c173ffb3;
	Mon, 17 Aug 2026 19:36:53 +0000
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>,  Abdurrahman Hussain
 <abdurrahman@nexthop.ai>,  sashiko@lists.linux.dev,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] of: property: add i2c-parent to fw_devlink supplier
 bindings
In-Reply-To: <20260817145906.GB579285-robh@kernel.org> (Rob Herring's message
	of "Mon, 17 Aug 2026 09:59:06 -0500")
References: <20260815-b4-of-property-add-i2c-parent-v3-1-c22588b6482a@nexthop.ai>
	<CACRMN=cXSy0ZYH78sQ88QKkwYtbE768kh=KzRhkYYCO4SX2m-Q@mail.gmail.com>
	<20260817145906.GB579285-robh@kernel.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Mon, 17 Aug 2026 19:36:46 +0000
Message-ID: <7ia4tsosfsj5.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rob Herring <robh@kernel.org> writes:

> On Sun, Aug 16, 2026 at 10:17:08PM -0700, Saravana Kannan wrote:
>> On Sat, Aug 15, 2026 at 8:33=E2=80=AFPM Abdurrahman Hussain
>> <abdurrahman@nexthop.ai> wrote:
>> >
>> > Platform-device i2c muxes (i2c-mux-reg, i2c-mux-gpio, ...) reference
>> > the bus they multiplex with an i2c-parent phandle and hold a reference
>> > on that adapter from probe until remove. Unlike muxes that are clients
>> > on the parent bus, they live outside the adapter's device hierarchy,
>> > so nothing orders their teardown against it: if the adapter's device
>> > is unbound first =E2=80=94 e.g. while reverting a device-tree overlay =
whose
>> > changeset attached the mux nodes before the controller nodes =E2=80=94
>> > i2c_del_adapter() blocks forever in
>> > wait_for_completion(&adap->dev_released), waiting for a reference that
>> > is only dropped later in the same teardown sequence.
>> >
>> > Teach fw_devlink about i2c-parent so the core creates the
>> > corresponding device links: consumers are unbound before the parent
>> > adapter's device, and probe ordering no longer needs -EPROBE_DEFER.
>> >
>> > A plain DEFINE_SIMPLE_PROP() cannot be used because the property has
>> > two incompatible layouts: the i2c mux bindings hold a list of bare
>> > phandles (i2c-demux-pinctrl takes several), while toshiba,tc9563 holds
>> > a single phandle followed by an i2c slave-address cell. The two forms
>> > are indistinguishable in the flattened tree, and a 0-cell parse of the
>> > tc9563 form would read the slave address as a phandle, linking the
>> > consumer to whatever node happens to carry that phandle value. Use a
>> > custom parser that only takes entry 0 for toshiba,tc9563 nodes.
>> >
>> > Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> > ---
>> > Changes in v3:
>> > - Fix the tc9563 compatible check: match "pci1179,0623" (the actual
>> >   binding compatible) instead of "toshiba,tc9563", which never matched
>> >   and let the bare-phandle parser misread the i2c slave-address cell as
>> >   a phandle (Sashiko AI review)
>> > - Link to v2: https://patch.msgid.link/20260815-b4-of-property-add-i2c=
-parent-v2-1-239c6da9e097@nexthop.ai
>> >
>> > Changes in v2:
>> > - Use a custom parser instead of DEFINE_SIMPLE_PROP: toshiba,tc9563 pu=
ts
>> >   an i2c slave-address cell after the phandle, which a 0-cell parse
>> >   would misread as a phandle (Sashiko AI review, Rob). Kept the full
>>=20
>> A bit of a tangent, is this a bug in Sashiko bot?
>> It just dropped me from the reply in the v1 patch set. Any idea why?

Hm, can you, please, clarify, what do you mean?
https://sashiko.dev/#/patchset/20260813-b4-of-property-add-i2c-parent-v1-1-=
a2487e920ce1%40nexthop.ai
has your email in to according to the email policy.

Thanks!
