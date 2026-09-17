Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87544908BE
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639012; cv=none; b=kg4CHYBzbSl5VF5AnH5VIBqbFPPln7Ucf7iiMuxzDAeiIuepzQ5cD74lW4PjZXryIy1uylgKlioj5Th+zVWY8xJjm7EEBuBh9YRT/BTbA5rbRety3WksQVzbY1C8lGBYoXZlwY1yPFqcVrzfbfVdkDG3n3WCtZsekx5+eAZS98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639012; c=relaxed/simple;
	bh=vNfsDwKYooX0vfo3ekVZN/TR/vUknbQ5hnS58EH0DzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvja1dBiHzT+k1PSYCd8VxrCi5FSG+R+Qz48Gw8PVzT+ELgQmmohXhyKSobwjo6lS2tTsedzFLl0TPqDby3bifHuqobeSjTK/27KeMHEPE41Q+2COTFu65g3JVH6X+Yv2bjXzfoJ1fZ+U8j6Mg4hiSBzvkb2modQ/sTJsMylA5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GZpoQXyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQtyLRJk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GZpoQXyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQtyLRJk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zx5H2211131
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=; b=GZpoQXyI2GpLiLMg
	roUYsDFcANMLND2W+ZZrZlUd4vvKdQjHhPCmJVbG6eg42N4yRfKFzafb+L05ir7P
	oP3vcD/TJLKO7oM7pRe8gr4AZOrMDoY0ibpp5QtZsNmLmq4lKCTPO1C/yfFcr3MF
	RCzFZ2Vbhm4R7PAVVFcf1Jn9BhMLTNKTaEzIb99/Gsp462wVOSarqHWeH0UzMehx
	LsocdEjcT3fLNgL+BQMWBh4fJ1UHdvn9WqO7FUD4X3822JGPHwDpJIRtJu0uYPRf
	GLH8REmO7enxk8llRl/sy6doZ6eEkL3gbFa9gSdIg94jE3JDcSpnh9f8nT8A1t7L
	e8kIgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m1nka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:56:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a05d645acso137185485a.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638984; x=1790243784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=;
        b=YQtyLRJkuzsxrIj0SkRvDnLU5OReZ/n0zy/V6PWxZkxd9C+L9wpWj/CZf9LSfLSIJB
         INhOdNSyk8s7S7O4OwRIQMyHyiZeJ/j9Pa/YK8tabH34moJRDOvvh4V01b4QtZWwjb7o
         Vey4c4NSjp+9HghkSgJK5nSUrQUoGcmM1rHHb7mXKMTQRujuX+rF33p7ckuFdBfS5t6I
         AqlY8kOnhmCEG+g5OzaICByeIUWmJDcB3WioLq7/PAYDQY3TIySgCEjUvfW9lpbONoHy
         FcAz86WpK0/NTiapwHNEWns31QGrBJXWZBHYrwQ8gMJzu/TgsmvMc2N36HCsuJdfHKDU
         EDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638984; x=1790243784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2X5rbhkv5+LAojG3ViIo5s8m+sLl87YGBKDP+uClpoM=;
        b=zyRgKY1l6rNZMKBba+LK8Wjn7Ao6H3DC7JmBXCMRGri/UuPQkAYv6zzoSHi9ARNa7o
         6iApAO72pYKbjE59ftotUBhDMGnSEN5FPC3xJPhsicGHagpQ26fv4R6DSdQkslcbmMJd
         ilcuyqqjs/9DKEEM4g4lNAGP5Z6eqkIaPBz7uXomiTDl/qq78SwoXSOEkKsdLKGvx1+a
         sWTdJjN8LUya3oGAe3UteYgA8NojIsZY0O15AM6q4ltP/Bug4QilM+xRsxVA6HzqPRxR
         miHrLkzNK2aXnUlIeUDCybmJlTF1pFuGzMYtCCP+550aY3IzJUBc/rMvqdkjD+R1Beew
         deCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOpgStDO9NlPuTQbmxXVRvXA814lWLFA2qRMyJ9WYNVGi12qTl3Q6LS3xJISUR0VbT4nPBQrLtjrav@vger.kernel.org
X-Gm-Message-State: AFuF++nxAbg3EWdTKvgJknyJ0vjnFhs8fKHCxC688BteLb74WKOu8Q01
	DxUxWzhSx5urAU75t9ie5FPW/0gzNRnnvUYiMBdmZOPZNQIElAZQMli/569UpqYyIIBJrIAjz5+
	ZeQylrTOySiO+OcWJ/unJwM9rUzI7BIBoqVjnnJ91HwgWWqYOtsxnR+ZsLXJia+vD
X-Gm-Gg: AYBFou3ok1wVRWvS9s9G6c7R8Xepoz45jXc3on3pH2WhtWxdA7Tt6G1Ptpl5DAYOCjO
	Kb3W5mLJyJyO+r/1PGmB07QlLbfz7Hq3Eh/C/sEBa9PYf3+s+NDNC6z40gxoOIZXfEDMCVJ0EpM
	sy7Isvodqwfy8mKHvs/NWwTQkgjxjTWKUAxcxTa5AWX/oFjmoYGBFAmeVhfAh7Dtsm40z3ezqg8
	47hlXlYEEy0n85B/BGA5uzfgxunkr6m/eViBrXgcU4ALWtUMzGv9qdeFISyE6KKTMmX2MC2iNcz
	IL9FhVvJ9Z9m3agciQBoZQvk4ZOOlw5bd9xkUEgJxLDIaqIdeB91yLgoYwaspIgRFs6MA9yccx9
	Vvc7eXIMa7x8aZGQiqADlKmlEelc=
X-Received: by 2002:a05:620a:2547:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93bb7909a8fmr1023014685a.40.1789638984129;
        Thu, 17 Sep 2026 02:56:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2547:b0:93b:b4e0:1c89 with SMTP id af79cd13be357-93bb7909a8fmr1023011585a.40.1789638983683;
        Thu, 17 Sep 2026 02:56:23 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm99701075e9.10.2026.09.17.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:56:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
Date: Thu, 17 Sep 2026 11:56:20 +0200
Message-ID: <178963897745.8494.17988648370615095613.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
References: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabb949 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PEkeK1Ut5SyvuImKavsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6Bx43fUprAhZJt9abfj4cSqVg-iDS72o
X-Proofpoint-ORIG-GUID: 6Bx43fUprAhZJt9abfj4cSqVg-iDS72o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNiBTYWx0ZWRfXw2LyGSXmeugc
 TK0XffpUtuCWrUiImWk2BP94x+CVxHSuOhJLS6pmTSfW7oojBBn0t/ra+VkRsKfP/ssHz0jDxEl
 91qqmzdW5bbzknOXLSjeTFqR7Kw75t3PnW9XaZnDnJj8Xdq+rwkBS6lFVOgBDP6P7QSntuwLglz
 aic4MWiY6+lT5zXJZOgcIfKX2S2EYxJ/TrReUA9nrJMFBXNPy04ZcpOsYuPz5RFoYerIpeX3HTl
 hJ0KY5KQ3WQVsCQEkLz82urD5HBeiDVkJeIkwh839QfRzAIjY++OQUTqPe41lh0EujKWA1Fhl9K
 xvK522RReGfHyHRULWwMJztPYK6EuG4gVUF2HewkU90EyFw4LC+jGgZhzx5i5+xi//A+NoWuhOX
 8D0Eik81yR+g4djWVjRtfOdT+FaZbtTGcQgYUR5agiNToWPNUBzMLDduDxZjLKFIciBNRHMUkfW
 DKm5lXi4zUjsB6ssxyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNiBTYWx0ZWRfX8ItMHdzdDRrQ
 Ed9wpG88ovTttCg/WkXCDEC4Rz3S4krWe3gzN3tqlyoBYgKiEOQ9bjfMMJ+WN1da+JEE1gdiKsN
 nLrfODkqgnzsXUJQWR2pna63Oq7TjVc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170136


On Thu, 17 Sep 2026 05:54:16 +0200, Marek Vasut wrote:
> Document support for the GPIO controller blocks in the
> Renesas R-Car X5H (R8A78000) SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
      https://git.kernel.org/brgl/c/373c23eab4581c653e875257b72dd239fb64b738
[2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
      https://git.kernel.org/brgl/c/79ec1b1b33242fd58865a56c1565be5c1de0e837

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
