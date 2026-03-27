Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0715331A6E
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625749; cv=none; b=HnV7XWOPYs7jrC4OhKQCqWYkAcVX641JrsGq0IsfUphqHh72Jvfz6zVpW91taoLkBKgv1Tg6hhR46/LZovzFBj5r+qP3VhofzZppE/O8KdX95yzbWVxw0D9iLorK6Nf3NQkq6gkJd6vNNsJYCpZYmQI5yM4IX4MHJEUtANwwGq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625749; c=relaxed/simple;
	bh=cBecj4/BHUgpx2Akznttb6F22ju7+BUQg+K5+fkSw+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJJbv9zxcKyyw5pJvnj/Ajo7/KsZUtFecA4eVD7w8xxH9kB1XcUhvcjXT4UdgI7at4pe7fLXD/rAHcb2ZSfludTfMOfs0tj3kyCNE7lb9mfvdzH4Q8iQjEBjbZ3lXbi7DUzAaDFeV/taP4Y+Hat+bq7vPGmL+EEgzu8S38Z6PZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tinyisr.com; spf=pass smtp.mailfrom=tinyisr.com; dkim=pass (2048-bit key) header.d=tinyisr.com header.i=@tinyisr.com header.b=AM/Nv6Ol; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=o+ovQMcj; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tinyisr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tinyisr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tinyisr.com header.i=@tinyisr.com header.b="AM/Nv6Ol";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="o+ovQMcj"
DKIM-Signature: a=rsa-sha256; b=AM/Nv6Ol2T95fudLP+syTRCGn+Yaw5HZu2X8qBuTydDK2yHmFpGRo/JhiTmfjppyjcVKb8B9X86YKznSip+ylxjzUjqapirOlQPXSdlfgCQq23CFeP3hYRHIuiomEXx8Hc25defyvS4WGCLJuj4I8gPOwv4ghiGKII4gfT/0YKGkuxLE5EcYxIcbkf0WbbzEQcjtnajqcpoa4QPxx0u4zvayAYtcEpugtv8+9rMQWtcoMD9NESm2ggUl2R8zbVC7rxRIgbCe+mXcyblyM47sd8mPU/Y4PHwnjwDMLA0k/QTXXSlAEKmM8ipf34pOmgJjaEyoBPwUpeLsaQdPSWNlVw==; s=purelymail1; d=tinyisr.com; v=1; bh=cBecj4/BHUgpx2Akznttb6F22ju7+BUQg+K5+fkSw+I=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=o+ovQMcjc8yWn1enLEUls6VusOHGrS5ndPoQaEBA9lPdJ9spFmXfm9fGehuKqMjQ0B9E6vnWDFjpmeyEvVVon0Xq5xnUARnL3uheQhxWuYeJLB39Grfk7S2sdRXljPiGIVvO3Vjypab05C3lsKHrx4aUujqdQQSeCvZpvs/ZIIXXfCVWlOhKQBZeccp1etUMOKAYrhx+klJ6472yGRigB6fc6SK8fIdUTSgJ/x0oMO+wEJlNnsUmA+472Ko6AJNx1U4uzodod1P3z6Y+8QGWeTABKf41BblAOamcsUmCIeOxifGjL0xPOwIbfZ9L59api5KEEp8jqo9D5zaG3FgZSw==; s=purelymail1; d=purelymail.com; v=1; bh=cBecj4/BHUgpx2Akznttb6F22ju7+BUQg+K5+fkSw+I=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 99681:12517:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1686820232;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 27 Mar 2026 15:35:25 +0000 (UTC)
Date: Fri, 27 Mar 2026 17:35:15 +0200
From: Joris Vaisvila <joey@tinyisr.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com, 
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net, olteanv@gmail.com, 
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: dsa: add MT7628 ESW
Message-ID: <acaijjDU7cgOUWmU@archlinux>
References: <20260326204413.3317584-1-joey@tinyisr.com>
 <20260326204413.3317584-2-joey@tinyisr.com>
 <acW9G8vrMz89Enss@makrotopia.org>
 <acYZOEksxcc-uHcT@archlinux>
 <acZqvZfYXR_4sMlT@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acZqvZfYXR_4sMlT@makrotopia.org>

On Fri, Mar 27, 2026 at 11:32:13AM +0000, Daniel Golle wrote:
> > [...]
> > On the hardware I'm testing on, it works fine with the port set to
> > "internal" or "rgmii". Would it make more sense to set "internal" then? 
> 
> "internal" then. It's a single-die SoC, the switch sharing the same
> memory space, clocking domain, ... with all the rest of the SoC makes
> it very unlikely that RGMII would be used as an on-die connection
> type. (unlike eg. MT7621 or MT7623A which are using multiple dies in
> the same package, and actually RGMII or TRGMII to connect the
> MDIO-managed switch part to the main SoC, see "MCM" / "multi-chip
> module" in the mt7530 driver...)

Makes sense, will change CPU port to internal in v2. 

Thanks,
Joris
