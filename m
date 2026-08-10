Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348239BFEC
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361894; cv=none; b=NO45yao4/b/fbdbFxu6DA1jFGZ0IyrMMgyzhsJvwyZDq6KjyEyirWcHczxoKm/AxculvLsjZ9jOVTnnY63OvxNnBTK+txrcA7Lk4QdR64O+T+l+4TinmRRU8BA6ieJp73lbqxyd2hezXbZnbGo+v3ShHjx8T2ayYJO44Uge2Fc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361894; c=relaxed/simple;
	bh=OzXzl+lD99epasl0YSqsHoDtOCmD5hegMMxFKY0OcF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWFmqpdnwg7myi6EZu5Cu8OUSzu1BhnbcXkLcP76sgYTF7ajQiH4aJyWCRw/bKHnQZMnG080VWPF+qgeTJp8aLCOnk+W6eUetjPjTS/FZMdOe4+h1mgi+ewaJmvlkCEsCfDLCE4iSrh+/ezf3VuW3CambmpBZNtBFU/pM1V2MRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbg3AcPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhXvMspj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbg3AcPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhXvMspj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SLaq1167503
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=; b=mbg3AcPAiU5wmwtz
	hpVcMcuEpoUK6DDQftsWwzPCSfhxLYIGNyJnIl9PZHKBuRf0NR/nI4T7khqn9P45
	Uj4jhIOQuN8NkKAUOwk6e1fk3aUWJsLKGcuNRaA3dHFV3QTHBLEAOJD/Vkh6KJXG
	PB9ZPaanYvvEB6xenjN3f0dEC0EKgH45XQgE5wvBPFGpMpQW3vttFr7okaQ8lnr0
	fYIQRN4e/0WjKMkREPUWncca/wyJ6tZf0tJudcEl1uo1Z9vvzGTe43B7Wa/kROJK
	X5bA5/dUtKpTo93iZN1urCy/g+2P2esN3K1wjIoOjv8MPhEvgoyLr05NDCWtJCYZ
	OhLZvg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhh9kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:38:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so20701441cf.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786361890; x=1786966690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=;
        b=KhXvMspjFDzLEu2UgPvrh8MCo1Yixo6ufwJIe/XxAy59l4L5fhbBw3EtJxt8uVbcmZ
         2BIfIYMxnWUS6gtg9Sh2JkAJNcq6HtFt9wiEabuR9oyQ4m4wnMNrn1DYiiArqPnlISCI
         rdFHm5E6/9/OuSqxQEeCuQWu5GYd4FXnLk1pWFuZIM7pL8lB7CSUMef6xpY0WOohHclM
         fMkuipdX2mg5Vfq03pjQfgOv/jcuucdUiJl4acNKYS1dmzRDz4q+Z8FP4wZc7lAtnG4h
         VUsTuHFJQBpnivdfD5ZleXQlAaEmm0dW6x7O4NhBImIIouK2dV6OTSV/53Hnv4Le37mq
         h7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786361890; x=1786966690;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lHwK4kYGat+g1OrVhqOYmlqdCXRt3E1v5I86m6bCA60=;
        b=C9OltgSr1ALsSoriqHa+Q+Ix7Iw3OyjVUnmciH9R/uAdpG9RWh2OtidSuJzp2+1JFI
         D2HuJxaA1cWNjRZxQKg3DDVIFwZ0446rRGG8gjLRyAObMcQrLc9at1uGKCEuP9YTfIuD
         hW5eTVt6nr/Pxa1jC3YcW+t21x1XVWargHebXagwjnDRL36G2eHmn1xmgoTXRoICgGDo
         kRlHTk4CPMF0B1wH8vc6GsCsNe9hU9+BsKHWEDhzE+PZIyBvRqoT+IKTI5e40FWavFfT
         cwpevUzymWD5pnn8SM0GSNbPfkcQLHsUF3AiemsFxW+V7jfGYy1+8LsdA6dye4nxUgMp
         TiXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWLYVOyviuRPfuDQ41ZeIp7qkkE1a/m9Kgp6OJSS59/42E+5aJOdudAr2pJYXg0pFevAdU8NZqvtC5@vger.kernel.org
X-Gm-Message-State: AOJu0YwjyuM3Iu8GEhB539UHXkdMOi0mJYU84pFxCvoiTTgMO7nDh1IY
	OnM3jG6k+Lt1bsuM/t6YEA8Z0e2Ss9jKpxpNEekisPNRQVmpGOJoPNuKWvfuwxKU8RWomGeSnlr
	RKue/AoxpSinJI1NNwKnzU1j/6RnQ26Oi2ORES13gBl0+CG7jjEw0UHRlv8zrnOuV
X-Gm-Gg: AR+sD11p4uZzcoUZzSO+KYhKeB+Nz721Rd1+BUi6aPr449eWtFsJ1jokT6q7++Yb8wc
	w8Mg31pHixM2vQfZRZ9uo0H6OhykQSyF/xMkHVqh0RR8JhqndrbYgLTUJvn1U50O9kuOaedlFQg
	t7Vysb4PfhmJ9S8j2uK2EbpfA5noQ7N7k29gJZFoYq7IIJLYwi9diiAbC9LlS0rJIVv4+Bx6zOX
	7t3TwQYBDk6GTEOd0JIh/s7xMzSqCG4tfSh9mWm3D/O9M0fmZkjA+A9xxmY4Z+NcuBNFmZ8oL17
	PzwQ2xz913dok6PxODZPzvecZKJ1+euRezK98zs5ogV98nlqFoqYBlSHAnr41U/z8MNwzplEhUD
	j5JYtDGapkncNIp29g3Je5rwI8LOQ
X-Received: by 2002:a05:622a:5811:b0:51a:89c1:1eef with SMTP id d75a77b69052e-52d4bb7c7c6mr11211101cf.14.1786361889595;
        Mon, 10 Aug 2026 04:38:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5811:b0:51a:89c1:1eef with SMTP id d75a77b69052e-52d4bb7c7c6mr11210361cf.14.1786361889104;
        Mon, 10 Aug 2026 04:38:09 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145589sm36117311f8f.1.2026.08.10.04.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:38:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Ye Zhang <ye.zhang@rock-chips.com>, huang lin <hl@rock-chips.com>,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/4] pinctrl: Add support for the Rockchip RV1106
Date: Mon, 10 Aug 2026 13:38:05 +0200
Message-ID: <178636188265.27644.8818691655755329598.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79b822 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6BMtE0E8ImWS15-xy3gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: y0Nti2sWBWl5bv8HwsckwhsIw-K1WMi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfX7Q2etYLavBi5
 Ys8L6gHiT0xyl+zLkpiaLQZs+eHekdEcaYO0bVv73EXKhRnd29ID4zdfaUJMGIqnKCr7B5Z9QxN
 esEcIskx4lKQd3ysasK4932bkXjjHCRN1t15hAHCfuGXJMyhgTTXSYUCs+UEWJqdytC5nqzQSdp
 Ufa7YyWjsDh0rduJJ+T3huWxuj+x1JOmS7aIezJ3P09fdgtBZNLfdvYoGmYL8XEzlXqglNjq/4P
 C9pRHh0O7994Bp/Xy1CBuCCrLhhrel1TqvrsZC3QwCOJtm8xDh43BZmylyTEcUGRI1HvP5QpYmS
 uABIXE+b+KnKcYYmh9QV4/wgj8eNfmLfD9/i5XaqODqFD6DT291lHGHS+GzCwJwaQGquoqnJzlp
 jBbI6l0Z2Fm7HSD53Q45Jp/a4FPpYfvT08l6dT+0KzgFadm+gkcBPzPbDUcEvWoChvereQBIRZ1
 W+0rEF3lmUCKr8TGaHg==
X-Proofpoint-GUID: y0Nti2sWBWl5bv8HwsckwhsIw-K1WMi0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMiBTYWx0ZWRfXzUkbgQRnzaJJ
 IFT/HlgiBC1GJuevqt3M+acNfzqRKzLx4DEug0DZ1FLa5rwFURgq7sRygPG77BDq+LAQSNTVifF
 8Jfdv0uuU6U9uiM6RUQ6ym+wWwLQaug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100102


On Wed, 29 Jul 2026 07:27:24 -0600, Simon Glass wrote:
> This series adds pinctrl support for the Rockchip RV1106 and its
> RV1103 package variant, split out from the initial RV1106 enablement
> series [1] following feedback to submit per subsystem.
> 
> On this SoC each GPIO bank has a dedicated IO control (IOC) register
> block, unlike earlier Rockchip designs where the registers of all
> banks share a GRF region. Following Jonas's review of v1, each bank
> node now references the syscon for its own IOC block through a
> rockchip,grf phandle and the driver uses a separate regmap per bank,
> so no regmap crosses a block boundary.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
      https://git.kernel.org/brgl/c/2f2b1a84fc141575eeabfacbd7c35af0b5dbb0b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
