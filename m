Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D80447F2FA;
	Wed, 13 May 2026 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694691; cv=none; b=LlB5VqE3EG3QlN4UuizNhaaR7ojSftx936k6nyFv5Bw8PJAlN9Qxp33PDi5wEg2fQk2+JyGrmkHxckkUPtOyDHwV8mxARqY5PSy1VDdPjCxADejNWsr4Up1ThhWtzBojXl2pAx79ORR5Edxf9aLy0rHLJAb+0A7VH9ZOxudQqfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694691; c=relaxed/simple;
	bh=hawRxga1ZfB/pOEXilryIKgeZrVTpKoxR5U2nlRiIA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHX5al1Idou34BNIn9aneAT2cPwOSzC/mkyKd7Vrwe90Npb87guQr5r8SlGtHl8IoLDYcXw0j+94HAjZLgE9+H9fcbv8Mlu7pvpnJ+gPmRkTqkErfXmOAhXhCUyE2L1L/2FEKuG5l0M8igtLsk6qSSsfsFUQbZcrGnVBqkrjzeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Gf2aHnEJ; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Gf2aHnEJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C499E115A05;
	Wed, 13 May 2026 19:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778694686;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3LXTTwyb/4IPwWWf7g8WjGMlPAqWhO3kCdoylPgOg38=;
	b=Gf2aHnEJ0B3SocHB1n5bPTGPtLv8OuBVC7J5y1iA+Opz9x5/m2JeZyKs+Y5CdMlLm0bb7A
	WT9DcGsVMy++QrL49aHyYBHXx+8JNtdhAAIGbqcAvk2qFe5CBFvYcqWXy0AOeUFsYcRKck
	Yn0Vv0yMdK7RdntS/Joh8BOYBP4G4gQIb5N70sclPUCfLcyxAq7+UXAYdFPkT9UbG8HgZ4
	FOp/dOdC6miY+MMKYSj7OgrDzmlDM/RIFC6rvJqIbIgYD9k8xZ/7C3XzEnRbasn55BcVP7
	FfEmq2rN0LiRGJWiwQN3ZYQO2SswIOij+7xD7kamapHI5fRxlK6XxITVNL+iZA==
Message-ID: <271d1839-e372-4f5b-84bc-29fe30b928a8@nabladev.com>
Date: Wed, 13 May 2026 15:41:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display/bridge: lt9211: Add
 drive-strength-microamp property
To: Boerge Struempfel <bstruempfel@data-modul.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260513133127.376458-1-bstruempfel@data-modul.com>
 <20260513133127.376458-2-bstruempfel@data-modul.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260513133127.376458-2-bstruempfel@data-modul.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 5/13/26 3:31 PM, Boerge Struempfel wrote:
> Add the 'drive-strength-microamp' property to allow board DTs to
> configure the LT9211 LVDS TX output driver current. Sixteen discrete
> levels are supported, ranging from 12 uA to 36 uA. Defaults to 25 uA.
> 
> Signed-off-by: Boerge Struempfel <bstruempfel@data-modul.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
AB goes before SoB line.
