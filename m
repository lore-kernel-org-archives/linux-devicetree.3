Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF19A40BCDA;
	Mon, 10 Aug 2026 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373966; cv=none; b=TbHa8ZkW3Xe/n5laJt9nbwuTbfxXqLLYAeqlyejkwZKJB6x0sPyTBM55KxMPmroAFxOUy5pH8yu88SyUAjcRsG++kdUV8Y6PYyN0JZriXdLYhRxILupfnVfVLhACK6xcz7LUv2TEF3T0j2Kpns3Kxjxqpwin4xn/SjAy9P/oHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373966; c=relaxed/simple;
	bh=IHe+iekkZIpD0neGrMyMer28T5XcL0bxBrC3IQ2O0aQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ns398NCRt9r5j3TZ/VBUFL7VCJM7FzAbECgEU9EHpOyeULX9QmitUrqIZfgmzl9lxDMFqFDyeRC5shDCbzf5th7iXxnakge0dVizL+sbwIJCWCvWqHsyv6UaqofEe/iAdTqnIfo0KfsDtQvSSgdcc9zt5AkFRucMIwE1hmAb3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/dYtS6i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/dYtS6i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4F81F00A3A;
	Mon, 10 Aug 2026 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786373958;
	bh=ys1aNXfackETLgPvVRA8MSu79rLpecF8Yf/cnO1Gaao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=V/dYtS6iJo8senKp13lhrmwlT8xA+1U6HjjlD+//A2SwhejyBOryc4MKyLBwVy9Xu
	 9lHQ7ilL12qzrI22qBbA7VLP99qhz/lUMAfhciVbEzcnmY/q1QGuvJ91oiUu+mpmBq
	 09XZBaY5/QCLmCS32t7cEfSMnSM9gQufkR9l8w00PDA1ltynhBlzD2W27mc6TRTTUQ
	 ZrBaQ/cErqtK68f06py0yUCN2PyRHebV0wbMUMlwF1Oyrvf1C+wH0AAUJJ31pyzzlE
	 rHjoDImKBk3jAB71tSyFC1oKqRKrjQW/1mDmgfuLo57xTbxVYW2kx/J3r5XMRLC5XI
	 /7Nd4QNrtSdHw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mattijs Korpershoek
 <mkorpershoek@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
In-Reply-To: <20260804-active-sensible-reindeer-f459a3@quoll>
References: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
 <20260730-phy-qcom-snps-femto-v2-8255-v1-1-8b8bf5105a68@kernel.org>
 <20260804-active-sensible-reindeer-f459a3@quoll>
Date: Mon, 10 Aug 2026 16:59:15 +0200
Message-ID: <87a4qu2f98.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Aug 04, 2026 at 10:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Jul 30, 2026 at 03:58:14PM +0200, Mattijs Korpershoek wrote:
>> SA8255p platform abstracts resources such as clocks, interconnect and
>> GPIO pins configuration in Firmware. SCMI power protocol is used to
>> request resource configurations.
>> 
>> Two power domains can be requested: transfer and core.
>> transfer controls clocks and interconnects and core controls
>> the GDSC, resets and TLMM (GPIOs).
>> 
>> Add a new binding for the Qualcomm SA8255p Synopsys Femto High-Speed
>> USB PHY V2 found in SA8255P.
>> 
>> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
>> ---
>>  .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      | 52 ++++++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
>> new file mode 100644
>> index 000000000000..09f7ca6e7f72
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,sa8255p-usb-hs-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8255p Synopsys Femto High-Speed USB PHY V2
>> +
>> +maintainers:
>> +  - Mattijs Korpershoek <mkorpershoek@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8255p-usb-hs-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: transfer
>> +      - const: core
>
> Here and in your other binding you call these 'transfer' and 'core' but
> all other bindings call them 'power' and 'perf'. Why this difference?

Thanks for the question. I had to do some digging because I did not know
the answer to this.

Per my understanding, the SCMI firmware (in my case, gearvm) exposes
multiple protocols identified by a protocol_id.

For example, power domains have protocol_id=0x11 and and performance
domain have protocol_id=0x13. This is defined in ARM's den0056 spec:
https://support.arm.com/documentation/den0056/f/

Each USB phy has 2 distinct power domains.
This can be observed at runtime from linux via:

/sys/kernel/debug/pm_genpd # grep 'scmi-power-usb0.*phy.*' pm_genpd_summary
scmi-power-usb0-ss-phy-pm       off-0                           0
scmi-power-usb0-ss-phy-rpm      off-0                           0
scmi-power-usb0-hs-phy-pm       off-0                           0
scmi-power-usb0-hs-phy-rpm      off-0                           0

In the case of the other bindings - for example i2c - there is only one
power domain (0x11) and one perf domain (protocol_id 0x13):

/sys/kernel/debug/pm_genpd # grep i2c0 pm_genpd_summary
scmi-perf-i2c0_7                on                              0
scmi-power-i2c0                 off-0                           0

I hope that explains the naming difference. Please let me know if this
is still unclear.

> What are these domains responsible for?

If we take the example of the high-speed (hs) phy, we can see that on
the firmware side, the only difference is the -pm or -rpm suffix.
When Linux requests scmi-power-usb0-hs-phy-pm (mapped to 'core' in the
bindings), the SCMI firmware (gearvm) will interact with the reset line,
the clks and the regulator.
When requesting scmi-power-usb0-hs-phy-rpms (mapped to 'transfer' in the
bindings), the SCMI firmware will only interact with the USB clocks
(reset and regulators remain unchanged).

>
> Commit msg is pretty useless here - repeats the diff. I can read the
> diff but I still do not understand why such naming.

'core' controls reset, clocks and regulators.
'transfer' only controls clocks. Putting 'transfer' to 'off' is
interesting in case of runtime suspend/resume as it cuts the data
transfer (by disabling usb clock)

Is it more clear that way?

>
> And why core is not the first one? It clearly feels like the power
> domain thus the main one.

The order is based on how it's defined in the SCMI firmware. It's not a
problem to put 'core' first as power-domain-names property is only used
by the linux driver. Only the SCMI channel (in my case 12) and domain
indices (0,1) matter here.

>
> Best regards,
> Krzysztof
