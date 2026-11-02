Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631798;
	b=xdor4ZmqdzrkjAv/1J8KSt+VyHvKh+yk6Xygx0Tg1i9XhLp7GVkJ/1uznfj2gzKejXau
	 r0MbNXLFMrrGG/uAgXL9aU7q2YJqhm7gmvRa/oPuAlDzoGtDrwJKY4dQYP57l1KbxV0i/
	 ACnGzor01oVZNDsmjxuRIH4e+uQn5NhPMLz8hgSa/rjzZ8E7JXHsLuXAN7ttAja5UqH3w
	 UenxdLHYaOUEo3cYp4Z/ogDgESNksfvBqm0uJJsedR2MPIftSR2VO5B5Wxz7kaYZdwaih
	 d76LQpKRBji1VXpMAOLzigcOhTI2dwBowRLlEP3Wjvs3FHmDZzJGwPYFLKoVm8uBUQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
	b=KfP0Rjr/oU3UdXIksAbeQvAs9BJPiZIK6WaNty3EPi8QSvoNlph5XTmr6Vlynaho7GnO
	 nM+6hX7LAtuB3mWT0nFgDnv/PD9vnTHgiyeYqnYtiYQSVWo6eRBhxtXJRzrRwak60vCak
	 x1Lt1EkveciFfjjpkz0meYs6Jme+HdEG9GsEdDr3v8ttJlVbZq3phnq3RPxE9yB/1ALaB
	 RheqFD4HQ/DmM9cPMr46LHGLQBiluV80xMjTFBV27bMufQCFo8O5VaSSvH9iFX0WE11OH
	 1/mznfnAIUkKlDIL51XL9bG3eZ5jGqIxv6YQZ4i6HVDR41oewyjFS49oT4N8SxUeJcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1NaAAgZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1EOesGa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60346082BCB
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60346082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1NaAAgZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1EOesGa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpQ4H3102713
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=; b=p1NaAAgZ1DQr8ZyP
	ihQIlhr81paqpITIhuVnOV8qSW8FV9kvsHcrlE5YTSChn01KCpTI+3DA1Q74tl8B
	HIaYrQoAteb4uCfKxjULLlzJOf3fr1Tgm+I/Iak57E+O0r7BK9bRg/Hwvabniu3g
	Dl9HmogXKMNOSm4ZVUfz8vTPOE8nY9/SWH3jqWXmVrdvfYW0G95ob96uaZ6YXMMw
	cKUeXQAlyGnWLFh3phk4yi/UDZJEq4cB30ln+piAdCGPYSo07b4zIhNFEJQYCsOf
	roAyHaDcCelR6yxUsI0IUPUOCqsPn3xgS7OrK49/YU058VgzKpsYbg9cCbymJ3Sq
	PT8ESA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjcyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:03:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaabe26601so171943e0c.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793631796; x=1794236596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
        b=Y1EOesGaaNzopBJnkAQ+e+4NJ0+8cymihTGsEUpALCBpK7r8sJWtJn5/14boDSE6w5
         FaId5OlWtbXrDecZG4/zpKoFZgxKmGoOI0R3yIpEQEArX8G3DPCaaiPp04iQAqn2Rcar
         hpO0hFSpfsbY06pSoQS/2/Y9YX86pMkiVJENdSHoOqvq4gPmzsf8IFBknje9WCNEIhZc
         tNAWEqR0+Z3ihdGDkYyRRyC1zD9GoLLUMHXRUbS2KejKYNMM9CyeoNDeEcbZzcu5wYU2
         9V2mZ81yADoK4ZMbyBXw0gDZaWXRZsdP13U3xMtRNZM3YY4dM3BBq9S0pnIU9Yzwtqf4
         ZFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631796; x=1794236596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaZIPeHJFWb9YSV4xiIF6FuEZn7FHHL2p7dwHN+KzUo=;
        b=Nf2ezeW1X1uF32IvriWGyF13XsIH1T11conJnKQLTE3I58bDv4XpzGru0I+2/oXAs0
         FjDys2o6+4dAHOlClT2r1SQjeFbT7bydOj3U+GFFoobdUgBNlMpqUrOGFrd0YHQSVuv2
         udgRrRWdOnO/TEF32V0/n/SQa2QpQLVNvnGC5lkg/brjjaE6d1klyI+rqCKmtaGtUUJx
         PlwOXBBhaVGBd9CUSgH14vMsy4+vBOJIaI1lvvBx79VKDgJJMLq6zAXTncSica1jBMwG
         YiDS7Ef0AaFS0JJkcKPQkg4xFZ7kp7rihLOxo+3yfvQDETVjFDbhihe14qUOqc7RZi/8
         ImMw==
X-Forwarded-Encrypted: i=1; AKwUvBzIPUYuAYmEvN9pdgQOtxn48+ftN6zMPE3nkkSSvhJNdzHT7+c+1Z4ahOx80vxPa8EN+g0jWzrqdOBf@vger.kernel.org
X-Gm-Message-State: APuU4Z8cxzfgu653qPceGMb9whHAW4swATVLfPjgxZiAImqGt5BNo5BA
	2+0Je5ra2KNEvnZ05wvMF11MqQEZ+SrFNzIJsI6toBSHlHyDgWRAYJBAhWPPOsq7BS0gILOkGSv
	qZtuft+/iZdrKfAO9NDWuSZw62LV/LmAtsQtXm0jUju9AVOQQjziCKU7bCzQzuNiC
X-Gm-Gg: AYBFou3HB/b5Y/6eBnSL4ZDp8BOpzHXloMhuXFR6evfRjzQLrDyp7yCwHwgtpoDg92P
	W9a864K6szrZNiiaPQu3oPUWY9VW4i/fUR0Gf27fCBAMa9ehkCEWppzE3L2Wwc2oYG2zBeB2V75
	oI5N1vB8TiogtozMfuAfm2wR0F2RhSV//3NrPRgTbQONS7PPaTZm7EQQSqOpJcHZkfCDLo9KNNy
	qWIsWQyWwmCkXnZxcC/70XYg2syDKaojtr4DVaMrzP9eiscp8CRta7jqa3mYeKZUWVXStILjALg
	mw5c7wAxqTt1S7sbYHjsH7XRBkNlyysybJcqeZTn/OmCm7pUXWOoSZJKcpMvpnuKoQ0HLuUZQgW
	Li5E/r+K06rIoWEekCCkPUU8Fu3ezTuX2Aa5q3kEJZbNoZh6TIcvAgbGgZShNf9jJqIDUug==
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr4165962e0c.3.1793631794234;
        Mon, 02 Nov 2026 07:03:14 -0800 (PST)
X-Received: by 2002:a05:6122:8487:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ec6881cab8mr4165778e0c.3.1793631792302;
        Mon, 02 Nov 2026 07:03:12 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebebf164sm282766b.13.2026.11.02.07.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:03:11 -0800 (PST)
Message-ID: <6234d23b-09b4-4a78-a2d0-35a71cd70504@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:03:08 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vOHlN3chvWmzS0-oaGN3htbBu6htqf4R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX4+hGQozE4oAA
 79GRDsMks98fhlzxgQ662b8bn8vSgSNYFKoNJK2jdnjTtmmjB/2LsfDI4gBS8XK9GKG6A0cHNEC
 z+4QsCWR3iH29mOsXKLcjCl+1alkNLBWKG0t4tDhX1Z/wNw4ia9M4DG708P0mLoHsqGs1mbAw1i
 Di1OmarvXWmZ/xTRtDcSjWmF/m4ohit9+5O4aidtaRS6kt+MmlDwRA19qO/dB/RGoJf1yDBkVeg
 VLVpOboaG4BU3hmOgff/L+UjbO8uAhIvp2NigI22j/14kosc7mGtEfcZV239t1vKRDJy/C1NK4y
 zYXOicDPyOxC1ds02JCGqUesnvjcih3n0ImOTCJ42Tfq55VM1ZdELRLN/6N4GOsVrUBEB8cd7SP
 QvX4F05NZsXzVLH94xAz4+M9V8wFxKx2/kTSL/TiSPVS6oipwmCpCQUaU94DX8asdmS3fhfmjbf
 2oahsIXgc5dewr3MgLw==
X-Proofpoint-GUID: vOHlN3chvWmzS0-oaGN3htbBu6htqf4R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OSBTYWx0ZWRfX3pb5upsNMkqf
 KO09dKI8NrO0F0ZygIqPbEdJXdtE0vVP6h0yvJlnG9RD523JgqBfYRAM+ObjYvmL7Eh8FGG3Hli
 4jn+3vXppK/2nwALlMAsLmcdWIiqJs0=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8a634 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sMZvD66PJ82pgKsSUfkA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020059

On 11/1/26 9:04 AM, Shawn Guo wrote:
> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> and DMA queues.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

I think we can't enable the ethernet hosts indiscrimately (I would
love to be corrected here!), can we keep the XPCS nodes enabled by
default?

Konrad
