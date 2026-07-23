Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB164C8FEA
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813631; cv=none; b=u8j4w+snDH6IOGVu9rzlbB/WOMv0Yl2mv6MdKxhlXFAH80L8y9eEuReIbsUettLJdhseBXIExYnR59c/dMUeTgBeatenYrzkwrLNidM/P9Olm0wzyXT1nh+d6klvPc35lVUKNTI8tdX7bhDBw8i1WVjCXGjwrkJt48I5EQhzSy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813631; c=relaxed/simple;
	bh=oKxRcIJ1Y2mbOTIIbMUm0GdqFhq2jmaFZ1ZxfHdaCSg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mU6uIkTpIXBUYkNhmQ+/cce3o6aNQmGk6dfnYuhnf4/6RcjFGRh6bEjDUazuj1hm5cJQLe1vcpMkBlg04UXsZf2lciXZBW1jc7YgUTykBiWEtB/dcoH2bFRfDTEZQym7ZJO2rc8V6orwhnVSGC3BHQDdyRUb+FJrBWOaXeNmuV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Tpe/+KQy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Tpe/+KQy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954df200ddso4234015e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784813627; x=1785418427; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5IY9Ys2IasBBdDSErNzg3azv8Wm7M0zmsUTS0FxF4bw=;
        b=Tpe/+KQye9jJd9mDBb1Oe2VrQ8vguuFHIAVUqr1fnLGAc/z723nzsMO7z8FS5bGoCd
         kFAhnLmZZEnOFZ7XYCjonYPJbhMDsCSORjpVm1K7V/mcF/tQ54dckIXzaD1BRrCGLWms
         RFFTBTjvS80q8A+OyLSqFsVaRMhy9NleBTW8EleiqJvsCqxfWSb7NDIHPA4XrUlqP4qY
         AR1ziSB8r370xcnz549vwWCym6GHXFGkE2fPrn08TgcOYpuOPTmTNV7H8wgzbDIX//Jr
         wU+xmAuMjMAW7tvfBfNTSZJ2bgX7Ve1yZXbFUwlN1EJEBCsdCIiFLIEXnfdTLTcyJkeA
         GNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813627; x=1785418427;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5IY9Ys2IasBBdDSErNzg3azv8Wm7M0zmsUTS0FxF4bw=;
        b=BrBy+uzmjQMJozmQs819FrgWQHx0oxegjh3f67P+EOJ0SagoUNvMXu6+qERg2NTVL5
         uNtcrJbKu9xrFHAEaGgG5KBGyGxRfRmGPz0aUz6C6F+w7B2UopWzRJz9WrRv7Cv5rgf0
         RQJ0iIyLZdnap+1EbC87k9GWoHeX63X2Rm73GdSqUgjbIt7keuKveSgrttru552yAMLj
         PK4MtNHQvpvVJVbJUw0QyM4Gwvw97ER8mHQfBWdj+xgXSy8GmnQFO09EUwPDeBocBLiO
         mqNo1oIZpnT09a1+QvK/j30ZwnEB5ZTXbvYhiYxfrvfkZH6RPQ6ni6o91Tsr9f6HNDJ5
         Qdrg==
X-Forwarded-Encrypted: i=1; AHgh+Rphmr5nW22UQY+XddQv2PSt6x+58YNwpUxXaYY/bvT+GBRa7gqBaJftIqSlI6oKqI6O35ExbmWvwpnQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqBv1mO5dezuUPZO8HnexLDiT6P4mZEB61Jf3dFgtgdUKw1vY
	R1ee7+Ok4fVXb0j3TLRjdRHBZ0L329lr7Gka9CJfXr+26gPEfZxBvgBlmgRtZIi7MZg=
X-Gm-Gg: AR+sD11liG06mP7tkZeHYOQCkrY8JgamT2mIvZ5Y3ixZ+bs0/3qpu8RW2UaXVnUJs0N
	YWbOQaOiAhcnLjCZr4fupvPgofISZXhUdTOYG4BtyLi54rrTMG4g0zSGIUAUXrN5fvhqn1GqahA
	C970XTr1K6W5CXRhVvO8G2BHIg6RwJywgMGXu5ZExgmWHRJ/0m0s1ke1BzsRZWael6cwJgz3Vq8
	6qeosBYQJKcfZ20Uqyji5jawZWsjsrOHVhEsAU9MDjcJKkGkuf2svn8XsvTUBYu4AGrKBnNm4gY
	TalKjZXxl7H772Qp0B4cWW0vl6Nuos8YcO46oxojvEgBi5VHpkwiQW2j0EtqMA3tkjKlQTghmLj
	g3KO7PEbYLpXCWl6XWjbThtQhgfz8AdUHu4MaSo1LenlDSMGmht7aul/vQelVvN18Fd/uP56iHM
	r0VTKPdZvh3szOZbpk9BEOHE0nSD62PNFtwhR6NJaVDQ==
X-Received: by 2002:a05:600c:3b92:b0:495:680a:ed19 with SMTP id 5b1f17b1804b1-49573d20b9emr31476725e9.32.1784813626616;
        Thu, 23 Jul 2026 06:33:46 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a63fb10sm153054095e9.13.2026.07.23.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Document Nord display
 clock controller
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
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-3-17e5a445a512@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:33:37 +0200
Message-Id: <178481361788.189434.2930238451899661001.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=489; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=oKxRcIJ1Y2mbOTIIbMUm0GdqFhq2jmaFZ1ZxfHdaCSg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqYhg2T1cSpTtpH+fng6Ml1Dhe6bvEEfoYCMfQx
 9xJfyYe7LuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamIYNgAKCRArRkmdfjHU
 RQ2xD/wMXuTpRlyZiYsChjv1Oc2R6Kwuk8qeNvv1OR+bGBPnqr11cQ8sKwAPoOAoMtKUvP8Qu+Q
 5xqE27UGZWASK/fCTkIagPya4+KSbIq+3FGot4P8xIWxlBM5DbF+AUyQsvbryMfiJIPkNaC+KNU
 ltiUS/Qc9O0u0pUTjEvIp+RTO17scyKFrJUyH/T98ZEQz2tHtsbFPMGb8yBlbpUAa4u6GL4+5Bd
 8JyFo5F6oig5W/AyhXyd5kMjFD/bLxPhywPaw8hINCStBsquWfWHSeLd7miP3JWKkctGpptZKK3
 7zF53444U0TQC2mJePtEv8Ipd55mNO5HQJTAeytgUe9We3sCyjYH3C36c1Ggp514+DorDozpGQC
 yq1ytw92EdqXPN7PlEeJCBVmJSPxl7rVlT9yR3j+fc06PlwJr4+hdUF8e4QAr20wJlY/pBBo3sZ
 zvNPsEop/1WeuBYiOolc8LqtMaT0hE+v+jFnkRPzD+nfG5nTNlGi8qEzR77BE7mDZeRXHmyhvUX
 kQ50uM9qgFj+oCKpaCp5c0TUXY0All3oHkzyUMeKF/efrQUelTUTPPRVj5sz8voFyFXrGvcxxyX
 N+TxeN/wNznOE+xO2pWksWHPztQ2y3xG89EAZwvz4rNxyKWB3XXvSezt4QaoZDQVRQHjYR+q1eD
 BcZk0Y2UF6bmVgw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Tue, 21 Jul 2026 12:37:18 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> Add Device Tree binding documentation for the display clock controller
> on the Qualcomm Nord SoC.
> 
> The Nord platform contains two instances of the display clock controller,
> DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
> for both instances.
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
