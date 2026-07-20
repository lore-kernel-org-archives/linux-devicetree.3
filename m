Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F533B42F1;
	Mon, 20 Jul 2026 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580719; cv=none; b=dL84tB9OnsnGLimsnn5aUGLypjg3DNhpNak5KImAGHf4IRs4hSuyRVC+/y5V2adY4FJoDwyfiS9KxcNiEzVDbXfiakY+EZNu125eVSLlPh3scNRO5gYmqoZwdJXRQuxnbzj8MVEqtXxLTwDv/FX1j5rIX3Y/e2CRYbAruiwe7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580719; c=relaxed/simple;
	bh=YVAjCPfW1HADsghSNv3o3dR4lXdS8ywl5qsLH5Qud/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVrOnAYKS0pmZ++VsYRHo6tbjR1iHZFNNbaw9TN/3dG/8ZYRSb3MBGAtxQKRY3ctBwilkxbxkuMj09KpQgGSWJy6qjso62l9dhh/qLmndBb2LXsn09xNiqg915sXenIicl/9CMdNjvwMzUjeCVPSX5xA7UFg9LFg2EjltSumikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej2cpRqN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej2cpRqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D021F000E9;
	Mon, 20 Jul 2026 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784580718;
	bh=2yJg51weIT28CMlw/ZYFklOUGBPvR+gUCZYGtpceot0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ej2cpRqNDgAQTUwlnK77zrEovh0WgNFunxcVxDImvCFml8eHrI/BbkxHWcMWLQGRT
	 IGbf4okNcnMQPgFxqBxzEgnxjytDSutET/v1P2cNJD19Er5M++xFUkEY/gKhn95D99
	 iHsxMvP/pQOe1gEEqhU2WvUE8P3Dc+Fz7eJTyBepLKfEyFfTL2j/6mQCSTmjLAlt/E
	 R4W0Oac5gpjUMvTNknispzB/iOcdh0Ok2vfrswy2CQZ4+lAPS0wjLHTH9EmLCy6dKg
	 VXjfzJrVV1EUQjJ+yT4470sOc+9HlNTonmZk+YUFFALXQeWxrdv/ZKfz3wyiS9xADy
	 Nxye/L078z17g==
Date: Mon, 20 Jul 2026 15:51:57 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v5 0/7] dtc: dt-check-style: Improvement after using on
 DTS
Message-ID: <20260720205157.GA4052473-robh@kernel.org>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>

On Thu, Jul 09, 2026 at 07:41:28PM +0200, Krzysztof Kozlowski wrote:
> Changes in v5:
> 1. Patch #2, dtc: dt-check-style: Allow space-aligning indentation in
>    DTS:
>    Handle also line continuations for properties.
> 2. Update docs, other minor style/docs comments from Sashiko
> - Link to v4: https://patch.msgid.link/20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com
> 
> Changes in v4:
> 1. Drop patch:
>    "dtc: dt-check-style: Do not sort top-level nodes in DTS by unit address"
>    This needs more work.
> 2. Patch #1: Rename rule tab-in-dts to tab-in-yaml
> 3. Drop "memory@a0000000" in examples, because it messes with top-level
>    sorting.  Use a "cpus" node to test node and device_type property ordering.
> 4. Add more test-cases: within existing commits and a new patch at the
>    end:
>    "dtc: dt-check-style: Add more DTS test cases"
> 5. Handle #include and /include/ without trailing space
> 
> Link to v3: https://patch.msgid.link/20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com
> 
> Changes in v3:
> 1. Patch #2: Use re.search
> 2. Patch #2: Add dts-mixed-indent.dts test case
> 3. Several new patches 3-7.
> v2: https://lore.kernel.org/r/20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com/
> 
> Changes in v2:
> 1. Patch #2: Rework idea.
> 2. Adjust function doc/comment.
> v1: https://lore.kernel.org/r/20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> (I was not using b4 for v1 and v2, so b4 diff might fail)
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (7):
>       dtc: dt-check-style: Narrow disallowing of tab in DTS only to YAML
>       dtc: dt-check-style: Allow space-aligning indentation in DTS
>       dtc: dt-check-style: Rework handling YAML/DTS in rules
>       dtc: dt-check-style: Expect first device_type
>       dtc: dt-check-style: Handle properly DTC-style includes
>       dtc: dt-check-style: Print proper line number of indentation detection place
>       dtc: dt-check-style: Add more DTS test cases

Applied. Send a follow-up if the sashiko report is valid.

Rob
