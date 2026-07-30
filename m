Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF4832BF24;
	Thu, 30 Jul 2026 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405327; cv=none; b=P33qsNqtqZsl9P3BaCaYonJ+jLFJNMZggy0Bf8TiFx5IOYtKHAMJsN41mUlgDpcTn450owJcgIjwzE6/HA2KS+gLMmt7uBTpuJts1uS1+85EdDNKGjgJUfq8OT1cN7JtCRCIxFl/vc8petLEaVPRORWbGThdU+Dlbnk9KusiGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405327; c=relaxed/simple;
	bh=MkocP/exxjWkExBkIUIx0zmhCnw4pV46V/2tv655Qx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1E4901shF7rvC3Nh5U6o0D8GI4IUsO5pvBXzjHBReS6cvyZBsBtra/GgqZM+nFQphoqu8W2FujWBU1ZdM44Min76gZjSZUyvWbuk1pL8nBac6idy4218hwOY0v/4WiSAhADnEtu49o6QArzwgV2TYVVaI1raCF7PymMdUTDh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i01e/2eG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i01e/2eG"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89E281E4;
	Thu, 30 Jul 2026 11:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785405250;
	bh=MkocP/exxjWkExBkIUIx0zmhCnw4pV46V/2tv655Qx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i01e/2eGhYb90MI/TpsxOAe36iRCix9y78XYuIAArWTu/nXYgTMnO9i4wKubeSqG7
	 IBYr/j0QWKZvqLWh5R5fZJGBR0EYm84Vn648K3rD6I9upVndN0vPnpTkPeErBNh9x0
	 iz5mUhNIlfx/TlgBZ4fMRPzO4y2rfr0a8MuDQweE=
Message-ID: <a89591d4-e6eb-4622-9c2f-2e0d52733feb@ideasonboard.com>
Date: Thu, 30 Jul 2026 12:55:12 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] drm/tidss: Add support for DPIENABLE bit
To: Devarsh Thakkar <devarsht@ti.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
 <20260529-beagley-ai-display-v3-10-7fefdc5d1adf@ideasonboard.com>
 <4cdc9944-9486-461b-b637-702921a4367e@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <4cdc9944-9486-461b-b637-702921a4367e@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/07/2026 09:35, Devarsh Thakkar wrote:
> Hi,
> 
> On 29/05/26 14:15, Tomi Valkeinen wrote:
>> Many (or even all?) K3 SoCs have DSS VP_CONTROL.DPIENABLE bit described
>> in their documentation. This bit controls whether the DPI block is
>> enabled, and is set to 1 by default (i.e. DPI is enabled at HW reset).
>>
>> However, in almost all SoCs the setting does not actually do anything,
>> and at the moment the bit is not managed by the driver.
>>
>> The exception is AM62L, which does have DPIENABLE connected, and
>> disabling the DPI block when it is not in use provides power savings.
>>
>> Let's add a new feature flag for this, 'has_vp_control_dpienable', and
>> implement the support.  Disable DPIENABLE for all videoports at resume
>> time, so that it is 0 by default. Specifically enable and disable it in
>> dispc_vp_enable() and dispc_vp_disable() for DPI output.
>>
> 
> I think in commit msg you probably mean to capture dispc_vp_prepare/ 
> dispc_vp_unprepare instead of dispc_vp_enable() and dispc_vp_disable() 
> for enabling/disabling DPIENABLE bits. With that correction in commit msg,

Indeed. A left-over from an earlier version. Thanks!

  Tomi

