Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4253E1CFF
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095537; cv=none; b=VY0xKn0d/PcY4t1pSvauoV/TzLiE1O9HLRxy9qJRbnfCKzVzxkofWUoCgqrw62Aq/yNavJISZX8+kHYOxKqjSTbzlAvAF0LfXR3AAauZOmxeCQCGltTBc5DvFJ7sc8HC3m5Hg25h27QcmZ6opV1jmRm5qZmJ99niPL4AWMukaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095537; c=relaxed/simple;
	bh=im6BPezZ7Yn/GFfZKWjbcIi/nAVNL6dmm2zcgAQCWKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTHkrzPTE4AgJtR9M84PGryyesklQ4IcX2o6EnAmXtpleQP4FjMAJoPO6XuTSC0o3gWKbf+AbyDPxYTmRw7mxEaYOmCVPgvFotfM6eJgD4I40iDXw14M5MO1UHdtRxE01gom8X2oH7E5v+mrsmqFVuFTrx6Km9u156yYohYzImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNDKB7Wt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpGwd/ZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNDKB7Wt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpGwd/ZZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7dsFp2891952
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfcqCx1aN6F7oU/wNwv2z+sA+nyhZ05j8Hj1A2Fvty8=; b=HNDKB7WtZ76uz1+G
	A9kjxokdUC5pFowLDz5Y4VaXVftoHciN0W23ZA5zzR6YkTGwLWuQPi6LSOebGP64
	3Ofw/IzvnSaMh96hol7dqDjqrWx/J7W5mJJrsAjlzYW2+tySABtqKa72ml5gK1EC
	6XgZaLgoTcT3cwZzlQRjnZtI7/x0LdkWLiIh4qV6EIE4R1zcuyHYcTbScVevVjAq
	M62ZptzT9La+YC0uoKwqaQIJ0n5gMFessmHn1aboqOUKxC3Gxg/QQumgAtOww6Co
	JuchW/c22orQEh88++JcSoua20x41rNL//Ab+GjmxoW6qM3OnlcUPqjbnsQ2sbpk
	tjC4bg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk18cp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:12:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5104b861649so96289121cf.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779095534; x=1779700334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfcqCx1aN6F7oU/wNwv2z+sA+nyhZ05j8Hj1A2Fvty8=;
        b=RpGwd/ZZ4Iq+BEvn+W9e8PeM8w6HbvvsUWYMmdp4/n51V7N9SouPLR5/lkcBSSPT0m
         R0fbe++BTH/9RkvFOK0wx0TxWPcuRZq4L24jX1mFXqgiOb+HM7esH9Ram1/jgYnDXD+4
         CUw5PGSoGBsJjH3BvUySduZ6pXk5LuL617qxC0w0wM1n1l7pXX1OpXBmN+EwYzN0h3ZK
         4RR1/djZHHJiarvuKU1oW4LWLJv/UpSECeNB04Ry5PjBE4s+ykGslgU59XgFgxQfBbCt
         xC2h8EUbRVAMijeqsFT1yg9GbvqRz2AA1vz1FgXjI6HScqMJEqyONEFEbeG0qYwsBk/n
         Y8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095534; x=1779700334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XfcqCx1aN6F7oU/wNwv2z+sA+nyhZ05j8Hj1A2Fvty8=;
        b=BR0TsWJ35Q0KWUAv1TJuqEKLDMOdNFaQPX25EJ8ZINGHUv38oVxC5AUO15Bk4gQA0d
         3Ih16mVv9KxJHz0sx7j+h3NoCy9jdJQ/51bZR60oW/yieZAls/9tsHX22I2L7CE/iUZH
         MU8daXGI00GIDzmd1BlBGmLlQcFOjEmdIwGavVliCrZgzS0YnG7sGeb5i3bwSoCvmVNl
         YjI8hCHIxyLtQUnjSbRHfmwwOdiy9rRMSlxIIZg1Iv25DFSs4T7zO8bBJvj+vev+6ISk
         4Nd+zqpixobRhxKmbet/7Bk6D8kLTmtOZlKHdflMECAAhR18XADv+tqDBaKvMZjRRvSh
         VVrw==
X-Forwarded-Encrypted: i=1; AFNElJ+vJe//0sIpepcG7yhRvdkIzPuzJ490VBqLhF/L3stGxe63X5G74kPKC1rELYElvgrAPAVFF0a9nZQ3@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxKW8nD8q8kpWHg9lQofibzl03vw8p54deffpBa+2hGQr9Zay
	ESNOVzdBqRTdD2am4eadTGvX+iPiDezs3fRO7igqH91oZrOdPlIwQ3t7sE+03IP/gvbpODAr0Fe
	5jFVHOtx57NrLGQzPA/VYGokwRPlY58o6Hy09DJCojavaR2ckbajxh9PZqEz9C0XV
X-Gm-Gg: Acq92OEz41TzWW7S4DrZpDd2971THdv3Y88MR9V0Si2HIX6Oup+jv1JJp36cjAd31dF
	kWVY9hufq9vKeut+rD6fXAeBmABO9VriREtbB5cYEOcP4tTwm3JgkdItMjPnI1jvMFJWkov45Ph
	KAxeUDRlxtLLnI7WyrNGImvmQCQSH8TQGOjvKCuXJSurI3yyfRcF7VcD9ZT+722qk4jj6KEhcCB
	ys6oyybpc4ap7fpg8NxT3R+PO1CFOTrz/HZqooSZQltwHwegQ92SAZlAKiFBoi2zsKahEFyufSg
	bxc7Ttm72EAKgzvV4UiAuv8eYy9bRpW4odOW90pUxZ5eQyq+r9BCW0MaYgSKYADQ1w+f9KkOCJL
	Yv3lSWfEkPgqQ2lx9K1SGbL3Xk2bNo8lbORm8a6bAw6Xtka1D
X-Received: by 2002:a05:622a:4a:b0:50d:7135:5631 with SMTP id d75a77b69052e-51659fbbf8emr214909571cf.6.1779095533555;
        Mon, 18 May 2026 02:12:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4a:b0:50d:7135:5631 with SMTP id d75a77b69052e-51659fbbf8emr214909171cf.6.1779095533031;
        Mon, 18 May 2026 02:12:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694f2csm243582145e9.4.2026.05.18.02.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:12:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra238 support
Date: Mon, 18 May 2026 11:12:10 +0200
Message-ID: <177909552746.28252.17989954889836549417.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514124835.108532-1-pshete@nvidia.com>
References: <20260514124835.108532-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iOwvLycyCbd_lkwxOMt32aCAH7Fy-v9r
X-Proofpoint-ORIG-GUID: iOwvLycyCbd_lkwxOMt32aCAH7Fy-v9r
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0ad7ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wlH-Nszz4JBIhd8tT-gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4OCBTYWx0ZWRfXyKKImgrqLbJr
 2g1XZDOHkOCPtYX2rT1xU25sxNY+PTYtbFMAiR232ueSMjqm+KBPET3hGZSdS61Md8uwkNUBuWK
 B20dtLdxswe4xT2zoLWhRmddo141sSQfYNzOc0frFiwUhLXSd7y6uiSIWeRS5dsYCjE+NWmlXxU
 sKipS1mjLzJjIqGWXSx0A38fKrV7cdh3H7R9XNphCM4obRfURyo1YEpAroTy8rXILd0qWB9wTr2
 ajaif3wb0NF+ht7EXrwwrlfjr4fMOh2kwRFU9u9+H8OMGdFXcTgC6JDUwAQmePNteSmWmhx/gmJ
 tdXViM3FKsFlqDm+YCSVvb8OQ81DhpMJNxeVshJjloQYyLml0Q7bSzrZdK2dlsjlA2N8UHnGFxe
 3pqbpJGHnxDKstfcVJfhANIwTYk1lLezrbNyUahKVmroaLyBjU9IvnW3nUmq/6D6rU2uxISRkUW
 IIBw+AZXt8r+cAVz+nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180088


On Thu, 14 May 2026 12:48:34 +0000, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controllers found on Tegra238. Tegra238 has two
> GPIO controllers: the main controller and always-on (AON) controller.
> The number of pins is slightly different, but the programming model
> remains the same.
> 
> Add a new header, include/dt-bindings/gpio/nvidia,tegra238-gpio.h,
> that defines port IDs as well as the TEGRA238_MAIN_GPIO() helper,
> both of which are used in conjunction to create a unique specifier
> for each pin.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add Tegra238 support
      https://git.kernel.org/brgl/c/4002ccd266b665f1097e20addbe8f3baeb2136f9
[2/2] gpio: tegra186: Add support for Tegra238
      https://git.kernel.org/brgl/c/8ac12d8b7099cdebff19aed78a81f61d8042c6be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
