Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D483D3D1B
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573787; cv=pass; b=TLpfqkuT4PhhnmWgSBGehXyW5S3UlD99WeosE7tpZPPNXsW4G8fLNPeWVnR3jhVogYeKLT+RDbsmgak4f+26zQjSWfutC77WBLMPrk0uTEeBF38vrMBud9SrYAs0gM3Vb0wMZk8YHoQIJ1CoPL7Z7uQD3zY1z9dQXeJRedHXd68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573787; c=relaxed/simple;
	bh=fwqarN10NUClOZtA7yaqargVTx8zWL1mtttjSy8NhoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aozrt5FgGjFOcq0U/HxzLdZrZ7HIWFBN9UaEqrJAZqzD80Ub+f2c+AsX+WK8WLu3pzuM/zzYbUk9GT8UxRSnrBDKbj+s7GnXsW6bl/+FoxSCf0yaFYZa8kDbgbEDFAJLzDcmixfEuneexAFyQ2rd4nUg19c/Kl/f4YqjzHRGiAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmittU9B; arc=pass smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmittU9B"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-482f6351832so571884f8f.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789573784; cv=none;
        d=google.com; s=arc-20260327;
        b=ep6iVfQT6UYondmeWCuzyAb2vRadAq1FV+wTa/FeqKZ89nbvFUsmaO+n2JkHSCTPkb
         8X+jXk55Kma4utxaTzF1Z0drFN8wBHyb3pIybL7oydqGKDKutXiOalTDEl9gDZ4SsSex
         HKAIXd8EUFHf/9W0XYmBnojx8Uml7AJXvenFonzqy2BWCYsqBbA998eUupU+t+0u2XpL
         T/parzP2khqsB8CzEIwDmheUXs71OSa+d5LK4ZjXE7GUx+2fLKW0kL/jtd2DPsn9SOnp
         dHjx/rIgS4xIF6NExika6endZ3XBjSGS7xVevXXfrGjPF5hvI68S1R9c40MNZcM+/foO
         qtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fwqarN10NUClOZtA7yaqargVTx8zWL1mtttjSy8NhoI=;
        fh=hj5OHx9du439LQvSnEKaaWqCJSHhoIr1BXf2+niejiM=;
        b=O8rmYRIXR1IXLYuULxdbro4Ws4PngON8k1GDuEtlitVnov4upX7yapGEep+ZFBW5Wm
         vLvUYnOH3IwjQzV6ZMLfZfNhsOZI8oU/UDofoa0LwKQic3san7VnIsUAbFxuig+u60xg
         p2ohMn9rKHaOhuZ0Q2fTRH7CtQCaOLBWo8n0WeydX2SeRJ715eihSHAhCYDIUYz0n1pW
         AXAqzWzfxLw63BSpFfEYeM/wkZSkAjOxECg/RzFKS0HJ9mc/Ypws6QIiK9Jdx9Ap31As
         humjBncpCdVUTgjEGSuNC87zqtgXqMTl+YvSrBTEA8oy/2dyBxLnQkG2K30CwYRxB0qD
         OrOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573784; x=1790178584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwqarN10NUClOZtA7yaqargVTx8zWL1mtttjSy8NhoI=;
        b=XmittU9BA6gPn54I8BeGRku+QMkRWRO35mHcQwvQHHMbAzXuWAzJS9AusPJOpy7+M8
         ULEcOtxpwZBv2xeB/Ii8IJ1xX6939S4xM9R9aXCQZC+5bpjR7Gl5ZZw0skJvLNqtZpTj
         T+P5HejGIuH89N5KIc2qyKy1DGge/h6RyjbpZua97KQpTlkhs9PRqP7In6qRdF/MSiFK
         ZFVLICCDbLYfqcPeJoerrSUlcXEQ0YvXJb2hc0mej1mvnIWJceawO7/dQsLSrvaaoTeM
         gvXFqAHkLlsToJZQNJZ4imPeoSS6/l73snygS4o9HZibBjrCy0gUU6h6KmICWcVFPQ92
         q75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573784; x=1790178584;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fwqarN10NUClOZtA7yaqargVTx8zWL1mtttjSy8NhoI=;
        b=2MRdw2t0ORWsX+cXol/klZG7P4IoAaU5B8q5wLc7UEOHrFtdXhrsvbJqpMRX4hsiov
         mjU9CF8RDM3sJclEmYE9RMYML4+qu6E1szUpsCC2X+WkZ9+z1wsJR4N50ijrZS+7L/qH
         6YhT41PqLaI94SktwfTqIpUkpMedHQCTvS7T52jukUM5bwT1DSKHg08vqSFfU5I+I6en
         Ww9ZYk15lCQrcGCHtaRECyQLzGa3Kr0yB+QDqUzT3fUzSyEYJnRRbnL6KhZSb0JsXPOT
         WzxbNR8zEdnIJSbRvIxvmSPER3UTBevZXub8AJ3b8jLM5yRUa7xVIMO89m0Tj6hnMzYR
         mKIA==
X-Forwarded-Encrypted: i=1; AKwUvByWTrLOZ7YUU47dbqN+couSlqeQBXiyCMMmXK01SYPSAYSU92+fR2Ue2g8p2+61jjPC9FS1Xkdq8gVM@vger.kernel.org
X-Gm-Message-State: AFuF++kbRXHa7Wqia8/y7/OtdQkMn6HGPLgcVUAvGleTrwtlamLQjhK0
	47a3qhrNwIDN2U9o5rdWGYaI1Wv8hXT0xhYMmGJGYJNo5hbjgulLgB+9A9UWnBmMF9HqL9mkM8Y
	sk5SdCj/GH8EWH+Ns6fTtVQVmjPXAkpM=
X-Gm-Gg: AYBFou1sW38ggv65H2kKu1IgM13apwq71mcjTtjSuWBOBcjKkPFXx1v7iaFJ0oWYrX0
	zeGnlxjqHhOe39cgwvMx59TUsc7UzjEopTzFb7pjs+8Y3H4L0JVCzAouqVRDllluginhUjb8j1q
	N5JeCXzBxSqfYfZu1+2d6QTBluksXiwt5vX05+tplK9JuIWBLBmNfHZtxyNFetRV8sixp98iMmM
	vIyBM+gCn9YBtaDDkJBOF9h55NWNNGsBNty6VHKJCa0N3Dwx6RcSYZGikYb21okopRT3wPkXOU6
	5eaLdTGxBQbxV0jVz1FWawj0k0LZv5TQtHG7iM761bk0sLq80Y205SzQgGDnMiXpeEFM9vaGwIH
	XX0PoUMeyDi2IK6UWr+PvNkrwlY6sl0t0UANtWHq0yNGEHxG+zelF5OzY3LT3ddL43fxQ4k8x8U
	izVdPRZAqUvBU6NkFoJR/QtuqYS3MborlOsEn1fN6IYAwPL6opapJ8sXmpyEhla2/UWAqUN1wbq
	QihPPh8/kabDzXYqXwZ0EKu+g==
X-Received: by 2002:a05:6000:2506:b0:486:f18b:3cf8 with SMTP id
 ffacd0b85a97d-4870cf1abd1mr4010532f8f.22.1789573784237; Wed, 16 Sep 2026
 08:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-mcp47feb02_refactor-v6-0-285464651f89@microchip.com> <20260916-mcp47feb02_refactor-v6-7-285464651f89@microchip.com>
In-Reply-To: <20260916-mcp47feb02_refactor-v6-7-285464651f89@microchip.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 16 Sep 2026 17:49:33 +0200
X-Gm-Features: AcwNN1X2bljHln1P6cvv3RlFUVReGuhE23EsCuuOlpyh9vJw40krWIbRB4NBzJE
Message-ID: <CALoEA-wmUAtHjjWB4xOgZxPZyoHAhJ_nywoLjNTkkfCdkMrB7g@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] iio: dac: mcp47feb02: correct typo from a comment
To: Ariana Lazar <ariana.lazar@microchip.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 16:19, Ariana Lazar <ariana.lazar@microchip.com> wrote:
>
> Typo corrected to 'Register' in the comment regarding defined masks for the
> gain register.
>
> Reported-by: Joshua Crofts <joshua.crofts1@gmail.com>
> Link: https://lore.kernel.org/all/20260723231859.03f92ce6@systembl0wer/
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>

I agree with what Andy said on the cover letter, Suggested-by is better in these
cases.

--
Kind regards,
Joshua Crofts
