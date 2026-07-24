Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C931F98D;
	Fri, 24 Jul 2026 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784925244; cv=none; b=eg5qxuYNVIbY5yrmcZDcOuJrlXc9uzVnVdQs4pN4UtWqXME2YAsNPcfvptMlPgPvU7DvJp/GInUrLU4HwT2PPI0d3yIbRJch3A66xRwPQ3MMNQ9Tpl3v2ULyVGuJgf7Wr6CdHdjHaCmIzEhT4apyqnKOmsFrCWSV5IS/AmIjz7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784925244; c=relaxed/simple;
	bh=WOmAeXlFEU8XwF6UCVnA8f596AlZh0qhz8MIjGyQYJk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Hfb/MA5/CUinYFJcWe/m9/cLukvbvBWcS7nhx00w8D2NbmeWY7XAa+cBucZl8JbAxvKQNB6cEiJBqq2KiD2qHLhlzcCSBtlEbkHryQvUNkzz8DtPOjbF7yZJqirp72aeImCjUem9oTevtTUG7+jsgMaZMTAUJx9CM9xN/zl3f/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoRbqQB+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoRbqQB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD171F000E9;
	Fri, 24 Jul 2026 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784925243;
	bh=OzE0BRt0k4cK2r7lKLDhy/lGjmtBWr3yCpJradIEDBI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=QoRbqQB+cSEfc+gruKvWH71dqHXIKiEAVMUkrP4D6/k6KV7XiTA3ZIfAzZ+4yaDTH
	 NxyJEDfssp/b55URyzKqR6wrSTDmOOYC8EmxzRAHLZiC7BK94wWKno5ihn0UZvuw4i
	 BJ5A57Yskt4LWr35CX9FpEe8vhtRz0Vt3tUP0411YaBL7NpIZjA1/g2q8XBw2v/1Cf
	 Y4b7VxlsUOKvnKFfW5EYGaXTDToXYDXrdpY3Fcipt6Ckl427BQYjq2qFfZ1YeN39a2
	 SsUFbKgDTfe34N9iUR7EyMb0QjVkNDhvsjQ6nD3F0Eh4D32vjml44uZtoyUSFuj602
	 evDru+Ew9eItg==
Date: Fri, 24 Jul 2026 15:34:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-phy@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20260724184523.193661-2-ansuelsmth@gmail.com>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
 <20260724184523.193661-2-ansuelsmth@gmail.com>
Message-Id: <178492524234.1087066.16396953078954543669.robh@kernel.org>
Subject: Re: [PATCH v11 1/3] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY


On Fri, 24 Jul 2026 20:45:20 +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.example.dts:18:18: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
   18 |         #include <dt-bindings/soc/airoha,scu-ssr.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1705: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260724184523.193661-2-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

