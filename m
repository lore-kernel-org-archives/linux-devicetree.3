Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686CB45FFAA;
	Fri, 21 Aug 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302959; cv=none; b=EJgnKaigwVDw7RKdWdwfYOR7tLpG+mU0TdftiDPo2tlcUxijY/PSXHFrQrHLD0ZKFZ1rZF+wApxkJSlZ7hW/uh4CSxc0nP+MvsoRIUuqjmvQCZ6mha2CN/cNjCtbUoWkd37ovakWQLHjdBosq8RG6s9RJ3PQ6pr4WM/XecjR2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302959; c=relaxed/simple;
	bh=uKDLFlr3nucpLxUZNWN/RD6C1s+iINj2iN8wtFoAs1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmxtAK7j4FYqTHQ3WiFikZFAdqBlpbi4WsYN6rM0PrHqwE59JtzjK7F9H6NrR0yrvNBTSjXY1E0YmlKJIczsWu65dekoJ8Bbmx1U8xObdmj0OIZSqzasvzzCsAb0/s9KGD85HgHGWBT0fc7GOrpmiov7Fjdyi58O4b7ZhTrTMSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oXr4qGsX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oXr4qGsX"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4397C18E1;
	Fri, 21 Aug 2026 11:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787302864;
	bh=uKDLFlr3nucpLxUZNWN/RD6C1s+iINj2iN8wtFoAs1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oXr4qGsX5uiODZG98QRfsZinvhkoNPDZQnX2OTJquyfWAjJPER36xrLPKLDRhJIMc
	 /qGKfL9NCObRge4wDwVWRg2RysfKLsmnOnnGcDZ5JPhxmRbRhKXJwCIBDuKgW8GizW
	 GF0bbj0SrluX4/ohNcw/0HQxsduaVCO2HoMPfbek=
Message-ID: <5727ba42-4469-4a12-ab70-9f85089dc6c1@ideasonboard.com>
Date: Fri, 21 Aug 2026 12:02:22 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add DSS support for AM62L SoC
To: Swamil Jain <s-jain1@ti.com>, nm@ti.com, vigneshr@ti.com,
 kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devarsht@ti.com, praneeth@ti.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811130822.2324438-1-s-jain1@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20260811130822.2324438-1-s-jain1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/08/2026 16:08, Swamil Jain wrote:
> This series:
> - Adds base support to enable Display on TI AM62L[1] SoCs
> - Adds base support for DSI output
> - Enbales HDMI output out-of-box
> 
> [1]: https://www.ti.com/product/AM62L
Do we really need bootph-all? In any case:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

