Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEF83B19B5
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895601; cv=none; b=Ane2PZJjg74JQAyWs3zRsmkrtL5e7n6pcxziyyj6l9W+Ay/EIgaQCoUnqxyV/fPmKjlsL9kiooutgaGbRDZgjgzLP0Gj9za57Y5lZYzIgcv1+CJmSaw+aj69riOQ6w0c0XuwX88/21C0CoB6CWeFLewJHg4NOmnjzqli9+8+Nck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895601; c=relaxed/simple;
	bh=VWNZfdQqzG7zO8m/ujQ06elAt3AMY83F5V5dnMeOC00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFPRpgNtAQZDUJnrGtxxyHjFg8szClHDorO1lvaruTJlXAlEpX4UrOgj2WsrMKxSiZBjcw3hCyPJuj0NnrT1+5JTW9H6sp44nIvtHo+YrHfZvEyvGr2fiOYTB2cZK6AIOMgUD9gfEuNK0Lr45YQyrQEJ0gOEceivllzX5KpKO2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqpZ5A0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YPQLuYBi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqpZ5A0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YPQLuYBi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GLvb489280
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXpwPOVHRUSUaS2v1xJ/wsTIPsSlu7sdW6vk2hWUeC0=; b=MqpZ5A0wilrNi3SS
	oT0BSRXaX1ByrSjMB5BwWRkeccmsQ15DXp3UhKJCpg2j2Zo97up0NPdWfWoTvTsX
	C6pBHmqfv6unyQQGxgbgBXni5UDm+oXmTBAdLfiYa3hLVMH9+DVtB1HSMX9y5S+e
	p6ei8K9pwZcObn4eL5zeS3BsD3+vmQLXCMz4ewgra2hxi5s81ohYqdUfZAK+Txoy
	BA6teyYZenhEfEYHlXnph0TCU+VcnqpfJbESprPXfL8L5penPu5vA7MsGJhS7MoQ
	JyfwMH9MOCakzZae/kpN/vaZpEoWH41nu2ZECXThFjtHv1ZlvTskXAHj5PUxOMg0
	PLjhGw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0aut31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:46:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ed53abff8so680671eec.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895597; x=1783500397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXpwPOVHRUSUaS2v1xJ/wsTIPsSlu7sdW6vk2hWUeC0=;
        b=YPQLuYBiJN17WwzFD4mFlLlvzuEBgLtGWlrpLWclxxUu0wTu/9s2R9bC7xjUq74wXS
         zxl9cACK1kfj9lS8GqEXe7lhp5djaN+jRd1XeRaFb3vr0cnPd0eQ3MjCzMzd6DQHZjza
         xUP7l4Qrzq5II3QSC2dD+N/ATuV0MtHa+zDBLIIu6HOlOix+S1vtNzDzhTdzruPZPlcn
         Q8wuSufkJm9Bxj4/NYHAqVP2g+w11+gGUrsCiYnYZz5uIbvlI9AcbPGTqoRy8NtmJDJA
         UiV+qf32u3bp9UbgRnL1WvhGf0cXrZVAjhqsYDpiNbCrVvjqCCx36HTh7rvV8HreQZPa
         SUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895597; x=1783500397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXpwPOVHRUSUaS2v1xJ/wsTIPsSlu7sdW6vk2hWUeC0=;
        b=Fc2NnB/vnivYWbJPlhTH+8YJZkwIzlnikROX6wQBWjM0902HNAu+T3hVHsRIc3rAES
         ca9TtWhiM7JZ/rNISW70u0AH9XybKMalgUkEnHpwsKy19xsbAK1u8WCe2hw082mXvmlm
         +l/qpQn3o0tWMJomJQUd/WVUzcigh7CGck6cPAgce/VnmOK+DrR2wSxcQw/YhyFZM9FU
         RWDBC9mROarBmFum0PIJzJYohcYxvbfcjas/2tfDidZvCBkT+/MSwVnwLhxCeDOW3IE+
         BxXX8jrR9taKs2iv0DjD4XWD7ZcXsFuUNy6WRYxeUKjwzPaniuTxNsodgjOekVs0BSWS
         +DyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp536uvyRny8vW9e8xraUdVwObRuD0GBr01Yu1ocdhJ/JLK1QRMz+OBsZ9OZKQXujSoq22toR7dP+9d@vger.kernel.org
X-Gm-Message-State: AOJu0YzmbDEubqRjRZ+Yd05hncwSKwifCbfBOHNJDJDxo0kiqnlNV8/V
	CRsw8EwShlZHsIw2FbITzc2kOg5LJdQ8l8w8uvtIpq9ks1e8ZUILY9iy/cPUl+A2aLaI+Pv7yI0
	kFu9qz1yxmf7V8ImD2KRx1BNkSIOIxvM62C+fQ7MhI8FJFyT1UxdmYCwKpn1uQqQt
X-Gm-Gg: AfdE7cnFzHyANQdaXzJ/FPfAY7irQf/KQ5ZnVQQNFdwSTCSTc+w4epp9A4xJ0Msb+ti
	o29QClhqwk5xkahMxfk/tcMxGYCJKH7Zg/foY5aoGtLXRZ70MooQEw8HptyUoPdrsQ/SoWd28PP
	iIuynmvo9yxOBUlYtV9K1r4SI2bqWvEekTvKpEK1vUMjS1I7sSrgmVricgB7EiwoEstZcdR+Sgg
	E0uOR49QTzNU2ohPnKZninsr6qSPcmvsQh9g52vZ1TE+HdCff08Bwtv+BnvReD0eKHzKdD2D79y
	iBGKX4TXbHc8oYfawjuQUwiPvLEKHzjwXq1qPrs/rnvS1QBbBBds6NAV0y6rsewRByX5fVQ3icG
	oJkECwczGciImSxm8ajgy1SCKU/s6zUoxKSYCC5MAiPptgjpcD656X85b1t+esoUHWyruVQoyaV
	6d7Yw+hWXZWEGb3tzIXaY8HwCbBFus0yPSZZpwc+4R
X-Received: by 2002:a05:7300:ed10:b0:30c:ab4d:3829 with SMTP id 5a478bee46e88-30eff398cf1mr907861eec.43.1782895596711;
        Wed, 01 Jul 2026 01:46:36 -0700 (PDT)
X-Received: by 2002:a05:7300:ed10:b0:30c:ab4d:3829 with SMTP id 5a478bee46e88-30eff398cf1mr907818eec.43.1782895596178;
        Wed, 01 Jul 2026 01:46:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm4891524eec.28.2026.07.01.01.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:46:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 14:16:24 +0530
Subject: [PATCH 1/2] dt-bindings: cpufreq: qcom-cpufreq-nvmem: document
 IPQ5210
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-cpufreq-v1-1-98656ad20ff3@oss.qualcomm.com>
References: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
In-Reply-To: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Ilia Lin <ilia.lin@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44d3ed cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zeNabaxW62Sqe8R-FXUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 9xCSVxc69RaGlipLs3gdEGY1g7uBHuxl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfX/aTqQIDG1Fdo
 f2nqRF9zXLcf5lu9fJiuLoP7CanJQ+OPYYEYqmtFsQx8RagFdj7+vl6J5J6KDySSgzQO+ickhYr
 SfvXujoKRqqMW1lhKqyBjMKJwMWEBBg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4OSBTYWx0ZWRfX7cOTHbzbG2f6
 8krbVvLIWZz4LNJXKODlskuk1ZvLq9COuGZEDAPnqd1RmC6sfsZSGhXmzil/hwBD59QygY8omzY
 Xa5GW3YRgP6XzatR48WZjYwLj92Bvf6SGZFgsuMOUag6VTAAoFUtGFh/k2lK2sx7/BgMA0lGNg8
 uST/OlMMPP32GTs9Hxh2fEY6ktRsqXa2qz39ZXIaWh9fadgEgmTjWBI9qjI43zz1pkQz+hOoSDK
 JigWebCVyt6Vav7aChtXw+tgyWb5VVhh53shLITA4+nR4yQ9qx2s5kq58A84c9mmlUZqDY0v40y
 dJcMKrSUrrNlEVeHvkTI/nicJ1C9qUv/LS/+ot7sTayFylJaSBE1OIQhv1iGKeWP9CN728pQMHI
 5TO+ahUJ0QkDEd6uMS9VWc70b92mZk8phw5fYEq/W8i3DXyX+UAlwvNb27bweucTbtTHGArsk61
 J5yuHdZDGGlvCjlCz4A==
X-Proofpoint-GUID: 9xCSVxc69RaGlipLs3gdEGY1g7uBHuxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010089

Document IPQ5210 compatible for Qcom NVMEM CPUFreq driver.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 547265b8b118..2f5dbb59034c 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -27,6 +27,7 @@ select:
         enum:
           - qcom,apq8064
           - qcom,apq8096
+          - qcom,ipq5210
           - qcom,ipq5332
           - qcom,ipq6018
           - qcom,ipq8064

-- 
2.34.1

