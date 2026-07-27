Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E713F5BFA;
	Mon, 27 Jul 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145653; cv=none; b=k0aMC9m/d/Q4w+wl5OKrgKwhYjXOQwJd2rzGo8PGMfkGwGlyv0EeFGYxggGKqalvy8I6wZ9paAslKGJnR532zFRuUqKfDKx6VGmBhWaFGS5LZ/8IprbryIhJjHhASYMj5FnnSjfrksszfEbBKi/TFrxmjYj+0taZJbmw+aMTe2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145653; c=relaxed/simple;
	bh=2N+DnBX9N+Jq79DorTK/tI6Ge8iQYy9BCamdi6yp8/E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HQ/pIUcfIGlcXaNf9SeC2jOtzevjBMtUE6r/dqh9ggEMSD6P+JNVWAM2fc4LJuOmgDp7s7+YkZY1sMVMEfD8v2KjaAhpB8bAbIh+wf33IU5eNZSTd2oxsUOWEbFmyxD2489JbHB6BC3bMEeq5/RqCN/7wjsvUXt7+KR+fKz+1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atOtEwx3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atOtEwx3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B271F000E9;
	Mon, 27 Jul 2026 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785145641;
	bh=W3PX3VpCuie7A6qdzLftyVv0cWpmyIszAcx/LuYWB+U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=atOtEwx3xo/etP/37iEyByhk5Q9HnDd8N7cXldc8KqrENRz66mqJC61Rfz19EBe8/
	 TfTZr9jbfYnFbZEMBwXYt7n3d807cNQfmQQru6Ry8Tb373Vv/e47UOCRNQpbUSFk55
	 SAhMYwadDkDabEgluQtiVFv0R/5wpGDxGDMiQFEalc6FEL5m1dbGN/+ZvFGqvqbV9N
	 k3BcWGnxUXLjmCOgvZZEKw+ksV4BtTyf0lIzABnHPZ9zj5NpZfpWTQ+yyy0mGlriBY
	 3kXtGJrwJp0t4T4cLO9qrrnpgBGAQBwvo3bAN4104i2oMmR+n05fGwqRoXnUz9FjLG
	 ux3diYmQO+5qA==
Date: Mon, 27 Jul 2026 04:47:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Jun Nie <jun.nie@linaro.org>
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
Message-Id: <178514563985.1199273.4525119457881224571.robh@kernel.org>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455
 panel support


On Mon, 27 Jul 2026 16:08:44 +0800, Jun Nie wrote:
> Add support for the dual-panel system found in the virtual reality device.
> This system consists of two physical 2160x2160 panels, each connected via
> a MIPI DSI interface. The backlight is managed through DSI link.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/display/panel/synaptics,r63455.yaml   | 133 +++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml: properties:ports: 'anyOf' conditional failed, one must be fixed:
	'type' is a required property
	'$ref' is a required property
	hint: node schemas must have a type or $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dts:29.17-27: Warning (reg_format): /example-0/dsi@ae94000/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dts:20.21-61.11: Warning (unit_address_vs_reg): /example-0/dsi@ae94000: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dts:27.28-60.15: Warning (avoid_default_addr_size): /example-0/dsi@ae94000/panel@0: Relying on default #address-cells value
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dts:27.28-60.15: Warning (avoid_default_addr_size): /example-0/dsi@ae94000/panel@0: Relying on default #size-cells value
Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dtb: panel@0 (sharp,ls026b3sa06): reset-gpios: [[4294967295, 3, 0], [4294967295, 11, 0]] is too long
	from schema $id: http://devicetree.org/schemas/display/panel/synaptics,r63455.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/synaptics,r63455.example.dtb: panel@0 (sharp,ls026b3sa06): reset-gpios: [[4294967295, 3, 0], [4294967295, 11, 0]] is too long
	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

