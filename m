Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379357;
	b=NEHiRhV6uwhkwg5+HQFYZCNg24tOQW/xvtju5aSXzvUewiLEf/Yiuj2b4t5HQeNUMStx
	 6dVMw29YEdYBOKrPtTGhtNS2N6b5qiO280gB5MEVFrBclEU/zJBetPoGaBb8tW+dpQrre
	 FjKgepXDPRdJfBzvaM8gLT3bhhhO0UbifsabDkt2Z+mX3hjGdgIPA5OGwwu7nmc+mQbkZ
	 K/plRwxM4mjmwScOm4sXKrzomKNOT/qyAd9kvSWy+B0FvkTlxKkYWA7AvrGQkV6yxGBQi
	 tPCKez2JhwBFSf473RMqyruynfXhLNzGWx0zBad2rclkQsGf1l+hHdA6fZ1VqvRsy8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
	b=vskoiTg2aqmNtmgaP+ud0bQwwQ53IododpwUN2giT723yopiEwS0ekUwjSKJxaBeI8j3
	 WyvkSsvFU8vof52iVNjMQ1alqrnd9cN4qtum+UqktwSYH1esWYV1kU+pVmlxhgEO/YeSq
	 y19Nwz0y9MAtDRdo6ynqI/fKz1wZrsvptuOUinWCnydK2I8cI12stoMkd83eaNyD0AZrZ
	 p+GUr9537Zhv2ELSYbtODjvg0uN+3cGwAEyB1pr+8KDNOSBXv1NSmCcnSB/osEhWpSHJr
	 ih86GQfbQ+r57GxJh8x5znMgMbFo34/gZ4xCmYRVyf8+SIqCbDrEv+94FYRDcoEZJRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcKpA1QB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUwJzgz2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94866606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94866606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pcKpA1QB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VUwJzgz2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERGdC2495218
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=; b=pcKpA1QBUxKqAvAF
	4lK/xm6iCV9fsyY7HjvxQF79U27otjHQSDOsk8I6TBHx1rzXcSG6P6Sk1o3dVMv6
	iwS/xrcqK4vAylsQhKPjBB8PtH1Oi2T3Rco69SOIUBrDxgrPfgOnvcfnIfI7nQq7
	GGUcOA0EeKPoFs9gFW+t7pvkgPjK60RuQ3en/uoLj4biuV2wM4qcptDvFsaIkFGU
	cFb79XfkkHmVJ2M70Gvo68H3Vnm2kOf85EnQx9bbj3xz3d/jYIMUxr/380L9ZHgK
	e8pg8KHvQvVK4xkCIagbk73vhl/qq5Hz1YNu0ZvMii0ep9L3WdtuJxjKeNsBYsud
	NZGOhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p44tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 16:55:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so10331765ad.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793379354; x=1793984154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
        b=VUwJzgz2U8V9XOm4OUCG4W1Vr8jg0ULn4wyI4l7bmpqINQH0rKREEvMArV5gjRVziv
         LuLcQOQMmgPyhkLIKB+AkP1DCSwMIkI8MK0jRtNTvYPsJK9XWW2JQfnJKD6Sasck5iZD
         8H9VCqNNeEYFmpYZzLAFVAY2FtnZympio7pzrPIlFJKMmpQKoEPYsXdoVRYgkW/lB4Ej
         vDZJd2zvEpESjf5Kravzsw6sImea7NLDCwLRra5Wx+XUO9u/Py2AGSBd9BZ3f9vQQj90
         J+Bco3znVkORM6zGk6xp2nKKRRXUgqqlQ88u5v4fNMSX2hrtGz9edx3ZRb6VgYQfNQbT
         0+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379354; x=1793984154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExZHM9hPcqVst3NbQ2hdGZ4vWGi1/65DTEs1IfXZWwo=;
        b=cbEiapt2lkosB6F2r08xvbzSMR4FwM8CAIgOebeGF+T3yc9frJE9sa3ti7cTNpuZj8
         3Q6J4fZSOdRhxK9WRuf+qQld357eFpmum14B+GvBqH/+q+zkCV0mMhJ/BNjoFp2PORpE
         g8lhf7H535Z4hILVqHFOWLjd4Na3cjbsbosFSjZPJhdvtRwMpr8DMcbkRo7m00iUbfCr
         ExeExYctrneaPJ8CP0EhHK7ZSOnsJvEizyceVaSeh1GaH1EwpAupF1F1PJIHe5hddACF
         topEH4e44FlkTeT3Y7dZy/bMqeGAi3JWUtxkXXWR/eF0GHrGeAQ7kM02HRhyFaJSYVA6
         lELg==
X-Forwarded-Encrypted: i=1; AKwUvByaF1N9MqtX/CGVCMkOYc/ECc5xpDXL+wRNwQZ8GlRU3TsNx/lXAEfMCB4GxqEjuA4j0B54CyBKWk7m@vger.kernel.org
X-Gm-Message-State: AFq9FYIiW9xALMMP4riEbh0DCimjTbEIA6Sc3uVP7+glhBEcJ3kV4n6i
	uR0AuoRZEhRL24/djL+umtJp6NPDH4muaBHYsqUxqg3FcdoCqRzT91sd/VdlyZUlA1IvtT17iuV
	6xo+b6n5KL0LeOW9RuVmBbRv+d7M3JXhZO3gKszu+rC15popA2F1zkBBLVfbkfNjf
X-Gm-Gg: AYBFou3P6epr6xEzSn8UQ1sqlqckinXIUvc2KB+ucJENj+ESZlG0MXEnMAF+9IPqMAH
	PtWzk02RRvJ1W9Rohdr3aqDo6IgK9ycAfqKRNMQ7b8h25Uj6ubTZ4T4yCZYJXFaaK8J6z0TjLeQ
	PclYYF/5EfdGbQPs4imOrmEAtdu5vbYyoU4qSi23JIvpoj3/662D8uwp+xFbZLEpGlCW5DjjSED
	pOsRC2RlO+UuVHEYrFnauDKByLCogprJ/gHA339ZVOJP9uVV5YzeWMVy+MoQjugGM1oC+45iww0
	mEXLVpQqqlkljdfVetPKPKyTCQS2bKy7D1Lq9iIpLypxHq2BKrWGM3IYzJ3zGp8LUOEoaxJgIPD
	KQWOWs/rG2MdadXX58+UQ1v+tYuigNsHjLHEVzSSw9Rgo2tnYEf39WijKOwQJgU9bnq/dA5guVQ
	y2
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr2511743a91.4.1793379354261;
        Fri, 30 Oct 2026 09:55:54 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:3ad:a270:a623 with SMTP id 98e67ed59e1d1-3ae8957452cmr2511714a91.4.1793379353761;
        Fri, 30 Oct 2026 09:55:53 -0700 (PDT)
Received: from [192.168.1.14] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096d3844sm1087439a12.11.2026.10.30.09.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:55:53 -0700 (PDT)
Message-ID: <8e78ac53-4dbe-4684-8f3f-00f841c60972@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:25:41 +0530
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
Subject: Re: [PATCH v23 10/15] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        rshankar@qti.qualcomm.com
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-10-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NyBTYWx0ZWRfX+hd8h9dOZNKj
 OPOXQbOk4/9yUf1Cya0gtZuZCJXY4z8ABzkx6k/SsmLo0+Uk87Lo7pmt7Y7iTuaLuCgg1vzf7qi
 6nJpgASJcNwHUjYuHiAaEpzXomZsR9HJr8qlaD+6Z4ddobKQJSjBXiqSusv+0PVMPXKnZQR9ST7
 cYAqQF7MI3tkNYj8kAtu1/7fBpYSsDAGZh2d5awhjMExGnhXOIrC8cx/xAQaHK0QEfwXht5c11Z
 0z5/7wo9j3BaI3uv3SU01yELrQ2BegDbj13PwCssSvcJ5AdDKv6D380YYeWggrvgB365sjzjukF
 u1sv8ZIy9aQsOe84tnBjVoquQRNmKTmU6H90c9COSjQ4rP8JbrZkKACVoSbqBBLVmQI/RfRP792
 rHT3OOfFLFJgUiOWjISQ/0TJ8pwGnBUgAlQUwkLXDby6Pp9vIqgTXPINkD55FigkPu3X1HqVhma
 06B6HyrIvWBJWZY3rPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NyBTYWx0ZWRfX2KxLAHb4EvX3
 d13Tpb5bpa+Or0eZu5WU/8q30Gb9dLb5Svf1Ba75dR4w7saFHBVhnmmdUxvQx0xGyy24GAY3d68
 0Y1Kz1cIBFsbmu2YhK5sIb5VLVnhIco=
X-Proofpoint-ORIG-GUID: gGP-LD2-vKSLeBZxb8ofw0eNCSPxkn5E
X-Proofpoint-GUID: gGP-LD2-vKSLeBZxb8ofw0eNCSPxkn5E
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4cc1b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WYfwUfNkXDalausCwDwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300067



On 28-10-2026 20:50, Hangxiang Ma wrote:
> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
> 
> In the Kaanapali camera subsystem, the front-end blocks are referred to
> as TFEs (Thin Front Ends). This driver continues to use the VFE naming
> in some places to preserve consistency with the existing code and avoid
> unnecessary renaming. Support is currently limited to three output lines,
> matching the constraints of the CAMSS framework.
> 
> Kaanapali requires REG_UPDATE and AUP_UPDATE to be issued only after all
> CSID configuration has completed. In addition, the number of AUP_UPDATE
> requests must match the number of buffers queued to the write master
> while it is being enabled.
> 
> Although real-time TFE traffic is routed through RT_CAMNOC, both
> camnoc_rt_axi and camnoc_nrt_axi clocks must be enabled. This ensures
> that the PDX_NOC, which sits downstream of both RT and NRT NOCs, exits
> reset in a fully idle state.
> 
> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Kaanapali MTP
-- 
Regards,
Nihal Kumar Gupta

