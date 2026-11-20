Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170077;
	b=X7yskVXZIcAL8pHNtNH7eAYqoDl9o+voGjJGp6G07qdSYzVXO4I5YkzIMjwQ6bXpOppE
	 5zyn6Z6cRiV9+yV1p19UfJzAy1AHbdrd/rD3D5nL/vv6SZbG2slIsyIlMnp/DDUGoLVry
	 fjw2ol9NnoG62+B120XusUKKwJqxtcykj35nv8RVWbWb0as+Ay8kuWNmHEf2J9YW5m6WQ
	 am6Rt4/kV95ZsBH9A3SlwHx9bfT8+YW02HI36refzQhu7PTxVLOxZdsFVQJKost6z5xuc
	 SElmjPivjj4eoI//ItDGanIexfZQCasLMs42k09IjBi6GceiHD8cEuJv2KNGkXzVmjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
	b=qdSOOZInHHsk8C48JUFeAcAlgVnWUVHaKRSYF1kDy9J+Z4pr3efgvmWqNu99MFCKINAO
	 8U5vAjzHnAZpGBPlnJGq0VHE2caO3nyJt5jiiooh72uncqG739qjN0McZrR/auQocKG//
	 VzJ/YCY/iG6uDVC1DHy7VCt5ZGBbaOfqDqCFXBJdY2DAN2uvwrO+M3cypa+0GdTcJnUz4
	 gBuw4+gymi29Fpa7ZUan9h8bxtagCKxSQ6fm3QJ2qPmhnf21jPmC07DghIqO7sMYCMOPq
	 +RMUgL3JdMx6gZFRSe6WKc1+c5kZRZxbGjcMUp68jiQDeVwT6arHUsObO52KgLVa/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63A7606A325
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E63A7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9AilE849345
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n6xNjiXLI4ldZMgm9vuyivlF
	eIPVFifPb1EDl7UJecI=; b=CiQQmnZPTzu9L41uX++xGZzjLXHOfK8Pbf6a9gvv
	1b3ZmL84IQyGNMUUyQXpRlOPbv7v23GfD3cD4qderzPHqcNp0Sc/RelCW7K0YnFX
	/qBmQ19QNwi50g8JyAhmj4ClBHBEIfm2trb5SjhaSsUNBbjYrMHa1AY8TIuAAnM5
	dGgwM3Iqw4Wul05TOvDuZvhfKvgPydFUmoi4yje0wedMFLLGtlkH/UpG3rOu/kNA
	qSS57tfItpUDX1QVfovE3k692uv15pkjeWBQ5R8C0Eb8t3Jpk2ENdS37v8opHbTP
	5BuRybzmncizaSw8fbTOiIO6biDIp4A8WMvpC9+Bs3Wupg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyk5tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:21:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213e04641dso1680286d6.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170075; x=1795774875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=NFgi5Vhsn4vUb/dJrGBKsAI3iD6JYIgFx6PlTkCMFzalQnnNOBBws3Tt49vqVsO5uJ
         nuIGID8R+E8jWn5uqdILU4PsoLD4aGeJwqza5txtBrIFLzJRR9M74vfx5TvqodL3Jecj
         iB9SSLFMi36yt9yfyIgUVD5jddTPnfXcUNAEnsAcj3m//rh0ghlGbGRFLgZyRwX3f3al
         SwRgGD69gl0PSsvDmH2Z+BzB991hQBtpYLPhkJg+grUSSdc2QpxOQgto1/exSveWfuKR
         uSyIHHCEUJpVrl4MnDCywRouZUdekQkzz8L36KrEa6eFiK1hTZQmQpu0Uak0YwG+BPnw
         p1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170075; x=1795774875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=Thh7z2DRIid3qniw9SWuTqbw3yItBz/DI00AvNaKdPpZhUgrMYhm2ymxhR3Nkp7Osu
         trKDdQwJ+QMqVRdqjRTFipQn4IPUil56n2qW0yMcRroeUrKYoLxLhatbYxB+2ty5P095
         uKi9fdAtSrOIFUoXm9BaOyY7vU4r1KdwBRODLXr0gC9UFKa10W7Y1bJ0NfGX/I4Sn3WF
         UR8G954GyG3P9Auat3l4zkKHMo/c2gEKyw9IvnPIFtHraQ5Tq0ap61xUFH/hMtz2N4iq
         IabvQHmsCyKtfYdMIvx/zv71TV3f81qNEYizRKBCaXM6A2Exvpt4kGPAfh7D2ANPs+UK
         2ZYQ==
X-Forwarded-Encrypted: i=1; AL+hErFz86VP7HMyRqsItR9qDdpnKxQ/X9jrTGwayCS9DuwSaaM1cUmhanYOZEU/RWgt2wqq2g3jGR14A7ya@vger.kernel.org
X-Gm-Message-State: APuU4Z+LJrHRKf9wuZsIPm2wbeQiG5Jq7FQI4N/gmFASTrB7HFb217g9
	3/aPi596Y/zkmL041EOSfdP56s48pmM03YTUC8ti6uDaLXZZxAZmKzg6W3ihWyX9UDA6h4bK6LZ
	t8NzqLbnpo4ZLygRsza8poQhFpP0CgipVULjA/Gh0jmCpiJ5DbL+N5cCB1qGpYF1P
X-Gm-Gg: AYBFou3B6ARkSVZbak26k7UxfeMF1MpR9sN5KmXg7v/3ZiH3bwC4eGTRbQ5Mn9zFxpW
	mjfoebKJizTI2EnopxbkY5VPljxyv6T60ygD13vzHhPixF06dXAmeQ5SPbI2a+/bGdH+2sOCTW3
	yvAxdwMKi37l5V1Ft8xCi2/hjWTJQs6MuLzlFi428NTWcmhbBD4UdO3lW9Wu+QpLHQShh8IDkbP
	VZucJxinEpjr1ES23pCSIIiB3aDunLXEF6VTXJmXA+xYIcTI2LhPndX5dSQs1fsNLntrHwqsDNE
	87MB9hoIyyfZQ3RIj190NXIYxqXN0Z703VPvohSGzDaOzlfvToPWf1vvLGvUnsZc+fEFZOzxQ+6
	lmjPHEkp0/R8g2UbseURoaFdw0rad4HcwjPLfr3NtRXRCadXoZUmaJ9ndTwuomC8u
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406231085a.63.1795170074893;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406225985a.63.1795170074176;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm29150615e9.1.2026.11.20.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:21:13 -0800 (PST)
Date: Fri, 20 Nov 2026 12:21:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
Message-ID: <m77xx44vjdg7e5myewy63j6nhdkgqnvvdyhqnohmylnbputjwm@2ymesyhjurov>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXwe8ji26fbeiZ
 GKB5WT9DvMdVPzQiIz8JedbeT5woP4W2VvkREWlVcLrpdcg1GhV+leDh9ZOzrpG41BWn9oIyX/U
 N/7FufPuEh8/L8evIqQhZ5jiXJvXjYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX1yVxtDCNg3qP
 IAga+OtdY7Ozo9qUFTav7p2BfCbYcQSFzPDdOtwObLJSJiDInSnUpWF1DLNVvylnwJvpvRcCzJp
 xUE+PyS0qKKQpDSvCXE4hLx3kQ0cF+oc9DQGTnI8Uu5YC5PoJthtYoUkVn4aSNpK/A33zN+MC3z
 rItNnqGvkez9xOmxsZ/pfwv9LnFdDQhrzKbYGe1KVYgvQsEUaTZ4wjsFdIAHu+epGJpOZtL02J2
 uHlwgKIbAq1CUxtVFy4ocbSMbaJn2MlHrZm9c1HwDqQsxCOCgqx47LWD4KzcbQVUMDN4qT11iV2
 vug09ois97ndk71WYzKbrtrwRYFqzSIIS+T/3DYqRJorYxBAtD+XgpXNmhhcaPe+HSVNkFLIOxh
 IYDoJ3aQDX1unmzu9R9YmIwO7AkI5rCH+PBwUOecaY5mLIvAmhK8hUhmPleeP5hQ+qhwsf+L9Nl
 tD+90IpgnL/T1nCqfRA==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b001f1b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=B4M9V4KaqHGFCjQwF8YA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 1jpBQfZgoFvJAQJznwh93vawwYSJy7kA
X-Proofpoint-GUID: 1jpBQfZgoFvJAQJznwh93vawwYSJy7kA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200041

On 26-11-16 02:19:51, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
> the integrated EPHY.
> 
> Note that the CMN PLL output clock names are reversed with respect to the
> hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
> hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
> Documentation is added in the DTS file to call this out and avoid
> confusion.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
