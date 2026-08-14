Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEC63ABD80;
	Fri, 14 Aug 2026 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786736467; cv=none; b=TBZpj4uPs/iIu0GPZ2MdNj12FxVc8bI3Q32r08PZRK9AGyl/+AhIkP+zlGWaPiVSC/sLPk77SjIxlXtEmsn1ih6Lsk1atkCck1iGIUDGB9lA97ArsDt3OAEKszeehjQf29gxOEVIkOCTlJ0J0ApFGdkC5PSfwmw9Oumu7aocGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786736467; c=relaxed/simple;
	bh=poVPrv3IJ/Xn0LMp6l6qd6Rk2/wmUjvYqAOKW7jFJgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDP7/F/ddJNyFWCUnPAixtg0IqrdkxmbG2qOJYwPPSr/x6kqglhBKWDMLCDj7Pj8sE78tz8emfsEzWIjSjxaCZw/hYz65wpW4Xy42jqU3Za2TR1wDHHSAsUqI90+B5nOUzKAlRizFW11WIu9+uuPHCxkY3DY6nKUaCALxKGiZMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1XjQSnT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1XjQSnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D464D1F00A3A;
	Fri, 14 Aug 2026 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786736464;
	bh=gTHmfaWn3CCgu/52GfWQJ43totEmAML71CI/VlsYVMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c1XjQSnTmILqrzoL3VyJW+gpspBjt91hM5Gj7vaN5gHgMx8M2xWC567ehIGik0G38
	 TV42yFmy4wwq7hc7LY82RW5JyM0y05uuV2VG+f/DT3yUgHjfbre53bVJrRPyHb/sXT
	 YIku/V0W8Mj1yslIG7YQCt/8u0S33i42tq/f9FrB52l/PUTkIeZBtnynGRl7nhg+x6
	 heWVNT/KHaTBuNfQcRNEdkJxFzTtWHCAVD/S94TXqhdOSrt3QzmNqUquHVl7COfPn6
	 uSuk0QEjEDsDWJnrQPSPPVRdllzjCTOUDX4wU7afviBrLtk1y4/r+p72KADLndtPHn
	 xzXDJu8vFPaHQ==
Date: Fri, 14 Aug 2026 14:41:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: devicetree@vger.kernel.org, m-chawdhry@ti.com, daniel.baluta@nxp.com,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, goledhruva@gmail.com,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, simona.toaca@nxp.com
Subject: Re: [PATCH v2] dt-bindings: mailbox: Convert TI Message Manager to
 DT schema
Message-ID: <178673646259.2775876.2531556953131129921.robh@kernel.org>
References: <20260812095153.1060237-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812095153.1060237-1-egbostina@gmail.com>


On Wed, 12 Aug 2026 09:51:53 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments Message Manager binding
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
> Changes in v2:
> - Renamed the file to ti,k2g-message-manager.yaml to match the
>   compatible.
> - Dropped the 'minItems' from 'reg' and 'interrupts'.
> 
> Link to v1: https://lore.kernel.org/all/20260811091847.686229-1-egbostina@gmail.com/
> 
>  .../mailbox/ti,k2g-message-manager.yaml       | 67 +++++++++++++++++++
>  .../bindings/mailbox/ti,message-manager.txt   | 50 --------------
>  2 files changed, 67 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/ti,k2g-message-manager.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

