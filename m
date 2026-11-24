Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504488;
	b=Ygebs1ZO32pSEaamcDVMkhRs+MgQTUyqM5lh7rbfC/Ym8IxGYehWN+ycI3V/dJ6kS3+z
	 8KUZLV7rSjqBL51oC+TyuXo5K6F0Y3f7nDTRTXdEmB9x9U/iRCy9PjvEzSmN4B/Gi6qjj
	 YGjlSVnlSNQyqj1t8rQO7H3RtS8KVadXbKUfoDu2g6eGIPt7Yd90Gg2HrTmQWIAu9EXTV
	 /iyZLApmKhLNFF8M7PQe4I+q8jXeuEUnYP8MzCfldRVNEo8ckgyr58SuP8dOXhQ1q1eHX
	 wTBC8dKrp8nn0mX4UL5swsTcRhCDcpULiRYTyYDb/cKN7bXFMizLqp4urBdddq+deXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504488;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CqEAR08nQp8aIEuUnI1o4jRsfl5ovOtX/gNUZQpYW3U=;
	b=E3+9zmn2zELNaEx9CW+bgp9BIpPGv7abOBDTdmv+21ZqWt/HrRLqvPVMBm/LK9T7XVjv
	 NnJziXZXjZMqoXLZHdueh7b6q9ZNKQn1tg54LWeW6i4c0qqLTcEk+R3rJVxAbkHbVvXDW
	 aMkaP/ZbdD9ooau5IyxCDxihQ+0E6AXDcjfmT98zcughcaiIusvo83Rf+y1Cg9rtKdNrh
	 hjk4TM5NqB9sDhpEBucf8oJsFNHA6cynZiUwXhA9T29NXBCNrEJzSorJ8xpyh2l3WXqHF
	 RYVSKyYTsS7gZ4dz58J0opJuH0Xf34BUG6ft2Cp5bqxr51P8RdrXfwXthG9G+k3L4SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lkvp2TwY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EC3606A31E;
	Tue, 24 Nov 2026 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lkvp2TwY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A371F1F000CF;
	Tue, 24 Nov 2026 07:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795504487;
	bh=CqEAR08nQp8aIEuUnI1o4jRsfl5ovOtX/gNUZQpYW3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lkvp2TwYzfe6wOvlTbzBwK+7PZRJ4qiBWlVGtyfMMMeDzk5dCNrNSHUdWeG7TF7Tm
	 1FWfWV9I8AzVJJ1NWpxz4NivFiBmmO5E4kK//1bmUa4eXRHAnozLU601xm+pE+qLGE
	 IcSGtAflSQ7gtMaLjKLkE5JvPSZ/YrAVzKB4zuJ8=
Date: Tue, 24 Nov 2026 08:14:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Thinh.Nguyen@synopsys.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/3] usb: dwc3: support two connectors sharing one HS
 data bus
Message-ID: <2026112405-sniff-untying-8990@gregkh>
References: <20261124015002.1426767-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124015002.1426767-1-xiaqinghuan@mail.ustc.edu.cn>

On Tue, Nov 24, 2026 at 09:49:59AM +0800, Qianhui Xu wrote:
> Two USB Type-C receptacles can share one High Speed D+/D- pair if a
> multiplexer selects which of them drives the controller.  This series
> describes that in the DWC3 binding, adds the endpoint-scoped role-switch
> lookup the connectors need, and drives the shared data path from the DWC3
> mode worker through the mux controller API.
> 
> No runtime testing is claimed for this version: the mux path has not been
> exercised on hardware.  The series was reviewed statically and through the
> gates listed below.

Please test on real hardware before resending, AND also cc: the proper
mailing lists (you forgot the usb list).

thanks,

greg k-h
