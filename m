Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693370;
	b=s1hA5K+KvT2MmGCXbumlu5GQJXHhUrilQNnTlMxQJ6tUVGvgsLKUrDWVUlrF8PyAELFq
	 8ZG+Hqt/NDnowxSGHhUtIkB8FT7To0y7XNTxN/ARvSRryBZHq/gomgIEJBzV4iCMODGbQ
	 O3epl0YxY8h6Xi1awPR0IR5VrV+jXmgQo1wPdGxwdWlZTB7bM9515oREje8Mdz2GSR16n
	 T/m0oG3UuAM5wZRCDEGeBT4U+oS1eUSSixY8ZN8wEQMt/TEGro9pk2yCZ4Bw2vT1Zcu85
	 uVuvi+rFG4NvwJ9O6M1IW6Ec8gHfTGnA6JcsXFA4aB7V/3jpHpykefFkN4T07N2icsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
	b=NnuTJMxPnIg0D2Kc3ctDNSQW3T98R0JQbNfRU6GvaZSEjT57CGAkl3y7PotD6prZM7tu
	 S2/QoBaghXjIQoGlsp7f/yBpjv7w2Xzh7kuy+dbhJcmQX0tvF+Av65PQSQdpRXF4RIWG0
	 ptTji3LgmvDfKu2QXmuCD3rPQZ9te3dvgxx1a1WAg2P8Vi8mXwv588TGxuxwivIyCujNN
	 cjvYOAMY3jrA4GUZ/MkZNDgQeRVwGMmv3OhhoXumqwtHS/FR1Z7hPanvnqr844/1LJhxk
	 BUkCC+SQwUNx4Ps1kHb3LA0tOzIcxllJjN1NzQjPtmlg+NkVtPXowprFCphXMhQJBpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JkopCOUx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP2AUQBE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384D606A33A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A384D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JkopCOUx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AP2AUQBE
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVaif2263578
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=; b=JkopCOUxbdpRd6DV
	7rVqG6keB47462GxSS2GwHEhhenOwpI0TwsmYUqc0DBkh2iVC2P19I+puolPoxcc
	EmvK9DUm1VMedzGfxx5Y1CDGfm+41Og5hYVDR8g88oKiWGIdbz33+6/fBDTqY9H4
	YngJED1cUuZy09nbl1pnORhdh9ns3hlBBXjoZXoeuV2eaidnUBaOihGdlk0FWns3
	eWAzotsImLvD7T4j3CIXdQAK6ZRLSLIzJkEZ20V+5jKxGJBx/KWKr75W4ltdkssS
	134RBORNoKBOUGtluzxwCQuNKgqgwdXZ6CqaSdvxUeE9F9CTt5pFTMb2VKcqHzXZ
	zbeOLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekxrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:42:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55c4997063aso19481201cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693368; x=1796298168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
        b=AP2AUQBE4Cq3VykfUvh7xtdqiNdeuUob/5hUFKbarKYEKBxlqExqEpBaslyZuTELJn
         28oqrYK6UnH2WJv+A1XvLRRlA94sS3zQDL75CO+X+B250Co8h0s1R6GZLBaYQi4iknna
         yK5pbFl/JmLx4fDmbDN/+LimIZPpXgoyUNiZkHL+xtY86hVKNZzdy9z4ThR7hlwxHfTb
         LBPlQKFdiLT6gjXHswD6MqhnlMSdWqT9s8Aw/o4YLSulS+fQGrkbMXujy3m5oBAu3Nfu
         qpHuTYxTfZgtFmBfGlKybV5CAOKeuXJnMGdpTjmKG98m0yhuUGxbXFH5ddXjuHm6nlGQ
         hTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693368; x=1796298168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6lL9Zj57dWgnPBSlKlRN2hREBCW1ZtICTCl8DOJjUM=;
        b=ZY6sZhLltBr5y4qObKbEYz1o22AKGHlMpyrYbueHPKT87lTF7O+/te5lJlejnimhUz
         CYhflZiL0GcUo951z0FUbiZ3u+VeNPAJiRbqEFDFqt00pyaGd5Ql1hBj3HsecjypsLcK
         VlhGhYCBhT4TKZO1NTHznnz/2gB89O/EJC+Wfv8V9mpBKwCvsf5gtf9mSeDXxCAL7xN/
         UezYm+rwc2o5KEBYKcbFirsb4hIZA9OD/XFqfzlY+Ad+aOJ9LFVgD1JDEyNKlvz17kPR
         CK4vp0Fza6lGdnB/9WGgpOJzeuUIyhDUcVjElz6XVBazmsJd04eM/4cE9AV44h7zF/Ot
         RQ4g==
X-Forwarded-Encrypted: i=1; AL+hErEWVBto70u8adMGejUG5vpI3J9SZGayw6mtwF9ryJdcXw0UuLS4lkPu9hgkGCWDl70/6s0rvKmYp1cO@vger.kernel.org
X-Gm-Message-State: APuU4Z/ky9lNctKjiMv4PP6CVGxT/1VGQFt3O0cqnCdqb76e5Q/CtjNa
	GvdQP0PbHdSHvYiuyTx3w2bbpDfJw8nmcU2aagMJPH58lX40Z35W+vOvEX/TxE78AbtIS1V6MZb
	dPg6XykTYtiEY419tBxDmz7K26FMq1RsY77iaHg0ZIwp5eLw9hERiAfL/y3YlwpsGmc2Jrfk7
X-Gm-Gg: AZFdTZfVdf2lNAHUcEMMQ1XBs/dC1JtDSGrQQ6BY85GxFDtDMzQi1EvMabbs8Ncq0y0
	mtRlbxNSsOIl6u/x97lNRuEVpaJZVaqnMUwEG3YChhhlvw2IzGPKHDEWPx+PzJTryur4oMQSwex
	ze9ww6gKYQjjjpMhplT4qk6YmNWcJj+srNryC0crl4QSRkbRT534WMfVwE7Ao3W7jwKayVnXXu6
	PtxhWYX2raTigNwFbG1h8pddVGYlZGEAlpxp0yhwC1hJJInM3acPLpdPeDfZl/RexGTvKEg3h6H
	0SvgtGJrbpgRiB1KM0aPX6MUWjJSdLRX8yzn0y3XiPNsw7hB3x/Hvo+YT3/5OzitBKVa48OuaHv
	bXTNxSXRg6BYQGPQzQ45USnHOkagSpKrAmXrKt0P2gssHhO4k6OTEtHpMOkSBU5J+pwnoZGw=
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr3397656185a.1.1795693367649;
        Thu, 26 Nov 2026 03:42:47 -0800 (PST)
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr3397654085a.1.1795693367223;
        Thu, 26 Nov 2026 03:42:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm738945466b.37.2026.11.26.03.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:42:46 -0800 (PST)
Message-ID: <5b3112f5-6b6e-4796-bb71-3ad92238bd33@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:42:44 +0100
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
Subject: Re: [PATCH 0/3] arm64: dts: qcom: agatti: EL2 overlay and QUP
 firmware for the Arduino UNO Q
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX6RQ45cgbkcJi
 qPSERrLmc1pRCNjbf1XU0KEQ5PL8uYh44AOruzbnO9zNntGaDUWpdpTfhX48rysTXoNvnl8CNTf
 SRxIeTG6Fv2jS4Kr6vpIcrUJz5Ulo6jMDBZ2pkZ6ytoU25GsDWIHMXuevRBArxkg3NZ96ecbWzV
 fVlRmp24k7+f8AbybksXW1Nv57wtW1xZKk0GwPu2LQtehvcUd4g/3wEZXTFfaVdzJWDQ1gm6nPz
 JtWQXWkMQ+yFJ4MN32uULE1Ll5iR8a85gNYoHoMOvli/h6aUbrnigsDL0+bHl/Q5/cu9LqxrO24
 1rGQs6LY8gzDYKqj/omi5cnSvNyzCchRgJUwVaiDkAb8zCSx8wPUvBI/qv3mawCCVngtrRt2a60
 6TwkbCrDoX8YsAkJlh7Gu3Elb3PDIYZMxhNcsZ4vVmts08WxMb+/gCs/K4lA55utbGfFWEY61wE
 k9Iz+4zZNZlXX7rpT+A==
X-Proofpoint-GUID: lVGoRlatxlminZugldxlUcb8CaEOyBN4
X-Proofpoint-ORIG-GUID: lVGoRlatxlminZugldxlUcb8CaEOyBN4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX6VUnmS+wRCd4
 wXS8+GVBd3tJLKd6jT5FQxoWn6pbFAijYsTfzNMxz3FKw3Shy1pAia5UHNiHJrdewhv0C5QoFHy
 ixKDI2VJ1GwGz+fqwFo8ger8ahjAaDk=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b081b38 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4WvWY9BfOHavVd4mqZkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> The Arduino UNO Q (QRB2210) can boot an open firmware chain: TF-A and
> OP-TEE in place of QTEE, no hypervisor, so Linux runs at EL2. These
> three patches are the DT side that this chain needs and that does not
> belong in the base board file.
> 
> - Patch 1 names the GENI QUP firmware, so geni-se loads it when the
>   boot firmware has not. Where the engines are already programmed, as
>   with QTEE, the drivers do not read the property.
> - Patch 2 adds agatti-el2.dtso, following the existing -el2 overlays:
>   zap shader off, SMMU stream for the ADSP remoteproc.
> - Patch 3 adds the WLAN firmware's SMMU stream to the overlay, as
>   kodiak-el2.dtso has it.
> 
> Loading the QUP firmware on this SoC also needs the geni-se fix in [1].
> 
> Tested on the Arduino UNO Q with TF-A + OP-TEE, Linux at EL2: I2C, SPI
> and the Bluetooth UART probe, the GPU renders without a zap shader, the
> ADSP starts over PAS with no SMMU faults, and WiFi associates.
> 
> Patch 1 was also booted on the stock QTEE + Gunyah chain, with and
> without the property: the same serial engines probe and the same I2C
> devices answer in both cases.
> 
> dtbs_check (qrb2210-arduino-imola, qrb2210-arduino-imola-el2,
> qrb2210-rb1) is clean.
> 
> [1] https://lore.kernel.org/r/20261114-geni-minicore-v1-1-a825dd549664@oss.qualcomm.com
> 
> ---
> Igor Opaniuk (3):
>       arm64: dts: qcom: qrb2210-arduino-imola: name the QUP firmware
>       arm64: dts: qcom: agatti: add an EL2 overlay
>       arm64: dts: qcom: agatti-el2: map the WLAN firmware's SMMU stream

Don't fix the previous patch, squash 2 and 3 together

Konrad
