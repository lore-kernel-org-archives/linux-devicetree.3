Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC413CD8C2;
	Tue,  7 Apr 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775577537; cv=none; b=ewRVHkDtuqzrBvhmQwiBJG0wJqjxzQ3skpjCxxtu/vleZTTHZeRb/M0sDPbqAejyBpusKYtqQ0bw4italoK9i7ldE8ptVld2jMVXoGKDRlFHEoK0SPnTHWpSrJmEXWOLiQoCgUd/sAMc/yI1gNElqTRzgypz5Grg0TuBUqsbeUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775577537; c=relaxed/simple;
	bh=TEBmDXZxfoylzayLoImD9f83TDN7UFj5PT/ooCHo/pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXx4yq+5wPadKcmRJCUiQOIrUJTYKpGjGTIXOhuJ4pKRGU3tjdyKVr9O/ewqi8JLvBjnVMnoWv0gEGzQDcFQrmxmG48M7QjYf2wdkz2S+R5IlHmgiKkkwHRj3JqraxNphgVwD0clcTHo9wVKSx6MyizDyPXOiXBNSqUEFj0ODUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/A0GQAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/A0GQAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFADC116C6;
	Tue,  7 Apr 2026 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775577535;
	bh=TEBmDXZxfoylzayLoImD9f83TDN7UFj5PT/ooCHo/pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/A0GQAER99pMshKDfI4+lG7NIrvoLgx5VQKDXq6M9ZrBD6cKJBjrEaP3sw5kLTxw
	 WBmtHfqfzGliltFcQSEF2Gh6MhRCC58UE6Pi8rpsijqVzVriZOICTd7JZ0hTyr+j0n
	 CKU0LbtsQrrbSSQzhotHWtDDqAIkPFGWVhd7BKmxyH/wRdkozoNOSvyOBhhOdqUwLP
	 KqBN+Ax2LVX9gSumBPioB44snz+6aYh+b0gBgY0zlh6eZ3GZBGNMBrVB54/1DHeqsP
	 Ut7WfdZy+4HL88aD1vcO56n+Kde5QMR+JphkFX6rj7PWyksqFbaBHCibP1n+yLG1wx
	 3eauoVfg0o4FA==
Date: Tue, 7 Apr 2026 10:58:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] dt-bindings: display: lt8912b: Drop redundant endpoint
 properties
Message-ID: <177557753204.2632125.5233948727561913335.robh@kernel.org>
References: <20260316134606.57070-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316134606.57070-2-krzysztof.kozlowski@oss.qualcomm.com>


On Mon, 16 Mar 2026 14:46:07 +0100, Krzysztof Kozlowski wrote:
> The "endpoint" node references video-interfaces.yaml schema with
> "unevaluatedProperties: false" which means that all properties from
> referenced schema apply.  Listing some of them with ": true" is simply
> redundant and does not make this code easier to read.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml    | 3 ---
>  1 file changed, 3 deletions(-)
> 

Applied, thanks!

