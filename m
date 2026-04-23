Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA406FBF;
	Thu, 23 Apr 2026 12:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947297; cv=none; b=boh9j+zoTcmmoQXTLCKKSJMnGRA0QbwGMIk5H72QwhKYDa0FIrIYu6/rsPQk6E//IDeTafZ6hq2v6nmzUofNf2G7r6A9iil73iUNuTvSjCKxFGgXM6GyuoXB9Focqn5F3UAKnaFZ4YumOnZ7Rw/8fht/tHUKmcYaz8zUTK1uIzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947297; c=relaxed/simple;
	bh=bh8U+a4Qwv++3enZzOn0C7MODCZXm9bpoPVqYI1wbm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SU2fvoqBURAFMuf0E7b8X5GRRP9+F6+AGwlmHS5Efw/fAhokR7pR3+GZjQfUNJfUQnu1Zs8+hNsUn/oCaLZFisRSjnCLk8CWWYXlN2MI8H1ib9aCgRWoD7ZUPJTLcM2ettUJPEVkulqgX1sXkxaSKjkWB7AMuWXKWZBEPYnCsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XFaxD1wp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XFaxD1wp"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43ED1838;
	Thu, 23 Apr 2026 14:26:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776947194;
	bh=bh8U+a4Qwv++3enZzOn0C7MODCZXm9bpoPVqYI1wbm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XFaxD1wpW3bVMG4hjwJco56fJCsPisDvmb6ZDnEkcus0vOUrZ1C2HR3sC3ViFICp7
	 /HLRMqQguTljO0+b1J8cNxFJS83HG9r/Vw3TkQNwacPbJuL0IWAoUP/TSY8NHdaNDn
	 HTp970h6bdbCJo+fF6EiWeGWCK0VF1cXiOkZI/+4=
Message-ID: <72c2cd94-0a8b-46c8-981b-4ad4a3222e59@ideasonboard.com>
Date: Thu, 23 Apr 2026 15:28:08 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: simple: Add timings for Raspberry Pi 7"
 panel
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-rpi-7inch-v1-0-e68d5c9c44bc@ideasonboard.com>
 <20260420-rpi-7inch-v1-2-e68d5c9c44bc@ideasonboard.com>
 <3z3u5mbngmbzsch3mzs3twlh3aec6r7jokstzv3ghxyusrzt6b@jqvdnuiapx6e>
 <af71183d-70b8-4a41-8466-67123e7aab02@ideasonboard.com>
 <20260423-kickass-fat-boa-209f68@houat>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20260423-kickass-fat-boa-209f68@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/04/2026 15:14, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Apr 23, 2026 at 03:01:51PM +0300, Tomi Valkeinen wrote:
>> On 22/04/2026 22:22, Dmitry Baryshkov wrote:
>>> On Mon, Apr 20, 2026 at 04:13:36PM +0300, Tomi Valkeinen wrote:
>>>> Add timings for the panel used in Raspberry Pi 7" DSI Display module:
>>>> https://www.raspberrypi.com/products/raspberry-pi-touch-display/
>>>>
>>>> This has been tested with version v1.1 of the display module.
>>>>
>>>> The panel is very strict about the back-porch values, they must be
>>>> exactly 46 for hbp and 23 for vbp. Other timings can be defined quite
>>>> freely.
>>>>
>>>> The panel is exclusive to Raspberry Pi, and different versions of the
>>>> display module can have panels from different vendors which are fully
>>>> compatible. Also, as the panel vendors are not public, the compatible
>>>> string used is "raspberrypi,7inch-dsi".
>>>>
>>>> Note that while the display module has a DSI connector, and the
>>>> compatible has "dsi" in it, we use DRM_MODE_CONNECTOR_DPI as the panel
>>>> itself is a parallel video panel. The display module (as of v1.1) uses
>>>> TC358762 DSI-to-DPI bridge to do the conversion.
>>>>
>>>> We could use DRM_MODE_CONNECTOR_DSI here, which would have the benefit
>>>> of showing a "DSI-1" connector to the userspace. However, the panel IS a
>>>> DPI panel, and gets its input from a DSI-to-DPI bridge, and the
>>>> panel-simple.c behaves differently depending on the connector type used,
>>>> so, DRM_MODE_CONNECTOR_DPI it is.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>>>>    1 file changed, 32 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>>>> index 91ab280869ba..e75eb20301f2 100644
>>>> --- a/drivers/gpu/drm/panel/panel-simple.c
>>>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>>>> @@ -4208,6 +4208,35 @@ static const struct panel_desc rocktech_rk043fn48h = {
>>>>    	.connector_type = DRM_MODE_CONNECTOR_DPI,
>>>>    };
>>>> +static const struct display_timing raspberrypi_7inch_timing = {
>>>> +	.pixelclock = { 10000000, 30000000, 50000000 },
>>>> +	.hactive = { 800, 800, 800 },
>>>> +	.hfront_porch = { 16, 72, 354 },
>>>> +	.hsync_len = { 1, 32, 40 },
>>>> +	.hback_porch = { 46, 46, 46 },
>>>> +	.vactive = { 480, 480, 480 },
>>>> +	.vfront_porch = { 7, 21, 147 },
>>>> +	.vsync_len = { 1, 2, 20 },
>>>> +	.vback_porch = { 23, 23, 23 },
>>>> +	.flags = DISPLAY_FLAGS_VSYNC_HIGH | DISPLAY_FLAGS_HSYNC_HIGH,
>>>> +	/* Note: the rest of the flags are defined below in bus_flags */
>>>> +};
>>>
>>> This looks pretty close to powertip panels that have been used before
>>> hand in those modules. Are you sure that powertip,ph800480t013-idf02
>>> or powertip,ph800480t032-zhc19 don't work for you?
>>
>> I haven't tested those, but the hbp and vbp do not seem to be the same. For
>> me, they had to be exactly as they are here. This was also confirmed from
>> Raspberry Pi, the panel datasheet had min/typ/max values (i.e. not ranges)
>> of 46 and 23 for back porches.
>>
>> Where did the information come from that powertip,ph800480t013-idf02 or
>> powertip,ph800480t032-zhc19 are used in the display modules? Or did you mean
>> that while those models are not used in the Raspberry display module, people
>> have used them successfully?
> 
> It also looks like we have panel-raspberrypi-touchscreen.c and raspberrypi,dsi-7inch in
> panel-ilitek-ili9881c.c.
> 
> There's clearly more than one "7-inch rpi panel" so clarifying how it
> compares to the other two drivers would help.
Indeed, it's confusing. I'm a bit new to this so I don't know all the 
details. From Dave's mail to me about panel-ilitek-ili9881c.c:

"
The two variants listed on 
https://www.raspberrypi.com/products/touch-display-2/
5" and 7" panels, both at 720x1280 (portrait), using the ILI9881
display controller and Goodix GT911 touch controller.
"

So that one is a different line of display modules.

panel-raspberrypi-touchscreen.c: this one is interesting, it's some kind 
of multi-device driver for the display module, but indeed, it's for the 
same module that this patch deals with. In my view that multi-device 
driver is deprecated.

I can clarify these, as per my best understanding, on the patch desc.

  Tomi

