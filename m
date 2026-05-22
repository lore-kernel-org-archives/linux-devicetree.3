Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB7357D02
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433669; cv=pass; b=oze2xzE82tB6tgj94Zv1K5+aCWZo/moAn+GegRplTvqOf7l3YLhySbts1K3nWfMm7KO718qeKN/VWKkkquuHVvKiqinmM3bgJHDXrxJOvblp8zeN0NBVNambspEq3yxkgLVS5m0E4VpI8Kq31TOCOcDHS33oyVLAl52mleRRCDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433669; c=relaxed/simple;
	bh=EPl2BS1iOXffbr6+HzJ7M2qwiGQvNK4J0IVrjdekixI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzbEqKP+tkCSe4DGCUQtZuMSJHt7XLIhvYHY10NHf7jjS4U/LUngNa08uFK2W3AMFmMLezLBGZqhzrMesKt7HHKXKOW0NIkAtb7/XpqV+YZSR9Ro//douD6rfdzVHusufNDILrFfLHn3oid3vZxkbonYaqzRXGBzX/k+uqhJraU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBXdV+cp; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBXdV+cp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso14003145e9.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 00:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779433666; cv=none;
        d=google.com; s=arc-20240605;
        b=ClCo3eN8mATPL4xY+unIVUw1LT4QxSRl6VoCWYV1QnbuO0YeKFOJw4D93YHD/nHt9H
         EuEysV5S0gDJVv7Yi69nwIQhb31uA9OjhIrodmF4HCIhGSmMwlM+fIr6Lj8UmHQvsJaG
         y6P5KXgnz3Ms5ZZ4RGCqJHHTKv/X7VqLWHTLzlnnjvbQgMCFbqPG3VIRHyjHXhJoNXZ5
         T29nPZqo0iSA5BhCVK2zoO/ajmd2kzxk2bWZAmIsKOTwRVcFI7HA8dFj6CBlYEqfY+If
         LQlrmF6zM3Eq8k0yIr/6pkmXZVn+luZrcgFD0dxPpgiNxVMbx0RGkeYz/2xJKzn5pS1f
         XbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MlB1zbZ3SMOheC0AHg1Xca54KX8FSM8S4mSIV4vaGPM=;
        fh=Xpl/c9JSeNJu1nqJrnZstRHYHG1apNTlACha4SvYZN4=;
        b=Dm9CuxfM8yzeAAeYaLCTgiv3pdIIzsb1avBU/hWdsCp3UNGqOl4M0IknGt0nNr21LX
         eNWYoMaEe0+HdNQjR7S3VjQvWuNGtywDWHies6CwxJ7Pc5ZFAv5+JdGnfW2eGFcwbgo2
         lAGVVHIpInlXBXh5BPqr1Le44ao0DymLdzF6xEi2MIVwtRg1YR3oBF2b4hUheZxXlWKb
         nlSFS8RimAk3FADVaePbFMxAZRS0jrkyAjYDFNXVv1LiOc5VyplMNrzORX2eZE/Dr49d
         753YULFAxQu3fZSxGSMfH1RO0ya/gjpSn95ZxbHFD/5Yd2HqwE3I5lOw+zWMUPyQssGX
         8A0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779433666; x=1780038466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MlB1zbZ3SMOheC0AHg1Xca54KX8FSM8S4mSIV4vaGPM=;
        b=BBXdV+cpYxs3FyMWZAizdTK44oJSlnmPaYwxXW1P9AGN4/r8eBKLjl43ho2R+0wrHf
         gg8t9MGDDEG9Uz8mrJzyj7nmPqa0QEJYTpRXWvXZLNJ59L1yWact8tKCIkcauuKsp764
         /i0BtLEEeHoEkKaydqVpLyiq6MQjoi9Dfa3qi3e7MCtWaoobt5xI2e0ce3RwlgzzfS3G
         XNxawi7XjmvuTDC0PrjbqNyyCRzDm6hPfrPpoS4JPyBYNg+7MrnD37nZ9FW7Fi33zTFA
         pvNyIqhg6tgfRsTUI8lc6eWy216E5Fwzk5GvQvbGzQmoahprzYhcicsCdcyQ8GAvv/Dk
         aYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779433666; x=1780038466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlB1zbZ3SMOheC0AHg1Xca54KX8FSM8S4mSIV4vaGPM=;
        b=ZbV4lKseLagaFgoO4IuB93y39jDpfW5ClGLXfnW9R6NHMiIgJ3tuEd0+yp8sRt7/AR
         P2bgiYDpg7cF6VyUuJzeG53xOyQGLBFHleKaDITnlPbuDyTSrWdPI+0BgQ7cyKw1OZd/
         yBcjlxfXmJHIwFDj4kg2MAN9mCMzhFBcZnyA4iE/NPdG8nBjqN5Ip8Wxfvo+WOlFgEvD
         y+tti6P9bAp/T8eO+rwBEhCU51HANze7HQ8ZzFjG4QKT3GKVDUtCcECl6F1WAbkskxR0
         RURmjQ+BvUZyiCI9ZPYtD7yZdjKAytq5nuq7WrLnwmRSLYs9dSJacVpoqYBQLaIN2fHn
         4JJw==
X-Forwarded-Encrypted: i=1; AFNElJ8gM6XBZ+IzTLCpwQn5X3NCtYtgusE9Iu+WE0got3OV4n5WQiTY5bP5T2CAdB1SWHJMKwBY08HPIrv1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6qJOCO21Bz0pKTeoB2+uVTYZEpRPgXlCPJ515jTvJDUozHu0Y
	n9BBggQdDaCjIx8elelIKdHWokDTc9WZDR/i36a93m4Tatitt2RdXvx6EmR51UTe9/QMG8PxG7b
	EdhbvhPrxBMIALJqrtwDwMAGXervWdDw=
X-Gm-Gg: Acq92OGNiQioPFhIqSq5KKmW0dD2wnaRis6QxNHFRnMUuQkwz2ntCtNHzj+C6RPfkIn
	BHveRsPzp3PXyHxLni+rIcGeWNKK+jsKgKWh8aPyA3lcQpHbsw7ftRP97BshQ90X+qa7PcYElkn
	dIHfHLAPRBHH3/YxUDSDk2Jq2eEn8j0MnMnu3E4hfji9oLi4E/vOBq82i1co8THpAfISnyLlToA
	AwLjiSsJ9UZKkCxFE5AdLPTkXmkSV0rBrpghc9ojKQwE2oFNvmXvn8VH3hvk95XdWvWnZjmP6Jd
	94F/BEgoau6N+0FF+GPsDt61v/GjAnFBklkJDsVtLk9uwWR/2T5tGO82KXpzQ2ywf2RlZksrg/j
	soo/xpE4vkfQgauNf3QJx4AtGjAimHnydl4Jajt4n7E71ZMfemxbQqqAqOChaeJc8D4TwiyrBYe
	M5jqJpZw==
X-Received: by 2002:a05:600d:8450:10b0:48e:82af:d9 with SMTP id
 5b1f17b1804b1-490428cc11dmr18549195e9.29.1779433666259; Fri, 22 May 2026
 00:07:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521164323.770626-1-liviu.stan@analog.com> <20260521164323.770626-4-liviu.stan@analog.com>
In-Reply-To: <20260521164323.770626-4-liviu.stan@analog.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 22 May 2026 09:07:36 +0200
X-Gm-Features: AVHnY4KiMKWTphYfQKr03PIgXm-S9q9DlkUTntnpCxXmD3GS3gd8Mwwrwuvcq3k
Message-ID: <CALoEA-yqiD_mEYF4LGuVk9Xf+UJwREgMdrHMj-2U+96TSU7EWQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] iio: temperature: ltc2983: Fix inconsistent
 channel wording in messages
To: Liviu Stan <liviu.stan@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Francesco Lavra <flavra@baylibre.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@analog.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 20:16, Liviu Stan <liviu.stan@analog.com> wrote:
>
> Replace occurrences of the abbreviated 'chann' and 'chan' with
> 'channel' in error and debug messages throughout the driver.
> Also changed the diode invalid channel error message from
> "thermistor" to "diode".
>
> Signed-off-by: Liviu Stan <liviu.stan@analog.com>
> ---
> Changes in v3:
> - Dropped both Fixes: tags
> - Removed the "all" from "all occurrences" in the commit message
> - Fixed some missed "chan" / "chann" occurrences
>
>  drivers/iio/temperature/ltc2983.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
