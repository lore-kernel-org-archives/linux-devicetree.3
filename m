Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605367;
	b=O5TljYdJlcSZdBs7rXBxd9FrypGRu+42eJ3z9KSPxAwwL6G84BQrA0kxquzeQ6HXedOl
	 eyZ3ULZ8CDHlWUi7k+gzW3KhFdiCfe0u7cnIqlETnFaaWCG/wCVU1Y7rj6cO79Y1IsMM0
	 AvhivwkUUYjPZbH/zct5wmpPOsOIB/s87tZAqIwPZt8bIkjJcmVAn0U/soNhZ4IAEZZcL
	 2uzJGFWk0LMmHgwPtkVdUSXUSLBT5CvEUXsNIQmROQ0L/1uHuJGsmLmUd21yK1Yo/3LJD
	 EhY5gSJNDMX5+DjiQf7Dc5OrpRqnRHWvTFsPED3XVmGlIZGG3RsFsW3BsbrHe/wC/3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605367;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
	b=KPmXKLJX8jyetQ3Xh8IaRDMGuK9OMAGTGlU7IPLaIdpNPdBnvqmkZqpsfzGfmA7U6hXU
	 SjG3fEHPFt31Bn6Zgh85tyADyYKAh9ajKPbDjbXP6u1OK2Wnkv/CYZul4hdPeqFZesZd2
	 ELQGTeuwRhOVRkI7Rb0yTvyyajOSzIBcNErYv5RFnjhFrh3EJIJkjdZ5ut0PdU/ITtWLU
	 V3wXxomh8bo+6xEo/QnlzX+o8pEI/vey4Vb0vTrJ4EHa2mmFHX5MinaeQuMe5URgajD4R
	 soVOPv6CjxDd5/2LgYNcqPIigYWk3fEvnlzBqEl07OYApC3cn9pxoWCzLpYTBzM3FFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LUxhB7zc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffBqD2Y2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B19606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B19606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LUxhB7zc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ffBqD2Y2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTQI4034188
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=; b=LUxhB7zc7CmsqzkO
	r3ZGWJCLWUe4qD2tPmoMv77pxKvjzq8P4+TO5PY4/RQeTJfNmf91Ujh/0LYX/1kO
	Gf8mfM+QZVvshnmFF6afeDPWclv+8wQPmTyWK2EQeS+Vm9Xq1xLcSzE3jNMJ0GKN
	y9SRAQJ2urUf6F5SgQp/aglydY5YIyCl52xXbUeHMUKhbKIusf9n4oxQgm54KJ48
	yKZfO/w/nWuiUG770y7fgmoa2sQD6WOoUyPaZnEHmdkLWQeJSKVE0WRa7ADkEGAy
	sRYcxTYhspE4kqW7pzRlMWST/nm3EF3uwxZ5Qd+zLrIuwM+O+1OkDlR7zlKhsycD
	3DepQA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjg20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:16:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-77f133855b9so234130137.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605365; x=1796210165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
        b=ffBqD2Y2aO+WAqVaCmzZ/zOCTzJjeHYop5E9eL4Nsgf3ZQUbfuM8KtFPlTBgRH3H3Q
         jreHsXhb2CvOr1hHwHLSVsnUT2Bnme7P02otpD+njccRhdb5C0dlUSf0ooS2yz9YmlYL
         I/Fj8Bl6v50IgJ5UmYF/otEUoAURDlJMpItnZMzQPfIH8cEjh6jxMBEVGtopbeFbvlgg
         k/LfF6oCR2Obu7oCtJRx0og6oskQmsY3x6hvol9jDqWiLvmoxCJ/hwYJk090RoXpeNvo
         5X3iZ+lLPupIHmHqAkjGNoZx+R0EVutm1USKA/4uNvoHlwHnq0BFwSmJAqD62eXH46Ej
         1qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605365; x=1796210165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydO6s6zouR5jlGhUAX7WLid8Ob4ZCGvRRCC4HGa45LE=;
        b=E7vAx16J6Sa71IQzeE2ny/gHQOCZp+bmAyg9pCSkeD1yuF3kx78W8ktTS7xcjkb3D3
         DFsvqO0otT24uVCQWQczzhqKV8KQwlP07hGYsshzR63qJh8Xl6hjsqIC3VTqjrwA/1pv
         ItIqgEkzyZePdrlFkODAjnAJ1/t/uIYuXHsM5RZGAIMBikO57ylU4Xs41/3b+zkRa8gs
         qat2CJnbUFxkkzwa4Eem+3imuqSNjP+bxUOMWZGaF9h9c4MgIODVjrnsEFC5ZOIyLVsx
         ATMph6g6ePqbuWPRe1QFFVFON0lkKS2FFZg86Aq3++stO6kiiz4tJOoliLmfiscQ3R7n
         xmEw==
X-Forwarded-Encrypted: i=1; AL+hErGMG5gxgMyWqfQjJD7jH7LLTrXH8Ul5AQMzLhUB2GsxpXgIL9psnMDqZpewV0rk8sghdsG38u05tD2+@vger.kernel.org
X-Gm-Message-State: APuU4Z/KrS0ZtBdW/YAjFFWjke9cLfVZ/xT0ycE2EJzd0/iiz57SHUCQ
	JcZSubL4QnDK69htRMZve1PGH3md/Ir1cbgaWBIxe/JbCy1F84KkIsHFWSyLFugyy1AjwysBORm
	IAillTPcq1tmM6BFUPaUixv3H2vGgn3MGQWBM86YWXY7DUPbiULtZnJEFzupwPe1S
X-Gm-Gg: AZFdTZdbSx3bLuQPRTZTk7j0yXgKDPjykoh3a+iHfDFpUa5p6J9BM/VBkkYXvYlvH5Q
	l/irz0hjFqWI0KCbf8s2kHAbqR9ThJrS40bYgdrGtg/It3ka3uJIoRpRaBS3s9nSBjw0dFvFqm+
	9PsnkTqRkIoSC0Lh4J1fuubiAM+iIcftrkOxkZ3iQfx7/tOS0++0Je+IbbyIVatYazCTfDdr996
	7JJ1XeskdPQFvPQzVPkc2FCadaYyu2F6f/+Bmyez1zvOaqrmSH/TMcYguzOgyFE+A1szvlFhwBd
	SVuhECZjOqVSzWtv/E4m1vAifbUH4TPsFsvO7V+A80R4R5pSbA9Bu8Hr5ibYNgflxyvi2p9/NwB
	ZsiZ/p/5HB9BYxi7gg0qogRalQNpmM/yBoJNmcPyzRNn+e8QvNaO850USMKRDFQWcwvr2S0Q=
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr10785999e0c.5.1795605365380;
        Wed, 25 Nov 2026 03:16:05 -0800 (PST)
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr10785962e0c.5.1795605364872;
        Wed, 25 Nov 2026 03:16:04 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b03723bsm614271666b.87.2026.11.25.03.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:16:04 -0800 (PST)
Message-ID: <0d58f23d-cd7a-4a9b-9f22-c5ee4dea05a0@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:15:59 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: talos-evk-som: disable PCIe L1SS for
 QCA6698
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, mani@kernel.org, vkoul@kernel.org,
        neil.armstrong@linaro.org
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        qiang.yu@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112022619.277383-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112022619.277383-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfX1zYyFYlbCkAM
 /849Iw7/rBzD/SLvWHVY0h1Hlz1YNfOGJ8xEJKPmXpNLqgnx+/V5LiI2OjHykWYD3gC7N8EKYkg
 gjzOLuIXcZIPBayZTHVZqf4wB0GQ27w=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06c376 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NtwryRwz0H4I5a1WLC8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NCBTYWx0ZWRfXzW8F29R4C86G
 mSNQY9gYx6IPAMKhY0LhEVjT9aAPLvyvuuvoX7U4f1M02Ph1VtpNlP09M5FeL2MqHEb2fkBkpzq
 elKyx8G4TILAm7Ndg2uqnRBTqHa7uuNsrECa/DtukE9dZ4hXHWcVm+fh09Mf7WrnRf3JYH7rYuV
 +DVohU8JFXjTLvNvMh0hob5RYlq7jBhVghkbN6+m7vJDrivJEBpaG6yuc9fMY1Ad8JHqJ8nIUjh
 ReMS9qP1uYuh89dwCIjH+yw4oNY5fXSkgz/A9h9n1ImM3NedcKRlPaIszSfgqvqiG/8MRegrSyN
 DEcSTUuKVMOk2xWT8BLHOvTL+5z0ZPFazbsgAEc8n5t0qe6VRF9xfsiNBTAxWgfnFJyuiylji/6
 yIeK9QSs4wNYXvns+5bdQOayjgQTWXoE+H/xKbYdzYF0Arg0wjiKn78dXDHUaek5MqSbzfplSia
 Cy3JJQvfT0pfPLlniTQ==
X-Proofpoint-ORIG-GUID: kH-NQCIp7zyo_J897vlMn8ix3dLHogLe
X-Proofpoint-GUID: kH-NQCIp7zyo_J897vlMn8ix3dLHogLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250044

On 11/12/26 3:26 AM, Ziyue Zhang wrote:
> The CLKREQ# signal for PCIe port0 is not properly routed on the
> QCS615 Talos EVK board. This prevents the QCA6698 WLAN device from
> driving CLKREQ# low to maintain the reference clock during L1 PM
> Substate (L1SS) entry. As a result, the reference clock is gated
> prematurely when L1SS is enabled.
> 
> Add the 'aspm-no-l1ss' Device Tree property to the PCIe port0 node so
> the ASPM driver disables L1SS on this link.
> 
> Fixes: 0f9e6db8a223 ("arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
