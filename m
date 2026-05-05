Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E5736829D
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991559; cv=none; b=ZfE+3QtVsd78bvtGedi4x4eBpgAsp8zh32ud0J3p3Bx3ljBXe9Fy6UT6TQ4gFTSnE48C3e3v0swEaTt2AV12nQuUCdzOOe8fFCyiz/Qd7Ih0cZceHQcJrTEYvtvzJAlLJkQTjNdJo94vVfNg4oUvm5uky+u9TtPPlZc33qqGoe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991559; c=relaxed/simple;
	bh=FDHbGuhskbBYK9B3ZIhL8JMcMmvyjfLkUA3LYinKnrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swkXqrvKXPdtIFr12lBScKPC7dkZTEXKKZoycchkkShFtyGRcb4WmiFvt0vcDGbktQkTjpaJWsQNr/WQb6XAKL84+hQ0zV6Ul5JTPY06c1HA1O8+dIrENVHZOqUD2kQwYXavQ+hwlnrct5G+D4/6LpM5CsaXNtqrq2H781SXXJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAsz+C2b; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAsz+C2b"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b4520f6b32so8068548eec.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777991556; x=1778596356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c88BAr8bO221fRKGDOrgPFzIl4l9xrFfjEQLmK4BdhM=;
        b=JAsz+C2bnaQanMnMgZkPtYQcRLIjFDR01mIkrNxBPD5T56XgbWbHqbAnnWfIGiOZEJ
         LVE4I4cLf050fLRUyl4fXfDlBqu84emJw0VBlFjFyhizfmBUDBPMVd9GlRc+xDo3Bk0C
         pDG4FiEOv1ZEmlFtoO4AQb35AJhEon0jV6HoXfXKJ03dZ7nLPpE54S/PBy6791OSN6vn
         YJr9Cf5GwjrKftGhiB25M9DABE3KkvcBuLGST++5XrPYEnRVdx4vOnlWYmPtLbOUgDmD
         oGNIH/mROxxCmTB2+xvpiSGPsaMlUpsUAFZ69dxgNWINw9cP2oDXSVooX0rg1Wuox2mO
         rRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991556; x=1778596356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c88BAr8bO221fRKGDOrgPFzIl4l9xrFfjEQLmK4BdhM=;
        b=JtqJ8LxE/Bbpe+aqMuvesbpKr2wsKZiLixT127sKleE/fmcRBDi0GeJp4FSF/yTwt4
         MfJ6lbDQRlWEn4C4pF836BEWzLK3281CuYWxg9AmsjnfTh6OEpMW56nQpCM26iFLHa6g
         feCDoM5TkTp27J6+ebwwR49B+Wm5Rdg52vZm8Z837BdcTgiLFe8XAEX9HAVgw9FcMoeK
         dncbQIBU+SQDbqEFRgGRwU6aRiROxi1u67krzJx9gwf4Cb97/Jnr7PsH6Vjp+5RszUyd
         Vdmybe70R1HFKphYl0WMBzK4jB/rpF9Cwsw7NrK7Nwy3mhg0OesMmRayqsNaAM9QrZ/f
         H8HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NP8Hpg3ku7Vngbf+TevRRxOH1sKsbS0d8yyiS5riF/2kO8ei0c+n5DQI4lniPaj6REHYDCwCkfYdi@vger.kernel.org
X-Gm-Message-State: AOJu0YygFZJpqNS5hu868GNNfaZM7OyGWTNjTC5MXhXM5V2Kel+e77q2
	oOCVogW70TIWR1UlpQn4rHnrjXZxtuD1nu8tUybY3fFkj3SZ7axJdD//
X-Gm-Gg: AeBDietJcRrzBulVd2r188hgA6J49tFhVklN7eNCM9lTNN9xdD4iifJx8wVFm72kptY
	0M5figeIM7ostF5jHcxLBMBVc1tIMzYS565bKRmawTSfNdstaUEnLOTVWIT4xMQhULQjldyxbjO
	RY8de9ZchacIo8lWz6dP7ILFAW8zwn1oR+buIcA/monk+FfPph4/D3SEI7/itHmAg5ES1f5x1Wq
	061wSG4EVwYA0yUoobEJWexKkX8VJYWffDTSJipV6TtnrmuwuZEn+RZY9LWNEawJhCoZHUvOOuo
	8x7FumOvM7xpy41FEFWzOXr3edNHl94MagqwdXeX11uiVkVWP1JAMM5M/vDtFiJ7r9D5L8vDPvE
	xFBpU6LYEjTz8xaN1ereONs02zy+AXXmX7aW15sTse5mLH8so09Ghs0GUu4l+b/mLgxCK9a/W1L
	bx9auKrui99m1UH6tfG6mIioN88Xd2iuw=
X-Received: by 2002:a05:7300:d0f:b0:2ef:2878:7ad0 with SMTP id 5a478bee46e88-2efba5a7783mr6780606eec.27.1777991555590;
        Tue, 05 May 2026 07:32:35 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b11fsm20803843eec.19.2026.05.05.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:32:35 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	daniel@zonque.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	robh@kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
Date: Tue,  5 May 2026 22:32:27 +0800
Message-ID: <20260505143227.1263876-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b50cbdf4-a101-4ec5-8767-b62dcdb7d1e9@kernel.org>
References: <b50cbdf4-a101-4ec5-8767-b62dcdb7d1e9@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On 28/04/2026 04:33, Jun Yan wrote:
> > The IS31FL32XX series features an SDB shutdown pin.
> > Driving it low (active low) places the chip into hardware shutdown mode
> > for power saving, while all register contents are preserved
> > and registers are not reset.
> > 
> > Add shutdown-gpios property to describe the GPIO connected to the
> > SDB pin of IS31FL32XX series LED controllers.
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
> > index 25ce67940c88..4654aa07dc63 100644
> > --- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
> > +++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
> > @@ -45,6 +45,15 @@ properties:
> >        When present, the chip's PWM will operate at ~22kHz as opposed
> >        to ~3kHz to move the operating frequency out of the audible range.
> >  
> > +  shutdown-gpios:
> 
> powerdown-gpios (see gpio-consumer-common)

Thanks for the reminder.This has already been implemented in v3. 
Sorry for the late reply.

>
> > +    maxItems: 1
> 
> 
> 
> Best regards,
> Krzysztof

