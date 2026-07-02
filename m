Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4987466B59
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982831; cv=none; b=tkkOXQYZ6KMHg4rx4ELOrU1K6wQ9AAhA6W33ALcTgF7zRGdeaSvKtIaA6nOOpscITac637Fizk0+ROOX8X8JfvFMHII1Y3EVZDldoeFdzqlGOnLdHCjkRAswuEMM//Pcdiwl4eUr7+n0TI21HIhXLWKdCX4FQfCt0HpLob+7txE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982831; c=relaxed/simple;
	bh=Sbsb6lIL/NE/wDWeCdsOaBLRIRMz/GZlFGrm9hCwqo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3PYXDYUWWWzoWoAB0SK35z0f23ehJbvQbjVUVapg3xukJvQmXgyU9ui1hW8hJG8tEcrp5oYgCbY30vMNiCo9onqXmujzoYmvJDbeL9HpVT2Idzggmnhtnl1mdA+vmHNep4jey2tLsvuHlvIcF8ktflyIhoxGMudKCnCKypWS34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3376acy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3376acy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd464d51fso743662f8f.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782982828; x=1783587628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rf72hkVbbdWwb9P5XxaucOhOUznb7Z4SYShC8Uf5GQw=;
        b=G3376acycPTbnZfuDjSk0M8RDLdG6GtVf0oWh5IMQ1o5x+NC2DNFZ12bmVvLqEm62D
         Gw1LlA0oGYpaS6u7oMsKo2Gc7ujs4Amy5cYtqeHaZx1/e2rtu0rCgolhKi99kEpfni6b
         n5CQKozzL1tojzagABFdiis0ipxWUiY1mPhbU2KyjmPxX4mTVCNkWfjQpq2rfrACVULs
         auc/L2kTN9/11tKXz+htW+am71Y/ovj2dKp2xbIlmjz53/Byl9XTCxUxJYt73aD0kYfd
         wU0+HVZHI54zsCPaumHoNGYGOPEanaRp8kWKKFHXBD6XU8WNvYgJEKms2ZEt/de7sjK0
         uAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782982828; x=1783587628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf72hkVbbdWwb9P5XxaucOhOUznb7Z4SYShC8Uf5GQw=;
        b=FQ5LgB5VSWU5KpgO6KTR+d/7j9L0pFKDqia2QDb0a2fPYdX1FdjxWV2hpsKXWSuqHp
         QjdZuKhuPqpwFWj2rKDsSC/fTukWHkyMCIdPqusvhckLtpbASf0vooKFYzBiwZpc1I9a
         vDsnL2CddvIbh2l5mrLLirMoPth3wqVU48RTQkFuFj/HUliJ16PPUW/ZB9fGIDb2/tXk
         CVAQ6TtcaJVF9+RVA+IrBljXQTqqcb6W3MdPY+XuYT8hbi21yhHhRsrAiW3SgF196m5Q
         rTcFowWhiiSSdPxNrklrCfBPBrOvnZnTKzjEFbVlLLd8E2c2KvWrUuPyyzjP2qF1OMWX
         06Fg==
X-Forwarded-Encrypted: i=1; AHgh+RrI3DpP/OWoLImaSuDpvmCDVEvAYneBRmk7aP/qmjWr8HmA281/bL8AvuR5eyVu7MiSEobnejzYP5Dq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ZYqgerhbzezyVnbpMKeyt06u9FRZWIS1qZlpYVhh9wKPLSm9
	s1bsZvNrvfD9SrwBuGlkng+LIJtGUDJgXw30+GbOXluBqtPhi9WnW11KqW5ddg9o
X-Gm-Gg: AfdE7cka9+XIcczZXFJ0YsR0C15jsPbzIWBDlhtXZ8W2o9e/nOy4dM1ZWKoHI3e7/8g
	c06uHHS3jOK66w2jmgXikZzoqOaR95uRbAKRjrvX9cl4PLtHq0DhdHE/cbPfrdLMLHeH96ilzD+
	ylr3dXYuou8yvNQzqo1Pcxjia0EgAuCJlQg79rCP3x6lVYhPoK5X+4AZdw7jjNjH0K5G/ACRnKb
	pu8aK1EChJf6TI3EXQbMNDP/qzlFHXjW7BTPsuvwyb1WAPXpCovvEj5seFno0vOLXj2EM3+p4sE
	yp9lCO5Ux0sEP1F/yJofZALLC01gBu02l8VuBEW8CrynV8rg6cFUbQdIHRA8/JiGm4yMqvKAse2
	A33vpbIghI6vwVwmymDD7yA6nH6MhWYBMTGkUYwNAiFKJ2akgNT2LQ5LWEO6y+NgOx1k0hWTUdr
	CIO3mC9zKRVHU/j21i65cgBLxWc1WILCvyfN9u7y6mCgLpjaV0gl7rLEXnAvKuNWXhSedac2cTH
	6GUQFhaBCuezRFqXJRYHcn1aGc=
X-Received: by 2002:a05:6000:2087:b0:475:f100:360c with SMTP id ffacd0b85a97d-4775a6d52d5mr8157295f8f.59.1782982827830;
        Thu, 02 Jul 2026 02:00:27 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd46asm6934267f8f.36.2026.07.02.02.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:00:26 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:00:24 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Andrew LaMarche <andrewjlamarche@gmail.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH] dt-bindings: wireless: ath12k: allow calibration variant
 for WCN7850
Message-ID: <zglhxxu6txw2xvz4vcyu32v6722hqppcfvntan5ho32ak2y6tw@2mvfuaoxcvss>
References: <20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com>
 <20260702-beneficial-hopeful-binturong-a0bee9@quoll>
 <a0cb02e3-0566-4294-b41c-3b156ecda5e0@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0cb02e3-0566-4294-b41c-3b156ecda5e0@kernel.org>

On Thu, Jul 02, 2026 at 10:29:51AM +0200, Krzysztof Kozlowski wrote:
> On 02/07/2026 10:27, Krzysztof Kozlowski wrote:
> > On Wed, Jul 01, 2026 at 05:42:24PM +0200, Ernest Van Hoecke wrote:
> >> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >>
> >> qcom,calibration-variant selects board-specific calibration data for
> >> systems where the bus and device IDs are not unique.
> >>
> >> This is not specific to WSI-capable QCN9274 devices. The WSI binding
> >> already allows the property, so allow it in the WCN7850 PCI binding too.
> > 
> > Why? You need to provide reasons WHY do we want this.
> > 

We (Toradex) have SoMs with the SX-PCEBE from Silex, which uses the
WCN7850. Silex provided multiple board files for this to deal with
separate regulatory regions. Thus, we need a mechanism to select which
one to use even though the PCI ID and machines are the same.

> >>
> >> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > 
> > Where is any user of this?
> > 
> 
> Actually I missed your link in changelog section. I still however do not
> understand why these are separate. Separate means they are completely
> independent and thus my question about the user stays.
> 
> Best regards,
> Krzysztof

I agree that they could be one patchset and considered replying there,
but felt it easier to discuss this with the relevant patch already
attached. As the other binding already validates this property there is
no real dependency or ordering problem, and I thought this would ease
review.

Kind regards,
Ernest
