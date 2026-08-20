Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC63B6BFA;
	Thu, 20 Aug 2026 06:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208522; cv=none; b=qv+pyQCjtJeQiovJNYtDSo5Rv83ZozYDFQutUMXI21SxBGKBKs4hRMvQv5jx0B41DQKIMboojM7/kPT7I1IjpOPOLzRfDrNxMmgkreXWITzb1SYm6XFb+WX7ua9B+jbIfRbexuGJoiiuHx1rpFU0r8M/Uya1l9+qR+Oj9TB1eyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208522; c=relaxed/simple;
	bh=vMPCPrwoLmEUOkyh2bLMfrxXsCx/qP8MVWhTl1m+vSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbiXROdKURUx3a4CwFw098UUA6p+KVWmDiRkGef0IecrNS8cAlifsjEAltYTebEUh9zEx7rwiFtUEk+5NNkEbKumC26D/frBoQv/Vz/CSO9CtiWlHjtXnFBTPSU2Jhvq2tePR2f4lv5bWkcRDVFshBAtX+e8c8S3e/fdnPvjxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uhnp1VQY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uhnp1VQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9529E1F000E9;
	Thu, 20 Aug 2026 06:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787208520;
	bh=QevXqOjmThfsypAErhlJDLgFo7ZGdAndBJHfDiAW7e0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uhnp1VQYPSOGkPG6GeIj5hePdI+FB86YKKTVTGvjHO/Glk6mpSQ0fcW5mIQsOH/YV
	 DPn81zGYBdciMSWB2zcZTaIUrokp/s/NlvxN+bExBr+eioD00d5Sga9XbAYWNapyK4
	 /1ds1E9+W/DxbfTIhu610M6N46l1149wsjAK5/1VdQu7iwi1dx/Df5mjzia1TB5otI
	 cuxBeLYKaMAVHHXUiOsJqob9DIkr557Dle5T5cr9PRAv1OAhaJss3NsBA+YAt6q4Hj
	 o0QokcdWKumnU+XjG/QtooA+kA8YTRpC4wi91bowvtAtwgyQNhg12aNXzuuSOX0gQn
	 FVWIRp86odU5A==
Date: Thu, 20 Aug 2026 08:48:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: visionox,vtdr6130: Add Retroid
 Pocket 6 panel
Message-ID: <20260820-nocturnal-arboreal-cuckoo-2eed61@quoll>
References: <20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com>
 <20260814-rp6-panel-v1-1-111c1aeccf0f@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814-rp6-panel-v1-1-111c1aeccf0f@gmail.com>

On Fri, Aug 14, 2026 at 01:17:15PM -0500, Aaron Kling wrote:
> The vtdr6130 is a display driver integrated circuit, a common chip used
> for various panels. One such panel is used in the Retroid Pocket 6.
> 
> The RP6 panel only lists the regulators vddio and vci, so drop vdd as a
> required property. The panel is rotated 270 degrees to natural, so also
> add rotation as an allowed property.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml      | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

