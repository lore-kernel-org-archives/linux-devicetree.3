Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102440;
	b=kp5ucCXsATGCQjEaAbfY+mj9tRC7qBkt/UljfWBq5uqZQFzQhSiXHOox9G31ODE+to9f
	 B66WHtYSfAWDOfW4/Bl3Oa4czksHolxNDAsSq9WXyIHVh0R17fO5N9lr6qmzdyqdHW36I
	 YkAoryU1Fm+TGfKQb/CKLrSWpPut+0jw3J3Ujk97GwNsQhj+efpRoAufPTGxRD+zQ7xjj
	 rtHGv92JIRRI5uF7yXSQuB5VoYNcGcLQwRQON6VJC7Hp6YlBs+0TgS7Ej6qNuHCcig33I
	 ny5R6d9EhaOxWPP705yDp8o2spfd3Tyi7S/TQKGY1eoiuVRP4mWANNjwWDIop5q4tpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102440;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=qfFUCIZgNtDrebR5TXzGcGH+fNXZlxU+ZtMG6Li3Dc0=;
	b=4wBo3awdY1m/w7iyzAIzUDrn7SJx2Au6F6qxlE4BWzawT6nPtIO9KV78wr0/Z/TjrER7
	 IHP86ZoaQjGXcL5Koq9jvoGylBkLYYutoxqFa8TWzd+eVHEAGWoeNMuBRdTTCFpJBmn1x
	 Gdc1A3d8oTTt4E7rqgKq7LnSqSIa3UL10Xyy1I7l1Xk7N+dDpN+pkrNKpBsFVBrhmQHU2
	 9qU0CZzluVUos94XE9yLGlO/ICj4STBc+ADoDA1kL2qryuKdEAOHj7dgJ8EmNAo4XcjuY
	 2gpIR5dqTn+7uXb5IPZdcQnh6IegK6CkdULN0jU2jCzqdTxSixsscUd4A/mgDHGGZFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=KnTib98g;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FF1606A320;
	Thu, 19 Nov 2026 15:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FF1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=KnTib98g
Message-ID: <8dc67b9e-3c83-4149-ada5-86675c4d2dc2@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795102437;
	bh=wpMLumcitgieg7hRcQXz7Vzp64VudourAIROoFR57dc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=KnTib98gZlovMirVwATCatAsBtP2DNRnDFKysRiVCegJuFOC87OHIPabVkcAPIbm7
	 /fD1M9YTofAMuc/Za9WUQT1UrBnvs+gIPWJ+njLqEBMk2ia8rD+QYHawQvvXTh9kCN
	 FFH8d7wCA8lXUrcRNXkEIAYvdDFCF/aQ4AGIruDg=
Date: Thu, 19 Nov 2026 16:33:56 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH 00/10] phy/drm: amlogic: Extract Meson HDMI TX PHY into a
 dedicated driver
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <51831581-525f-418c-86ea-3b5c6a80709b@linaro.org>
 <bb027d3b-6a43-4dd3-9771-3448c86996b5@aliel.fr>
 <04447713-32bb-46ff-8dd9-ba00bce186db@linaro.org>
Content-Language: en-US
In-Reply-To: <04447713-32bb-46ff-8dd9-ba00bce186db@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/19/26 08:58, Neil Armstrong wrote:
> On 11/18/26 20:35, linux-kernel-dev@aliel.fr wrote:
>> On 11/18/26 13:38, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 11/17/26 20:33, Ronald Claveau via B4 Relay wrote:
>>>> This series moves the Amlogic Meson HDMI TX PHY handling (covering
>>>> GXBB,
>>>> GXL, GXM, and G12A SoCs) out of the meson_dw_hdmi DRM driver and into a
>>>> dedicated generic PHY driver.
>>>>
>>>> Until now, meson_dw_hdmi directly manipulated the HHI system controller
>>>> registers (HHI_HDMI_PHY_CNTL0..5) to configure analog parameters,
>>>> toggle
>>>> resets, and manage power states, as well as manually ungating HDMI
>>>> clocks and power domains already described in the DT.
>>>>
>>>> By extracting this logic into a standalone PHY driver under
>>>> drivers/phy/amlogic/:
>>>> - Hardware representation in the DT is cleaner, modeling the HDMI TX
>>>> PHY
>>>>     as a child node of the HHI syscon referenced via standard "phys"
>>>> and
>>>>     "phy-names" properties.
>>>> - The DRM bridge driver relies on the standard generic PHY API
>>>>     (phy_init, phy_configure, phy_power_on/off, phy_exit) rather than
>>>>     touching syscon registers directly.
>>>> - Legacy DTs lacking the "phys" property remain supported via a
>>>>     temporary fallback helper (meson_hdmi_phy_create_legacy) to
>>>> preserve
>>>>     backward compatibility to be removed on next phase of component
>>>>     removal.
>>>>
>>>> Overview of the series:
>>>> - Patches 1-3: Fix compatible matching in meson-gx-hhi-sysctrl
>>>> bindings,
>>>>     add the new amlogic,meson-hdmi-tx-phy DT schema, and allow the
>>>>     "hdmi-phy" child node under the HHI syscon.
>>>> - Patch 4: Add the new Meson HDMI TX PHY driver implementing the HDMI
>>>>     PHY configuration ops, along with the temporary legacy creation
>>>>     helper.
>>>> - Patch 5: Document the optional "phys" and "phy-names" properties in
>>>>     the amlogic,meson-dw-hdmi binding.
>>>> - Patches 6-7: Clean up manual HHI clock/power-domain writes in
>>>>     meson_dw_hdmi (relying on runtime PM instead) and convert the
>>>> driver
>>>>     to use the generic PHY framework.
>>>> - Patches 8-10: Add the "hdmi-phy" child node and wire up the "phys"
>>>>     phandle for G12, GXBB, and GXL Device Trees.
>>>>
>>>> Tested on:
>>>> - Khadas VIM1 (GXL)
>>>> - dtbs_check and dt_binding_check run cleanly with no new warnings.
>>>>
>>>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>> ---
>>>> Ronald Claveau (10):
>>>>         dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Fix compatible
>>>> matching in conditionals
>>>>         dt-bindings: phy: amlogic: Add Meson HDMI TX PHY binding
>>>>         dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy
>>>> child node
>>>>         phy: amlogic: Add Meson HDMI TX PHY driver
>>>>         dt-bindings: display: amlogic,meson-dw-hdmi: Add phys and phy-
>>>> names
>>>>         drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
>>>>         drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI
>>>> TX PHY
>>>>         arm64: dts: amlogic: Add HDMI TX PHY node for G12
>>>>         arm64: dts: amlogic: Add HDMI TX PHY node for GXBB
>>>>         arm64: dts: amlogic: Add HDMI TX PHY node for GXL
>>>>
>>>>    .../bindings/display/amlogic,meson-dw-hdmi.yaml    |   8 +
>>>>    .../bindings/phy/amlogic,meson-hdmi-tx-phy.yaml    |  33 +++
>>>>    .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  43 ++-
>>>>    arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   7 +
>>>>    arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   7 +
>>>>    arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   7 +
>>>>    drivers/gpu/drm/meson/Kconfig                      |   1 +
>>>>    drivers/gpu/drm/meson/meson_dw_hdmi.c              | 203 +++++
>>>> +--------
>>>>    drivers/phy/amlogic/Kconfig                        |  11 +
>>>>    drivers/phy/amlogic/Makefile                       |   1 +
>>>>    drivers/phy/amlogic/phy-meson-hdmi-tx.c            | 309 +++++++++++
>>>> ++++++++++
>>>>    include/linux/phy/phy-meson-hdmi-tx.h              |  19 ++
>>>>    12 files changed, 513 insertions(+), 136 deletions(-)
>>>> ---
>>>> base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
>>>> change-id: 20261115-meson-drm-create-hdmitx-phy-4ac40a654d09
>>>>
>>>> Best regards,
>>>> -- 
>>>> Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>
>>> Overall it's very good, but I would've prefered a more sequencial move
>>> to the PHY driver, with an exact copy of the code and simplification
>>> towards the current PHY code.
>>>
>>> Anyway, the sashiko review comments are good, especially the one on
>>> patch 6 to keep the driver working on old DTs, sorry my bad...
>>>
>>> Neil
>>
>> Thanks for your feedback, I am analyzing/testing sashiko feedback.
>>
>> About the suspend/resume unbind/bind, I do not have any issue on my
>> side, but I can change the orders.
>>
>> About patch 6 and the old DTs, I will reintroduce them with the legacy
>> check. Do you know what would be a good timeline to add a require on
>> those elements and drop the fallback code ?
>>
> 
> The problem is not necessarily the kernel DT but the U-Boot DT which
> could be used by the kernel.
> 
> The U-Boot DT was using v6.2 before v2024.07 and after it uses the
> synchronized
> DT from Linux, which coincides with the v6.11 DT which contains the DT
> clocks
> changes.
> 
> It seems most of the SBCs distro uses recent U-Boot versions, and some
> nice distro
> ships older U-Boot version, so it could break on those if a new kernel
> was deployed.
> 
> But, U-Boot already set HHI_HDMI_CLK_CNTL and HHI_MEM_PD_REG0 when
> probing dw_hdmi
> since 2019.04 so considering that I thing the risk is super low.
> 
> Add this to your commit message and send a v2.

Crystal clear, will add that in v2.

-- 
Best regards,
Ronald
