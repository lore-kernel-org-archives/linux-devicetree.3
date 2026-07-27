Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A3F1A681B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165318; cv=none; b=BSlxtrs3KC9CmPTtTFHzlUcAQf6Q+n+HvUEFza+5Y8SYbAW6piXvnCHpIGQqSf9bdh1IKOCtpRyVqG00IE21Cn1hrGh1dTuZjgZ8r+xHh3qAIwrdV/fv8ivKEabVf4VUTjraINXSaOeMt+5ti9pikIrkual120FzxbOw05gSDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165318; c=relaxed/simple;
	bh=YR6Gb0FwXaJXKuMRwNlLbb7mMb3G+V3mgOaBnojVytk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aYd13C7AcUWNR4Q/V2QOafSFYzGdH4RlAP5ugIjQptIot2hRg4dULdHXrMZ35fY8HnabYAxkiiqjynfJoI9xfmFS+zj06Ml9RUBIeH3Nlul5rRNWB/KEgn7jjSKcjJnbduoawKySnqvq0WCDm97fUrk0bnHPD22ZeJWlQYVlkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Byqlwm+n; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Byqlwm+n"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f84023916so2834437f8f.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785165315; x=1785770115; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mcPSzkAooiTjREtERSNa+N36b7IKMKBSaMciJbx1iok=;
        b=Byqlwm+ndqM0Lw9iRHydmPqH/EzaPOQWCll8MqbvsZMNK8FZ0J1iRKnkIYbhjhSTWd
         Jd4wARUGZ092kDPhLXmsOvrDZ3J4Z2I9ZACcT/OE4jpJl2Q4vy/h0pDmtBtN5+yKV/v7
         jwyo1ooi19FkH2RUvE1X1pCoS2m+yDbDivgp+Wg6Y2GiUuWc8NcLxoeEKwTsB9HZlboD
         IX4r25ciAq8jw0WHSjxb4FGRl+feEiyNXupN3xsBe+oj2FNkugdSfwqOKt+7T2kucU93
         XExC8In7SGW0B63/SplKF3T6rWurBObidkNBhh/HrntKdeewjVrdYhrsDPFU73VQfTZ2
         v+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165315; x=1785770115;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcPSzkAooiTjREtERSNa+N36b7IKMKBSaMciJbx1iok=;
        b=V5rSDoaAICs954kg1Seu2jtDSPAW37JCNYZeVSr7x7+8I1WKb5badh3Os+C86d+ZXK
         /agkH4Mxy9hDVjq/LsLs0fjlV2HKYxvVoyqp3q0oAYik56kvxlu/0RaqB2vriBN/TRt1
         AuKBGyf0hQNoiRwvVr+IiJt8ep0nW/pBvX0jrscs5GQ5vC7XYEssxmK8yxmhum+Qmh7p
         ac+9A6mpTHX/DOObMYMatwf4S+K9524VHS/DMdNyxXAK1bwDLGX63QGjmAL/uFNdpKmM
         KRovb1TBqXmN1FNtnZPhvqAJM14Gp0oWWA9CCE51+eA44vlr0cfhpk9uW0jQ4kcgEMCV
         IBPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxXasvQTDNf9i0+7EkGvnyYTDOEu7SzwrRilW909rpzeGI1mQoZq7M3BzpM0hyG2oPiqPueAOulbYu@vger.kernel.org
X-Gm-Message-State: AOJu0YzW2o1h0QBNg3HoWTuyKKutos6tacbqXoQf5n1AV0oqZrNTNWVa
	maEfVy2g7AgCuwDsSUzWJ7D8Qwlj8DzTNsC1cBulFyPJ2j0fGtrI4VBL9v9RS8BUhZU=
X-Gm-Gg: AR+sD10BfRB0YqbrmZR3ftIU5zZuxGIPrTQHh0IcYv0rnx3OP2uPCyBa5nXCUvhtw14
	2YgKs5boIz07AW6oSX/jPls+ef7JrZx4AOz+lmpH7nVs8URPuIgwXeG2LCKmTJJpc46+t+1ubV/
	2ptDWusIsK3A5/8uFcsgyYWUUEtHVhtWF2WZKbHMYsy0asjaASSJFUs5gI8D+mU+67QJtGMP1SV
	SLRp8DENSDQmq3Z9jfmpk8PzfF+Gjwbg2o1g/i2MNT18y0uB8MvGd1g02PxagtMxOa3qf+wMdbv
	CCy66ENeKawMaSuGigFpAAapxrYhVLtXJ1eS4ETaO7FTpazhN1HplCBOBdMzh4iRFo2M74ckaiV
	Ghe65n8eOGSKxueaXWIvlso/PVuH88kraFZIyveGMLQ6byKTd8PCCtir6lrOKRoi1uhG4tXydea
	ySWPU+6NEQ5+iZe2nYoJ/zCDEmzxaPxi9u6GlgZpCyqw==
X-Received: by 2002:a5d:59a6:0:b0:47f:87f9:6d06 with SMTP id ffacd0b85a97d-47f9fec332cmr12271873f8f.61.1785165315467;
        Mon, 27 Jul 2026 08:15:15 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm46580760f8f.10.2026.07.27.08.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 5/6] dt-bindings: clock: qcom: Document Nord GPU
 clock controllers
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-5-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-5-32b45232217f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 17:15:05 +0200
Message-Id: <178516530503.342148.14086284982574726669.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=455; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YR6Gb0FwXaJXKuMRwNlLbb7mMb3G+V3mgOaBnojVytk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqZ3X+kr9MJGSM70ASLoPwps4OdWz+npSoS1qbl
 uyWZbziyp6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamd1/gAKCRArRkmdfjHU
 RX7BD/99/Dzvrhsiw7SoR4khTznSBGBRF9jRX7tiwbrqDDgO5UbQ0Ut5SCKHPFD27vvy3zDS1V2
 N7WHA+heQBJPQZR+529/08QLXXYj5VdGIFV1wPEqV8hRp6PX+VYz7w8McLjXjJScMnYmODqldOy
 9OW+LJCPUGGZcPLxNGO6e1h8tM8LuLofRJkWPqNDrqyHoVA4ghdNHKBQ1JGkN4CHiCRY4Y4b3TW
 /ZE/ybcSRyN3STtR22NlTHQ3Ift1E43QV2aCRa0ckfl9MxqBJ/2NaK10UFDmi0LBze+ubyEIk/l
 5l0ikI8i4o3MWCIJ3KtU6B0ZjnvWQOho0s4DnWBLGMNZNYLYaLI6uT80nauSS4fgVONTSl4cxY8
 ha/flSZvbZLl1KuEe4yn+ILAEk6nVHP8rKhW1cmEhAqdjfk5ZG+xcjqFr/B6FNpzDtb/FNHl4jO
 696a0gtYG8CoiNbIcLk7S9SX7Nn9J8zhl+hi7LH71E5ZI/zNfnz93h/BEEdGnWvexrwMg2CpIiD
 h/tIPdz2/R5etwPhNYzpcH/VoltOaIBxGaEe+o+xonYBFS1uFFR0ScdNg+oOQOpceA2NBL39sC1
 dyanS6Dq8SXZtLIGcuOvCheyVJejTGrgzjcP0O7irOt3CQUcYsIx3Eqe1KQJlSajTWqZ86ONEg2
 TSx2rRJQPsJ8N2Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Fri, 24 Jul 2026 16:25:09 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPU2CC. Document the compatible strings for both controllers.
> 
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
