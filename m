Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B433E4C73
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687832; cv=none; b=e9HBFwfZjxWZo8hGKDvH6AWoqab7w66HlsuzHsoFarkKLgE8Zm7pGkSnyL+cIk37Uphw3lpjiqi8XU1FiT8TIYIcf8OjV1zFW5PjeC4Ch116AEtBxLglZrVfRkUHU3LqNAZe/Q9tVvHnXgXB+zC+lCHiNrqV2whlU8EbS/D87oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687832; c=relaxed/simple;
	bh=DKWM8SY8JjCsjQcLdsu8gES1odRtwhgfY1WI0Sx22tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCMAQDIMqxozXV7W8BNH2V0oc6t/HVqOBZIhRH0p3wNaMtP+exbJPOY/IEVjqmIXs5lVDy41maXlt+dnxjvJ9VzcEfMHf7fvxhnJh9tAaUubNvrgk1YcnlioiIFnrK4ybHdnpGoM3nfkdruY6oI0n9BuhGhf0xGaYKxjx/oK/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA+t02bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ndt5mIGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA+t02bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ndt5mIGl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqhCX1477054
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NVqNy8N/kAoNJkFDxNi1JrKf
	DmjV7xNsw6U2GUVyTV8=; b=aA+t02boDBtipwf1jH3x/YY2twAROOvzikyrzWxw
	4CWqKIfhFPJYCvRrn/ZE1bjF4rnkLoRfoHVI+iNPaBF7gR1Njgd7pKLEDnUUHl4O
	vHM+8dpRLnSPsNF+k9ybQf3ovnFWsgK7wtmXL8ZHxbXn0jC3s5xiqB9rou7zuSUC
	XMSOo5DVhWSk39DyA5UtL+uaTyjzIhHRYc10f2070eH7Bp8FMiOCYMflsHZKOB9V
	W7wPP9Edj7PfTKjCmahQxcmSOKSImY4G1rZav9Sa36CSO/S7mmzUK6cKWKaTB3vb
	srWRxAXfTcSb+zyxmEjMJ7pD6bI/x8+kdn+VCAChZY/RaA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyw03m75b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:17:10 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ce86cc29c6so906771e0c.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687829; x=1791292629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVqNy8N/kAoNJkFDxNi1JrKfDmjV7xNsw6U2GUVyTV8=;
        b=Ndt5mIGl0GAy6gAD6VbRcBH4I3MQ7UthTFMsCcE/9xj+14EEzRp+9z5K3GAG+iAegu
         tM6NhMGzYieaeWQzSxy5QXfqRlyD6jbBWo423u0VozRisCwbyynJpjy0T0AdO6fRoeMl
         q+MZkopOoNE9/DD7mqjOqbY1LD0oqTwAChFatPcsqD7PwCcovH98sFpQbyYkElA2f7bj
         fypuBSBx/y8/y+PYMlTPBP1YAM6EWENNJMIrr/apjV+9XK2Xulk/c/7nE699WdOE50ZV
         eeOQCIWwimhGmrDpGfQe5+m8hrQoh4tuqhQSj7zoLw0YQisYI7cNfBN/9HONXU56XR0a
         18Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687829; x=1791292629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVqNy8N/kAoNJkFDxNi1JrKfDmjV7xNsw6U2GUVyTV8=;
        b=et8saLeHETPf0mB1n5vF93lMqBk4w7jZpY54WON+MpzxhIZnrU5kmECMccYIM6L20x
         Zout1OXcc39sGfVgVMUdjG+GoK+XuHpxULsTVlwIR/6HOmb5eHYM931t9U9Hwuqxu8rK
         FzEJNNTWonF4ZRVYHEh7Q1/vpd9C3fqeseNqSBvGSDMZD1h60XOisIEo6XVVl4WCdXxI
         ELlM99IrKYY8ZEPjnJCvA08WTM5Npmek43ePzPDOGVojfUSdeuGyQKvIP31nmQu+VY9R
         3aCNN8KdwufKjrACpJ+ikcsbSydhpCCE5PkBxnqebKf3/KkBT0TkdTzKftR9NPnVWoUv
         hdtA==
X-Forwarded-Encrypted: i=1; AKwUvBzMLQf/8Lzlb+sp4S/0fWCCxJvhnDQ2gIN2I42+S0sqUg8YZF2UhSwyNFrdog81VGA+OalvMLJ9EFFx@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6xD6VpLyfwgPYklUDABFmOO2LnrXdOYPUQj1jMfgDmkTogdws
	TmlcpK103d/+ZPIdQioBUYRYkf98kbZHbBJjrOaDzZiEXxDF0bXA7DP8pzHl14M/ktVswZBGuYH
	hW5gzKYuihTy5RRir8L8gSomkf1sZzV2+z6rNRItfSfAAv4OL+W13NaUERKOXpk+F
X-Gm-Gg: AYBFou3YiILEuPEXeSUQr+T6YeHdeVwUvj+h00ahgek0sZsG9F4P1u9KYweMSgcn6l+
	eKCZ8AEZ4dtE77xSm5HPgBns0EbgQV527nNYMxnb2ySrJpx1sxIqKEFR/6uCOXlelMxFLP+24fU
	jWBPITCbQF+FE0v2LyovDctkWbrK0h3+Kq/IBdSFxzEDcthttBcI2beI08Yyau7wy52QubVyIFp
	Q/wKbe/hLAS++KKcU1mSW1YtwlNgtbpP8wsiwDNuDqsml72ZMosmzeq15/9XaB10AU4FUKFlEYl
	gd9kCqkHzHyUCd8BXYyEMrjEQx32JUHUGzzntDApaM6bqqGymPbkkatMh1lfF66gHfpT7fbMKN/
	VJYyBmzjmN5ADBrk=
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7b1b34d3523mr3489150137.0.1790687828838;
        Tue, 29 Sep 2026 06:17:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id ada2fe7eead31-7b1b34d3523mr3489137137.0.1790687828182;
        Tue, 29 Sep 2026 06:17:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013b8f6f5sm10587355e9.10.2026.09.29.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:17:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:17:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
Message-ID: <gsod6i4ywwgugsu2matyz25ypdvjz4kddzddxf7atsqaet5r37@66lpgdpejq5p>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX2Md6MtM85C2h
 74C28jFEsXGpu7nHFq2xPeCnsxTHE2UU6rduczhxtiKJHCHu/n+25cqZkhPKPCygUPDTiEbBGy9
 nbk5jGg8a7xuDXIneYGAb5EMrpTbP60=
X-Authority-Analysis: v=2.4 cv=SIbXx+vH c=1 sm=1 tr=0 ts=6abbba56 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-LKvvtDxBJcjZvG-X40A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX4/JT+rtUxlns
 C9HK+FZeFxfJbmUE3xj8LfeGLOw/iSz1i/FYMHPy8VhVPzizkteD627mCwoIKI7cZw6GCV705FN
 2+xNtuYwm9SMhe3uX38RIftbri/Gb1jXHirh48/Jje2I4x3U/3HQ5DvpRfdyzWH0hkqQLhzGPtq
 q7Tzk6+tXdkZtHdntuVjeeyLDZ42glnKZuhwgRR/3axAsk7C9x7lOXk2vhhQYKSci2J4OVJeCR2
 Od89STScCoP4sIT0h6AGK/o1wB8APmlZ4H3t8bA8r8gBqt/kl1gznjJNhftZN5QEPRPDY8xeoDT
 TGa4oFFlveu7dseiyP3z0+caH3EYVlO/CztnftVE3leuzpeg1fLx73c8NowXBxzJ277SFfVlh3t
 xRRQOVK5OFzNRFTNRoSnKJcpey9TpnT5YG7rWkYgmD05Lfgsrrhmu0AKen3wswLsoZVYxcGtauz
 US+biRFFH2d5knRQhyw==
X-Proofpoint-GUID: f-oN23f-bFO9eON2rWuIn03f0Gt_BA1Z
X-Proofpoint-ORIG-GUID: f-oN23f-bFO9eON2rWuIn03f0Gt_BA1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:35, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
