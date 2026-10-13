Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2087B51C054
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909357; cv=none; b=cS3ZRRjlzZF7lPkQW7kJHbtWI1y+8v8VLF1JLFtd8fIrR7ffgi797GdmrY9iSLnonSUJvtC2C1CStDYDMNfR7YofhWvNuiWE9QjnzwXb8/YgOus5/lczah9LrLxktRKOlKd7elBqT1zcveCWlCAliRRSuNO2eVerWrsEr6JtlKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909357; c=relaxed/simple;
	bh=/37o6SMMt2KK0+yPuVjPvOanQ0meYy2PUx8BVOAv9VU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qUXTUSLK0hn27zGopXxfsia/PLVz0YizGlATz1u/kqdC2q6ZrI88oikAJtcSn7I34FpKsOVPQwGx3xHq7CifvmaW4ELr65hHh+gXXCQP90h86jrCct66fmZnx+vY4Q1Ml5tmaOvfzqLhn/xvKLfZ//I3mgP+uhoXpqx1VkgEf3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyWKoaMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3TUZ8q8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyWKoaMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3TUZ8q8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3SeS442744
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 16:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T10UKbhm2zdtZAt/cofDMRIn3isVZYRRzmc76dZ8BAc=; b=YyWKoaMPHX9bV37z
	C3ARFrXjPW9FwpDeqA2XfGDoBCNmWTtkJWJbvLZJpGEkvTCjlS+chkW8R3RUdBok
	w2MBVXUtXs6WV0kY002MaUmIwLQNBZ/uDwSQIVV9QmI7IBqOvSuQEnX86Xc6aVG2
	R8NlpUwjL8I9sYZFybvk/iu1pGICUZVgcRwLjCm8xU0uPjS6ibYpkhUeQ9yH9iY6
	GNZUzjHg1oNe5j4tjYeBJWler05lzjgNlIHbnlBs1brh3fPyMpAgQXVF/wB1eLbF
	VV1YZFcNqexEqdBnhZeTm32xo73fDM4pfhVM3V+1SI03yUWrOUuQF0DBCxzHtNH1
	KhpLbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71h12c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 16:35:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so732918085a.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791909354; x=1792514154; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T10UKbhm2zdtZAt/cofDMRIn3isVZYRRzmc76dZ8BAc=;
        b=Y3TUZ8q8tFa9pMVTi+4UAcbNwrR1GD+jikkyFq6zRpvkxxIfGYBL84+DnXcyhGVPNS
         vLWslFsRpcMENrW1L2cGGHMASLNbVjPEf5M9fCixIkiuut26Ye1/l9mxnXpnVIJQmA+b
         1WrQfQBI22fY0Zzv9Wopvb0NVW5q0cFQWhKPfbQDcSVzG9B0B2xVfnVZZqQhBtrfUrZF
         G1YBc7wsWJ0fj7n+1SB+5q9/z2bXSK66cWG5nY6kBK8QwLdBKrXCJNWHaXbiX4OFNrFf
         32/YLsweJekZP0IZaY0O8EHNmBk+OrJM0rSj5KeIu+P9HmY1CvKiHdBhyGpPE4cYK5Xq
         YTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909354; x=1792514154;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T10UKbhm2zdtZAt/cofDMRIn3isVZYRRzmc76dZ8BAc=;
        b=diXMKkiNejhGILCxXWwlRKxnGLnt6kuZACxgSJlBbYbDuM3yi+HvdGyGFFadFjU/YB
         fERHXozo9/w5bXfLln8m0xUmihgspWPxDfMT65QydjEFskNh6JajSj6UeMyvHjGJLRpF
         9f0chsb1AAyjY7DPLJxYdE8UGqj4vxL9BCaeyEXO+w6cSnUgBfJMP8eQAWXX9ZaHbpFk
         crqdLA3nhkkc+vIQzXi6CfRWnDll6nEKQB9XvMRx6WBGqOK6pqMPdBHF2H/4VkjoZW7t
         Izh/mOS4svTzxnkH/5bxuznOar/H6qL5PhQYumLsyZbD/G+MVjAk73Batuf68IUk/puX
         9+Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxz4T4i+V7Ag9XJXsc8FqLz3FVH3qH5WDom/HCkxd2OwtT7mufml7B+POeafwQVHNvfOsXDdfLvZQJD@vger.kernel.org
X-Gm-Message-State: AFq9FYKDSvqU+hDtnQaucyM2mH3iKY/bDplKPfwvSMjD8CZsjPk1SF8E
	MtTLlPEQTpcepBKBUCc81mL46PCaNGdQSPVpX569Of84W37UP8exyvTeDwxlvvOM+5b1sPjEnLR
	RrbGgk27j4eHDosEJavfh2C1ZVW1Viq+/uNL5HxBQK02UbM5W2C4kx4pEk40qcdc/
X-Gm-Gg: AYBFou39DaJqF8wh9sDvkB32VGiCUgBEsMrNhQAMh4LgJs2uxEq/jbKM4+ZZkacS8Cy
	aFkPnLX+CsE+j8EDGR2qbLe7kBtVsvNZWPu3cm0sUo0fwRhq52bY2eCAiGPqEeRU/lusHh47EaO
	qJV3sqGilIXjznOwShQ5ixGD/mzSrwulSRD20oxWUpv16IKRwPuz2C2QtHA9EDOXyFIZ/D1HLKE
	eQ7qYFjzYJZoxlBQy45CK/qwylWgW3hgS498ULmsBu+GBVr30KdLFEfd/DMJZmahyEqp/lweIi1
	rjm3u18EcVpgFaciDkEEvVOQ1b7HE/s6NQ+uA0djpFWnz9ybo718Y3c2NDGvFsqT0pRUTGYyC70
	UJdMBGzsrPlvu
X-Received: by 2002:a05:620a:3720:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93ebd2a05fbmr2189946685a.62.1791909354260;
        Tue, 13 Oct 2026 09:35:54 -0700 (PDT)
X-Received: by 2002:a05:620a:3720:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93ebd2a05fbmr2189940285a.62.1791909353679;
        Tue, 13 Oct 2026 09:35:53 -0700 (PDT)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc506asm6445450f8f.47.2026.10.13.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:35:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Make the ADSP remote heap
 no-map
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Benjamin Kelenyi <benjamin@wendy.sh>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001085247.1897991-1-benjamin@wendy.sh>
References: <20261001085247.1897991-1-benjamin@wendy.sh>
Date: Tue, 13 Oct 2026 17:35:43 +0100
Message-Id: <179190934307.2042121.13130632112509363375.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=/37o6SMMt2KK0+yPuVjPvOanQ0meYy2PUx8BVOAv9VU=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBqzl3kgv0HkP+uXeUhrPxsN1adNVnfYKfplRwtm
 UiYGcnShE+JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCas5d5AAKCRBjTcTwaHBG
 +HElEAChxd9Y9VKZA880hfAmGhe/ai7iHBrJj8bRzE+IxB0N2FHWtirqnt7BsNLyb4PADQonp3w
 ybZnIJUP/CaiOmqsQKnLDpPBQ/AOeax0g80qDWtJPwM0mqqQEOG1MVYInsyQjww8wzgJ41W5YJ8
 FFCyJ7t9lgQ+CLlxNI5sdKGwh62Pwt3xe3twYAtvDM6Ombbp6rE8x32SUjJAiUuC648lN7yd9nX
 hEogoMDi8i4IOC5Uj1+7PMdclosz6eSWt4HXDBv1qJRa0PGUrE8F1zivQm/gjS05ZReYlTJWD2h
 0ZBuwyqR0hRQR+Qm3rkKooSqjT/kNcmNhlfJO74XPzJm1PLZ70URR0AHjKJzmfxnza8J2Y5n7dl
 znmi0XkPXhHSd1YXLS+SYsLkFtxB9T2/dKdsQKjEUXI1oRQGa1Qj/zfk5d74fuHpRuto5o+u5OE
 2jQM1SGhNkSNsH11Y58HWmqStABY8o8ecQ6lNVsrVJ5CACRb9bxwRvc+XAv7+2yv27cbMvsZ+Ao
 27eStqvjCJbUVH8+0DmpNKVLBqsp5WOijDEbkFyM+IWoBiY6ZYjndMBKjdP5Lnwh2fOEUVKliSm
 3N2rAiN8K6R8X6Z6gpdX76jgBvguRLyfRgufMNDavw289zapB37LCaZ0kUNbsD5n8bPyOM6QXH7
 hcRB1+6sqtRGC1w==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6ace5dea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=oKKEO0YrVi7KJ4T4WXQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wiXQbYwFC6corngfOWoOgkD4o6s8OLdF
X-Proofpoint-ORIG-GUID: wiXQbYwFC6corngfOWoOgkD4o6s8OLdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2NiBTYWx0ZWRfX5g7+RmJJkL9T
 xVY7qlmWDuB/wCyrXWTN4c+DfbFwW/GctERYqcFX44DD6H+ejfANeVBSI/z6P12oJtkJtmxSuE2
 XoYHBBWK/SPt91GrkQ1ATIFTleENeYm5wHj7bJ0wpXK+7KCA/fPhRlPBbdaaAdbAgs69WDVhZi2
 kUd01jxdQB9sb45hydv+WVMshLZ0uOFkxSFWW2Yj/K6cRPw1bzskobVRRxDNWm9w/BaqXsM+BOS
 0JimWBgVgJti87/CFH3OZYw3I/8ksG45k/GzqZFyJ+4ozfA2dNX0UFSFE0J51VOg+LHt0UTqbA+
 ONUf9O2k10V8s+VubMcAMG1l0JK40TiKRk2rX+ZwWC4RtUCqhjhMcwq1QboaTHokxXNa+OWzbCB
 bMBgdUbHBZmBN8i7bMU8Q+SdOnuE8fUdOIJskGfOZGUb8Kzttzgs67RtKFh/hPrWkvYgoIFjygW
 1wpL3kcPYQv16CtQXIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2NiBTYWx0ZWRfX4h/QwTGUbXwT
 KDZN8I/2uCV6qOQ6VZHWMK6YHFEBBWrBvXqE+2E/Ke55ZF8gibsJm3q0JXknopiXjn+Z0Wym7a5
 PaQux4/JlqCWKczbFuEYxnaNVeytHQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130066

On Thu, 01 Oct 2026 11:52:47 +0300, Benjamin Kelenyi <benjamin@wendy.sh> wrote:
> The ADSP remote heap is declared as a reusable CMA pool. The ADSP has no
> IOMMU, so fastrpc hands the whole region to the DSP with
> qcom_scm_assign_mem() when it probes, while CMA keeps lending the pool's
> pages to movable allocations. Once memory runs low the kernel touches a
> page the DSP now owns, and the board resets without an oops.
> 
> On an Arduino UNO Q (QRB2210, 4 GB), writing and reading back 3.5 GB
> through the page cache resets the board within seconds. With fastrpc
> blacklisted, or with the heap declared no-map, the same test passes
> repeatedly.
> 
> [...]

Reviewed-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

