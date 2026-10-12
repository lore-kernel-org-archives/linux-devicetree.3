Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523F117DFFA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813681; cv=none; b=bOT8LjBIZIOn3S8zG0WgNRS3XkcH9WP4ksDY1CzB6C7oDjj47EYBj+BqDGeoFKHZI6bnMoJAthYsQ2MUrMqT/PJAjlUeaOQ6lNByCz504boCc+oPID+STsi/Al1kOcqTmp64tnsHWFNBKnlsbWz6MOZrscnhrb1FKUVIjLvcW40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813681; c=relaxed/simple;
	bh=h9ZHlYBnFxfOVfJ6bovB1kxbNgqL2hLqC4HkxiAFUjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p7Npf6pZLNn0ig9/LEZyC1q+1APIJ4RdvXVmG/1Nh0u9lXiCC0Sx2bUdm2UAUJT2d4Hp+F3lsCavL2jOqnygyWscICNGx9s8M0VOmFA1UlBj1LzG/YX5mtt8DEeJrkAt2a4XZo2aiPv/PcGUpr46qKS4DeAxHlq61euB+74czlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJc9wUbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8Fb7FCw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJc9wUbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8Fb7FCw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07dp1686158
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=; b=FJc9wUbblKL6lkTo
	2aUKPxWhlauZR6Iz0thHESuvtQAiqgyV2cIqZDWwoXxzlfbVt7vH/3I90QXq2kAz
	fjkE/7gjaGiMOldclHWCw5/e/iH3yDpK8oRglBAKsWEa0VQgAFwNWeVHEuuY8Ehl
	8udZF3fpsSO6NgJqoQ9ZuvMFMGzjYPUojAfo345g23FLwQafAY7BYdDmARFpd+BC
	np5mInQLQz5yU99OhV6Jj7t4/pLf3OtHno6Xty511sA7BPKN5uZt0WAN2auyhlOe
	BmcyhU9bQ9LGpm5SlzhEFMR5z43f9L6Uapan9pt6xHKdxx8pFoSlXtaOIsK0jCFQ
	nz4hpA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc12st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:01:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98929c3b03bso1649356241.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813678; x=1792418478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=;
        b=M8Fb7FCwI3Ko74on5iJ2OU8Ic+62+4oApEHydxbyDn0NMaUme5dr36/48+2D0PG+NJ
         cqu950Xx6ker3tBjZvLkM3CTXLvyqsM2dqm2UhzQ/Uqs3PEG/Bthsq/J/DCM8L8kGj9C
         16AJqm0Wu8uZ6zhB2XaWe9+k+JfEjUtb6gjyQRUvB/I6MCIw9qQrGjDZx4uNIbCG5A0d
         ML9c3qksi2VygKd1LSJJP8amVuCkA/Ulyisq7xarhNjXE3xDaF6tWvrWMc/CVHuLIW7D
         mIYL5IA103Ohjw74Dbtareg3M0Jd11BbkNOadBoW/Hf157MMm9gV/1yPesFY/s11QFBQ
         xqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813678; x=1792418478;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=;
        b=BGxtgV1quFAHTkewn2CaMQmNs4OKpX1u8YYmxTmXXDLLnXIYq4nMudK0PWH+2te7l7
         2+6RsW0Q3bpN3MaT7aUqJnK43VOEW27Y9mb2ywmHr3YaOPOT+mRDpaMYMIsA2v8dG2jI
         5ONwcOugEtBhrvrok8X1t3nYi2uQmz89k3I2VEEjXv/csAmvP9bdsW5qRk59J65oXTBk
         IJZuKVAZIz96LywoqlyJU7aoBqc0G2yFz0hDTrZ9nVSlFx3sorZ34HM0HoYx12G+9hYh
         pZiA6/MtijG4zrDBw2RCcXYttFwV6CwFbtErHYAiQjaXaJBXfqtsOHNafJbZcWA2js3L
         X1lA==
X-Forwarded-Encrypted: i=1; AKwUvByuw5fljwiWK2W92OxMo4OFEOOVNVlQ5ps9jqFpPSO6YftDpVtf41tz02tPtrUi274J+Dl4XYWKrgDq@vger.kernel.org
X-Gm-Message-State: AFq9FYKrX3adYjCrjC837TEJJwgOC+S7KO/S/R3a0hO6SCdjC1+f/Dnr
	dP01SYyD9A0g6TIi5grpQhIRCyVluflD7qSAqbVEwk5vTYq7nPAQEK52PnTF0hSyhqedMrK4kwR
	BDaT9l8PWERLMmtVi1C3Nqz9YHmog/tEOIS8uA0sffktnj4ubhfnPvojATw0S/28l
X-Gm-Gg: AYBFou1S/NWkPY60cHBBysiQtXbD74XpDq6In8JkknuyuShn64G7D5WzQlvF1G2zNi+
	RtNMn8omwQ++F3xiwRWEiju/yf4sr5QwbxRluahPlAhn8UhOwsUV9T6SgOXh5tvquinw1+b+Bab
	5+PrtnHdXHTmcNd3vNbx1Ni6kZiB3ONoquZlFPIGoddX/9sReH9IzlBjHclnjCTVZg70sTRzSLB
	x/baJMN4XnDyyF2l07udXNo7jVqJ/8R1aX8oWG6ff3gFr0SKO22DuZBP6QnS5XBZFwnknNqPUdl
	d/7VjtdijfJWracJY8d1ULt6EIKMQClHJB8A+IsnIYe350gs+6zffI/bMb74Ucr3HOnG0Jh0cmp
	KMmleoRIKKUCrOy4ixTK9talNwtk=
X-Received: by 2002:a05:6122:e14b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5e91f483a33mr3001074e0c.12.1791813676313;
        Mon, 12 Oct 2026 07:01:16 -0700 (PDT)
X-Received: by 2002:a05:6122:e14b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5e91f483a33mr3001028e0c.12.1791813675799;
        Mon, 12 Oct 2026 07:01:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd3aasm19101061f8f.32.2026.10.12.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:01:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Igor Velkov <iav@iav.lv>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rosen Penev <rosenp@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add the PCA9655E GPIO expander to Kobol Helios64
Date: Mon, 12 Oct 2026 16:01:12 +0200
Message-ID: <179181364592.7692.13657409498098359032.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX5zFMsNfFEbwn
 0wO4MBDsueiYmsI6VlWCp91dHUmrsYkz7kx0FtpQ8vcKGYAy+O8PYTpFi42uij8sD2LtvaDc2nA
 1lEdncfnGZr9AiK8KegDHFqZs8sB46c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX4jUhU41gATVj
 NMLsBsPOCQ7kH+xQvUCIA5l05HdHXUZuE8MFfaHB0ygV1Zp7NSPH5RF/IsPD8+iCMK1Nn6fVz9s
 hodUjOEw6MXCUpfo2rvk709d1Z4akQSRFcaWJTI6J/0LUmw9xd83uC5bBVjyd/7hMkttzyYWGHD
 xCazIzerwL4MnK4iW7Q3HINWnWaDK9+GoCQBC+DyMmVSBg+EkQn+mPJ7/iDeyd+mtbrNPGJ+TSD
 izhURj285IFl7eY/v87sGNjvawlNvMzPIv6gdJlPy/qIPB/Ozk3htPqHNxsZ9F0Ok7lpAeHt3f0
 599CdiovXDCbPNo2Mks+L0Z+qbc8omShAhuBvMbANbGZw4oOjTQoOoABCBzg8vMTnHQCW2u5k5Q
 HqinjyCkkT/SPNmneYGcG+lk7xUObK9aOHB6GTdhyvL9ofIolpAsgnsZjtsRce7nvgdZJ434PMG
 8glsUhoDVqlCwP4knPg==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acce82f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zK-fWJzOMMApgNEAF1kA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: VLMOQZQy2-xG0a-I4IySEYqYMtAeAIkl
X-Proofpoint-GUID: VLMOQZQy2-xG0a-I4IySEYqYMtAeAIkl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120055


On Fri, 09 Oct 2026 20:45:35 +0000, Igor Velkov wrote:
> On Rosen's binding v2 Krzysztof quoted the "onnn,pca9655",
> "nxp,pca9555" form [1]. This series documents that form and adds its
> first user, the expander on Kobol Helios64. Patch 1 is for the GPIO
> tree, patch 2 for the Rockchip tree; they only meet in dtbs_check.
> 
> 6dfda7947653 ("ARM: dts: marvell: armada-388: use onnn,pca9655
> compatible") in linux-next lists "onnn,pca9655" alone on Clearfog and
> Helios4; with this binding they would need the fallback as well.
> 
> [...]

I dropped the last sentence from the commit message and the Assisted-by tag
that's going away.

[1/2] dt-bindings: gpio: pca95xx: add onnn,pca9655 with nxp,pca9555 fallback
      https://git.kernel.org/brgl/c/356cab616b6f07a06c2d279fda8a9ec928fd5fff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
