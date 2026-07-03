Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480623D7D7F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085170; cv=pass; b=jCtgyiEydSTk9E4OlfQufDORe0n5u56N5koYvV3fX2Ua6diYKdOA3BH6jnW53P5kYJ7WG28u1pzdTBKiP5wQmqcUhqKcgj/05oFDhSGyM6drsuj3e7dUBfTiysgbABoGnI1+UnvhkzFkg4lbCc9H+OKRzUVINbUHqITuUxTgqjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085170; c=relaxed/simple;
	bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q95s6ja7ZB8SGSx92IAmZQ8IxUr0zeVNHdIV+2huIhAVXRm8XmS2g2E8VPLHNHtbANJnQZXyHzm8JNaeu0Xwby6HpgdyGaXV0EwwFsMCQej15prXiGMziEN1/XUudZeOwJWF6C7p0gOaLwL/KgALhI3Ebe/yurFeYqsngxAsvNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KJrt8HfN; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KJrt8HfN"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664d35b4777so659805d50.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 06:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783085167; cv=none;
        d=google.com; s=arc-20260327;
        b=JvWR9c4iuD0PU/y36kUps4YRI7FglURDdewQ4wiADWuAcypmlSebYaoo4VgdUVMESW
         dUZlp25e+Cr6DCfIV6PeE1iDTLDW2UU6nsG8O7U+wOkB9GGcdek+lpDdl3HcToaI5KLN
         qZ469Yeskvhw7r3b/TszVjKHyTR+6wP5uTzPQTs4s/VKIkKJl8DJC01SDmxbEFcjD7Bo
         prA2hBTsk6o9AbQx8EngGYIzFPug/NAM3Dr5agwBMl/1NfNDl04DsrAZXIB7oZ4nT5lx
         UQRhEfrvF8ZT3KnjramDtYvQTmKSRBQX7xLOiS6bM+QzaLcQHPhBeDhy0dwrTKO1rjoa
         A9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        fh=MJLO7yXTVXbU/XTONd/kUwXYwJnuDOFhtZkGmpjm7tQ=;
        b=ZfLCP/LN1noAZ4ljEPy4D2QmtW6/XLoafjhS9IvG/oPcQLq2hQQNmY3zntSwNmCSSh
         KGSABDU+W515gPlWyxWc30W2elkF/xDm0eoVCFPDqsBdxYYl7DT6bn+LwTqNrkx5SlNb
         PUAdUIw4tlTH7OlJ129u7G7rmemjEY5Jv1rBa92jm99W0FpTtyT0uckCUAeDvVc8Mf9A
         CsaZ795ezm+MTeBjvR/L0a9TYbpPXsMGIep5J/O/r3BXaNql72AL0a60Gc9vISJ/IcQV
         V55hrcjufXKSoXRJg47bm5xq8yJBIzE/cuzIDyQgMcLi2x72b6Lxz6UVkc3j1GgcNNL+
         /Mhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783085167; x=1783689967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=KJrt8HfNHAIjRwl1rngsaRwQF/9FG/CBUQfLIs6l/S0TOIfaVompOtGsf8X3bPYz2D
         RpHkamXeIR2v+GJi9wvXvM4EG3fqa1ExPuTLfmCtACLkWQ1SQRgq8Jnf8+Y6no5X9ShD
         3ZnIRWkysCQxSmaWU1XoTY7M6QhPv0auFgUNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085167; x=1783689967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=gI27pL9CtthM2xuPiwzIrDLDW9Fp7md+kGWtsMWsTGuHmrbGWk/Foowx46XinZofVh
         OdiYx6Xz9SNmGnIhA871somRbe00YElchvbgHQYJbfNO/Z5WQDj+6Alhpbd8X4McOTwC
         fl5iv0KnGQBdlFtb+9gBH62TfpOG+6UjGzutosZMmjR9JxQ8GlcdUVuJM6yNsAgYYkF2
         d0eY2yBpPiqyabqHPJMfeZgNO+x9B39i5LV+jZ389HXNIJNIstaAoz5dAcY7JANmKpYq
         KFLUgWUmn/zSmqGwHgMUOSjb0/yvvzADI8k4JWTXz0DKbAEq9H7WPUh+0+i+JST24lnu
         sVxg==
X-Forwarded-Encrypted: i=1; AHgh+RpwYWTAnTnvY5TQFpNzCVy0iWACZ7L3PBPNmEbxRT4BH3vyQj/gHby4dzWOAwM/Y0eytoImWkzC7okQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFjlBxy3qGCYSA6swluQCJgiyl3pr/Kgx/VtGGD5ClBQs3yf+
	IirB2N/XaCiFpIBSYD2at8dqd4dnTMd+dnV1lmYufrSs3tyvpvlHxpJ/OP9VfqK5AXSVAeCUKrw
	M9oZPHK6ZdTNXB9MyZN+v0JSb2XNcY2P94B/yEPNI
X-Gm-Gg: AfdE7cmV+BpKcm/DRijTss0H0MeWRH+afOiHoIxYin8X8cccujtemIR8r5IoBc1uTSy
	xS5uyGeCKqwbkCdg5+joByiCzPGVSBxN0vPGf06u64E4Kt5aNGErPOeacIIGILeCt0A/lKZ6Etr
	E105zRShAkU6MixRe/17zyBiEpVp9Iy7Fu665F7j/Wlu+9mNRASpUVVMge1yllWGZl7jsCMhp48
	SrDgmPhDfXPn32DhjO/ZgTjbRs2chRZ2erh7K3ufwmph7hgjdwmdyB+Ft+aOf/Sk6MIdCQsuTIb
	Ad1yvUkdv3SJQqfXco4E1UyEkU0wiDy+hx/klA==
X-Received: by 2002:a05:690e:480f:b0:664:fc22:36cd with SMTP id
 956f58d0204a3-66521ad34dcmr7426372d50.43.1783085167252; Fri, 03 Jul 2026
 06:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-6-wenst@chromium.org>
 <akeyxn390mVmYo83@ashevche-desk.local>
In-Reply-To: <akeyxn390mVmYo83@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:25:56 +0800
X-Gm-Features: AVVi8CePOG6OpnrlSpGFhkpL2GOtwCFUk_NB8IIc5qFTOLO5i-BW3OK69XKCfdo
Message-ID: <CAGXv+5G3ETTGbgjWJCbQjn9yvRamx4GHPxjWPgmy_aXWUxm0iQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:06PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> Now I'm more confident that it does not mess up with ACPI case.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you and Bartosz for the reviews.

FTR Sashiko pointed out that this is likely leaking a fwnode reference.
I will add a fwnode_handle_put() call to usb_hub_remove_port_device()
in the next version.


ChenYu
