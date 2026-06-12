Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636F93DD85C
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268064; cv=none; b=Yjtu0nAXfK/faJMYWjhFt9OeqjHtEhQezpjv4xFAzPsEgXoRQa9miLJLsOWkY8Qlp7pgI3EqGxhsFD726PcM+39WnQUnffWBRoEMGVi5zjEY19USb/DCFb/dFwms9NfMl0w3mKZwbiYUftZw/HElK3ZYv/gHHgEACAYXeW1Q7QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268064; c=relaxed/simple;
	bh=Ju5wslSRsvwhk5WsIoCvEoMVc/9GYY2hK7MaGnkp3m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYNalJQM5GSrj4kjuTz64YclqmysiEOl1Ctp8/QqdmtPDFuMO30OMuUoiB92l25EG52E+SfVZPoPm65K0lW4oEZsfV7/IM8K04ml+QNkAqM6oYqcX/v4Fv+U8bEYaprUaD00iZFKgK3dWmboVST3WbKhY2aXGp+UfdKK/cQe9CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0nEZuJJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0nEZuJJ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso369301fa.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781268061; x=1781872861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6qY4NpZ30oPzo9/fz3bRiZ7Tbc8aHKKwIffAI9M1Bw=;
        b=V0nEZuJJPBZEVohcRey7+kwB5rD/pDgVhUguGCMEZIPSJGhaY4KORyBlbr/uXtBasC
         Yq6nggKWLrKq579Es9QD6Rws9rEqvDDHz1UsfSnZJUzgGsibIV2RxA8sW1ReB3diKDGD
         LM5knXJheYf47JplRUpNG7UV/gKhEE41qOncd7VJef8rNGSZJMYjNaK/QkWvlpq+Ur60
         c4xTT7KsjSEtM8Q9hKNnW2Oj4c298HP7i1oMLyg2u30U5xjcjwMfGl1Nw2TEK8Vtf8Zn
         MfOYFixdfYzK++oJVmtoL3UGbm/RjGTsVrdl95qDApisCkWYWQbhvQFrdUZdmYq68T2w
         +jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268061; x=1781872861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6qY4NpZ30oPzo9/fz3bRiZ7Tbc8aHKKwIffAI9M1Bw=;
        b=FcMrQZC54LenN026BbVYtoAjIwuMqCkdcmfj5h3LRz15P+lnxnH4cE1xSpgECijWZ2
         5wN7/DqDzFKxXGhYiIr8oErWyZ1svOpsKkGOSTfpUQyRZYswfkFaRDnbCpE/C+ot4wVi
         ffyACn0Nb/Xu92jCEUzzGQ8sCFdPPqVpHzgm9N13OFC50DtK7XguY1OlqdR3jCHl3RIb
         8FL7EWfXfd+GPSZmmDBcBo54CrRBWeH0YeQxLqS/c+aMbCf6ougMfJ5a7WUEVC8S9+Sg
         TY10cjrzaBQ+PEdJmi//1K1K2znC03ycSwwwoOAweynN5AuJ453LSXZo69vzIFtf00CU
         M7WQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ei+fCjZB2aLY+JQ5BFzVnAaRsnSlh4EiYaTkJTrREEW5/YkbWeYAfppAkPnC1HRc/GVzGMlyB2Xsg@vger.kernel.org
X-Gm-Message-State: AOJu0YyNbfU/gd2ikNUHFvWUTgGClA6nXdZOv+clnXWIL/rK5q2/UFsV
	zFK/sACi7/zxW85R/7bCLEYjXkyvbYIZXT9EeOZWubRQ1RMKfnXOKIA82e1dI3qLPfE=
X-Gm-Gg: Acq92OGUZStsQZcLAeM057OKoWcxDOaCnefU7K0YOtjh8MB+hi7B/9uj4x6hcieNbhZ
	rIFCTHqegK5qAp4lAWuuP0RaXaKh5O7qORCE5k32uoQkCBqFj72GAY/GIFFRIUZXS+9K+jYVV7Z
	bdWIGfziEZC93gBdO6d8HnAH+jeh9k/NgsqAykyhkjO1haBt6kKhaCy/SUtjVYYYKownHuLFqPB
	MSVcUthByU4KDMYo4F7r+Q95Lksm4XwHfWLa61M/6En5NfwlWPxroPKQm/VINMNluEi3yaxNca/
	sTnAlGdQDcrk5sy29YMgsuo4+FSs4WK+ygDoWGvo46MY0Hv748S257cofosSaz/Yf4veLJviWn0
	3nKCAZqBxY5hZt1quZNJojugQoQTzBjL/2j4RW5gRTLlKHtMX8KVS6B+gfOzYZiV3ERz9hhuKAu
	sCJJ8Sv8xKl1Xz4fY6j5NRKJNcosz28x8tiqnWx2WQm8a/0wJlkXG+wS+hV+9LAg0bYd2AetvXq
	SAOhg==
X-Received: by 2002:a05:651c:984:b0:393:5904:7411 with SMTP id 38308e7fff4ca-3992b069ea4mr3516121fa.3.1781268060501;
        Fri, 12 Jun 2026 05:41:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29aefsm5863241fa.1.2026.06.12.05.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:41:00 -0700 (PDT)
Message-ID: <b1d23af2-a431-4d42-86ae-77bc4e528768@linaro.org>
Date: Fri, 12 Jun 2026 15:40:59 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 20:33, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
