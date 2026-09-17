Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C3F4B4033
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639143; cv=none; b=R8n5RGVBUiNe6vH8q5V9yzLl3SIk5s/Rai4PIi7bSjdsvr7NYi4Ru92P5eeU6tH9PVaNPTV139o0wSuta5BC72hxxzlX6IZBAVpB+1g5FQ1D4FSw+QQHGD+GqN8onjGaMneZQ84HGVIisRNCi9IN27PSq6NsJA0h3NoumC/5iEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639143; c=relaxed/simple;
	bh=1C100L8bLcVs1OmCDJ5ExHbei+nHSxHlT2hyva+aaWA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfedZbbMjxinc68t7xOVbMbKeAkx/XFJxZlr4wStpQyGgt+26xwdRMwjuf4q9i/euHJdisx0EE18qP3Am+E0e8UjYvb8cYBoQp/WnEJ5fzUbcd+cGw7dqa5tSKh+IgasM7tP5oWuLrZ4ZfzfAW1tatg61dPzMXYKy2GSIkkGLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+bjroZK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+bjroZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EB01F00898
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789639127;
	bh=1C100L8bLcVs1OmCDJ5ExHbei+nHSxHlT2hyva+aaWA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=C+bjroZKmJEkCHvSXNw/CXxjY+JkwBuhMzng5AA3YvtwfNyvFqFK+/WOLXWJ6PS4H
	 9TZ776QZpY25/FdhzqTWV2ig2qOJthZcrz+5E0/DgTv/dTtQhI+LATRFpJZ0meWmZs
	 XwyLfbxTQ6nhTukV8+YrEiKVCn4U+nLSPwm+/vZ/iISkucA0mgZNHHStcLgVJ2rh+4
	 1kj2uVYrE9bH8m+H3xoG7DnGECFMbbGoYLQbu/NJgct3JjmkwAQqiNXKI3usq9ALhb
	 dSw/uTMPtNHogu4/cr5nSAp62I6bKV7tBAhrrqzLYodYDnbkpbZsJwiXMjv7mdEs9T
	 9ySJKNx7qEs/Q==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so5980451fa.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:58:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy5AjxDgT7UP0eUJc6gW0d+dWqO+eZukDuhyUFJoWBlpHeSuzN+PvJOY61RAX6rTIC5ccda8SLWXm7M@vger.kernel.org
X-Gm-Message-State: AFuF++ke+dO6yVkjbOAKozbEz5JR2wE4cGAF7kY8HPzHfH8hhiUIXkAt
	Egj6Fs89u0Xk/1vD9P62bH7G5n1wAvMuEzoTUJEr/fzzvm1O+R98/rIaz0L+oxuBpYaHc55B2pa
	+YuhLS4NNmjcN7rgWMMoSW155mvaIPNrFAr0JNp//Iw==
X-Received: by 2002:a2e:8a86:0:b0:3a5:cee6:940b with SMTP id
 38308e7fff4ca-3a5dc9be4acmr11717551fa.7.1789639126058; Thu, 17 Sep 2026
 02:58:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 05:58:44 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 05:58:44 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260917075611.47881-2-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916182641.9768-1-farbere@amazon.com> <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-2-farbere@amazon.com>
Date: Thu, 17 Sep 2026 05:58:44 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mff_Lyt6-0qQ2U1aG_CBG=xD2NxoCbw2dhmCffX5s_h1g@mail.gmail.com>
X-Gm-Features: AcwNN1XWj9I0TdBuyBZglQXFeft5zXi_OVwexcXK0RKPOD6pE-syCJpIOfCJxh8
Message-ID: <CAMRc=Mff_Lyt6-0qQ2U1aG_CBG=xD2NxoCbw2dhmCffX5s_h1g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pps: clients: gpio: propagate probe error codes
To: Eliav Farber <farbere@amazon.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sep 2026 09:56:09 +0200, Eliav Farber <farbere@amazon.com> said:
> On the two probe error paths that map and request the interrupt, probe
> overwrote the error from gpiod_to_irq() and request_threaded_irq() with a
> hardcoded -EINVAL, hiding meaningful codes such as -EBUSY, -ENOMEM or
> -EPROBE_DEFER from the caller. The request_threaded_irq() failure message
> also logged the IRQ number but not the errno.
>
> Return the actual error code from both paths, and add the errno to the
> request_threaded_irq() failure message.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
