Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064E39E9C8
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789306338; cv=none; b=VgWX6vP6WCA+UD5DeDY2H6+hyJwm+6ReSZWXmWLIh/+iBPM0muD18tBO2QeUF4ZGL0WnoQF08SEhHGMsj5SAyEzbcSZ615VZWNuy1z8Czhg8TK3ZrjcroyxzZ1/iIwgmLNBxOcqe2ksIzod4IfzUOKLnNEOQiryTsDZhmH+HIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789306338; c=relaxed/simple;
	bh=tacF+0/UgVgf1ZF2kBFCF17soFgwFERlvzcI1lOcP4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3HxhbBRpy79Eb9SPjl+m8kSWO/qcjbFkIteGZpVofoX3QP54fMiMSz/GwuqhMmafQNGDc7xQfrm/Om0dxsAYv3K4U0kvYU56VCfTfnOfqQYu/tRZW9frW2CpTI8hMj8fXTAALR0Tr+A9Fr7b+QhJqYOajaNynPK4eHiqfLeahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=RfJqYLFk; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="RfJqYLFk"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso225486266b.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789306335; x=1789911135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VWrnyKIL/nI3FCiUVdAFpShSwUN32IQc4eQdP+H1XA0=;
        b=RfJqYLFkf8SlvZ96xG8i9WqC13j8EKnF90tzaYo/pjf7wCsczu8/q5nJC4qlMgChGw
         97xIX25acdQM3Wb72varKNKwt7iVGfsspGXrdjMorSCeXkbTO1sgZs1G6BHqmgouNzba
         eDr7fitugbYs/JJJmYCbfJIT9nQ3+HY+41v14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789306335; x=1789911135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWrnyKIL/nI3FCiUVdAFpShSwUN32IQc4eQdP+H1XA0=;
        b=g8jJxAWLakcdE6Ythd7Vx9OEhhdmsgaqc76IU3Y69kfTF9EvxrGdM+2Ov8b0qcUtVz
         CSecKrQXY2Cbyi9JKujdB3lcFIVsP8E7ttaZ25Siyc9DzXm5Ey+6G99vIco0nup1X9BY
         /EK5Wg9iW5jnzqa0kXAZ0ow1NiSgcPBQ3LQHqcBTnvEi3MwSx0/eJ7O8o/L0C/buA82T
         7Do0bx5OuJYDAE9VLXQut3i9umEUgxektB5wpJVz2XHUN0NlBJg5PU31tMk8N1JkmdIK
         DsMUNolemx17o0wwwMnHtVigRYc+hl4cHOo+4L+OXqkdqqiVQh/3j9IvlDba3qgLTnLn
         F6Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwEKb2R9gOC/Sw6v+fgPMjF2PM+KQQMSDBCM7TW02leWOd2R9zvwuDJFcU9tjXPEkcILFGDt0DnKfay@vger.kernel.org
X-Gm-Message-State: AFuF++nTrx6tAGMSmY038YAGmTnkZoxH0H7ScJd/j5JI/D/o86rJK15t
	PoJALDcRV3qy0j2sUtEQg0+Xke4m7Djz/K7SJmBfF//XO7qpU/yROyVEilw3TI1nesq10/MLrYK
	+R39s
X-Gm-Gg: AYBFou1psUHlAvUhHRB1fHGmX2GmEufLdozxhlxFo7F8dmF7IhP5vu2e7s8KuiDfCJw
	tb9SlMWNXjnAY7s+EEtWZNBYbofkoE38NT1uJ0PGnenaB5bGx0Mns3GxY3QYwxcABb7X67KhPdg
	9ATr7VJ4oTPFqUVHW85DNHoDhqdb8i/+hdS3H/VS/mtgutEkOwbKI7H9tVYcYWU3IlN1egQ7sFL
	Ys26aqUPvHHvuo8g2N7WhopMAKQmNyoWp6aDl75suvDP6R7IG/CzydgbR3HcV5l785MECDjNSLH
	U7yb2b7vFK+zJfAzj5k6mWhM8SiC2RqJBf7j4/gCEcN/983yonnOk+BVkxlB2/YrWvmsT7x31z2
	aTVJ3nwyUUnSmLayPzeSz0I2G2iWOSsqZCu/HdUiS0cgvriScVtY5PTkGeBK55II4Fnm5yyoK0/
	4tleikBwMOlgGsp29arwg5YvxLEe2ljlJhojQsXu3zyrK0J5pqOE3A1783lPUkWVqpoF9xkWlvm
	kZGKOM=
X-Received: by 2002:a17:907:724d:b0:c25:5114:c832 with SMTP id a640c23a62f3a-c29665acdeemr1293801966b.3.1789306335536;
        Sun, 13 Sep 2026 06:32:15 -0700 (PDT)
Received: from cabron.k.g ([95.111.117.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm296633166b.1.2026.09.13.06.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:32:15 -0700 (PDT)
Date: Sun, 13 Sep 2026 16:32:14 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260913133214.GF20345@cabron.k.g>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
 <20260911150755.2803736-3-petko.manolov@konsulko.com>
 <20260913-perky-resolute-badger-6c5e96@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913-perky-resolute-badger-6c5e96@quoll>

On 26-09-13 11:18:16, Krzysztof Kozlowski wrote:
> On Fri, Sep 11, 2026 at 06:07:53PM +0300, Petko Manolov wrote:
> > Add DT compatible string for Draeger's M48 CPU Module, an i.MX6
> > based board.
> 
> Sashiko comment is valid.

Sashiko doesn't know that this is indeed an i.MX6q board with the Altera FPGA as
a separate module, that is secondary to the NXP SoC.

What do you want me to put in the commit message so that everyone is happy?


		Petko
