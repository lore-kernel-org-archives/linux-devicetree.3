Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129152F6931
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248036; cv=pass; b=fbkro0rCILEsND/RXUbAuHYA2zaOtnLPWQ4+S34vnES2oia0Wli79StWCrVeXzzGOIwq/8DJVP7STmEFT3adlP+elm/XcLKr90eYgHRfa3SFa5t3IhONbA1ub4BU4JkvbHnA0oJO3TJaLOu9FWMNaD67/GLARzM50L5dsu9l/uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248036; c=relaxed/simple;
	bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3ecZUJjESh7kPREKEgwYSNTgliayg0eYxntL/yUqeLHGOYrQHYZLMnzSu/gs/KA2l9pri5PHzaUcOC2NVlb3/0H5hZK1HzgDm56wlBcklh1D5U6Ll28KuqlaRvzfB+Eg7l479xMUl0YhIPH74PPsujoS6Gxjgx3/vZhUNdEhv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GX6a316Y; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GX6a316Y"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7e2f3646c10so6960557b3.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248033; cv=none;
        d=google.com; s=arc-20240605;
        b=hTrU5iMqGZOfv1iNvO7ORz43n+K8Y8pw+2jZUgVMcZHb40oRjzvAWnTsg8wV60rtdB
         n6xDtxmBckLoCl8RkE6W/8SBEB7FXzbWAjguDl/zVGyWix1qS+nW6fXwA4GTrnosZWbO
         0uwweDOmOkQkdixAEjnr5iRWQuC/Dr9KUYyFV1XPoLavwiM4Tq23izf4jl1GiQ26++kB
         0Fn+qF38vFjfQiuqtWkwZ9jqeqOZFErOOsfDtkfk4DMf4aisK21ycLEdGGYl5xV4GhM9
         hT4DMmiTS7275XP5JOHUt8+JbMTyIkdQDIxa7Omr5nkmg2G7JClOMNqQltbFp8dtcEIC
         Jetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        fh=QdzUP3pPT98ni/1BhZmN8Qhfx8ymHIwLlzh5GuLh8xU=;
        b=kr9Jzg0PhQNwrpSA2ptsMJOImslGfwhOxglLCXObm+iu5WsofAMXf0TdQGFwulxVoa
         9oembAhEa0xTrHeyRzLkt0TPVlOUw4z/M2Cupo7EUz1J/DHENH1idUaluGsHxlkDEFqO
         9X8Lzz+44qB9/9K5GCbiTEMvptDAAq44S2y7N5R5MQ6y8LqN06rIqLOPGwo04NooBoYn
         V5S9UFKOinFli0JhUYorQNFIWfZ0B7orNqrWo1NvNseeF11u+LNcYgKneAZjQq7s2fMK
         zcj8TwlLzbqdBEx8kQI0FxscNjwCpFqdqdmYBJRTh6eTTH7RWyuMBN0PzByxMM+xB2wc
         Y+jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248033; x=1781852833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=GX6a316YJGltvP7NQQNtDlNb59sOQi88Gn9mV1Y8TuxfeZyuhU9puM51+9riltZKfx
         JHWs8YDubZD9ui4RTOdUsaFTPaj91O1gorrBEECB6BwQPfCHQz+vtI56oYtN5Xxwvhzr
         yDJo96lcZ6Yu/IHeXD9RRo3g9YtRxf78bYOiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248033; x=1781852833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=QKvf/xuAmvCMlb4m5uXguuhx9OifK9dkv7JkPOztoYpd86sJZtRpSnUojolABzFe1t
         LBh87oaSqC7EEgAfTcrR2vKV+14Id5My1qbNAFLPzR6eucBP4nEfBmHr7JWEZHsr1Xgs
         Vnk9J8HZo2I+Vyjpw+sBqJKDeO16y6JgdbZzokOYwy7vzG7bmNPHGH29zh7WL57w4OTp
         obw6IDhI/WD3ZxHgLtNV3WbRkoHczoHvWFohL60eZkTaHiV5nNI71Fo3oSHq2v4yf4ZG
         tbiKy4/2Wwakka8W+1u+So8KrjxzqQlHB+xbJjvVhIRH9y1uqLaTXKsZBwm78W7zvKJd
         oI2A==
X-Forwarded-Encrypted: i=1; AFNElJ8DPJWgnnvfNktSnb/Y23kNzC5SXnSlX8Tno2tBK+DxTBnQoPkXbWyAkWHB/FqqM5DRa8ziSklVvAnd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3y0//S60gMiq/Qj2M3vTVTgMVnCDFBBImkDCYnu52oQHxv5j
	mBxFbmCTWkhX8lgJd3kKWwFz2h8xfYpme1g51I0ma8nwo49LnNgSrmue7TRjJFNEFT5BHgVLLYi
	D/HzBPMxj3KEQSGGngI5hYURQ7HMfJbfgafTLhKuB
X-Gm-Gg: Acq92OFIaL0Nyt3s3vI0UHDN/diEPUv2LlfI9JOzJ57Px8GIuuo7nnKYGQqAgtxxuLs
	V19kJDnzg5h0f0HiPAwRFf2bbaftHlzzDwRawT3p5OUi5pnSS1uF0ponlkxNAwiTA4GcPHlywUy
	7SsRzjoks03ZLh2oJrh5sjWfbKT/oaa1k5cK4jmBIdLIcPnuW0NbUJntaWHCis2T9Npo0d6aCDW
	c2kUBFa/BCTAVg9tDyapErqKS9V1YvHGdOTTtpRCVArR75MYfQtNo14Li4S87JVwSgt44uWWcVQ
	Lp26TNv9
X-Received: by 2002:a05:690c:e3d1:b0:7d2:6b8:6e4a with SMTP id
 00721157ae682-7f7b6448b2bmr14221767b3.18.1781248032935; Fri, 12 Jun 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-2-wenst@chromium.org>
 <ailtMyYhbkOgaZWw@ashevche-desk.local>
In-Reply-To: <ailtMyYhbkOgaZWw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:07:02 +0900
X-Gm-Features: AVVi8Cewi0jX5G3AwANJfv_JfU8wtj5jI6ryJrZRjeBtUWWvLVEyokylnfzsf8o
Message-ID: <CAGXv+5EZp0KvTqMde9da9mUWJyg+6X6Eon9Sqxx0VbikfVr8fw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 10:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:35PM +0800, Chen-Yu Tsai wrote:
> > In some cases the driver needs a reference to the port firmware node.
> > Once such case is the upcoming USB power sequencing integration. The
> > USB hub port is tied to the corresponding port firmware node if it
> > exists.
> >
> > Provide a helper for this.
>
> Okay, if it's really needed.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> > +/**
> > + * fwnode_graph_get_port_by_id - get the port matching a given id
> > + * @fwnode: parent fwnode_handle containing the graph
> > + * @id: id of the port
> > + *
> > + * Return: A 'port' firmware node pointer with refcount incremented.
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer.
>
> Note, the Return section must be last one in the kernel-doc. The last par=
agraph
> sounds to me as a better fit for main description. Basically check how ot=
her
> kernel-doc(s) in this file are organised and follow that pattern.

Will fix. I likely just copied it from the nearest function which happened
to not have a Return section. I did a quick look through and it seems many
of them are missing this.

ChenYu
