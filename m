Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192232;
	b=kSnFq/dGDGMFuWXdnNH/4lz8sy4scQcDGLrKrpZqtSEs+o43tw3ZZmAMmX2LsRmwtZ/V
	 C7xtWziGr0RWYBiiliKOfjJN69iapj+fSW4pB6xf/wbX2yTkecV0wpUtYqNUaeGfqZ0oY
	 eBc3utbdNETk4czyfIMBXlrBSd41iT4zQzHwL5MwUqIQdFfTBWiA75GO2G2FQO8B4vkYO
	 iqhgkTHobHU9DaFsbgKu+qfXvQAqtKtcIMQ1qZDgHwAc0VU7OuW4zxUcfdi9Q7MgwcDJe
	 moGvWeBv5MsG3Do9ltDKSWgUk47g82Lge1athqhFV1LidE6laDNn3vE5wG9u6Z5cfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192232;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Yq6Wg8dZm4uB3bJQCmf1miWvm1ABWBJ7TTfz/AA487Q=;
	b=ri423OwqD7ACdVbvxP6dWcVMtIYgR3mg3d+RSthTngL2s6gi1U+qCCQaQETHNOnKroOf
	 4nyorjBP6BaXimZ1jBdDyYpNepC2J0PiZrJdOdfDGmIs4g/FwGfSm82r2LOoh4HSSVKcY
	 o3sWB7Y+926lp2hsbg/Rg5CvKiWJ35KYX9C1oOa2pPoXMVk47pmbGc8QlGcty9LtfRbVp
	 9uZLXkcVWNC1L03bkHsRNq7krO6REoSy3B/kcVZr23KTYBMj97CyLm3sBbUWgbNlJazRj
	 lnh2b4ojI3xMZx/PC7auKsRtIt21sYoXmQc3MU+0keVrvSQiV6YxnjJYq/r+gHEV75g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n1/628eM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445E4606A322
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 02:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1/628eM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB33D1F008A1
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 02:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794192231;
	bh=Yq6Wg8dZm4uB3bJQCmf1miWvm1ABWBJ7TTfz/AA487Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n1/628eMuF0qPAkqesisYQ6yKWJ7AmwnuO4vlBh18h6Mj36/7w+FGaj+I60SWAPhH
	 D0OAPqOPz7kbkmrxpEYoORTdfBel351gZLiQfi4B+tzWMqcHNafX/L5Zft/yGhttMj
	 hvy96X4MxRcGm8b9ek2TMXliumh9cbCxqBzsD1ic0KGJbQJ6GPBUTjERr4M4TcnPsD
	 eNbcW8kuACQkLpReDZ8FF4IhhBR9QChQfZq5cRyy8XMZzuks9w2tPEqYdiIBFYr2uL
	 bPV32hAroVDL3cyKi2ybGo26vdrvfs5T3ZpfwA9favWSGpR+lypSfipGx+pSu9Z6Mu
	 SuD1iF8Duahyg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so578002a12.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 18:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFiyrTofIXEZeurLdpUI1VbV14sgGN5t2Myj3VOXsdf1ulaRwDzki9nurzIbV5gQXbbnbyLbHdQAN1A@vger.kernel.org
X-Gm-Message-State: APuU4Z94oBCNWklEw7+BnUWtY4b24B9hvkOINq+kCxW+EkG8itGo75Jk
	sGtFpbJNukH2zyGt/SrqRKTBSO1owdIkzZ3MK7mhGq3f5Ess+p0KdHEDMW3wGUhOzASoBZc0rAD
	IvwuVDpQc1yadYrw/leigYjrs3CnN/IY=
X-Received: by 2002:a05:6402:4487:b0:6b5:7de8:87cd with SMTP id
 4fb4d7f45d1cf-6b72249a189mr1729932a12.42.1794192230805; Sun, 08 Nov 2026
 18:43:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com> <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
In-Reply-To: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
From: Saravana Kannan <saravanak@kernel.org>
Date: Sun, 8 Nov 2026 18:43:39 -0800
X-Gmail-Original-Message-ID: <CACRMN=d8OnSHZ=4DOmfWafwYL+8ZTGggrxdWV2-iTptEJmd19A@mail.gmail.com>
X-Gm-Features: AclHuK83znKgPlPm3mYNg-jihIjo0y5-ZXz-onGQXWzrK1htisLXcdgRQNPmioU
Message-ID: <CACRMN=d8OnSHZ=4DOmfWafwYL+8ZTGggrxdWV2-iTptEJmd19A@mail.gmail.com>
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 6:08=E2=80=AFPM Songwei.Chai
<songwei.chai@oss.qualcomm.com> wrote:
>
>
> On 11/6/2026 4:50 PM, Johan Hovold wrote:
> > [ +CC: Saravana ]
> >
> > On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
> >> fw_devlink detects and relaxes dependency cycles automatically, so thi=
s
> >> is not an error condition requiring user action. On complex DT
> >> topologies (e.g. CoreSight), this message can fire for many node
> >> pairs and adds noise to the boot log, even though it's primarily
> >> useful for debugging. Switch pr_info() to pr_debug() so it stays
> >> available via dynamic debug when actually needed, without cluttering
> >> default boot logs.
> >>
> >> For example, on sm8750 this produces 125 such lines in the boot log in
> >> total, 80 of which are CoreSight-related, e.g.:
> >>
> >> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with =
/soc@0/stm@10002000
> >> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /so=
c@0/funnel@10041000
> >> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with =
/soc@0/tpda@10004000
> >> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /s=
oc@0/funnel@10041000
> >> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /s=
oc@0/tpda@10004000
> >> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /s=
oc@0/tpdm@1000f000
> > I reported this elsewhere a while back:
> >
> >       https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com=
/
> >
> > Are you sure it's not the coresight bindings that should be fixed?
>
> No, Johan, I don't think this is a Coresight bindings issue.
>
> This is the mechanical result of the standard bidirectional graph
> binding + fw_devlink's direction-agnostic phandle scan =E2=80=94 it will =
appear
> on any SoC/CoreSight topology using the standard binding, and there's no
> alternative binding syntax that avoids it.

You can add the post-init-providers property so Linux/OSes can know
which dependency is not a probe time or initialization time
dependency.

A lot of cycles can be broken by adding just a few of these. It'll
make sure the coresight stuff gets probed in the right order, and more
importantly also does suspend/resume, etc in the right order too.

-Saravana
