Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C617E3EC826
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513111; cv=none; b=aQNDHktwiJj+ElQhmvQ/47/p5kKPuawhh7MwZWXPzrWF4eMbQTEqGbQrfT38uGCnChFb7oZdIPRg3xA0LgQ3p5LOscUiCw+T0qQadY4x5GwHDoSEQ6Sx8JLodLf9UIRK64oWhp5AIzVCHhYO0Qh7m48pIYAUcBohSH6E8Y6+QPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513111; c=relaxed/simple;
	bh=C6HysWjRxqppt3p97xPZEPVPX1CWlCxd91lqGmMlzqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UdNmyJgjl7R+EoAeasd+AXb5+XSS586V+uqFOhmu/V0Uns6c6JF0FR0oL3U5PC0Hdv+kCKqAMZskEPN7hVkdECZ6gLuD1Eik8olE/UOdRX/gIGLUH91fkr7J/sVwfn6Yzby7szTQbsUHigld1y0aqO93Ax6wZBwZRF1xKfmOxHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJcbGIPi; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJcbGIPi"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c20ce3c118aso162049066b.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513108; x=1789117908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uJD+ZDdg6YpdXRgwGbwCMsTDK1c49tzWKw31VK68LXg=;
        b=ZJcbGIPiVJTYa8HoHsoQkRKJqOXrnl5/FXXNhY2NK8SBjuFvgvr5fvUykfTf33aHUx
         wGe/oNHWTr29B6xoC3qOh4wZ/ODtoc3Jwa7gkqpObC3uqirCb3mE5v7SmowIhrGamajC
         MLnesHv6J4TGR3mgpYLGTcDXXBP9auKUfYIxSv493H5s7ft6pCy0GYtbMbFPjtqkky/W
         1HMjTC9nMeg8asiwtRV7DPk/rP+HxZXXNh07a0U2IAuvStsCA5RK957dl9sqAZHyt0OW
         4fqja23AfIWCylIGZE1PXkrp5h142DjyHr4yBa6Vq+78PdINzyAntJpeXubwcJd2gc2V
         /KWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513108; x=1789117908;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJD+ZDdg6YpdXRgwGbwCMsTDK1c49tzWKw31VK68LXg=;
        b=OuzNExXxcsdnu68PonngE2ZCGs7uO3wbNqHD/9w8WkCtm3artFn3RDtLpQ+dPTcqZm
         pJsyeR3cAGPqTYwzTjIZGXbTC4+RJmcTaPvDCeWmmFbc6Bypl6tZc/jDhCDgfVEqOfuu
         zupdIymQUFV3uS0YIv/LBIIx4sGnRO8xwRXkL0lMu9K4MV/tKRPCgTTcIwyyg1FFFAZB
         7+CBApJPwOv4eIdC5gpHOQ6DGqnqV3GwDiI/FmVK9GUtG38IqLDIiHu/a5jPjy8TOS/8
         dUWImMuVpNl/Jzvzy0AF89uDoouww6caXEmRwZY3RrMxvlBHEaRhAKQH1NvPAp1GXxsc
         WDdQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1JIksKH7/DvwqDD3MVnRc0Vd48N6wG6eiMclgiuUOojOapZI1xHRunUJDqyhQ+d1bLdtMACsAQUkT@vger.kernel.org
X-Gm-Message-State: AFuF++ke2UfJSPxqfdrrercW9iyG0LGRIo7PhvvyRxyc8vV90We7jP3+
	GU+0joaIrJZJ4ySSN5mbDzd0I/zlFvsblR5cg1r40qZmUJpGdB5+NVQK
X-Gm-Gg: AYBFou3iKgbKLxiqm/nuJGkG04xWkDxscHHBJqb78Wmx9LV5KOfUteGtS5zoa9lzYHu
	EnOEsUcyyTiov0SIExLg1B8jI+tTGexydOFHqhOZRpb3zprKwr4BrrKt+04pgNxElXQJ5Jzvw+v
	RksHWdbsj6UMRS12JpZveNJYguks/FgiQ5I4wvyJJXVfD2J7CL62UKVgMM4D+OhIxsKx08cy53H
	yBXCkVtIV4LO0aVOERLbqjVOoPiW9fhTA7x4EIakzUOVl9r/QaK+UC6HdqxlWJo+ft7YHKfpQwB
	TlvTzzWhCdlQCwEu65F5nYhtf6xgReoNmAETY3uMpNuS1bc/zFzpd5c+q/AASjNbjyQlpB1IF5v
	gmbhug0XNorlvvY2TTgiXdr5Jibh88mgpghVuYyBW6IVg+sJiiy9Rsm909++2z1CrwROp2uQ3wu
	FI62yeoxBbtVWqZRyQpFzcsLJARev9cEkWl/F7JDJ2A6Ul2AgQB3H68RXd0hRtCVOegqXrtzCrs
	e2Jz5J2LRK31pxkty3rO7AsrtvFPlIjnA1BK1G4ZoxDRzBbow==
X-Received: by 2002:a17:907:9411:b0:c25:c678:ff80 with SMTP id a640c23a62f3a-c2610366a86mr121353566b.2.1788513107681;
        Fri, 04 Sep 2026 02:11:47 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.tail30ebf2.ts.net ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a98efsm78220566b.14.2026.09.04.02.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:11:47 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image sensor binding
Date: Fri,  4 Sep 2026 12:11:35 +0300
Message-ID: <20260904091136.3234327-1-chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <58c0d082-b527-4fd1-9f7a-74b58b4db54d@kernel.org>
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com> <20260820075524.2056029-2-eagle.alexander923@gmail.com> <20260827-legendary-viridian-tamarin-4e56e5@quoll> <CAP1tNvSg4yWHCJW6UNZ4yQv5FCjz9u5ZLpuW5Z9skkjQYbS9AA@mail.gmail.com> <21dec355-0cd7-4250-a7f4-e93f3e446504@kernel.org> <CAP1tNvT2+uNvcHf9=c_ysaM=gKrnz+5ZMTOq-8n_V+Ryx=yxLA@mail.gmail.com> <58c0d082-b527-4fd1-9f7a-74b58b4db54d@kernel.org>
Content-Type: text/plain; charset=utf-8
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Three things that may help: the concrete colour/mono difference, a close
precedent in-tree, and a piece of earlier review that has not come up.

> What are the actual programming differences between sc, sm and "none"
> variants?

There are two hardware models; the third string is not one of them.
From patch 2/2: the models have distinct chip ids, 0x0a56 and 0x1a56,
read from CHIP_VERSION (0x3000), and an unrecognised id fails probe.
The only register write conditioned on the model is DIGITAL_TEST bit 7,
MONO_CHROME_OPERATION. The model also selects the advertised bus codes,
Y8/Y10 versus SGRBG8/SGRBG10, and the mode table exposes the 10-to-8-bit
DPCM code for colour only - though that last one is arguably a
media-bus-format gap, as there is no mono DPCM code, rather than a
sensor difference.

The suffix-less "onnn,ar0234cs" entry carries no match data, so the
model read from the chip is kept. The cssc/cssm entries do carry match
data, and on a mismatch the driver warns and uses the DT-selected one.

> So all devices are compatible? Then why compatibility is not expressed?

sony,imx678.yaml went through this exact question in May. It was posted
as a flat enum of three strings, with a description noting the variants
could be detected at runtime:

  compatible:
    enum:
      - sony,imx678
      - sony,imx678-aamr
      - sony,imx678-aaqr

Conor's objection was that a DT naming both the specific and the generic
string would then fail validation:

  https://lore.kernel.org/all/20260520-crusher-species-cf707a9a8b46@spud/

and v4 changed it to the form now in tree, with the changelog entry
"Follow Conor's suggestion of mandating both the specific and generic
device name in the compatible property":

  compatible:
    items:
      - enum:
          - sony,imx678-aamr
          - sony,imx678-aaqr
      - const: sony,imx678

Note that is the mandatory form rather than the oneOf v2 used - there
the generic string alone is not valid.

The other colour/mono bindings in that directory use a flat enum:
sony,imx296, st,vd55g1 and st,vd56g3 all describe the split in the
binding text, and aptina,mt9p031 does not. sony,imx290 uses a oneOf,
but of five model strings plus a deprecated standalone generic.

The v2 fallback form did go through dt-bindings review. Rob quoted it
down to the enum line:

  compatible:
    oneOf:
      - const: onnn,ar0234cs
      - items:
          - enum: ["onnn,ar0234cssc", "onnn,ar0234cssm"]

replied inline with

  - enum:
      - onnn,ar0234cssc
      - onnn,ar0234cssm

  Please explain somewhere what the differences between the 3 cases are.

and the quotation then resumes with "- const: onnn,ar0234cs":

  https://lore.kernel.org/all/20260812210309.GA972604-robh@kernel.org/

So that replaced the flow-style enum with a block one and left the
oneOf/items structure standing. Reverting to the v2 shape would not be
going against that review.

That leaves the question the thread has not settled: whether a bare
generic compatible is meant to be valid. Laurent listed the use cases
the model-specific strings serve, on the RFC -

  https://lore.kernel.org/linux-media/20260505163713.GE1547435@killaraus.ideasonboard.com/

avoiding a sensor power-up at boot when the module is known at build
time, and a runtime sanity check. Of those only the sanity check is
delivered today, since probe powers the sensor up and reads the id
before it looks at the match data, so a model-specific compatible does
not currently save anything at boot. He proposed both forms in that
message, and concluded "I don't think we've decided on a recommended
practice."

If one DT is meant to serve interchangeable colour and mono modules,
the v2 oneOf expresses that. If conforming DTs are expected to name the
model, the mandatory imx678 form fits, and the driver can still tolerate
generic-only DTs. Either way it seems worth saying which one in the
binding.

Thanks,
Aleksandr Chubuchnyi
