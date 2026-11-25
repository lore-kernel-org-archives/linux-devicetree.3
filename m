Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603821;
	b=fjtCVtrrvvTuiO8bWOkI51XTUrDIZZx2qrTyRYSpBE40A4syPCcpFbIdz7CwEdzMKMak
	 gzhP6YkzRt/XsD1aADWBZndMPNGM1vUiFGu4CSdM0/ZL64jryl7rwkm06W34VWnrvzY7t
	 cLzJnhkqM9xxkSEQQQQRPuANLukseqHwbKg0UhSlMlycQJM45J8M3F6mVGd89B0pzM+/J
	 NqBHqppTI1cPGaIUig0ibdvwTr5AhSZtNS8VFTRDWV55zxSVrOEr1FarO8+rFs8KQU5Uw
	 /mvm0S2fk+87j3htgAnGhJDOIj4QPIV2XdTnVy1ZXfIyiPLDAnOT4LQ82KzG4Yux1+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
	b=28FMgu9vPuutRFLcNE5FkQqd0qtwbCDfG/bJaT6iu4AaSsODr2JmxGU42BHrPKpii3Lc
	 Jf3OI25dpu4o3KmndqZNeE3C2S/FPDxYpJdnyz23HTU+TBirNk5uCZ88OQFuCux3bEVta
	 rq9OitfxFhpp8l5K4Jm8JNH4nvtS04jkoW+qZ3v21yTiycf+CKC5Ayi649xwEJ6n4DJbE
	 1A6/L8oWCNJDX0TyLetvaY2gQzYSmPhwO6gSDt8kCOzWv92ai5gRYYuss2JaNrrLbWJYc
	 ZaU49o0nEI8r9JTEtqeUqKSSQHtG60qf1PXD6/9srNUYClBKQ1Mz0rcabUpryhlW7bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebZCQ2lp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTpfwP+D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55B606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB55B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebZCQ2lp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NTpfwP+D
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mi2J3642179
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=; b=ebZCQ2lplJzbE/FT
	B07RgrpEEfdgeCzfUMTGYui0apgiyHgiYuTjn+sXx7Dic/V9fb5CLUmucvQAQ4SX
	Nwi8ky52KvNixGTIamDXDJ5NRyKB2xyZYolp1Cc1yeUB8zRd2sMzu1PKwdo/Mmda
	5dTq71cYDL2SZNcTKNUAnTRH8pVSyDlgxL04tHywoAiOPEfHDEARka+PCs8Rs0lR
	EfP1J48xreU8zC74A8QNR4fU5y0I0pvRm12hzG01V7iwzSFNjukJIm/2PcCGiw7q
	Y6aL1sz3lFyS5mDyqpcxZ0fkLI0sl6JrE+k62dPmvQC6tCGxg5gZ3bwFGUi2aOIm
	V2WYoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2aeta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:50:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d3ad11f50so7566091cf.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603819; x=1796208619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
        b=NTpfwP+DTs0KmDBr9zVz1d3hF/dyvToLBayX4veQroxPvQtm722TwJcXc39pP7LeTx
         QGwau/pO7RtaSDsdvoy2VqYfob7gYo97exvMh9X4svSm4tLLV3yL+34wFA9mgCE+6ohU
         Yb0l/tFLCuw2TLT8pEIRAOGjwZLXPgUk5yy4s1U+qJL8ZDd55K6Paboio7Br3mfWEYm8
         ZZj3uJw84HHr7I14pYyiauh5kzvlswINH9O0m5R3GlrO1NvslTtgMVoBGJQo+RsGLKh3
         RLZp5u+Hz0jrVPrdc+9mCpQhgch/08QvduplKK16wYvORvIhaSpraAjyxJ4WxIiG5f1N
         B//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603819; x=1796208619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OiAsjt3YYNCcqsogzXutVsvjLsrVcRbH4FRI9PAlqx4=;
        b=L6ildNRpRMYZCt/Ytc7QO8k4AuQ5g2S4mo6H2fYIj17UG1jmPrgvSvQH5x7q2Fap4q
         M+za+Y7yoi6CwroJqb9W/YU0gN25QpwZjbp2ChjJ4LYWZ7W8kG4r8kb3FOlH9nfuip7k
         J2poS9hTwoj2ggn4oJG7Gu6by4/6c6hOHrwlCW2IoWoyEEF8gzJLFWB9PIKqCcGk99ip
         mJm0/SayqKxdh/nI9QmIVWdaMkLgt9ilcdUoE/DsXqMuZFaaZRncB/1NORJgferCgulr
         VsQa2cYtgiZ+T/20Uuj0yYlc9nAtH9VRJxkOy1A+Bxd+z0DVAxwFtYLw7WMM7FMFXnU0
         L84A==
X-Forwarded-Encrypted: i=1; AL+hErEvSbYMic+s4dnfJ8EsYGoK2gtn0vSs+I15UxXGRjfPGDSz/Jb8hg09tyHxrQ1Wh41yDeNO07iWxgeW@vger.kernel.org
X-Gm-Message-State: APuU4Z+jugZ1oeeZ/HKVywNlkcl/ffZOKjzoGIEoLDDaGNLhlBWOWG/W
	CUirxJr1n/coQ1n49413x5bHwURB82FrSc+LCuePoCr12XKQ7yZjs/0/6kSsk/JnkxlvCo+ZAZ9
	0BzG4cCIeWDbbcjCnL3f+kiG2pBFliDvhk7KmAMncbmMzAH+t9f47FIUJBJV8Fs6C
X-Gm-Gg: AZFdTZfe12xiqWq4IybF5lvZdf92MPZxTmXl/UScaMVhKLSzgcOOjbkLhZqDayh9tlu
	qYgwGn83v0a58XvYKxdo+6KB1ZPmJjQ0uxZk+04+k7WIwTCyX60if/bVP8XtXkm5qIVmisHqaMF
	YJYoH5V4m0uMr1KESKkDabeaiRxk+DLzeJ8LX+ac8RSYEmIhYj0ykGG6MWQ6mJ8Pv4RGWlx2ghK
	8nEeolURDNL7mhWBidrQWuHezPCORUqvcRC/1UT5SG6myrioxoYjuejuY6BGlmfyoNv5auNXuuk
	4hU7pF0Ousk3nNTkM6G/grGv75H6CAW6b/arnVsk43U1SGKueOyHIAujexypzcgug/gv7WGCoa1
	KG3l2Al+QLWnF1Kov1Oq+gxw67+Q2rfP7mSshaEWnEzi3Qw1xhG7H7X9Q5P4Do9DQkEHebQQ=
X-Received: by 2002:a05:6214:5348:b0:921:2319:36bc with SMTP id 6a1803df08f44-921349bac89mr369725216d6.2.1795603819257;
        Wed, 25 Nov 2026 02:50:19 -0800 (PST)
X-Received: by 2002:a05:6214:5348:b0:921:2319:36bc with SMTP id 6a1803df08f44-921349bac89mr369724756d6.2.1795603818795;
        Wed, 25 Nov 2026 02:50:18 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:18 -0800 (PST)
Message-ID: <7246e6c1-544f-4b6b-9eb2-26b0b42f5b65@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:15 +0100
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
Subject: Re: [PATCH 02/11] pinctrl: qcom: sm6115: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-2-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06bd6b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TBji9Qi9O8DpM7T6nEUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: D3vHpie_kEgM4v4zGQyPVq5VbfDPtupC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXy6tPEA4aYGRe
 FzGnLiZcRx+2ubEHjidP+iUeuaIcywIyBf01LUnt9thVYu4Y0cNyr8Ue5++5nXrd4OGvBzVcP2I
 GOofCi9WdwwP2dJTfA7+bKjtdg/ZUbky+s2zU59nQJtkkjyY++oYgbjIqMl+JoEiFDwPO8zI9KH
 Sv4XY7G6qogujyJACFOztWNMyTIy/BSx7lCVwmgEVSuWrkqgzkeVWSD/uP+w1rb9M0rxIkwp2l4
 6QqtJV7aOgrcN8q3coBKsSSZVmCrY6N8YQ9Ex07y4WFWSiDQGkOqmbEsMZlXOIPH1CCOtXBHz4X
 QM2UdgtYAODBF6WqMd37yHpie/5IsybMjIg4kPI6pUNIxD3EpMlty3anY5LODemsuoAPDqC1IgG
 hZBOY9KAi+lJhLV8HvHup8U+/fxU37krvfTe9d/gBNEQ6T+S9E2D1ke64+xGwVcei7GrXPrbH8d
 OboGVKxSGbkKEcZHo/Q==
X-Proofpoint-ORIG-GUID: D3vHpie_kEgM4v4zGQyPVq5VbfDPtupC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXxRKvwoa7AokM
 KnRz1LPBwL9UovtDxRaZYjCvMKsWRlif9orokPxklNezjtNn5TRXkVgfdFHU+kAJN9wCMf1ndO7
 v/pg367G5VLWIKgmZo7Af2ziWthirc8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the sm6115 driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 0524a508b2cf ("pinctrl: qcom: sm6115: Add egpio support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
