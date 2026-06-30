Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915E477E2B;
	Tue, 30 Jun 2026 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836392; cv=none; b=nnnx43bbo9rbaoJvIFPf2PnvDKhwIs7KRJrKevUkaPF7WufWAZYTt7yxbVBlQvd4oCN1tensGauVqb3E1K0kTXQGJZj9FCBp+oCbBa26RuvX4zNumetJuQ+FlWcs5CGMXY5z4CENHQrGg7xiKr1dH8KStsCadqNf1Za7Rr71ZrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836392; c=relaxed/simple;
	bh=ZhG0+t3u68UUlDYIxyFKLXlma8CFzZuuNvrORCf1RNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT8dtshsqAAF2LwnrdVIRkraGq6iVIDllic2lr1cEJMQSEGKW2djjDxs/fDi4dAb4rm7+Iny3paiAT49pnRqVK/tVYRGXlo0NttJgiovrse5sivZEICmzdoyKZWMTs+V5N0Tp3j8ocDrG70EGH1GmnNmhcofvkGcRwrkkxI7wMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJt/97sT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJt/97sT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F2F1F000E9;
	Tue, 30 Jun 2026 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836390;
	bh=omT3sztJxXgc1myUj3jR2I68Hcn3vATp8SCJ4OAByRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EJt/97sTbGnzoDbc8gn3XJcEx1V4fSl/3qawgutaqszC6x6hPw+DMFZEFGK9ZGei5
	 NkE6E221kWA3RpostmgwCUv++C8Mzy4G9gpR97xggXe6ZDXBbPH7AOEbLOx7VjG5wU
	 lJ4O2I+tlw84iyESBbP73Bx/PXCvccExY9v4+ghjBPAp7nu1FlEfdb1UfXDuY/rgbH
	 NKqyvvzKPo/av58HwMSO2obnbN6/pGOx/1Vul4WcybT/fRRqz6qOpi/6z4vkFZRmnd
	 9FBNf5HfGHsWtWqOKCSHcVxDu6VNuMYk1LM3VMoAx8sT9RYW8ggiJiEFZ/uV4vD+C3
	 QtlGFzc8Hi/Mw==
Date: Tue, 30 Jun 2026 11:19:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
	Guru Das Srinagesh <linux@gurudas.dev>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH v4 01/19] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <178283638865.3843708.10270414669600515331.robh@kernel.org>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624190830.3131112-2-mukesh.ojha@oss.qualcomm.com>


On Thu, 25 Jun 2026 00:38:12 +0530, Mukesh Ojha wrote:
> On Qualcomm SoCs that support minidump, a word in always-on SRAM
> is shared between the Operating System(HLOS) and boot firmware.
> OS is expected to select the minidump download destination
> either USB upload to a host PC or save to on-device storage.
> Boot firmware will reads this word before DDR is initialized
> on the warm reset following a crash to decide where to deliver
> the minidump.
> 
> Add a 'sram' property to the SCM binding to allow the OS to
> identify this SRAM region via a phandle.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

