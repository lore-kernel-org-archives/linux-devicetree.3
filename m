Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806208;
	b=SFaXjZmz2p/iBTd60gR+anfXxQCon+uQ9MjrgHq2QuoMcwfHc+ggnGcl2XilL6ENK3mW
	 5c+0DLFOru1DVHmHO3slY2QE7gJZmblSSt7EUBr2d5wCf6VQvPaxYSR04OZeiqMRcWxjq
	 NvhgZ9yYU60959RDpfDI2iZ5qpAcN2fcDskVy/ZSDM9WvvKZ7sQH4gZ0xqyQM1yiLfem+
	 Pl/jBgN+1kwHzuaerckIEgymnU298Om2J0GnG3tkwT96LmRz883NRiMrvy0vClr+qqIKc
	 NObryhlYLX8sUuV5GPL8MZDiiCcARL3EzGtHOSMy4CyU6Zw2IgR9RgD4/dHYxYHCwgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
	b=h74EXLT6+7DZDExDs038ag6QrNTZSK9mG9nRlZRhowNEARqU/SjQcGT22CsgxWswbnXN
	 zy1XjZkXAkWF0N55WZ1xpZj8dMpLPdMHUrEgecxOm5a4UT7ZRWCzji7DGWyR3L/48V+nb
	 BpUCTsZuhLKp7+9A6GETO8czvk/hpWXvVUrLDMvn422Sn9opFGpy+p7wX2kkE7V1w35G2
	 +bBNNP46KOceP+zdk8qvziiAY93yJqhUQa+uVlz3p8V/VCMp3TTFeFIeN3tOJbnPaBSx4
	 FLz3rRIoHGbLi8xYUlknUbPyr1yznNLwrQHsr6NI44G82O+B7Z22IVSljTW7jdehN6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B4NHfTIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B98606A32E
	for <Devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B98606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B4NHfTIu
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso5292255ad.0
        for <Devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793806207; cv=none;
        d=google.com; s=arc-20260327;
        b=av53vv9V0HSISbRYuoNoWJAcB+xHjRNKjid12W0I3xtZ49RMHptg8ZynxUUVgJd9Be
         H4KQ2pMJSgyahDc4BVFRzaTloxLbx/+64ucups0xRcxZPpNhmwigUotChn4ETePqXC6W
         azIgHyXmKPfeXhjJqDtIaK0m3vqgunavcDnloVwlsvD/hVI6weacu9vMSG1JkhqeSZ7v
         P2OSkoGCTDY/Jied5g7y3ioHTQQtj5L0irPOFOJJeDgvd06oAV6xJm6iqi1+Mo/UvcqW
         qtqr96EewUYPQWkaOFwM/GIdMnmxsovlFjV53xi14lt+070U0zogQHE7+lqzHwl6bPQx
         WQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        fh=KC7rqlEfj1AKseUEx1DrAp9c+yJMorxpmqhQFQbPLFQ=;
        b=pNOLxgZqMR7/3feC9u43FsGsAXEO0izG9DvqmftZUZuPz+ieRwt05zjKYnGQ2aRKGE
         A/jrjkDBHMbgKy1dSHwmwQvLHwesoY8wgSIt0xLukeqnC/jioe4vekKBzSRhIUh55Uk4
         lehX+pWzB1sLqmnRUL2ZUG/jr4+KzvY0buSaMKmBy7uhYhTe1Mc0vr5/Qy+M2DXZGORa
         GvD6eRr+wY7I+oHIjvG5yo5eT4Gc58oXJLvMRPePougVT3LHR3aaAQZdeN/3lGB/aN7A
         9Xa8NT0XAY36GGxSiOfO4yyo2cbSN1rkT4mYXNZ4ERduGZocU3zPBFM0IDt4Ku78AVBJ
         fOoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793806207; x=1794411007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        b=B4NHfTIu7W5Ik7sQdP4RN5hm0J86+FR85I04AzBg7ypd2fJn9pxo/7ZX93dGZsY9kl
         Rp3qinlS41/vaPrpdVn+ECCfZv8Gek+jndUktyAnem1TxUETpQpUkPg9xgD0lJHCLy53
         5tUQne+vcfegt7vRg915Sm7j7KAIkmt+IZb+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806207; x=1794411007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        b=jzc2L51ZpECh4kPQ8fgVCq6nZ3PDVmKGn3AjCG9zTho9AyBlo4X5WAmWIPB0gTyCVk
         U8SMD6j3neWJWyCURiH6TYSEn600kiCTgFsz1oI+pQBKVtX1aq0tf4gKgxh17qiPyAfb
         zvzoP4q8ATHWybIbgrzXlK4Y0LV9vLuCCDYX6SOEFN/FYlpWQ+RYUL4FCAu92lgwJTnW
         H1ZCxHPEDhFH6ghvmErk8A0mz7K6/NYaxSp0qmr6gOiVCQjI6sFd5FM8Kv8BTiKHAfkQ
         PhP+/dhbbE38/8ucfKFzZTvyD+2/pQA7dErmgbqCsrk56LsvBRW7FHsXyhjDDwR4+d9T
         /eQg==
X-Forwarded-Encrypted: i=1; AKwUvBxYTgNT0+aJNDNxO+2fZkF7SIqiXWCkAxqMlc6cIxq2+bTJxUV6RVwtLO7pHeFCADPQ43wViZzfI0PF@vger.kernel.org
X-Gm-Message-State: APuU4Z93uuC627WugZj4dt3ZSeOxrw/qZ3t3IacnclkYKAYl0K/DO4d8
	C/HMgOMP69yKsbVk6KP65XOIOFwReuYMlLA2Ln9lDWJ3UMF9gq/DxYeHaSXSI9olKxTb2nxuOrY
	tGjlk4Z88SJAdwzFDwZY674gKsffSFtiZ22p331z+
X-Gm-Gg: AYBFou19NdpFAYaHqtk2LRV9euvL2CfvW0uCoi2EhbXwDCuw7or27VJBp7mS7M1H6Lb
	85dRVsctLaHlSPpnlOkahsX4ey6TGqeMkiMdlHLzC3LsR69nXpb0JyMqbbIIKQj/mZ2bs4xpApm
	y29rskbqI1FUSt9oEx/II9RQbHRrDSwljj0Y28sAmp7WXto6AocHLc1m4XjaEfZJhBnrcaIDW9Z
	VjhGHRB8lIp1r6zLxZaVna/KK8NykbtpWc7+hDv5ewzZTI6v1rrqjDH/xUU4itWKFGWHEiB0P9F
	zJ3AccDb0wIROszrJ42fq45BU4jQw3M1K6z05bvcBYaHTXq1DynPT3xVgt4r5sTg0afhOuuubX4
	PmOTqIbe0WNixI7zy39ZH7f04vtML54gxVIsYIgaCXtSoHt9Vv4J8LzlXKlkUpz0uW4Oa+EAOYd
	+an6HvDmbgwht8fDW1
X-Received: by 2002:a17:903:38cf:b0:2ed:1c15:ffc0 with SMTP id
 d9443c01a7336-2ed1c160464mr6880415ad.30.1793806206581; Wed, 04 Nov 2026
 07:30:06 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-3-dianders@chromium.org> <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
 <aufr7SA1BO7zDQws@gractus.seuss>
In-Reply-To: <aufr7SA1BO7zDQws@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:29:51 -0700
X-Gm-Features: AclHuK-zfu9STJuyYWXUh5dKQ38KfyI8wl9OSEqKb4q455Uo0fKzhQBe9ijm_bI
Message-ID: <CAFLszTgpzC_z21mBpOGwFvEvy0LLxCJmUTFnst5g+1pM7BpEjw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: dianders@chromium.org, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Sun, 1 Nov 2026 at 18:49, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Oct 30, 2026 at 07:50:17AM -0500, Simon Glass wrote:
> > Hi Doug,
> >
> > On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> > > pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
> > >
> > > Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
> > > properties, and memory reservation entries without manual offset loops
> > > or `-FDT_ERR_NOTFOUND` sentinel handling:
> > >
> > > - `subnodes(nodeoffset)`: yields the offset of each direct child subnode
> > >   of `nodeoffset`.
> > > - `properties(nodeoffset)`: yields a `Property` object for each property
> > >   of `nodeoffset`.
> > > - `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
> > >   all entries in the memory reservation block.
> > >
> > > Assisted-by: Gemini:gemini-pro-prerelease
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > >  pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++++++
> > >  tests/pylibfdt_tests.py | 18 ++++++++++++++++++
> > >  2 files changed, 63 insertions(+)
> >
> > > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > > @@ -201,6 +201,23 @@ class FdtRo(object):
> > > +        soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
> > > +        while soff >= 0:
> > > +            yield soff
> > > +            soff = self.next_subnode(soff, quiet=QUIET_NOTFOUND)
> >
> > Since Fdt inherits this generator, a caller can easily write 'for off
> > in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
> > offsets move under it.
>
> Right.  I noticed that, but merged anyway, since you can basically do
> the same thing with the existing interfaces.  By abstracting it
> further, this interface does arguably make the problem worse.  This is
> kind of a perennial problem with the Python bindings.  The libfdt
> interface is shaped by what is and isn't possible with the flattened
> format - the reason we insistently name "offsets" everywhere, rather
> than just "nodes" or "properties" is an attempt to inculcate the right
> mental model.  By abstracting things more, the Python bindings make it
> easier to miss that.

Yes that makes sense, and noted.

>
> [Aside: one of the many projects I'll probably never find time for is
>  to write a Rust-native libfdt, where the ownership model could be
>  harnessed to enforce many of the required invariants]

Yes we talked about that briefly last year I think. I haven't
seriously looked at it though, apart from some experiments with
ownership of an offset. I have dug into Rust quite a bit but I'm sure
there are other people who would do a better job of this.

>
> > Since David has applied this, please can you
> > send a follow-up noting in the docstring (here and in properties())
> > that the tree must not be modified while iterating, as with
> > fdt_for_each_subnode() in C?
>
> Right, adding a comment is probably a good idea.
>
> > > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > > @@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > > +        leaf = self.fdt.path_offset('/subnode@1/ss1')
> > > +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
> >
> > The docstrings say both iterators raise FdtException for a bad offset,
> > but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
> > list(self.fdt.properties(-1)) raise, perhaps alongside
> > testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
> > same follow-up. Since these are generators, the exception only appears
> > on the first next(), not when the method is called.
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >

Regards,
Simon
