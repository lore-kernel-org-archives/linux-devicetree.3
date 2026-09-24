Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46E483BF9
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262816; cv=none; b=enYqRoH2ICLCAbQqhJrnNdkY8wVODeybEINAiczoLkf/o7Xv0mhigC2JJQkX2UdNmigAMcelj4D+8xLS4U2+UUxNjBvIPcBYAwZF9r/AlF3QSQ7e8gi+r9dhZoAqGq2ANI2Wpzb8B2ms0mcMRrH9OJd7JLep66K3KEj4HPoqoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262816; c=relaxed/simple;
	bh=vBZNIMcrFusc7oIU7IAyIFJoDxVBsHLcKvTckgQuMm8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nsBlExzh8PKLwNuehU4HeiIFQvPP+R90v7x486wLCgJubcPXBhwm+6wqXO3JQ0mnbGWug1MnZiS125JjMCTS7zC+Np+S3oDQ1RFNzIzNW19kDFatZLEkmzCOJMXDWHoSG16kt5ehXQE9KLUACz8pEydNeg+YP6YzxkcxorS6ues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI9alQAy; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI9alQAy"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so94247f8f.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790262813; x=1790867613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DCS5WVHgbfqAUCE9Nm3HZBU7EdbFt5hV09Y99Fzxq1o=;
        b=AI9alQAyK+kqAKyuzWl2XYuEyR48+koGm5fiERRqM3/jIdzNDB2cHrM2WWQAkBpu+J
         BJ8JQQ/ReiBYAk+dnr2mcLG+2iMryyDrYzNXG+ep6EAUwyWsndDHRJHmU9kjsiLDZdOV
         KfoUwK5pAeKl2UtmRIOCDbdivc+WYGJC2e4i4lwW20w4bo82T5qhI62C064Q7hkFc/NW
         lQoxtwmBcejF4G2WUts+AHouAglI9YzC/Ws5KM9AFSepO6qFel9lhgjMVGMSKyPja6hG
         KNmv8ntq8Cfkyi0cpR6cksp9zbJDyjAlF69sn543Zu0dmBsmx78rNALpe1kfoCV48A6o
         x+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262813; x=1790867613;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCS5WVHgbfqAUCE9Nm3HZBU7EdbFt5hV09Y99Fzxq1o=;
        b=X08nLTJBSdsKgqIMNpRU6ndvoxN8Ng4h5Yoz3YRzyryetewCuUTxkTZsIs+AbkWYmK
         cZ9+mgTsLQVeBoujT/+setZN3UKHzeK209eT5/izOc4mSJ9W291DmZ0q8Pn+bojASlQb
         yhQix6jsZYRJb0iZOlNYbmsabyECuB2YRXLXBPHj+MPJX9VdVhRWWCXvY8pX54lKzRZ7
         HqF1Lj/21G+dBIkubmzoOKac8NX5YyNagRtbcviyJWWGdj/ZWc2MS3p0h1rYv53L1iyu
         QtqmHnxlf9O+WcspA+rZwo8LJke+Vl+RpibabssW2JiipphA98slnSEIiAGM4ktcz0jy
         FP1g==
X-Forwarded-Encrypted: i=1; AKwUvBwTDT0vk3UfmsgipFq5hqeNcqcXhuSFvJt+87HqaNa5ZeYzkIUcOgVrXhkXA+JioubatPAEuUA/+3bu@vger.kernel.org
X-Gm-Message-State: AFuF++my08Ab+nJFAsV2HtmZDy3xXkRgDZGoKRL+XcJIWqLOycFLb6vR
	QyBDQwC0Xg9Lycvlz/fSVyB+AtsJE5PLhhMC+nduCme7Wjv76bePpEgh
X-Gm-Gg: AYBFou0pvvMS5BxZ73sbiWv8EawmnNJhNFHDBtI6pJacH++/nHgCGDhu4z3hMK+skeg
	hfT58p1PKifHrak65KHPbRFyhakReYE0JFABScOg/wcRw5Nthk5k0nlI4P3hJRVOMCGBmNGrhwS
	bs35S+9w4EFtZOrmT9mp8a1Tbb1J8s4mJzYPZEHRcS3eXgnQVxxrSNU6eO7mMulXyRgQrznwFCi
	mv25hWFyszDpAHHoubhWJsQo4kxE0l4l09XcE1E3ckWeWA5nAbzHo3eZPuprNsgSAKbzhveCYcN
	rpn863oHyy1rIUaIFILj5B8BP1n6wfQPeifS6SIHqrNMOjONEnJ4YIYdfN3OS0ClOFm3Rmn/pLJ
	z0Gn5N571Y3YjLRmCJ+o7tXvjwJoJ56us5rhhGg3xLT/MEdcVve8WYxuZfiwRdyRZ4yKRpItgf2
	BBPYlN7xNv9ttT1YgbNWisxSd1pZWnjmbuj0kqqrK0+fDlJy3gZeV7A9V0Jt0jZgOtzEI9mKSPB
	m/aFoOwUakicJT28f7XAj6r8m1D/Y40p0pTcxUwHf98VduXr4DjE/q6Dk7+Y6iI5SJWQSs3tfiF
	RzAmor++pBO/q5Rhk2HD/S5GeP9vbEPhqYjCISeb0tNegV/2Ma2vqqErOlMSDef3l6XY623Smhn
	nmFcPi1urT0eoNJkiXA9DGTuaqy43DwPGkMJ1oEU5yjnYB14mWUUHNQ4Vto4L0q2LrRVUk1VmUD
	y5++wk
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr48456315e9.4.1790262812943;
        Thu, 24 Sep 2026 08:13:32 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de187asm72623085e9.7.2026.09.24.08.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:13:32 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:13:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: add driver for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Message-ID: <20260924171332.00001f82@gmail.com>
In-Reply-To: <20260924-topic-sm8x50-iio-max34417-adc-v2-2-9a0609e72f5c@linaro.org>
References: <20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org>
	<20260924-topic-sm8x50-iio-max34417-adc-v2-2-9a0609e72f5c@linaro.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 15:14:16 +0200
Neil Armstrong <neil.armstrong@linaro.org> wrote:

> The MAX34417 is a specialized current and voltage monitor used to
> determine power consumption of portable systems. The driver support
> getting the channels voltage and accumulated average power over an
> I2C/SMBUS serial interface.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Unfortunately you were too fast and there was another reply on v1 :(

-- 
Kind regards,
Joshua Crofts
