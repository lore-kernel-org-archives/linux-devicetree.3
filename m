Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CDC3AB272;
	Wed, 29 Jul 2026 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785348430; cv=none; b=j2C8NVpTn4HM0QQiIkRoUEG9Lr/P3ihDAFnUkrJLOOSQOh5DZ/BTVnvmQS44j6h1Dz8NqSAFVBzhR5ZAVZD1/D+eS9QycFKEu6NFfrFAwVpSPwdp8rFjPEkpyd2FoZV84WjadTrj4bAfkWbWz0xY3XVTHEmrF2bY56VYs3JOEHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785348430; c=relaxed/simple;
	bh=hF96k2yDYP4CtxHfzjkO+7f/2yc+R1uWoFynofZ9XNM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aUhUS5hBT5ZpuPmyqs5CSSkMVTPxt09TepfrnN0T37K1bmbub3tRif6XFphpx3wP73qBw4rOmTil4D/8mSoP/lV6F1aPei4dadqxugUfN6E1+ItLWeMkAlMYKM1GCkhAr1YY726eExlw58zlubRDFFJ9A0dmPbGWF7EkNGzyP5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oy3WZX3V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oy3WZX3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FA11F000E9;
	Wed, 29 Jul 2026 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785348420;
	bh=LfVo/5pspi7nSOnwGr07fdJGZ3XUZxg5tX6GJjgn0I8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Oy3WZX3V8SgdlrdI9eD0k11Icsgg9aRKtE0lgNAZElHusC8aqnRKu3bzFh5wstaSg
	 5qAYdcZTLLWFGcpyFjiu2hzT8yRTs/cohj6Y/xs5HT+AbplhWHrCOJ1uoXwQxOy9BX
	 xWAqHsdYqKZeTnc8C85Fq55kEXkPiEINKcmD9bYxJ0WEqo28no+28dwdQBo053mCVG
	 QugWGcWlkrh/PjVv2Fw+vatfxsbWvExc+HyqGYRG+1S4YPVBM4bC8mI5qxnxhpmVX1
	 TB7qbWEHGUmBoogwWEOCxJ4D4Czwg49oLfRRdd/jFLyBkWXwpM3jl5iDHUMaAEcp8f
	 T8GzYgbhrdvLQ==
Date: Wed, 29 Jul 2026 13:06:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: anup@brainfault.org, guodong@riscstar.com, 
 pincheng.plct@isrc.iscas.ac.cn, alex@ghiti.fr, aou@eecs.berkeley.edu, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 michal.simek@amd.com, dave.patel@riscstar.com, pjw@kernel.org, 
 linux-riscv@lists.infradead.org, zhangchunyan@iscas.ac.cn, 
 raymond.mao@riscstar.com, palmer@dabbelt.com, greentime.hu@sifive.com, 
 dfustini@oss.tenstorrent.com, luxu.kernel@bytedance.com, 
 conor+dt@kernel.org, akpm@linux-foundation.org, scott@riscstar.com, 
 jim.shu@sifive.com, krzk+dt@kernel.org, robin.randhawa@sifive.com, 
 zong.li@sifive.com, pawandeep.oza@oss.qualcomm.com, nick.hu@sifive.com, 
 samuel.holland@sifive.com, darshan.prajapati@einfochips.com, 
 junhui.liu@pigmoral.tech, dlan@kernel.org
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
In-Reply-To: <20260729163908.249838-3-peter.lin@sifive.com>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
Message-Id: <178534841698.3259786.10094204605740986474.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties


On Thu, 30 Jul 2026 00:39:07 +0800, Yu-Chien Peter Lin wrote:
> Add per-hart DT properties for the RISC-V Worlds architecture:
> riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> platform-defined values are primarily used by M-mode firmware
> to configure World ID CSRs and restrict WID usage across
> privilege levels.
> 
> Also add schema validation rules to enforce valid property
> combinations based on the ISA extensions present.
> 
> Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> ---
>  .../devicetree/bindings/riscv/cpus.yaml       | 61 +++++++++++++++
>  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
>  2 files changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@0 (riscv): 'riscv,pmwid' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@1 (riscv): 'riscv,pmwid' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@10 (riscv): 'riscv,pmwid' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
Documentation/devicetree/bindings/cpu/idle-states.example.dtb: cpu@11 (riscv): 'riscv,pmwid' is a required property
	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260729163908.249838-3-peter.lin@sifive.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

