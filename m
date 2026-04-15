Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2CF33B6DA;
	Wed, 15 Apr 2026 22:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290808; cv=none; b=BXtAXUGZJagcSbkfuMRXpmUkDjJJnQiVJI0QuWJJR6xsAfSHJ+uQ2eLApZdqz6I1GVzM0OwVDocA5cMhHBjfJMfSMH4p6G4Yh29qY5FA9QCE3925ShbmGx6UbxJ7CcJdJvyfDTPRksCBCD/IjH72HsaJN/qWPeG43cmrwl0hBfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290808; c=relaxed/simple;
	bh=E29+qDjLXYSv2tlZvykhXipH12XKtY5vHl+plbfdKHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h19S4xhWNzXzF6AnVTOdSseBY+QEmlF+rs7HYOEtX5po/tqRFOcFBPaUEIN6L5pfMFgF6ZVpy2QQWrOrkOq+UKJhedNEpcoYFQ3ZcKzRRQFt2bL5UhqmCXRxRtOQl8xkqfOe5UajDv82Q8U6YpfWgTOsOiixVh7VGkYCa8s/enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpmGlyK/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpmGlyK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20331C2BCB3;
	Wed, 15 Apr 2026 22:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290808;
	bh=E29+qDjLXYSv2tlZvykhXipH12XKtY5vHl+plbfdKHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WpmGlyK/TuEyr822LwhsXgWTFR45X6kwcud48WTu9z+FXbtJ9CfXcZ62kA5PurYff
	 du04F5ly7hVZm66N8xxBqthn0rAocT0a3HtXmysVoOkabBj70RGVwuesMwcMV3qGk8
	 GrOnMrp2/Hl1TpXDajHimc7/E/IcZZ08Gg6EO4epLc6296OFXQSXczZB3pdw+hNwOn
	 6aYvatXjdTp4qWn7qCRszGX4yKrA2R1bxWrrZYZA5kp15NhjcngfujN0g9ItJFbWNp
	 T4oukAJEMK5E3kaejQYUqF8BzUk7jEwQg8hCm9HlFFyp+KyemCbxQGL8hpbeskwVLt
	 Y9aoLcEGe9JjQ==
Date: Wed, 15 Apr 2026 17:06:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, freedreno@lists.freedesktop.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>, devicetree@vger.kernel.org,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 5/8] dt-bindings: display/msm: qcom,eliza-mdss:
 Correct DPU and DP ranges in example
Message-ID: <177629080563.748248.16989025333635985971.robh@kernel.org>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-5-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-5-34f4024c65dc@oss.qualcomm.com>


On Sun, 05 Apr 2026 16:34:01 +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long.  DisplayPort block has few too short
> ranges and misses four more address spaces.  Similarly first part of DSI
> space should be 0x300 long.
> 
> No practical impact, except when existing code is being re-used in new
> contributions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,eliza-mdss.yaml        | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

